<%-- 
    Document   : insert_data
    Created on : 08-Feb-2023, 20:25:58
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="javax.servlet.http.HttpServletResponse" %>

<% 
 
    try{
        
    
    if(request.getParameter("submit")!=null)
    {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone"); 
        String password = request.getParameter("password"); 
        String address = request.getParameter("address"); 
       
        
        Connection con;
        PreparedStatement pst;
         
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_db","root","subham");
        
        pst = con.prepareStatement("insert into students(name,address,email,phone,pass)values(?,?,?,?,?)");
        pst.setString(1, name);
        pst.setString(2, address);
        pst.setString(3, email);
        pst.setString(4, phone);
        pst.setString(5, password); 
         
        pst.executeUpdate();  
         
        %> 
    <script>   
        alert("Data Successfully Inserted ");
        
    </script> 
    <% 
         
    }
    }
    catch(Exception e)
    {
        out.print(e);
    }
        
   %>

<%
    String redirectURL = "add_record.jsp";
    response.sendRedirect(redirectURL);
%>
