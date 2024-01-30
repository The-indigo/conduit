package com.ajdeyemi.conduit.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.Objects;

@Entity
@Table(name="articles")
public class Articles {
    @Id
    private long id;
    private long user;
    private String article;


    public Articles() {
    }

    public Articles(long id, long user, String article) {
        this.id = id;
        this.user = user;
        this.article = article;
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

    public String getArticle() {
        return this.article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public Articles id(long id) {
        setId(id);
        return this;
    }

    public Articles user(long user) {
        setUser(user);
        return this;
    }

    public Articles article(String article) {
        setArticle(article);
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
        return id == articles.id && user == articles.user && Objects.equals(article, articles.article);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, user, article);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", user='" + getUser() + "'" +
            ", article='" + getArticle() + "'" +
            "}";
    }
    
}
