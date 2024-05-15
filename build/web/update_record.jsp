<%-- 
    Document   : index
    Created on : 9 Feb, 2023, 11:04:26 AM
    Author     : darun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    if (request.getParameter("submit") != null) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");

        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_db", "root", "subham");
        pst = con.prepareStatement("update students set name = ?, address =?, email= ?, phone=?, pass=? where id = ?");
        pst.setString(1, name);
        pst.setString(2, address);
        pst.setString(3, email);
        pst.setString(4, phone);
        pst.setString(5, pass);
        pst.setInt(6, id);
        pst.executeUpdate();
    

    String redirectURL = "view_record.jsp";
    response.sendRedirect(redirectURL);
    }
%>
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

            <%                Connection con1;
                PreparedStatement pst1;
                ResultSet rs1;

                Class.forName("com.mysql.cj.jdbc.Driver");
                con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_db", "root", "subham");

                Integer id1 = Integer.valueOf(request.getParameter("id"));

                pst1 = con1.prepareStatement("select * from students where id =?");
                pst1.setInt(1, id1);
                rs1 = pst1.executeQuery();

                while (rs1.next()) {

            %>
            <div class="row">
                <h1 class="p-3">Update Student Record:</h1>
                <div class="col-7 mx-auto m-5 p-5"  style="box-shadow: 2px 2px 2px 2px #6c757d; border-radius:5px">
                    <form method="POST" action="#">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" name="name" value="<%= rs1.getString("name")%>" id="name" placeholder="Ener name...">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" value="<%= rs1.getString("email")%>" id="email" placeholder="Ener Email...">
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="text" class="form-control" name="phone" id="phone" value="<%= rs1.getString("phone")%>" placeholder="Ener phone...">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" id="password" value="<%= rs1.getString("pass")%>" placeholder="Ener password...">
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <textarea class="form-control" name="address" id="address" rows="3"><%= rs1.getString("address")%></textarea>
                        </div> 
                        <div class="mb-3">
                            <input type="submit" name="submit" class="btn btn-primary btn-lg" value="Update Record">
                            <input type="reset" class="btn btn-secondary btn-lg" value="Reset">
                        </div> 
                    </form>
                </div>
                <% }%>
            </div>

            <!-- content start here-->


            <!-- footer start here-->

            <%@include file="include/footer.jsp" %>
            <!-- footer end here-->

        </div>
    </body>
</html>
