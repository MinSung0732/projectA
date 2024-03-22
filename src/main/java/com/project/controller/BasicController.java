package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.BasicService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/page/*")
@AllArgsConstructor	
@Controller
public class BasicController {
	
	private BasicService service;
	
	@GetMapping("/mainWeb")	
	public String mainWeb() {
		System.out.println("컨트롤러진입");
		return "page/mainWeb";
	}
}