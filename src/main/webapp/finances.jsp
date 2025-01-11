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
                url: 'FinancesServlet?id=' + id,
                method: 'GET',
                xhrFields: {
                    responseType: 'blob'
                },
                success: function(data) {
                    var a = document.createElement('a');
                    var url = window.URL.createObjectURL(data);
                    a.href = url;
                    a.download = 'financement_' + id + '.pdf';
                    document.body.append(a);
                    a.click();
                    a.remove();
                    window.URL.revokeObjectURL(url);
                }
            });
        }
    </script>
</head>
<body>
    <h2>Submit a Financing Request</h2>
<form action="SubmitFinancingServlet" method="post">
    <label for="description">Description:</label>
    <textarea id="description" name="description" required></textarea><br>
    <label for="montant">Amount:</label>
    <input type="number" id="montant" name="montant" step="0.01" required><br>
    <button type="submit">Submit</button>
</form>
    <h2>Your Financing Requests</h2>
    <table class="table table-content">
        <thead>
            <tr>
                <th>ID</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="financement" items="${financements}">
                <tr>
                    <td>${financement.id}</td>
                    <td>${financement.montant}</td>
                    <td>${financement.date}</td>
                    <td>${financement.status}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/finances/${financement.id}" download="${financement.id}.jpg">
                            <button>
                                Download PDF
                            </button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>