package com.ajdeyemi.conduit.services;

import java.time.Instant;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.JwtEncoderParameters;
import org.springframework.stereotype.Service;

@Service
public class TokenService {


    @Autowired
    JwtEncoder jwtEncoder;

    public String generateToken(Authentication authentication){
        Instant now= Instant.now();
        long expiry= 36000l;
        String scope=authentication.getAuthorities()
        .stream().map((a)->a.getAuthority()).collect(Collectors.joining(" "));

        JwtClaimsSet claims=JwtClaimsSet.builder().issuer("self")
        .issuedAt(now).expiresAt(now.plusSeconds(expiry))
    .subject(authentication.getName())
    .claim("scope", scope)
        .build();
        return this.jwtEncoder.encode(JwtEncoderParameters.from(claims)).getTokenValue();
    }
    
}
