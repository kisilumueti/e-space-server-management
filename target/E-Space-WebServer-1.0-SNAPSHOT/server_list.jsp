<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.e_space.dao.ServerDAO, com.e_space.model.Server" %>
<%@ page import="java.util.List" %>
<%
    ServerDAO serverDAO = new ServerDAO();
    List<Server> serverList = serverDAO.getAllServers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Server List - E-Space</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            display: flex;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #343a40;
            color: white;
            position: fixed;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 10px;
            display: block;
            color: white;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .sidebar-heading {
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .main-content {
            margin-left: 260px;
            width: 100%;
            padding: 20px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-heading">E-SPACE Web Server</div>
        <a href="user.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="manage_servers.jsp"><i class="fas fa-server"></i> Manage Servers</a>
        <a href="security.jsp"><i class="fas fa-shield-alt"></i> Security & Privacy</a>
        <a href="settings.jsp"><i class="fas fa-cogs"></i> Settings</a>
        <a href="logout.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">E-SPACE Web Server Management</a>
                <div class="ms-auto">
                    <a href="settings.jsp" class="btn btn-outline-primary"><i class="fas fa-key"></i> Change Password</a>
                </div>
            </div>
        </nav>

        <!-- Server Management Section -->
        <div class="container mt-4">
            <h2>Server Management</h2>

            <%-- Display Success Message --%>
            <% String successMessage = request.getParameter("success"); %>
            <% if (successMessage != null) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Success:</strong> <%= successMessage %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <%-- Display Error Message --%>
            <% String errorMessage = request.getParameter("error"); %>
            <% if (errorMessage != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Error:</strong> <%= errorMessage %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <table class="table table-striped mt-3">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Server Name</th>
                    <th>IP Address</th>
                    <th>Operating System</th>
                    <th>Status</th>
                    <th>Created At</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <% for (Server server : serverList) { %>
                    <tr id="row-<%= server.getServerId() %>">
                        <td><%= server.getServerId() %></td>
                        <td><%= server.getServerName() %></td>
                        <td><%= server.getIpAddress() %></td>
                        <td><%= server.getOperatingSystem() %></td>
                        <td>
                            <% if ("Active".equals(server.getStatus())) { %>
                                <span class="badge bg-success">Active</span>
                            <% } else { %>
                                <span class="badge bg-danger">Inactive</span>
                            <% } %>
                        </td>
                        <td><%= server.getCreatedAt() %></td>
                        <td>
                            <a href="edit_server.jsp?serverId=<%= server.getServerId() %>" class="btn btn-warning btn-sm">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <button class="btn btn-danger btn-sm delete-server" data-id="<%= server.getServerId() %>">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>

<script>
    $(document).ready(function () {
        $(".delete-server").click(function () {
            let serverId = $(this).data("id");
            if (confirm("Are you sure you want to delete this server?")) {
                $.post("DeleteServerServlet", {serverId: serverId}, function (response) {
                    if (response.trim() === "success") {
                        $("#row-" + serverId).fadeOut();
                    } else {
                        alert("Failed to delete the server.");
                    }
                });
            }
        });
    });
</script>

</body>
</html>
