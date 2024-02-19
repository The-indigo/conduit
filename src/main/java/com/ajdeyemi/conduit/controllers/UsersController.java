package com.ajdeyemi.conduit.controllers;


import com.ajdeyemi.conduit.models.LoginResponse;
import com.ajdeyemi.conduit.models.Profile;
import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
//todo: you can define the base path on properties, so you can change it easily
@RequestMapping("/api")
public class UsersController {
    
    @Autowired
    UsersService usersService;

    @PostMapping("/users")
    public ResponseEntity<?> register(@RequestBody Users user){
        //todo: use globalExceptionHandler to handle exceptions
        try{
            //todo: you can pass the user object directly to the register method
            //usersService.register(user);
            Users registerUser= usersService.register(user.getEmail(), user.getPassword(), 
            user.getUsername(), user.getRole());
            //todo: you can use the ResponseEntity.created method to return the created user
            //201 created, 200 ok
            return ResponseEntity.status(HttpStatus.CREATED).body(registerUser);

        } catch (Throwable e) {
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }

    @PostMapping("/users/login")
    public ResponseEntity<?> login(@RequestBody UserLogin userLogin){
        //todo: you should use validation annotations, and use the globalExceptionHandler to handle exceptions
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
            //todo: you will recieve the user object with the password,
            // you should convert it to dto, because dto wont have the password
            //   var userDTO = new userDTO();
            //        BeanUtils.copyProperties(userDTO, authenticatedUser);

//          return ResponseEntity.ok().body(authenticatedUser);
//           Return the current user object excluding the password
            Users current = new Users(authenticatedUser.getId(),
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

    @DeleteMapping("profiles/{username}/follow")
    public ResponseEntity<?>unFollowUser(@PathVariable String username){
        try{
            Profile profile=usersService.unFollowUser(username);
            return ResponseEntity.ok().body(profile);
        }catch(Exception e){
            HashMap<String,String> error= new HashMap<>();
            error.put("error",e.getMessage() );
            return ResponseEntity.status(401).body(error);
        }
    }
}

//todo: you should create a separate class for the UserLogin object, this could be a DTO
record UserLogin(String email, String password) {
}

