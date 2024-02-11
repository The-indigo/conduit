package com.ajdeyemi.conduit.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ajdeyemi.conduit.models.Favorites;


public interface FavoritesRepository extends JpaRepository<Favorites,Long>  {
    Favorites findByArticle(long id);
}
