package com.mobileplan.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.mobileplan.model.MobilePlan;

public interface MobilePlanDao extends PagingAndSortingRepository<MobilePlan, Long>{

// 	SQL Query
	@Query(value = "SELECT * FROM mobile_plan Where name LIKE %?% ", nativeQuery = true)
	Iterable<MobilePlan> findByName(String keyword);
	
	@Query(value = "SELECT * FROM mobile_plan Where price = ? ", nativeQuery = true)
	Iterable<MobilePlan> findByPrice(int price);
	
	@Query(value = "SELECT * FROM mobile_plan Where validity = ? ", nativeQuery = true)
	Iterable<MobilePlan> findByValidity(int validity);

	@Query(value = "SELECT * FROM mobile_plan Where id = ? ", nativeQuery = true)
	Iterable<MobilePlan> findById(int id);
}