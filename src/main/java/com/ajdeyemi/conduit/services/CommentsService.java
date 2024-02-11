package com.ajdeyemi.conduit.services;

import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Articles;
import com.ajdeyemi.conduit.models.Comments;
import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.repositories.ArticlesRepository;
import com.ajdeyemi.conduit.repositories.CommentsRepository;
import com.ajdeyemi.conduit.repositories.UsersRepository;

@Service
public class CommentsService {
    
    @Autowired
    ArticlesRepository articlesRepository;

    @Autowired
    CommentsRepository commentsRepository;

    @Autowired
    UsersRepository usersRepository;

    public Map<String, Object> addComment(String slug, String comment) throws Exception{
        // long article, long user, String comment
 String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users currentUser= usersRepository.findUsersByEmail(authenticated);
        if(slug!=null){
        Articles article= articlesRepository.findBySlug(slug);
        if(article!=null){
              Instant createdAt = Instant.now();
        Instant updatedAt = Instant.now();
            Comments newComment= new Comments(article.getId(),currentUser.getId(),comment,createdAt,updatedAt);
            commentsRepository.save(newComment);
            // ReturnedComment returnedComment=new ReturnedComment(newComment, currentUser);
            Map<String, Object>author=new HashMap<String, Object>();
            author.put("username", currentUser.getUsername());
            author.put("email", currentUser.getEmail());

            Map<String, Object> returnedObject =new HashMap<String, Object>();
            returnedObject.put("id", newComment.getId());
            returnedObject.put("createdAt", newComment.getCreatedAt());
            returnedObject.put("updatedAt", newComment.getUpdatedAt());
            returnedObject.put("body", newComment.getComment());
            returnedObject.put("author", author);

            return returnedObject;
        }else{
            throw new Exception("This article does not exist");
        }
        }else{
            throw new Exception("Article slug required");
        }
    }

    public List<Comments> getArticleComments(String slug)throws Exception{
        if(slug!=null){
            Articles getArticle= articlesRepository.findBySlug(slug);
            if(getArticle!=null){
                List <Comments> comments= commentsRepository.findByArticle(getArticle.getId());
                return comments;
            }else{
                throw new Exception("This article does not exist"); 
            }
        
        }else{
            throw new Exception("Article slug required");  
        }
    }

    public String deleteComment(String slug, long id) throws Exception{
        if(slug!=null){
            Articles getArticle= articlesRepository.findBySlug(slug);
            if(getArticle!=null){
               Optional <Comments> comments= commentsRepository.findById(id);  
               if(comments.isPresent() && comments.get().getArticle()==getArticle.getId()){
                commentsRepository.delete(comments.get());
                return "Successfully deleted the comment";
               }else{
                throw new Exception("This Operation is not permitted"); 
               }              
               
            }else{
                throw new Exception("This article does not exist"); 
            }
        }else{
            throw new Exception("Article slug required");  
        }
    }

}
