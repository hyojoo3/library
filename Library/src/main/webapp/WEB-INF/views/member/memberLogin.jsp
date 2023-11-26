<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 로그인 폼 시작 -->
<div class="page-main">
	<h2>회원 로그인</h2>
	<form:form modelAttribute="memberVO" action="login.do" id="member_login">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li class="floating-label">
				<form:input path="mem_id" placeholder="아이디" cssClass="form-input" autocomplete="off"/>
				<form:label path="mem_id">아이디</form:label>
				<form:errors path="mem_id" element="div" cssClass="error-color"/>
			</li>
			<li class="floating-label">
				<form:password path="mem_pw" placeholder="비밀번호" cssClass="form-input"/>
				<form:label path="mem_pw">비밀번호</form:label>
				<form:errors path="mem_pw" element="div" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button class="login-btn">로그인</form:button>
		</div>
	</form:form>
</div>
<!-- 로그인 폼 끝 -->