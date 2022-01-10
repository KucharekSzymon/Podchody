<%--
  Created by IntelliJ IDEA.
  User: skuch
  Date: 01.01.2022
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/head.jsp" %>
    <title>Configuration panel</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        a{
            text-decoration: none;
        }
    </style>
</head>
<body>
<div>
    <div class="container">
        <h2>Configuration panel</h2>
        <a href="tests.jsp">
            <div class="card bg-primary text-white">
                <div class="card-body">Tests</div>
            </div>
        </a>

        <br>
        <a href="questions.jsp">
            <div class="card bg-success text-white">
                <div class="card-body">Questions</div>
            </div>
        </a>
        <br>
        <a href="games.jsp">
            <div class="card bg-info text-white">
                <div class="card-body">Games</div>
            </div>
        </a>
        <br>
        <a href="points.jsp">
            <div class="card bg-warning text-white">
                <div class="card-body">Points</div>
            </div>
        </a>
        <br>
        <div class="card bg-danger text-white">
            <div class="card-body">Danger card</div>
        </div>
        <br>
        <div class="card bg-secondary text-white">
            <div class="card-body">Secondary card</div>
        </div>
        <br>
        <div class="card bg-dark text-white">
            <div class="card-body">Dark card</div>
        </div>
        <br>
        <div class="card bg-light text-dark">
            <div class="card-body">Light card</div>
        </div>
    </div>
</div>

</body>
</html>
