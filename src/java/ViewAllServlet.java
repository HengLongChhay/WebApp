import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ViewAllServlet")
public class ViewAllServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBoperations oper = new DBoperations();
            ArrayList Arr_Student = oper.viewAll();

            request.setAttribute("Arr_Student" , Arr_Student);
            RequestDispatcher rd = request.getRequestDispatcher("ViewAll_Jsp.jsp");

    }
}
