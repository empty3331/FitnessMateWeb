<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <!-- icon 사용을 위한 css -->
    <link rel="stylesheet" href="../assets/css/fontawesome/all.css">

    <!-- 반드시 넣어야 하는 2가지 css -->
    <link rel="stylesheet" href="../assets/css/reset.css">
    <link rel="stylesheet" href="../assets/css/common.css">

    <!-- 반드시 넣어야 하는 2가지 js -->
    <script src="../assets/js/jquery/jquery-1.12.4.min.js"></script>
    <script src="../assets/js/modal.js"></script>

    <!-- slide -->
    <link href="../assets/js/swiper-4.2.6/dist/css/swiper.min.css" rel="stylesheet">
    <script src="../assets/js/swiper-4.2.6/dist/js/swiper.min.js"></script>

    <!-- 해당 페이지 css -->
    <link rel="stylesheet" href="../assets/css/signUpCommon.css">
	
</head>
<body>
    <header id="header">
        <div class="wrapper clearfix">
            <h1 class="logo">
                <a href="../html/index.html">
                    <img src="../assets/image/logoB.jpeg" title="logo" alt="logo">
                </a>
            </h1>
            <a href="../html/search.html" class="search-link"><i class="fas fa-search"></i></a>
            <nav id="nav">
            </nav>
            <div class="btn-area clearfix">
                <a href="#none" class="button sub">회원가입</a>
                <a href="#none" class="button main" id="btn_login">로그인</a>
            </div>
        </div>
    </header>
    <!-- header가 필요한 페이지에서 사용 -->

    <div id="container">
       
        <div class="wrapper">
            <form action="" method="" enctype="multipart/form-data">
                <p class="title">기본정보 입력 - 트레이너</p>
                <p>아이디</p>
                <input type="text" placeholder="id">
                <p class="errMsg">이미 사용 중인 아이디 입니다.</p>
                <button type="button" id="idCheck">중복 확인</button>
                <p>비밀번호</p>
                <input type="text" placeholder="********">
                <p>비밀번호 확인</p>
                <input type="text" placeholder="********">
                <p>이름</p>
                <input type="text" placeholder="김이름">
                <p>휴대전화 번호</p>
                <input type="text" placeholder="-를 제외한 휴대폰 번호를 입력해주세요">
                <p>성별</p>
                <input type="radio" id="male" name="gender">
                <label for="male">남</label>
                <input type="radio" id="female" name="gender">
                <label for="female">여</label>
                <p>프로필 이미지</p>
                <img id="proImg" src="../assets/image/unnamed.jpg">
                <input type="file" id="imgPreview" name="profileImg">
                
            </form>

				<c:choose>
                	<!-- 트레이너인 경우 -->
                	<c:when test="${param.userType eq 'trainer'}">
                		<a href="#none" class="button main">다음</a>
                	</c:when>
                	<!-- 일반 회원인 경우 -->
                	<c:otherwise>
	                	<a href="#none" class="button main">완료</a>
	                </c:otherwise>
				</c:choose>
        </div>
    </div>

    <footer id="footer">
        <div class="wrapper">
            <ul class="agree clearfix">
                <li><a href="#none">개인정보처리방침</a></li>
                <li><a href="#none">이용약관</a></li>
                <li><a href="#none">이메일무단수집거부</a></li>
                <li><a href="#none">뉴스레터신청</a></li>
                <li><a href="#none">사이트맵</a></li>
            </ul>
            <address>
                <p>
                    <span>피트니스메이트(주)</span>
                    <span>사업자 등록번호 231-81-24552</span>
                    <span>대표이사 황예지, 김주혜</span>
                    <span>주소 서울특별시 동대문구 천호대로 26 (신설동) 효정빌딩</span>
                </p>
                <p>
                    <span class="on">제품관련 고객상담 080-000-0000</span>
                    <span class="on">웹사이트문의 02-2222-2222</span>
                    <span>상담시간 평일 09:00~17:30(토, 일요일, 공휴일 휴무)</span>
                    <span>개인정보 관리책임자 이웅희</span>
                </p>
            </address>
            <p class="right"><span>COPYRIGHT 하이미디어 풀스택과정 C팀.</span> ALL RIGHTS RESERVED.</p>
        </div>
    </footer>
    <!-- footer가 필요한 페이지에서 사용 -->


</body>

<script type="text/javascript">
    $(document).ready(function (){
       $(".errMsg").hide(); 
    })

	//프로필 미리보기
    $("#imgPreview").on("change", function(){
    	var reader = new FileReader();
    	
        reader.onload = function (e) {
            document.getElementById("proImg").src = e.target.result;
        };

        reader.readAsDataURL(this.files[0]);
    });

    // 아이디 체크
    $("#idCheck").on("click",function(){
        // 데이터 받아와서 확인하기

        $(".errMsg").show();
    });

    
    
</script>
</html>