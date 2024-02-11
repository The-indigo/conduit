package com.ajdeyemi.conduit.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Articles;
import com.ajdeyemi.conduit.models.Favorites;
import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.repositories.ArticlesRepository;
import com.ajdeyemi.conduit.repositories.FavoritesRepository;
import com.ajdeyemi.conduit.repositories.UsersRepository;

@Service
public class FavoritesService {
    @Autowired
    FavoritesRepository favoritesRepository;
    @Autowired
    ArticlesRepository articlesRepository;
    @Autowired
    UsersRepository usersRepository;

    public void favoriteArticle(String slug) throws Exception{
     String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users currentUser = usersRepository.findUsersByEmail(authenticated);
        if(slug==null){
            throw new Exception("You didn't provide a slug");
        }
        Articles article= articlesRepository.findBySlug(slug);
        if(article!=null){
            int favoritesCount=article.getFavoriteCount()+1;
            Favorites addFavorite= new Favorites(article.getId(),currentUser.getId());
            article.setFavoriteCount(favoritesCount);
            favoritesRepository.save(addFavorite);
            articlesRepository.save(article);
        }
    }
    public void unfavoriteArticle(String slug)throws Exception{
        String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users currentUser = usersRepository.findUsersByEmail(authenticated);
        if(slug==null){
            throw new Exception("You didn't provide a slug");
        }
        Articles article= articlesRepository.findBySlug(slug);
        if(article!=null){
            int favoritesCount=article.getFavoriteCount()-1;
            var favoriteToDelete= favoritesRepository.findByArticle(article.getId());
            if(favoriteToDelete==null){
                throw new Exception("Cannot find this favorites information");
            }
            if(favoriteToDelete.getUser()!=currentUser.getId()){
                throw new Exception("You are not allowed to perform this operation.");
            }
            article.setFavoriteCount(favoritesCount);
            favoritesRepository.delete(favoriteToDelete);
            articlesRepository.save(article);
        }
        
    }
    
}
