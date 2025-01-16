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
        <form action="${pageContext.request.contextPath}/SubmitFinancingServlet" method="post" class="row g-3 justify-content-center" style="max-width: 600px; margin: 100px auto;">
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
        <h2>Your Financing Requests</h2>
        <table class="table table-content">
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
                <tr onmouseover="showDownloadButton(this)" onmouseout="hideDownloadButton(this)">
                    <td>${financement.id}</td>
                    <td>${financement.title}</td>
                    <td>${financement.montant}</td>
                    <td>${financement.date}</td>
                    <td>${financement.status}</td>
                    <td style="position: relative;color: black">
                        <div class="menu-container">
                            <button class="menu-btn">⋮</button>
                            <div class="menu-options">
                                <button onclick="downloadPDF(${financement.id})">Download</button>
                                <button onclick="deleteFinancement(${financement.id})">Delete</button>
                            </div>
                        </div>
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
                <th>Title</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Status</th>
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
                </tr>
                <td style="position: relative;color: black">
                    <div class="menu-container">
                        <button class="menu-btn">⋮</button>
                        <div class="menu-options">
                            <button onclick="downloadPDF(${financement.id})">Download</button>
                            <button onclick="deleteFinancement(${financement.id})">Delete</button>
                        </div>
                    </div>
                </td>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

    <script>
        // JavaScript
        // JavaScript
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

function deleteFinancement(id) {
    // Implement the delete functionality here
    console.log('Delete financement with id:', id);
}
        function showDownloadButton(row) {
            const button = row.querySelector('.download-btn');
            button.style.display = 'block';
            button.style.position = 'absolute';
            button.style.top = row.offsetTop + row.offsetHeight + 'px';
            button.style.left = row.offsetLeft + 'px';
        }

        function hideDownloadButton(row) {
            row.querySelector('.download-btn').style.display = 'none';
        }
    </script>
</body>
</html>