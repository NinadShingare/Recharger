package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Plan;
import com.example.demo.repository.ProductRepository;

import com.example.demo.dao.MobilePlanDao;

@Service
public class ProductService {
//	@Autowired
//	private ProductRepository repository;
	
	@Autowired
	MobilePlanDao mobilePlanDao;
	
	
//	public List<Plan> getPlans() {
//		return repository.findAll();
//	}
	
	
// 	Mobile Plan: Read
	public Object read(Long id) {
		Optional<Plan> person = mobilePlanDao.findById(id);
		if (person.isPresent()) {
			return person.get();
		} else {
			return null;
		}

	}
// 	Mobile Plan: Read all
	public Iterable<Plan> readAll() {
		Iterable<Plan> mobilePlanList = mobilePlanDao.findAll();
		return mobilePlanList;
	}
}
