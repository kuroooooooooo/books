<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 검색 -->
	<div class="row">
		<div class="col-mb-3">
		<!-- 네비게이션 바  -->
			<nav class="navbar navbar-expand-lg bg-light">
			  <ul class="nav justify-content-center">
			    <li class="nav-item card ">
			        <a class="nav-link active fs-5" href="/board/list">BOOK STORE</a>
			    </li>
			  </ul>
			  <div class="container-fluid mp-3">
			    <a class="navbar-brand" href="#">Navbar</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#">Home</a>
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
			      <form class="d-flex" role="search">
			        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Search</button>
			      </form>
			    </div>
			  </div>
			</nav>
		</div>
	</div>
    
    <hr />
    
    <!-- 글쓰기 버튼 -->
    <div class="d-grid gap-2 d-md-flex justify-content-md-end m-3">
    	<a href="/books/writeView"><button type="button" class="btn btn-outline-success">글쓰기</button></a>
    </div>
    
	<!-- 가운데  -->
    <div class="container">
        <form role="form" method="post" action="/books/write">
            <table class="table table-striped">
                <thead class="table-light">
	                <tr>
	                    <th scope="col">번호</th>
	                    <th scope="col">제목</th>
	                    <th scope="col">작성자</th>
	                    <th scope="col">날짜</th>
	                    <th scope="col">조회수</th>
	                </tr>
	                <c:forEach items="${list}" var="list">
	                    <tr>
	                        <td>
	                        	<c:out value="${list.bno}" />
	                        </td>
	                        <td>
	                        	<a href="/books/readView?bno=${list.bno}"><c:out value="${list.title}" /></a>
	                        </td>
	                        <td><c:out value="${list.userId}" /></td>
	                        <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" /></td>
	                        <td><c:out value ="${list.cnt}" /></td>
	                    </tr>
	                </c:forEach>
                </thead>
            </table>
        </form>
    </div>
    
    <!-- 페이지네이션 -->
    <div>
    	<nav aria-label="Page navigation example">
  			<ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link">Previous</a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#">Next</a>
			    </li>
 			</ul>
		</nav>
	</div>
</body>
</html>