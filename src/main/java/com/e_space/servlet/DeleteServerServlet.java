package com.e_space.servlet;

import com.e_space.dao.ServerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteServerServlet")
public class DeleteServerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int serverId = Integer.parseInt(request.getParameter("serverId"));

        ServerDAO serverDAO = new ServerDAO();
        boolean success = serverDAO.deleteServer(serverId);

        response.getWriter().write(success ? "success" : "error");
    }
}
