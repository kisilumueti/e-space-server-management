<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Web Servers - E-Space</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            display: flex;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background: #343a40;
            padding-top: 20px;
            position: fixed;
        }
        .sidebar a {
            color: white;
            padding: 10px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .content {
            margin-left: 260px;
            width: 100%;
            padding: 20px;
        }
        .top-bar {
            background: #343a40;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: calc(100% - 250px);
            left: 250px;
            top: 0;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center text-white">E-SPACE</h4>
        <a href="user.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="manage_servers.jsp"><i class="fas fa-server"></i> Manage Servers</a>
        <a href="security.jsp"><i class="fas fa-shield-alt"></i> Security & Privacy</a>
        <a href="settings.jsp"><i class="fas fa-cogs"></i> Settings</a>
        <a href="logout.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
    
    <!-- Main Content -->
    <div class="content">
        <div class="top-bar">
            <h5>E-SPACE Web Server Management System</h5>
            <a href="settings.jsp" class="btn btn-light">Change Password</a>
        </div>
        
        <div class="container mt-5 pt-5">
            <h2 class="mb-4 text-center">Manage Web Servers</h2>
            
            <% String successMessage = request.getParameter("success"); %>
            <% if (successMessage != null) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Success:</strong> <%= successMessage %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>
            
            <% String errorMessage = request.getParameter("error"); %>
            <% if (errorMessage != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Error:</strong> <%= errorMessage %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>
            
            <div class="card shadow-lg p-4">
                <div class="list-group">
                    <a href="add_server.jsp" class="list-group-item list-group-item-action list-group-item-success">
                        <strong>➕ Register New Server</strong>
                    </a>
                    <a href="server_list.jsp" class="list-group-item list-group-item-action list-group-item-primary">
                        <strong>📋 View & Manage Servers</strong>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
