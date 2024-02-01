package com.ajdeyemi.conduit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ajdeyemi.conduit.models.Articles;
import com.ajdeyemi.conduit.services.ArticlesService;

@RestController
@RequestMapping("/api/articles")
public class ArticlesController{

    @Autowired
    ArticlesService articlesService;

    @GetMapping("/")
    public Page<Articles> getArticles(@RequestParam(defaultValue = "0") int page,
    @RequestParam(defaultValue = "20") int limit
    ){
        return articlesService.geArticles(page, limit);
    }

}
