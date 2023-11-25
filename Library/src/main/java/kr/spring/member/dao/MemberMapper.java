package kr.spring.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	@Select("SELECT member_seq.nextval FROM dual")
	public int selectMem_num();
	
	@Insert("INSERT INTO member(mem_num,mem_id,mem_name) VALUES (#{mem_num},#{mem_id},#{mem_name})")
	public void insertMember(MemberVO member);
	@Insert("INSERT INTO member_detail(mem_num,mem_pw,mem_email,mem_phone) VALUES (#{mem_num},#{mem_pw},#{mem_email},#{mem_phone})")
	public void insertMember_detail(MemberVO member);
}
