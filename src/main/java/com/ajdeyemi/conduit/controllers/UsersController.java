package com.ajdeyemi.conduit.controllers;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ajdeyemi.conduit.models.LoginResponse;
import com.ajdeyemi.conduit.models.Profile;
import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.services.UsersService;

@RestController
@RequestMapping("/api")
public class UsersController {
    
    @Autowired
    UsersService usersService;

    @PostMapping("/users")
    public ResponseEntity<?> register(@RequestBody Users user){
        try{
            Users registerUser= usersService.register(user.getEmail(), user.getPassword(), 
            user.getUsername(), user.getRole());
            return ResponseEntity.ok().body(registerUser);

        }catch(Exception e){
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }

    @PostMapping("/users/login")
    public ResponseEntity<?> login(@RequestBody UserLogin userLogin){
        try{
            LoginResponse loginResponse= usersService.login(userLogin.email(), userLogin.password());
            return ResponseEntity.ok().body(loginResponse);
        }catch(Exception e){
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }

    @GetMapping("/user")
    public ResponseEntity<?> currentUser(){
        try{
          Users authenticatedUser= usersService.currentUser();
        //   Return the current user object excluding the password
          Users current= new Users(authenticatedUser.getId(), 
          authenticatedUser.getEmail(), authenticatedUser.getUsername(),
          authenticatedUser.getRole());
          return ResponseEntity.ok().body(current);
        }catch(Exception e){
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }
    @PutMapping("/user")
    public ResponseEntity<?> updateUser(@RequestBody Users user){
        try{
            Users updateUser= usersService.updateUser(user.getId(), 
            user.getEmail(),
             user.getPassword(), 
             user.getUsername(),
              user.getRole());
              return ResponseEntity.ok().body(updateUser);
        }catch(Exception e){
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }
    @GetMapping("/profiles/{username}")
    public ResponseEntity<?> getProfile(@PathVariable String username){
        try{
            Profile profile= usersService.getProfile(username);
            return ResponseEntity.ok().body(profile);
        }catch(Exception e){
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }

    @PostMapping("profiles/{username}/follow")
    public ResponseEntity<?> followUser(@PathVariable String username){
        try{
            Profile profile=usersService.followUser(username);
            return ResponseEntity.ok().body(profile);
        }catch(Exception e){
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }
}
record UserLogin (String email,String password){};

