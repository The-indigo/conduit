package com.ajdeyemi.conduit.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ajdeyemi.conduit.models.Followers;

public interface FollowersRepository extends JpaRepository<Followers, Long> {
       @Query("SELECT f FROM Followers f WHERE f.user = ?1 AND f.following=?2")
    Followers findFollowingUser(long user,long following);
    @Query("SELECT following FROM Followers WHERE user=?1")
   List<Followers> findFollowers(long user);
}
