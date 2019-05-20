package com.davidhuh.crpoc.repository;

import com.davidhuh.crpoc.model.*;
import org.springframework.data.repository.*;
public interface UserRepository extends CrudRepository<User, Integer> {
	
}
