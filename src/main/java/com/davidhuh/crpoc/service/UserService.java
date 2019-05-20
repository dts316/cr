package com.davidhuh.crpoc.service;

import org.springframework.stereotype.*;
import org.springframework.beans.factory.annotation.*;
import com.davidhuh.crpoc.repository.UserRepository;
import com.davidhuh.crpoc.model.User;
import java.util.*;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        userRepository.findAll().forEach(user -> users.add(user));
        return users;
    }

    public User getUserById(int id) {
        return userRepository.findById(id).get();
    }


    public void saveOrUpdate(User user) {
        userRepository.save(user);
    }

    public void delete(int id) {
        userRepository.deleteById(id);
    }
}
