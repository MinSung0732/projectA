package com.project.controller;

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
import com.project.dto.WeightDto;
import com.project.service.BasicService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/page/*")
@AllArgsConstructor	
@Controller
public class BasicController {
	
	private final BasicService service;
	
	@GetMapping("/mainWeb")	
	public String mainWeb(Model model) {
		System.out.println("컨트롤러진입");
		model.addAttribute("list",service.list());
		return "page/mainWeb";
	}
	
	@GetMapping("/read")
	public void read(@RequestParam("b_NO") Long bno, Model model) {
		System.out.println("읽기 진입");
		model.addAttribute("read",service.read(bno));
	}
	
	@PostMapping("/write")
	public String write(ListDto dto) {
		service.write(dto);
		return "redirect:/page/mainWeb";
	}
	
	@GetMapping("/write")
	public void write() {
		
	}
	
	@PostMapping("/weight")
	public String weight(WeightDto dto) {
		service.weight(dto);
		return "redirect:/page/mainWeb";
	}
	
	@GetMapping("/weight")
	public void weight() {
	}
	
//	@GetMapping("/graph")
//	public void graph(@RequestParam("id") String id, Model model) {
//		model.addAttribute("graph",service.readWeight(id));
//	}
	
	@GetMapping("/graph")
	public void getSearch(@RequestParam("id") String id, Model model) {
		model.addAttribute("graph",service.searchList(id));
	}
	
	@DeleteMapping("/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id) {
	    service.del(id);
	    return "success";
	}
	
}