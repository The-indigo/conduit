package com.ajdeyemi.conduit.configs;

import java.util.HashMap;

import org.springframework.http.ResponseEntity;

public class GetError {
     public static ResponseEntity<?> getError(Exception e){
        HashMap<String,String> error= new HashMap<>();
        error.put("error",e.getMessage() );
        return ResponseEntity.status(401).body(error);
    }
}
