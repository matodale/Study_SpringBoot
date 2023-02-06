package main.service;

import java.util.List;

public interface MemberService {
	/*
	 * 회원 등록 처리
	 * */
	public String insertMember(MemberVO vo) throws Exception;
	
	/*
	 * 회원 아이디 중복 체크
	 * SELECT COUNT(*) FROM member where userid = 'admin';
	 * result 값 1
	 * */
	public int selectMemberIdCheck(String userid) throws Exception;
	
	/*
	 * 우편번호 주소 검색
	 * select a2 as dong from post;
	 * result 값 
	 * */
	public List<?> selectPostList(String dong) throws Exception;
}
