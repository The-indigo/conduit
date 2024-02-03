package com.ajdeyemi.conduit.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.List;
import java.util.Objects;

@Entity
@Table(name="articles")
public class Articles {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String slug;
    private long author;
    private String title;
    private String description;
    private String body;
    @Column(name = "favoritecount")
    private int favoriteCount;





    public Articles() {
    }

    public Articles( String slug, long author, String title, String description, String body, int favoriteCount) {
        this.slug = slug;
        this.author = author;
        this.title = title;
        this.description = description;
        this.body = body;
        this.favoriteCount = favoriteCount;
    }

    public Articles(long id, String slug, long author, String title, String description, String body, int favoriteCount) {
        this.id = id;
        this.slug = slug;
        this.author = author;
        this.title = title;
        this.description = description;
        this.body = body;
        this.favoriteCount = favoriteCount;
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getSlug() {
        return this.slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public long getAuthor() {
        return this.author;
    }

    public void setAuthor(long author) {
        this.author = author;
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

    public int getFavoriteCount() {
        return this.favoriteCount;
    }

    public void setFavoriteCount(int favoriteCount) {
        this.favoriteCount = favoriteCount;
    }

    public Articles id(long id) {
        setId(id);
        return this;
    }

    public Articles slug(String slug) {
        setSlug(slug);
        return this;
    }

    public Articles author(long author) {
        setAuthor(author);
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

    public Articles favoriteCount(int favoriteCount) {
        setFavoriteCount(favoriteCount);
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
        return id == articles.id && Objects.equals(slug, articles.slug) && author == articles.author && Objects.equals(title, articles.title) && Objects.equals(description, articles.description) && Objects.equals(body, articles.body) && favoriteCount == articles.favoriteCount;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, slug, author, title, description, body, favoriteCount);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", slug='" + getSlug() + "'" +
            ", author='" + getAuthor() + "'" +
            ", title='" + getTitle() + "'" +
            ", description='" + getDescription() + "'" +
            ", body='" + getBody() + "'" +
            ", favoriteCount='" + getFavoriteCount() + "'" +
            "}";
    }

    
}
