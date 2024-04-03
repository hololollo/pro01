<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="hpath" value="<%=request.getContextPath() %>" />
<header>
	<div class="logo_wrap">
		<a href="/pro01"><img src="${hpath }/images/logo2.png" alt="경포동 로고" /></a>
	</div>
	<nav id="tnb">
		<ul>
			<c:if test="${empty sid }">
			<li><a href="${hpath }/member/">로그인</a></li>
			<li><a href="${hpath }/member/">회원가입</a></li>
			</c:if>
			<c:if test="${not empty sid }">
			<li><a href="${hpath }/member/">로그아웃</a></li>
			<li><a href="${hpath }/member/">회원정보</a></li>
			</c:if>			
			<c:if test="${sid.equals('admin') }">
			<li><a href="${hpath }/admin/">관리자화면</a></li>
			</c:if>
		</ul>
	</nav>
	<hr>
	<nav id="gnb">
		<h2>메인메뉴</h2>
	</nav>
	<hr>
</header>