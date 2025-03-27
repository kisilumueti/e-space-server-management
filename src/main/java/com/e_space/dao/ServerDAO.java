package com.e_space.dao;

import com.e_space.model.Server;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServerDAO {
    private static final Logger LOGGER = Logger.getLogger(ServerDAO.class.getName());

    // Add a new server
    public boolean addServer(Server server) {
    String query = "INSERT INTO servers (server_name, ip_address, operating_system, status, created_at) VALUES (?, ?, ?, ?, NOW())";
    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

        stmt.setString(1, server.getServerName());
        stmt.setString(2, server.getIpAddress());
        stmt.setString(3, server.getOperatingSystem());
        stmt.setString(4, server.getStatus());

        int affectedRows = stmt.executeUpdate();
        if (affectedRows > 0) {
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    server.setServerId(generatedKeys.getInt(1));
                }
            }
            return true;
        }
    } catch (SQLException e) {
        LOGGER.log(Level.SEVERE, "Error adding server", e);
    }
    return false;
}


    // Update server details
    public boolean updateServer(Server server) {
    String query = "UPDATE servers SET server_name=?, ip_address=?, operating_system=?, status=?, user_id=NULLIF(?, 0) WHERE server_id=?";

    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setString(1, server.getServerName());
        stmt.setString(2, server.getIpAddress());
        stmt.setString(3, server.getOperatingSystem());
        stmt.setString(4, server.getStatus());

        // Ensure null userId is properly handled
        if (server.getUserId() != null && server.getUserId() > 0) {
            stmt.setLong(5, server.getUserId());
        } else {
            stmt.setNull(5, java.sql.Types.BIGINT);
        }

        stmt.setInt(6, server.getServerId());

        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        LOGGER.log(Level.SEVERE, "Error updating server", e);
    }
    return false;
}



    // Delete a server
    public boolean deleteServer(int serverId) {
        String query = "DELETE FROM servers WHERE server_id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, serverId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting server", e);
        }
        return false;
    }

    // Get server by ID
    public Server getServerById(int serverId) {
        String query = "SELECT * FROM servers WHERE server_id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, serverId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Server(
                            rs.getInt("server_id"),
                            rs.getLong("user_id"),
                            rs.getString("server_name"),
                            rs.getString("ip_address"),
                            rs.getString("operating_system"),
                            rs.getString("status"),
                            rs.getTimestamp("created_at")
                    );
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching server by ID", e);
        }
        return null;
    }

    // Get all servers
    public List<Server> getAllServers() {
        List<Server> serverList = new ArrayList<>();
        String query = "SELECT * FROM servers";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                serverList.add(new Server(
                        rs.getInt("server_id"),
                        rs.getLong("user_id"),
                        rs.getString("server_name"),
                        rs.getString("ip_address"),
                        rs.getString("operating_system"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at")
                ));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching all servers", e);
        }
        return serverList;
    }

    // Get total number of servers
    public int getTotalServers() {
        String query = "SELECT COUNT(*) FROM servers";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting total server count", e);
        }
        return 0;
    }
}
