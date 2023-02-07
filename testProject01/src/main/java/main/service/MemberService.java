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
	
	/*
	 * 로그인 기능 아이디와 해당 패스워드 일치 하는지 판단 기능
	 * select count(*) from member where userid='' and pass = '';
	 * result 값은 일치 하면 1
	 * */
	public int selectMemberCount(MemberVO vo) throws Exception;
}
