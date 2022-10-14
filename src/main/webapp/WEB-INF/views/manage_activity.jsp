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

<h1>Activity 관리</h1>

<hr>
<h3>등록</h3>
<form action="/activity" method="post">
    <input type="hidden" name="activityId" value="0"/>
    <input type="hidden" name="touch" value="1999-02-01"/>
    <table>
        <tr><input type="text" name="activityName" placeholder="Activity 이름"/></tr>
        <tr><input type="number" name="outside" value="0" placeholder="대외활동 (0: false)"/></tr>
        <tr>
            <input type="text" name="year" placeholder="Year"/>
            <input type="text" name="month" placeholder="Month"/>
        </tr>
        <tr>
            <input type="text" name="endYear" placeholder="End Year"/>
            <input type="text" name="endMonth" placeholder="End Month"/>
        </tr>
        <tr><input type="text" name="prize" placeholder="상 이름 (선택)"/></tr>
        <tr><input type="submit"/></tr>
    </table>
</form>

<hr>
<h3>Activity 리스트</h3>
<table>
    <thead>
    <tr>
        <th>Activity ID</th>
        <th>Activity Name</th>
        <th>Date</th>
        <th>End Date</th>
        <th>Prize</th>
    </tr>
    </thead>
    <c:forEach items="${activities}" var="a">
        <tr>
            <td><c:out value="${a.getActivityId()}"/></td>
            <td><c:out value="${a.getActivityName()}"/></td>
            <td><c:out value="${a.getYear()}"/>.<c:out value="${category.getMonth()}"/></td>
            <td><c:out value="${a.getEndYear()}"/>.<c:out value="${category.getEndMonth()}"/></td>
            <td><c:out value="${a.getPrize()}"/></td>
        </tr>
    </c:forEach>
</table>

</body>