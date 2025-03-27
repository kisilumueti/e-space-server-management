<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styles.css">
    
    <style>
        body {
            background-color: #f4f7f9;
        }
        .card {
            border-radius: 10px;
            transition: transform 0.3s ease-in-out;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .btn {
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn:hover {
            transform: translateY(-2px);
        }
        .loading-spinner {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h3 class="text-center mb-4 text-primary"><i class="bi bi-server"></i> E-SPACE Web Server Management System</h3>
        
        <div class="card shadow-lg p-4">
            <h2 class="text-center mb-4"><i class="bi bi-person-plus-fill"></i> User Registration</h2>

            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger"><%= request.getAttribute("errorMessage") %></div>
            <% } %>

            <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success">Registration successful! You can now <a href="login.jsp">Login</a>.</div>
            <% } %>

            <form action="register" method="post" onsubmit="return validatePassword()">
                <div class="mb-3">
                    <label for="username" class="form-label"><i class="bi bi-person-fill"></i> Username</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>
                
                <div class="mb-3">
                    <label for="email" class="form-label"><i class="bi bi-envelope-fill"></i> Email</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label"><i class="bi bi-telephone-fill"></i> Phone</label>
                    <input type="text" id="phone" name="phone" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="role" class="form-label"><i class="bi bi-people-fill"></i> Role</label>
                    <select id="role" name="role" class="form-select" required>
                        <option value="">Select Role</option>
                        <option value="User">User</option>
                        <option value="Admin">Admin</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label"><i class="bi bi-lock-fill"></i> Password</label>
                    <div class="input-group">
                        <input type="password" id="password" name="password" class="form-control" required>
                        <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('password')">
                            <i class="bi bi-eye-fill"></i>
                        </button>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="confirmPassword" class="form-label"><i class="bi bi-lock-fill"></i> Confirm Password</label>
                    <div class="input-group">
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                        <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('confirmPassword')">
                            <i class="bi bi-eye-fill"></i>
                        </button>
                    </div>
                    <small id="passwordError" class="text-danger" style="display:none;">Passwords do not match!</small>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-person-check"></i> Register
                    </button>
                    <div class="loading-spinner text-center mt-3">
                        <div class="spinner-border text-primary" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                </div>
            </form>

            <p class="mt-3 text-center">
                Already have an account? <a href="login.jsp">Login here</a>
            </p>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JavaScript -->
    <script>
        function togglePassword(fieldId) {
            var field = document.getElementById(fieldId);
            field.type = field.type === "password" ? "text" : "password";
        }

        function validatePassword() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var errorText = document.getElementById("passwordError");
            var spinner = document.querySelector(".loading-spinner");

            if (password !== confirmPassword) {
                errorText.style.display = "block";
                return false;
            } else {
                errorText.style.display = "none";
                spinner.style.display = "block";
                return true;
            }
        }
    </script>
</body>
</html>
