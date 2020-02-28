<%-- 
    Document   : index
    Created on : Feb 26, 2020, 7:40:35 PM
    Author     : phans
--%>
<%@page import="DB.Student"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/9e424dc4b1.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" type="image/png" href="logokit.png">
        <title>SRS</title>
        <style>
            html,body {
                height: 100%;
            }
            
            h1 { 
            color:green; 
        }
        </style>
    </head>
    <body class="bg-info">
        <div class="bg-white p-5 container my-5 rounded">
            <h1 class="text-center m-5">Student Registration System</h1>
            <form  action="ViewAllServlet" method="post">
                <div class="input-group mb-3">
                    <input name="username" type="text" class="form-control bg-light" placeholder="student name" aria-label="student name" aria-describedby="button-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-primary " type="submit" id="button-addon2">Search</button>
                    </div>
                </div>
            </form>
            <table class="table m-1">
                <thead>
                    <tr>
                        <th class="text-center" scope="col">#</th>
                        <th class="text-center" scope="col">Name</th>
                        <th class="text-center" scope="col">Email</th>
                        <th class="text-center" scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%! Student edit = new Student(); %>
                    <% 
                        ArrayList<Student> students = null;
                        students = (ArrayList<Student>)request.getAttribute("Arr_Student");
                    %>
                    <%
                        for (Student student : students ) {
                    %>
                    <tr>
                        <th class="text-center" scope="row"><%= student.getId()%></th>
                        <td class="text-center"><%= student.getName() %></td>
                        <td class="text-center"><%= student.getEmail()%></td>
                        <td class="text-center">
                            <form action="DeleteServlet" method="post">
                                <input hidden name="user_id" value="<%= student.getId()%>">
                                <button type="button" class="btn btn-primary" data-toggle="modal" onclick="passData(<%= student.getId()%>, '<%= student.getName() %>', '<%= student.getEmail()%>')" data-target="#editModal">Edit</button>
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                     </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="col-lg-12 p-3">
                <button class="btn-primary float-right btn-circle btn-lg" data-toggle="modal" data-target="#exampleModal">Add</button>
            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Add Student</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form action="InsertServlet" method="post">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="exampleInputPassword1">ID</label>
                                <input type="text" class="form-control" name="userid" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Name</label>
                                <input type="text" class="form-control" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" name="user_email" aria-describedby="emailHelp" required>
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                  </div>
                </div>
            </div>
                
            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Edit Student</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form action="UpdateServlet" method="post">
                        <div class="modal-body">
                            <input id="old_user_id" hidden type="text" class="form-control" name="oldUserId">
                            <div class="form-group">
                                <label for="exampleInputPassword1">ID</label>
                                <input id="userid" type="number" class="form-control" name="userid" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Name</label>
                                <input id="username" type="text" class="form-control" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" id="user_email" class="form-control" name="user_email" aria-describedby="emailHelp" required>
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                  </div>
                </div>
            </div>
        </div>
         
        <script>
            var id = "";
            var name = "";
            var email = "";
            function editModal(){
                document.getElementById("old_user_id").value = id;
                document.getElementById("userid").value = id;
                document.getElementById("username").value = name;
                document.getElementById("user_email").value = email;
            }
            
            function passData(id, name, email){
                this.id = id;
                this.name = name;
                this.email = email;
                editModal();
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
