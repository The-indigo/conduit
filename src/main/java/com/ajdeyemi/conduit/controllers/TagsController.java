package com.ajdeyemi.conduit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ajdeyemi.conduit.services.TagsService;

@RestController
@RequestMapping("/api/tags")
public class TagsController {
    @Autowired
    TagsService tagsService;

    @GetMapping("")
    public ResponseEntity<?> getTags(){
        return ResponseEntity.ok().body(tagsService.getTags());

    }
    
}
