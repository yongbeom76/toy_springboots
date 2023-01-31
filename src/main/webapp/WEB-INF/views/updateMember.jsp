<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원정보 수정</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <%@ include file="header_notlogin.jsp" %>
    <div class="container">
      <div class="fs-3 text-center mt-3 mb-4">회원정보 수정</div>
      <form action="/update/"  name="joinForm" method="post">
        <table class="table">
          <tr>
            <th>이름</th>
            <td>
              <input class="form-control" type="text" name="name" value="${user.userName}" id="name"/>
            <div id="nameError"></div>
            </td>
          </tr>
          <tr>
            <th>나이</th>
            <td>
              <input class="form-control" type="text"  name="age" value="${user.userAge}" id="age"/>
              <div id="ageError"></div>
            </td>
          </tr>
          <tr>
            <th>성별</th>
            <td>
              <select name="sex" id="" class="form-select w-25 text-center">
              <c:if test="${user.userSex eq 'Woman'}">
                <option value="Man">남성</option>
                <option value="Woman" selected>여성</option>
              </c:if>
              <c:if test="${user.userSex eq 'Man'}">
                <option value="Man">남성</option>
                <option value="Woman">여성</option>
              </c:if>
              </select>
            </td>
          </tr>
          <tr>
            <th>전화번호</th>
            <td class="row">
              <div class="col">
                <input class="form-control" type="text" name="number"  value="${user.userPhoneNum}" id="number"/>
              </div>
              <div id="numberError"></div>
            </td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>
              <input
                class="form-control"
                type="email"
                name="email"
                placeholder="asdas@naver.com"
                id="email"
                value="${user.userEmail}"
              />
              <div id="emailError"></div>
            </td>
          </tr>
          <tr>
            <th>ID</th>
            <td class="row">
                <div class="col-8">
                  <input class="form-control" type="text" name="id" value="${user.userId}" id="id"/>
                </div>
            </td>
          </tr>
          <tr>
            <th>PW</th>
            <td>
              <input class="form-control" type="password" name="pw" value="${user.userPw}" id="pw"/>
              <div id="pwError"></div>
            </td>
          </tr>
        </table>
        <div class="text-center mb-3">
          <button class="btn btn-warning">
            정보수정
          </button>
        </div>
      </form>
    </div>

    <%@ include file="footer.jsp" %>
    <script src="joinMemberScript.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
