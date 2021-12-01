<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: the7u
  Date: 11/18/2021
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="tableRows" class="main.ResultContainer" scope="session"/>

<script>
    $(window).on("load resize ", function() {
        var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
        $('.tbl-header').css({'padding-right':scrollWidth});
    }).resize();
</script>

<style>
    h1{
        font-size: 30px;
        text-transform: uppercase;
        font-weight: 300;
        text-align: center;
        margin-bottom: 15px;
    }
    table{
        width:100%;
        table-layout: fixed;
    }
    .tbl-header{
        background-color: #b0961f;
    }
    .tbl-content{
        background-color: #ffd23c;
        height: 700px;
        overflow-x:auto;
        margin-top: 0px;

        /*border: 1px solid rgba(40, 40, 40, 0);*/
    }
    th{
        padding: 20px 15px;
        text-align: center;
        font-weight: bold;
        font-size: 15px;
        text-transform: uppercase;
        overflow-wrap: anywhere;
    }
    td{
        padding: 15px;
        text-align: center;
        vertical-align:middle;
        font-weight: 300;
        font-size: 15px;
        overflow-wrap: anywhere;
        /*border: #373737;*/
        /*border-bottom: solid 1px rgba(0, 0, 0, 0);*/
    }
    .w13 {width: 13%}
    .w24 {width: 24%}
</style>
<div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
        <thead>
        <colgroup>
            <col class="w13"/>
            <col class="w13"/>
            <col class="w13"/>
            <col class="w13"/>
            <col class="w24"/>
            <col class="w24"/>
        </colgroup>
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Result</th>
            <th>Time</th>
            <th>Executed time</th>
        </tr>
        </thead>
    </table>
</div>
<div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
        <tbody>
            <colgroup>
                <col class="w13"/>
                <col class="w13"/>
                <col class="w13"/>
                <col class="w13"/>
                <col class="w24"/>
                <col class="w24"/>
            </colgroup>
            <c:forEach var="itr" items="${tableRows.results}">
                <tr>
                    <td>${itr.x}</td>
                    <td>${itr.y}</td>
                    <td>${itr.r}</td>
                    <c:if test="${itr.hit}">
                        <td>
                            <div style="color:#1e911e">${(itr.hit)}</div>
                        </td>
                    </c:if>
                    <c:if test="${!itr.hit}">
                        <td>
                            <div style="color:#e91414">${(itr.hit)}</div>
                        </td>
                    </c:if>
                    <td>${itr.start_time}</td>
                    <td>${itr.executed_time}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>