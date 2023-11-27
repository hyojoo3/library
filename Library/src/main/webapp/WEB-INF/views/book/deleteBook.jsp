<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 도서 삭제 확인 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/changePassword.js"></script>
<div class="page-main">
	<h2>도서 삭제 확인</h2>
	<form:form modelAttribute="memberVO" action="deleteBook.do" id="delete_book">
	<form:hidden path="book_num"/>
	    <form:errors element="div" cssClass="error-color"/>         
		<ul>
			<li>
				<form:label path="now_passwd">현재 비밀번호</form:label>
				<form:password path="now_passwd"/>
				<form:errors path="now_passwd" cssClass="error-color"/>      
			</li>
			<li>
				<form:label path="passwd">새비밀번호</form:label>
				<form:password path="passwd"/>
				<form:errors path="passwd" cssClass="error-color"/>      
			</li>
			<li>
				<label for="confirm_passwd">새비밀번호 확인</label>
				<input type="password" id="confirm_passwd">
				<span id="message_id"></span>
			</li>
		</ul>	
		<div class="align-center">
			<form:button class="default-btn">전송</form:button>
			<input type="button" value="홈으로" class="default-btn"
			 onclick="location.href='${pageContext.request.contextPath}/book/adminBook.do'">
		</div>             
	</form:form>
</div>
<!-- 도서 삭제 확인 -->
