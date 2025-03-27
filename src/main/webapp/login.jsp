<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - E-Space</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: 80px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <h3 class="text-center">E-Space Login</h3>
            
            <!-- Error Message (if exists) -->
            <div id="error-message" class="alert alert-danger text-center d-none"></div>

            <form action="login" method="post" id="loginForm">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember Me</label>
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
                <div class="text-center mt-2">
                    <a href="register.jsp">Create an Account</a> | 
                    <a href="#">Forgot Password?</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Show error message from URL
        $(document).ready(function() {
            const urlParams = new URLSearchParams(window.location.search);
            const errorMsg = urlParams.get("error");
            if (errorMsg) {
                $("#error-message").text(errorMsg).removeClass("d-none");
            }

            // Remember email using localStorage
            if (localStorage.getItem("rememberMe") === "true") {
                $("#email").val(localStorage.getItem("savedEmail"));
                $("#rememberMe").prop("checked", true);
            }

            // Save email when 'Remember Me' is checked
            $("#rememberMe").on("change", function() {
                if (this.checked) {
                    localStorage.setItem("savedEmail", $("#email").val());
                    localStorage.setItem("rememberMe", "true");
                } else {
                    localStorage.removeItem("savedEmail");
                    localStorage.removeItem("rememberMe");
                }
            });
        });
    </script>
</body>
</html>
