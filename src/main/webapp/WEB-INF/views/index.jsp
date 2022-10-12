<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">

<Head>
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
    <%--    <meta name="msapplication-TileColor" content="#ffffff">--%>
    <meta name="msapplication-TileImage"
          content="${pageContext.request.contextPath}/resources/img/favicon/ms-icon-144x144.png">
    <%--    <meta name="theme-color" content="#ffffff">--%>

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
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link r-active r-nav-link" aria-current="page" href="#whoami">$ whoami</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link r-nav-link" href="#skills">Skills</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link r-nav-link" href="#projects">Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link r-nav-link" href="#activities">Activities</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link r-nav-link" href="#contact">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container pt-7" id="whoami">
    <p class="d-flex justify-content-center text-center vstack gap-3 mt-7">
        <span class="fs-5"><b class="r-text-gradient-red">빠르게 </b> 적응하고</span>
        <span class="fs-5"><b class="r-text-gradient-blue">함께</b> 성장하는</span>
        <span class="fs-3"> 🧑🏻‍💻 신입 개발자 <b>최명근</b>입니다. 🙌</span>
    </p>
</div>

<div class="container pt-7" id="skills">
    <h1 class="fw-bold ms-2">Skills</h1>
    <div class="row row-cols-auto justify-content-center">
        <c:forEach items="${skillGroups}" var="skillGroup">
            <c:if test="${skills[skillGroup.getSkillGroupId()].size() > 0}">
                <div class="col-5 card-neumorph p-3 mx-auto my-3 align-items-center">
                    <h2 class="text-break"><c:out value="${skillGroup.getName()}"/></h2>
                    <div class="row row-cols-auto mt-3 justify-content-center">
                        <c:forEach items="${skills[skillGroup.getSkillGroupId()]}" var="skill">
                            <div class="chip col text-center mt-1 ms-1">
                                <img class="align-middle" src="/image/${skillIcons[skill.getSkillId()]}"
                                     width="24px" height="24px">
                                <span class="fs-4 fw-light align-middle"><c:out value="${skill.getSkillName()}"/></span>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<%--  Projects  --%>
<div class="container-fluid pt-7" id="projects">
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
    <div class="d-grid mt-5 col-6 mx-auto">
        <a class="btn btn-primary" href="/project">Projects 더 보기</a>
    </div>
</div>

<%-- Timeline --%>
<div class="container-fluid pt-7" id="activities">
    <h1 class="fw-bold ms-2">Timeline</h1>
    <div class="container row row-cols-1 text-center mx-auto">
        <div class="col mt-3">
            <h3 class="badge round-pill text-bg-secondary d-inline pt-1 pb-1 ps-2 pe-2">2015 ~ 2018</h3>
            <br>
            <span class="badge rounded-pill text-bg-light mt-2 fs-6 fw-normal">강원고등학교 코딩동아리 Apphabet 창설</span>
        </div>
        <div class="col mt-4">
            <h3 class="badge round-pill text-bg-secondary d-inline pt-1 pb-1 ps-2 pe-2">2015 ~ 2020</h3>
            <br>
            <span class="badge rounded-pill text-bg-light mt-2 fs-6 fw-normal">강원고등학교 애플리케이션 강고 포켓 운영</span>
        </div>
        <div class="col mt-4">
            <h3 class="badge round-pill text-bg-secondary d-inline pt-1 pb-1 ps-2 pe-2">2018 ~ Now</h3>
            <br>
            <span class="badge rounded-pill text-bg-light mt-2 fs-6 fw-normal">한림대학교 정보과학대학 재학중</span>
        </div>
        <div class="col mt-4">
            <h3 class="badge round-pill text-bg-secondary d-inline pt-1 pb-1 ps-2 pe-2">2018 ~ 2019</h3>
            <br>
            <span class="badge rounded-pill text-bg-light mt-2 fs-6 fw-normal">한림대학교 중앙동아리 CHAOS</span>
        </div>
        <div class="col mt-4">
            <h3 class="badge round-pill text-bg-secondary d-inline pt-1 pb-1 ps-2 pe-2">2021 ~ Now</h3>
            <br>
            <span class="badge rounded-pill text-bg-light mt-2 fs-6 fw-normal">한림대학교 정보과학대학 학술동아리 씨애랑</span>
        </div>
        <div class="col mt-4">
            <h3 class="badge round-pill text-bg-secondary d-inline pt-1 pb-1 ps-2 pe-2">2022 ~ Now</h3>
            <br>
            <span class="badge rounded-pill text-bg-light mt-2 fs-6 fw-normal">씨애랑 라떼팀(앱) 팀장</span>
        </div>
    </div>
</div>


<%-- Timeline --%>
<div class="container-fluid pt-7" id="activities">
    <h1 class="fw-bold ms-2">Activities</h1>
    <div class="container row row-cols-1 text-center mx-auto">
        <c:forEach items="${activities}" var="a">
            <div class="col mt-3">
                <h3 class="badge round-pill text-bg-secondary d-inline pt-1 pb-1 ps-2 pe-2">
                    <c:out value="${a.prize}"/>
                </h3>
                <br>
                <span class="badge rounded-pill text-bg-light mt-2 fs-6 fw-normal">
                    <c:out value="${a.activityName}"/>
                </span>
            </div>
        </c:forEach>
    </div>
</div>


<%-- Contact --%>
<div class="container-fluid pt-7" id="contact">
    <h1 class="fw-bold ms-2">Contact</h1>
    <div class="container justify-content-center">
        <div class="mx-auto mt-3 card-material"
             style="background: #000; min-width: 240px; max-width: 540px; margin:0px; padding-top: 16px; padding-left: 16px; padding-right: 16px; padding-bottom: 16px; box-sizing: border-box; border-radius: 16px;">
            <div style="background: #1c1c1e; padding: 8px; border-radius: 8px; display: flex; align-items: center;">
                <div style="width: 64px; height: 64px; background: #2c2c2e; border-radius: 6px;">
                    <img src="${pageContext.request.contextPath}/resources/img/profile_small.webp" width="64px"
                         height="64px"></div>
                <div style="width: auto; margin-left: 16px;">
                    <h1 style="display:inline; color: #fff; font-weight: 400; font-size: 24px;">최명근</h1>
                    <br>
                    <h3 style="display:inline; color: #8e8e93; font-weight: 500; font-size: 16px;">Choi,
                        Myung-geun</h3>
                </div>
            </div>
            <div style="margin-bottom: 0px; padding-bottom: 0px;">
                <p style="margin-top: 36px; margin-left: 8px; margin-bottom: 8px; color: #636366; font-size: 16px;">
                    연락처는 다음과 같습니다.</p>
            </div>
            <div style="background: #1c1c1e; margin-top: 0px; padding: 0px; border-radius: 8px;">
                <li style="margin: 0px; padding: 0px; list-style-type: none; list-style-position: inside; text-align: center;">
                    <ul style="padding-top: 16px; padding-left: 0px; margin: 0px; color: #8e8e93; font-weight: 500; font-size: 16px;">
                        <div style="align-items: center; justify-content: center;">
                            <a href="mailto:soc06212@gmail.com"
                               style="text-decoration: none; color: #fff; font-weight: 400;">이메일</a><br>
                            <a href="mailto:soc06212@gmail.com"
                               style="text-decoration: none; color: #8e8e93; font-weight: 400;">soc06212@gmail.com</a>
                        </div>
                    </ul>
                    <ul style="padding-top: 0; padding-left: 0; color: #8e8e93; font-weight: 500; font-size: 16px;">
                        <hr style="border: solid 1px #48484a;">
                    </ul>
                    <ul style="padding-top: 0; padding-bottom: 0; padding-left: 0; margin: 0; color: #8e8e93; font-weight: 500; font-size: 16px;">
                        <div style="align-items: center; justify-content: center;">
                            <a href="tel:010-9452-0550"
                               style="text-decoration: none; color: #fff; font-weight: 400;">휴대전화</a><br>
                            <a href="tel:010-9452-0550"
                               style="text-decoration: none; color: #8e8e93; font-weight: 400;">(+82)
                                10-9452-0550</a>
                        </div>
                    </ul>
                </li>
            </div>
        </div>
    </div>
</div>

<%--  Footer  --%>
<div class="container footer mt-7">

</div>
</div>

</body>