<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<%@ include file="/head.jsp" %>
<style>
.container { width:1400px; }
.page { clear:both; height:100vh; }
#page1 { background-color:#ececec; }
#page2 { background-color:#42bcf5; }
.page_title { font-size:36px; padding-top:2em; text-align:center; }
</style>
</head>
<body>
<div id="header">
	<%@ include file="/header.jsp" %>
</div>
<div id="contents">
	<section class="page" id="page1">
		<c:if test="${not empty msg}">
		<div style="width:1400px; margin:0 auto;">${msg }</div>
		</c:if>
		<div style="width:1400px; margin:0 auto;">
			<nav aria-label="breadcrumb" style="text-align:right">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="#">Home</a></li>
			    <li class="breadcrumb-item"><a href="#">지역소개</a></li>
			    <li class="breadcrumb-item active" aria-current="page">오시는 길</li>
			  </ol>
			</nav>
		</div>
		<div style="width:1400px; margin:0 auto;">
			<h3 class="page_title">오시는 길</h3>
			<hr>
			<h4>KTX / 시외 / 고속버스 이용시</h4>
			<a href ="https://kko.to/i9LOXIFlhq" target="blank" img src="${path0 }/images/ToSeoul/route1.jpg" alt="시외/고속버스 이용시"/></a>
			<hr>
			<h4>자차 이용시</h4>
			<a href ="https://kko.to/hlVvR9KPAJ" target="blank" img src="${path0 }/images/ToSeoul/route3.jpg" alt="자차 이용시" />
		</div>
	</section>	
</div>
<div id="footer">
	<%@ include file="/footer.jsp" %>
</div>
</body>
</html>