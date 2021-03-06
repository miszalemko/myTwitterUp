<%@ page import="twitter.dto.TwitterMessageDto" %><%--
  Created by IntelliJ IDEA.
  User: maykloff
  Date: 11.03.2018
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Tweet edit page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/tweets">Twitter</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/myTweets">My tweets</a></li>
            <li><a href="/addTweet">Add tweet</a></li>
            <li><a href="/tweetSearchForm">Find tweets</a></li>
        </ul>
        <p class="navbar-text">Logged us ${sessionScope.username}</p>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>
<h1>Tweet</h1>

<c:choose>
    <c:when test="${not empty errorMessage}">
        <div class="container">
            <div class="alert alert-danger">${errorMessage}</div>
        </div>
    </c:when>
    <c:otherwise>
        <c:if test="${not empty tweet}">
            <div class="container">
                <form class="form-horizontal" action="/addTweet" method="post">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="title">Title:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="title" placeholder="Enter title"
                                   name="title" value="${tweet.title}"/>
                        </div>
                        <c:if test="${not empty errors and not empty errors.fieldErrors.title}">
                            <label class="error"> ${errors.fieldErrors.title}</label>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="message">Message:</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="message" placeholder="Enter message"
                                      name="message">${tweet.message}</textarea>
                        </div>
                        <c:if test="${not empty errors and not empty errors.fieldErrors.message}">
                            <label class="error"> ${errors.fieldErrors.message}</label>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="username">Username:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="username" placeholder="Enter username"
                                   name="username" value="${tweet.username}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label><input type="checkbox" name="remember"> Remember me</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Add tweet</button>
                        </div>
                    </div>
                </form>
            </div>
        </c:if>
    </c:otherwise>
</c:choose>

</body>
</html>
