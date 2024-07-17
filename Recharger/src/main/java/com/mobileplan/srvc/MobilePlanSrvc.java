package com.mobileplan.srvc;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileplan.dao.MobilePlanDao;
import com.mobileplan.model.MobilePlan;


@Service
public class MobilePlanSrvc {

	@Autowired
	MobilePlanDao mobilePlanDao;


// 	Mobile Plan: Create
	public Object create(MobilePlan entity) {
		
		Optional<MobilePlan> currentMobilePlan = mobilePlanDao.findById(entity.getId());
		if (!(currentMobilePlan.isPresent())) {
			MobilePlan mobilePlan = mobilePlanDao.save(entity);
			return mobilePlan.getId();
		} else {
			return null;
		}
	}


// 	Mobile Plan: Read
	public Object read(Long id) {
		Optional<MobilePlan> person = mobilePlanDao.findById(id);
		if (person.isPresent()) {
			return person.get();
		} else {
			return null;
		}

	}


// 	Mobile Plan: Read all
	public Iterable<MobilePlan> readAll() {
		Iterable<MobilePlan> mobilePlanList = mobilePlanDao.findAll();
		return mobilePlanList;
	}


// 	Mobile Plan: Update
	public String update1(MobilePlan tobemerged) {

		// Check the Existing entity to be updated
		Boolean isExist = mobilePlanDao.existsById(tobemerged.getId());
		String upd="";
		if (isExist) {
			// Cloning that Entity
			Optional<MobilePlan> currentMobilePlan = mobilePlanDao.findById(tobemerged.getId());
			MobilePlan obj = currentMobilePlan.get();
			String a= obj.getName(),b=tobemerged.getName();
					
			String c=obj.getDescription();
			String d=tobemerged.getDescription();
			System.out.println(c);
			System.out.println(d);
			// validating updated fields

			if (!a.equals(b)) {
				
				upd=upd+"Name, ";
			}

			if (!c.equals(d)) {
				
				upd=upd+"Description, ";
			}

			if ( obj.getValidity() !=tobemerged.getValidity()) {
				
				upd=upd+"Validity, ";
			}

			if (obj.getPrice()!=tobemerged.getPrice()  ) {
				
				upd=upd+"Price";
			}

			
			return upd ;
		
		}

		return null;
	}


// 	Mobile Plan: Update
	public Object update(MobilePlan tobemerged) {

		// Check the Existing entity to be updated
		Boolean isExist = mobilePlanDao.existsById(tobemerged.getId());

		if (isExist) {
			// Cloning that Entity
			Optional<MobilePlan> currentMobilePlan = mobilePlanDao.findById(tobemerged.getId());
			MobilePlan obj = currentMobilePlan.get();

			// validating updated fields

			if (tobemerged.getName() != null) {
				obj.setName(tobemerged.getName());
			}

			if (tobemerged.getDescription() != null) {
				obj.setDescription(tobemerged.getDescription());
			}

			if (tobemerged.getValidity() != 0) {
				obj.setValidity(tobemerged.getValidity());
			}

			if (tobemerged.getPrice() != 0) {
				obj.setPrice(tobemerged.getPrice());
			}

			Object mobilePlan = mobilePlanDao.save(obj);
			return mobilePlan;
		}

		return null;
	}


// 	Mobile Plan: Delete
	public Object delete1(Long planid) {
		Optional<MobilePlan> currentMobilePlan = mobilePlanDao.findById(planid);
		MobilePlan obj = currentMobilePlan.get();
		return obj.getName();
	}


// 	Mobile Plan: Delete
	public Object delete(Long planid) {
		Optional<MobilePlan> currentMobilePlan = mobilePlanDao.findById(planid);

		if (currentMobilePlan.isPresent()) {
			mobilePlanDao.deleteById(planid);

			return currentMobilePlan.get();
		} else {
			return null;
		}
	}


// 	Mobile Plan: Delete all
	public Object deleteAll() {

		Iterable<MobilePlan> mobilePlanList = mobilePlanDao.findAll();

		mobilePlanDao.deleteAll();

		return mobilePlanList;
	}


// 	Mobile Plan: Find by Name
	public Iterable<MobilePlan> findByName(String keyword) {

		Iterable<MobilePlan> mobilePlanList = mobilePlanDao.findByName(keyword);

		return mobilePlanList;

	}


// 	Mobile Plan: Find by Price
	public Iterable<MobilePlan> findByPrice(int price) {

		Iterable<MobilePlan> mobilePlanList = mobilePlanDao.findByPrice(price);

		return mobilePlanList;

	}


// 	Mobile Plan: Find by Validity
	public Iterable<MobilePlan> findByValidity(int validity) {

		Iterable<MobilePlan> mobilePlanList = mobilePlanDao.findByValidity(validity);

		return mobilePlanList;
	}


// 	Mobile Plan: Find by ID
	public Iterable<MobilePlan> findById(int id) {

		Iterable<MobilePlan> mobilePlanList = mobilePlanDao.findById(id);

		return mobilePlanList;
	}
	
	public Object create1(Long mobilePlan1) {
		Optional<MobilePlan> currentMobilePlan = mobilePlanDao.findById(mobilePlan1);
		
		return currentMobilePlan;
		
	}



	public String create2(Long mobilePlan1) {
		Optional<MobilePlan> currentMobilePlan = mobilePlanDao.findById(mobilePlan1);
		MobilePlan obj = currentMobilePlan.get();
		return obj.getName();
	}
}