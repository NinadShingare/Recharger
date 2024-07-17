package com.mobileplan.ctrlr;

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

import com.mobileplan.dao.MobilePlanDao;
import com.mobileplan.model.Auditlog;
import com.mobileplan.model.MobilePlan;
import com.mobileplan.srvc.MobilePlanSrvc;


@Component
@RestController
@RequestMapping("/mp")
public class MobilePlanController {

	@Autowired
	MobilePlanSrvc mpSrvc;

	@Autowired
	MobilePlanDao mobilePlanDao;

	RestTemplate restTemplate = new RestTemplate();
	

//	Mobile Plan: POST
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Object> create(@RequestBody MobilePlan inputentity) {
		ResponseEntity<Object> mpResponse;
		Date date = new Date();
		Long mobilePlan1 = (Long) mpSrvc.create(inputentity);
		Object mobilePlan= (Object) mpSrvc.create1(mobilePlan1);
		String planName=mpSrvc.create2(mobilePlan1);
		
		String m = "Already ID : " + inputentity.getId() + " Exist";
		if (mobilePlan != null) {
			Long pId=mobilePlan1;
			String pName=planName;
			mpResponse = new ResponseEntity<Object>(mobilePlan, null, HttpStatus.CREATED);
			try {
				HttpEntity<Auditlog> request = new HttpEntity<Auditlog>(
						new Auditlog("CREATED", mpResponse.getBody().toString().replace("Optional[", "").replace("]", ""),pName,pId,"-",0,0,"-", date));
				restTemplate.postForObject("http://localhost:8081/audit", request, 
				Auditlog.class);			} catch (Exception e) {
				System.out.println("AuditLog Rest Template Error.");
			}

			return mpResponse;
		} else {
			mpResponse = new ResponseEntity<Object>(m, null, HttpStatus.NOT_ACCEPTABLE);
			return mpResponse;
		}
	}


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
	public ResponseEntity<Iterable<MobilePlan>> readAll() {
		ResponseEntity<Iterable<MobilePlan>> mpResponse;
		Iterable<MobilePlan> mobilePlanList = mpSrvc.readAll();

		List<MobilePlan> newList = new ArrayList<>();
		MobilePlanController.addAll(newList, mobilePlanList.iterator());

		mpResponse = new ResponseEntity<Iterable<MobilePlan>>(mobilePlanList, null, 
			HttpStatus.OK);

		return mpResponse;
	}


//	Mobile Plan: PATCH
	@RequestMapping(method = RequestMethod.PATCH) // OR PUT
	public ResponseEntity<Object> update(@RequestBody MobilePlan tobemerged) {
		ResponseEntity<Object> planResponse = null;
		String up=mpSrvc.update1(tobemerged);

		Date date = new Date();

		Object mobilePlan = mpSrvc.update(tobemerged);

		if (mobilePlan != null) {
			String paName=tobemerged.getName();
			String paDisc=tobemerged.getDescription();
			int paVal=tobemerged.getValidity();
			int paPric=tobemerged.getPrice();
			Long pId=tobemerged.getId();
			planResponse = new ResponseEntity<Object>(mobilePlan, null, HttpStatus.OK);

			try {
				HttpEntity<Auditlog> request = new HttpEntity<Auditlog>(
						new Auditlog("UPDATED", planResponse.getBody().toString(),paName,pId,paDisc,paVal,paPric, up, date));
						restTemplate.postForObject("http://localhost:8081/audit", request, Auditlog.class);
			} catch (Exception e) {
				System.out.println("AuditLog Generating Error.");
			}

			return planResponse;
		} else {
			String Response = "ERROR: DATA WITH A ID->" + tobemerged.getId() + " DOES NOT EXIST";
			planResponse = new ResponseEntity<Object>(Response, null, HttpStatus.NOT_FOUND);
			return planResponse;
		}
	}


//	Mobile Plan: DELETE
	@RequestMapping(value = "{planid}", method = RequestMethod.DELETE)
	public ResponseEntity<Object> delete(@PathVariable(value = "planid") Long planid) {
		ResponseEntity<Object> planResponse = null;
		Date date = new Date();
		Long dId=planid;
		Object dName=mpSrvc.delete1(planid);
		Object delete = mpSrvc.delete(planid);

		if (delete != null) {
			planResponse = new ResponseEntity<Object>(delete, null, HttpStatus.CREATED);
			
			try {
				HttpEntity<Auditlog> request = new HttpEntity<Auditlog>(
						new Auditlog("DELETED", planResponse.getBody().toString(),dName.toString(),dId,"-",0,0,"-", date));
						restTemplate.postForObject("http://localhost:8081/audit", request, Auditlog.class);
			} catch (Exception e) {
				System.out.println("AuditLog generating Error");
			}

			return planResponse;
		} else {
			String Response = "ID not found";
			planResponse = new ResponseEntity<Object>(Response, null, HttpStatus.NOT_FOUND);
			return planResponse;
		}
	}


// 	Mobile Plan: DELETE ALL
	@RequestMapping(method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteAll() {
		ResponseEntity<?> planResponse = null;
		mpSrvc.deleteAll();
		planResponse = new ResponseEntity<String>("All plan successfully deleted", HttpStatus.OK);
		Date date = new Date();
		try {
			HttpEntity<Auditlog> request = new HttpEntity<Auditlog>
			(new Auditlog("DELETED-ALL", "[]","ALL ID",null,"-",0,0,"-", date ));
			restTemplate.postForObject("http://localhost:8081/audit", request, 
					Auditlog.class);
		} catch (Exception e) {
			System.out.println("AuditLog Generating Error");
		}

		return planResponse;
	}


// 	Mobile Plan: GET by Name
	@RequestMapping(value = "name/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<Iterable<MobilePlan>> FindDetailsByName(@PathVariable(value = "keyword") 
		String keyword) {

		ResponseEntity<Iterable<MobilePlan>> mpResponse;

		Iterable<MobilePlan> mobilePlanList = mpSrvc.findByName(keyword);

		mpResponse = new ResponseEntity<Iterable<MobilePlan>>(mobilePlanList, null, 
		HttpStatus.OK);

		return mpResponse;
	}


//	 Mobile Plan: GET by Price
	@RequestMapping(value = "price/{price}", method = RequestMethod.GET)
	public ResponseEntity<Iterable<MobilePlan>> FindDetailsByPrice(@PathVariable(value = "price") 
		int price) {

		ResponseEntity<Iterable<MobilePlan>> mpResponse;

		Iterable<MobilePlan> mobilePlanList = mpSrvc.findByPrice(price);

		mpResponse = new ResponseEntity<Iterable<MobilePlan>>(mobilePlanList, null, 
		HttpStatus.OK);

		return mpResponse;
	}


// 	Mobile Plan: GET by Validity
	@RequestMapping(value = "validity/{validity}", method = RequestMethod.GET)
	public ResponseEntity<Iterable<MobilePlan>> FindDetailsByValidity(@PathVariable(value = "validity") 
		int validity) {

		ResponseEntity<Iterable<MobilePlan>> mpResponse;

		Iterable<MobilePlan> mobilePlanList = mpSrvc.findByValidity(validity);

		mpResponse = new ResponseEntity<Iterable<MobilePlan>>(mobilePlanList, null, 
		HttpStatus.OK);

		return mpResponse;
	}

	// Mobile Plan: GET by ID
	@RequestMapping(value = "id/{id}", method = RequestMethod.GET)
	public ResponseEntity<Iterable<MobilePlan>> FindDetailsById(@PathVariable(value = "id") int id) {

		ResponseEntity<Iterable<MobilePlan>> mpResponse;

		Iterable<MobilePlan> mobilePlanList = mpSrvc.findById(id);

		mpResponse = new ResponseEntity<Iterable<MobilePlan>>(mobilePlanList, null, 
		HttpStatus.OK);

		return mpResponse;
	}
}