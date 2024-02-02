package com.ajdeyemi.conduit.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ajdeyemi.conduit.models.Comments;

public interface CommentsRepository extends JpaRepository<Comments, Long> {
    List<Comments> findByArticle(long id);

}
