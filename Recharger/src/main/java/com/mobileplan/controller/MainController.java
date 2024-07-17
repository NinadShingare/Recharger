package com.mobileplan.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.mobileplan.ctrlr.MobilePlanController;
import com.mobileplan.model.MobilePlan;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.ui.Model;


@Controller
@SpringBootApplication
@ComponentScan(basePackages = "com.*") 
@RequestMapping("/")
public class MainController extends SpringBootServletInitializer{
	
	public static void main(String[] args) {
        SpringApplication.run(MainController.class, args);
    }
	
	@Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
	        return builder.sources(MainController.class);
	    }


//	Logger Object
	Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired(required = true)
	MobilePlanController mobileplanc;
	
	private ResponseEntity<Iterable<MobilePlan>> planDetails;

	public Object adminFlag = "false";


//  Mobile Plan: User Login Page
	@RequestMapping("/")
	public String userLogin(Model model) {

		logger.info("Displaying user login page of mobile plan.");
		model.addAttribute("msg", "");
		adminFlag = "false";

		return "user-login";
	}


//	Mobile Plan: User Login Handler
	@RequestMapping(path = "/verify", method = RequestMethod.POST)
	public String userloginHandler(@RequestParam("username") String username, 
		@RequestParam("password") 
		String password, Model model) {

		logger.warn("Verifying username and password.");

		if (username.equals("admin@gmail.com") && !password.equals("Admin123")) {
			logger.error("Incorrect password.");
			model.addAttribute("msg", "PASSWORD");

			return "user-login";
		}
		else if (!username.equals("admin@gmail.com") && password.equals("Admin123")) {
			logger.error("Incorrect username.");
			model.addAttribute("msg", "USERNAME");

			return "user-login";
		}
		else if (!username.equals("admin@gmail.com") && !password.equals("Admin123")) {
			logger.error("Incorrect username as well as password.");
			model.addAttribute("msg", "BOTH");

			return "user-login";
		}
		else {
			logger.info("User Verified successfully.");
			model.addAttribute("admin", adminFlag);
			return "index";
		}
	}


//  Mobile Plan: Home Page
	@RequestMapping("/home")
	public String home(Model model) {

		logger.info("Displaying home page of mobile plan.");
		model.addAttribute("admin", adminFlag);

		return "index";
	}


//	Mobile Plan: Create Page
	@RequestMapping("/create")
	public String create(Model model) {

		logger.info("Displaying create page of mobile plan.");
		model.addAttribute("admin", adminFlag);

		return "create";
	}


//	Mobile Plan: Create Handler
	@RequestMapping(path = "/insert", method = RequestMethod.POST)
	public String createHandler(@ModelAttribute MobilePlan mobileplan, Model model) {

		model.addAttribute("msg", "DATA " + mobileplan);
		logger.warn("Creating a new mobile plan.");

		mobileplanc.create(mobileplan);

		planDetails = null;
		planDetails = mobileplanc.FindDetailsByName(mobileplan.getName());
		List<MobilePlan> plans = (List<MobilePlan>) planDetails.getBody();
		for (MobilePlan plan : plans) {
			mobileplan.setId(plan.getId());
		}

		logger.info("Mobile Plan has been successfully created.");
		model.addAttribute("plan", mobileplan);

		return "create-confirmation";
	}


//	Mobile Plan: Create Confirmation Page
	@RequestMapping("/create-confirmation")
	public String createConfirmation() {

		logger.info("Displaying create confirmation page of mobile plan.");

		return "create-confirmation";
	}


//	Mobile Plan: View Page
	@RequestMapping("/view")
	public String showDetailsHandler(Model model) {

		logger.warn("Retreiving all the available mobile plans.");
		planDetails = mobileplanc.readAll();
		List<MobilePlan> plans = (List<MobilePlan>) planDetails.getBody();
		model.addAttribute("plans", plans);
		logger.info("Displaying all the available mobile plans.");
		model.addAttribute("msg", "");
		model.addAttribute("admin", adminFlag);

		return "view";
	}


//	Mobile Plan: View Page: Update Handler
	@RequestMapping(path = "/update", method = RequestMethod.POST)
	public String updateHandler(@ModelAttribute MobilePlan mobileplan, Model model) {

		logger.warn("Updating mobile plan with ID " + mobileplan.getId() + ".");
		mobileplanc.update(mobileplan);
		logger.info("Mobile plan has been updated successfully.");
		model.addAttribute("plan", mobileplan);
		model.addAttribute("admin", adminFlag);

		return "update-confirmation";
	}


//	Mobile Plan: View Page: Update Confirmation Page
	@RequestMapping("/update-confirmation")
	public String updateConfirmation() {

		logger.info("Displaying update confirmation page of mobile plan.");

		return "update-confirmation";
	}


//	Mobile Plan: View Page: Delete Handler
	@RequestMapping("/delete/{id}")
	public String deleteHandler(@PathVariable(value = "id") Long id, Model model) {

		logger.warn("Deleting mobile plan with " + id + ".");
		mobileplanc.delete(id);
		logger.info("Mobile plan has been deleted successfully.");
		model.addAttribute("admin", adminFlag);

		return "delete-confirmation";
	}


//	Mobile Plan: View Page: Multiple Delete Handler
	@RequestMapping(path = "/deleteItems/", method = RequestMethod.POST)
	public String DeleteSelectedItemHandler(@RequestParam("inputVal") String values, Model model) {

		logger.warn("Deleting selected mobile plans.");

		String[] list1 = values.split(",");
		for (String idVal : list1)
			mobileplanc.delete(Long.valueOf(idVal));

		logger.info("Mobile plans has been deleted successfully with ID's " + values + ".");
		model.addAttribute("admin", adminFlag);

		return "delete-confirmation";
	}


//	Mobile Plan: View Page: Delete Confirmation Page
	@RequestMapping("/delete-confirmation")
	public String deleteConfirmation() {

		logger.info("Displaying delete confirmation page of mobile plan.");

		return "delete-confirmation";
	}


// 	Mobile Plan: View Page: Search Handler
	@RequestMapping(path = "/searchPlan", method = RequestMethod.GET)
	public String searchPlan(@RequestParam("keyword") String keyword,
		@RequestParam("searchBy") String searchBy, Model model) {

		planDetails = null; 

		if ( searchBy.equals("ID")) {
			logger.warn("Retreiving all the available mobile plans with ID " + keyword + ".");
			planDetails = mobileplanc.FindDetailsById(Integer.valueOf(keyword));
			logger.info("Displaying mobile plans with ID " + keyword + ".");
		}
		else if ( searchBy.equals("Name")) {
			logger.warn("Retreiving all the available mobile plans with name " + keyword + ".");
			planDetails = mobileplanc.FindDetailsByName(keyword);
			logger.info("Displaying mobile plans with name " + keyword + ".");
		}
		else if ( searchBy.equals("Price")) {
			logger.warn("Retreiving all the available mobile plans with price " + keyword + ".");
			planDetails = mobileplanc.FindDetailsByPrice(Integer.valueOf(keyword));
			logger.info("Displaying mobile plans with price " + keyword + ".");
		}
		else if ( searchBy.equals("Validity")) {
			logger.warn("Retreiving all the available mobile plans with validity " + keyword + ".");
			planDetails = mobileplanc.FindDetailsByValidity(Integer.valueOf(keyword));
			logger.info("Displaying mobile plans with validity " + keyword + ".");
		}

		List<MobilePlan> plans = (List<MobilePlan>) planDetails.getBody();
		model.addAttribute("plans", plans);
		logger.info("Showing all the available mobile plans.");
		model.addAttribute("msg", "SHOW");
		model.addAttribute("admin", adminFlag);

		return "view";
	}


//	Mobile Plan: About Us
	@RequestMapping("/about-us")
	public String aboutUs(Model model) {

		logger.info("Displaying about us page of mobile plan.");
		model.addAttribute("admin", adminFlag);

		return "about";
	}


//  Mobile Plan: Admin Login Page
@RequestMapping("/admin")
public String adminLogin(Model model) {

	logger.info("Displaying admin login page of mobile plan.");
	model.addAttribute("msg", "");

	return "admin-login";
}


//	Mobile Plan: Admin Login Handler
@RequestMapping(path = "/adminVerify", method = RequestMethod.POST)
public RedirectView adminloginHandler(@RequestParam("username") String username, 
	@RequestParam("password") 
	String password, Model model) {
	
	RedirectView redirectView = new RedirectView();

	logger.warn("Verifying username and password.");

	if (username.equals("admin") && !password.equals("admin")) {
		logger.error("Incorrect password.");
		model.addAttribute("msg", "PASSWORD");

		redirectView.setUrl("http://localhost:8080/admin");
		return redirectView;
	}
	else if (!username.equals("admin") && password.equals("admin")) {
		logger.error("Incorrect username.");
		model.addAttribute("msg", "USERNAME");

		redirectView.setUrl("http://localhost:8080/admin");
		return redirectView;
	}
	else if (!username.equals("admin") && !password.equals("admin")) {
		logger.error("Incorrect username as well as password.");
		model.addAttribute("msg", "BOTH");

		redirectView.setUrl("http://localhost:8080/admin");
		return redirectView;
	}
	else {
		logger.info("User Verified successfully.");
		redirectView.setUrl("http://localhost:8081/view-logs");
		adminFlag = "true";
		return redirectView;
	}
}
@RequestMapping("/contact")
public String contact(Model model) {
	System.out.println("This is contact page");
	model.addAttribute("admin", adminFlag);
	return "contact";
}
}