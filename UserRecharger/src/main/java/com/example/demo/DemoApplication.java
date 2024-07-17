package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@EntityScan
//@ComponentScan(basePackages= {"com.example.demo.controller"})
//@ComponentScan(basePackages= {"com.example.demo.ctrl"})
public class DemoApplication {
	public DemoApplication() {
		
	}
	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}
