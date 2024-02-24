package com.ajdeyemi.conduit.configs;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.interfaces.RSAPublicKey;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.RSAKey;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;

@Configuration
@EnableWebSecurity
public class SecurityConfig {


       @Autowired
    CustomUserDetailsService userDetailsService;

        @Bean
public AuthenticationManager authenticationManager(){
    DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
    authProvider.setUserDetailsService(userDetailsService);
    authProvider.setPasswordEncoder(bCryptPasswordEncoder());
    return new ProviderManager(authProvider);
}

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
              http
        .authorizeHttpRequests((authorize)->authorize.requestMatchers("/api/users","/api/users/login").permitAll().anyRequest().authenticated())
        .csrf((csrf) -> csrf.disable())
        .sessionManagement((session) -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
        .oauth2ResourceServer((oauth2)->oauth2.jwt(Customizer.withDefaults()));
        return http.build();
    }

    @Bean
    public KeyPair keyPair(){
        try{
            KeyPairGenerator keyPairGenerator=KeyPairGenerator.getInstance("RSA");
            keyPairGenerator.initialize(2048);
            return keyPairGenerator.generateKeyPair();
        }catch(Exception e){
            throw new RuntimeException(e);
        }
    }

    @Bean
    public RSAKey rsaKey(KeyPair keyPair){
        return new RSAKey.Builder((RSAPublicKey)keyPair.getPublic())
        .privateKey(keyPair.getPrivate())
        .keyID(UUID.randomUUID().toString())
        .build();
    }

    @Bean
    public JWKSource <SecurityContext> jwkSource(RSAKey rsaKey){
        var jwkSet= new JWKSet(rsaKey);
        // using lambda code to mame it neater
        return (jwkSelector,context)-> jwkSelector.select(jwkSet);
    
    }

    @Bean
    public JwtDecoder jwtDecoder(RSAKey rsaKey) throws JOSEException{
        return NimbusJwtDecoder.withPublicKey(rsaKey.toRSAPublicKey()).build();
    }
    
    @Bean
    public JwtEncoder jwtEncoder(JWKSource <SecurityContext> jwkSource){
        return new NimbusJwtEncoder(jwkSource);
    }
  

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder(){
        BCryptPasswordEncoder encoder= new BCryptPasswordEncoder();
        return encoder;
    }
    
}
