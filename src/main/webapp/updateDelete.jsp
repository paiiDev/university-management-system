<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ucspl.dao.UmsDAO" %>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update & Delete</title>

 <link rel="stylesheet" href="./css/bootstrap.min.css">
    <script src="./js/bootstrap.bundle.min.js"></script>
     <link rel="shortcut icon" href="./images/ucspl.png" type="image/x-icon" />
</head>
	<body>
	<form action="update.jsp">
		<%
		String year = request.getParameter("year");
		String subcode = request.getParameter("subcode");
		String subject = request.getParameter("sub");
		String tt = request.getParameter("tt");
		String dd = request.getParameter("dd");
		String aort = request.getParameter("aort");
		UmsDAO dao = new UmsDAO();

		if(request.getParameter("Update")!=null ){
			dao.updateTuto(year, subcode, subject, tt, dd, aort, subcode);
			%>
	<div class="container py-5 my-5 w-75">
    	        <div class="d-flex bg-secondary-subtle justify-content-center align-items-center p-5 text-center flex-column">
              <img src="./images/circle-check-solid.svg" alt="" class="w-25 mb-5">
              <h3 class="text-success ">Successfully edited information</h3>
              <a href="admin-dashboard.jsp" class="btn btn-primary w-50 mt-5">Back</a>
          </div>
      </div>

			<%
		}
		else if(request.getParameter("Delete")!=null){
			dao.deleteTutoBySubcode(subcode);%>
		<div class="container py-5 my-5 w-75">
    	        <div class="d-flex bg-secondary-subtle justify-content-center align-items-center p-5 text-center flex-column">
              <img src="./images/circle-check-solid.svg" alt="" class="w-25 mb-5">
              <h3 class="text-success ">Successfully delete information</h3>
              <a href="admin-dashboard.jsp" class="btn btn-primary w-50 mt-5">Back</a>
          </div>
      </div>
		<% } %>
		</form>
	</body>

</html>
