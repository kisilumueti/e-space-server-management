package com.e_space.servlet;

import com.e_space.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin-dashboard"})
public class AdminDashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Avoid creating a new session

        // Check if session exists and if admin is logged in
        if (session == null || session.getAttribute("userRole") == null || 
            !session.getAttribute("userRole").equals("admin")) {
            response.sendRedirect("login.jsp?error=Unauthorized Access");
            return;
        }

        try {
            // Fetch total user count from DAO
            UserDAO userDAO = new UserDAO();
            int totalUsers = userDAO.getTotalUsers();

            // Set attributes for JSP
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("rating", 4.3);  // Static rating for now

            // Forward to admin dashboard JSP
            request.getRequestDispatcher("admin.jsp").forward(request, response);

        } catch (ServletException | IOException e) {
            response.sendRedirect("error.jsp?message=Failed to load dashboard");
        }
    }
}
