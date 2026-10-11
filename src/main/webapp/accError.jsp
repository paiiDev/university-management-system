<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>!</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
    <script src="./js/bootstrap.bundle.min.js"></script>
     <link rel="shortcut icon" href="./images/ucspl.png" type="image/x-icon" />
</head>
<body>
		<%@page isErrorPage="true"%>
		<div class="container py-5 my-5 w-75">
    	        <div class="d-flex bg-secondary-subtle justify-content-center align-items-center p-5 text-center flex-column">
              <img src="./images/incorrect.jpg" alt="" class="w-25 mb-3">
              <h3 class="text-danger ">Sorry😓 <br>
              ⚠️Account cannot create⚠️
              </h3>
              <a href="admin-dashboard.jsp" class="btn btn-primary w-50 mt-5">Back</a>
          </div>
      </div>
	</body>

</html>