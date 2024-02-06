package com.ajdeyemi.conduit.services;

import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.models.Articles;
import com.ajdeyemi.conduit.models.ReturnedArticle;
import com.ajdeyemi.conduit.models.Tags;
import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.repositories.ArticlesRepository;
import com.ajdeyemi.conduit.repositories.FollowersRepository;
import com.ajdeyemi.conduit.repositories.TagsRepository;
import com.ajdeyemi.conduit.repositories.UsersRepository;

import net.datafaker.Faker;

@Service
public class ArticlesService {
    @Autowired
    ArticlesRepository articlesRepository;

    @Autowired
    TagsRepository tagsRepository;

    @Autowired
    FollowersRepository followersRepository;

    @Autowired
    UsersRepository usersRepository;

    Faker faker = new Faker();


    public Page<Articles> geArticles(int page, int size) {
        PageRequest articles = PageRequest.of(page, size);
        return articlesRepository.findAll(articles);
    }

    public Map<String,Object> getFeed()throws Exception {
        String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users currentUser = usersRepository.findUsersByEmail(authenticated);
       List<ReturnedArticle> feed= articlesRepository.getFeed(currentUser.getId());
       if(!(feed.isEmpty())){
        List<Articles> articles=feed.stream().map(item->item.getArticle()).collect(Collectors.toList());

        List<Tags>tags =feed.stream()
                    .flatMap(item->item.getTag().stream())
                    .collect(Collectors.toList());
        List<Users> author =feed.stream().map(item->item.getAuthor()).collect(Collectors.toList());
      

        List<Map<String, Object>> result = articles.stream().map(article -> {
            var authorId = article.getAuthor();
            Users user = author.stream()
                    .filter(u -> u.getId()==(authorId))
                    .findFirst().get();

                    String username=user.getUsername();
                    String email=user.getEmail();
                    long id= user.getId();

                 Map<String, Object> authorMap= new HashMap<>();   
                 authorMap.put("username", username);
                 authorMap.put("email", email);
                 authorMap.put("id", id);
                 
            List<String> articleTags = tags.stream()
                    .filter(tag -> tag.getArticle()==(article.getId())).map(item -> item.getTag())
                    .collect(Collectors.toList());

                    Map<String, Object> articleMap= new HashMap<>();  
                    articleMap.put("slug", article.getSlug());
                    articleMap.put("title", article.getTitle() );
                    articleMap.put( "description",article.getDescription());
                    articleMap.put("body", article.getBody());
                    articleMap.put("createdAt", article.getCreatedAt());
                    articleMap.put("updatedAt", article.getUpdatedAt());
                    articleMap.put("favoritesCount", article.getFavoriteCount());
                    articleMap.put("tagsList", articleTags);
                    articleMap.put("author",authorMap);

            return articleMap;
        }).collect(Collectors.toList());

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("articles", result);
        return resultMap;

    }else{
        throw new Exception("Your feed is Empty.Try and follow users to read their latest articles");
    }
         
       }
        
    

    public HashMap<String,Object> getArticle(String slug) throws Exception {
        if (slug != null && !(slug.isBlank())) {
           List<ReturnedArticle> items=articlesRepository.getOneArticle(slug);
          
           if(!(items.isEmpty())){
           //Joins the tags array into one array and selects the tag field from the array of objects
          var tags= items.stream().flatMap(item->item.getTag().stream())
                    .map(item->item.getTag())
                    .collect(Collectors.toList());
         var author=items.get(0).getAuthor();
         var article =items.get(0).getArticle();

         HashMap<String, Object> authorObject=new HashMap<>();
         authorObject.put("username", author.getUsername());
         authorObject.put("email", author.getEmail());
      
         HashMap<String, Object> articleObject=new HashMap<>();
         articleObject.put("slug", article.getSlug());
         articleObject.put("title", article.getTitle());
         articleObject.put("description", article.getDescription());
         articleObject.put("body",article.getBody());
         articleObject.put("tagsList", tags);
         articleObject.put("createdAt",article.getCreatedAt());
         articleObject.put("updatedAt",article.getUpdatedAt());
         articleObject.put("favoritesCount", article.getFavoriteCount());
         articleObject.put("author", authorObject);
         
         HashMap<String, Object> result=new HashMap<>();
          result.put("article", articleObject);
            return result;
           }else{
            throw new Exception("This article cannot be found");
           }
        } else {
            throw new Exception("Article Slug is required!!");
        }
    }

    public HashMap<String,Object> createArticle(String title, String description, String
    body,List<String> tags) throws Exception{
    String authenticated =
    SecurityContextHolder.getContext().getAuthentication().getName();
    Users currentUser= usersRepository.findUsersByEmail(authenticated);
    if(title==null){
    throw new Exception("Title is a required field");
    }
    if(description==null){
    throw new Exception("Description is a required field");
    }
    if(body==null){
    throw new Exception("Body is a required field");
    }
    if(tags==null){
        throw new Exception("Tags is a required field");
        }
    if(title.isEmpty() || description.isEmpty() || body.isEmpty() ||
    tags.size()==0 || tags.isEmpty()){
    throw new Exception("You cannot have empty fields");
    }
    String slug = title.trim().replace(" ", "-");
    int favoriteCount=0;
    Instant createdAt = Instant.now();
    Instant updatedAt = Instant.now();


    Articles article=new Articles(slug,currentUser.getId(),title,description, body,favoriteCount, createdAt, updatedAt);
    articlesRepository.save(article);
    for(String tag: tags){
    Tags articleTag= new Tags(tag,article.getId());
    tagsRepository.save(articleTag);
    }

    HashMap<String, Object> authorObject=new HashMap<>();
    authorObject.put("username", currentUser.getUsername());
    authorObject.put("email", currentUser.getEmail());
 
    HashMap<String, Object> articleObject=new HashMap<>();
    articleObject.put("slug", article.getSlug());
    articleObject.put("title", article.getTitle());
    articleObject.put("description", article.getDescription());
    articleObject.put("body",article.getBody());
    articleObject.put("tagsList", tags);
    articleObject.put("createdAt",article.getCreatedAt());
    articleObject.put("updatedAt",article.getUpdatedAt());
    articleObject.put("favoritesCount", article.getFavoriteCount());
    articleObject.put("author", authorObject);


    HashMap<String, Object> result=new HashMap<>();
     result.put("article", articleObject);
    return result;
    }

    public Articles updateArticle(String slug, String title, String description, String body) throws Exception {
        String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users currentUser = usersRepository.findUsersByEmail(authenticated);
        if (slug != null) {
            Articles article = articlesRepository.findBySlug(slug);
            if (article.getAuthor() == currentUser.getId()) {
                String setTitle = title != null ? title : article.getTitle();
                String setDescription = description != null ? description : article.getDescription();
                String setBody = body != null ? body : article.getBody();
                article.setTitle(setTitle);
                article.setDescription(setDescription);
                article.setBody(setBody);
                article.setUpdatedAt(Instant.now());
                articlesRepository.save(article);
                return article;
            } else {
                throw new Exception("You are not permitted to update this article");
            }
        } else {
            throw new Exception("Article slug required");
        }

    }

    public String deleteArticle(String slug) throws Exception {
        String authenticated = SecurityContextHolder.getContext().getAuthentication().getName();
        Users currentUser = usersRepository.findUsersByEmail(authenticated);
        if (slug != null) {
            Articles article = articlesRepository.findBySlug(slug);
            if (article.getAuthor() == currentUser.getId()) {
                articlesRepository.delete(article);
                return article.getTitle() + " has been deleted successfully";
            } else {
                throw new Exception("You are not permitted to delete this article");
            }
        } else {
            throw new Exception("Article slug required");
        }
    }




    public void generateAndSaveData(int numberOfEntries) {

        List<String> tags = new ArrayList<>();
        tags.add(faker.book().genre());
        tags.add(faker.book().genre());
        tags.add(faker.book().genre());

        for (int i = 0; i < numberOfEntries; i++) {
            Articles article = new Articles();
            article.setAuthor(0);
            String title = faker.book().title();
            article.setTitle(title);
            article.setDescription(faker.text().text(20));
            article.setBody(faker.text().text(150, 300));
            article.setFavoriteCount(0);

      Instant startDate = Instant.now().minusSeconds(31536000); // One year ago in seconds
      Instant endDate = Instant.now();

      long randomTimestamp = ThreadLocalRandom.current().nextLong(startDate.toEpochMilli(), endDate.toEpochMilli());

      

   article.setCreatedAt( Instant.ofEpochMilli(randomTimestamp));
   article.setUpdatedAt(Instant.ofEpochMilli(randomTimestamp));
            String slug = title.trim().replace(" ", "-");
            article.setSlug(slug);
            articlesRepository.save(article);

            for (String tag : tags) {
                Tags articleTag = new Tags(tag, article.getId());
                tagsRepository.save(articleTag);
            }

        }
    }

}



