package com.ajdeyemi.conduit.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Objects;

@Entity
@Table(name="articles")
public class Articles {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long user;
    private String title;
    private String description;
    private String body;
    // private List<Tags> tags;


    public Articles() {
    }
    public Articles(long user, String title, String description, String body) {
        this.user = user;
        this.title = title;
        this.description = description;
        this.body = body;
    }

    public Articles(long id, long user, String title, String description, String body) {
        this.id = id;
        this.user = user;
        this.title = title;
        this.description = description;
        this.body = body;
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

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBody() {
        return this.body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Articles id(long id) {
        setId(id);
        return this;
    }

    public Articles user(long user) {
        setUser(user);
        return this;
    }

    public Articles title(String title) {
        setTitle(title);
        return this;
    }

    public Articles description(String description) {
        setDescription(description);
        return this;
    }

    public Articles body(String body) {
        setBody(body);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Articles)) {
            return false;
        }
        Articles articles = (Articles) o;
        return id == articles.id && user == articles.user && Objects.equals(title, articles.title) && Objects.equals(description, articles.description) && Objects.equals(body, articles.body);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, user, title, description, body);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", user='" + getUser() + "'" +
            ", title='" + getTitle() + "'" +
            ", description='" + getDescription() + "'" +
            ", body='" + getBody() + "'" +
            "}";
    }

 


    
}
