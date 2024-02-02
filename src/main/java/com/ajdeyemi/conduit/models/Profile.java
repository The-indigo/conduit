package com.ajdeyemi.conduit.models;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.util.Objects;

public class Profile {

    private String email;
    private String username;
    private boolean following;


    public Profile() {
    }

    public Profile(String email, String username, boolean following) {
        this.email = email;
        this.username = username;
        this.following = following;
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

    public boolean isFollowing() {
        return this.following;
    }

    public boolean getFollowing() {
        return this.following;
    }

    public void setFollowing(boolean following) {
        this.following = following;
    }

    public Profile email(String email) {
        setEmail(email);
        return this;
    }

    public Profile username(String username) {
        setUsername(username);
        return this;
    }

    public Profile following(boolean following) {
        setFollowing(following);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Profile)) {
            return false;
        }
        Profile profile = (Profile) o;
        return Objects.equals(email, profile.email) && Objects.equals(username, profile.username) && following == profile.following;
    }

    @Override
    public int hashCode() {
        return Objects.hash(email, username, following);
    }

    @Override
    public String toString() {
        return "{" +
            " email='" + getEmail() + "'" +
            ", username='" + getUsername() + "'" +
            ", following='" + isFollowing() + "'" +
            "}";
    }
    
}
