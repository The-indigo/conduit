package com.ajdeyemi.conduit.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ajdeyemi.conduit.models.Users;

public interface UsersRepository extends JpaRepository<Users,Long> {
    Users findUsersByEmail(String email);
    
}
