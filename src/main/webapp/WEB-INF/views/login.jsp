<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">

<Head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>로그인</title>

</Head>

<body>

<h1>Login</h1>
<hr>

<form action="/login" method="post">
    <table>
        <tr>
            <th>ID</th>
            <td><input type="text" name="userId" placeholder="User ID"></td>
            <td></td>
        </tr>
        <tr>
            <th>PW</th>
            <td><input type="password" name="userPw" placeholder="User PW"></td>
            <td></td>
        </tr>
        <tr>
            <th colspan="3">
                <input type="submit">
            </th>
        </tr>
    </table>
</form>

<hr>

<h3>등록</h3>

<form action="/register" method="post">
    <table>
        <tr>
            <th>ID</th>
            <td><input type="text" name="userId" placeholder="User ID"></td>
            <td></td>
        </tr>
        <tr>
            <th>PW</th>
            <td><input type="password" name="userPw" placeholder="User PW"></td>
            <td></td>
        </tr>
        <tr>
            <th>AdminID</th>
            <td><input type="text" name="adminId" placeholder="Admin ID"></td>
            <td></td>
        </tr>
        <tr>
            <th>AdminPW</th>
            <td><input type="text" name="adminPw" placeholder="Admin PW"></td>
            <td></td>
        </tr>
        <tr>
            <th colspan="3">
                <input type="submit">
            </th>
        </tr>
    </table>
</form>

</body>