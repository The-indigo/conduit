package com.ajdeyemi.conduit.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ajdeyemi.conduit.models.Comments;
import com.ajdeyemi.conduit.models.Followers;

public interface CommentsRepository extends JpaRepository<Comments, Long> {
    List<Comments> findByArticle(long id);
      @Query("SELECT article, user, comment FROM Comments  WHERE article = ?1")
    Comments findCommentByArticle(long id);
}
