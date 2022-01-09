<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.podchody.DatabaseConnection" %>
<%--
    Document   : index
    Created on : Jan 1, 2022, 12:21:46 PM
    Author     : skuch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    <%
        String queryn = "SELECT * from Podchody.Users";
        PreparedStatement psn = con.prepareStatement(queryn);
        ResultSet rsn = psn.executeQuery();

            while (rsn.next()){
            String User_ID = rsn.getString("User_ID");
    %>

    <%=User_ID%>
    <%}%>
    </body>
</html>
