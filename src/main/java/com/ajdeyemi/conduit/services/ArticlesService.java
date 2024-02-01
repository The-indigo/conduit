package com.ajdeyemi.conduit.services;

import java.util.List;

import org.hibernate.query.spi.Limit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Articles;
import com.ajdeyemi.conduit.repositories.ArticlesRepository;

@Service
public class ArticlesService {
    @Autowired
    ArticlesRepository articlesRepository;

    public Page<Articles> geArticles(int page, int size){
        // List<Passenger> passenger = repository.findByOrderBySeatNumberAsc(Limit.of(1));
        PageRequest articles = PageRequest.of(page, size);
        return articlesRepository.findAll(articles);
    }
}
