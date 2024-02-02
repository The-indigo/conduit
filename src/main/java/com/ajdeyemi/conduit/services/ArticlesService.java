package com.ajdeyemi.conduit.services;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Articles;
import com.ajdeyemi.conduit.models.Followers;
import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.repositories.ArticlesRepository;
import com.ajdeyemi.conduit.repositories.FollowersRepository;
import com.ajdeyemi.conduit.repositories.UsersRepository;

@Service
public class ArticlesService {
    @Autowired
    ArticlesRepository articlesRepository;

    @Autowired
    FollowersRepository followersRepository;

    @Autowired
    UsersRepository usersRepository;

    public Page<Articles> geArticles(int page, int size){
        // List<Passenger> passenger = repository.findByOrderBySeatNumberAsc(Limit.of(1));
        PageRequest articles = PageRequest.of(page, size);
        return articlesRepository.findAll(articles);
    }


    public List<Articles> getFeed(){
    String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
    Users currentUser= usersRepository.findUsersByEmail(authenticated);
    List<Articles> articles=new ArrayList<>();
    // Get the user's followers
   List<Followers> followers= followersRepository.findFollowers(currentUser.getId());
//    Get articles of each followers
for(Followers follower: followers){
    List<Articles> articlesByFollower= articlesRepository.findByUser(follower.getId());
    for(Articles article: articlesByFollower){
        articles.add(article);
    }
}
return articles;
    }


    public Articles getArticle(String title) throws Exception{
        if(title!=null && !(title.isBlank())){
            Articles article= articlesRepository.findByTitle(title);
            return article;
        }else{
            throw new Exception("This Article cannot be found");
        }
    }

}
