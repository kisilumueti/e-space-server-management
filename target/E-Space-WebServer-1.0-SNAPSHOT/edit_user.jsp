<%@ page import="com.e_space.dao.UserDAO" %>
<%@ page import="com.e_space.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userIdParam = request.getParameter("id");
    int userId = Integer.parseInt(userIdParam);
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2>Edit User</h2>
    <form action="UpdateUserServlet" method="post">
        <input type="hidden" name="userId" value="<%= user.getUserId() %>">
        <div class="mb-3">
            <label>Username</label>
            <input type="text" name="username" value="<%= user.getUsername() %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Phone</label>
            <input type="text" name="phone" value="<%= user.getPhone() %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Role</label>
            <select name="role" class="form-control">
                <option value="USER" <%= "USER".equals(user.getRole()) ? "selected" : "" %>>User</option>
                <option value="ADMIN" <%= "ADMIN".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Update User</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
