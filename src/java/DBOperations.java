import java.sql.*;
import java.util.ArrayList;

public class DBoperations {
    Connection con =null;
    public Connection getCon() throws ClassNotFoundException, SQLException {
        if (con == null) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kit", "root", "");
            Statement statement = con.createStatement();
        }
        return con;

    }
    public Student view()  {
        Student s = new Student();
        try {
            con = getCon();
            PreparedStatement ps = con.prepareStatement("select * from student where id  = ?");

            ResultSet rs = ps.executeQuery();
            rs.next();
            s.setId(rs.getInt(1));
            s.setName(rs.getString(2));
            s.setEmail(rs.getString(3));

        } catch (Exception e) {
            return null;
        }
        return s;
    }

    public Boolean insert(Integer user_id, Student s){
        try {
            con = getCon();
            PreparedStatement ps = con.prepareStatement("insert into student value (?,?,?)");
            ps.setInt(1, s.getId());
            ps.setString(2, s.getName());
            ps.setString(3, s.getEmail());

            ps.execute();
        } catch (Exception e) {
            return false;
        }
        return true;

    }

    public Boolean delete(Student s){
        try {
            con = getCon();
            PreparedStatement ps = con.prepareStatement("delete from student where id = ?");
            ps.setInt(1, s.getId());

            ps.execute();
        } catch (Exception e) {
            return false;
        }
        return true;
    }
    public Boolean update(Integer user_id, Student s) {
        try {
            con = getCon();
            PreparedStatement ps = con.prepareStatement("insert into student value (?,?,?) where id = ?");
            ps.setInt(1, s.getId());
            ps.setString(2, s.getName());
            ps.setString(3, s.getEmail());
            ps.setInt(4, user_id);

            ps.execute();
        } catch (Exception e) {
            return null;
        }
        return true;
    }
    public ArrayList viewAll()  {
        ArrayList<Student> arr = new ArrayList<>();
        try {
            con = getCon();
            PreparedStatement ps = con.prepareStatement("select * from student");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Student s = new Student();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));
                s.setEmail(rs.getString(2));
                arr.add(s);
            }
        } catch (Exception e) {
            return null;
        }
        return arr;
    }
}
