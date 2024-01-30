package com.ajdeyemi.conduit.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ajdeyemi.conduit.models.Followers;

public interface FollowersRepository extends JpaRepository<Followers, Long> {
    
}
