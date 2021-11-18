<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="images/icon.png">
    <title>Lab 1 web programming</title>
    <script src="https://cdn.jsdelivr.net/npm/@svgdotjs/svg.js@3.0/dist/svg.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="scripts/DataHandler.js"></script>
    <style>
        body{
            color: black;
            font-family: 'Georgia',serif;
            background-color: #fcdf58;
        }
        table, tr, td{
            padding: 0; /*top-bottom left-right*/
            /*border: 1px solid black;*/
        }
        #main-table{
            width: 95%;
            margin: auto;
        }
        #header{
            background-color: #F8D843;
            font-size: 22px;
            font-weight: bold;
            color: black;
            padding-top: 3%;
        }
        .left-aligned{
            float: left;
            margin-left: 5%;
            margin-bottom: 0px;
        }
        .right-aligned{
            float: right;
            margin-right: 5%;
        }
        .header{
            text-align: center;
            background-color: #b0961f;
        }
        .image{
            width: 100%;
            margin-left: 0%;
        }
        .body{
            padding-top: 0;
        }
        .input-label{
            float: left;
            width: 25%;
        }
        .input-value{
            text-align: center;
        }
        #input-table{
            margin: auto;
            width: 60%;
            alignment: center;
        }
        #y-values{
            width: 70%;
            font-family: "Georgia", serif;
            font-size: 19px;
        }
        #x-values {
            margin:auto;
            width: 70%;
        }
        #x-values input{
            width: 27px;
            font-size: 19px;
            font-family: "Georgia", serif;
        }
        #x-values input:hover{
            font-weight: bold;
            color: darkred;
        }
        #r-values{
            margin: auto;
            width: 70%;
            font-size: 19px;
            font-family: "Georgia", serif;
            text-align-last: center;
        }
        #result-row{
            width: 60%;
            position: relative;
            vertical-align: top;
        }
        #result-table{
            width: 100%;
            background-color: #e7bf06;
            text-align: center;
            table-layout: fixed;
            word-wrap: break-word;
        }
        #result-table td {
            overflow: hidden;
        }
        .w13 {width: 13%}
        .w24 {width: 24%}
        .result-content{
            position: absolute;
            height: 100%;
            padding-bottom: 0;
            width: 100%;
            overflow-y: scroll;
            background-color: #ffd23c;
        }

        div.buttons{
            text-align: center;
            margin-bottom: 10%;
            padding-top: 5%;
            border-top: gray 3px;
        }
        div.buttons input{
            font-family: 'Georgia', serif;
            font-size: 14px;
            font-weight: bold;
        }
        div.buttons input:hover{
            color:darkred;
        }
        input[type='submit']{
            margin-right: 5%;
        }
        .x-button input:checked{
            background-color: red;
        }
        .active{
            color:seagreen;
            font-weight: bold;
        }
        #errors{
            width: 100%;
        }
        .error{
            word-wrap: break-word;
            font-size: 19px;
            color: red;
        }
        #result-table-header {
            background-color: #b0961f;
        }
    </style>
</head>
<body>
<table id="main-table">
    <tr>
        <td id="header" colspan="2">
            <span class="left-aligned"><img src="images/ankha.gif" alt="cute cat dancing"  width="200"/></span>
            <span class="right-aligned">Фам Мань Туан<br>P3212<br>Вариант: 12022 </span>
        </td>
    </tr>
    <tr class="body">
        <td id="graph">
            <div class="header">
                <h2>Graph</h2>
            </div>
            <div id="area">
                <svg xmlns="http://www.w3.org/2000/svg" width="300" height="300">
                    <rect x="150" y="90" width="120" height="60" fill="#3399ff"></rect>
                    <polygon points="150,150 30,150 150,30" fill="#3399ff"></polygon>
                    <path d="M 150 150 L 30 150 C 30 220 80 270 150 270 L Z" fill="#3399ff"></path>
                    <line x1="0" y1="150" x2="300" y2="150" stroke="#000000" stroke-width="2"></line>
                    <line x1="150" y1="0" x2="150" y2="300" stroke="#000000" stroke-width="2"></line>
                    <polygon points="300,150 295,155 295, 145" fill="#000720" stroke="#000720"></polygon>
                    <polygon points="150,0 145,5 155,5" fill="#000720" stroke="#000720"></polygon>
                    <line x1="270" y1="146" x2="270" y2="154" stroke="#000000" stroke-width="2"></line>
                    <text x="265" y="140">R</text>
                    <line x1="210" y1="146" x2="210" y2="154" stroke="#000000" stroke-width="2"></line>
                    <text x="200" y="140">R/2</text>
                    <line x1="90" y1="146" x2="90" y2="154" stroke="#000000" stroke-width="2"></line>
                    <text x="75" y="140">-R/2</text>
                    <line x1="30" y1="146" x2="30" y2="154" stroke="#000000" stroke-width="2"></line>
                    <text x="20" y="140">-R</text>
                    <line x1="146" y1="30" x2="154" y2="30" stroke="#000000" stroke-width="2"></line>
                    <text x="156" y="35">R</text>
                    <line x1="146" y1="90" x2="154" y2="90" stroke="#000000" stroke-width="2"></line>
                    <text x="156" y="95">R/2</text>
                    <line x1="146" y1="210" x2="154" y2="210" stroke="#000000" stroke-width="2"></line>
                    <text x="156" y="215">-R/2</text>
                    <line x1="146" y1="270" x2="154" y2="270" stroke="#000000" stroke-width="2"></line>
                    <text x="156" y="275">-R</text>
                    Sorry, your browser does not support inline SVG.
                </svg>
            </div>
        </td>
        <td id="result-row" rowspan="2">
            <div class="header">
                <h2>Result</h2>
            </div>
            <div class="result-content">
                <table id="result-table">
                    <colgroup>
                        <col class="w13"/>
                        <col class="w13"/>
                        <col class="w13"/>
                        <col class="w13"/>
                        <col class="w24"/>
                        <col class="w24"/>
                    </colgroup>
                    <tr id="result-table-header">
                        <th>X</th>
                        <th>Y</th>
                        <th>R</th>
                        <th>Result</th>
                        <th>Time</th>
                        <th>Executed time (ns)</th>
                    </tr>
<%--                    <c:forEach var="hit" items="${shotForBean.hitList}">--%>
<%--                        <tr>--%>
<%--                            <td>${hit.x}</td>--%>
<%--                            <td>${hit.y}</td>--%>
<%--                            <td>${hit.r}</td>--%>
<%--                            <c:if test="${hit.result == 'Да'}">--%>
<%--                                <td>--%>
<%--                                    <div style="color:#279327">${(hit.result)}</div>--%>
<%--                                </td>--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${hit.result == 'Нет'}">--%>
<%--                                <td>--%>
<%--                                    <div style="color:#e11a1a">${(hit.result)}</div>--%>
<%--                                </td>--%>
<%--                            </c:if>--%>
<%--                            <td>${hit.localTime}</td>--%>
<%--                            <td>${hit.processingTime} sec</td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
                </table>
            </div>
        </td>
    </tr>
        <td id="values">
            <div class="header">
                <h2>Values</h2>
            </div>
            <div id="values-container">
                <form id="input-form" action="" method="POST">
                    <table id="input-table">
                        <tr>
                            <td class="input-label"><h3>X: </h3></td>
                            <td class="input-value">
                                <div id="x-values">
                                    <input type="button" name="xvalue" value="-3">
                                    <input type="button" name="xvalue" value="-2">
                                    <input type="button" name="xvalue" value="-1">
                                    <input type="button" name="xvalue" value="0">
                                    <input type="button" name="xvalue" value="1">
                                    <input type="button" name="xvalue" value="2">
                                    <input type="button" name="xvalue" value="3">
                                    <input type="button" name="xvalue" value="4">
                                    <input type="button" name="xvalue" value="5">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="input-label"><h3>Y: </h3></td>
                            <td class="input-value">
                                <input id="y-values" type="text" name="yvalue" placeholder="Number from -5 to 3" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <td class="input-label"><h3>R: </h3></td>
                            <td class="input-value">
                                <div id="r-values">
                                    <label><input type="radio" name="rvalue" value="1" checked> 1 </label>
                                    <label><input type="radio" name="rvalue" value="1.5"> 1.5 </label>
                                    <label><input type="radio" name="rvalue" value="2"> 2 </label>
                                    <label><input type="radio" name="rvalue" value="2.5"> 2.5 </label>
                                    <label><input type="radio" name="rvalue" value="3"> 3 </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <ul id="errors"></ul>
                                <div class="buttons">
                                    <input id="submit" type="submit" value="Submit">
                                    <input id="reset" type="button" value="Reset">
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </td>
</table>
</body>
</html>