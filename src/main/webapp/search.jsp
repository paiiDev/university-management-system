<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ucspl.dao.UmsDAO" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Saved</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
    <script src="./js/bootstrap.bundle.min.js"></script>
     <link rel="shortcut icon" href="./images/ucspl.png" type="image/x-icon" />
</head>
<style>
	   .form-signin{
            width: 400px;
            backdrop-filter: blur(10px);
            border: 1px solid black;
           	padding: 15px;
            border-radius: 10px;
            background-color: rgba(rgb(182, 182, 182), rgb(217, 217, 217), rgb(196, 196, 196), 0.2);
        }
</style>
<body>
<form action="updateDelete.jsp">
<%@page errorPage = "error.jsp" %>
  <%
  List<String[]> rows = null;
  if(request.getParameter("search")!=null){
	String sub1=request.getParameter("sub");
	rows = new UmsDAO().findTutoBySubcode(sub1);
  }
  if(rows != null){ %>
	<div class="container d-flex justify-content-center align-items-center mt-5 flex-column form-signin">
	<h2 class="mb-5">Edit Data</h2>
	<table cellpadding="10">
<%
for(String[] r : rows){
	String year=r[0];
	String subcode = r[1];
	String sub=r[2];
	String tt=r[3];
	String dd=r[4];
	String aort=r[5];%>

	<tr>
	<td>Year:</td>
	<td><input type="text" name="year" value="<%=year %>" class="form-control"  /></td>
	</tr>
	<tr>
	<td>Subcode:</td>
	<td><input type="text" name="subcode" value="<%= subcode%>" class="form-control"  readOnly="readOnly"/></td>
	</tr>
	<tr>
	<td>Subject:</td>
	<td><input type="text" name="sub" value="<%=sub %>" class="form-control"/></td>
	</tr>
	<tr>
	<td>Time:</td>
	<td><input type="text" name="tt" value="<%=tt%>" class="form-control"/></td>
	</tr>
	<tr>
	<td>Date:</td>
	<td><input type="text" name="dd" value="<%=dd %>" class="form-control"/></td>
	</tr>
	<tr>
	<td>Assignment & <br> Tutorial:</td>
	<td><input type="text" name="aort" value="<%=aort %>" class="form-control"/></td>
	</tr>
	<tr>

	<td colspan="2">
	<div class="d-flex justify-content-between mt-3">
	<input type="submit" value="Update" name="Update" class="btn btn-success w-25 mx-2"/>
	<input type="submit" value="Delete" name="Delete" class="btn btn-danger w-25 mx-2"/>
	<input type="button" value="Back" name="Back" class="btn btn-secondary w-25 mx-2 back" />
	</div>
	</td>
	</tr>
	<% } %>
	</table>
	</div><% } %>
	</form>

	<script>
		document.querySelector(".back").addEventListener("click", () => {
			window.location.href = "admin-dashboard.jsp"
		})
	</script>
</body>
</html>
