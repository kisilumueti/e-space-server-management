package com.e_space.servlet;

import com.e_space.dao.ServerDAO;
import com.e_space.model.Server;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditServerServlet")
public class EditServerServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private final ServerDAO serverDAO = new ServerDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int serverId = Integer.parseInt(request.getParameter("serverId"));
            String serverName = request.getParameter("serverName");
            String ipAddress = request.getParameter("ipAddress");
            String operatingSystem = request.getParameter("operatingSystem");
            String status = request.getParameter("status");

            Server existingServer = serverDAO.getServerById(serverId);
            if (existingServer == null) {
                request.setAttribute("error", "Server not found");
                request.getRequestDispatcher("edit_server.jsp").forward(request, response);
                return;
            }

            existingServer.setServerName(serverName);
            existingServer.setIpAddress(ipAddress);
            existingServer.setOperatingSystem(operatingSystem);
            existingServer.setStatus(status);

            boolean isUpdated = serverDAO.updateServer(existingServer);
            if (isUpdated) {
                response.sendRedirect("server_list.jsp?success=Server updated successfully");
            } else {
                request.setAttribute("error", "Failed to update server");
                request.getRequestDispatcher("edit_server.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid server ID");
            request.getRequestDispatcher("edit_server.jsp").forward(request, response);
        }
    }
}
