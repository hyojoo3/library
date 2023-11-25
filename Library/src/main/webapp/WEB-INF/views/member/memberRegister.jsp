<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 회원가입 시작 -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/confirmId.js"></script> --%>
<div class="page-main">
	<h2>회원가입</h2>
	<form:form modelAttribute="memberVO" action="registerUser.do" id="member_register">
		<ul>
			<li>
				<form:label path="mem_id">아이디</form:label>
				<form:input path="mem_id" placeholder="영문, 숫자 4~12자" autocomplete="off"/>
				
				<%-- <input type="button" id="confirmId" value="ID중복체크" class="default-btn">
				<span id="message_id"></span>
				<form:errors path="id" cssClass="error-color"/> --%>
				
			</li>
			<li>
				<form:label path="mem_pw">비밀번호</form:label>
				<form:password path="mem_pw" placeholder="영문,숫자 4~12자"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
			<!-- 비밀번호 확인 넣기 -->
			<li>
				<form:label path="mem_name">이름</form:label>
				<form:input path="mem_name"/>
				<form:errors path="mem_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="mem_phone">전화번호</form:label>
				<form:input path="mem_phone"/>
				<form:errors path="mem_phone" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="mem_email">이메일</form:label>
				<form:input path="mem_email"/>
				<form:errors path="mem_email" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button class="default-btn">전송</form:button>
			<input type="button" value="홈으로" class="default-btn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>
<!-- 회원가입 끝 -->
