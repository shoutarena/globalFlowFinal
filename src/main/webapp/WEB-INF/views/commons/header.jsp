<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<nav class="navbar navbar-default navbar-fixed-top bg-">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 visible-xs text-center" id="topLogo">
                    <a href="index.do">Flow</a>
                </div>
            </div>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand visible-lg visible-md visible-sm" href="#">Flow</a>
                <a href="#" class="navbar-brand visible-xs"><span class="far fa-comment fa-xs fa-fw"></span></a>
                <a href="#" class="navbar-brand visible-xs"><span class="far fa-bell fa-xs fa-fw"></span></a>
                <a id="msgPopOver2" class="visible-xs navbar-brand msgPopOver"><span class="far fa-user fa-xs fa-fw"></span><span class="caret"></span></a>

            </div>


            <div id="navbar" class="navbar-collapse collapse">
                <form class="navbar-form navbar-left form-horizontal visible-xs" role="search">
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
                            <div class="input-group-addon"><a href="#">검색</a></div>
                        </div>
                    </div>
                </form>
                <ul class="nav navbar-nav">
                    <li><a href="#">업무</a></li>
                    <li><a href="#">일정</a></li>
                    <li><a href="#">할일</a></li>
                    <li><a href="#">파일함</a></li>
                </ul>
                <form class="navbar-form navbar-left form-horizontal visible-md visible-lg visible-sm" role="search">
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
                            <div class="input-group-addon"><a href="#">검색</a></div>
                        </div>
                    </div>
                </form>
                <ul class="nav navbar-nav navbar-right visible-md visible-sm visible-lg">
                    <li><a href="#"><span class="far fa-comment fa-lg fa-fw"></span></a></li>
                    <li><a href="#"><span class="far fa-bell fa-lg fa-fw"></span></a></li>
                    <li><a id="msgPopOver1"><span class="far fa-user fa-lg fa-fw"></span><span class="caret"></span></a></li>
                </ul>
            </div>
        </div>
    </nav>