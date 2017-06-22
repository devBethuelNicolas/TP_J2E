<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <link rel='stylesheet' href='/webjars/bootstrap/css/bootstrap.min.css'>
    <title>login</title>
    <link rel="stylesheet" type="text/css" th:href="@{/css/registration.css}" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container col-md-4 col-md-offset-4" >
    <form class="form-signin"  action="/login.do" method="POST" >
        <h2 class="form-signin-heading">Please Authenticate Sign in</h2>

        <label for="name" class="sr-only">chose a login</label>
        <input type="text" name="name" id="name" class="form-control" placeholder=" user name " required autofocus>
        <br>
        <label for="inputAge" class="sr-only">password</label>
        <input type="password" name="password" id="inputAge" class="form-control" placeholder="password" required>
        <br>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>
    <a href="/registration"><button  class="btn btn-lg btn-primary btn-block" >No account Register !</button></a>
</div>


<script data-main="/js/app" src="/webjars/bootstrap/js/require.min.js"></script>
</body>
</html>