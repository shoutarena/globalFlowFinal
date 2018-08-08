<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/boot/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/boot/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/boot/bootstrap-select.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" 
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/login/login.css">
	<script src="js/jquery/jquery-3.3.1.min.js"></script>
    <script src="js/boot/bootstrap.js"></script>
    <script src="js/boot/bootstrap-select.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <style>
        .fl{
            float:left;
        }
        .addrinput{
            float:left;
            width:26%;
        }
        .addrtxt{
            float:left;
            width:20px;
            font-size: 20px;
            margin-left:5px;
        }
        .addrbtn{
            width:30%;
            margin-left:10px;
        }
        .addrText{
            margin-top:10px;
            display: inline;
        }
        #profileImg{
            display: block;
        }
        .telText{
            float:left;
            width:10px;
            font-size: 20px;
            margin-left:3px;
        }
        .telinput{
            float:left;
            width:31%;
        }
        .birthinput{
            float:left;
            width:30%;
        }
        .birthtxt{
            float:left;
            width:15px;
            margin-left:3px;
            vertical-align: center;
            margin-top:3px;
            margin-left:2px;
        }
        #clearsd{
            clear: both;
            vertical-align: center;
        }
    </style>
    <script>
    	function loginForm(){
    		var loginForm = document.getElementById('loginForm');
    		loginForm.setAttribute('method', 'POST');
    		loginForm.setAttribute('action', 'login.do');
    		return true;
    	}
    	
    </script>
    
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수
	
	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;
	
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('addr1').value = fullAddr;
	
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById('addr2').focus();
	            }
	        }).open();
	    }
	</script>
    <script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#profileImg').html('<img class="profileImg1 visible-md visible-sm visible-lg" alt="profileImg" width="300px" height="400px">' +
                        '<img class="profileImg1 visible-xs" alt="profileImg" width="100%" height="100%">');

                    $('.profileImg1').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
	<title>JunoFlow.</title>
</head>
<body>
	<div class="container">
      <form class="form-signin" id="loginForm" onsubmit="loginForm();">
        <h2 class="form-signin-heading">JunoFlow Sign In.</h2>
        <label for="inputEmail" class="sr-only">ID</label>
        <input type="text" id="id" name="id" class="form-control" placeholder="Enter ID." value="${ cookie.saveid.value }" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Enter Password." required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="true" id="rememId" name="rememId" ${ cookie.saveid eq null ? '': 'checked' }> Remember me
          </label>
        </div>
        <input type="submit" value="Sign In" class="btn btn-lg btn-primary btn-block" >
        <a class="btn btn-lg btn-default btn-block" data-toggle="modal" href="#signUpModal">Sign Up</a>
      </form>
    </div>
	
<div class="modal fade" id="signUpModal" role="dialog">
    <div class="modal-dialog modal-xm">
        Modal content
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h2 class="modal-title">Sign Up</h2>
                <form role="form" method="POST" action="join.do" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>프로필사진</label>
                        <span id="profileImg" class="text-center"></span>
                        <input type="file" name="profile" class="form-control" id="imgInp">

                    </div>
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" name="name" class="form-control" id="name" placeholder="이름">
                    </div>
                    <div class="form-group">
                        <label for="pwd1">비밀번호</label>
                        <input type="password" name="pwd" class="form-control" id="pwd1" placeholder="비밀번호">
                    </div>
                    <div class="form-group">
                        <label for="pwd2">비밀번호 확인</label>
                        <input type="password" class="form-control" id="pwd2" placeholder="비밀번호 확인">
                        <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
                    </div>
                    <div class="form-group">
                        <div class="clearfix">
                            <label for="tel1" class="clearfix">휴대전화</label>
                        </div>
                        <div id="">
                            <select name="tel1" class="form-control telinput" id="tel1">
                                <option selected value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="019">019</option>
                            </select>
                            <span class="telText visible-sm visible-md visible-lg">-</span>
                            <input type="text" name="tel2" class="form-control telinput" maxlength="4">
                            <span class="telText visible-sm visible-md visible-lg">-</span>
                            <input type="text" name="tel3" class="form-control telinput" maxlength="4">
                        </div>
                    </div>
                    <div class="form-group">

                    </div>
                    <div class="form-group">
                        <div class="clearfix">
                            <label for="email">이메일</label>
                        </div>
                        <input type="text" class="form-control" id="email" name="email1" placeholder="ex)flow@flow.com">
                    </div>
                    <div class="form-group">
                        <label for="zip1">주소</label>
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control form-inline addrinput" name="zipcode" id="zipcode" readonly placeholder="우편번호">
                        <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary form-inline col-xs-1 text-center addrbtn" value="조회">
                        <input type="text" class="form-control addrText" name="addr1" id="addr1" readonly placeholder="도로명 주소"/>
                        <input type="text" class="form-control addrText" name="addr2" id="addr2" placeholder="상세주소">
                    </div>

                    <div class="form-group">
                        <div class="clearfix">
                            <label for="birth">생일</label>
                        </div>

                        <select class="form-control birthinput" name="year">
                            ${ selectDate.year }
                        </select>
                        <span class="text-center birthtxt visible-lg visible-md visible-sm">년</span>
                        <select class="form-control birthinput" name="month">
                            ${ selectDate.month }
                        </select>
                        <span class="text-center birthtxt visible-lg visible-md visible-sm">월</span>
                        <select class="form-control birthinput" name="day">
                            ${ selectDate.day }
                        </select>
                        <span class="text-center birthtxt visible-lg visible-md visible-sm">일</span>
                    </div>
                    <div class="form-group">
                        <div class="clearfix">
                            <label>성별</label>
                        </div>
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-success active">
                                <input type="radio" name="gender" id="option1" autocomplete="off" checked> 남자
                            </label>
                            <label class="btn btn-success">
                                <input type="radio" name="gender" id="option2" autocomplete="off"> 여자
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary" id="logoutBtn">Sign Up</button>
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
