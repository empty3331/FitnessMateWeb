<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <!-- icon 사용을 위한 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome/all.css">

    <!-- 반드시 넣어야 하는 2가지 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">

    <!-- 반드시 넣어야 하는 2가지 js -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/modal.js"></script>

    <!-- slide -->
    <link href="${pageContext.request.contextPath}/assets/js/swiper-4.2.6/dist/css/swiper.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/swiper-4.2.6/dist/js/swiper.min.js"></script>

    <!-- 해당 페이지 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage.css">
</head>
<body>
    <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
    <div id="container">
        <c:import url="/WEB-INF/views/mypage/includes/menu.jsp"></c:import>
        <div class="wrapper">
            <form id="editProfileForm" action="${pageContext.request.contextPath}/mypage/modifyProfile" method="post">
                <div class="main-info clearfix">
                    <div class="main-info-wrapper clearfix">
                        <img src="../assets/image/face/Park-Myung- Soo.jpg" class="profile-img">
                        <button type="button" class="button change-btn">이미지 변경</button>
                    </div>
                    <div class="main-info-wrapper">
                        <h3 class="title">이름</h3>
                        <input type="text" name="name" value="${profile.userVo.name}">
                    </div>
                    <div class="main-info-wrapper">
                        <h3 class="title">소속</h3>
                        <input type="text" name="company" value="${profile.userVo.company}">
                    </div>
                </div>
                <div class="info-wrapper clearfix">
                    <div class="info">
                    
                        <h3 class="title" style="margin-top: 20px; margin-right: 200px;">성별</h3>
                        <div class="radio-wrapper clearfix">
                            <input type="radio" id="genderMale" name="gender" value="male" 
                            	<c:if test="${profile.userVo.gender eq 'male'}">
									checked
                            	</c:if>
                            > <!-- 인풋 닫는 괄호 -->
                            <label for="genderMale">남성</label>
                            <input type="radio" id="genderFemale" name="gender" value="female"
                            	<c:if test="${profile.userVo.gender eq 'female'}">
									checked
                            	</c:if>
                            > <!-- 인풋 닫는 괄호 -->
                            <label for="genderFemale">여성</label>
                        </div>
                    </div>
                    
                    <div class="info">
                        <h3 class="title" style="width:240px;">지역</h3>
	                    <select name="province">
                    		<c:forEach items="${profile.provinceList}" var="province">
		                        <option 
		                        	<c:if test="${province eq profile.splitAddress[0]}">
		                        		selected
		                        	</c:if>
		                        >${province}</option>
                    		</c:forEach>
	                    </select>
	                    
	                    <select name="city">
	                    	<c:if test="${empty profile.provinceList}">
	                    		<option>시/구</option>
	                    	</c:if>
	                        <c:forEach items="${profile.cityList}" var="city">
		                        <option 
		                        	<c:if test="${city eq profile.splitAddress[1]}">
		                        		selected
		                        	</c:if>
		                        >${city}</option>
                    		</c:forEach>
	                    </select>
	                    
	                    <select name="region">
	                    	<c:if test="${empty profile.provinceList}">
	                    		<option>동</option>
	                    	</c:if>
	                        <c:forEach items="${profile.regionList}" var="region">
		                        <option 
		                        	<c:if test="${region eq profile.splitAddress[2]}">
		                        		selected
		                        	</c:if>
		                        >${region}</option>
                    		</c:forEach>
	                    </select>
	                </div> 
	                
                    <div class="info">
                        <h3 class="title">트레이너 경력</h3>
                        <input type="number" name="career" value="${profile.userVo.career}">
                    </div>
                </div>
                <div class="info-wrapper clearfix">
                    <div class="category-info">
                        <h3 class="title">전문분야</h3>
	                    <div class="checkboxPart">
	                    	<c:forEach items="${profile.interestList}" var="interest">
                       			<input type="checkbox" id="interest-${interest.fieldNo}" value="${interest.fieldNo}" name="fieldNo" 
		                    		<c:forEach items="${profile.userInterest}" var="userInterest">
		                    			<c:if test="${interest.fieldName eq userInterest}">
                        					checked
                        				</c:if>
	                        		</c:forEach>	
                       			> <!-- input닫는괄호 -->
                        		<label for="interest-${interest.fieldNo}" class="button-label">${interest.fieldName}</label>
	                    	</c:forEach>
	                     </div>   
                    </div>
                    
                    <div class="award-info">
                        <h3 class="title">수상내역 / 이수이력 <i class="far fa-plus-square"></i></h3>
                        <c:forEach items="${profile.careerList}" var="career">
                        	<p class="award">${career.recordInfo} <i class="far fa-minus-square delEach" data-careerno="${career.careerNo}"></i></p>
                        </c:forEach>
                    </div>
                </div>
                
                <div class="comment-wrapper">
                    <h3 class="title">트레이너 메세지</h3>
                    <textarea class="content" name="introduction">${profile.userVo.introduction}</textarea>
                </div>

                <div class="pay-wrapper">
                    <h3 class="title">비용</h3>
                    <textarea class="content" name="price">${profile.userVo.price}</textarea>
                </div>
                
                <input type="hidden" name="userNo" value="${authUser.userNo}">
                <button type="submit" class="button main">저장하기</button>
            </form>
        </div>
    </div>
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>

<script type="text/javascript">


// + 눌렀을 때 수상내역 추가
$(".fa-plus-square").on("click", function(){
    var addRecord = '';
    addRecord += '<div>';
    addRecord += '    <input type="text" name="careerRecord" placeholder="대회명(교육명) / 상세내용 ">';
    addRecord += '    <i class="far fa-minus-square deleteNew"></i>';
    addRecord += '</div>';

    $("div.award-info").append(addRecord);
});

// - 눌렀을 때 수상내역 삭제
$("div.award-info").on("click", "i.deleteNew",function(){
    $(this).closest("div").remove();
});

//- 눌렀을 때 있었던 내역 삭제
$("div.award-info").on("click", "i.delEach",function(){
	
	var careerNo = $(this).data("careerno");
	console.log(careerNo);
	
	$.ajax({
		
		url : "${pageContext.request.contextPath}/user/deleteCareer",		
		type : "post",
		data : {careerNo: careerNo},

		dataType : "json",
		success : function(result){
			
			//성공시 처리해야될 코드 작성
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		} 
	})
	
    $(this).closest("p").remove();
	
	
});


//주소 2차 분류 가져오기
$("select[name='province']").on("change", function(){
	//옵션 초기화
	$("select[name='city']").empty();
	
	var thisProvince = $(this).val();
	
	getCity(thisProvince);

});

//주소 3차 분류 가져오기
$("select[name='city']").on("change", function(){
	//옵션 초기화
	$("select[name='region']").empty();
	
	var thisCity = $(this).val();

	getRegion(thisCity);
	
});


//주소 2차 분류 가져오기 함수
function getCity(thisProvince){
	
	$.ajax({
		
		url : "${pageContext.request.contextPath}/user/getCity",		
		type : "post",
		data : {thisProvince: thisProvince},

		dataType : "json",
		success : function(cityList){
			
			/*성공시 처리해야될 코드 작성*/
			var cityStr = '<option>전체</option>';
			for(var i in cityList){
				cityStr += '<option>'+cityList[i]+'</option>';
			}
			
			$("select[name='city']").append(cityStr);
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		} 
	})
	
};

//주소 3차 분류 가져오기 함수
function getRegion(thisCity){
	
	$.ajax({
		
		url : "${pageContext.request.contextPath}/user/getRegion",		
		type : "post",
		data : {thisCity: thisCity},

		dataType : "json",
		success : function(regionList){
			
			/*성공시 처리해야될 코드 작성*/
			var regionStr = '<option>전체</option>';
			
			for(var i in regionList){
				regionStr += '<option>'+regionList[i]+'</option>';
			}
			
			$("select[name='region']").append(regionStr);
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		} 
	})
	
};


</script>

</html>