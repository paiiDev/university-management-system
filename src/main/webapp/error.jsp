<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
    <script src="./js/bootstrap.bundle.min.js"></script>
     <link rel="shortcut icon" href="./images/ucspl.png" type="image/x-icon" />
</head>
<body>
	<div class="container py-5 my-5 w-75">
		<div class="d-flex bg-secondary-subtle justify-content-center align-items-center p-5 text-center flex-column">
			<h3 class="text-danger">Sorry, an unexpected error occurred.</h3>
			<p class="text-muted">Please try again or contact the administrator.</p>
			<a href="home.html" class="btn btn-primary w-50 mt-5">Back to Home</a>
		</div>
	</div>
	<%
		// The exception is intentionally NOT rendered to the client to avoid
		// leaking internal details. It is logged on the server instead.
		if (exception != null) {
			exception.printStackTrace();
		}
	%>
</body>
</html>
