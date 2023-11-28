package kr.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import kr.spring.interceptor.LoginCheckInterceptor;


//자바 코드 기반 설정 클래스
@Configuration
public class AppConfig implements WebMvcConfigurer{
	
	private LoginCheckInterceptor loginCheck;
	
	@Bean
	public LoginCheckInterceptor interceptor1() {
		loginCheck = new LoginCheckInterceptor();
		return loginCheck;
	}
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		//LoginCheckInterceptor 설정
		registry.addInterceptor(loginCheck)
		        .addPathPatterns("/member/myPage.do")
		        .addPathPatterns("/book/adminBook.do")
		        .addPathPatterns("/book/adminBorrowList.do")
		        .addPathPatterns("/member/adminMemberList.do")
		        .addPathPatterns("/book/bookInsert.do")
		        .addPathPatterns("/book/modifyBook.do");
		 	
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		
		final TilesConfigurer configurer = new TilesConfigurer();
		//해당 경로에 xml 설정 파일을 넣음(맵핑과 비슷)
		configurer.setDefinitions(new String[] {
				"/WEB-INF/tiles-def/main.xml",
				"/WEB-INF/tiles-def/member.xml",
				"/WEB-INF/tiles-def/book.xml"
		});
		return configurer;
	}
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver tilesViewResolver = new TilesViewResolver();
		
		tilesViewResolver.setViewClass(TilesView.class);
		
		return tilesViewResolver;
	}
}
