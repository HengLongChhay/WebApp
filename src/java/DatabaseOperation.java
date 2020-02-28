
import DB.Student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class DatabaseOperation {
    
    private Connection connection = null;
    private final String url = "jdbc:mysql://localhost:3306/kit?useSSL=false";
    private final String user = "root";
    private final String password = "admin";
    
    private Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            if(connection == null)
            connection = DriverManager.getConnection(url, user, password);
        }catch(SQLException | ClassNotFoundException exception){
            System.out.println("=====================================");
            System.out.println("Exception: " + exception.getMessage());
            System.out.println("=====================================");
//            System.exit(0);
        }
        return connection;
    }
    
    
    public boolean insert(Student student){
        try {
            PreparedStatement statement = getConnection().prepareStatement("insert into student(id,name, email) values(?, ?, ?)");
            statement.setInt(1, student.getId());
            statement.setString(2, student.getName());
            statement.setString(3, student.getEmail());
            statement.execute();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public boolean delete(Student student){
        try {
            PreparedStatement ps = getConnection().prepareStatement("delete from student where id = ?");
            ps.setInt(1, student.getId());
            ps.execute();
        } catch (Exception e) {
            return false;
        }
        return true;
    }
    
    public boolean update(int oldUserId,Student student){
        try {
            PreparedStatement ps = getConnection().prepareStatement("UPDATE student SET id= ?, name= ?, email= ? WHERE id = ?");
            ps.setInt(1, student.getId());
            ps.setString(2, student.getName());
            ps.setString(3, student.getEmail());
            ps.setInt(4, oldUserId);
            ps.executeUpdate();
//            Statement st = getConnection().createStatement();
//            String sql = String.format("update student set name='%s', email='%s' where id = '%d';", student.getName(), student.getEmail(), student.getId());
//            st.executeUpdate(sql);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
        return true;
    }
    
    public ArrayList<Student> viewAll(String name)  {
        ArrayList<Student> arr = new ArrayList<>();
        try {
            PreparedStatement statement = getConnection().prepareStatement("select * from student where name like ? ORDER BY `id` asc ");
            statement.setString(1, "%" + name + "%");
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                Student s = new Student();
                s.setId(resultSet.getInt(1));
                s.setName(resultSet.getString(2));
                s.setEmail(resultSet.getString(3));
                arr.add(s);
            }
        } catch (SQLException e) {
            System.out.println("===================");
            System.out.println("Exception" + e.getMessage());
            System.out.println("===================");
            return null;
        }
        return arr;
    }
    
    public boolean SignIn(String email, String password){
        try{
            PreparedStatement ps = getConnection().prepareStatement("select * from users where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }catch(SQLException e){
            return false;
        }
    }
}
