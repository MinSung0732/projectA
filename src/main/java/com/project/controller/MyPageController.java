package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.ListDto;
import com.project.dto.SignUpDto;
import com.project.dto.WeightDto;
import com.project.service.BasicService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/myhome/*")
@AllArgsConstructor	
@Controller
public class MyPageController {
	
	private final BasicService service;
	
	@GetMapping("/myPage")
	public void myPage(@RequestParam("id") String id, Model model) {
		System.out.println("myhome 컨트롤러 진입...................");
		model.addAttribute("graph",service.searchList(id));
	}
	
}