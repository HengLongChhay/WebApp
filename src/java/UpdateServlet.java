import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer user_id = Integer.parseInt(request.getParameter("user_id"));
        Integer new_id = Integer.parseInt(request.getParameter("new_id"));
        String new_username = request.getParameter("new_username");
        String new_email = request.getParameter("new_email");

        Student s = new Student();
        s.setId(new_id);
        s.setName(new_username);
        s.setEmail(new_email);

        DBoperations oper = new DBoperations();

            Boolean success = oper.update(user_id, s);
            if (success) {
                response.sendRedirect("Update_Jsp.jsp");
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
                rd.forward(request, response);
            }

    }


}

