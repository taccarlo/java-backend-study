package com.example.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping(value="index")
	public String getWelcome(Model model) {
		model.addAttribute("hi","Welcome in Nation Website");
		model.addAttribute("hello", "Hello World 1");
		return "index";
	}
	
	@RequestMapping(value="/")
	public String getWelcome2(Model model){
		model.addAttribute("hi","Welcome in Nation Website");
		model.addAttribute("hello", "Hello World 2");
		return "index";
	}
	
}
