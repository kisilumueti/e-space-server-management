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

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user"); // Retrieve user from session

        if (user == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if user is not authenticated
            return;
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("user.jsp").forward(request, response); // Forward user data to JSP
    }
}
