package main.service;

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
	
}
