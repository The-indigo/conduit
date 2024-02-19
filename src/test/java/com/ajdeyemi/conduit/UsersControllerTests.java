package com.ajdeyemi.conduit;

import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.aspectj.lang.annotation.Before;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.ajdeyemi.conduit.controllers.UsersController;
import com.ajdeyemi.conduit.models.Roles;
import com.ajdeyemi.conduit.models.Users;
import com.ajdeyemi.conduit.services.UsersService;
import com.fasterxml.jackson.databind.ObjectMapper;

@ExtendWith(SpringExtension.class) 
@ContextConfiguration
@WebMvcTest(UsersController.class)
public class UsersControllerTests {

    @Autowired
    private MockMvc mockMvc;
    @Autowired 
    WebApplicationContext webApplicationContext;
    @MockBean
    private UsersService usersService;
    @Autowired
    private ObjectMapper objectMapper;

    @Test
    void shouldRegisterUser() throws Exception {

        List<Roles> roles = new ArrayList<>();
        roles.add(Roles.User);
        Users newUser = new Users();
        newUser.setEmail("newuser@gmail.com");
        newUser.setPassword("password123");
        newUser.setUsername("newusername");
        newUser.setRole(Arrays.asList(Roles.User));

        // Convert the user object to JSON string
        String jsonContent = objectMapper.writeValueAsString(newUser);
        when(usersService.register(anyString(), anyString(), anyString(), anyList()))
                .thenReturn(new Users());

        this.mockMvc.perform(MockMvcRequestBuilders.post("/api/users/")
                .contentType(MediaType.APPLICATION_JSON)
                .content(jsonContent))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.id").exists());

    }

    @Test
    void shouldLogin() throws Exception {

    }

}
