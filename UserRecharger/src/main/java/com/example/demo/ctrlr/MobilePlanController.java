package com.example.demo.ctrlr;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.example.demo.dao.MobilePlanDao;
import com.example.demo.entity.Plan;
import com.example.demo.service.ProductService;
import com.example.demo.ctrlr.MobilePlanController;


@Component
@RestController
@RequestMapping("/mp")
public class MobilePlanController {

	@Autowired
	ProductService mpSrvc;

	@Autowired
	MobilePlanDao mobilePlanDao;

	RestTemplate restTemplate = new RestTemplate();
	
//	Mobile Plan: GET by ID
	@RequestMapping(path = "{id}", method = RequestMethod.GET)
	public ResponseEntity<?> read(@PathVariable(value = "id") Long id) {
		ResponseEntity<?> mpResponse = null;

		Object readSingle = mpSrvc.read(id);
		if (readSingle != null) {
			mpResponse = new ResponseEntity<Object>(readSingle, null, HttpStatus.OK);
		} else {
			mpResponse = new ResponseEntity<String>("Not Found", null, 
			HttpStatus.NOT_FOUND);
		}

		return mpResponse;
	}


	public static <T> void addAll(Collection<T> collection, Iterator<T> iterator) {
		while (iterator.hasNext()) {
			collection.add(iterator.next());
		}
	}

//	Mobile Plan: GET ALL
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Iterable<Plan>> readAll() {
		ResponseEntity<Iterable<Plan>> mpResponse;
		Iterable<Plan> mobilePlanList = mpSrvc.readAll();

		List<Plan> newList = new ArrayList<>();
		MobilePlanController.addAll(newList, mobilePlanList.iterator());

		mpResponse = new ResponseEntity<Iterable<Plan>>(mobilePlanList, null, 
			HttpStatus.OK);

		return mpResponse;
	}

}