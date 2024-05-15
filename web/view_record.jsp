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
            <div class="row m-5">
                <h1 class="p-5">View Student Record</h1>
                <div class="col-10 mx-auto">
                    <table class="table table-striped" >
                        <tr>
                            <th>Sl No</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Password</th>
                            <th>Action</th>
                        </tr>

                        <%

                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_db", "root", "subham");

                            String query = "select * from students";
                            Statement st = con.createStatement();

                            rs = st.executeQuery(query);

                            while (rs.next()) {
                                String id = rs.getString("id");
                        %>
                        <tr> 
                            <td> <%= rs.getString("id")%> </td>
                            <td><%= rs.getString("name")%></td>
                            <td><%= rs.getString("address")%></td>
                            <td><%= rs.getString("email")%></td>
                            <td><%= rs.getString("phone")%></td>
                            <td><%= rs.getString("pass")%></td>
                            <td>
                                <a href="update_record.jsp?id=<%=rs.getString("id")%>" class="btn btn-success">Edit</a>
                                <a href="delete_record.jsp?id=<%=rs.getString("id")%>" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>

            <!-- content start here-->


            <!-- footer start here-->

            <%@include file="include/footer.jsp" %>
            <!-- footer end here-->

        </div>
    </body>
</html>
