<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${ empty sessionScope.user }">
	<script>
		window.location.href = "index.do";
	</script>
</c:if>
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
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="js/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="js/boot/bootstrap.js" type="text/javascript"></script>
    <script src="js/boot/bootstrap-select.min.js" type="text/javascript"></script>
    <script src="js/boot/holder.min.js" type="text/javascript"></script>
    <style>
    	a{
			color:black;
			text-decoration: none;
		}
		a:hover{
			color:gray;
			text-decoration: none;
		}
        #userPopOver{
            width:300px;
            height:300px;
        }
        #topLogo{
            font-size: 20px;
            color:white;
        }
        .userprofile{
       		padding-top:14px;
       		padding-left:15px;
        }
        .userprofilemobile{
        	padding-top:15px;
        	padding-left:105px;
        	color : #777;
        	text-shadow: 0 1px 0 rgba(255,255,255,.25);
        	height: 50px;
		    padding: 15px 15px;
		    font-size: .90em;
		    line-height: 20px;
		    font-weight: normal;
        }
        .writeFormFont{
        	font-size: 20px;
        }
    </style>
    <script>
        $(document).ready(function(){
            var msgPopOver = '';
            msgPopOver += '<div id="userPopOver" class="container">';
            msgPopOver +=   '<div class="row">';
            msgPopOver +=       '<div class="col-lg-12 col-sm-12"><a data-toggle="modal" href="#myModal">로그아웃</a></div>';
            msgPopOver +=   '</div>';
            msgPopOver +=   '<div class="row">';
            msgPopOver += '</div>';

            $("#logoutBtn").click(function(){
            	window.location.href = "logout.do";
            })
        })
    </script>
	<title>JunoFlow.</title>
</head>
<body>
	<jsp:include page="commons/header.jsp" />
	<jsp:include page="${ includPage }" />
	${includPage}
	
</body>
</html>