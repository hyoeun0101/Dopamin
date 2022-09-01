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
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="SURVEY" value="${pageContext.request.getSession(false).getAttribute('SURVEY')}"/>

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
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
    <%--home.css 부분을 빼고 자기 페이지의 css를 넣으세요--%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/contents/contentsmain.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
</head>

<body>
<div class="container">
    <!-- 헤더 컨테이너. 이 페이지는 로그아웃 상태의 페이지 -->
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start border-bottom">
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
        <div class="text-end">
            <button type="button" class="btn btn-warning me-2" onclick="location.href='<c:url value="/login/login"/>';">
                Login
            </button>
        </div>
    </header>
</div>
<!--
  내용 컨테이너. 여러개의 Row를 만들 때 section 태그로 나눕니다.
  container - 컨텐츠를 포함하고 채우고 정렬하는 부트스트랩 기본구성요소
  py-5 - padding y축방향(위아래)로 5 단위만큼 부여 https://getbootstrap.kr/docs/5.0/utilities/spacing/ 참고
  // 컨텐츠를 넣는 태그 만들 때 무조건 section 태그에 container py-5 주고 시작합니다(위 아래 컨텐츠간 여백)
  bg-light - 약간의 음영을 주는 속성. 짝수 section 마다 주면 좋을거 같아요 컨텐츠 구별용(흰색-음영회색-흰색)
-->
<script>
    <%--let surveyMsg = "${SUR_SUCCESS}"--%>
    if ("${SUR_SUCCESS}" != "") alert("${SUR_SUCCESS}")
    if ("${SUR_ERR}" != "") alert("${SUR_ERR}")

    <%--js스와이프--%>
    $(function() {
        new Swiper('.contents .swiper-container', {
            slidesPerView: 1, //한번에 보여줄 개수
            autoplay: true, // 자동 재생 여부
            loop: true, // 반복 재생 여부
            navigation: {
                prevEl: '.contents .swiper-prev',   //이전 슬라이드를 볼 수 있음
                nextEl: '.contents .swiper-next'    //이후 슬라이드를 볼 수 있음
            }
        });
    })
</script>

<main>
    <div class="container">


        <div class="search-bg-image">
            <section class="container">
                <h1 class="search-main-text">DOPAMIN</h1>
                <section class="container">
                    <p class="search-sc-text">Search Contents!</p>
                    <div>
                        <form class="search-container"
                              action="<c:url value="/contents/search/${sc.keyword}"/>" method="get">
                            <select class="search-option" name="option" >
                                <option value="total" ${ph.sc.option=='total' || ph.sc.option=='' ? "selected" : ""}>통합</option>
                                <option value="ttl" ${ph.sc.option=='ttl' ? "selected" : ""}>제목/부제목</option>
                                <option value="cast" ${ph.sc.option=='cast' ? "selected" : ""}>감독/출연진</option>
                                <option value="genre" ${ph.sc.option=='genre' ? "selected" : ""}>장르별</option>
                            </select>
                            <input type="text" class="search-main"
                                   placeholder="search your contents" aria-label="Type Keywords"
                                   name="keyword"
                                   value="${sc.keyword}"/>
                        </form>
                    </div>
                </section>
            </section>
        </div>

        <!--로그인된 회원-->
        <c:if test="${pageContext.request.getSession(false)!=null}">
            <br>
            <div>"${contentsUserDto.nic}" 님을 위한 추천 컨텐츠</div>
            <br>

            <section class="contents">
                <div class="swiper-container">
                    <div class="swiper-wrapper" style="height: 30rem;">
                        <div class="swiper-slide">
                            <div class="contents_container">
                                <c:forEach var="i" end="4" items="${userContentsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                                    <div class="detail-container" onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                        <div id="poster-img" style="margin-bottom: 0.1rem; border-radius: 0.3rem;" >
                                            <img id="poster-image" style="border-radius: 0.3rem;" src="${i.cnts_postr_img}" alt="${i.cnts_title}"/>
                                        </div>
                                        <div>
                                            <span class="contents_title">${i.cnts_title}</span><br>
                                            <span class="item_nm">${i.cnts_subttl}</span>
                                            <span class="item_grd">${i.cnts_op_date} : ${i.cnts_cnty}</span><br>
                                        </div>
                                    </div>
                                    <br>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="contents_container">
                                <c:forEach var="i" begin="5" end="9" items="${userContentsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                                    <div class="detail-container" onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                        <div id="poster-img" style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                            <img id="poster-image" style="border-radius: 0.3rem;" src="${i.cnts_postr_img}" alt="${i.cnts_title}"/>
                                        </div>
                                        <div>
                                            <span class="contents_title">${i.cnts_title}</span><br>
                                            <span class="item_nm">${i.cnts_subttl}</span>
                                            <span class="item_grd">${i.cnts_op_date} : ${i.cnts_cnty}</span><br>
                                        </div>
                                    </div>
                                    <br>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="contents_container">
                                <c:forEach var="i" begin="10" end="14" items="${userContentsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                                    <div class="detail-container" onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                        <div id="poster-img" style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                            <img id="poster-image" style="border-radius: 0.3rem;" src="${i.cnts_postr_img}" alt="${i.cnts_title}"/>
                                        </div>
                                        <div>
                                            <span class="contents_title">${i.cnts_title}</span><br>
                                            <span class="item_nm">${i.cnts_subttl}</span>
                                            <span class="item_grd">${i.cnts_op_date} : ${i.cnts_cnty}</span><br>
                                        </div>
                                    </div>
                                    <br>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-prev">
                    <div class="material-icons">chevron_left</div>
                </div>
                <div class="swiper-next">
                    <div class="material-icons">chevron_right</div>
                </div>

            </section>
        </c:if>


        <!--비로그인-->
        <c:if test="${pageContext.request.getSession(false)==null}">
            <br>
            <br>

        <!--컨텐츠 슬라이드-->
        <section class="contents">
            <div class="swiper-container">
                <div class="swiper-wrapper" style="height: 30rem;">
                    <div class="swiper-slide">
                        <div class="contents_container">
                            <c:forEach var="i" end="4" items="${cntsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                                <div class="detail-container" onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                    <div id="poster-img" style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                        <img id="poster-image" style="border-radius: 0.3rem;" src="${i.cnts_postr_img}" alt="${i.cnts_title}"/>
                                    </div>
                                    <div>
                                        <span class="contents_title">${i.cnts_title}</span><br>
                                        <span class="item_nm">${i.cnts_subttl}</span>
                                        <span class="item_grd">${i.cnts_op_date} : ${i.cnts_cnty}</span><br>
                                    </div>
                                </div>
                                <br>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="swiper-slide">
                        <div class="contents_container">
                            <c:forEach var="i" begin="5" end="9" items="${cntsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                                <div class="detail-container" onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                    <div id="poster-img" style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                        <img id="poster-image" style="border-radius: 0.3rem;" src="${i.cnts_postr_img}" alt="${i.cnts_title}"/>
                                    </div>
                                    <div>
                                        <span class="contents_title">${i.cnts_title}</span><br>
                                        <span class="item_nm">${i.cnts_subttl}</span>
                                        <span class="item_grd">${i.cnts_op_date} : ${i.cnts_cnty}</span><br>
                                    </div>
                                </div>
                                <br>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="swiper-slide">
                        <div class="contents_container">
                            <c:forEach var="i" begin="10" end="14" items="${cntsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                                <div class="detail-container" onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                    <div id="poster-img" style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                        <img id="poster-image" style="border-radius: 0.3rem;" src="${i.cnts_postr_img}" alt="${i.cnts_title}"/>
                                    </div>
                                    <div>
                                        <span class="contents_title">${i.cnts_title}</span><br>
                                        <span class="item_nm">${i.cnts_subttl}</span>
                                        <span class="item_grd">${i.cnts_op_date} : ${i.cnts_cnty}</span><br>
                                    </div>
                                </div>
                                <br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-prev">
                <div class="material-icons">chevron_left</div>
            </div>
            <div class="swiper-next">
                <div class="material-icons">chevron_right</div>
            </div>

        </section>
        </c:if>



    </div>

</main>

<!--여기서부터 푸터-->
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
</body>
</html>