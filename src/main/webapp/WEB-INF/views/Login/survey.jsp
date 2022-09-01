<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>
<%--  getsession(false)==null  기존에 세션이 없음을 의미.즉,로그인되어있지 않음. --%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%-- jsp 작성할 때만 브라우저 캐싱 금지 --%>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>


<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png'/>">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/survey.css?after'/>">

    <%--home.css 부분을 빼고 자기 페이지의 css를 넣으세요--%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css?20210502'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
<div class="container">
    <!-- 헤더 컨테이너. 이 페이지는 로그아웃 상태의 페이지 -->
    <header
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start border-bottom">
        <a href="<c:url value='/'/>"
           class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none px-3">
            <object data="<c:url value='/image/main_logo.svg' />" width="150" height="96"></object>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/psvm/" class="nav-link px-2 link-secondary">홈</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">신규작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">인기작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">커뮤니티</a></li>
            <li><a href="<c:url value="/mypage"/>" class="nav-link px-2 link-dark">마이페이지</a></li>
            <li><a href="<c:url value="/item/"/>" class="nav-link px-2 link-dark">상점</a></li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" class="form-control form-control-dark" placeholder="Search..."
                   aria-label="Search">
        </form>

        <div class="text-end">
            <button type="button" class="btn btn-warning me-2">Login</button>
        </div>
    </header>
</div>

<main>

    <h2><span style="color:#e0994d;">DOPAMIN </span>설문조사</h2>
    <div class="survey-container">
        <form action="<c:url value="/join/survey"/>" method="post" onsubmit="surveyCheck();">
            <div class="content-preview" style="text-align:center">
                <input type="hidden" name="user_id" value="${loginId}"/>
                <p>본 설문조사는 마이페이지와 영화 추천 기능에 필요한 정보입니다.</p>
                <label for="fav-genres-box" class="survey-label">선호 장르</label>
                <p>선호 장르 최소1개 최대 5개를 선택해주세요. (중복X)</p>
                <div class="fav-genres-box" id="fav-genres-box">
                    <select required
                            name="fav_genre1">
                        <option selected value="" disabled>--선호장르1(필수)--</option>
                        <option value="액션">액션</option>
                        <option value="애니메이션">애니메이션</option>
                        <option value="범죄">범죄</option>
                        <option value="드라마">드라마</option>
                        <option value="코미디">코미디</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="호러">호러</option>
                        <option value="SF">SF</option>
                        <option value="성인">성인</option>
                        <option value="판타지">판타지</option>
                        <option value="어드벤쳐">어드벤쳐</option>
                        <option value="미스터리">미스터리</option>
                        <option value="가족">가족</option>
                        <option value="전쟁">전쟁</option>
                        <option value="사극">사극</option>
                        <option value="다큐멘터리">다큐멘터리</option>
                        <option value="뮤지컬">뮤지컬</option>
                        <option value="서부극">서부극</option>
                        <option value="공연">공연</option>
                        <option value="게임">게임</option>
                        <option value="리얼리티">리얼리티</option>
                        <option value="토크쇼">토크쇼</option>
                        <option value="스포츠">스포츠</option>
                        <option value="유러피안">유러피안</option>
                    </select>
                    <select name="fav_genre2">
                        <option selected value="" disabled>--선호장르2--</option>
                        <option value="액션">액션</option>
                        <option value="애니메이션">애니메이션</option>
                        <option value="범죄">범죄</option>
                        <option value="드라마">드라마</option>
                        <option value="코미디">코미디</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="호러">호러</option>
                        <option value="SF">SF</option>
                        <option value="성인">성인</option>
                        <option value="판타지">판타지</option>
                        <option value="어드벤쳐">어드벤쳐</option>
                        <option value="미스터리">미스터리</option>
                        <option value="가족">가족</option>
                        <option value="전쟁">전쟁</option>
                        <option value="사극">사극</option>
                        <option value="다큐멘터리">다큐멘터리</option>
                        <option value="뮤지컬">뮤지컬</option>
                        <option value="서부극">서부극</option>
                        <option value="공연">공연</option>
                        <option value="게임">게임</option>
                        <option value="리얼리티">리얼리티</option>
                        <option value="토크쇼">토크쇼</option>
                        <option value="스포츠">스포츠</option>
                        <option value="유러피안">유러피안</option>
                    </select>
                    <select name="fav_genre3">
                        <option selected value="" disabled>--선호장르3--</option>
                        <option value="액션">액션</option>
                        <option value="애니메이션">애니메이션</option>
                        <option value="범죄">범죄</option>
                        <option value="드라마">드라마</option>
                        <option value="코미디">코미디</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="호러">호러</option>
                        <option value="SF">SF</option>
                        <option value="성인">성인</option>
                        <option value="판타지">판타지</option>
                        <option value="어드벤쳐">어드벤쳐</option>
                        <option value="미스터리">미스터리</option>
                        <option value="가족">가족</option>
                        <option value="전쟁">전쟁</option>
                        <option value="사극">사극</option>
                        <option value="다큐멘터리">다큐멘터리</option>
                        <option value="뮤지컬">뮤지컬</option>
                        <option value="서부극">서부극</option>
                        <option value="공연">공연</option>
                        <option value="게임">게임</option>
                        <option value="리얼리티">리얼리티</option>
                        <option value="토크쇼">토크쇼</option>
                        <option value="스포츠">스포츠</option>
                        <option value="유러피안">유러피안</option>
                    </select>
                    <select name="fav_genre4">
                        <option selected value="" disabled>--선호장르4--</option>
                        <option value="액션">액션</option>
                        <option value="애니메이션">애니메이션</option>
                        <option value="범죄">범죄</option>
                        <option value="드라마">드라마</option>
                        <option value="코미디">코미디</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="호러">호러</option>
                        <option value="SF">SF</option>
                        <option value="성인">성인</option>
                        <option value="판타지">판타지</option>
                        <option value="어드벤쳐">어드벤쳐</option>
                        <option value="미스터리">미스터리</option>
                        <option value="가족">가족</option>
                        <option value="전쟁">전쟁</option>
                        <option value="사극">사극</option>
                        <option value="다큐멘터리">다큐멘터리</option>
                        <option value="뮤지컬">뮤지컬</option>
                        <option value="서부극">서부극</option>
                        <option value="공연">공연</option>
                        <option value="게임">게임</option>
                        <option value="리얼리티">리얼리티</option>
                        <option value="토크쇼">토크쇼</option>
                        <option value="스포츠">스포츠</option>
                        <option value="유러피안">유러피안</option>
                    </select>
                    <select name="fav_genre5">
                        <option selected value="" disabled>--선호장르5--</option>
                        <option value="액션">액션</option>
                        <option value="애니메이션">애니메이션</option>
                        <option value="범죄">범죄</option>
                        <option value="드라마">드라마</option>
                        <option value="코미디">코미디</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="호러">호러</option>
                        <option value="SF">SF</option>
                        <option value="성인">성인</option>
                        <option value="판타지">판타지</option>
                        <option value="어드벤쳐">어드벤쳐</option>
                        <option value="미스터리">미스터리</option>
                        <option value="가족">가족</option>
                        <option value="전쟁">전쟁</option>
                        <option value="사극">사극</option>
                        <option value="다큐멘터리">다큐멘터리</option>
                        <option value="뮤지컬">뮤지컬</option>
                        <option value="서부극">서부극</option>
                        <option value="공연">공연</option>
                        <option value="게임">게임</option>
                        <option value="리얼리티">리얼리티</option>
                        <option value="토크쇼">토크쇼</option>
                        <option value="스포츠">스포츠</option>
                        <option value="유러피안">유러피안</option>
                    </select>
                </div>
                <label for="mbti-wrapper" class="survey-label">MBTI</label>
                <div id="mbti-wrapper" class="mbti-wrapper">
                    <div class="mbti-box">
                        <input type="radio" name="ei" value="E" id="e"><label for="e" class="mbti-font">E</label><br>
                        <input type="radio" name="ei" value="I" id="i"><label for="i" class="mbti-font">I</label>
                    </div>
                    <div class="mbti-box">
                        <input type="radio" name="ns" value="N" id="n"><label for="n" class="mbti-font" >N</label><br>
                        <input type="radio" name="ns" value="S" id="s"><label for="s" class="mbti-font">S</label>
                    </div>
                    <div class="mbti-box">
                        <input type="radio" name="ft" value="F" id="f"><label for="f" class="mbti-font" >F</label><br>
                        <input type="radio" name="ft" value="T" id="t"><label for="t" class="mbti-font" >T</label>
                    </div >
                    <div class="mbti-box" >
                        <input type="radio" name="jp" value="J" id="j"><label for="j" class="mbti-font">J</label><br>
                        <input type="radio" name="jp" value="P" id="p"><label for="p" class="mbti-font">P</label>
                    </div>
                    <input type=hidden value="" name="mbti">
                </div>
            </div>
            <button type="submit" id="submitBtn">제출하기</button>
        </form>
    </div>

</main>

<footer class="footer mt-auto py-3 bg-light">
    <div class="container">
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <!-- Left -->
            <div class="me-5 d-none d-lg-block">
                <span>Get connected with us on social networks:</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3"></i>Company name
                        </h6>
                        <p>
                            Here you can use rows and columns to organize your footer content. Lorem
                            ipsum
                            dolor sit amet, consectetur adipisicing elit.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Products
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Angular</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">React</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Vue</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Laravel</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Useful links
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Pricing</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Settings</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Orders</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Help</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                        <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                        <p>
                            <i class="fas fa-envelope me-3"></i>
                            info@example.com
                        </p>
                        <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                        <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center p-4 copyright">
            © 2021 Copyright:
            <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
        </div>
        <!-- Copyright -->
    </div>
</footer>
<script>
    function surveyCheck() {
        let mbti = $('[name="ei"]:checked').val() + $('[name="ns"]:checked').val() + $('[name="ft"]:checked').val() + $('[name="jp"]:checked').val()+"";
        $('[name="mbti"]').val(mbti);
        const arr = [$('[name="fav_genre1"]').val(), $('[name="fav_genre2"]').val(), $('[name="fav_genre3"]').val(), $('[name="fav_genre4"]').val(), $('[name="fav_genre5"]').val()];
        const resultArr = arr.filter(x => x!="")//빈문자열 제거
        const set = new Set(resultArr);
        if (resultArr.length !== set.size || mbti.length!==4) {
            alert("정확히 선택해주세요!")
            event.preventDefault();
        }
    }


</script>
</body>

</html>