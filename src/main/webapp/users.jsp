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
<form action="${pageContext.request.contextPath}/AdminSignupServlet" method="post" class="row g-3" style="max-width: calc(100% - 25vw);margin-top: 100px">
    <div class="col-md-3">
        <label for="first_name" class="form-label">First Name</label>
        <input type="text" class="form-control" id="first_name" name="first_name" required>
    </div>
    <div class="col-md-3">
        <label for="last_name" class="form-label">Last Name</label>
        <input type="text" class="form-control" id="last_name" name="last_name" required>
    </div>
    <div class="col-md-3">
        <label for="massar" class="form-label">Massar</label>
        <input type="text" class="form-control" id="massar" name="massar" required>
    </div>
    <div class="col-md-3">
        <label for="phone" class="form-label">Phone</label>
        <input type="tel" class="form-control" id="phone" name="phone" required>
    </div>
    <div class="col-md-3">
        <label for="sexe" class="form-label">Sexe</label>
        <select id="sexe" name="sexe" class="form-select" required>
            <option value="">Select</option>
            <option value="M">M</option>
            <option value="F">F</option>
        </select>
    </div>
    <div class="col-md-3">
        <label for="role" class="form-label">Role</label>
        <select id="role" name="role" class="form-select" required>
            <option value="">Select</option>
            <option value="P">P</option>
            <option value="Chef">Chef</option>
            <option value="Étudiant">Étudiant</option>
        </select>
    </div>
    <div class="col-md-3 d-flex align-items-end">
        <button id="button" type="submit" class="btn btn-primary">Add User</button>
    </div>
</form>
<div id="phone_check" style="margin-top: 0"></div>
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
<script>
    const phone=document.getElementById("phone");
    const phone_check=document.getElementById("phone_check");
    const button=document.getElementById("button");

    phone.addEventListener("input",function()
        {
            const value = phone.value.replace(/\D/g, ""); // Remove non-numeric characters
            let formattedValue = "";

            if (value.length > 0) formattedValue += value.substring(0, 3); // First 3 digits
            if (value.length > 3) formattedValue += "-" + value.substring(3, 6); // Next 3 digits
            if (value.length > 6) formattedValue += "-" + value.substring(6, 10); // Last 4 digits
            phone.value = formattedValue;
            if(phone.value.length!=0)
            {
                const phone_check=document.getElementById("phone_check");
                const button=document.getElementById("button");
                if (phone.value.length < 12)
                {
                    phone_check.innerHTML="Phone number invalid";
                    phone_check.style.color="red";
                    button.disabled=true;
                }
                else
                {
                    phone_check.innerHTML=null;
                    button.disabled=false;
                }
            }
            else
            {
                phone_check.innerHTML=null;
                button.disabled=false;
            }
        }
    );
</script>
</body>
