<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<nav class="navbar navbar-inverse visible-xs">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Logo</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Dashboard</a></li>
                <li><a href="#">Age</a></li>
                <li><a href="#">Gender</a></li>
                <li><a href="#">Geo</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row content">
        <div class="col-sm-2 sidenav hidden-xs">
            <h2>SurveyLand</h2>
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="/home/admin"> Users </a></li>
                <li><a href="/survey/home">Question</a></li>
                <li><a href="#section3">statistique</a></li>
            </ul><br>
        </div>
        <br>

        <div class="col-sm-10 ">
            <div class="well">
                <h4>${userName}</h4>
                <p> ${adminMessage}</p>
            </div>

            <div class="row">
                <div class="col-sm-9">
                    <h3>Users List </h3>
                    <div class="well">
                        <table class="table">
                            <thead>

                                <tr>
                                    <th>user_id</th> <th>active</th> <th>last name</th>
                                    <th>name</th> <th>age</th> <th>Role</th> <th>email</th>
                                    <th>Option</th>
                                </tr>

                            </thead>

                            <tbody>
                                <c:forEach items="${userList}" var="user">
                                    <tr>
                                        <td><c:out value="${user.id}"/></td>
                                        <td><c:out value="${user.active}"/></td>
                                        <td><c:out value="${user.lastName}"/></td>
                                        <td><c:out value="${user.name}"/></td>
                                        <td><c:out value="${user.age}"/></td>
                                        <td>
                                            <c:forEach items="${user.roles}" var="role">
                                                <c:out value="${role.role}"/>

                                            </c:forEach>
                                        </td>
                                        <td><c:out value="${user.email}"/></td>
                                        <td>
                                            <a href="/admin/home/delete?id=${user.id}">Delete</a>
                                            <a href="/admin/home/edit?id=${user.id}">Edit</a>
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
