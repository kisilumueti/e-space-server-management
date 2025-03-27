<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Security & Privacy Policies</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
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
            left: 0;
            top: 0;
            transition: all 0.3s;
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
            padding: 12px 20px;
            text-decoration: none;
            transition: background 0.3s;
        }
        .nav-link:hover {
            background: #495057;
            transform: scale(1.05);
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
            transition: margin-left 0.3s;
        }
        .card:hover {
            transform: scale(1.02);
            transition: 0.3s;
        }
    </style>
</head>
<body>

<!-- Sidebar Navigation -->
<div class="sidebar">
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
    <h2 class="mb-4"><i class="fas fa-lock"></i> Security & Privacy Management</h2>

    <!-- Consumer Security & Privacy Policy -->
    <div class="card mb-3">
        <div class="card-header"><i class="fas fa-user-shield"></i> Consumer Security & Privacy Policy</div>
        <div class="card-body">
            <p>We are committed to protecting your privacy and ensuring security for all transactions.</p>
            <button class="btn btn-primary" onclick="showPolicy()"><i class="fas fa-eye"></i> View Policy</button>
            <div id="policyContent" class="mt-3" style="display:none;">
                <p><strong>Data Protection:</strong> We encrypt all consumer data for privacy.</p>
                <p><strong>Usage Policy:</strong> Your information will not be shared with third parties without consent.</p>
            </div>
        </div>
    </div>

    <!-- Identify URL Authorities & Names -->
    <div class="card mb-3">
        <div class="card-header"><i class="fas fa-globe"></i> Identify URL Authorities & Names</div>
        <div class="card-body">
            <p>Enter a website URL to verify its authority:</p>
            <input type="text" id="urlInput" class="form-control mb-2" placeholder="Enter URL (e.g., https://example.com)">
            <button class="btn btn-success" onclick="checkUrl()"><i class="fas fa-search"></i> Check URL</button>
            <div id="urlResult" class="mt-3"></div>
        </div>
    </div>

    <!-- Maintain Consumer-Company Relationships -->
    <div class="card mb-3">
        <div class="card-header"><i class="fas fa-handshake"></i> Maintain Consumer & Company Relationships</div>
        <div class="card-body">
            <p>Stay updated with company policies and announcements.</p>
            <button class="btn btn-info" onclick="subscribe()"><i class="fas fa-bell"></i> Subscribe to Updates</button>
            <div id="subscribeMsg" class="mt-3"></div>
        </div>
    </div>
</div>

<script>
    function showPolicy() {
        $("#policyContent").fadeToggle();
    }

    function checkUrl() {
        let url = $("#urlInput").val().trim();
        if (url === "") {
            $("#urlResult").html("<div class='alert alert-danger'><i class='fas fa-times-circle'></i> Please enter a valid URL.</div>");
            return;
        }
        try {
            let urlObj = new URL(url);
            let authority = urlObj.hostname;
            $("#urlResult").html("<div class='alert alert-success'><i class='fas fa-check-circle'></i> URL Authority: <strong>" + authority + "</strong></div>");
        } catch (e) {
            $("#urlResult").html("<div class='alert alert-danger'><i class='fas fa-exclamation-triangle'></i> Invalid URL format.</div>");
        }
    }

    function subscribe() {
        $("#subscribeMsg").html("<div class='alert alert-success'><i class='fas fa-thumbs-up'></i> You have subscribed to company updates!</div>").hide().fadeIn(500);
    }
</script>

</body>
</html>
