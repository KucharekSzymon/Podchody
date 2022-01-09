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
    <title>New Question</title>
    <link rel="stylesheet" href="login.css">
    <%
        Integer wPoint_ID  = null;

        String tName  = "";
        Integer Treshhold = 0;

        String Test_ID = request.getParameter("Id");


        if(request.getParameter("Id") != ""){
            String wquery = "SELECT * FROM Test WHERE Test_ID = ?";
            PreparedStatement wps = con.prepareStatement(wquery);
            wps.setString(1,request.getParameter("Id"));
            ResultSet wrs = wps.executeQuery();
            if(wrs.next()) {
                tName = wrs.getString("Name");
                Treshhold = wrs.getInt("Treshhold");
                wPoint_ID = wrs.getInt("Point_ID");


            }
        }
    %>
</head>
<body>
<div class="container">
    <div class="card card-container">
        <h2>Tests</h2>

        <% if(tName != ""){ %>
        <form class="form-signin" action="/Podchody/updateTest" method="post">
            <input style="display: none" name="Test_ID" value="<%=Test_ID%>">
                <% }else{ %>
            <form class="form-signin" action="/Podchody/newTest" method="post">
                <%}%>
                <div class="form-group">
                    <label for="Point_ID">Choose point:</label>
                    <select class="form-control" name="Point_ID" id="Point_ID">
                        <option selected  value="NULL" disabled>Point name</option>
                        <%
                            String query  = "SELECT * FROM Points";
                            PreparedStatement ps = con.prepareStatement(query);
                            ResultSet rs = ps.executeQuery();

                            while (rs.next()){
                                Integer Point_ID  = rs.getInt("Point_ID");
                                String Name  = rs.getString("Name");

                        %>
                        <option <% if(wPoint_ID == Point_ID) out.write("selected"); %> value="<%=Point_ID%>"><%=Name%></option>
                        <%}%>
                    </select>

                    <label for="Name">Name:</label>
                    <input id="Name" type="text" class="form-control" value="<%=tName%>" name="Name" placeholder="Test name" required autofocus>

                    <label for="Treshhold">Treshhold:</label><br>
                    <input type="number" name="Treshhold" value="<%=Treshhold%>" id="Treshhold" min="1" max="100">
                    <br>

                    <% if(tName != ""){ %>
                    <br><button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Change test</button>
                    <% }else{ %>
                    <br><button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Add test</button>
                    <%}%>
                </div>
            </form>
    </div>
</div>
</body>
</html>
