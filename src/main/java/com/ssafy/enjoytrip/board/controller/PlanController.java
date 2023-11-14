package com.ssafy.enjoytrip.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;

@Api(value = "여행계획 메인페이지 API", description = "여행계획 API")
@CrossOrigin(origins = {"*"}) // 다른 서버에서 Ajax 요청이 와도 서비스 되도록 설정
@RestController
@RequestMapping("/plan")
public class PlanController {
	
	// 여행계획 메인페이지
	@GetMapping("/planMain")
	public String planMain() {
		return"/plan/planMain";
	}

}
