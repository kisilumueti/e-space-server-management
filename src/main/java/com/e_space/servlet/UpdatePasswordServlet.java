package com.e_space.servlet;

import com.e_space.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdatePasswordServlet")  // ✅ Ensure this matches the URL pattern
public class UpdatePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        UserDAO userDAO = new UserDAO();
        boolean isUpdated = userDAO.updatePassword(username, currentPassword, newPassword);

        if (isUpdated) {
            response.sendRedirect("user.jsp?success=Password updated successfully!");
        } else {
            response.sendRedirect("settings.jsp?error=Invalid current password.");
        }
    }
}
