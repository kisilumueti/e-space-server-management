package com.e_space.servlet;

import com.e_space.dao.ServerDAO;
import com.e_space.model.Server;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/GetServerServlet")
public class GetServerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServerDAO serverDAO = new ServerDAO();
        List<Server> serverList = serverDAO.getAllServers();

        request.setAttribute("serverList", serverList);
        request.getRequestDispatcher("server_list.jsp").forward(request, response);
    }
}
