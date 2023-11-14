<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trip</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
    />
    <link rel="stylesheet" href="assets/css/main.css" />
  </head>
  <body>
    <!-- 상단 navbar start -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow fixed-top">
      <div class="container">
        <a
          class="navbar-brand text-black fw-bold"
          href="index.html"
          style="
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            font-size: 30px;
          "
        >
          <img src="${root}/assets/img/qq.png" alt="" width="60" />
          <img src="${root}/assets/img/et.png" alt="" width="120" />
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#collapsibleNavbar"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
          <ul class="navbar-nav me-auto">
            <!-- <li class="nav-item">
                <a class="nav-link" href="#">공지사항</a>
              </li> -->
            <li class="nav-item">
              <a class="nav-link" href="place.html">핫플찾기🚗</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">여행계획🎈</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="board.html">정보공유✨</a>
            </li>
          </ul>
          <!-- 로그인 전 -->
          <ul class="navbar-nav mb-2 me-2 mb-lg-0 beforeLogin">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="register.html">회원가입 ✍🏻</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="login.html">로그인</a>
            </li>
          </ul>
          <!-- 로그인 후 -->
          <ul class="navbar-nav mb-2 me-2 mb-lg-0 afterLogin">
            <li class="nav-item after">
              <a class="nav-link" aria-current="page" href="#" onclick="logout()">로그아웃</a>
            </li>
            <li class="nav-item after">
              <a class="nav-link" aria-current="page" href="mypage.html">마이페이지</a>
            </li>
            <!-- 만약에 내가 관리자라면 -->
            <li class="nav-item dropdown admin">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                관리자
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li>
                  <a
                    class="dropdown-item"
                    href="#"
                    data-bs-toggle="modal"
                    data-bs-target="#pollModal"
                    >투표만들기</a
                  >
                </li>
                <li><a class="dropdown-item" href="#">차트보기</a></li>
                <li><a class="dropdown-item" href="#">회원관리</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- 상단 navbar end -->
    <!--------------------------------------------------------------------------->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <script src="./assets/js/loginUser.js"></script>
    <script src="./assets/js/main.js"></script>
  </body>
</html>
