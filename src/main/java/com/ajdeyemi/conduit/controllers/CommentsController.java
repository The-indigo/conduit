package com.ajdeyemi.conduit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ajdeyemi.conduit.configs.GetError;
import com.ajdeyemi.conduit.services.CommentsService;

@RestController
@RequestMapping("/api/articles/{slug}/comments")
public class CommentsController {

    @Autowired
    CommentsService commentsService;

    @PostMapping("")
    public ResponseEntity<?>addComment(@PathVariable String slug,@RequestBody CommentBody commentBody){
        try{
            return ResponseEntity.ok().body(commentsService.addComment(slug, commentBody.body()));

        }catch(Exception e){
            return GetError.getError(e);
        }
        
    }
    
}

record CommentBody(String body){};