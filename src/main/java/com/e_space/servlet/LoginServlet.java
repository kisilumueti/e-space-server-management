package com.e_space.servlet;

import com.e_space.dao.UserDAO;
import com.e_space.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get email and password from request and trim them
        String email = request.getParameter("email") != null ? request.getParameter("email").trim() : "";
        String password = request.getParameter("password") != null ? request.getParameter("password").trim() : "";

        // Check if email or password is empty
        if (email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=Email and password are required");
            return;
        }

        // Initialize DAO and attempt login
        UserDAO userDAO = new UserDAO();
        User user = userDAO.loginUser(email, password);

        if (user != null) {
            // Invalidate previous session (if any) and create a new one
            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }

            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole());

            // Set session timeout (optional, for security)
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // Redirect based on role
            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("user.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=Invalid email or password");
        }
    }
}
