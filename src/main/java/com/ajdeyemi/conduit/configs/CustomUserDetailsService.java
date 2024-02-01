package com.ajdeyemi.conduit.configs;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.repositories.UsersRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService  {

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Users user= usersRepository.findUsersByEmail(email);
        if (user==null){
               throw new UsernameNotFoundException(email + "is not found");
        }
        return new CustomUser(user);
        }

            // Spring security user class
    //this created class extends my User class and implements userdetails
    static final class CustomUser extends Users implements UserDetails {

        CustomUser(Users user){

            super(user.getId(),user.getEmail(),user.getUsername(), user.getPassword(),user.getRole());
        }

        private static final List<GrantedAuthority> ROLE_USER = Collections
        .unmodifiableList(AuthorityUtils.createAuthorityList("ROLE_USER"));

        @Override
        public String getUsername() {
            return getEmail();
        }

        @Override
        public boolean isAccountNonExpired() {
            return true;
        }
        @Override
        public Collection<? extends GrantedAuthority> getAuthorities() {
            return ROLE_USER;
        }

        @Override
        public boolean isAccountNonLocked() {
            return true;
        }

        @Override
        public boolean isCredentialsNonExpired() {
            return true;
        }

        @Override
        public boolean isEnabled() {
            return true;
        }

    }
    
}
