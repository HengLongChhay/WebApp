
import DB.Student;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "ViewAllServlet")
public class ViewAllServlet extends HttpServlet{
    
    private void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatabaseOperation operation = new DatabaseOperation();
        ArrayList<Student> Arr_Student = new ArrayList();
        String username = request.getParameter("username");
        if(username==null) username = "";
        Arr_Student = operation.viewAll(username);
        request.setAttribute("Arr_Student" , Arr_Student);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request,response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAll(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAll(request, response);
    }
}
