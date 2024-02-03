package com.ajdeyemi.conduit.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.Objects;

@Entity
@Table(name="comments")
public class Comments {
      @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long article;
    private long author;
    private String comment;



    public Comments() {
    }


    public Comments( long article, long author, String comment) {
        this.article = article;
        this.author = author;
        this.comment = comment;
    }

    public Comments(long id, long article, long author, String comment) {
        this.id = id;
        this.article = article;
        this.author = author;
        this.comment = comment;
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

    public long getAuthor() {
        return this.author;
    }

    public void setAuthor(long author) {
        this.author = author;
    }

    public String getComment() {
        return this.comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Comments id(long id) {
        setId(id);
        return this;
    }

    public Comments article(long article) {
        setArticle(article);
        return this;
    }

    public Comments author(long author) {
        setAuthor(author);
        return this;
    }

    public Comments comment(String comment) {
        setComment(comment);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Comments)) {
            return false;
        }
        Comments comments = (Comments) o;
        return id == comments.id && article == comments.article && author == comments.author && Objects.equals(comment, comments.comment);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, article, author, comment);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", article='" + getArticle() + "'" +
            ", author='" + getAuthor() + "'" +
            ", comment='" + getComment() + "'" +
            "}";
    }
    
}
