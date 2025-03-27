<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="com.e_space.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String successMessage = request.getParameter("success");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings - Change Password</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #343a40;
            color: white;
            padding-top: 20px;
            position: fixed;
            transition: all 0.3s;
        }
        .sidebar a {
            color: white;
            padding: 10px;
            display: block;
            text-decoration: none;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .logout {
            color: red;
        }
        .content {
            margin-left: 260px;
            padding: 20px;
            width: 100%;
        }
        .card {
            border-radius: 10px;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: scale(1.02);
        }
    </style>
    <script>
        function validateForm() {
            let newPassword = document.getElementById("newPassword").value;
            let confirmPassword = document.getElementById("confirmPassword").value;
            let feedback = document.getElementById("feedback");
            if (newPassword.length < 6) {
                feedback.innerHTML = "<div class='alert alert-danger'>New password must be at least 6 characters long.</div>";
                return false;
            }
            if (newPassword !== confirmPassword) {
                feedback.innerHTML = "<div class='alert alert-danger'>Passwords do not match!</div>";
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center">E-SPACE Web Server</h4>
        <a href="user.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="manage_servers.jsp"><i class="fas fa-server"></i> Manage Servers</a>
        <a href="security.jsp"><i class="fas fa-shield-alt"></i> Security & Privacy</a>
        <a href="settings.jsp"><i class="fas fa-cogs"></i> Settings</a>
        <a href="logout.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
    
    <div class="content">
        <h2 class="text-center"><i class="fas fa-key"></i> Change Password</h2>
        <% if (successMessage != null) { %>
            <div class="alert alert-success text-center"><i class="fas fa-check-circle"></i> <%= successMessage %></div>
        <% } %>
        <div id="feedback"></div>
        <div class="card shadow-lg p-4 mt-4">
            <form action="UpdatePasswordServlet" method="post" onsubmit="return validateForm();">
                <input type="hidden" name="username" value="<%= user.getUsername() %>">
                <div class="mb-3">
                    <label for="currentPassword" class="form-label"><i class="fas fa-lock"></i> Current Password</label>
                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                </div>
                <div class="mb-3">
                    <label for="newPassword" class="form-label"><i class="fas fa-lock-open"></i> New Password</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label"><i class="fas fa-check"></i> Confirm New Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                </div>
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Update Password</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
