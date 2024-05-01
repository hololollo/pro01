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
.page { clear:both; height:100vh;}
#page1 { background-color:#ececec; }
#page2 { background-color:#42bcf5; }
.page_title { font-size:36px; padding-top:2em; text-align:center; }
.img-container { width: 50%; float: left; }
.text-container { width: 50%; float:right;}
</style>
</head>
<body>
<div id="header">
	<%@ include file="/header.jsp" %>
</div>
<div id="contents">
	<section class="page" id="page1">
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="/pro01">Home</a></li>
		    <li class="breadcrumb-item"><a href="#">지역소개</a></li>
		    <li class="breadcrumb-item active" aria-current="page">지명유래</li>
		  </ol>
		</nav>
		<div class="container">
			<h3 class="page_title">지명유래</h3>
			<hr>
			<div class="img-container">
				<img style="width:500px;" src="${path0 }/images/gyung-po.png" alt="경포동 주민센터"/>
			</div>
			<div class="text-container">
				<textarea style="width:100%;" class="form-control" rows="20" disabled>
					강원도 강릉시에 있는 행정동.
					경포대 주변의 동들이 합쳐져 만들어진 강릉시의 행정동으로 지명은 경포대에서 유래하였으며 수많은 명승과 문화재들이 있다.
					사실 여행을 한다면 인프라가 많이 구축된 곳은 송정동, 즉 안목해변 인근이며 강릉항부터 시작되는 해변가 일 것이다. 
					그러나 일반 사람들에게 많이 알려진 것은 경포대 이기 때문에 경포대가 위치한 경포동을 기준으로 소개하겠다.
				</textarea>
			</div>
		</div>
	</section>	
</div>
<div id="footer">
	<%@ include file="/footer.jsp" %>
</div>
</body>
</html>