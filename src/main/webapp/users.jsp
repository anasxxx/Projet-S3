<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 11/23/2024
  Time: 7:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp"/>
<body>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Massar</th>
        <th>Phone</th>
        <th>sexe</th>
        <th>Role</th>
        <th>Created at</th>
        <th>Last Updated</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.first_name}</td>
            <td>${user.last_name}</td>
            <td>${user.email}</td>
            <th>${user.massar}</th>
            <td>${user.phone}</td>
            <td>${user.sexe}</td>
            <td>${user.role}</td>
            <td>${user.created_at}</td>
            <td>${user.updated_at}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<footer class="mt-5" style="margin-top: 0" >
    <p class="text-center text-white-50">
        © 2024 ParaEnsias. All rights reserved.
    </p>
</footer>
</div>

</body>
