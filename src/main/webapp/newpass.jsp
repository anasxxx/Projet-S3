
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="token_hash" scope="request" type="java.lang.String"/>
<jsp:useBean id="id" scope="request" type="java.lang.Integer"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ParaEnsias</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        :root {
            --background-color: #092e86;
            --navbar-color: #092e86;
            --sidebar-color: #092e86    ;
            --blue-color: #6096BA;
            --light-color: #A3CEF1;
        }

        body {
            margin: 0;
            height: 100vh;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background: url("img/bg.jpg");
            object-fit: fill;
            background-size: cover;
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

</div>
<div class="login-container">
    <h1 class="login-title">Change Password</h1>
    <form id="form" action="${pageContext.request.contextPath}/SavepassServlet" method="post">
        <input id="password" name="password" type="password" class="form-control" placeholder="Password" required>
        <input id="passwordc" name="password" type="password" class="form-control" placeholder="Confirm Password" required>
        <input type="hidden" name="token_hash" value="${token_hash}"/>
        <input type="hidden" name="id" value="${id}"/>
        <div id="match" style="margin-top: 0"></div>
        <div id="length" style="margin-top: 0"></div>

        <button id="button" type="submit" class="login-button">Confirm</button>
    </form>
    <script>
        const password = document.getElementById("password");
        const passwordc = document.getElementById("passwordc")
        const match = document.getElementById("match");
        const length = document.getElementById("length");
        const button = document.getElementById("button");
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
