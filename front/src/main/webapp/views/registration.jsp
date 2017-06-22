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
    <title>Registration Form</title>
    <link rel="stylesheet" type="text/css" th:href="@{/css/registration.css}" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form action="/" method="get">
    <button class="btn btn-md btn-warning btn-block" type="Submit">Go To Login Page</button>
</form>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form autocomplete="on" action="#" th:action="@{/registration}"
                  th:object="${user}" method="post" class="form-horizontal"
                  role="form">
                <h2>Registration Form</h2>
                <div class="form-group">
                    <div class="col-sm-9">
                     <%-- <!--  <label th:th:if="${#fields.hasErrors('name')}" th:errors="*{name}"
                               class="validation-message"></label>-->--%>
                        <input type="text" name="name" th:field="name" placeholder="Name"
                               class="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                       <%-- <label	th:if="${#fields.hasErrors('lastName')}" th:errors="*{lastName}"
                                  class="validation-message"></label>--%>
                        <input type="text" name="lastName" th:field="last_name"
                               placeholder="Last Name" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9">
                        <input type="text" name="email" th:field="email" placeholder="Email"
                               class="form-control" /><%-- <label
                            th:if="${#fields.hasErrors('email')}" th:errors="*{email}"
                            class="validation-message"></label>--%>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <input type="text" name="age" th:field="age"
                               placeholder="Age" class="form-control" /> <%--<label
                            th:if="${#fields.hasErrors('password')}" th:errors="*{password}"
                            class="validation-message"></label>--%>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <input type="password" name="password" th:field="password"
                               placeholder="Password" class="form-control" /> <%--<label
                            th:if="${#fields.hasErrors('password')}" th:errors="*{password}"
                            class="validation-message"></label>--%>
                    </div>
                </div>



                <div class="form-group">
                    <div class="col-sm-9">
                        <button type="submit" class="btn btn-primary btn-block">Register User</button>
                    </div>
                </div>

                <span th:utext="${successMessage}"></span>


            </form>
        </div>
    </div>
</div>

</body>

</body>
</html>
