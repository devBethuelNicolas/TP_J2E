<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <script type="text/javascript">
        $(document).ready(function() {
            $("#oneMore").on("click", function () {

                var newAnswer = "<div  class='form-group'>\
                <div class='col-sm-9'>\
                    <input type='text' name='response'  placeholder='Response'\
                class='form-control' /> </div> </div>";
                if($("#allAnswers input").length < 9 ){
                    $("#allAnswers").append(newAnswer);
                }
            });

            $("#buttonSave").on("click",function(e){
               e.preventDefault();
               var allAnswers = $("#allAnswers input");
               var tabAnswers = [];
               for (var i = 0 ; i< allAnswers.length;i++){
                   if($(allAnswers).get(i).value != "") {
                       tabAnswers[i] = $(allAnswers).get(i).value;
                   }
                    console.log(tabAnswers[i]);
               }
               if(tabAnswers.length != 0 ){
                   var url = window.location.search;

                   var id = url.substring(url.lastIndexOf("=")+1);
                   $.ajax({
                       method: "POST",
                       url: "/survey/home/addAnswer",
                       data: { id: id , answers: tabAnswers },
                       async :false
                   })
                       .done(function( msg ) {
                           alert( "Data Saved: " + msg );
                       });
               }
            });
        });
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
                <form autocomplete="on" action="#" th:action="@{/survey/home/addAnswer}"
                      th:object="${user}" method="post" class="form-horizontal"
                      role="form">
                    <h2>Add answers to  : ${survey.question}</h2>
                    <div id="allAnswers">
                        <c:forEach items="${survey.responses}" var="response">
                            <div id="" class="form-group">
                                <div class="col-sm-9">
                                        <%-- <!--  <label th:th:if="${#fields.hasErrors('name')}" th:errors="*{name}"
                                                  class="validation-message"></label>-->--%>
                                    <input type="text" name="response"  placeholder="Response"
                                           class="form-control" value="${response.answer}" />
                                </div>
                            </div>
                        </c:forEach>
                        <div id="" class="form-group">
                            <div class="col-sm-9">
                                <%-- <!--  <label th:th:if="${#fields.hasErrors('name')}" th:errors="*{name}"
                                          class="validation-message"></label>-->--%>
                                <input type="text" name="response"  placeholder="Response"
                                       class="form-control"  />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-9">
                            <button id="oneMore"type="button" class="btn btn-primary btn-block">One more ?</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-9">
                            <button id ="buttonSave"type="submit" class="btn btn-primary btn-block">Save</button>
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
