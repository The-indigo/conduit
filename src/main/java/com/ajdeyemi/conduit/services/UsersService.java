package com.ajdeyemi.conduit.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Followers;
import com.ajdeyemi.conduit.models.LoginResponse;
import com.ajdeyemi.conduit.models.Profile;
import com.ajdeyemi.conduit.models.Roles;
import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.repositories.FollowersRepository;
import com.ajdeyemi.conduit.repositories.UsersRepository;

@Service
public class UsersService {

    @Autowired
    UsersRepository usersRepository;

    @Autowired
    FollowersRepository followersRepository;

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    TokenService tokenService;

    public Users register(String email, String password, String username, List<Roles> role) throws Exception {
        if (password == null) {
            throw new Exception("Password is required");
        }
        if (email == null) {
            throw new Exception("Email is required");

        }
        if (username == null) {
            throw new Exception("Username is required");

        }
        if (role == null) {
            throw new Exception("Role is required");
        }
        if (email.isBlank() || password.isEmpty() || username.isBlank() || role.isEmpty()) {
            throw new Exception("We require you to fill all fields");
        }
        var user = usersRepository.findUsersByEmail(email);
        if (user != null && user.getEmail().equals(email)) {
            throw new Exception("Too late!! This email address is already in use");
        }
        var usernameTaken = usersRepository.findUsersByUsername(username);
        if (usernameTaken != null) {
            throw new Exception("Too late!! Someone already took this username");
        }
        String encryptedPassword = passwordEncoder.encode(password);
        Users newUser = new Users(email, username, encryptedPassword, role);
        usersRepository.save(newUser);
        return newUser;

    }

    // This method returns the LoginResponse object type.
    // I want to return a login response object in the controller
    public LoginResponse login(String email, String password) throws Exception {
        if (password == null) {
            throw new Exception("Password is required");
        }
        if (email == null) {
            throw new Exception("Email is required");

        }
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(email, password));
        String token = tokenService.generateToken(authentication);
        Users user = usersRepository.findUsersByEmail(email);
        // (long id, String email, String username, List<Role> role, String token)
        LoginResponse loginResponse = new LoginResponse(user.getId(), user.getEmail(), user.getUsername(),
                user.getRole(), token);
        return loginResponse;
    }

    public Users currentUser() throws Exception {
        String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users authenticatedUser = usersRepository.findUsersByEmail(authenticated);
        return authenticatedUser;

        // Jwt jwt = (Jwt)
        // SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        // Map<String, Object> allClaims = jwt.getClaims();
        // for (Map.Entry<String, Object> entry : allClaims.entrySet()) {
        // System.out.println(entry.getKey() + ": " + entry.getValue());
        // }

    }

    public Users updateUser(long id, String email, String password, String username, List<Roles> role)
            throws Exception {
        // TO DO: Implement duplicate checking
        //TODO: CHECK ALL USERS EXCEPT CURRENT USER. CREATE QUERY FOR THIS
        Optional<Users> getUser = usersRepository.findById(id);
        if (getUser.isPresent()) {
            var user = getUser.get();
            String setEmail = email != null ? email : user.getEmail();
            String setPassword = password != null ? passwordEncoder.encode(password) : user.getPassword();
            String setUsername = username != null ? username : user.getUsername();
            List<Roles> setRoles = role != null ? role : user.getRole();

            user.setEmail(setEmail);
            user.setPassword(setPassword);
            user.setUsername(setUsername);
            user.setRole(setRoles);
            usersRepository.save(user);
            return user;
        } else {
            throw new Exception("There is no user with this ID");
        }

    }

    public Profile getProfile(String username) throws Exception {
        String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        if (username != null && !(username.isBlank())) {

            // This is the user of which we are getting the profile
            Users user = usersRepository.findUsersByUsername(username);
            if (user != null) {
                // This is the current signed in user making the request
                Users currentUser = usersRepository.findUsersByEmail(authenticated);

                Followers following = followersRepository.findFollowingUsername(currentUser.getId(), user.getId());
                if (following != null) {
                    Profile isFollowing = new Profile(user.getEmail(), user.getUsername(), true);
                    return isFollowing;
                } else {
                    Profile isNotFollowing = new Profile(user.getEmail(), user.getUsername(), false);
                    return isNotFollowing;
                }

            } else {
                throw new Exception("Sorry, this user can't be found");
            }
        } else {
            throw new Exception("No username provided");
        }
    }


    public Profile followUser(String username) throws Exception{
        String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users currentUser = usersRepository.findUsersByEmail(authenticated);
        Users user= usersRepository.findUsersByUsername(username);
        if(user!=null){
            Followers following = followersRepository.findFollowingUsername(currentUser.getId(), user.getId());
            if(following!=null){
                throw new Exception("You are already following this user");
            }else{
                System.out.println("inserting" + currentUser.getId() +"" + user.getId());
                Followers follow= new Followers(currentUser.getId(), user.getId());
                
                followersRepository.save(follow);
                Profile profile=new Profile(user.getEmail(), user.getUsername(), true);
                return profile;
            }
        }else{
            throw new Exception("Sorry, this user can't be found");
        }
    }

    public Profile unfollowUser(String username) throws Exception{
        String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users currentUser = usersRepository.findUsersByEmail(authenticated);
        Users user= usersRepository.findUsersByUsername(username);
        if(user!=null){
            Followers following = followersRepository.findFollowingUsername(currentUser.getId(), user.getId());
            if(following!=null){
                followersRepository.delete(following);
                Profile profile=new Profile(user.getEmail(), user.getUsername(), false);
                return profile;
            }else{
                throw new Exception("You have not followed this user");
            }
        }else{
            throw new Exception("Sorry, this user can't be found");
        }
    }

}
