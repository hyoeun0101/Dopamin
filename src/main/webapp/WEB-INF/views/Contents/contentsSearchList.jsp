<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap');

        .paging {
            color: black;
            width: 100%;
            align-items: center;
        }

        .page {
            color: black;
            padding: 6px;
            margin-right: 10px;
        }

        .paging-active {
            background-color: rgb(216, 216, 216);
            border-radius: 5px;
            color: rgb(24, 24, 24);
        }

        .paging-container {
            width: 100%;
            height: 70px;
            display: flex;
            margin-top: 50px;
            margin: auto;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>

<div class="topnav">
    <div class="responsive">
        <div class="logo-wrapper">
            <img alt="" src="<c:url value='/image/logo_example.svg' />" width="50" height="30">
        </div>
        <a class="topnav-menu" href="/psvm/" onclick='alert("홈으로 페이지 전환")'>홈</a>
        <a class="topnav-menu" href="#" onclick='alert("신규작 페이지로 이동")'>신규작</a>
        <a class="topnav-menu" href="#" onclick='alert("인기작 페이지로 이동")'>인기작</a>
        <a class="topnav-menu" href="#" onclick='alert("커뮤니티에서 게시판봐요")'>커뮤니티</a>
        <a class="topnav-menu" href="#" onclick='alert("룰렛 한판 돌려요")'>이벤트</a>
        <a class="topnav-menu" href="/psvm/item/" onclick='alert("충동 구매는 당신의 지갑을 얇게 만들수 있습니다.")'>상점</a>
        <form class="topnav-search" action="<c:url value="/contents/search/${sc.keyword}"/>" class="search-form"
              method="get">
            <select class="search-option" name="option">
                <option value="ttl" ${ph.sc.option=='ttl' || ph.sc.option==''?"selected" : ""}>제목/부제목</option>
                <option value="cast" ${ph.sc.option=='cast' ? "selected" : ""}>감독/출연진</option>
                <option value="genre" ${ph.sc.option=='genre' ? "selected" : ""}>장르별</option>
            </select>
            <input class="topnav-search" type="text" name="keyword" class="search-input" type="text"
                   value="${sc.keyword}" placeholder="검색어를 입력해주세요">
            <input class="topnav-search" type="submit" class="search-button" value="검색">
        </form>
        <a class="topnav-menu" href="<c:url value='${loginOutLink}'/>" onclick='alert("${loginOut}")'>${loginOut}</a>
    </div>
</div>

<div class="content">
    <div class="responsive-content">
        <c:if test="${totalCnt!=null && totalCnt!=0}">
            <br>
            <div>"${ph.sc.keyword}" 에 대한 검색 결과입니다.</div>
            <br>
        </c:if>
        <div class="content-preview" style="text-align:center">

            <c:forEach var="cnts" items="${cntsDtoList}">
                <br>
                <tr>
                    <div>
                        <td><a href='/psvm/contents/${cnts.cnts_id}'/>${cnts.cnts_postr_img}</td>
                        <br>
                        <td>${cnts.cnts_title}</td>
                        <br>
                        <td>${cnts.cnts_subttl}</td>
                        <br>
                        <td>${cnts.cnts_op_date}</td>
                        <br>
                        <!-- <td>${cnts.cnts_cnty}</td><br>-->
                    </div>
                </tr>
            </c:forEach>
        </div>

        <br>
        <div class="paging-container" style="text-align:center">
            <div class="paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <br>
                    <div>"${ph.sc.keyword}" 에 대한 검색 결과가 없습니다.</div>
                    <br>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="page"
                           href="<c:url value="/contents/search/${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="page ${i==ph.sc.page? "paging-active" : ""}"
                           href="<c:url value="/contents/search/${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="page" href="<c:url value="/contents/search/${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>


    </div>
    <i class="fa-brands fa-instagram"></i>
    <i class="fa-brands fa-facebook"></i>
    <i class="fa-brands fa-youtube"></i>
    <div class="content-preview"></div>
    <div class="content-teenager-girl-movie"></div>

</div>
</div>

<div class="footer">
    <div>about</div>
    <div>2022 PSVM팀</div>
</div>

</body>

</html>