<%--
  Created by IntelliJ IDEA.
  user: pc
  Date: 11/23/2024
  Time: 7:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp"/>
<script>
    function editCell(cell,id,parameter) {
        const originalContent = cell.innerText;
        const input = document.createElement('input');
        input.type = 'text';
        input.value = originalContent;

        // AJAX request to update the product
        function sendUpdate(id,value)
        {
            $.ajax({
                url: "${pageContext.request.contextPath}/ModifyinfosServlet",
                method: "POST",
                data: {
                    id:id,
                    parameter: parameter,
                    value: value
                },
                success: function(response)
                {
                    console.log("Update successful:", response);
                },
                error: function(xhr, status, error)
                {
                    console.error("Update failed:", error);
                }
            });
        }

        input.onblur = function() {
            cell.innerText = this.value;
        }

        // Listen for the "keypress" event
        input.onkeypress = function(event) {
            if (event.key === "Enter") {
                const value = this.value;
                cell.innerText = value;
                sendUpdate(id ,value); // Send update on Enter key press
            }
        };

        cell.innerHTML = '';
        cell.appendChild(input);
        input.focus();
    }

</script>
<body>
<table class="table table-bordered" style="width: 50vw;pointer-events: none">
    <tbody>
    <tr>
        <th>ID</th>
        <td>${user.id}</td>
    </tr>
    <tr>
        <th>First Name</th>
        <td>${user.first_name}</td>
    </tr>
    <tr>
        <th>Last Name</th>
        <td>${user.last_name}</td>
    </tr>
    <tr style="pointer-events: all">
        <th>E-mail</th>
        <td>${user.email}</td>
    </tr>
    <tr>
        <th>Massar</th>
        <td>${user.massar}</td>
    </tr>
    <tr style="pointer-events: all">
        <th>Phone</th>
        <td id="phone" contenteditable="true" onclick="editCell(this,'${user.id}','phone')">${user.phone}</td>
    </tr>
    <tr>
        <th>sexe</th>
        <td>${user.sexe}</td>
    </tr>
    <tr>
        <th>Role</th>
        <td>${user.role}</td>
    </tr>
    <tr>
        <th>Created at</th>
        <td>${user.created_at}</td>
    </tr>
    <tr>
        <th>Last Updated</th>
        <td>${user.updated_at}</td>
    </tr>
    </tbody>
</table>
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
            phone.innerText = formattedValue;
        }
    );

</script>
</body>
