<%@ page import="com.e_space.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sessionObj = request.getSession(false);
    User loggedInUser = (sessionObj != null) ? (User) sessionObj.getAttribute("user") : null;
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp?error=Please login first");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - E-Space</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar .nav-link {
            color: white;
            padding: 12px 20px;
        }
        .sidebar .nav-link:hover {
            background-color: #495057;
        }
        .sidebar .logout {
            background-color: #dc3545;
        }
        .sidebar .logout:hover {
            background-color: #bb2d3b;
        }
        #content-wrapper {
            margin-left: 250px;
            padding: 20px;
        }
        .profile-container {
            display: flex;
            align-items: center;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .profile-icon {
            font-size: 80px;
            color: #007bff;
            margin-right: 20px;
        }
        .navbar {
            background-color: #ffffff;
            border-bottom: 2px solid #ddd;
            padding: 10px 20px;
        }
    </style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="sidebar-heading text-center text-white fw-bold mb-3">E-SPACE Web Server</div>
        <a href="user.jsp" class="nav-link"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="profile.jsp" class="nav-link active"><i class="fas fa-user"></i> Profile</a>
        <a href="manage_servers.jsp" class="nav-link"><i class="fas fa-server"></i> Manage Servers</a>
        <a href="security.jsp" class="nav-link"><i class="fas fa-shield-alt"></i> Security & Privacy</a>
        <a href="settings.jsp" class="nav-link"><i class="fas fa-cogs"></i> Settings</a>
        <a href="logout.jsp" class="nav-link logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
    
    <!-- Page Content -->
    <div id="content-wrapper">
        <nav class="navbar d-flex justify-content-between">
            <h3 class="fw-bold">E-SPACE Web Server Management System</h3>
            <a href="settings.jsp" class="btn btn-warning">Change Password</a>
        </nav>
        
        <div class="container mt-4">
            <div class="profile-container">
                <i class="fas fa-user-circle profile-icon"></i>
                <div>
                    <h2><%= loggedInUser.getUsername() %></h2>
                    <p>Email: <%= loggedInUser.getEmail() %></p>
                    <p>Phone: <%= loggedInUser.getPhone() %></p>
                    <a href="settings.jsp" class="btn btn-primary">Edit Profile</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
