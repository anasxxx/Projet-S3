<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 11/21/2024
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--
* Bootstrap Simple Admin Template
* Version: 2.1
* Author: Alexis Luna
* Website: https://github.com/alexis-luna/bootstrap-simple-admin-template
-->
<html lang="en">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ParaEnsias</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        :root {
        --background-color: #E7ECEF;
        --navbar-color: #274C77;
        --sidebar-color: #274C77;
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
            background: linear-gradient(-90deg,var(--light-color),var(--background-color));
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

        /* Welcome Container */
        .welcome-container {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.85);
            color: white;
            padding: 60px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            animation: fadeIn 0.5s ease-out;
            max-width: 400px;
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

        .welcome-title {
            font-size: 2.8rem;
            margin-bottom: 20px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .welcome-subtitle {
            font-size: 1.1rem;
            margin-bottom: 35px;
            line-height: 1.6;
            font-weight: 300;
        }

        .welcome-button {
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
        }

        .welcome-button:hover {
            background-color: #0056b3;
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(30, 144, 255, 0.6);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .welcome-container {
                padding: 40px 20px;
            }

            .welcome-title {
                font-size: 2rem;
            }

            .welcome-subtitle {
                font-size: 0.95rem;
            }

            .welcome-button {
                font-size: 1rem;
                padding: 10px 25px;
            }
        }
    </style>
</head>
<body>
<div class="welcome-container">
    <h1 class="welcome-title">Welcome to ParaEnsias</h1>
    <p class="welcome-subtitle">
        Streamline your club management and events connecting ENSIAS clubs and members smarter with ParaEnsias.    </p>
    <a href="${pageContext.request.contextPath}/LoginPageServlet" class="welcome-button">Get Started</a>
</div>
</body>
</html>
