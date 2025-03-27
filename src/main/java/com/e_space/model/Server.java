package com.e_space.model;

import java.sql.Timestamp;

public class Server {
    private int serverId;
    private Long userId; // Nullable to allow optional user assignment
    private String serverName;
    private String ipAddress;
    private String operatingSystem;
    private String status;
    private Timestamp createdAt;

    // Default constructor
    public Server() {}

    // Constructor for adding a new server (without userId and timestamps)
    public Server(String serverName, String ipAddress, String operatingSystem, String status) {
        this.serverName = serverName;
        this.ipAddress = ipAddress;
        this.operatingSystem = operatingSystem;
        this.status = status;
    }

    // Constructor for adding a server with userId
    public Server(Long userId, String serverName, String ipAddress, String operatingSystem, String status) {
        this.userId = userId;
        this.serverName = serverName;
        this.ipAddress = ipAddress;
        this.operatingSystem = operatingSystem;
        this.status = status;
    }

    // Constructor for fetching from the database (full details)
    public Server(int serverId, Long userId, String serverName, String ipAddress, String operatingSystem, String status, Timestamp createdAt) {
        this.serverId = serverId;
        this.userId = userId;
        this.serverName = serverName;
        this.ipAddress = ipAddress;
        this.operatingSystem = operatingSystem;
        this.status = status;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getServerId() {
        return serverId;
    }

    public void setServerId(int serverId) {
        this.serverId = serverId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getServerName() {
        return serverName;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getOperatingSystem() {
        return operatingSystem;
    }

    public void setOperatingSystem(String operatingSystem) {
        this.operatingSystem = operatingSystem;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
