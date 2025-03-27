package com.e_space.servlet;

import com.e_space.dao.ServerDAO;
import com.e_space.model.Server;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/UpdateServerServlet")
public class UpdateServerServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(UpdateServerServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int serverId = Integer.parseInt(request.getParameter("serverId"));
            String serverName = request.getParameter("serverName");
            String ipAddress = request.getParameter("ipAddress");
            String operatingSystem = request.getParameter("operatingSystem");
            String status = request.getParameter("status");
            String userIdParam = request.getParameter("userId");
            Long userId = (userIdParam != null && !userIdParam.isEmpty()) ? Long.parseLong(userIdParam) : null;

            ServerDAO serverDAO = new ServerDAO();
            Server server = serverDAO.getServerById(serverId);

            if (server != null) {
                server.setServerName(serverName);
                server.setIpAddress(ipAddress);
                server.setOperatingSystem(operatingSystem);
                server.setStatus(status);
                server.setUserId(userId);
                
                boolean isUpdated = serverDAO.updateServer(server);

                if (isUpdated) {
                    response.sendRedirect("manage_servers.jsp?success=Server updated successfully");
                } else {
                    response.sendRedirect("edit_server.jsp?serverId=" + serverId + "&error=Failed to update server");
                }
            } else {
                response.sendRedirect("manage_servers.jsp?error=Server not found");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating server", e);
            response.sendRedirect("manage_servers.jsp?error=An unexpected error occurred");
        }
    }
}
