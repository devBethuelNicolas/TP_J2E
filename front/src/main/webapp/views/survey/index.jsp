<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: karakakou
  Date: 23/05/17
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {height: 550px}

        /* Set gray background color and 100% height */
        .sidenav {
            background-color: #f1f1f1;
            height: 100%;
        }

        /* On small screens, set height to 'auto' for the grid */
        @media screen and (max-width: 767px) {
            .row.content {height: auto;}
        }
    </style>
</head>


<body>

<div class="container-fluid">
    <div class="row content">
        <div class="col-sm-2 sidenav hidden-xs">
            <h2>SurveyLand</h2>
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="/admin/home"> Users </a></li>
                <li><a href="#section3">statistique</a></li>
                <li><div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><a href="/home/survey">Questions</a>
                        <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="/survey/home">List</a></li>
                        <li><a href="/survey/home/add">Add</a></li>
                    </ul>
                </div></li>
            </ul><br>
        </div>
        <br>

        <div class="col-sm-10 ">
            <div class="well">
                <h4>${userName}</h4>
            </div>

            <div class="row">
                <div class="col-sm-9">
                    <h3>Surveys</h3>
                    <div class="well">
                        <table class="table">
                            <thead>

                            <tr>
                                <th>survey Id </th> <th>Question ? </th> <th>Begin at </th>
                                <th>End at </th><th>Answers :</th>
                            </tr>

                            </thead>

                            <tbody>
                            <c:forEach items="${surveyList}" var="survey">
                                <tr>
                                    <td><c:out value="${survey.id}"/></td>
                                    <td><c:out value="${survey.question}"/></td>
                                   <td> <fmt:formatDate value="${survey.dateBegin}" pattern="yyyy-MM-dd" /></td>
                                    <td> <fmt:formatDate value="${survey.dateEnd}" pattern="yyyy-MM-dd" /></td>
                                    <td>
                                        <c:forEach items="${survey.responses}" var="response">
                                            <c:out value="|${response.answer}|"/>

                                        </c:forEach>
                                    </td>
                                    <td>
                                        <a href="/survey/home/delete?id=${survey.id}">Delete</a>
                                        <a href="/survey/home/addAnswer?id=${survey.id}">Add answers</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
</body>
</html>
