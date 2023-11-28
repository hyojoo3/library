<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Admin 메뉴 시작 -->
<div class="side-bar">
	<ul>
		<li>
			<input type="button" class="menu-btn" value="대출관리"
			  onclick="location.href='${pageContext.request.contextPath}/book/adminBorrowList.do'">
		</li>
		<li>
			<input type="button" class="menu-btn" value="도서관리"
			  onclick="location.href='${pageContext.request.contextPath}/book/adminBook.do'">
		</li>
		<li>
			<input type="button" class="menu-btn" value="회원관리"
			  onclick="location.href='${pageContext.request.contextPath}/member/adminMemberList.do'">
		</li>
	</ul>
</div>
<!-- Admin 메뉴 끝 -->





