package com.ajdeyemi.conduit.services;

import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Articles;
import com.ajdeyemi.conduit.models.Comments;
import com.ajdeyemi.conduit.models.ReturnedComment;
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

            Map<String, Object>returnedValue= new HashMap<String,Object>();
            returnedValue.put("comment", returnedValue);
            return returnedValue;
        }else{
            throw new Exception("This article does not exist");
        }
        }else{
            throw new Exception("Article slug required");
        }
    }

        private List<Map<String, Object>> commentObjectList(List<Comments> comments, List<Users> author) {
        return comments.stream().map(comment -> {
            var authorId = comment.getAuthor();
            Users user = author.stream()
                    .filter(u -> u.getId() == (authorId))
                    .findFirst().get();

            String username = user.getUsername();
            String email = user.getEmail();
            long id = user.getId();

            Map<String, Object> authorMap = new HashMap<>();
            authorMap.put("username", username);
            authorMap.put("email", email);
            authorMap.put("id", id);

            Map<String, Object> commentMap = new HashMap<>();
            commentMap.put("id", comment.getId());
            commentMap.put("createdAt", comment.getCreatedAt());
            commentMap.put("updatedAt", comment.getUpdatedAt());
            commentMap.put("body", comment.getComment());
            commentMap.put("author", authorMap);


            return commentMap;
        }).collect(Collectors.toList());
    }

    public Map<String, Object> getArticleComments(String slug)throws Exception{
        if(slug!=null){
            Articles getArticle= articlesRepository.findBySlug(slug);
            if(getArticle!=null){
                List <ReturnedComment> response= commentsRepository.findComments(getArticle.getId());
                List<Users> author = response.stream().map(item -> item.getAuthor()).collect(Collectors.toList());
               List<Comments> comments=response.stream().map(item->item.getComment()).collect(Collectors.toList());
               
               List<Map<String, Object>> result = commentObjectList(comments, author);
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("comments", result);
            return resultMap;

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
