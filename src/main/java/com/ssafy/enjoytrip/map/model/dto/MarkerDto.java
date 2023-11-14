package com.ssafy.enjoytrip.map.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel(value="Marker Dto" ,description="마커 구성하는 DTO") 
@Data
public class MarkerDto {
	
	@ApiModelProperty(value="관광지 분류", example="0")
	int contentTypeId;
	@ApiModelProperty(value="제목", example="0")
	String title;
	@ApiModelProperty(value="대분류 주소", example="0")
	String addr1;
	@ApiModelProperty(value="소분류 주소", example="0")
	String addr2;
	@ApiModelProperty(value="사진", example="0")
	String firstImage;
	@ApiModelProperty(value="조회수", example="0")
	int readCount;
	@ApiModelProperty(value="위도", example="0")
	double latitude;
	@ApiModelProperty(value="경도", example="0")
	double longitude;
	@ApiModelProperty(value="시도 번호", example="0")
	int sidoCode;
	@ApiModelProperty(value="구군 번호", example="0")
	int gugunCode;

	
	public MarkerDto(int contentTypeId, String title, String addr1, String addr2, String firstImage, int readCount,
			double latitude, double longitude, int sidoCode, int gugunCode) {
		super();
		this.contentTypeId = contentTypeId;
		this.title = title;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.firstImage = firstImage;
		this.readCount = readCount;
		this.latitude = latitude;
		this.longitude = longitude;
		this.sidoCode = sidoCode;
		this.gugunCode = gugunCode;
	}

	public int getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(int contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getFirstImage() {
		return firstImage;
	}

	public void setFirstImage(String firstImage) {
		this.firstImage = firstImage;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
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

	@Override
	public String toString() {
		return "MarkerDto [contentTypeId=" + contentTypeId + ", title=" + title + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", firstImage=" + firstImage + ", readCount=" + readCount + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", sidoCode=" + sidoCode + ", gugunCode=" + gugunCode + "]";
	}
	
}
