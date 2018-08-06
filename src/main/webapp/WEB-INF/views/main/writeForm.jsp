<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div class="container visible-lg visible-sm visible-md">
        <div class="row">
            <ul class="nav nav-tabs nav-justified" id="writeTab" role="tablist">
                <li class="active">
                    <a href="#write" data-toggle="tab">
                    	<span class="fas fa-pen writeFormFont"></span>&nbsp;&nbsp;글
                    </a>
                </li>

                <li>
                	<a href="#task" data-toggle="tab">
                		<span class="fas fa-check writeFormFont"></span>&nbsp;&nbsp;업무</a>
               	</li>
                <li>
                	<a href="#schedule" data-toggle="tab">
                		<span class="fas fa-calendar-alt writeFormFont"></span>&nbsp;&nbsp;일정</a>
               	</li>
                <li>
                	<a href="#todo" data-toggle="tab">
                		<span class="fas fa-list-ul writeFormFont"></span>&nbsp;&nbsp;할일</a>
               	</li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="write">글</div>
                <div class="tab-pane fade" id="task">업무</div>
                <div class="tab-pane fade" id="schedule">스케쥴</div>
                <div class="tab-pane fade" id="todo">할일</div>
            </div>
        </div>
    </div>