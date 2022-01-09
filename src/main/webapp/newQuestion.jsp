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
        Integer wTest_ID  = null;
        String Question  = "";
        String Answer1  = "";
        String Answer2  = "";
        String Answer3  = "";
        String Answer4  = "";
        Integer Correct_Answer  = 1;
        String Question_ID = request.getParameter("Id");


        if(request.getParameter("Id") != ""){
            String wquery = "SELECT * FROM Questions WHERE Question_ID = ?";
            PreparedStatement wps = con.prepareStatement(wquery);
            wps.setString(1,request.getParameter("Id"));
            ResultSet wrs = wps.executeQuery();
            if(wrs.next()) {
                wTest_ID = wrs.getInt("Test_ID");
                Question = wrs.getString("Question");
                Answer1 = wrs.getString("Answer1");
                Answer2 = wrs.getString("Answer2");
                Answer3 = wrs.getString("Answer3");
                Answer4 = wrs.getString("Answer4");
                Correct_Answer = wrs.getInt("Correct_Answer");


            }
        }
    %>
</head>
<body>
<div class="container">
    <div class="card card-container">
        <h2>Questions</h2>

        <% if(Answer1 != ""){ %>
        <form class="form-signin" action="/Podchody/updateQuestion" method="post">
            <input style="display: none" name="Question_ID" value="<%=Question_ID%>">
        <% }else{ %>
        <form class="form-signin" action="/Podchody/newQuestion" method="post">
        <%}%>
            <div class="form-group">
                <label for="Test_ID">Choose test:</label>
                <select class="form-control" name="Test_ID" id="Test_ID">
                    <option selected  value="NULL" disabled>Test name</option>
                    <%
                        String query  = "SELECT * FROM Podchody.Test";
                        PreparedStatement ps = con.prepareStatement(query);
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()){
                            Integer Test_ID  = rs.getInt("Test_ID");
                            String Name  = rs.getString("Name");

                    %>
                    <option <% if(wTest_ID == Test_ID) out.write("selected"); %> value="<%=Test_ID%>"><%=Name%></option>
                    <%}%>
                </select>

            <label for="Question">Question:</label>
            <textarea id="Question" class="form-control" name="Question" rows="3"><%=Question%></textarea>

            <label for="Answer1">Answer 1:</label>
            <input id="Answer1" type="text" class="form-control" value="<%=Answer1%>" name="Answer1" placeholder="Answer a" required autofocus>

            <label for="Answer2">Answer 2:</label>
            <input id="Answer2" type="text" class="form-control" value="<%=Answer2%>" name="Answer2" placeholder="Answer b" required autofocus>

            <label for="Answer3">Answer 3:</label>
            <input id="Answer3" type="text" class="form-control" value="<%=Answer3%>" name="Answer3" placeholder="Answer c" required autofocus>

            <label for="Answer4">Answer 4:</label>
            <input id="Answer4" type="text" class="form-control" value="<%=Answer4%>" name="Answer4" placeholder="Answer d" required autofocus>

            <label for="Correct_Answer">Correct answer:</label>
            <select class="form-control" name="Correct_Answer" id="Correct_Answer">
                <option <% if(Correct_Answer == 1) out.write("selected"); %> value="1">1</option>
                <option <% if(Correct_Answer == 2) out.write("selected"); %> value="2">2</option>
                <option <% if(Correct_Answer == 3) out.write("selected"); %> value="3">3</option>
                <option <% if(Correct_Answer == 4) out.write("selected"); %> value="4">4</option>
            </select>
                <% if(Answer1 != ""){ %>
                    <br><button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Change question</button>
                <% }else{ %>
                    <br><button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Add question</button>
                <%}%>
            </div>
        </form>
    </div>
</div>
</body>
</html>
