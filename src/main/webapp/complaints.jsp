<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

<html>
<head>
    <title>Financing Requests</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:if test="${sessionScope.role ne 'P'}">
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
    <h2>Complaints</h2>
    <div class="grid-container">
        <c:forEach var="complaint" items="${complaints}">
            <div class="complaint-item">
                <div class="header">
                    <div>
                        <span>ID: ${complaint.id}</span><br>
                        <span>${complaint.date}</span>
                    </div>
                </div>
                <div class="description">
                        ${complaint.description}
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