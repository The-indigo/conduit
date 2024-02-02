package com.ajdeyemi.conduit.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.Objects;

@Entity
@Table(name="tags")
public class Tags {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String tag;
    private long article;


    public Tags() {
    }

    public Tags(long id, String tag, long article) {
        this.id = id;
        this.tag = tag;
        this.article = article;
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTag() {
        return this.tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public long getArticle() {
        return this.article;
    }

    public void setArticle(long article) {
        this.article = article;
    }

    public Tags id(long id) {
        setId(id);
        return this;
    }

    public Tags tag(String tag) {
        setTag(tag);
        return this;
    }

    public Tags article(long article) {
        setArticle(article);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Tags)) {
            return false;
        }
        Tags tags = (Tags) o;
        return id == tags.id && Objects.equals(tag, tags.tag) && article == tags.article;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, tag, article);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", tag='" + getTag() + "'" +
            ", article='" + getArticle() + "'" +
            "}";
    }

    
}
