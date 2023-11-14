package com.ssafy.enjoytrip.member.service;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.member.controller.MemberController;
import com.ssafy.enjoytrip.member.model.dao.MemberDao;
import com.ssafy.enjoytrip.member.model.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	// private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//	private static MemberService memberService = new MemberServiceImpl();
	
	@Autowired
	private MemberDao memberDao;
	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	public MemberServiceImpl(MemberDao memberDao) {
		super();
		this.memberDao = memberDao;
	}

	@Override
	public int idCheck(String userId){
		try {
			logger.debug("idCheck..................................:{}", userId);
			return memberDao.idCheck(userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public int joinMember(MemberDto memberDto){
		try {
			return memberDao.joinMember(memberDto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public MemberDto loginMember(String userId, String userPwd){
		try {
			MemberDto member = memberDao.getMemberById(userId);
			if(member.getUserPwd() == userPwd) {
				return member;
			}
			else {
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public MemberDto getMemberById(String userId){
		try {
			return memberDao.getMemberById(userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void updatePwdById(String curId, String newPwd) {
		try {
			memberDao.updatePwdById(curId, newPwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

	@Override
	public void updateEmailById(String userId, String newEmailId, String newEmailDomain) {
		try {
			memberDao.updateEmailById(userId, newEmailId, newEmailDomain);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void deleteUserById(String userId) {
		try {
			memberDao.deleteUserById(userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public String getPwdById(String curId) {
		return null;
	}

}
