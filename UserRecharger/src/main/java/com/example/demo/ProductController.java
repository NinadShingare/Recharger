package com.example.demo;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.ctrlr.MobilePlanController;
import com.example.demo.entity.Plan;
import com.example.demo.entity.User;
import com.example.demo.service.ProductService;
import com.example.demo.service.UserService;




//@RestController
@Controller
@SpringBootApplication
@ComponentScan(basePackages = "com.*") 
@RequestMapping("/")
public class ProductController extends SpringBootServletInitializer{
	public static void main(String[] args) {
        SpringApplication.run(ProductController.class, args);
    }
	
	@Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
	        return builder.sources(ProductController.class);
	    }
	
	//Logger Object
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Autowired(required = true)
	MobilePlanController mobileplanc;
	
	private ResponseEntity<Iterable<Plan>> planDetails;
	private ResponseEntity<Iterable<User>> user;
	public Object adminFlag = "false";
	
	
	@RequestMapping("/")
	//public String home() {
	public String login(Model model) {
		System.out.println("This is home page");
		logger.info("Displaying user login page of mobile plan.");
		model.addAttribute("msg", "");
		adminFlag = "false";
		return "user-login";
	}
	
//  Mobile Plan: Home Page
	@RequestMapping("/home")
	public String home(Model model) {

		logger.info("Displaying home page of mobile plan.");
		model.addAttribute("admin", adminFlag);

		return "index";
	}
	
//	Mobile Plan: User Login Handler
//	//@ResponseBody
//	@RequestMapping(path = "/verify", method = RequestMethod.POST)
//	public String userloginHandler(@RequestParam("username") String username, 
//		@RequestParam("password") 
//		String password, Model model) {
//
//		logger.warn("Verifying username and password.");
//
//		if (username.equals("user@gmail.com") && !password.equals("User123")) {
//			logger.error("Incorrect password.");
//			model.addAttribute("msg", "PASSWORD");
//
//			return "user-login";
//		}
//		else if (!username.equals("user@gmail.com") && password.equals("User123")) {
//			logger.error("Incorrect username.");
//			model.addAttribute("msg", "USERNAME");
//
//			return "user-login";
//		}
//		else if (!username.equals("user@gmail.com") && !password.equals("User123")) {
//			logger.error("Incorrect username as well as password.");
//			model.addAttribute("msg", "BOTH");
//
//			return "user-login";
//		}
//		else {
//			logger.info("User Verified successfully.");
//			model.addAttribute("admin", adminFlag);
//			return "index";
//		}
//	}
	
	
	//@ResponseBody
	@RequestMapping(path = "/verify", method = RequestMethod.POST)
	public String userloginHandler( @RequestParam("username") String username, 
		@RequestParam("password") 
		String password, Model model) {
		
		logger.warn("Verifying username and password.");

        User user = userService.findByUsername(username);
        System.out.println("c2");
        //System.out.println(user.getUsername());
        //System.out.println(user.getPassword());
        if (user != null && user.getPassword().equals(password)) {
            // Login successful
        	System.out.println("c3");
            model.addAttribute("admin", adminFlag);
            return "index"; // Redirect to the dashboard page
        } 
		else if (user != null && !user.getPassword().equals(password)) {
			logger.error("Incorrect  password.");
			model.addAttribute("msg", "PASSWORD");

			return "user-login";
		}
		else {
			logger.error("Incorrect username");
			model.addAttribute("msg", "USERNAME");
			return "user-login";
		}

	}
	
	
	
	@Autowired
	private ProductService service;
//	Mobile Plan: View Page
	
//	@ResponseBody
//	@GetMapping("/view")
//	public List<Plan> findAllPlans() {
//		
//		logger.warn("Retreiving all the available mobile plans.");
//		logger.info("Displaying all the available mobile plans.");
//		return service.getPlans();
//	}
	
//	Mobile Plan: View Page
	@RequestMapping("/view")
	public String showDetailsHandler(Model model) {

		logger.warn("Retreiving all the available mobile plans.");
		planDetails = mobileplanc.readAll();
		List<Plan> plans = (List<Plan>) planDetails.getBody();
		model.addAttribute("plans", plans);
		logger.info("Displaying all the available mobile plans.");
		model.addAttribute("msg", "");
		model.addAttribute("admin", adminFlag);

		return "view";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		System.out.println("This is contact page");
		return "contact";
	}
	
	@RequestMapping("/about-us")
	public String aboutus() {
		System.out.println("This is about page");
		return "about";
	}
	
	@RequestMapping("/register")
	public String register(Model model) {
		System.out.println("This is register page");
		model.addAttribute("msg", "");
		return "register";
	}
	
	
	@Autowired
	private UserService userService;
	// Mobile Plan: User Registration Handler
	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String registerUserHandler(@ModelAttribute User user, Model model) {
		System.out.println(user);
	    model.addAttribute("msg", "DATA " + user);
	    logger.warn("Registering a new user.");

	    // Check if the username already exists
	    if (userService.isUsernameExists(user.getUsername())) {
	        logger.warn("Username already exists. Redirecting to registration page with an error message.");
	        model.addAttribute("msg", "USERNAME_EXISTS");
	        return "redirect:/register";
	    }

	    // Add your additional validation logic here if needed

	    // Create the user account
	    userService.registerUser(user);
	    System.out.println(user);
	    logger.info("User has been successfully registered.");
	    model.addAttribute("user", user);

	    return "index";
	}
	
	@RequestMapping("/select")
	public String select() {
		System.out.println("This is select page");
		//model.addAttribute("admin", adminFlag);
		return "select-confirmation";
	}
}
