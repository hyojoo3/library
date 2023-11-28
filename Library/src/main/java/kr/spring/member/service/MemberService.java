package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import kr.spring.member.vo.MemberVO;

public interface MemberService {

	public void insertMember(MemberVO member);
	
	public MemberVO selectCheckMember(String mem_id);
	public MemberVO selectMember(Integer mem_num);
	
	public List<MemberVO> adminMemberList(Map<String, Object> map);
	public int adminMemberCount(Map<String,Object> map);

}
