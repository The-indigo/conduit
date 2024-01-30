package com.ajdeyemi.conduit.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ajdeyemi.conduit.models.Comments;

public interface CommentsRepository extends JpaRepository<Comments, Long> {
    
}
