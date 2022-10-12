<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">

<Head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>Skill 관리</title>

</Head>

<body>

<h1>Skill 관리</h1>
<hr>

<a href="/file" target="_blank">File Management</a>
<form action="/skill/${skillGroupId}" method="post">
    <table>
        <tr>
            <th>Skill Name</th>
            <td><input type="text" name="skillName" placeholder="Skill 이름"></td>
            <td></td>
        </tr>
        <tr>
            <th>Icon</th>
            <td><input type="text" name="icon" placeholder="icon ID"></td>
            <td></td>
        </tr>
        <tr>
            <th>Year</th>
            <td><input type="text" name="year" placeholder="년도"></td>
            <td></td>
        </tr>
        <tr>
            <th>Level</th>
            <td><input type="text" name="level" placeholder="0 ~ 5"></td>
            <td></td>
        </tr>
        <tr>
            <th>Description</th>
            <td><input type="text" name="desc" placeholder="간략한 설명"></td>
            <td></td>
        </tr>
    </table>
    <input type="submit">
</form>

<table>
    <thead>
    <tr>
        <th>Skill ID</th>
        <th>Name</th>
        <th>icon</th>
        <th>year</th>
        <th>level</th>
        <th>desc</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${skills}" var="skill">
        <tr>
            <td><c:out value="${skill.getSkillId()}"/></td>
            <td><c:out value="${skill.getSkillName()}"/></td>
            <td><c:out value="${skill.getIcon()}"/></td>
            <td><c:out value="${skill.getYear()}"/></td>
            <td><c:out value="${skill.getLevel()}"/> / 5</td>
            <td><c:out value="${skill.getDesc()}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>