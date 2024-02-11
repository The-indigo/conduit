package com.ajdeyemi.conduit.models;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="favorites")
public class Favorites {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long article;
    private long user;
    

    public Favorites() {
    }

    public Favorites(long article, long user) {
        this.article = article;
        this.user = user;
    }

    public Favorites(long id, long article, long user) {
        this.id = id;
        this.article = article;
        this.user = user;
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getArticle() {
        return this.article;
    }

    public void setArticle(long article) {
        this.article = article;
    }

    public long getUser() {
        return this.user;
    }

    public void setUser(long user) {
        this.user = user;
    }

    public Favorites id(long id) {
        setId(id);
        return this;
    }

    public Favorites article(long article) {
        setArticle(article);
        return this;
    }

    public Favorites user(long user) {
        setUser(user);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Favorites)) {
            return false;
        }
        Favorites favoriteArticle = (Favorites) o;
        return id == favoriteArticle.id && article == favoriteArticle.article && user == favoriteArticle.user;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, article, user);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", article='" + getArticle() + "'" +
            ", user='" + getUser() + "'" +
            "}";
    }
    
    
}
