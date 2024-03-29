package com.ajdeyemi.conduit.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ajdeyemi.conduit.models.Articles;
import com.ajdeyemi.conduit.models.ReturnedArticle;



public interface ArticlesRepository extends JpaRepository<Articles,Long> {
    // @Query("SELECT a.id, a.slug, u.email, u.username, a.title, a.description, a.body, a.favoritecount,t.tag from articles a inner join users u on a.author=u.id inner join tags t on t.article=a.id;")
//    Page<>findArticles(Pageable pageable);
@Query("SELECT a as article,u as author,t as tag from Articles a inner join Users u on a.author=u.id inner join Tags t on t.article=a.id WHERE LOWER(a.slug)=LOWER(?1)")
List<ReturnedArticle> getOneArticle(String slug);
@Query("SELECT a as article,u as author,t as tag FROM Articles a inner join Followers f ON a.author=f.following INNER join Users u on u.id=a.author INNER join Tags t on t.article=a.id WHERE f.username=?1") 
List<ReturnedArticle> getFeed(long userId);

@Query("SELECT a as article,u as author,t as tag from Articles a inner join Users u on a.author=u.id inner join Tags t on t.article=a.id")
Page<ReturnedArticle> getAllArticles(Pageable pageable);

@Query("SELECT a as article,u as author,t as tag from Articles a inner join Users u on a.author=u.id inner join Tags t on t.article=a.id WHERE t.tag=?1")
Page<ReturnedArticle> getAllArticlesByTag(String tag,Pageable pageable);

@Query("SELECT a as article,u as author,t as tag from Articles a inner join Users u on a.author=u.id inner join Tags t on t.article=a.id WHERE u.username=?1")
Page<ReturnedArticle> getAllArticlesByAuthor(String author,Pageable pageable);


Page<Articles> findAll(Pageable pageable); 
    Articles findBySlug(String slug);
}
