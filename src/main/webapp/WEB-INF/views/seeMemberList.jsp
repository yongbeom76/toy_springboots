<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
          <%
            ArrayList userList = (ArrayList) request.getAttribute("userList");
          %>
          
          <table class="table table-striped">
            <thead>
              <tr  class="text-center bg-info bg-warning">
                <th colspan="9" >회원리스트</th>
              </tr>
              <tr colspan="" class="bg-warning bg-opacity-25">
                <th>아이디</th>
                <th>비밀번호</th>
                <th>권한</th>
                <th>이름</th>
                <th>성별</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>나이</th>
                <th>update/delete</th>
              </tr>
            </thead>
            <tbody>
              <% 
                for(int i=0; i<userList.size(); i++) {
                  HashMap row = (HashMap) userList.get(i);
                  String userId = (String) row.get("userId");
                  String userPw = (String) row.get("userPw");
                  String userPrivileges = (String) row.get("userPrivileges");
                  String userName = (String) row.get("userName");
                  String userSex = (String) row.get("userSex");
                  String userPhoneNum = (String) row.get("userPhoneNum");
                  String userEmail = (String) row.get("userEmail");
                  String userAge = (String) row.get("userAge");
              %>
                <tr>
                  <td><%=userId%></td>
                  <td><%=userPw%></td>
                  <td><%=userPrivileges%></td>
                  <td><%=userName%></td>
                  <td><%=userSex%></td>
                  <td><%=userPhoneNum%></td>
                  <td><%=userEmail%></td>
                  <td><%=userAge%></td>
                  <td><button class="btn btn-primary btn-sm">Update</button>&nbsp;<button class="btn btn-primary btn-sm">Delete</button></td>
                </tr>
              <%
                }
              %>
              
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
