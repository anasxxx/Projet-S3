<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 10/18/2024
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="Bean.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="users" scope="request" type="java.util.List"/>
<html>
<head>
    <style><%@include file="/styles.css"%></style>
</head>
<body>
<div class="">
    <table>
        <tr class="product-row">
            <th>Id</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>tel</th>
            <th>Role</th>
            <th>Sexe</th>
            <th>Massar</th>
            <th>Password</th>
            <th>Token</th>
            <th>Token validity</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr class="product-row">
                <td>${user.id}</td>
                <td>${user.nom}</td>
                <td>${user.prenom}</td>
                <td>${user.tel}</td>
                <td>${user.role}</td>
                <td>${user.sexe}</td>
                <td>${user.massar}</td>
                <td>${user.password}</td>
                <td>${user.token}</td>
                <td>${user.token_validity}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
