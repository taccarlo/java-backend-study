package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping(value="index")
	public String getWelcome(Model model) {
		return welcomePage(model);
	}
	
	@RequestMapping(value="/")
	public String getWelcome2(Model model){
		return welcomePage(model);
	}
	
	public String welcomePage(Model model) {
		model.addAttribute("header","Welcome in Nation Website");
		model.addAttribute("hello", "Hello World");
		return "index";
		
	}
}
