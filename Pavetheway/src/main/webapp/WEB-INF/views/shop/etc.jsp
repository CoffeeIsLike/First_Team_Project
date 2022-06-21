<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Pave the way</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
		<%-- bootstrap 읽어오기 --%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
		<style>
		   /* card 이미지 부모요소의 높이 지정 */
		   .img-wrapper{
		      height: 250px;
		      /* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
		      transition: transform 0.3s ease-out;
		   }
		   /* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
		   .img-wrapper:hover{
		      /* 원본 크기의 1.1 배로 확대 시키기*/
		      transform: scale(1.1);
		   }
		   
		   .card .card-text{
		      /* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
		      display:block;
		      white-space : nowrap;
		      text-overflow: ellipsis;
		      overflow: hidden;
		   }
		   	.img-wrapper img{
			   	width: 100%;
			   	height: 100%;
			   	/* fill | contain | cover | scale-down | none(default) */
			   	/*	
			   		cover - 부모의 크기에 맞게 키운 후, 자른다. 비율은 일정하게 증가한다. 
			   		contain - 안잘린다. 대신 빈 공간이 남을 수 있다.
			   		fill - 부모의 크기에 딱 맞게, 비율 관계 없이 맞춘다.(이미지가 일그러질 수 있다.)
			   		scale-down - 가로, 세로 중에 큰 것을 부모의 크기에 맞춘 상태까지만 커지거나 작아지고, 비율은 일정하다.
			   	*/
				object-fit: contain;	
		   	}
		</style>
		</head>
		<body>
		<div class="container">
		   	<div class="row">
				<c:forEach var="tmp" items="${list }">
					<div class="col-6 col-md-4 col-lg-3">
		         		<div class="card mb-3">
		            		<a href="${pageContext.request.contextPath}/shop/detail.do?num=${tmp.num}">
			               		<div class="img-wrapper">
			                  		<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.imagePath}" />
			               		</div>
		            		</a>
		            		<div class="card-body">
		               			<p class="card-text">${tmp.infoImagePath}</p>
		               			<p class="card-text">by <strong>${tmp.name}</strong></p>
		               			<p><small>${tmp.price}</small></p>
		            		</div>
		         		</div>
		      		</div>
				</c:forEach>
		    </div>
		   	<nav>
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li class="page-item">
		               		<a class="page-link" href="${pageContext.request.contextPath}/shop/etc.do?pageNum=${startPageNum - 1}">Prev</a>
		            	</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
		               		<a class="page-link" href="javascript:">Prev</a>
		            	</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<c:choose>
						<c:when test="${i eq pageNum }">
							<li class="page-item active">
		                  		<a class="page-link" href="${pageContext.request.contextPath}/shop/etc.do?pageNum=${i}">${i }</a>
		               		</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
		                  		<a class="page-link" href="${pageContext.request.contextPath}/shop/etc.do?pageNum=${i}">${i}</a>
		               		</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li class="page-item">
		               		<a class="page-link" href="${pageContext.request.contextPath}/shop/etc.do?pageNum=${endPageNum + 1}">Next</a>
		            	</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
		               		<a class="page-link" href="javascript:">Next</a>
		            	</li>
					</c:otherwise>
				</c:choose>
		      </ul>
		   </nav>   
		</div>
		<%-- <script>
		   // card 이미지의 부모 요소를 선택해서 imgLiquid  동작(jquery plugin 동작) 하기 
		   $(".img-wrapper").imgLiquid();
		</script> --%>
		</body>
		</html>