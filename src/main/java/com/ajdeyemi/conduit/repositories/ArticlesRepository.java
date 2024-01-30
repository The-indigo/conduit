package com.ajdeyemi.conduit.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ajdeyemi.conduit.models.Articles;

public interface ArticlesRepository extends JpaRepository<Articles,Long> {
    
}
