<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.podchody.DatabaseConnection" %><%--
  Created by IntelliJ IDEA.
  User: Main-PC
  Date: 09.01.2022
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/head.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <title>Questions</title>
</head>
<body>
<div class="container header-panel d-flex justify-content-between" >
    <h1> Questions Panel </h1>
    <a href="/Podchody/newQuestion.jsp"> <button class="btn btn-dark">New Question</button></a>
</div>
<h2>Questions on points</h2>
<div style="width: 80%; margin-left: 1%;" class="main">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Test Name</th>
            <th scope="col">Question</th>
            <th scope="col">Answer 1</th>
            <th scope="col">Answer 2</th>
            <th scope="col">Answer 3</th>
            <th scope="col">Answer 4</th>
            <th scope="col">Correct Answer</th>
            <th scope="col">Edit</th>
            <th scope="col">Remove</th>
        </tr>
        </thead>
        <tbody>


        <%
            String query  = "SELECT * FROM Questions inner JOIN Test on Questions.Test_ID = Test.Test_ID order by Questions.Test_ID";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                Integer Question_ID = rs.getInt("Question_ID");
                String Test_ID = rs.getString("Name");
                String Question = rs.getString("Question");
                String Answer1 = rs.getString("Answer1");
                String Answer2 = rs.getString("Answer2");
                String Answer3 =  rs.getString("Answer3");
                String Answer4 =  rs.getString("Answer4");
                String Correct_Answer =  rs.getString("Correct_Answer");
        %>
        <tr>
            <th scope="row"><%=Question_ID%></th>
            <td><%=Test_ID%></td>
            <td><%=Question%></td>
            <td><%=Answer1%></td>
            <td><%=Answer2%></td>
            <td><%=Answer3%></td>
            <td><%=Answer4%></td>
            <td><%=Correct_Answer%></td>
            <td>
                <form action="/Podchody/newQuestion.jsp" method="post">
                    <input style="display: none;" value="<%=Question_ID%>" name="Id">
                    <button type="submit" class="btn btn-info">Edit</button>
                </form>
            </td>
            <td>
                <form action="/Podchody/removeField" method="post">
                    <input style="display: none;" value="Question" name="table">
                    <input style="display: none;" value="<%=Question_ID%>" name="Id">
                    <button type="submit" class="btn btn-danger">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
                        </svg>
                    </button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<h2>Questions without points</h2>
<div style="width: 80%; margin-left: 1%;" class="main">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Question</th>
            <th scope="col">Answer 1</th>
            <th scope="col">Answer 2</th>
            <th scope="col">Answer 3</th>
            <th scope="col">Answer 4</th>
            <th scope="col">Correct Answer</th>
            <th scope="col">Edit</th>
            <th scope="col">Remove</th>
        </tr>
        </thead>
        <tbody>

        <%
            String query2  = "SELECT * FROM Questions where Test_ID IS NULL";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ResultSet rs2 = ps2.executeQuery();

            while (rs2.next()){
                Integer Question_ID = rs2.getInt("Question_ID");
                String Question = rs2.getString("Question");
                String Answer1 = rs2.getString("Answer1");
                String Answer2 = rs2.getString("Answer2");
                String Answer3 =  rs2.getString("Answer3");
                String Answer4 =  rs2.getString("Answer4");
                String Correct_Answer =  rs2.getString("Correct_Answer");
        %>
        <tr>
            <th scope="row"><%=Question_ID%></th>
            <td><%=Question%></td>
            <td><%=Answer1%></td>
            <td><%=Answer2%></td>
            <td><%=Answer3%></td>
            <td><%=Answer4%></td>
            <td><%=Correct_Answer%></td>
            <td>
                <form action="/Podchody/newQuestion.jsp" method="post">
                    <input style="display: none;" value="<%=Question_ID%>" name="Id">
                    <button type="submit" class="btn btn-info">Edit</button>
                </form>
            </td>
            <td>
                <form action="/Podchody/removeField" method="post">
                    <input style="display: none;" value="Question" name="table">
                    <input style="display: none;" value="<%=Question_ID%>" name="Id">
                    <button type="submit" class="btn btn-danger">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
                        </svg>
                    </button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
