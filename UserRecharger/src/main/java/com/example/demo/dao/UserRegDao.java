package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.example.demo.entity.User;

public interface UserRegDao extends JpaRepository<User,Long>{

// 	SQL Query
	@Query(value = "SELECT * FROM user_reg Where username LIKE %?% ", nativeQuery = true)
	Iterable<User> findByUName(String username);
	
//	@Query(value = "SELECT * FROM user_reg Where password = ? ", nativeQuery = true)
//	Iterable<User> findByPrice(int price);
//	
//	@Query(value = "SELECT * FROM user_reg Where validity = ? ", nativeQuery = true)
//	Iterable<User> findByValidity(int validity);
//
//	@Query(value = "SELECT * FROM user_reg Where id = ? ", nativeQuery = true)
//	Iterable<User> findById(int id);
}
