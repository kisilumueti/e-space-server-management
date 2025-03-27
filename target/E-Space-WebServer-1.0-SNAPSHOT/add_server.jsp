<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Server</title>
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
            top: 0;
            left: 0;
        }
        .sidebar-heading {
            text-align: center;
            color: white;
            font-size: 1.5em;
            margin-bottom: 20px;
        }
        .nav-link {
            display: block;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
        }
        .nav-link:hover {
            background: #495057;
        }
        .logout {
            position: absolute;
            bottom: 20px;
            width: 100%;
        }
        .content {
            margin-left: 270px;
            padding: 20px;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar" id="sidebar-wrapper">
    <div class="sidebar-heading"><i class="fas fa-server"></i> E-SPACE Web Server</div>
    <a href="user.jsp" class="nav-link"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
    <a href="profile.jsp" class="nav-link"><i class="fas fa-user"></i> Profile</a>
    <a href="manage_servers.jsp" class="nav-link"><i class="fas fa-server"></i> Manage Servers</a>
    <a href="security.jsp" class="nav-link"><i class="fas fa-shield-alt"></i> Security & Privacy</a>
    <a href="settings.jsp" class="nav-link"><i class="fas fa-cogs"></i> Settings</a>
    <a href="logout.jsp" class="nav-link logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

<!-- Main Content -->
<div class="content">
    <h2 class="mb-4"><i class="fas fa-plus-circle"></i> Add New Server</h2>

    <%-- Display error message if present --%>
    <%
        String errorMessage = request.getParameter("error");
        if (errorMessage != null) {
    %>
    <div class="alert alert-danger"><i class="fas fa-exclamation-triangle"></i> <%= errorMessage %></div>
    <% } %>

    <form action="AddServerServlet" method="post">
        <div class="mb-3">
            <label class="form-label"><i class="fas fa-server"></i> Server Name</label>
            <input type="text" name="serverName" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fas fa-network-wired"></i> IP Address</label>
            <input type="text" name="ipAddress" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fas fa-desktop"></i> Operating System</label>
            <input type="text" name="operatingSystem" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fas fa-toggle-on"></i> Status</label>
            <select name="status" class="form-select" required>
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
                <option value="maintenance">Maintenance</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Add Server</button>
        <a href="server_list.jsp" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Cancel</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
