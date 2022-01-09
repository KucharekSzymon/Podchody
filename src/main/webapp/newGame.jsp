<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Main-PC
  Date: 09.01.2022
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/head.jsp" %>
    <title>New Game</title>
    <link rel="stylesheet" href="login.css">
    <%

        String tName  = "";

        String Game_ID = request.getParameter("Id");


        if(request.getParameter("Id") != ""){
            String wquery = "SELECT * FROM Game WHERE Game_ID = ?";
            PreparedStatement wps = con.prepareStatement(wquery);
            wps.setString(1,request.getParameter("Id"));
            ResultSet wrs = wps.executeQuery();
            if(wrs.next()) {
                tName = wrs.getString("Name");


            }
        }
    %>
</head>
<body>
<div class="container">
    <div class="card card-container">
        <h2>Games</h2>

        <% if(tName != ""){ %>
        <form class="form-signin" action="/Podchody/updateGame" method="post">
            <input style="display: none" name="Game_ID" value="<%=Game_ID%>">
                <% }else{ %>
            <form class="form-signin" action="/Podchody/newGame" method="post">
                <%}%>
                <div class="form-group">

                    <label for="Name">Name:</label>
                    <input id="Name" type="text" class="form-control" value="<%=tName%>" name="Name" placeholder="Test name" required autofocus>


                    <% if(tName != ""){ %>
                    <br><button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Change game</button>
                    <% }else{ %>
                    <br><button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Add game</button>
                    <%}%>
                </div>
            </form>
    </div>
</div>
</body>
</html>
