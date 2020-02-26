<%--
    Document   : index
    Created on : Feb 20, 2020, 2:40:47 PM
    Author     : sath_
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP Page</title>
</head>
<body>
<h1>Welcome User</h1>
<p>Please select the database operation option::</p>
<select id="option" onchange="changeElement()">
  <option value="none">Choose::</option>
  <option value="insert">Insert Record</option>
  <option value="update">Update Record</option>
  <option value="delete">Delete Record</option>
  <option value="viewOne">View Record</option>
  <option value="viewAll">View All Records</option>
</select>
<form>
  <div id="none">
  </div>
  <div id="insert">
      <strong>Insertion</strong> <br>
    <form action="" method="post">
        ID:<input type="text" name="user_id"> <br>
        Username:<input type="text" name="username"> <br>
        Email:<input type="email" name="user_email"><br>
        <input type="submit" value="Submit">
      </form>
  </div>
  <div id="update">
    <strong>Update</strong> <br>
    ID:<input type="text" name="user_id">
    <form action="" method="post">
      <input type="checkbox" name="new_id">New ID: <input type="text" name="new_id"><br>
      <input type="checkbox"  name="new_username">New Username: <input type="text" name="new_username"><br>
      <input type="checkbox" name="new_email">New Email: <input type="email" name="new_email"><br>
      <input type="submit" value="Submit">
    </form>
  </div>
  <div id="delete">
    <strong>Deletion</strong>
    <form action="" method="post">
      ID:<input type="text" name="user_id">
      <input type="submit" value="Delete">
    </form>
  </div>
  <div id="viewOne">
    <strong>Search User</strong>
    <form action="" method="post">
      ID:<input type="text" name="user_id">
      <input type="submit" value="Search">
    </form>
    <form>
      <table style="width:auto">
        <tr>
          <th>ID</th>
          <th>Username</th>
          <th>Email</th>
        </tr>
        <tr>
          <td>Jill</td>
          <td>Smith</td>
          <td>50</td>
        </tr>
      </table>
    </form>
  </div>
  <div id="viewAll">
    <form action="" method="">
      <input type="submit" value="Show Database">
    </form>
    <form>
      <table style="width:auto">
        <tr>
          <th>ID</th>
          <th>Username</th>
          <th>Email</th>
        </tr>
        <%
          try {
            String connectionURL = "jdbc:mysql://localhost:3306/Example_DB";
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "");
            if(!connection.isClosed())
              out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            connection.close();
          }catch(Exception ex){
            out.println("Unable to connect to database"+ex);
          }
        %>
      </table>
    </form>
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
