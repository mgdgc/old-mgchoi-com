<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!DOCTYPE HTML>
<html lang="ko">

<Head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>SkillGroup 관리</title>


    <script type="text/javascript">
        function deleteSkillGroup(skillGroupID) {
            $.ajax({
                async: true,
                type: 'POST',
                url: "/skill/" + skillGroupID + "/delete",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function (success) {
                    if (success) {
                        window.location.reload();
                    } else {
                        alert("실패");
                    }
                },
                error: function(error) {
                    alert("오류");
                }
            });
        }
    </script>
</Head>

<body>

<h1>SkillGroup 관리</h1>
<hr>

<form action="/skill/group" method="post">
    <label for="skillGroupName">새 그룹 추가</label><input type="text" name="name" id="skillGroupName" placeholder="그룹 이름">
    <input type="submit">
</form>

<table>
    <thead>
    <tr>
        <th>SkillGroup ID</th>
        <th>Name</th>
        <th>items</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${skillGroups}" var="skillGroup">
        <tr>
            <td><a href="/skill/${skillGroup.getSkillGroupId()}"><c:out value="${skillGroup.getSkillGroupId()}"/></a></td>
            <td><a href="/skill/${skillGroup.getSkillGroupId()}"><c:out value="${skillGroup.getName()}"/></a></td>
            <td><c:out value="${skills[skillGroup.getSkillGroupId()]}"/></td>
            <td><button onclick="deleteSkillGroup(${skillGroup.getSkillGroupId()})">삭제</button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>