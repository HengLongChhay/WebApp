import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "InsertServlet")
public class InsertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer user_id = Integer.parseInt(request.getParameter("user_id"));
        String username = request.getParameter("username");
        String user_email = request.getParameter("user_email");

        Student s = new Student();
        s.setId(user_id);
        s.setName(username);
        s.setEmail(user_email);

        DBoperations oper = new DBoperations();
            Boolean success = oper.insert(user_id, s);

            if (success){
                response.sendRedirect("Insert_Jsp.jsp");
            }
            else{
                RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
                rd.forward(request, response);

            }

    }


}
