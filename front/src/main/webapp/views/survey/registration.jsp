<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: karakakou
  Date: 23/05/17
  Time: 10:21
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
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $( function() {
            $( "#datepicker" ).datepicker();
            $( "#datepicker2" ).datepicker();
        } );
    </script>
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
                <form autocomplete="on" action="#" th:action="@{/survey/home/add}"
                      th:object="${user}" method="post" class="form-horizontal"
                      role="form">
                    <h2>Registration Form</h2>
                    <div class="form-group">
                        <div class="col-sm-9">
                            <%-- <!--  <label th:th:if="${#fields.hasErrors('name')}" th:errors="*{name}"
                                      class="validation-message"></label>-->--%>
                            <input type="text" name="question"  placeholder="Question"
                                   class="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9">
                            <%-- <!--  <label th:th:if="${#fields.hasErrors('name')}" th:errors="*{name}"
                                      class="validation-message"></label>-->--%>
                            <input type="text" name="dateBegin"  placeholder="dateBegin"
                                   class="form-control" id="datepicker" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-9">
                            <%-- <!--  <label th:th:if="${#fields.hasErrors('name')}" th:errors="*{name}"
                                      class="validation-message"></label>-->--%>
                                <input type="text" name="dateEnd"  placeholder="dateEnd"
                                       class="form-control" id="datepicker2" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9">
                            <button type="submit" class="btn btn-primary btn-block">Save</button>
                        </div>
                    </div>

                    <span th:utext="${successMessage}"></span>


                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
