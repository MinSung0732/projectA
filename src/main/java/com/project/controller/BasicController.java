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
@RequestMapping("/page/*")
@AllArgsConstructor	
@Controller
public class BasicController {
	
	private final BasicService service;
	
	
	
	@GetMapping("/mainWeb")	
	public String mainWeb(Model model) {
		System.out.println("page 컨트롤러 진입...................");
		model.addAttribute("list",service.list());
		model.addAttribute("loginList",service.loginList());
		return "page/mainWeb";
	}
	
	@GetMapping("/signUp")	
	public void signUp(Model model) {
		System.out.println("signUp 컨트롤러 진입...................");
	}
	
	@PostMapping("/createId")
	public String createId(SignUpDto dto, Model model, @RequestParam("rePw") String rePw) {
		System.out.println("createId 컨트롤러 진입...................");
		
		 if (dto.getId() == null || dto.getId().trim().isEmpty()) {
		        System.out.println("빈 ID 회원가입...................");
		        model.addAttribute("error", "ID를 입력해주세요.");
		        return "redirect:/page/signUp"; // 회원가입 폼으로 이동
		    }
		 
		 if (dto.getPw() == null || dto.getPw().trim().isEmpty()) {
		        System.out.println("빈 PW 회원가입...................");
		        model.addAttribute("error", "PW를 입력해주세요.");
		        return "redirect:/page/signUp"; // 회원가입 폼으로 이동
		    }
		 
		 if (dto.getPw().length() < 8) {
		        System.out.println("짧은 비밀번호 회원가입...................");
		        model.addAttribute("error", "비밀번호는 8자 이상이여야합니다.");
		        return "redirect:/page/signUp"; // 회원가입 폼으로 이동
		    }
		 
		 if (!dto.getPw().equals(rePw)) {
			 System.out.println("비밀번호 불일치 회원가입...................");
			 model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
			 return "redirect:/page/signUp"; // 회원가입 폼으로 이동
		 }
		 
	    if (service.isIdExist(dto.getId())) {
	        System.out.println("중복 회원가입...................");
	        model.addAttribute("error", "이미 존재하는 ID입니다.");
	        return "redirect:/page/signUp"; // 다시 회원가입 폼으로 이동
	    } else {
	        service.signUp(dto); // 회원가입 진행
	        System.out.println("회원가입 완료...................");
	        model.addAttribute("error", "");
	        return "redirect:/page/mainWeb"; // 회원가입 성공 후 메인 페이지로 이동
	    }
	}
	
	@GetMapping("/checkIdExist")
    public boolean checkIdExist(@RequestParam("id") String id) {
		System.out.println("checkIdExist 컨트롤러 진입...................");
        return service.isIdExist(id);
    }
	
	@PostMapping("/ConfirmId")
	@ResponseBody
	public ResponseEntity<Boolean> confirmId(String id) {
		System.out.println("confirmId 컨트롤러 진입...................");
		System.out.println("id : " + id);
		boolean result = true;
		
		
		if(id.trim().isEmpty()) {
			System.out.println("id : " + id);
			result = false;
		} else {
			if (service.selectId(id)) {
				result = false;
			} else {
				result = true;
			}
		}
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping("/checkSession")
    public ResponseEntity<String> checkSession(HttpServletRequest request) {
		System.out.println("checkSession 컨트롤러 진입...................");
		
		HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("myLogin") != null) {
            return ResponseEntity.ok("true");
        } else {
            return ResponseEntity.ok("false");
        }
    }

	
	@GetMapping("/createId")
	public void createId() {
		
		
	}
	
	@PostMapping("/signIn")
	public String signIn(HttpServletRequest request,@RequestParam("id") String id , @RequestParam("pw")String word) {
		System.out.println("signIn 컨트롤러 진입...................");
		
		SignUpDto a = service.signIn(id, word);
		HttpSession session = request.getSession();
		System.out.println("123");
		if(a != null) {
			session.setAttribute("myLogin", a.getId());
			System.out.println("로그인 성공");
			return "redirect:/page/mainWeb";
		} else {
			System.out.println("로그인 실패");
		}
		return "redirect:/page/mainWeb";
	}
	
	@GetMapping("/signOut")
	public String signOut(HttpServletRequest request) {
		System.out.println("signOut 컨트롤러 진입...................");
		
		HttpSession session = request.getSession();
		session.removeAttribute("myLogin");
		return "redirect:/page/mainWeb";
	}
	
	
	@GetMapping("/signIn")
	public void signIn(SignUpDto dto) {
		
	}
	
	@GetMapping("/read")
	public void read(@RequestParam("b_NO") Long bno, Model model) {
		System.out.println("read 컨트롤러 진입...................");
		service.hit(bno);
		model.addAttribute("read",service.read(bno));
	}
	
	@PostMapping("/write")
	public String write(ListDto dto) {
		System.out.println("write 컨트롤러 진입...................");
		service.write(dto);
		return "redirect:/page/mainWeb";
	}
	
	@GetMapping("/write")
	public void write() {
		
	}
	
	@PostMapping("/weight")
	public String weight(WeightDto dto, HttpServletRequest request) {
		System.out.println("weight 컨트롤러 진입...................");
		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("myLogin");
		
		if (sessionId != null) {
			dto.setId(sessionId);
			service.weight(dto);
		} else {
			dto.setId("비회원");
			service.weight(dto);
		}
		
		return "redirect:/page/mainWeb";
	}
	
	@GetMapping("/weight")
	public void weight() {
	}
	
	@DeleteMapping("/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id) {
		System.out.println("delete 컨트롤러 진입...................");
		service.del(id);
	    return "success";
	}
	
}