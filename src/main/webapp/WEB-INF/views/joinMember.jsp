<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <%@ include file="header_notlogin.jsp" %>
      
    <%
      String name = request.getParameter("name");
      String age = request.getParameter("age");
      String sex = request.getParameter("sex");
      String identification_number = request.getParameter("identification_number"); // ex) 010 011
      String number = request.getParameter("number"); // 전화번호 나머지
      String email = request.getParameter("email");
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      boolean isFinBtn = true;
      if(name == null) { // 처음값 지우기
        name="";
        age="";
        sex="";
        identification_number="";
        number="";
        email="";
        id="";
        pw="";
      }
    %>
        <div class="container">
      <div class="fs-3 text-center mt-3 mb-4">회원가입</div>
      <form action="/joinMemberServlet" onsubmit="return validateForm()" name="joinForm" method="post">
        <table class="table">
          <tr>
            <th>이름</th>
            <td>
              <input class="form-control" type="text" name="name" value="<%=name%>" id="name"/>
            <div id="nameError"></div>
            </td>
          </tr>
          <tr>
            <th>나이</th>
            <td>
              <input class="form-control" type="text"  name="age" value="<%=age%>" id="age"/>
              <div id="ageError"></div>
            </td>
            
          </tr>
          <tr>
            <th>성별</th>
            <td>
              <select name="sex" id="" class="form-select w-25 text-center">
              <%if(sex.equals("Woman")) {%>
                <option value="Man">남성</option>
                <option value="Woman" selected>여성</option>
                <%} else {%>
                <option value="Man">남성</option>
                <option value="Woman">여성</option>
                <%}%>
              </select>
            </td>
          </tr>
          <tr>
            <th>전화번호</th>
            <td class="row">
              <div class="col-2">
                <select
                  class="form-select text-center"
                  name="identification_number"
                >
                  <option value="010">010</option>
                  <option value="011">011</option>
                </select>
              </div>
              <div class="col">
                <input class="form-control" type="text" name="number"  value="<%=number%>" id="number"/>
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
                value="<%=email%>"
              />
              <div id="emailError"></div>
            </td>
          </tr>
          <tr>
            <th>ID</th>
            <td class="row">
                <div class="col-8">
                  <input class="form-control" type="text" name="id" value="<%=id%>" id="id"/>
                </div>
                <div class="col-4">
                  <button name="isFinish" value="notFin" class="btn btn-outline-primary" onclick="validateForm(true)" type="submit">아이디 중복확인</button>
                </div>
                <% // id 중복
                String isDup = (String)request.getAttribute("isDup");
                if(isDup!=null) {%>
              <div id="idError" style="color:red;"><%=isDup%> </div>
               
              <%  } %>
            </td>
          </tr>
          <tr>
            <th>PW</th>
            <td>
              <input class="form-control" type="password" name="pw" value="<%=pw%>" id="pw"/>
            <div id="pwError"></div>
            </td>
          </tr>
        </table>
        <div class="text-center mb-3">
          <a href="/login/logPageServlet" class="btn btn-warning">뒤로가기</a>
          <button name="isFinish" onclick="validateForm(false)" value="fin" class="btn btn-warning">
            회원가입
          </button>
        </div>
      </form>
    </div>


    <%@ include file="footer.jsp" %>
    <script src="./js/joinMemberScript.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
<%-- <% // id 중복
                String isDup = (String)request.getAttribute("isDup");
                if(isDup!=null) {
                if(isDup.equals("중복된 ID 입니다")) { %>
               <div style="color:red;">
                <%=isDup%>
               </div>
               <% } else { %>
                <div style="color:red;">
                <%=isDup%>
               </div>
              <% } } %> --%>