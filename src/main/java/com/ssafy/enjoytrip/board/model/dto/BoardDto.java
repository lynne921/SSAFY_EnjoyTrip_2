package com.ssafy.enjoytrip.board.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@ApiModel(value="Board Dto" ,description="게시판을 구성하는 DTO")
@Data
public class BoardDto {
	@ApiModelProperty(value="게시글 번호", example="0")
	private int articleNo;
	@ApiModelProperty(value="사용자 ID", example="ssafy")
	private String userId;
	@ApiModelProperty(value="제목",example="테스트 제목")
	private String subject;
	@ApiModelProperty(value="글 내용", example="테스트 내용")
	private String content;
	@ApiModelProperty(value="조회수", example="0")
	private int hit;
	@ApiModelProperty(value="작성 시각", example="1999-01-01")
	private String registerTime;
	
	
	
	public BoardDto(int articleNo, String userId, String subject, String content, int hit, String registerTime) {
		super();
		this.articleNo = articleNo;
		this.userId = userId;
		this.subject = subject;
		this.content = content;
		this.hit = hit;
		this.registerTime = registerTime;
	}
	
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	@Override
	public String toString() {
		return "BoardDto [articleNo=" + articleNo + ", userId=" + userId + ", subject=" + subject + ", content="
				+ content + ", hit=" + hit + ", registerTime=" + registerTime + "]";
	}
	
}
