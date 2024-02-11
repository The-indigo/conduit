package com.ajdeyemi.conduit.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ajdeyemi.conduit.models.Favorites;


public interface FavoritesRepository extends JpaRepository<Favorites,Long>  {
    Favorites findByArticle(long id);
    @Query("SELECT article,user from Favorites where user=?1 and article=?2")
    Favorites findFavorited(long user, long article);
}
