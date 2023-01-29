package main.service;

import java.sql.Timestamp;

public class BoardVO {
	// 1.BoardVO : DB에 저장할 데이터들의 타입 지정.
	private int unq; // 게시판 번호
	private String title; // 게시판 제목
	private String pass; // 게시판 작성 시의 암호
	public String name; // 글쓴이
	public String content; // 게시판 내용
	public int hits; // 조회수
	public Timestamp rdate; // 쓴 날짜와 시간
	
	// 추가할 내용 페이징 처리할 변수들
	// 초기값을 설정
	private int viewPage = 1;
	private int startIndex = 1; // 시작할 1페이지
	private int endIndex = 10; // 전체로 보여질 게시판 수
	
	// jsp 에서의 search 
	private String searchGubun;
	private String searchText;
	
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public Timestamp getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	public int getViewPage() {
		return viewPage;
	}
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public String getSearchGubun() {
		return searchGubun;
	}
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
}
