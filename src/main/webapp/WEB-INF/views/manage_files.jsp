<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">

<Head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>File 관리</title>

</Head>

<body>

<h1>File 관리</h1>

<c:if test="${upload_form}">
    <hr>
    <h3>등록</h3>
    <form action="/file/upload" method="post" enctype="multipart/form-data">
        <table>
            <tr><input type="file" name="file"/></tr>
            <tr><input type="submit"/></tr>
        </table>
    </form>
</c:if>

<hr>
<h3>파일 리스트</h3>
<table>
    <thead>
    <tr>
        <th>File ID</th>
        <th>User ID</th>
        <th>Uploaded</th>
        <th>File Name</th>
        <th>File Type</th>
    </tr>
    </thead>
    <c:forEach items="${files}" var="file">
        <tr>
            <th><c:out value="${file.fileId}"/></th>
            <th><c:out value="${file.userId}"/></th>
            <th><c:out value="${file.created}"/></th>
            <th><c:out value="${file.fileName}"/></th>
        </tr>
    </c:forEach>
</table>

</body>