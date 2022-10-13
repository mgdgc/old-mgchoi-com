<%--
  Created by IntelliJ IDEA.
  User: soc06212
  Date: 2022/10/12
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta property="og:title" content="최명근 | MG Choi">
    <meta property="og:type" content="website">
    <meta property="og:image" content="${pageContext.request.contextPath}/resources/img/og.png">
    <meta property="og:description" content="iOS, Android를 사랑하는 최명근입니다.">
    <title>MG Choi</title>

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,500" rel="stylesheet">
    <link rel="apple-touch-icon" sizes="57x57" href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath}/resources/img/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/resources/img/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/resources/img/favicon/manifest.json">
    <%--    <meta name="msapplication-TileColor" content="#ffffff">--%>
    <meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/resources/img/favicon/ms-icon-144x144.png">
    <%--    <meta name="theme-color" content="#ffffff">--%>

    <!--	Bootstrap	-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>

    <!--  My Stylesheet  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/r_style.css">
</head>
<body>

<nav class="navbar navbar-expand navbar-light fixed-top r-navbar r-bg-primary not-draggable" id="navbar">
    <div class="container-fluid align-text-bottom">
        <a class="navbar-brand" href="/">
            <img src="${pageContext.request.contextPath}/resources/img/profile_small.webp" alt="" width="48"
                 height="48" style="margin: 0;"
                 class="d-inline-block align-text-top not-draggable-img">
        </a>
        <div class="collapse navbar-collapse scroll-horiz scroll-no-bar" id="navbarNav">
            <ol class="breadcrumb my-auto align-text-middle">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item"><a href="/admin" aria-current="page">Admin</a></li>
            </ol>
        </div>
    </div>
</nav>

<div class="container mt-7">
    <div class="list-group" style="max-width: 320px;">
        <a class="list-group-item list-group-item-action" href="/project/category">Document</a>
        <a class="list-group-item list-group-item-action" href="/file">File</a>
        <a class="list-group-item list-group-item-action" href="/skill/group">Skill Group</a>
    </div>
</div>

</body>
</html>
