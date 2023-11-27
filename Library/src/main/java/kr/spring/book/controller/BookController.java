package kr.spring.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.service.BookService;
import kr.spring.book.vo.BookVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private MemberService memberService;
	
	@ModelAttribute
	public BookVO initCommand() {
		return new BookVO();
	}
	
	//책 등록
	@GetMapping("/book/bookInsert.do")
	public String form(){
		return "bookInsert";
		
	}
	@PostMapping("/book/bookInsert.do")
	public String itemWrite(@Valid BookVO bookVO,BindingResult result,HttpServletRequest request,Model model) {
		
		if(bookVO.getBook_photo().length==0) {
			result.rejectValue("book_photo", "required");
		}
		if(bookVO.getBook_photo().length>=5*1024*1024) {
			result.rejectValue("book_photo", "limitUploadSize",new Object[] {"5MB"},null);
		}
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		// 상품 등록 로직 호출
		bookService.insertBook(bookVO);

		model.addAttribute("message", "도서를 등록했습니다");
		model.addAttribute("url", request.getContextPath()+"/main/main.do");
		
		return "common/resultView";
	}
	
	//책목록
	@RequestMapping("/book/bookList.do")
	public ModelAndView bookList(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
								 @RequestParam(value="order", defaultValue="1") int order, String keyfield,String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int count = bookService.selectRowCount(map);
		
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,12,5,"bookList.do");
		
		List<BookVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start",page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = bookService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bookList");
		mav.addObject("count",count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//도서 사진 출력
	@RequestMapping("/book/photoView.do")
	public String getProfile(@RequestParam int book_num,HttpServletRequest request,Model model) {
		
		BookVO bookVO = bookService.selectBook(book_num);
		
		model.addAttribute("imageFile", bookVO.getBook_photo());
		model.addAttribute("filename", bookVO.getBook_photoName());
	
		return "imageView";
	}
	
	//관리자 도서 관리
	//책목록
	@RequestMapping("/book/adminBook.do")
	public ModelAndView adminBook(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
								  @RequestParam(value = "order", defaultValue = "1") int order, String keyfield, String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);

		int count = bookService.selectRowCount(map);

		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 12, 5, "adminBook.do");

		List<BookVO> list = null;
		if (count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());

			list = bookService.selectList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminBook");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());

		return mav;
	}
	
	//도서 수정
	@GetMapping("/book/modifyBook.do")
	public String formUpdate(@RequestParam int book_num, Model model) {
		
		BookVO bookVO = bookService.selectBook(book_num);
		model.addAttribute("bookVO",bookVO);
		
		return "modifyBook";
	}

	//전송된 데이터 처리
	@PostMapping("/book/modifyBook.do")
	public String submitModify(@Valid BookVO bookVO, BindingResult result, 
									HttpServletRequest request, Model model) {
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "modifyBook";
		}
		
		//글수정
		bookService.modifyBook(bookVO);
		
		model.addAttribute("message", "도서 수정 완료!");
		model.addAttribute("url", request.getContextPath()+"/book/adminBook.do");
		
		return "common/resultView";
		
	}
	
	//도서 삭제
	@RequestMapping("/book/deleteBook.do")
	public String deleteBook(@RequestParam int book_num) {
		
		bookService.deleteBook(book_num);
		
		return "redirect:/book/adminBook.do";
	}
}
