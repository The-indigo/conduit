package com.ajdeyemi.conduit.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.Instant;
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
    @Column(name = "createdat")
    private Instant createdAt;
    @Column(name = "updatedat")
    private Instant updatedAt;





  
  


    public Comments() {
    }

    public Comments( long article, long author, String comment,Instant createdAt, Instant updatedAt) {
        this.article = article;
        this.author = author;
        this.comment = comment;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }


    public Comments(long id, long article, long author, String comment, Instant createdAt, Instant updatedAt) {
        this.id = id;
        this.article = article;
        this.author = author;
        this.comment = comment;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
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

    public Instant getCreatedAt() {
        return this.createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public Instant getUpdatedAt() {
        return this.updatedAt;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
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

    public Comments createdAt(Instant createdAt) {
        setCreatedAt(createdAt);
        return this;
    }

    public Comments updatedAt(Instant updatedAt) {
        setUpdatedAt(updatedAt);
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
        return id == comments.id && article == comments.article && author == comments.author && Objects.equals(comment, comments.comment) && Objects.equals(createdAt, comments.createdAt) && Objects.equals(updatedAt, comments.updatedAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, article, author, comment, createdAt, updatedAt);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", article='" + getArticle() + "'" +
            ", author='" + getAuthor() + "'" +
            ", comment='" + getComment() + "'" +
            ", createdAt='" + getCreatedAt() + "'" +
            ", updatedAt='" + getUpdatedAt() + "'" +
            "}";
    }

    
}
