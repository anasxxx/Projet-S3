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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ParaEnsias</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        :root {
            --background-color: #092e86;
            --card-color: #000000;
            --navbar-color: #092e86;
            --sidebar-color: #092e86    ;
            --card-title-color: #000000;
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

        .navbar {
            margin: 25px 0;
            background-color: var(--navbar-color);
        }

        .sidebar {
            background-color: var(--sidebar-color);
        }

        .sidebar a {

        }
        .container{
            border-radius: 15px;
            padding: 50px;

        }
        .card {
            box-shadow: black 0px 0px 5px;
            background: rgba(240,240,240,0.5);
            backdrop-filter: blur(10px);
            border: none;
            transition: transform 0.3s;
            border-radius: 0;
        }
        a{
            text-decoration: none;
        }

        .card:hover {
            transform: scale(1.05);
        }
        .card-title{
            font-weight: bold;
            color: var(--card-title-color);
        }
        .card-text {
            color: var(--card-color);
        }

        /* Sidebar styles */
        .sidebar {
            left: 0;
            color: white;
            height: 100vh;
            width: 10%;
            position: fixed;
            overflow: hidden;
            transition: width 0.3s ease, background-color 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px 0;
            background-color: var(--sidebar-color); /* Match the navbar color */
            z-index: 1;
        }


        .sidebar.collapsed {
            width: 60px;
            position: fixed;
            overflow: hidden;
            transition: width 0.3s ease, background-color 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px 0;
            z-index: 1;

        }
        .sidebar i{
            transition: ease-in-out 0.2s;
        }
        .sidebar.collapsed i{
            opacity: 0; /* Hide icons */
            transform: scale(0); /* Shrink to invisible */
            pointer-events: none;
            transition: ease-in-out 0.2s;
        }



        /* Sidebar header */
        .sidebar-header {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            width: 100%;
            padding: 10px 15px;
            box-sizing: border-box;
        }

        .sidebar-header span {
            margin-left: 10px;
            opacity: 1;
            white-space: nowrap;
            transition: opacity 0.3s ease;
            font-size: 18px;
        }

        .sidebar.collapsed .sidebar-header span {
            opacity: 0;
            pointer-events: none;
        }

        /* Sidebar links */
        .sidebar a {
            margin-top: 10vh;
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px 0;
            width: 100%;
            box-sizing: border-box;
            opacity: 1;
            transition: background-color 0.3s ease, opacity 0.3s ease, transform 0.3s ease;
        }

        .sidebar a span {
            margin-left: 10px;
            opacity: 1;
            white-space: nowrap;
            transition: opacity 0.3s ease;
            font-size: 18px;
        }

        .sidebar.collapsed a span {
            opacity: 0;
            transform: translateX(-10px);
            pointer-events: none;
        }

        .sidebar a:hover {
            background-color: rgba(0, 0, 19, 0);
            transform: scale(1.05); /* Subtle scaling on hover */
        }

        /* Content styles */
        .content {
            min-height: 100vh;
            min-width: 100vw;
            width: calc(100% - 25vw);
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }


        /* Navbar styles */
        .navbar {
            position: sticky;
            top: 0;
            margin-top: 20px;
            z-index: 1000;
            background-color: var(--navbar-color);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 15px ;
        }

        .nav-item {
            flex-direction: column;
            border-radius: 15px;
            justify-items: center;
            justify-content: center;
            font-size: 16px;
            font-weight: 500;
            text-transform: uppercase; /* Make the text more pronounced */
            letter-spacing: 1px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }


        .nav-link {
            font-size: 16px;
            font-weight: 500;
            text-transform: uppercase; /* Make the text more pronounced */
            letter-spacing: 1px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .nav-link:hover {
            /* Slight background change on hover */
            transform: scale(1.05); /* Slightly enlarge the link on hover */
        }

        /* Active link styling */
        .nav-link.active {
            background-color: #007bff; /* Blue background for active link */
            color: white;
        }

        /* Toggle button */
        .toggle-btn {
            background: none;
            border: none;
            color: white;
            font-size: 20px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .toggle-btn:hover {
            transform: scale(1.1);
        }

        /* Table styles */
        .table {
            width: 60vw;
            background-color: rgba(0, 0, 0, 0.1); /* Light background */
            border-radius: 15px; /* Increased roundness for a more modern look */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); /* Deeper shadow */
            margin-top: 5%;
            color: white;
            border: transparent;
            overflow: hidden;
            transition: all 0.3s ease;
            position: relative;
        }


        .table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            font-family: sans-serif;
            min-width: 400px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }

        .table thead tr {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
        }
        .table th,
        .table td {
            padding: 12px 15px;
        }
        .table tbody tr.active-row {
            font-weight: bold;
            color: #009879;
        }



        .table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }

        .table tbody tr:hover {
            background-color: #ff9f00; /* Bright orange on hover */
            transform: scale(1.02); /* Slightly larger hover effect */
            transition: ease-out 0.2s;
            cursor: pointer;
        }

        .table td:first-child {
            font-weight: bold; /* Bold first column */
            color: #007bff; /* Highlight first column in blue */
        }

        .table tbody tr:hover td {
            color: black; /* Change text color on hover */
        }


        .table tfoot td {
            background-color: rgba(0, 0, 0, 0.1); /* Footer color */
            font-weight: bold;
            color: white;
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
        }

        .table .btn {
            background-color: #28a745; /* Green action buttons */
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            border-radius: 5px; /* Rounded button edges */
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .table .btn:hover {
            background-color: #218838; /* Darker green on hover */
        }

        .table .btn:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(255, 87, 34, 0.5); /* Bright focus effect for better visibility */
        }

        /* Responsive styling */
        @media (max-width: 768px) {
            .table th, .table td {
                padding: 12px; /* Smaller padding for mobile view */
                font-size: 14px; /* Smaller font for mobile */
            }
        }


        /* Footer or additional content */
        footer {
            text-align: center;
            margin-top: 30px;
            color: #fff;
            font-size: 14px;
        }
        .filter-bar {
            position: sticky;
            top: 60px; /* Adjust this value to match the navbar's height */
            z-index: 999;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(0, 0, 19, 0.5);
            padding: 10px;
            color: white;
            border-radius: 5px;
            margin: 20px 0; /* Add some spacing below the navbar */
            transition: all 0.3s ease;
        }


        /* Responsive adjustments */
        .filter-input,
        .filter-select,
        .filter-btn {
            padding: 8px;
            border: none;
            border-radius: 5px;
        }

        .filter-input {
            flex-grow: 1; /* Allows the input to grow and fill the space */
            max-width: 300px; /* Prevents it from growing too large */
        }

        .filter-select {
            max-width: 150px; /* Limit the select box width */
        }

        .filter-btn {
            background-color: #28a745;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .filter-btn:hover {
            background-color: #218838;
        }

        /* Media query for smaller screens */
        @media (max-width: 768px) {
            .filter-bar {
                flex-direction: column; /* Stack elements vertically on smaller screens */
                align-items: stretch; /* Make each element stretch to fill the container */
            }

            .filter-input,
            .filter-select,
            .filter-btn {
                width: 100%; /* Make each element take up the full width */
                margin-bottom: 10px; /* Add space between elements */
            }

            .filter-btn {
                margin-bottom: 0; /* Remove bottom margin from the button */
            }
        }

        @media (max-width: 480px) {
            .filter-input {
                font-size: 14px; /* Adjust font size for smaller screens */
            }

            .filter-btn {
                font-size: 14px; /* Adjust font size for smaller screens */
            }
        }

        .image-container {
            margin-top: 20px;
            width: 100%;
            height: auto;
            position: fixed;
            top: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .image-container img {
            height: auto;
        }

    </style>
</head>
<body>

<!-- Sidebar -->
<div id="sidebar" class="sidebar collapsed">
    <div class="sidebar-header">
        <button id="toggleSidebar" class="toggle-btn" style="pointer-events: all">☰</button>
        <span>ParaEnsias</span>
    </div>
    <a href="${pageContext.request.contextPath}/HomeServlet">
        <i class="bi bi-house">Home</i>
    </a>
    <a href="${pageContext.request.contextPath}/ProfileServlet">
        <i class="bi bi-person">Profile</i>
    </a>
    <a href="${pageContext.request.contextPath}/LogoutServlet">
        <i class="bi bi-box-arrow-right">Logout</i>
    </a>
</div>

<!-- Main content -->
<div id="mainContent" class="content shifted">
    <div class="image-container">
        <img src="img/paraensias-logo.png">
    </div>
    <!-- Navbar -->
    <c:choose>
        <c:when test="${sessionScope.role eq 'P'}">
            <section class="mt-5">
                <div class="container">
                    <div class="row text-center">
                        <!-- Users -->
                        <div class="col-md-4">
                            <a href="${pageContext.request.contextPath}/GetusersServlet">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">Users</h5>
                                        <p class="card-text ">
                                            Manage and oversee registered users in the platform. Add, edit, or remove user accounts as necessary.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Complaints -->
                        <div class="col-md-4">
                            <a href="${pageContext.request.contextPath}/login.jsp">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">Complaints</h5>
                                        <p class="card-text ">
                                            View and handle complaints submitted by users. Respond and resolve issues promptly.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Announcements -->
                        <div class="col-md-4">
                            <a href="#">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">Announcements</h5>
                                        <p class="card-text ">
                                            Create and manage announcements to keep everyone informed about the latest updates.
                                        </p>

                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="row text-center mt-4">
                        <!-- Announcements to Approve -->
                        <div class="col-md-4">
                            <a href="#">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">Announcements to Approve</h5>
                                        <p class="card-text ">
                                            Review and approve announcements submitted by club members or administrators.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Financing Requests -->
                        <div class="col-md-4">
                            <a href="#">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">Financing Requests</h5>
                                        <p class="card-text ">
                                            Oversee financing requests submitted by clubs and approve or reject as needed.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Finances -->
                        <div class="col-md-4">
                            <a href="#">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">Finances</h5>
                                        <p class="card-text ">
                                            Track and manage financial records, including club budgets and expenses.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </c:when>

        <c:when test="${sessionScope.role eq 'Chef'}">
            <section class="mt-5">
                <div class="container">
                    <div class="row text-center">
                        <!-- Complaints -->
                        <div class="col-md-4">
                            <a href="#">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">Complaints</h5>
                                        <p class="card-text ">
                                            Submit your complaints and track their status. Ensure your concerns are addressed promptly.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Announcements -->
                        <div class="col-md-4">
                            <a href="#">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">Announcements</h5>
                                        <p class="card-text ">
                                            Create and manage announcements to keep everyone informed about the latest updates.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- My Complaints -->
                        <div class="col-md-4">
                            <a href="#">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">My Complaints</h5>
                                        <p class="card-text ">
                                            Review and track the status of complaints you have submitted. Stay updated on their resolution.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="row text-center mt-4">
                        <!-- Financing Requests -->
                        <div class="col-md-4">
                            <a href="#">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">Request Financing</h5>
                                        <p class="card-text ">
                                            Submit a financing request for your club and track its approval status.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- My Financing Requests -->
                        <div class="col-md-4">
                            <a href="#">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">My Financing Requests</h5>
                                        <p class="card-text ">
                                            Track and manage the financing requests you have submitted for your club.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </c:when>

        <c:when test="${sessionScope.role eq 'Étudiant'}">
            <section class="mt-5">
                <div class="container">
                    <div class="row text-center">
                        <!-- Announcements -->
                        <div class="col-md-4">
                            <a href="#">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title ">Announcements</h5>
                                        <p class="card-text ">
                                            Create announcements to keep everyone informed about the latest updates and news.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </c:when>
    </c:choose>


    <footer class="mt-5">
        <p class="text-center text-white-50">
            © 2024 ParaEnsias. All rights reserved.
        </p>
    </footer>


</div>


    <script>
        document.getElementById('applyFilters').addEventListener('click', function () {
            const keyword = document.getElementById('search').value.trim();
            const filterType = document.getElementById('filterType').value;

            // Example filter logic
            console.log(`Applying filters: Keyword - ${keyword}, Filter Type - ${filterType}`);
            // Implement actual filtering logic here
        });
    </script>

    <script>
        document.getElementById('toggleSidebar').addEventListener('click', function () {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('mainContent');
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('shifted');
        });

    </script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
