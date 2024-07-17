package com.example.demo.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UserRegDao;
import com.example.demo.entity.Plan;
import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;


@Service
public class UserService {

	
	 
	 //private final UserRegDao userRegDao;
	 @Autowired
	 //private final UserRegDao userRegDao;
	 private final UserRepository userRepository;

	 @Autowired
	 public UserService(UserRepository userRepository) {
	    this.userRepository = userRepository;
	 }
	
	
//    public Object registerUser(User user) {
//        // Implement the logic to register the user in the database
//        //userRepository.save(user);
//    	
//    	Optional<User> currentUser = userRepository.findById(user.getId());
//		if (!(currentUser.isPresent())) {
//			System.out.println("c1");
//			User user1 = userRepository.save(user);
//			System.out.println("c2");
//			return user1.getId();
//		} else {
//			return null;
//		}
//    }
    public void registerUser(User user) {
    	System.out.println("c1");
    	userRepository.save(user);
    	System.out.println("c2");
    }
    
    public boolean isUsernameExists(String username) {
        // Implement the logic to check if the username already exists in the database
        return userRepository.existsByUsername(username);
    }
// 	Mobile Plan: Find by Name
	public Iterable<User> findByUName(String username) {

		Iterable<User> userList = userRepository.findByUName(username);

		return userList;

	}
	
	
	
// 	Mobile Plan: Find by ID
	public Iterable<User> findById(int id) {

		Iterable<User> userList = userRepository.findById(id);

		return userList;
	}


	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		System.out.println("c1");
		return userRepository.findByUsername(username);
	}
}
