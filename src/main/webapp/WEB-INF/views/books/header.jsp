<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
	<div class="col-p-3 m-2">	
		<ul class="nav justify-content-end">
			<c:if test="${member == null}">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/member/register">회원가입</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">모달 회원가입</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/member/login">로그인</a>
				</li>
			</c:if>
			
			<c:if test="${member != null}">
				<div>${member.id}님, 환영합니다.</div>
				<li class="nav-item d-grid gap-2 d-md-block">
					<button id="logoutBtn" class="btn btn-outline-secondary" type="button">로그아웃</button>
					<button id="memberUpdateBtn" class="btn btn-outline-danger" type="button">회원수정</button>
				</li>
			</c:if>
		</ul>
		
		
		
		<!-- 네비게이션 바  -->
			<nav class="navbar navbar-expand-lg bg-light shadow">
			  
			  <div class="container-fluid mp-3">
			    <div class="nav-item border border--success-2px">
			        <a class="nav-link active fs-5 text-center" >BOOK STORE</a>
			    </div>
			    <div class="m-3 vr"></div>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="/books/list">Community</a><!-- home 링크 -->
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="#">Link</a>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Dropdown
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" href="#">Action</a></li>
			            <li><a class="dropdown-item" href="#">Another action</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="#">Something else here</a></li>
			          </ul>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link disabled">Disabled</a>
			        </li>
			      </ul>
			      <!--검색페이지 -->
			      <div class="row">
			      	 <div class="col-10 mp-3">
			      		<div class="container-fluid justify-content-end search">
			      			<form class="d-flex" role="search" method="get">
						        <select name="searchType" class="form-select form-select-sm" aria-label=".form-select-sm example">
						        	<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								    <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								    <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								    <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								    <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						        </select>
						        <input class="form-control me-2" type="search" name="keyword" id="keywordInput" placeholder="Search" aria-label="Search">
						        <button class="btn btn-outline-success" id="searchBtn" type="submit">Search</button>
						    	<script>
					       		  	$(function(){
					       		  		$('#searchBtn').click(function(){
					       		  			self.location = "list" + '${pageMaker.makeQuery(1)}'
					       		  			+ '&searchType' + $("select option:selected").val() + "&keyword=" 
					       		  			+ encodeURIComponent($('#keywordInput').val()); 
					       		  		});
					       		  	});
					       		</script>	
						    </form>
			      		</div>
			      	 </div>
			      </div>
			    </div>
			  </div>
			</nav>
			
		</div>
	</header>
</body>
</html>