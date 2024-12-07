<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ParaEnsias</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            height: 100vh;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
        }

        /* Dynamic Background */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #6a11cb, #2575fc, #ff6b6b, #ffcc00);
            background-size: 300% 300%;
            animation: gradient 15s ease infinite;
            z-index: -1;
        }

        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        /* Login Container */
        .login-container {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.85);
            color: white;
            padding: 60px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1.5s ease-out;
            max-width: 400px;
            width: 100%;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.8);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .login-title {
            font-size: 2.4rem;
            margin-bottom: 20px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.4);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: #1e90ff;
            box-shadow: 0 0 8px rgba(30, 144, 255, 0.5);
        }

        .login-button {
            display: inline-block;
            padding: 12px 35px;
            color: white;
            background-color: #1e90ff;
            text-decoration: none;
            font-size: 1.1rem;
            font-weight: 500;
            border-radius: 50px;
            box-shadow: 0 5px 15px rgba(30, 144, 255, 0.4);
            transition: background-color 0.4s ease, transform 0.3s ease, box-shadow 0.3s ease;
            width: 100%;
            border: none;
        }

        .login-button:hover {
            background-color: #0056b3;
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(30, 144, 255, 0.6);
        }

        .forgot-password, .no-account {
            color: #bbb;
            font-size: 0.9rem;
            margin-top: 10px;
            display: inline-block;
            transition: color 0.3s ease;
        }

        .forgot-password:hover, .no-account:hover {
            color: white;
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .login-container {
                padding: 40px 20px;
            }

            .login-title {
                font-size: 2rem;
            }

            .login-button {
                font-size: 1rem;
                padding: 10px 25px;
            }
        }
    </style>
</head>
<body>
<div>
    <c:if test="${not requestScope.first_login}">
        <script>
            window.onload=function ()
            {
                const errorMessage = "${requestScope.alert}";
                alertDiv=document.getElementById("alert");
                alertDiv.innerText = errorMessage;
                alertDiv.style.color = "red";
            }
        </script>
    </c:if>
</div>
<div class="login-container" style="overflow: auto;max-height: 90vh">
    <h1 class="login-title">Sign up to ParaEnsias</h1>
    <form action="${pageContext.request.contextPath}/SignupServlet" method="post">
        <label for="first_name">First name</label>
        <input id="first_name" name="first_name" type="text" class="form-control" placeholder="First name" required>
        <label for="last_name">Last name</label>
        <input id="last_name" name="last_name" type="text" class="form-control" placeholder="Last name" required>
        <label for="massar">Massar</label>
        <input id="massar" name="massar" type="text" class="form-control" placeholder="Massar" required>
        <label for="phone">Phone number</label>
        <input id="phone" name="phone" type="tel" class="form-control" placeholder="Phone" required>
        <div id="phone_check" style="margin-top: 0"></div>
        <label for="password">Password</label>
        <input id="password" name="password" type="password" class="form-control" placeholder="Password" required>
        <label for="passwordc">Confirm password</label>
        <input id="passwordc" name="passwordc" type="password" class="form-control" placeholder="Confirm password" required>
        <label for="sexe">Sexe</label>
        <select id="sexe" name="sexe" class="form-control">
            <option value="">Sexe</option>
            <option value="M">M</option>
            <option value="F">F</option>
        </select>
        <div id="match" style="margin-top: 0"></div>
        <div id="length" style="margin-top: 0"></div>
        <button id="button" type="submit" class="login-button">Sign up</button>
        <h>Already have an account? </h><a href="Login.jsp" class="no-account">Log In</a>
    </form>
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
        const password = document.getElementById("password");
        const passwordc = document.getElementById("passwordc")
        const match = document.getElementById("match");
        const length = document.getElementById("length");
        const test = document.getElementById("test");
        passwordc.disabled=true;
        passwordc.value=null;
        match.innerHTML=null;
        length.innerHTML=null;
        password.addEventListener("input",function()
            {
                if(passwordc.value.length!=0)
                {
                    if(password.value!=passwordc.value)
                    {
                        match.style.color="red";
                        match.innerHTML="Passwords don't match";
                        button.disabled=true;
                        event.preventDefault();
                    }
                    else
                    {
                        match.innerHTML=null;
                        button.disabled=false;
                    }
                }
            }
        );
        passwordc.addEventListener("input",function()
            {
                if(password.value!=passwordc.value)
                {
                    match.style.color="red";
                    match.innerHTML="Passwords don't match";
                    button.disabled=true;
                    event.preventDefault();
                }
                else
                {
                    match.innerHTML=null;
                    button.disabled=false;
                }
            }
        );
        password.addEventListener("input",function()
            {
                if(passwordc.value.length!=0)
                {
                    if(password.value.length<8 || passwordc.value.length<8)
                    {
                        length.style.color="red";
                        length.innerHTML="password must be at least 8 characters";
                        button.disabled=true;
                        event.preventDefault();
                    }
                    else
                    {
                        length.innerHTML=null;
                        button.disabled=false;
                    }
                }
            }
        );
        passwordc.addEventListener("input",function()
            {
                if(password.value.length<8 || passwordc.value.length<8)
                {
                    length.style.color="red";
                    length.innerHTML="password must be at least 8 characters";
                    button.disabled=true;
                    event.preventDefault();
                }
                else
                {
                    length.innerHTML=null;
                    button.disabled=false;
                }
            }
        );

        function checkIfEmpty()
        {
            if(passwordc.value.length==0)
            {
                passwordc.disabled = true;
                passwordc.value=null;
                match.innerHTML =null;
                length.innerHTML=null;
            }
            if(password.value.length==0)
            {
                passwordc.disabled = true;
                passwordc.value=null;
                match.innerHTML =null;
                length.innerHTML=null;
            }
            else
            {
                passwordc.disabled=false;
            }
        }

        password.addEventListener("input", checkIfEmpty);
        password.addEventListener("blur", checkIfEmpty);
        passwordc.addEventListener("input", checkIfEmpty);
        passwordc.addEventListener("blur", checkIfEmpty);

    </script>
</div>
</body>
</html>
