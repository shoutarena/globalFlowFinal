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
    <script>
    	function loginForm(){
    		var loginForm = document.getElementById('loginForm');
    		loginForm.setAttribute('method', 'POST');
    		loginForm.setAttribute('action', 'login.do');
    		return true;
    	}
    </script>
	<title>JunoFlow.</title>
</head>
<body>
	<div class="container">
      <form class="form-signin" id="loginForm" onsubmit="loginForm();">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">ID</label>
        <input type="text" id="id" name="id" class="form-control" placeholder="Enter ID." value="${ cookie.saveid.value }" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Enter Password." required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="true" id="rememId" name="rememId" ${ cookie.saveid eq null ? '': 'checked' }> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
    </div>
</body>
</html>
