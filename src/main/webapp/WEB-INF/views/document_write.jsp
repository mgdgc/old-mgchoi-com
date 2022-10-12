<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">

<Head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>글 작성</title>

</Head>

<body>

<h1>글 작성</h1>
<hr>

<form action="/project/${catId}/write" method="post">
    <table>
        <tr>
            <th>Project Name</th>
            <td><input type="text" name="title" placeholder="Project Name"></td>
        </tr>
        <tr>
            <th>간략한 설명</th>
            <td><input type="text" name="desc" placeholder="간략한 설명"></td>
        </tr>
        <tr>
            <th>Project 설명</th>
            <td><textarea name="content" placeholder="Project 설명"></textarea></td>
        </tr>
        <tr>
            <th>Cover Image</th>
            <td><input type="text" name="coverImg" placeholder="fileId"></td>
        </tr>
        <tr>
            <th>Tag</th>
            <td><input type="text" name="tag" placeholder="Tag (#tag1 #tag2 ...)"></td>
        </tr>
        <tr>
            <th>Github</th>
            <td><input type="text" name="github" placeholder="Github URL"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit"></td>
        </tr>
    </table>
</form>

</body>