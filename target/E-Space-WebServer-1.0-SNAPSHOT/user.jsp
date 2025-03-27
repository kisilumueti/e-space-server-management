<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.e_space.model.User" %>
<%
    // Ensure user is logged in
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect if not logged in
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - E-Space</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Custom Styles -->
    <link rel="stylesheet" href="styles.css">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }

        /* Sidebar */
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
            transition: all 0.3s;
        }

        .sidebar .sidebar-heading {
            font-size: 1.5rem;
            font-weight: bold;
            color: #ffffff;
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .sidebar .nav-link {
            color: #ffffff;
            padding: 12px 20px;
            display: block;
            transition: background 0.3s;
        }

        .sidebar .nav-link:hover {
            background-color: #495057;
        }

        .sidebar .logout {
            background-color: #dc3545;
            transition: background 0.3s;
        }

        .sidebar .logout:hover {
            background-color: #bb2d3b;
        }

        /* Page Content */
        #page-content-wrapper {
            margin-left: 250px;
            padding: 20px;
            transition: all 0.3s;
        }

        /* Toggle Menu */
        #menu-toggle {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }

        #menu-toggle:hover {
            background-color: #0056b3;
        }

        .navbar {
            background-color: #ffffff;
            border-bottom: 2px solid #ddd;
            padding: 10px 20px;
        }

        .navbar h3 {
            margin: 0;
            font-weight: bold;
            color: #007bff;
        }

        .card {
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        /* Responsive Sidebar */
        @media (max-width: 768px) {
            .sidebar {
                width: 0;
                overflow: hidden;
            }

            #page-content-wrapper {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar-wrapper">
        <div class="sidebar-heading">E-SPACE Web Server</div>
        <a href="user.jsp" class="nav-link"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="profile.jsp" class="nav-link"><i class="fas fa-user"></i> Profile</a>
        <a href="manage_servers.jsp" class="nav-link"><i class="fas fa-server"></i> Manage Servers</a>
        <a href="security.jsp" class="nav-link"><i class="fas fa-shield-alt"></i> Security & Privacy</a>
        <a href="settings.jsp" class="nav-link"><i class="fas fa-cogs"></i> Settings</a>
        <a href="logout.jsp" class="nav-link logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <nav class="navbar">
            <button id="menu-toggle"><i class="fas fa-bars"></i> Toggle Menu</button>
            <h3 class="ms-auto">E-SPACE Web Server Management System</h3>
        </nav>

        <div class="container mt-4">
            <h2>Welcome, <%= user.getUsername() %> 👋</h2>
            <p>Manage your web servers and account settings from here.</p>

            <div class="row">
                <div class="col-lg-4">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-server"></i> Server Management</h5>
                            <p class="card-text">View and maintain your web servers.</p>
                            <a href="manage_servers.jsp" class="btn btn-primary">Go to Servers</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-shield-alt"></i> Security & Privacy</h5>
                            <p class="card-text">Manage security settings and policies.</p>
                            <a href="security.jsp" class="btn btn-warning">Security Settings</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-cogs"></i> Account Settings</h5>
                            <p class="card-text">Update your profile and preferences.</p>
                            <a href="settings.jsp" class="btn btn-success">Edit Profile</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        document.getElementById("menu-toggle").addEventListener("click", function () {
            let sidebar = document.getElementById("sidebar-wrapper");
            let content = document.getElementById("page-content-wrapper");

            if (sidebar.style.width === "250px" || sidebar.style.width === "") {
                sidebar.style.width = "0";
                content.style.marginLeft = "0";
            } else {
                sidebar.style.width = "250px";
                content.style.marginLeft = "250px";
            }
        });
    </script>

</body>
</html>
