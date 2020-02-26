import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer user_id = Integer.parseInt(request.getParameter("user_id"));
        DBoperations oper = new DBoperations();

        Student s = new Student();
        s.setId(user_id);

            Boolean success = oper.delete(s);

            if (success){
                response.sendRedirect("Delete_Jsp.jsp");
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
                rd.forward(request, response);
            }


    }
}
