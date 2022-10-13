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

<h1>Document 관리</h1>

<hr>
<h3>등록</h3>

<hr>

<h3>글 리스트</h3>
<table>
  <thead>
  <tr>
    <th>Document ID</th>
    <th>Title</th>
    <th></th>
  </tr>
  </thead>
  <c:forEach items="${documents}" var="doc">
    <tr>
      <td><c:out value="${doc.getDocId()}"/></td>
      <td><c:out value="${doc.getTitle()}"/></td>
      <td><a href="/project/${doc.getCatId()}/${doc.getDocId()}/edit">글 수정</a></td>
      <td><a href="/project/${doc.getCatId()}/${doc.getDocId()}/touch">Touch</a></td>
    </tr>
  </c:forEach>
</table>

</body>