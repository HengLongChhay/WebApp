import DB.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer user_id = Integer.parseInt(request.getParameter("user_id"));
        DatabaseOperation oper = new DatabaseOperation();

        Student s = new Student();
        s.setId(user_id);
        Boolean success = oper.delete(s);

        if (success){
            response.sendRedirect("ViewAllServlet");
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
            rd.forward(request, response);
        }
    }
}
