package com.ajdeyemi.conduit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ajdeyemi.conduit.configs.GetError;
import com.ajdeyemi.conduit.services.FavoritesService;

@RestController
@RequestMapping("/api/articles/{slug}/favorite")
public class FavoritesController {

    @Autowired
    FavoritesService favoritesService;

        @PostMapping("")
    public ResponseEntity<?>favoriteArticle(@PathVariable String slug){
        try{
            return ResponseEntity.ok().body(favoritesService.favoriteArticle(slug));
        }catch(Exception e){
            return GetError.getError(e);
        }
    }

    @DeleteMapping("")
    public ResponseEntity<?>unfavoriteArticle(@PathVariable String slug){
        try{
            return ResponseEntity.ok().body(favoritesService.unfavoriteArticle(slug));
        }catch(Exception e){
            return GetError.getError(e);
        }
    }
    
}
