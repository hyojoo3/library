package kr.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	//자바빈 초기화
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	//회원가입
	@GetMapping("/member/registerUser.do")
	public String form() {
		return "memberRegister";
	}
	@PostMapping("/member/registerUser.do")
	public String submit(@Valid MemberVO memberVO, BindingResult result, Model model) {
		
		//유효성체크
		if(result.hasErrors()) {
			return form();
		}
		
		//회원가입
		memberService.insertMember(memberVO);
		
		model.addAttribute("accessMsg","회원가입이 완료되었습니다.");

		return "common/notice";
	}
	
	
	
	//로그인
	@GetMapping("/member/login.do")
	public String formLogin() {
		return "memberLogin";
	}
	@PostMapping("/member/login.do")
	public String submitLogin(@Valid MemberVO memberVO, BindingResult result,HttpSession session) {
		
		
		//id와 passwd 필드만 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasFieldErrors("mem_id") || result.hasFieldErrors("mem_pw")) {
			return formLogin();
		}
		//로그인 체크(id,비밀번호 일치 여부 체크)
		MemberVO member = null;
		try {
			member = memberService.selectCheckMember(memberVO.getMem_id());
			boolean check = false;
			
			if(member!=null) {
				//비밀번호 일치 여부 체크
				check = member.isCheckedPassword(memberVO.getMem_pw());
			}
			if(check) {
				//check가 true일시 인증성공
				
				//인증성공, 로그인 처리
				session.setAttribute("user", member);

				return "redirect:/book/bookList.do";
			}
			//인증실패시
			throw new AuthCheckException();
			
		}catch(AuthCheckException e) {
			//인증 실패로 로그인폼 호출
			if(member!=null && member.getMem_auth()==1) {
				//정지회원 메시지 표시
				result.reject("noAuthority");
			}else {
				result.reject("invalidIdOrPassword");
			}
			
			
			return formLogin();
		}
	}

	//로그아웃
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session) {
				
			//로그아웃
			session.invalidate();
				
			return "redirect:/book/bookList.do";
		}
	
	
	//관리자 회원 목록
	@RequestMapping("/member/adminMemberList.do")
	public ModelAndView getList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, String keyfield,String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체/검색 레코드수
		int count = memberService.adminMemberCount(map);
		
		log.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage, count,12,5,"adminMemberList.do");
		
		List<MemberVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = memberService.adminMemberList(map);
		}
		System.out.println("+++" + list);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMemberList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
}
