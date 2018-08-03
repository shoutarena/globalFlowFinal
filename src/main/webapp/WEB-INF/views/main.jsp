<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <c:if test="${ empty session.dto }">
	<script>
		window.alert("비정상적인 접근입니다.");
		window.history.back();
	</script>
</c:if> --%>
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
	<script src="js/jquery/jquery-3.3.1.min.js"></script>
    <script src="js/boot/bootstrap.js"></script>
    <script src="js/boot/bootstrap-select.min.js"></script>
    <style>
        #userPopOver{
            width:300px;
            height:300px;
        }
        #topLogo{
            font-size: 20px;
            color:white;
        }
    </style>
    <script>
        $(document).ready(function(){
            var msgPopOver = '';
            msgPopOver += '<div id="userPopOver" class="container">';
            msgPopOver +=   '<div class="row">';
            msgPopOver +=       '<div class="col-lg-12 col-sm-12"><a href="logout.do">로그아웃</a></div>';
            msgPopOver +=   '</div>';
            msgPopOver +=   '<div class="row">';
            msgPopOver += '</div>';

            $("#msgPopOver1").popover({
                title:"temp",
                content:msgPopOver,
                animation:"true",
                placement:"bottom",
                html:"true"
            })

            $("#msgPopOver2").popover({
                title:"temp",
                content:msgPopOver,
                animation:"true",
                placement:"bottom",
                html:"true"
            })
        })
    </script>
	<title>Insert title here</title>
</head>
<body>
	<jsp:include page="commons/header.jsp" />
</body>
</html>