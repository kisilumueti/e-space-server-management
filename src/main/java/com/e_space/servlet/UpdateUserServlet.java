package com.e_space.servlet;

import com.e_space.dao.UserDAO;
import com.e_space.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateUserServlet", urlPatterns = {"/UpdateUserServlet"})
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the form
        Long userId = Long.parseLong(request.getParameter("user_id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        // Create a User object
        User user = new User(userId, username, email, phone, null, role, null);

        // Update user details in the database
        UserDAO userDAO = new UserDAO();
        boolean success = userDAO.updateUser(user);

        // Redirect based on update result
        if (success) {
            response.sendRedirect("admin.jsp?success=User updated successfully");
        } else {
            response.sendRedirect("edit_user.jsp?error=Failed to update user");
        }
    }
}
