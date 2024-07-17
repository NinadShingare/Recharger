package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.example.demo.entity.Plan;

public interface MobilePlanDao extends JpaRepository<Plan,Long>{

// 	SQL Query
	@Query(value = "SELECT * FROM mobile_plan Where name LIKE %?% ", nativeQuery = true)
	Iterable<Plan> findByName(String keyword);
	
	@Query(value = "SELECT * FROM mobile_plan Where price = ? ", nativeQuery = true)
	Iterable<Plan> findByPrice(int price);
	
	@Query(value = "SELECT * FROM mobile_plan Where validity = ? ", nativeQuery = true)
	Iterable<Plan> findByValidity(int validity);

	@Query(value = "SELECT * FROM mobile_plan Where id = ? ", nativeQuery = true)
	Iterable<Plan> findById(int id);
}