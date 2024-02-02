package com.ajdeyemi.conduit.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.LoginResponse;
import com.ajdeyemi.conduit.models.Roles;
import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.repositories.UsersRepository;

@Service
public class UsersService {

    @Autowired
    UsersRepository usersRepository;

      @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    TokenService tokenService;
    

    public Users register(String email, String password, String username,List<Roles>role) throws Exception{
        if(password==null){
            throw new Exception ("Password is required");
        }
        if(email==null){
            throw new Exception ("Email is required");

        }
        if(username==null){
            throw new Exception ("Username is required");

        }
        if(role==null){
            throw new Exception ("Role is required");
        }
        if(email.isBlank() || password.isEmpty() || username.isBlank() || role.isEmpty()){
            throw new Exception ("We require you to fill all fields");
        }
         var user= usersRepository.findUsersByEmail(email);
         if(user!=null && user.getEmail().equals(email)){
            throw new Exception ("Too late!! This email address is already in use");
         }
     var usernameTaken=usersRepository.findUsersByUsername(username);
         if(usernameTaken!=null){
            throw new Exception("Too late!! Someone already took this username");
         }
         String encryptedPassword= passwordEncoder.encode(password);
         Users newUser= new Users(email, username, encryptedPassword,role);
         usersRepository.save(newUser);
         return newUser;

    }


    // This method returns the LoginResponse object type.
    // I want to return a login response object in the controller
    public LoginResponse login(String email, String password) throws Exception{
        if(password==null){
            throw new Exception ("Password is required");
        }
        if(email==null){
            throw new Exception ("Email is required");

        }
            Authentication authentication= authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(email,password));
            String token = tokenService.generateToken(authentication);
            Users user=usersRepository.findUsersByEmail(email);
            // (long id, String email, String username, List<Role> role, String token)
            LoginResponse loginResponse= new LoginResponse(user.getId(),user.getEmail(),user.getUsername(),user.getRole(),token);
        return loginResponse;
    }

    public Users currentUser()throws Exception{
        String authenticated= SecurityContextHolder.getContext().getAuthentication().getName();
        Users authenticatedUser= usersRepository.findUsersByEmail(authenticated);
        return authenticatedUser;

               // Jwt jwt = (Jwt)  SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        // Map<String, Object> allClaims = jwt.getClaims();
        //     for (Map.Entry<String, Object> entry : allClaims.entrySet()) {
        //         System.out.println(entry.getKey() + ": " + entry.getValue());
        //     }
        
    }
}

