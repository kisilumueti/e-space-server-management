package com.e_space.servlet;

import com.e_space.dao.ServerDAO;
import com.e_space.model.Server;
import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddServerServlet")
public class AddServerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ServerDAO serverDAO;

    @Override
    public void init() {
        serverDAO = new ServerDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String serverName = request.getParameter("serverName");
        String ipAddress = request.getParameter("ipAddress");
        String operatingSystem = request.getParameter("operatingSystem");
        String status = request.getParameter("status");

        Server server = new Server(serverName, ipAddress, operatingSystem, status);
        boolean success = serverDAO.addServer(server);

        if (success) {
            response.sendRedirect("manage_servers.jsp?success=Server added successfully");
        } else {
            request.setAttribute("errorMessage", "Error adding server.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("add_server.jsp");
            dispatcher.forward(request, response);
        }
    }
}
