<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ucspl.dao.UmsDAO" %>
<%@page import="java.util.List" %>
<%@page errorPage = "error.jsp" %>
<%
  UmsDAO dao = new UmsDAO();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link rel="shortcut icon" href="./images/ucspl.png" type="image/x-icon" />

    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <script src="./js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-warning" aria-label="Offcanvas navbar large">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">

        <img src="./images/ucspl.png" alt="" width="50px">
        University of Computer Studies, Panglong
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar2" aria-controls="offcanvasNavbar2" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbar2" aria-labelledby="offcanvasNavbar2Label">
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasNavbar2Label">UCSPL</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
          <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
            <li class="nav-item">
              <a class="nav-link text-success"  href="home.html"> 🏠 Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-success" href="#" id="TTable">📅 Time Table</a>
            </li>
             <li class="nav-item">
              <a class="nav-link text-success" href="#" id="aort">📚 Assignment & Tutorial</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-success" href="#" id="annou">📢 Announcement</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-success" href="#" id="logout">⚙️ Logout</a>
            </li>
          </ul>
        
        </div>
      </div>
    </div>
  </nav>
<div class="container bg-body-tertiary ">
    <div class=" rounded dash-board-data">
      <div class="col-sm-8 py-5 mx-auto ">
            <img src="./images/UserDashboard.png" alt="" class="img-fluid">
    </div>
    </div>
  
  </div>
  
  <script>
  	document.querySelector("#TTable").addEventListener("click", () => {

  		   document.querySelector(".dash-board-data").innerHTML =`
  			   <div class="container bg-body-tertiary ">
  			    <div class=" rounded">
  			      <div class="col-sm-8 py-5 mx-auto">
  			          <ul style="list-style: none;">
  			            <li class="mb-5">
  			                <div class="d-flex flex-column align-items-center">
  			                      <h5 class="my-3">First Year Time Table</h5>
  			                <img src="./images/first.jpg" alt="" class="img-fluid w-75">
  			                </div>
  			              
  			            </li>
  			            <li class="mb-5">
  			                 <div class="d-flex flex-column align-items-center">
  			                      <h5 class="my-3">Second Year Time Table</h5>
  			                <img src="./images/second.png" alt="" class="img-fluid w-75">
  			                </div>
  			            </li>
  			            <li class="mb-5">
  			                 <div class="d-flex flex-column align-items-center">
  			                      <h5 class="my-3">Third Year Time Table</h5>
  			                <img src="./images/third.jpg" alt="" class="img-fluid w-75">
  			                </div>
  			            </li>
  			            <li class="mb-5">
  			                 <div class="d-flex flex-column align-items-center">
  			                      <h5 class="my-3">Fourth Year Time Table</h5>
  			                <img src="./images/fourth.jpg" alt="" class="img-fluid w-75">
  			                </div>
  			            </li>
  			            
  			          </ul>
  			    </div>
  			    </div>
  			  </div>
  			  `;
  	      
  	  
  	})
  	
  	document.querySelector("#aort").addEventListener("click",() => {
  		document.querySelector(".dash-board-data").innerHTML =`
  		  
			<div class="container">
		  
		</div>
		    <div class="d-flex justify-content-center align-items-center flex-column">
		  <%
			List<String[]> tutoRows = dao.listTutos();
     		%>
     		
     	  <h2 class=" m-4">All Schedule</h2>
		    <table class="table table-bordered">
		        <tr>
		            <th>Year</th>
		            <th>Subject Code</th>
		            <th>Subject </th>
		            <th>Time</th>
		            <th>Date</th>
		            <th>Remark</th>
		        </tr>
     		<%
     		for(String[] r : tutoRows){
     			%>    
		  
		        <tr>
		            <td class="w-25"><%=r[0]%></td>
					 <td class="w-25"><%=r[1]%></td>
		            <td class="w-25"><%=r[2]%></td>
		            <td class="w-auto"><%=r[3]%></td>
		            <td class="w-25"><%=r[4]%></td>
		            <td class="w-25"><%=r[5]%></td>
		           
		        </tr>
		 <% }%>
		    </table>
		
		    </div>
		    

		   </div>
		 `;
  	})
  	
  	document.querySelector("#logout").addEventListener("click", () => {
    	  
      		alert("Account will log out ⚠️")
    		window.location.href = "home.html";
      })
      
      document.querySelector("#annou").addEventListener("click", () => {
	   document.querySelector(".dash-board-data").innerHTML =`
	   	
		   <div class="container">
 		 
 		  <div class="d-flex justify-content-end">

			
		</div>
 		    <div class="d-flex justify-content-center align-items-center flex-column">
 		  <%
 			List<String[]> annRows = dao.listAnnouncements();
      		%>
      		
      	  <h2 class=" m-4">All Announcements</h2>
		    <table class="table table-bordered">
		        <tr>
		            <th>Messages</th>

		        </tr>
      		<%
      		for(String[] r : annRows){
      			%>    
 		  
 		        <tr>
 		            <td class="w-25">
 		            <%=r[0]%>
 					</td>
  		        </tr>
 		 <% }%>
 		    </table>
		
 		    </div>
 		    

 		   </div>
		`;
   })
  	
  </script>
</body>
</html>
