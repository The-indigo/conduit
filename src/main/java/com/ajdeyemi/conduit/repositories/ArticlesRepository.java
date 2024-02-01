package com.ajdeyemi.conduit.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ajdeyemi.conduit.models.Articles;

public interface ArticlesRepository extends JpaRepository<Articles,Long> {
    Page<Articles> findAll(Pageable pageable);
}
