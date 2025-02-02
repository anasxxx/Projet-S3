<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

<html>
<head>
    <title>Financing Requests</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>Clubs</h2>
<div class="grid-container" style="grid-template-columns: repeat(2, 1fr)">
    <c:forEach var="club" items="${clubs}">
        <div class="card">
            <img style="border-radius: 7px" src="${pageContext.request.contextPath}/img/${club.name}.png" alt="logo">
            <div class="container" style="width: 500px">
                <h4><b>${club.name}</b></h4>
                <p>${club.description}</p>
                <div style="display: flex;flex-direction: row;">
                    <c:if test="${club.fb ne null}">
                        <a href="${club.fb}" target="_blank"><i class="sm bi bi-facebook"></i></a>
                    </c:if>
                    <c:if test="${club.ig ne null}">
                        <a href="${club.ig}" target="_blank"><i class="sm bi bi-instagram"></i></a>
                    </c:if>
                    <c:if test="${club.yt ne null}">
                        <a href="${club.yt}" target="_blank"><i style="color: red" class="sm bi bi-youtube"></i></a>
                    </c:if>
                </div>

            </div>
        </div>
    </c:forEach>
</div>
<footer>
    <p class="text-center text-white-50">
        © 2024 ParaEnsias. All rights reserved.
    </p>
</footer>
</body>
</html>