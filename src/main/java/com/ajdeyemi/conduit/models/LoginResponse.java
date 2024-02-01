package com.ajdeyemi.conduit.models;

import java.util.List;

import java.util.Objects;

public class LoginResponse {
        private long id;
        private String email;
        private String username;
        private List <Roles> role;
        private String token;


    public LoginResponse() {
    }

    public LoginResponse(long id, String email, String username, List<Roles> role, String token) {
        this.id = id;
        this.email = email;
        this.username = username;
        this.role = role;
        this.token = token;
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<Roles> getRole() {
        return this.role;
    }

    public void setRole(List<Roles> role) {
        this.role = role;
    }

    public String getToken() {
        return this.token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public LoginResponse id(long id) {
        setId(id);
        return this;
    }

    public LoginResponse email(String email) {
        setEmail(email);
        return this;
    }

    public LoginResponse username(String username) {
        setUsername(username);
        return this;
    }

    public LoginResponse role(List<Roles> role) {
        setRole(role);
        return this;
    }

    public LoginResponse token(String token) {
        setToken(token);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof LoginResponse)) {
            return false;
        }
        LoginResponse loginResponse = (LoginResponse) o;
        return id == loginResponse.id && Objects.equals(email, loginResponse.email) && Objects.equals(username, loginResponse.username) && Objects.equals(role, loginResponse.role) && Objects.equals(token, loginResponse.token);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email, username, role, token);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", email='" + getEmail() + "'" +
            ", username='" + getUsername() + "'" +
            ", role='" + getRole() + "'" +
            ", token='" + getToken() + "'" +
            "}";
    }
        
    }
