<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 관리자 회원 관리 시작 -->
<script type="text/javascript">
	$(function(){
		//검색 유효성 체크
		$('#search_form').submit(function(){
			if($('#keyword').val().trim()==''){
				alert('검색어를 입력하세요!');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
</script>
<div class="page-main">
	<h2>관리자 회원 관리</h2>
	<form action="adminMemberList.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>이름</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>id</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>이름+id</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="찾기">
				<input type="button" value="목록" 
				    onclick="location.href='adminMemberList.do'">
			</li>
		</ul>
	</form>
	
	<c:if test="${count == 0}">
	<div class="result-display">표시할 회원이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="striped-table">
		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>id</th>
			<th>email</th>
			<th>전화번호</th>
			<th>회원등급</th> <!-- 대출가능 여부 버튼 -->
		</tr>
		<c:forEach var="member" items="${list}">
		<tr>
			<td class="align-center">${member.mem_num}</td>
			<td class="align-center">${member.mem_name}</td>
			<td class="align-center">${member.mem_id}</td>
			<td class="align-center">${member.mem_email}</td>
			<td class="align-center">${member.mem_phone}</td>
			<td class="align-center">${member.mem_auth}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>
</div>
<!-- 관리자 회원 관리 끝 -->