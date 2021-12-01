<%@ page import="main.Result" %><%--
  Created by IntelliJ IDEA.
  User: the7u
  Date: 11/18/2021
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<style>
    body {
        background-color: #fcdf58;
    }
    .sliding-button {
        position:fixed;
        width:120px;
        height:60px;
        margin-top: -30px;
        margin-left: -60px;
        top:90vh;
        left:50vw;
        box-shadow: 2px 2px 3px #737373;
        background-color: #b0961f;
        border: 1px solid #2f2f2f;
        border-radius: 16px;
        box-sizing: border-box;
        color: #000000;
        align-items: center;
        font-family: Inter, sans-serif;
        font-size: 18px;
        line-height: 28px;
    }
    .sliding-button:active,
    .sliding-button:hover {
        outline: 0;
    }
    .sliding-button:hover {
        background-color: #b19515;
        border-color: rgba(0, 0, 0, 0.19);
    }
    .table {
        position:fixed;
        width: 70vw;
        height:80vh;
        top:10vh;
        left:15vw;
    }
</style>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <h1>TABLE</h1>
    </div>
    <div class="table">
        <jsp:include page="table.jsp" />
    </div>
    <div>
<%--        <%=request.getContextPath()%> return root address of the app, in this is lab2_war/ --%>
        <form method="get" action="<%= request.getContextPath() %>">
            <button id="button" class="sliding-button" type="submit">Take me back.</button>
        </form>
    </div>
</body>
</html>
