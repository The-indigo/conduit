package com.ajdeyemi.conduit.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.ajdeyemi.conduit.models.Tags;

public interface TagsRepository extends JpaRepository<Tags, Long>  {
    
}
