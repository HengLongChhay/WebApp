import DB.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String user_email = request.getParameter("user_email");
        int user_id = Integer.parseInt(request.getParameter("userid"));
        int oldUserId = Integer.parseInt(request.getParameter("oldUserId"));
        Student s = new Student();
        s.setId(user_id);
        s.setName(username);
        s.setEmail(user_email);
        DatabaseOperation operation = new DatabaseOperation();
        if(operation.update(oldUserId,s)){
            System.out.println("ViewAll");
            response.sendRedirect("ViewAllServlet");
        }
        else
            response.sendRedirect("Error.jsp");
    }

}
