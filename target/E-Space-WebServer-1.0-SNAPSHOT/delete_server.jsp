<%
    int serverId = Integer.parseInt(request.getParameter("id"));
    ServerDAO serverDAO = new ServerDAO();
    boolean deleted = serverDAO.deleteServer(serverId);
    if (deleted) {
        response.sendRedirect("server_list.jsp?success=Server deleted successfully");
    } else {
        response.sendRedirect("server_list.jsp?error=Failed to delete server");
    }
%>
