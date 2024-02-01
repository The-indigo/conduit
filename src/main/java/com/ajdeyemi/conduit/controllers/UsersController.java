package com.ajdeyemi.conduit.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.services.UsersService;

@RestController
public class UsersController {
    
    @Autowired
    UsersService usersService;

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody Users user){
        try{
            Users registerUser= usersService.register(user.getEmail(), user.getPassword(), 
            user.getUsername(), user.getRole());
            return ResponseEntity.ok().body(registerUser);

        }catch(Exception e){
            return ResponseEntity.status(401).body(e.getMessage());
        }
    }
}
