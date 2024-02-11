package com.ajdeyemi.conduit.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ajdeyemi.conduit.models.Comments;
import com.ajdeyemi.conduit.models.ReturnedComment;

public interface CommentsRepository extends JpaRepository<Comments, Long> {
    List<Comments> findByArticle(long id);
    @Query("SELECT c as comment,u as user FROM Comments c inner join Users u on u.id= c.author")
    List<ReturnedComment> getComments();


}
