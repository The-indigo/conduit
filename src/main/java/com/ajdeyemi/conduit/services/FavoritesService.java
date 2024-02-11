package com.ajdeyemi.conduit.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Articles;
import com.ajdeyemi.conduit.models.Favorites;
import com.ajdeyemi.conduit.models.ReturnedArticle;
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
    @Autowired
    ArticlesService articlesService;

    public Map<String, Object> favoriteArticle(String slug) throws Exception{
     String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users currentUser = usersRepository.findUsersByEmail(authenticated);
        if(slug==null){
            throw new Exception("You didn't provide a slug");
        }
        Articles response= articlesRepository.findBySlug(slug);
        if(response!=null){
            int favoritesCount=response.getFavoriteCount()+1;
            Favorites addFavorite= new Favorites(response.getId(),currentUser.getId());
            response.setFavoriteCount(favoritesCount);
            favoritesRepository.save(addFavorite);
            articlesRepository.save(response);
            
        List<ReturnedArticle> items = articlesRepository.getOneArticle(slug);

                    // Joins the tags array into one array and selects the tag field from the array
                // of objects
                var tags = items.stream().flatMap(item -> item.getTag().stream())
                        .map(item -> item.getTag())
                        .collect(Collectors.toList());
                var author = items.get(0).getAuthor();
                var article = items.get(0).getArticle();

                var favorited=favoritesRepository.findFavorited(currentUser.getId(), article.getId());
                boolean isFavorited= favorited!=null?true:false;

                HashMap<String, Object> authorObject = new HashMap<>();
                authorObject.put("username", author.getUsername());
                authorObject.put("email", author.getEmail());

                HashMap<String, Object> articleObject = new HashMap<>();
                articleObject.put("slug", article.getSlug());
                articleObject.put("title", article.getTitle());
                articleObject.put("description", article.getDescription());
                articleObject.put("body", article.getBody());
                articleObject.put("tagsList", tags);
                articleObject.put("favorited",isFavorited );
                articleObject.put("createdAt", article.getCreatedAt());
                articleObject.put("updatedAt", article.getUpdatedAt());
                articleObject.put("favoritesCount", article.getFavoriteCount());
                articleObject.put("author", authorObject);

                HashMap<String, Object> result = new HashMap<>();
                result.put("article", articleObject);
                return result;
        }else{
            throw new Exception("Cannot find this article");
        }
    }
    public Map<String, Object> unfavoriteArticle(String slug)throws Exception{
        String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users currentUser = usersRepository.findUsersByEmail(authenticated);
        if(slug==null){
            throw new Exception("You didn't provide a slug");
        }
        Articles response= articlesRepository.findBySlug(slug);
        if(response!=null){
            int favoritesCount=response.getFavoriteCount()-1;
            var favoriteToDelete= favoritesRepository.findByArticle(response.getId());
            if(favoriteToDelete==null){
                throw new Exception("Cannot find this favorites information");
            }
            if(favoriteToDelete.getUser()!=currentUser.getId()){
                throw new Exception("You are not allowed to perform this operation.");
            }
            response.setFavoriteCount(favoritesCount);
            favoritesRepository.delete(favoriteToDelete);
            articlesRepository.save(response);

            List<ReturnedArticle> items = articlesRepository.getOneArticle(slug);

            // Joins the tags array into one array and selects the tag field from the array
        // of objects
        var tags = items.stream().flatMap(item -> item.getTag().stream())
                .map(item -> item.getTag())
                .collect(Collectors.toList());
        var author = items.get(0).getAuthor();
        var article = items.get(0).getArticle();

        var favorited=favoritesRepository.findFavorited(currentUser.getId(), article.getId());
        boolean isFavorited= favorited!=null?true:false;

        HashMap<String, Object> authorObject = new HashMap<>();
        authorObject.put("username", author.getUsername());
        authorObject.put("email", author.getEmail());

        HashMap<String, Object> articleObject = new HashMap<>();
        articleObject.put("slug", article.getSlug());
        articleObject.put("title", article.getTitle());
        articleObject.put("description", article.getDescription());
        articleObject.put("body", article.getBody());
        articleObject.put("tagsList", tags);
        articleObject.put("favorited",isFavorited );
        articleObject.put("createdAt", article.getCreatedAt());
        articleObject.put("updatedAt", article.getUpdatedAt());
        articleObject.put("favoritesCount", article.getFavoriteCount());
        articleObject.put("author", authorObject);

        HashMap<String, Object> result = new HashMap<>();
        result.put("article", articleObject);
        return result;
        }else{
            throw new Exception("Cannot find this article");
        }
        
    }
    
}
