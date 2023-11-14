package com.ssafy.enjoytrip.util;

import java.io.Serializable;

import io.swagger.annotations.ApiParam;

/** UI 화면 페이지에 대한 정보를 표시하는 클래스  */
public class PageBean implements Serializable{
	/**검색 조건*/
	@ApiParam(value="검색조건 ")
	private String key;
	/**검색 단어*/
	@ApiParam(value="검색단어 ")
	private String word;
	/**페이징 처리에 대한 link정보*/
	private String pageLink;
	/**현재 페이지 번호*/
	@ApiParam(value="페이지번호 ")
	private int pageNo;
	/**한 페이지에 보여주 content 개수*/
	private int interval = 3;
	/**페이지 시작 번호*/
	private int start=0;
	public PageBean() {	}
	public PageBean(String key, String word, int pageNo) {
		setKey(key);
		setWord(word);
		setPageNo(pageNo);
	}
	public PageBean(String key, String word, String pageNo) {
		setKey(key);
		setWord(word);
		setPageNo(pageNo);
	}
	private void setPageNo(String pageNo) {
		try {
			this.pageNo = Integer.parseInt(pageNo);
		} catch (Exception e) {
			this.pageNo = 1;
		}
	}
	public String getKey() {
		return key;
	}
	public String getKey(String k) {
		if(key!=null && key.equals(k)) {
			return "selected='selected'";
		}else {
			return "";
		}
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	
	public String getPageLink() {
		return pageLink;
	}
	public void setPageLink(String pageLink) {
		this.pageLink = pageLink;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getInterval() {
		return interval;
	}
	public void setInterval(int interval) {
		this.interval = interval;
	}
	public int getStart() {
		if(pageNo>1) {
			return start = (pageNo-1)*interval;
		}else {
			return 0;
		}
	}
	public void setStart(int start) {
		this.start = start;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PageBean [key=").append(key).append(", word=").append(word).append(", pagelink=")
				.append(pageLink).append(", pageNo=").append(pageNo).append(", interval=").append(interval)
				.append(", start=").append(start).append("]");
		return builder.toString();
	}
}












