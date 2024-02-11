package com.ajdeyemi.conduit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
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
    @GetMapping("")
    public ResponseEntity<?>getComments(@PathVariable String slug){
        try{
            return ResponseEntity.ok().body(commentsService.getArticleComments(slug));
        }catch(Exception e){
            return GetError.getError(e);
        }
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<?>deleteComment(@PathVariable String slug, @PathVariable long id){
        try{
            return ResponseEntity.ok().body(commentsService.deleteComment(slug, id));
        }catch(Exception e){
            return GetError.getError(e);
        }
    }



    
}

record CommentBody(String body){};