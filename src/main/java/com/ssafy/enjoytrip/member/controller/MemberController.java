package com.ssafy.enjoytrip.member.controller;

import java.lang.reflect.Member;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ssafy.enjoytrip.member.model.dto.MemberDto;
import com.ssafy.enjoytrip.member.service.MemberService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import springfox.documentation.annotations.ApiIgnore;

@Api(value = "회원 관리 API", description = "/user API")
@CrossOrigin(origins = {"*"}) // 다른 서버에서 Ajax 요청이 와도 서비스 되도록 설정
@RestController
@RequestMapping("/user")
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberService service;

	public MemberController(MemberService service) {
		super();
		this.service = service;
	}

	private static final String SUCCESS = "success";
	private static final String FAILURE = "failure";
	/*
	 * @Autowired PasswordEncoder passwordEncoder;
	 */

//	@Inject
//	private BCryptPasswordEncoder passwordEncoder;
	// 비밀번호 암호화 처리
	// user.setPwd(passwordEncoder.encode(user.getPwd()));
	// 암호화된 비밀번호 일치여부 체크
	// passwordEncoder.matches(pwd, user.getPwd());
	
	// 회원가입 페이지로 이동
	
	@ExceptionHandler
	public ResponseEntity<String> handler(Exception e){
		e.printStackTrace();
		logger.error("book.error...................msg:{}", e.getMessage());
		
		// 에러 메시지가 한글인 경우 깨지므로 한글 처리를 위한 설정
		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-type", "application/json; charset=UTF-8");
		String errorMsg = "";
		if (e instanceof Exception)
			errorMsg = e.getMessage();
		else {
			errorMsg = "처리 중 오류 발생";
		}
			return new ResponseEntity<String>(errorMsg, resHeader, HttpStatus.FAILED_DEPENDENCY);
	}
	
	@PostMapping("/register")
	@ApiOperation(value="회원가입", notes="유저 정보를 등록")
	public ResponseEntity<?> userRegister(@RequestBody MemberDto member) {
		logger.debug("member.login......................... Member:{}", member.getUserId());
		logger.debug("member.login......................... service:{}", service);
		//return new ResponseEntity<Void>(HttpStatus.OK);
		//int num = service.idCheck(member.getUserId());
		service.joinMember(member);
		return new ResponseEntity<Void>(HttpStatus.OK);
//		if(num == 1) {
//			
//			
//		}
//		else {
//			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
//		}		
	}
	
	@PostMapping("/login")
	@ApiOperation(value="로그인", notes="로그인")
	public ResponseEntity<?> userLogin(@RequestBody MemberDto member,@ApiIgnore HttpSession session){
		logger.debug("member.login............................ Id:{}",member.getUserId());
		logger.debug("member.login............................ member.password:{}",member.getUserPwd());
		MemberDto find = service.getMemberById(member.getUserId());
		logger.debug("member.login............................ find.password:{}",find.getUserPwd());
		if(find.getUserPwd().equals(member.getUserPwd())) {
			session.setAttribute("userinfo", find);
			logger.debug("member.login......................... success");
			return new ResponseEntity<MemberDto>(find, HttpStatus.OK);
		}
		else {
			logger.debug("member.login......................... failed:{}");
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}	
	}
	
	@GetMapping("/{userId}")
	@ApiOperation(value="유저 정보 조회", notes="어드민이 유저 정보를 조회할때 사용합니다.")
	public ResponseEntity<?> findMember(@PathVariable String userId){
		logger.debug("member.findMember............................ Id:{}",userId);
		MemberDto find = service.getMemberById(userId);
		logger.debug("member.findMember......................... Member:{}", find);
		if(find != null) {
			return new ResponseEntity<MemberDto>(find, HttpStatus.OK);
		}
		else {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	@GetMapping("/logout")
	@ApiOperation(value="로그아웃", notes="세션이 만료 됩니다.")
	public ResponseEntity<?> logout(@ApiIgnore HttpSession session) {
		logger.debug("member.logout............................");
		session.invalidate();
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@DeleteMapping("/{userId}")
	@ApiOperation(value="유저 삭제", notes="유저 아이디로 유저 정보 삭제")
	public ResponseEntity<?> removeUser(@RequestParam String userId){
		logger.debug("member.delete............................ Id:{}",userId);
		service.deleteUserById(userId);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@PutMapping("/updateEmail")
	@ApiOperation(value="이메일 수정", notes="유저의 이메일을 수정")
	public ResponseEntity<?> updateEmail(@RequestParam String userId, @RequestParam String newEmailDomain, @RequestParam String newEmailId ){
		logger.debug("member.updateEmail............................ Id:{}",userId);
		logger.debug("member.updateEmail............................ Domain:{}",newEmailDomain);
		logger.debug("member.updateEmail............................ EmailId:{}",newEmailId);
		
		service.updateEmailById(userId, newEmailId, newEmailDomain);
		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		
	}
	
	@PutMapping("/updatePwd")
	@ApiOperation(value="이메일 수정", notes="유저의 이메일을 수정")
	public ResponseEntity<?> updatePwd(@RequestParam String userId, @RequestParam String newPwd ){
		logger.debug("member.updatePwd............................ Id:{}",userId);
		logger.debug("member.updatePwd............................ Pwd:{}",newPwd);
		
		service.updatePwdById(userId, newPwd);
		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		
	}
	
	// 로그인 로직 구현
	
	// 로그아웃 로직 구현
	
	// 마이페이지로 이동
	

}
