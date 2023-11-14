package com.ssafy.enjoytrip.member.model.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.member.model.dto.MemberDto;

@Mapper
public interface MemberDao {

	int idCheck(String userId) throws SQLException;
	int joinMember(MemberDto memberDto) throws SQLException;
	MemberDto getMemberById(String userId) throws SQLException;
	String getPwdById(String curId) throws SQLException;
	void updatePwdById(String curId, String newPw2) throws SQLException;
	void updateEmailById(String userId, String newEmailId, String newEmailDomain) throws SQLException;
	void deleteUserById(String userId) throws SQLException;
	
}
