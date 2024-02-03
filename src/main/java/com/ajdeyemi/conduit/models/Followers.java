package com.ajdeyemi.conduit.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.Objects;

@Entity
@Table(name="followers")
public class Followers {
      @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long username;
    private long following;


    public Followers() {
    }

    public Followers( long username, long following) {
        this.username = username;
        this.following = following;
    }
    public Followers(long id, long username, long following) {
        this.id = id;
        this.username = username;
        this.following = following;
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUser() {
        return this.username;
    }

    public void setUser(long username) {
        this.username = username;
    }

    public long getFollowing() {
        return this.following;
    }

    public void setFollowing(long following) {
        this.following = following;
    }

    public Followers id(long id) {
        setId(id);
        return this;
    }

    public Followers username(long username) {
        setUser(username);
        return this;
    }

    public Followers following(long following) {
        setFollowing(following);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Followers)) {
            return false;
        }
        Followers followers = (Followers) o;
        return id == followers.id && username == followers.username && following == followers.following;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, following);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", username='" + getUser() + "'" +
            ", following='" + getFollowing() + "'" +
            "}";
    }
    
}
