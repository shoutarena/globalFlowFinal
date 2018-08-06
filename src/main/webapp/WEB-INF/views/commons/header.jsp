<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 visible-xs text-center" id="topLogo">
					<a href="index.do">Flow</a>
				</div>
			</div>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand visible-lg visible-md visible-sm" href="#">Flow</a> 
				<a href="#" class="navbar-brand visible-xs">
					<span class="far fa-comment fa-xs fa-fw"></span>
				</a> 
				<a href="#" class="navbar-brand visible-xs">
					<span class="far fa-bell fa-xs fa-fw"></span>
				</a> 
				<div class="navbar-brand dropdown userprofilemobile visible-xs" >
					<c:if test="${ not empty user.profile }">
						<a class="dropdown-toggle" data-toggle="dropdown">
							<img src="${ user.profile }" alt="userprofileimg" class="img-circle" 
								width="20px" height="20px;"/>
							<span class="caret"></span>
						</a>
					</c:if>
					
					<c:if test="${ empty user.profile }">
						<a class="dropdown-toggle" data-toggle="dropdown">
							<span class="far fa-user fa-fw"></span><span class="caret"></span>
						</a>
					</c:if>
					<ul class="dropdown-menu">
						<li class="dropdown-header">${ user.name }</li>
						<li>
							<a data-toggle="modal" href="#logoutModal">Logout</a>
						</li>
					</ul>
				</div>
			</div>
	
	
			<div id="navbar" class="navbar-collapse collapse">
				<form class="nav navbar-form navbar-left form-horizontal visible-xs" role="search">
					<div class="form-group">
						<select class="form-control">
							<option>전체</option>
							<option>파일</option>
							<option>업무</option>
							<option>스케쥴</option>
							<option>할일</option>
						</select>
						<div class="input-group">
							<input class="form-control" type="text" placeholder="검색어를 입력해주세요.">
							<div class="input-group-addon">
								<a id="searchA">검색</a>
							</div>
						</div>
					</div>
				</form>
				<ul class="nav navbar-nav">
					<li><a href="#">업무</a></li>
					<li><a href="#">일정</a></li>
					<li><a href="#">할일</a></li>
					<li><a href="#">파일함</a></li>
					<li class="visible-xs dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown">게시글 작성</a>
						<ul class="dropdown-menu">
							<li><a><span class="fas fa-pen writeFormFont"></span>&nbsp;&nbsp;글</a></li>
							<li><a><span class="fas fa-check writeFormFont"></span>&nbsp;&nbsp;업무</a></li>
							<li><a><span class="fas fa-calendar-alt writeFormFont"></span>&nbsp;&nbsp;일정</a></li>
							<li><a><span class="fas fa-list-ul writeFormFont"></span>&nbsp;&nbsp;할일</a></li>
						</ul>
					</li>
				</ul>
				<form
					class="navbar-form navbar-left form-horizontal visible-md visible-lg visible-sm"
					role="search">
					<div class="form-group">
						<select class="form-control">
							<option>전체</option>
							<option>파일</option>
							<option>업무</option>
							<option>스케쥴</option>
							<option>할일</option>
						</select>
						<div class="input-group">
							<input class="form-control" type="text" placeholder="검색어를 입력해주세요.">
							<div class="input-group-addon">
								<a href="#">검색</a>
							</div>
						</div>
					</div>
				</form>
				<ul
					class="nav navbar-nav navbar-right visible-md visible-sm visible-lg">
					<li><a href="#"><span class="far fa-comment fa-lg fa-fw"></span></a></li>
					<li><a href="#"><span class="far fa-bell fa-lg fa-fw"></span></a>
					
					</li>
					<li>
						<div class="dropdown fa-lg userprofile" >
							<c:if test="${ not empty user.profile }">
								<a class="dropdown-toggle" data-toggle="dropdown">
									<img src="${ user.profile }" alt="userprofileimg" class="img-circle" 
										width="20px" height="20px;"/>
									<span class="caret"></span>
								</a>
							</c:if>
							
							<c:if test="${ empty user.profile }">
								<a class="dropdown-toggle" data-toggle="dropdown">
									<span class="far fa-user fa-md fa-fw"></span><span class="caret"></span>
								</a>
							</c:if>
							<ul class="dropdown-menu">
								<li class="dropdown-header">${ user.name }</li>
								<li>
									<a data-toggle="modal" href="#logoutModal">Logout</a>
								</li>
							</ul>
						</div>
					</li>
					
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="modal fade" id="logoutModal" role="dialog">
		<div class="modal-dialog">
	
			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">Logout</h4>
				</div>
				<div class="modal-body">
					<p>로그아웃 하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" id="logoutBtn">Logout</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
	
		</div>
	</div>
