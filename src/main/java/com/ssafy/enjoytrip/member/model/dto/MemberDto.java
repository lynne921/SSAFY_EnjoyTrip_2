package com.ssafy.enjoytrip.member.model.dto;

import lombok.Data;

@Data
public class MemberDto {

	private String userId;
	private String userName;
	private String userPwd;
	private String emailId;
	private String emailDomain;
	private String joinDate;

}
