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
<form action="updateRno.jsp">
<%@page errorPage = "error.jsp" %>
  <%
  List<String[]> rows = null;
  if(request.getParameter("search")!=null){
	String rno1=request.getParameter("rno");
	rows = new UmsDAO().findStudentByRno(rno1);
  }
  if(rows != null){ %>
	<div class="container d-flex justify-content-center align-items-center mt-5 flex-column form-signin">
	<h2 class="mb-5">Edit Data</h2>
	<table cellpadding="10">
<%
for(String[] r : rows){
	String year=r[0];
	String name=r[1];
	String fname=r[2];
	String nrc=r[3];
	String dob=r[4];
	String nationality=r[5];
	String religion=r[6];
	String rno=r[7];
	String major=r[8];
	String acyear=r[9];
	String address=r[10];
	String ph=r[11];
	%>

	<tr>
	<td>Batch:</td>
	<td><input type="text" name="year" value="<%=year %>" class="form-control"  /></td>
	</tr>
	<tr>
	<td>Name:</td>
	<td><input type="text" name="name" value="<%= name%>" class="form-control"  /></td>
	</tr>
	<tr>
	<td>Father Name:</td>
	<td><input type="text" name="fname" value="<%=fname %>" class="form-control"/></td>
	</tr>
	<tr>
	<td>NRC:</td>
	<td><input type="text" name="nrc" value="<%=nrc%>" class="form-control"/></td>
	</tr>
	<tr>
	<td>Date of Birth:</td>
	<td><input type="text" name="dob" value="<%=dob %>" class="form-control"/></td>
	</tr>
	<tr>
	<td>Nationality:</td>
	<td><input type="text" name="nationality" value="<%=nationality %>" class="form-control"/></td>
	</tr>
	<tr>
	<td>Religion:</td>
	<td><input type="text" name="religion" value="<%=religion%>" class="form-control"/></td>
	</tr>
	<tr>
	<td>Roll No.:</td>
	<td><input type="text" name="rno" value="<%=rno%>" class="form-control" readOnly="readOnly"/></td>
	</tr>
	<tr>
	<td>Major:</td>
	<td><input type="text" name="major" value="<%=major%>" class="form-control"/></td>
	</tr>
	<tr>
	<td>Year:</td>
	<td><input type="text" name="acyear" value="<%=acyear%>" class="form-control"/></td>
	</tr>
	<tr>
	<td>Address:</td>
	<td><input type="text" name="address" value="<%=address%>" class="form-control"/></td>
	</tr>
	<tr>
	<td>Phone Number:</td>
	<td><input type="text" name="ph" value="<%=ph%>" class="form-control"/></td>
	</tr>
	<tr>

	<td colspan="2">
	<div class="d-flex justify-content-between mt-3">
	<input type="submit" value="Update" name="Update" class="btn btn-success w-25 mx-2"/>
	<input type="submit" value="Delete" name="Delete" class="btn btn-danger w-25 mx-2"/>
	<input type="button" value="Back" name="Back" class="btn btn-secondary w-25 mx-2" id="back" />
	</div>
	</td>
	</tr>
	<% } %>
	</table>
	</div><% } %>
	</form>

	<script>
		document.querySelector("#back").addEventListener("click", () => {
			window.location.href = "admin-dashboard.jsp";
		})
	</script>
</body>
</html>
