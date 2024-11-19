<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 11/1/2024
  Time: 11:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
    <title>none</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style><%@include file="/styles.css"%></style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="nav d-flex justify-content-around">
    <div class="nav-links">
        <a href="#">Link 1</a>
        <a href="#">Link 2</a>
        <a href="#">Link 3</a>
        <a href="#">Link 4</a>
        <a href="#">Link 5</a>
    </div>
</div>
<div class="d-flex justify-content-between">
    <div class="sidebar vh-100" style="width: 20%">
        <c:forEach var="i" begin="0" end="100">
            <a >user : ${i}</a><br>
        </c:forEach>
    </div>
    <div class="vh-100" style="width: 60%"></div>
    <div class="sidebar vh-100" style="width: 20%">
        <c:forEach var="i" begin="0" end="100">
            <div class="fs-1">user : ${i}</div><br>
        </c:forEach>
    </div>
</div>


</div>
</body>
