<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.e_space.model.User" %>
<%
    // Destroy the session and redirect to login page
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
