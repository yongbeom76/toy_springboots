<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원리스트</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <!-- <link rel="stylesheet" href="./css/common.css" /> -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  </head>

  <body>
    <%@ include file="header_admin.jsp" %>
    <main class="d-flex align-items-center" style="height: 40rem">
      <div class="container">
        <div>
          <table class="table table-striped">
            <thead>
              <tr  class="text-center bg-info bg-warning">
                <th colspan="8" >회원리스트 (pagination 아직 적용 못했고, 우분투 서버에 올리는 것만 연습했어요)</th>
                <th colspan="2">
                  <form action="/insert" method="post">
                    <button class="btn btn-sm btn-primary">Insert</button>
                  </form>
                </th>
              </tr>
              <tr class="bg-warning bg-opacity-25">
                <th>아이디</th>
                <th>비밀번호</th>
                <th>권한</th>
                <th>이름</th>
                <th>성별</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>나이</th>
                <th>update</th>
                <th>delete</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="user" varStatus="loop">
              <tr>
                <td>${user.userId}</td>
                <td>${user.userPw}</td>
                <td>${user.userPriviliges}</td>
                <td>${user.userName}</td>
                <td>${user.userSex}</td>
                <td>${user.userPhoneNum}</td>
                <td>${user.userEmail}</td>
                <td>${user.userAge}</td>
                <td>
                  <form action="/update" method="post">
                    <button class="btn btn-primary btn-sm">Update</button>&nbsp;
                    <input type="hidden"  name="userId" value='${user.userId}'/>
                  </form>
                </td>
                <td>
                  <form action="/delete/${user.userId}">
                    <button class="btn btn-primary btn-sm">Delete</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        
        </div>
      </div>
    </main>

    <%@ include file="footer.jsp" %>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
