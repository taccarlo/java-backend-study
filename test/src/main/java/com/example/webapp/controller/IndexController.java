package com.example.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping(value="index")
	public String getWelcome(Model model) {
		model.addAttribute("title_of_page","Welcome in My Website");
		model.addAttribute("body_of_page", "This is the index page");
		return "index";
	}
	
	@RequestMapping(value="/")
	public String getWelcome2(Model model){
		model.addAttribute("title_of_page","Welcome in My Website");
		model.addAttribute("body_of_page", "This is the default page");
		return "index";
	}
	
}
