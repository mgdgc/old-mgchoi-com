<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">

<Head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>Projects | MG Choi</title>

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,500" rel="stylesheet">
    <link rel="apple-touch-icon" sizes="57x57"
          href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60"
          href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72"
          href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76"
          href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114"
          href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120"
          href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144"
          href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152"
          href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180"
          href="${pageContext.request.contextPath}/resources/img/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"
          href="${pageContext.request.contextPath}/resources/img/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32"
          href="${pageContext.request.contextPath}/resources/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96"
          href="${pageContext.request.contextPath}/resources/img/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16"
          href="${pageContext.request.contextPath}/resources/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/resources/img/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage"
          content="${pageContext.request.contextPath}/resources/img/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <!--	Bootstrap	-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>

    <!--  My Stylesheet  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/r_style.css">

</Head>

<body class="container r-bg-secondary">
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
                <li class="breadcrumb-item active" aria-current="page">Projects</li>
            </ol>
        </div>
    </div>
</nav>

<%-- Category --%>
<div class="pt-7 container d-flex justify-content-center">
    <nav>
        <ul class="pagination">
            <c:forEach items="${categories}" var="category">
                <li class="page-item">
                    <a class="page-link r-bg-primary r-border" href="/project/${category.getCatId()}">
                        <c:out value="${category.getTitle()}"/>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </nav>
</div>

<%-- Projects --%>
<div class="container-fluid pt-3" id="projects">
    <h1 class="fw-bold ms-2">Projects</h1>
    <div class="container row row-cols-auto justify-content-center mx-auto">
        <c:forEach items="${projects}" var="p">
            <div class="card-material d-flex flex-column flex-fill col-5 col-lg-4 p-3 m-3">
                <h3><c:out value="${p.getTitle()}"/></h3>
                <c:if test="${p.getTag() != null}">
                    <ul class="list-group list-group-horizontal scroll-horiz scroll-no-bar mt-3">
                        <c:forEach items="${p.getTag().split(\" \")}" var="tag">
                            <li class="chip-sm align-center"><c:out value="${tag.trim()}"/></li>
                        </c:forEach>
                    </ul>
                </c:if>
                <hr>
                <img src="/image/${p.getCoverImg()}" width="100%" alt="cover image">
                <span class="mt-3 ms-2 me-2 mb-3 r-text-secondary"><c:out value="${p.getDesc()}"/></span>
                <div class="align-self-end mt-auto">
                        <%--                    <a class="btn btn-outline-primary" href="/project/detail/${p.getDocId()}" target="_blank">자세히 보기</a>--%>
                    <a class="btn btn-outline-primary" href="${p.getGithub()}" target="_blank">자세히 보기</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%--  Footer  --%>
<div class="container footer mt-7">

</div>
</div>

</body>
</html>