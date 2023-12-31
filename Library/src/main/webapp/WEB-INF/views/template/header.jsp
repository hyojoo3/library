<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 상단 시작 -->
<a class="align-center" href="${pageContext.request.contextPath}/book/bookList.do"><h2>알엠도서관</h2></a>
<div class="align-right">
	<a href="${pageContext.request.contextPath}/book/bookList.do">도서 목록</a>
	<!-- 로그인이 된 경우 -->
	<c:if test="${!empty user}">
		[<span class="user_name">${user.mem_name}</span>] 님
	</c:if>
	
	<c:if test="${!empty user && user.mem_auth == 2}">
		<a href="${pageContext.request.contextPath}/member/myPage.do">MY페이지</a>
	</c:if>
	
	
	<c:if test="${!empty user}">
		<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
	</c:if>
	
	<!-- 미로그인시 -->
	<c:if test="${empty user}">
		<a href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>
		<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
	</c:if>
	<c:if test="${!empty user && user.mem_auth == 9}">
		<a href="${pageContext.request.contextPath}/book/adminBorrowList.do">관리자페이지</a>
	</c:if>
</div>
<!-- 상단 끝 -->