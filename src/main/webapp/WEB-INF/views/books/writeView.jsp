<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<title>게시판</title>
	 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "/books/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
	
	function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
	<body>
	
		<%@include file="header.jsp"%>
			
			<hr />
			<!-- 본문 -->
			<div class="container">
				<div class="col-lg-12 well">
					<div class="row">
						<form name="writeForm" method="post" action="/books/write">
							<div class="row justify-content-center">
								<div class="card p-3 col-8">
									<div class="row mb-3">
										<div class="col-4">
											<label for="userId" class="form-label">작성자</label>
											<input type="text" id="userId" class="form-control chk" name="userId" />
										</div>
										
										<div class="col-md-8">
											<label for="title" class="form-label">제목</label>
											<input type="text" id="title"  name="title" class="form-control chk" title="제목을 입력하세요"/>
										</div>
									</div>
									<div class="col-12">
										<label for="content">내용</label>
										<textarea id="content" class="form-control chk" name="content" style="height: 100px" title="내용을 입력하세요"></textarea>
									</div>
								</div>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end m-3">
				                    <button type="submit" class="btn btn-outline-primary write_btn">등록하기</button>
				                    <a href="/books/list"><button type="button" class="btn btn-outline-dark">취소</button></a>
				                </div>			
							</div>
						</form>
					</div>
				</div>
			</div>
	</body>
</html>