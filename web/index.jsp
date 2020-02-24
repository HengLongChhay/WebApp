<%-- 
    Document   : index
    Created on : Feb 20, 2020, 2:40:47 PM
    Author     : sath_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <select id="option" onchange="changeElement()">
            <option value="none">Empty</option>
            <option value="insert">Insert Record</option>
            <option value="update">Update Record</option>
            <option value="delete">Delete Record</option>
            <option value="viewOne">View Record</option>
            <option value="viewAll">View All Records</option>
        </select>
            
        <form>
            <div id="none">
                <!--For home Page-->
                <p>Empty</p>
            </div>
            <div id="insert">
                <!--For Insert Record-->
                <p>Insert Record</p>
            </div>
            <div id="update">
                <!--For Update Record-->
                <p>Update Record</p>
            </div>
            <div id="delete">
                <!--For delete Record-->
                <p>Delete Record</p>
            </div>
            <div id="viewOne">
                <!--For View a Record-->
                <p>View a Record</p>
            </div>
            <div id="viewAll">
                <!--For View all record-->
                <p>View all Record</p>
            </div>
        </form>
        
        <script>
            changeElement();
            function changeElement(){
                document.getElementById("none").style.display = "none";
                document.getElementById("insert").style.display = "none";
                document.getElementById("update").style.display = "none";
                document.getElementById("delete").style.display = "none";
                document.getElementById("viewOne").style.display = "none";
                document.getElementById("viewAll").style.display = "none";
                
                var option = document.getElementById("option").value; 
                document.getElementById(option).style.display = "block";
            };         
        </script>
    </body>
</html>
