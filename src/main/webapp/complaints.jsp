<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

<html>
<head>
    <title>Financing Requests</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<script>
    function approveComplaint(id) {
        $.ajax({
            url: 'ApproveComplaintServlet?id=' + id,
            method: 'GET',
            success: function() {
                document.getElementById(id).textContent = 'Traitée';
                document.getElementById(id).style.color = 'green';
                document.getElementById(id + 'icon').className = 'bi bi-x-lg';
                document.getElementById(id + 'button').onclick = function() {
                    disapproveComplaint(id);
                };
                console.log('Approved Complaint with id:', id);
            },
            error: function(xhr, status, error) {
                console.error('Error approving Complaint:', status, error);
            }
        });
    }
    function disapproveComplaint(id) {
        $.ajax({
            url: 'DisapproveComplaintServlet?id=' + id,
            method: 'GET',
            success: function() {
                document.getElementById(id).textContent = 'En Traitement';
                document.getElementById(id).style.color = 'red';
                document.getElementById(id + 'icon').className = 'bi bi-check2';
                document.getElementById(id + 'button').onclick = function() {
                    approveComplaint(id);
                };
                console.log('Disapproved Complaint with id:', id);
            },
            error: function(xhr, status, error) {
                console.error('Error Disapproving Complaint:', status, error);
            }
        });
    }
</script>
<c:if test="${sessionScope.role ne 'P'}">
    <form action="${pageContext.request.contextPath}/SubmitAnouncementServlet" method="post" enctype="multipart/form-data" class="row g-3 justify-content-center" style="max-width: 600px; margin-top: 100px;">
        <h2 class="text-center">Submit a complaint</h2>
        <div style="display: flex;flex-direction: column; place-content: center; place-items: center">
            <label for="caption" class="form-label">Description</label>
            <textarea class="form-control my-input" id="caption" name="caption" required></textarea>
        </div>
        <div class="col-md-10 d-flex justify-content-center">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
</c:if>
<c:if test="${sessionScope.role eq 'P'}">
    <h2>Complaints</h2>
</c:if>
<c:if test="${sessionScope.role ne 'P'}">
    <h2> My Complaints</h2>
</c:if>
    <div class="grid-container">
        <c:forEach var="complaint" items="${complaints}">
                <div class="complaint-item" title="Click to validate complaint">
                    <div class="header">
                        <h6><b>Complaint ID: ${complaint.id}</b></h6>
                        <h6><b>User : ${complaint.fullname}</b></h6>
                        <h6><b>${complaint.date}</b></h6>
                    </div>
                    <div class="description">
                            ${complaint.description}
                    </div>
                    <div>
                        <c:if test="${sessionScope.role eq 'p'}">
                            <c:choose>
                                <c:when test="${complaint.status eq 'Traitée'}">
                                    <span id="${complaint.id}" style="color: green">${complaint.status}</span>
                                    <button class="comp" id="${complaint.id}button" onclick="disapproveComplaint(${complaint.id})"><i id="${complaint.id}icon" class="bi bi-x-lg"></i></button>
                                </c:when>
                                <c:otherwise>
                                    <span id="${complaint.id}" style="color: red">${complaint.status}</span>
                                    <button class="comp" id="${complaint.id}button" onclick="approveComplaint(${complaint.id})"><i id="${complaint.id}icon" class="bi bi-check2"></i></button>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${sessionScope.role ne 'p'}">
                            <c:choose>
                                <c:when test="${complaint.status eq 'Traitée'}">
                                    <span id="${complaint.id}" style="color: green">${complaint.status}</span>
                                </c:when>
                                <c:otherwise>
                                    <span id="${complaint.id}" style="color: red">${complaint.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
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