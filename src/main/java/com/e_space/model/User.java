package com.e_space.model;

import java.sql.Timestamp;

public class User {
    private long userId;
    private String username;
    private String email;
    private String phone;
    private String password;
    private String role;
    private Timestamp createdAt;

    public User(long userId, String username, String email, String phone, String password, String role, Timestamp createdAt) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.role = role;
        this.createdAt = createdAt;
    }

    public User(String username, String email, String phone, String password, String role) {
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.role = role;
    }

    public long getUserId() { return userId; }
    public String getUsername() { return username; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getPassword() { return password; }
    public String getRole() { return role; }
    public Timestamp getCreatedAt() { return createdAt; }
}
