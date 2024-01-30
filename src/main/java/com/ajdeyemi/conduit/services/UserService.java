package com.ajdeyemi.conduit.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Roles;
import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.repositories.UsersRepository;

@Service
public class UserService {

    @Autowired
    UsersRepository usersRepository;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    TokenService tokenService;
    

    public Users register(String email, String password, String username,List<Roles>role) throws Exception{
        if(email.isBlank() || password.isBlank() || username.isBlank() || role.isEmpty()){
            throw new Exception ("We require you to fill all fields");
        }
         var user= usersRepository.findUsersByEmail(email);
         if(user!=null){
            throw new Exception ("Too late!! This email address is already in use");
         }
         if(user.getUsername().equals(username)){
            throw new Exception("Too late!! Someone already took this username");
         }
         String encryptedPassword= passwordEncoder.encode(password);
         Users newUser= new Users(email, username, encryptedPassword,role);
         usersRepository.save(newUser);
         return newUser;

    }
}
