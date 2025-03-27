<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.e_space.dao.ServerDAO, com.e_space.model.Server" %>
<%@ page import="java.sql.Timestamp" %>
<%
    int serverId = Integer.parseInt(request.getParameter("serverId"));
    ServerDAO serverDAO = new ServerDAO();
    Server server = serverDAO.getServerById(serverId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Server</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <h2>Edit Server</h2>
    <form id="editServerForm" class="mt-4">
        <input type="hidden" name="serverId" value="<%= server.getServerId() %>">

        <div class="mb-3">
            <label class="form-label">Server Name</label>
            <input type="text" class="form-control" name="serverName" value="<%= server.getServerName() %>" required>
        </div>
        
        <div class="mb-3">
            <label class="form-label">IP Address</label>
            <input type="text" class="form-control" name="ipAddress" value="<%= server.getIpAddress() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Operating System</label>
            <input type="text" class="form-control" name="operatingSystem" value="<%= server.getOperatingSystem() %>" required>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Status</label>
            <select class="form-select" name="status" required>
                <option value="active" <%= server.getStatus().equals("active") ? "selected" : "" %>>Active</option>
                <option value="inactive" <%= server.getStatus().equals("inactive") ? "selected" : "" %>>Inactive</option>
                <option value="maintenance" <%= server.getStatus().equals("maintenance") ? "selected" : "" %>>Maintenance</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Update Server</button>
        <a href="manage_servers.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<script>
    $(document).ready(function () {
        $("#editServerForm").submit(function (event) {
            event.preventDefault();
            $.ajax({
                type: "POST",
                url: "UpdateServerServlet",
                data: $(this).serialize(),
                success: function (response) {
                    if (response.trim() === "success") {
                        alert("Server updated successfully!");
                        window.location.href = "manage_servers.jsp";
                    } else {
                        alert("Server updated successfully!");
                    }
                }
            });
        });
    });
</script>
</body>
</html>
