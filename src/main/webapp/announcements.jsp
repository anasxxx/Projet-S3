<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

<html>
<head>
    <title>Financing Requests</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:if test="${sessionScope.role ne 'Étudiant'}">
    <form action="${pageContext.request.contextPath}/SubmitAnouncementServlet" method="post" enctype="multipart/form-data" class="row g-3 justify-content-center" style="max-width: 600px; margin-top: 100px;">
        <h2 class="text-center">Submit an announcement</h2>
        <div style="display: flex;flex-direction: column; place-content: center; place-items: center">
            <label for="caption" class="form-label">Description</label>
            <textarea class="form-control my-input" id="caption" name="caption" required></textarea>
            <input type="file" class="upload" id="photo" name="photo" accept="image/*" required>
        </div>
        <div class="col-md-10 d-flex justify-content-center">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
</c:if>
<div class="announcements">
    <h2>Announcements</h2>
    <ul>
        <c:forEach var="annonce" items="${annonces}">
            <li>
                <div class="header">
                    <div>
                        <img class="profile-pic" src="${pageContext.request.contextPath}/img/${annonce.club_name}.png" alt="logo">
                        <span>${annonce.club_name}</span>
                        <div style="padding: 10px">${annonce.date}</div>
                    </div>

                </div>
                <div class="description">
                        ${annonce.caption}
                </div>
                <div style="display: flex;flex-direction: row;place-items: center;place-content: center;width: 100%;height: 100%;">
                    <img src="${pageContext.request.contextPath}/img/data/${annonce.id}.jpg" alt="">
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
<footer>
    <p class="text-center text-white-50">
        © 2024 ParaEnsias. All rights reserved.
    </p>
</footer>
</body>
</html>