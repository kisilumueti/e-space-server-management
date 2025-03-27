<%@ page import="com.e_space.dao.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.e_space.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDAO userDAO = new UserDAO();
    int totalUsers = userDAO.getTotalUsers();  // Get total user count from DB
    double rating = 4.3;  // Static rating for now
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            display: flex;
            min-height: 100vh;
            background-color: #f4f4f4;
        }
        .sidebar {
            width: 250px;
            background: #343a40;
            color: white;
            height: 100vh;
            padding-top: 20px;
            position: fixed;
        }
        .sidebar a {
            color: white;
            padding: 15px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            width: 100%;
        }
        .dashboard-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .curve-box {
            background: linear-gradient(135deg, #4CAF50, #2E7D32);
            border-radius: 15px;
            padding: 20px;
            color: white;
            text-align: center;
        }
        .curve-box h2 {
            font-size: 2.5rem;
        }
        .rating {
            font-size: 1.2rem;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <h3 class="text-center">Admin Panel</h3>
        <a href="admin.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="manage_users.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="manage_servers.jsp"><i class="fas fa-server"></i> Manage Servers</a>
        <a href="security_policies.jsp"><i class="fas fa-shield-alt"></i> Security Policies</a>
        <a href="settings.jsp"><i class="fas fa-cogs"></i> Settings</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Welcome, Admin</h2>
        <hr>

        <!-- Curved Box Section -->
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="curve-box">
                    <h2><i class="fas fa-users"></i> <%= totalUsers %> Users</h2>
                    <div class="rating">
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star-half-alt text-warning"></i>
                        <p>Rating: <b>4.3/5</b></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Admin Functionalities -->
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h4><i class="fas fa-users"></i> Manage Users</h4>
                    <p>View, add, and remove users.</p>
                    <a href="manage_users.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h4><i class="fas fa-server"></i> Manage Servers</h4>
                    <p>Monitor and control server resources.</p>
                    <a href="manage_servers.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h4><i class="fas fa-shield-alt"></i> Security Policies</h4>
                    <p>Define and enforce security rules.</p>
                    <a href="security_policies.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
