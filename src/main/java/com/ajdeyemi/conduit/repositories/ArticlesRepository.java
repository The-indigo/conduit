package com.ajdeyemi.conduit.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ajdeyemi.conduit.models.Articles;

public interface ArticlesRepository extends JpaRepository<Articles,Long> {
    Page<Articles> findAll(Pageable pageable);
    List<Articles>findByAuthor(long user);
    Articles findBySlug(String slug);
    // @Query ("insert into articles (author,title,description,body,tags) values (?1,?2,?3,?4,?5)")
    // Articles addNewArticle(long author, String title, String description, String body,List<String> tags);  
}
