<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 회원가입 시작 -->
<div class="page-main">
	<h2>회원가입</h2>
	<form:form modelAttribute="memberVO" action="registerUser.do" id="member_register">
		<ul>
			<li>
				<form:label path="mem_id">아이디</form:label>
				<form:input path="mem_id" placeholder="영문, 숫자 4~12자를 입력하세요" autocomplete="off"/>
			</li>
			<li>
				<form:label path="mem_pw">비밀번호</form:label>
				<form:password path="mem_pw" placeholder="영문,숫자 4~12자를 입력하세요"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
			<!-- 비밀번호 확인 넣기 -->
			<li>
				<form:label path="mem_name">이름</form:label>
				<form:input path="mem_name" placeholder="이름을 입력하세요"/>
				<form:errors path="mem_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="mem_phone">전화번호</form:label>
				<form:input path="mem_phone" placeholder="전화번호를 입력하세요"/>
				<form:errors path="mem_phone" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="mem_email">이메일</form:label>
				<form:input path="mem_email" placeholder="이메일을 입력하세요"/>
				<form:errors path="mem_email" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button class="default-btn">가입하기</form:button>
			<input type="button" value="홈으로" class="default-btn" onclick="location.href='${pageContext.request.contextPath}/book/bookList.do'">
		</div>
	</form:form>
</div>
<!-- 회원가입 끝 -->