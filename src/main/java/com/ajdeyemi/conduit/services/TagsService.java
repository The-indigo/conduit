package com.ajdeyemi.conduit.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ajdeyemi.conduit.repositories.TagsRepository;

@Service
public class TagsService {
    @Autowired
    TagsRepository tagsRepository;

    public HashMap<String,Object> getTags(){
        List<String> tags= new ArrayList<String>();
        var response= tagsRepository.findAll();
       Set<String> uniqueTags = new HashSet<>();
        uniqueTags = response.stream()
                            .map(item -> item.getTag())
                            .collect(Collectors.toSet());
                tags.addAll(uniqueTags);
       HashMap<String,Object> result=new HashMap<String,Object>();
       result.put("tags", tags);
        return result;
        
    }
    
}
