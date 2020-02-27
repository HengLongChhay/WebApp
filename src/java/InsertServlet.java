/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DB.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phans
 */
public class InsertServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userid = Integer.parseInt(request.getParameter("userid"));
        String username = request.getParameter("username");
        String user_email = request.getParameter("user_email");

        Student s = new Student();
        s.setId(userid);
        s.setName(username);
        s.setEmail(user_email);
        
        DatabaseOperation operation = new DatabaseOperation();
        if(operation.insert(s))
            response.sendRedirect("ViewAllServlet");
        else
            response.sendRedirect("Error.jsp");
        
        
    }


}
