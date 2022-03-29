package com.group6.shopping;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.group6.shopping.carts.services.CartsService;

/**
 * Handles requests for the application home page.
 */
@Controller

public class HomeController {

	@Autowired
	private CartsService cartsService;


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) throws Exception {
		System.out.println("home");
		return "home";
	}
}
