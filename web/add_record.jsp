<%-- 
    Document   : index
    Created on : 9 Feb, 2023, 11:04:26 AM
    Author     : darun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <body>
        <div class="container">
            <!-- Header start here -->
             <%@include file="include/header.jsp" %>
            <!--Header end here-->

            <!-- content start here-->

            <div class="row">
                <h1 class="p-3">Add Student Record:</h1>
                <div class="col-7 mx-auto m-5 p-5"  style="box-shadow: 2px 2px 2px 2px #6c757d; border-radius:5px">
                    <form method="POST" action="data_process.jsp">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Ener name...">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Ener Email...">
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="Ener phone...">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Ener password...">
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <textarea class="form-control" name="address" id="address" rows="3"></textarea>
                    </div> 
                    <div class="mb-3">
                        <input type="submit" name="submit" class="btn btn-primary btn-lg" value="Save">
                         <input type="reset" class="btn btn-secondary btn-lg" value="Reset">
                    </div> 
                    </form>
                </div>
            </div>

            <!-- content start here-->


            <!-- footer start here-->

             <%@include file="include/footer.jsp" %>
            <!-- footer end here-->

        </div>
    </body>
</html>
