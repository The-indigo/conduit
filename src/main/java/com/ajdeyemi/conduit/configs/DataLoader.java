package com.ajdeyemi.conduit.configs;

import java.time.Instant;
import java.util.Arrays;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.ajdeyemi.conduit.models.Comments;
import com.ajdeyemi.conduit.models.Favorites;
import com.ajdeyemi.conduit.models.Followers;
import com.ajdeyemi.conduit.repositories.CommentsRepository;
import com.ajdeyemi.conduit.repositories.FavoritesRepository;
import com.ajdeyemi.conduit.repositories.FollowersRepository;

@Component
public class DataLoader implements CommandLineRunner {

    private final FollowersRepository followersRepository;
    private final CommentsRepository commentsRepository;
    private final FavoritesRepository favoritesRepository;

    public DataLoader(FollowersRepository followersRepository,CommentsRepository commentsRepository,FavoritesRepository favoritesRepository){
        this.followersRepository=followersRepository;
        this.commentsRepository=commentsRepository;
        this.favoritesRepository=favoritesRepository;
    } 

    @Override
    public void run(String... args) throws Exception {
        followersRepository.deleteAll();
        commentsRepository.deleteAll();
        favoritesRepository.deleteAll();

        Followers followers0=new Followers(0,3);
        Followers followers1=new Followers(0,2);
        Followers followers2=new Followers(1,2);
        Followers followers3=new Followers(1,0);
        Followers followers4=new Followers(2,3);
        Followers followers5=new Followers(2,1);
        Followers followers6=new Followers(3,1);
        Followers followers7=new Followers(3,2);
        Followers followers8=new Followers(3,0);
        List<Followers> followers=Arrays.asList(followers0,followers1,followers2,followers3,followers4,
        followers5,followers6,followers7,followers8);
        followersRepository.saveAll(followers);

        Comments comment0= new Comments(13,2,"Very nice and full of insights",Instant.now(),Instant.now());
        Comments comment1= new Comments(13,1,"Informative",Instant.now(),Instant.now());
        Comments comment2= new Comments(16,1,"Good Job",Instant.now(),Instant.now());
        Comments comment3= new Comments(27,3,"Just what i needed",Instant.now(),Instant.now());
        Comments comment4= new Comments(27,1,"Can you please go into more details",Instant.now(),Instant.now());
        Comments comment5= new Comments(95,0,"Nice",Instant.now(),Instant.now());
        Comments comment6= new Comments(111,1,"Thumbs up for this",Instant.now(),Instant.now());
        Comments comment7= new Comments(90,2,"Thank you",Instant.now(),Instant.now());
        List<Comments> comments=Arrays.asList(comment0,comment1,comment2,comment3,comment4,
        comment5,comment6,comment7);
        commentsRepository.saveAll(comments);


        Favorites favorites0=new Favorites(95,2);
        Favorites favorites1=new Favorites(95,1);
        Favorites favorites2=new Favorites(95,3);
        Favorites favorites3=new Favorites(16,1);
        Favorites favorites4=new Favorites(16,0);
        Favorites favorites5=new Favorites(25,1);
        Favorites favorites6=new Favorites(90,3);
        Favorites favorites7=new Favorites(90,1);
        Favorites favorites8=new Favorites(18,0);
        Favorites favorites9=new Favorites(25,1);
        Favorites favorites10=new Favorites(69,2);
        Favorites favorites11=new Favorites(70,3);
        Favorites favorites12=new Favorites(70,1);
        Favorites favorites13=new Favorites(37,0);  
        Favorites favorites14=new Favorites(39,2);
        Favorites favorites15=new Favorites(52,2);
        Favorites favorites16=new Favorites(72,1);
        Favorites favorites17=new Favorites(97,3);

        List<Favorites> favorites= Arrays.asList(favorites0,favorites1,favorites2,favorites3,favorites4,favorites5,
        favorites6,favorites7,favorites8,favorites9,favorites10,favorites11,favorites12,favorites13,favorites14,favorites15,favorites16,favorites17);
        favoritesRepository.saveAll(favorites);

        System.out.println("Database populated successfully");
    }

    
    
}
