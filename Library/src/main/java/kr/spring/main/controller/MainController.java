package kr.spring.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String main() {
		return "redirect:/book/bookList.do";
	}
	
	@RequestMapping("/main/main.do")
	public String main(Model model) {
		return "main"; //tiles 설정의 식별자
	}
	
}
