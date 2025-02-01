<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

<html>
<head>
    <title>Financing Requests</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function downloadPDF(id) {
    $.ajax({
        url: 'DownloadPDFServlet?id=' + id,
        method: 'GET',
        xhrFields: {
            responseType: 'blob'
        },
        success: function(data) {
            var blob = new Blob([data], { type: 'application/pdf' });
            var url = window.URL.createObjectURL(blob);
            var a = document.createElement('a');
            a.href = url;
            a.download = id + '.pdf';
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            window.URL.revokeObjectURL(url);
        },
        error: function(xhr, status, error) {
            console.error('Error downloading PDF:', status, error);
        }
    });
}
    </script>
</head>
<body>
<c:choose>
    <c:when test="${sessionScope.role eq 'Chef'}">
        <form action="${pageContext.request.contextPath}/SubmitFinancingServlet" method="post" class="row g-3 justify-content-center" style="max-width: 600px; margin-top: 100px;">
            <h2 class="text-center">Submit a Financing Request</h2>
            <div class="finance d-flex justify-content-between">
                <div class="col-md-5">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="col-md-5">
                    <label for="montant" class="form-label">Amount</label>
                    <input type="text" class="form-control" id="montant" name="montant" step="0.01" required>
                </div>
            </div>
            <div class="col-md-10">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control my-input" id="description" name="description" required></textarea>
            </div>
            <div class="col-md-10 d-flex justify-content-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
        <h2 style="margin-top: 50px;">Your Financing Requests</h2>
        <table style="margin-top: 50px" class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Status</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="financement" items="${financements}">
                <tr id="${financement.id}">
                    <td>${financement.id}</td>
                    <td>${financement.title}</td>
                    <td>${financement.montant}</td>
                    <td>${financement.date}</td>
                    <td>${financement.status}</td>
                    <td style="position: relative;color: black">
                        <button onclick="downloadPDF(${financement.id})"><i class="bi bi-download"></i></button>
                        <button onclick="deleteFinancement(${financement.id})"><i class="bi bi-trash"></i></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <h2>Financing Requests</h2>
        <table class="table table-content">
            <thead>
            <tr>
                <th>ID</th>
                <th>ID User</th>
                <th>Title</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Status</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="financement" items="${financements}">
                <tr id="${financement.id}">
                    <td>${financement.id}</td>
                    <td>${financement.id_user}</td>
                    <td>${financement.title}</td>
                    <td>${financement.montant}</td>
                    <td>${financement.date}</td>
                    <td>${financement.status}</td>
                    <td style="position: relative;color: black;column-width: 20px">
                        <button onclick="downloadPDF(${financement.id})"><i class="bi bi-download"></i></button>
                        <c:if test="${financement.status eq 'En traitement'}">
                            <button id="${financement.id}ap" onclick="approveFinancement(${financement.id})"><i class="bi bi-check2"></i></button>
                            <button id="${financement.id}ref"onclick="refuseFinancement(${financement.id})"><i class="bi bi-x-lg"></i></button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
<footer>
    <p class="text-center text-white-50">
        © 2024 ParaEnsias. All rights reserved.
    </p>
</footer>

    <script>

        function hideButtons(apId,refId) {
            document.getElementById(apId).style.display = 'none';
            document.getElementById(refId).style.display = 'none';
        }
        function approveFinancement(id) {
            hideButtons(id + 'ap',id + 'ref');
    $.ajax({
        url: 'ApproveFinancementServlet?id=' + id,
        method: 'GET',
        success: function() {
            document.getElementById(id).querySelector('td:nth-child(6)').innerText = 'Approuvée';
            console.log('Approved financement with id:', id);
        },
        error: function(xhr, status, error) {
            console.error('Error approving financement:', status, error);
        }
    });
        }
        function refuseFinancement(id) {
            hideButtons(id + 'ap',id + 'ref');
            $.ajax({
                url: 'RefuseFinancementServlet?id=' + id,
                method: 'GET',
                success: function() {
                    document.getElementById(id).querySelector('td:nth-child(6)').innerText = 'Refusée';
                    console.log('Refused financement with id:', id);
                },
                error: function(xhr, status, error) {
                    console.error('Error refusing financement:', status, error);
                }
            });
        }
        function deleteFinancement(id) {
    $.ajax({
        url: 'DeleteFinancementServlet?id=' + id,
        method: 'GET',
        success: function() {
            document.getElementById(id).remove();
            console.log('Deleted financement with id:', id);
        },
        error: function(xhr, status, error) {
            console.error('Error deleting financement:', status, error);
        }
    });
}
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.menu-btn').forEach(button => {
        button.addEventListener('click', function() {
            const menu = this.nextElementSibling;
            menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
        });
    });

    document.addEventListener('click', function(event) {
        if (!event.target.matches('.menu-btn')) {
            document.querySelectorAll('.menu-options').forEach(menu => {
                menu.style.display = 'none';
            });
        }
    });
});
    </script>
</body>
</html>