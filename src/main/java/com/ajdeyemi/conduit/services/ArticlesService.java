package com.ajdeyemi.conduit.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Articles;
import com.ajdeyemi.conduit.repositories.ArticlesRepository;

@Service
public class ArticlesService {
    @Autowired
    ArticlesRepository articlesRepository;

    public List<Articles> geArticles(){
        List<Articles> allArticles= articlesRepository.findAll();
        return allArticles;
    }
}
