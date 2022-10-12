<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">

<Head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>Category 관리</title>

</Head>

<body>

<h1>Category 관리</h1>

<hr>
<h3>등록</h3>
<form action="/project/category" method="post">
    <table>
        <tr><input type="text" name="title" placeholder="카테고리 이름"/></tr>
        <tr><input type="submit"/></tr>
    </table>
</form>

<hr>
<h3>파일 리스트</h3>
<table>
    <thead>
    <tr>
        <th>Category ID</th>
        <th>Title</th>
        <th></th>
    </tr>
    </thead>
    <c:forEach items="${categories}" var="category">
        <tr>
            <th><c:out value="${category.getCatId()}"/></th>
            <th><c:out value="${category.getTitle()}"/></th>
            <th><a href="/project/${category.getCatId()}/write">글 작성</a></th>
        </tr>
    </c:forEach>
</table>

</body>