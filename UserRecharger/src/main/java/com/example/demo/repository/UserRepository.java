package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.User;


public interface UserRepository extends JpaRepository<User,Long>{

	//User findByUName(String username);
// 	SQL Query
	@Query(value = "SELECT * FROM user_reg Where username LIKE %?% ", nativeQuery = true)
	Iterable<User> findByUName(String username);
	
	@Query(value = "SELECT * FROM user_reg Where id = ? ", nativeQuery = true)
	Iterable<User> findById(int id);
	
	boolean existsByUsername(String username);
	
	User findByUsername(String username);
	
	
}
