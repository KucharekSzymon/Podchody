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
    <title>New point</title>
    <link rel="stylesheet" href="login.css">
    <%
        Integer wGame_ID  = null;

        String tName  = "";
        Double Altitude = 0.0;
        Double Longitude = 0.0;

        String Point_ID = request.getParameter("Id");


        if(request.getParameter("Id") != ""){
            String wquery = "SELECT * FROM Points WHERE Point_ID = ?";
            PreparedStatement wps = con.prepareStatement(wquery);
            wps.setString(1,request.getParameter("Id"));
            ResultSet wrs = wps.executeQuery();
            if(wrs.next()) {
                tName = wrs.getString("Name");
                Altitude = wrs.getDouble("Altitude");
                Longitude = wrs.getDouble("Longitude");
                wGame_ID = wrs.getInt("Game_ID");


            }
        }
    %>
</head>
<body>
<div class="container">
    <div class="card card-container">
        <h2>Points</h2>

        <% if(tName != ""){ %>
        <form class="form-signin" action="/Podchody/updatePoint" method="post">
            <input style="display: none" name="Point_ID" value="<%=Point_ID%>">
                <% }else{ %>
            <form class="form-signin" action="/Podchody/newPoint" method="post">
                <%}%>
                <div class="form-group">
                    <label for="Game_ID">Choose game:</label>
                    <select class="form-control" name="Game_ID" id="Game_ID">
                        <option selected  value="NULL" disabled>Game name</option>
                        <%
                            String query  = "SELECT * FROM Game";
                            PreparedStatement ps = con.prepareStatement(query);
                            ResultSet rs = ps.executeQuery();

                            while (rs.next()){
                                Integer Game_ID  = rs.getInt("Game_ID");
                                String Name  = rs.getString("Name");

                        %>
                        <option <% if(wGame_ID == Game_ID) out.write("selected"); %> value="<%=Game_ID%>"><%=Name%></option>
                        <%}%>
                    </select>

                    <label for="Name">Name:</label>
                    <input id="Name" type="text" class="form-control" value="<%=tName%>" name="Name" placeholder="Test name" required autofocus>

                    <label for="Altitude">Altitude:</label>
                    <input id="Altitude" type="text" class="form-control" value="<%=Altitude%>" name="Altitude" placeholder="Test altitude" required autofocus>

                    <label for="Longitude">Longitude:</label>
                    <input id="Longitude" type="text" class="form-control" value="<%=Longitude%>" name="Longitude" placeholder="Test Longitude" required autofocus>

                    <% if(tName != ""){ %>
                    <br><button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Change point</button>
                    <% }else{ %>
                    <br><button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Add point</button>
                    <%}%>
                </div>
            </form>
    </div>
</div>
</body>
</html>
