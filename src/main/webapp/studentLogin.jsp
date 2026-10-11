<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ucspl.dao.UmsDAO" %>
<%@page errorPage = "error.jsp" %>
<%
boolean loginFailed = false;
if(request.getParameter("submit") != null){
	boolean ok = new UmsDAO().authenticateStudent(
			request.getParameter("userName"),
			request.getParameter("mail"),
			request.getParameter("password"));
	if(ok){
		request.getRequestDispatcher("user-dashboard.jsp").forward(request, response);
		return;
	}
	loginFailed = true;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <script src="./js/bootstrap.bundle.min.js"></script>
    <style>
        body{
            background-image: url("./images/userLogin.jpg");
            background-size: cover;
            background-position: center;


        }

        .form-signin{
            width: 320px;
            backdrop-filter: blur(10px);
            border: 1px solid wheat;
            padding-left: 15px;
            padding-right: 15px;
            border-radius: 10px;
            background-color: rgba(rgb(182, 182, 182), rgb(217, 217, 217), rgb(196, 196, 196), 0.2);
        }
    </style>
    <link rel="shortcut icon" href="./images/ucspl.png" type="image/x-icon">
</head>
<body>
    <div class="container">
        <main class="form-signin mx-auto my-5 py-5">
  <form method='post'>
    <img class="mb-4" src="./images/ucspl.png" alt="" width="72" height="72">
    <h1 class="h4 mb-5 fw-danger">Please Login as Student</h1>

    <div class="form-floating mb-3">
      <input type="text" name='userName' class="form-control" id="floatingInput" placeholder="name@example.com" required>
      <label for="floatingInput">Username</label>
    </div>
    <div class="form-floating mb-4">
      <input type="mail" name='mail' class="form-control" id="mail" placeholder="Mail" required>
      <label for="mail">Mail</label>
    </div>
     <div class="form-floating mb-4">
      <input type="password" name='password' class="form-control" id="floatingPassword" placeholder="Password" required>
      <label for="floatingPassword">Password</label>
    </div>


    <button class="btn btn-primary w-100 py-2" type="submit" name="submit">Login</button>

  </form>
</main>
    </div>
    <% if(loginFailed){ %>
    <div style='text-align:center;font-size:18px'><font color='red'>Email or Password does not match!</font></div>
    <% } %>
</body>
</html>
