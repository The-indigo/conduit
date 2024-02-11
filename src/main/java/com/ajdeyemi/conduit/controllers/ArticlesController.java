package com.ajdeyemi.conduit.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

    @GetMapping("")
    public ResponseEntity<?> getArticles(@RequestParam(defaultValue = "0") int page,
    @RequestParam(defaultValue = "20") int limit,
    @RequestParam Optional <String> tag,
    @RequestParam Optional <String> author
    ){
        try{
            return ResponseEntity.ok().body( articlesService.geArticles(page, limit,tag,author));

        }catch(Exception e){
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }

    @GetMapping("/feed")
    public ResponseEntity<?> getFeed()throws Exception{
        try{
            return ResponseEntity.ok().body(articlesService.getFeed());
        }catch(Exception e){
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }
    

    @GetMapping("/{slug}")
    public ResponseEntity<?> getArticle(@PathVariable String slug){
        try{
           return ResponseEntity.ok().body(articlesService.getArticle(slug));
        }catch(Exception e){
            return getError(e);
        }
     
    }
    @PostMapping("")
    public ResponseEntity<?> createArticle(@RequestBody Article article){
        try{
            // String title, String description, String body,List<String> tags
            return ResponseEntity.ok().body(articlesService.createArticle(article.title(),article.description(),
            article.body(),article.tags()
            ));
        }catch(Exception e){
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }

    @PutMapping("/{slug}")
    public ResponseEntity<?> updateArticle(@PathVariable String slug, @RequestBody Articles article ){
        try{        
            return ResponseEntity.ok().body(articlesService.updateArticle(slug, article.getTitle(), article.getDescription(),
             article.getBody()));
        }catch(Exception e){
            return getError(e);
        }

    }
    @DeleteMapping("/slug")
    public ResponseEntity<?> deleteArticle(@PathVariable String slug){
        try{
            return ResponseEntity.ok().body(articlesService.deleteArticle(slug));
        }catch(Exception e){
         return getError(e);
        }

    }

    public ResponseEntity<?> getError(Exception e){
        HashMap<String,String> error= new HashMap<>();
        error.put("error",e.getMessage() );
        return ResponseEntity.status(401).body(error);
    }

        // @PostMapping("/add")
    // public void addarticle(){
    //     articlesService.generateAndSaveData(1);
    // }

}
record Article (String title, String description, String body, List<String> tags){};
