package com.ajdeyemi.conduit.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.Objects;

@Entity
@Table(name="followers")
public class Followers {
    @Id
    private long id;
    private long user;
    private long following;


    public Followers() {
    }

    public Followers(long id, long user, long following) {
        this.id = id;
        this.user = user;
        this.following = following;
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUser() {
        return this.user;
    }

    public void setUser(long user) {
        this.user = user;
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

    public Followers user(long user) {
        setUser(user);
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
        return id == followers.id && user == followers.user && following == followers.following;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, user, following);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", user='" + getUser() + "'" +
            ", following='" + getFollowing() + "'" +
            "}";
    }
    
}
