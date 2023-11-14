package com.ssafy.enjoytrip.map.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel(value="Gugun Dto" ,description="구군 DTO")
@Data
public class GugunDto {
	
	@ApiModelProperty(value="시도 번호", example="0")
	int sidoCode;
	
	@ApiModelProperty(value="구군 번호", example="0")
	int gugunCode;
	
	@ApiModelProperty(value="구군 이름", example="0")
	String gugunName;
	
	
	public GugunDto(int sidoCode, int gugunCode, String gugunName) {
		super();
		this.sidoCode = sidoCode;
		this.gugunCode = gugunCode;
		this.gugunName = gugunName;
	}
	
	public int getSidoCode() {
		return sidoCode;
	}
	public void setSidoCode(int sidoCode) {
		this.sidoCode = sidoCode;
	}
	public int getGugunCode() {
		return gugunCode;
	}
	public void setGugunCode(int gugunCode) {
		this.gugunCode = gugunCode;
	}
	public String getGugunName() {
		return gugunName;
	}
	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	}

	@Override
	public String toString() {
		return "GugunDto [sidoCode=" + sidoCode + ", gugunCode=" + gugunCode + ", gugunName=" + gugunName + "]";
	}
	
}
