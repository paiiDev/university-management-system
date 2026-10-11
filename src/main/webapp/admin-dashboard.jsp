<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin-Dashboard</title>
    <link rel="shortcut icon" href="./images/ucspl.png" type="image/x-icon" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <script src="./js/bootstrap.bundle.min.js"></script>
    <style>

	.cfs {
	font-size: 14px;
	}



      .sidebar {
      font-size: 14px;
  	min-height: 100vh; /* This ensures it covers the full viewport height */
	}
	@media (width < 765px){
	.sidebar {
  	min-height: 0vh;
	}


    </style>
  </head>
  <body>
  <%@page import = "com.ucspl.dao.UmsDAO" %>
<%@page import = "java.util.List" %>
<%@page errorPage = "error.jsp" %>
  <%
  UmsDAO dao = new UmsDAO();
  %>


    <header
      class="navbar sticky-top bg-dark flex-md-nowrap p-0 shadow"
      data-bs-theme="dark"
    >
      <a
        class="navbar-brand col-md-3 col-lg-2 me-0 px-1 cfs  text-white"
        href="#"
        >University of Computer Studies, Panglong</a
      >
      

      <ul class="navbar-nav flex-row d-md-none">
        <li class="nav-item text-nowrap">
          <button
            class="nav-link px-3 text-white"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSearch"
            aria-controls="navbarSearch"
            aria-expanded="false"
            aria-label="Toggle search"
          >
           
          </button>
        </li>
        <li class="nav-item text-nowrap">
          <button
            class="nav-link px-3 text-white"
            type="button"
            data-bs-toggle="offcanvas"
            data-bs-target="#sidebarMenu"
            aria-controls="sidebarMenu"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
           <img src="./images/bars-solid.svg" alt="" width="20px" height="20px">
          </button>
        </li>
      </ul>

      <div id="navbarSearch" class="navbar-search w-100 collapse">
        <input
          class="form-control w-100 rounded-0 border-0"
          type="text"
          placeholder="Search"
          aria-label="Search"
        />
      </div>
    </header>
    <div class="container-fluid">
      <div class="row">
        <div
          class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary"
        >
          <div
            class="offcanvas-md offcanvas-end bg-body-tertiary"
            tabindex="-1"
            id="sidebarMenu"
            aria-labelledby="sidebarMenuLabel"
          >
            <div class="offcanvas-header">
              <h5 class="offcanvas-title" id="sidebarMenuLabel">
                University of Computer Studies, Panglong
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="offcanvas"
                data-bs-target="#sidebarMenu"
                aria-label="Close"
              ></button>
            </div>
            <div
              class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto offcanvas-body"
            >
              <ul class="nav flex-column mt-5">
                  <li class="nav-item my-1 text-center">
                  <a href="admin-dashboard.jsp">
                  	<img src="./images/ucspl.png" class="w-25 ">
                 </a>
                </li>
                <hr>
                <span class="mx-5">Students</span>
                <li class="nav-item my-1">
                  <a
                    class="nav-link d-flex align-items-center gap-2 active"
                    aria-current="page"
                    href="#"
                    id="newStuReg"
                  >
                   📝 ‍Student Registration
                    
                  </a>
                </li>
               
                 <li class="nav-item">
                  <a class="nav-link d-flex align-items-center gap-2" href="#" id="stuData">
                     👤 Students Data
                  </a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link d-flex align-items-center gap-2" href="#" id="stuAcc">
                    ✒️ Account Creation
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link d-flex align-items-center gap-2" href="#" id="stuAccInfo">
                   📄 Student Accounts
                  </a>
                </li>
                       <hr>
                <li class="nav-item">
                  <a class="nav-link d-flex align-items-center gap-2" href="#" id="timeTable">
                   📅 Time Table
                  </a>
                </li>
         
                <li class="nav-item">
                  <a class="nav-link d-flex align-items-center gap-2" href="#" id="tuto">
                   📚 Assignment & Tutorial
                  </a>
                </li>
                <li class="nav-item " >
                  <a class="nav-link d-flex align-items-center gap-2" href="#" id="allSchedule">
                   🔎 See All Schedule
                  </a>
                </li>
                <li class="nav-item " >
                  <a class="nav-link d-flex align-items-center gap-2" href="#" id="annou">
                   📢 Announcement
                  </a>
                </li>
                <hr>
                <span class="mx-5">Settings</span>
                 <li class="nav-item" >
                  <a class="nav-link d-flex align-items-center gap-2" href="#" id="logOut">
                    ⚙️ Log out
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
          <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"
          >
            <h1 class="h2">University Management System</h1>
          </div>
  <div class="dash-board-data">
             <div class="d-flex justify-content-center">
        <img src="./images/dashboard-2.png" alt="" class="img-fluid dashboard-bg">
        </div>
            
          </div>
          
        </main>
      </div>
    </div>

    <script>
      var newStuReg = document.querySelector("#newStuReg");
      newStuReg.addEventListener("click", function () {

        document.querySelector(".dash-board-data").innerHTML = `<div class="container w-75 py-5">
              <h4 class="mb-3">New Student Registration</h4>
              <form class="needs-validation" onkeydown="if(event.keyCode === 13) {
            alert('You have pressed Enter key, use submit button instead'); 
            return false;
        }" method="get" action="saveStudentInfo.jsp">
                <div class="row g-3">
                  <div class="col-12">
                    <label for="batch" class="form-label">Batch</label>
                    <select name="year" id="batch" class="form-select">
                      <option value="none"></option>
                      <option value="2019-2020">2019-2020</option>
                      <option value="2020-2021">2020-2021</option>
                      <option value="2021-2022">2021-2022</option>
                      <option value="2022-2023">2022-2023</option>
                      <option value="2023-2024">2023-2024</option>
                      <option value="2024-2025">2024-2025</option>
                    </select>
                  </div>
                  <div class="col-12">
                    <label for="firstName" class="form-label">Name</label>
                    <input
                      type="text"
                      class="form-control"
                      id="Name"
                      name="name"
                    	  required
                    />
                  </div>
                  <div class="col-12">
                    <label for="lastName" class="form-label">Father name</label>
                    <input
                      type="text"
                      class="form-control"
                      id="fname"
                      name="fname"
                    />
                  </div>

                  <div class="col-12">
                    <label for="nrc" class="form-label">NRC</label>
                    <div class="input-group">
                      <input
                        type="text"
                        class="form-control"
                        id="nrc"
                        name="nrc"
                        	required
                      />
                    </div>
                  </div>

                  <div class="col-12">
                    <label for="dob" class="form-label">Date of Birth</label>
                    <input
                      type="date"
                      class="form-control"
                      id="dob"
                      name="dob"
                    />
                  </div>

                  <label for="nationality" class="form-label pt-3"
                    >Nationality & Religion</label
                  >
                  <div class="col-6">
                    <input
                      type="text"
                      class="form-control"
                      id="nationality"
                      name="nationality"
                    />
                  </div>
                  <div class="col-6">
                    <input
                      type="text"
                      class="form-control"
                      id="religion"
                      name="religion"
                    />
                  </div>

                  <div class="col-12">
                    <label for="rno" class="form-label">Roll no. </label>
                    <input
                      type="text"
                      class="form-control"
                      id="rno"
                      name="rno"
                      placeholder="If you are first year student, Please fill your matriculation roll no."
                      required
                    />
                  </div>

                  <div class="col-12">
                    <label for="major" class="form-label">Major</label>
                    <select name="major" id="major" class="form-select">
                      <option value="Computer Science and Technology">CST (Computer Science and Technology)</option>
                      <option value="Computer Science">CS (Computer Science)</option>
                      <option value="Computer Technology">CT (Computer Technology)</option>
                    </select>
                  </div>

                  <div class="col-12">
                  <label for="acyear" class="form-label">Year</label>
                  <select name="acyear" id="acyear" class="form-select">
                    <option value="First Year">First Year</option>
                    <option value="Second Year">Second Year</option>
                    <option value="Third Year">Third Year</option>
                    <option value="Fourth Year">Fourth Year</option>
                    <option value="Fifth Year">Fifth Year</option>
                  </select>
                </div>
                  
                  <div class="col-12">
                    <label for="address" class="form-label">Address</label>
                    <textarea name="address" cols="35" rows="4" id="address"></textarea>
                  </div>

                  <div class="col-12">
                    <label for="ph" class="form-label">Phone Number </label>
                    <input type="phone" class="form-control" id="ph" name="ph" />
                  </div>

                  <button class="w-100 btn btn-primary btn-lg" type="submit" name="submit">
                    Submit
                  </button>
                </div>
              </form>
            </div>`;
      });
      
      var stuData = document.querySelector("#stuData");
      stuData.addEventListener("click", function() {
    	 
    	  document.querySelector(".dash-board-data").innerHTML = `
    		  <div class="container">
              <div class="bg-secondary-subtle p-2 d-flex justify-content-center">
              
               <img src="./images/login-bg.jpg" class="w-50 h-25"> 
               </div>
               <form>
               <div class="text-center mt-3">
                 <input type="submit" class="btn btn-warning mx-2 mb-2" id="first-year" value="First Year">
               <input type="submit" class="btn btn-warning mx-2 mb-2" id="second-year" value="Second Year">
               <div class="btn btn-warning mx-2 mb-2" id="third-year">Third Year</div>
               <div class="btn btn-warning mx-2 mb-2" id="fourth-year">Fourth Year</div>
               <div class="btn btn-warning mx-2 mb-2" id="fifth-year">Fifth Year</div>
               </div>
               </form>
              </div>
    	  `;
    	  
      
    	   document.querySelector("#first-year").addEventListener("click", function() {
    	 
    	 document.querySelector(".dash-board-data").innerHTML =`
 
      			<div class="container">
    		 <form action="searchRno.jsp">
    	 <div class="d-flex flex-row justify-content-end">
  			<input type="text" name="rno" class="form-control mx-2 w-25" placeHolder="Search with Roll No.">
  			<input type="submit" name="search" value="Search" class="btn btn-secondary">
  		</div>
  		</form>
      		   
      		  <%
          	List<String[]> firstRows = dao.listStudentsByYear("First Year");
           	%>
            	  <h2 class=" m-4">First Year Students Data</h2>
           
    		    <table class="table table-bordered">
    		   
    		        <tr>
    		            <th>Roll No.</th>
    		            <th>Name</th>
    		            <th>Year</th>
    		            <th>Major</th>
    		        </tr>
            		<%
            		for(String[] r : firstRows){
            			%>    
      		  
            			
      		        <tr>
      		            <td class="w-25"><%=r[0]%></td>
      		            <td class="w-25"><%=r[1]%></td>
      		            <td class="w-25"><%=r[2]%></td>
      		           	<td class="w-25"><%=r[3]%></td>
      		        </tr>
      		       
      		      <% }%>
      		  
      		    </table>

      		 
      		   </div>
      		 `;
      		 
   })
   
    	  
     document.querySelector("#second-year").addEventListener("click", function() {
    	 
    	 document.querySelector(".dash-board-data").innerHTML =`
 
      			<div class="container">
    		 <form action="searchRno.jsp">
    	 <div class="d-flex flex-row justify-content-end">
  			<input type="text" name="rno" class="form-control mx-2 w-25" placeHolder="Search with Roll No.">
  			<input type="submit" name="search" value="Search" class="btn btn-secondary">
  		</div>
  		</form>
      		   
      		  <%
          	List<String[]> secondRows = dao.listStudentsByYear("Second Year");
           	%>
            	  <h2 class=" m-4">Second Year Students Data</h2>
           
    		    <table class="table table-bordered">
    		   
    		        <tr>
    		            <th>Roll No.</th>
    		            <th>Name</th>
    		            <th>Year</th>
    		            <th>Major</th>
    		        </tr>
            		<%
            		for(String[] r : secondRows){
            			%>    
      		  
            			
      		        <tr>
      		            <td class="w-25"><%=r[0]%></td>
      		            <td class="w-25"><%=r[1]%></td>
      		            <td class="w-25"><%=r[2]%></td>
      		           	<td class="w-25"><%=r[3]%></td>
      		        </tr>
      		       
      		      <% }%>
      		  
      		    </table>

      		 
      		   </div>
      		 `;
      		 
   })
   
   document.querySelector("#third-year").addEventListener("click", function() {
  	 
  	 document.querySelector(".dash-board-data").innerHTML =`

    			<div class="container">
  		 <form action="searchRno.jsp">
  	 <div class="d-flex flex-row justify-content-end">
			<input type="text" name="rno" class="form-control mx-2 w-25" placeHolder="Search with Roll No.">
			<input type="submit" name="search" value="Search" class="btn btn-secondary">
		</div>
		</form>
    		   
    		  <%
    			List<String[]> thirdRows = dao.listStudentsByYear("Third Year");
        		%>
        	  <h2 class=" m-4">Third Year Students Data</h2>
         
  		    <table class="table table-bordered">
  		   
  		        <tr>
  		            <th>Roll No.</th>
  		            <th>Name</th>
  		            <th>Year</th>
  		            <th>Major</th>
  		        </tr>
        		<%
        		for(String[] r : thirdRows){
        			%>    
    		  
        			
    		        <tr>
    		            <td class="w-25"><%=r[0]%></td>
    		            <td class="w-25"><%=r[1]%></td>
    		            <td class="w-25"><%=r[2]%></td>
    		           	<td class="w-25"><%=r[3]%></td>
    		        </tr>
    		       
    		      <% }%>
    		  
    		    </table>

    		 
    		   </div>
    		 `;
    		 
 })
 
 document.querySelector("#fourth-year").addEventListener("click", function() {
	 
	 document.querySelector(".dash-board-data").innerHTML =`

  			<div class="container">
		 <form action="searchRno.jsp">
	 <div class="d-flex flex-row justify-content-end">
			<input type="text" name="rno" class="form-control mx-2 w-25" placeHolder="Search with Roll No.">
			<input type="submit" name="search" value="Search" class="btn btn-secondary">
		</div>
		</form>
  		   
  		  <%
  			List<String[]> fourthRows = dao.listStudentsByYear("Fourth Year");
    		%>
    	  <h2 class=" m-4">Fourth Year Students Data</h2>
       
	    <table class="table table-bordered">
		   
		        <tr>
		            <th>Roll No.</th>
		            <th>Name</th>
		            <th>Year</th>
		            <th>Major</th>
		        </tr>
   		<%
   		for(String[] r : fourthRows){
   			%>    
  		  
   			
  		        <tr>
  		            <td class="w-25"><%=r[0]%></td>
  		            <td class="w-25"><%=r[1]%></td>
  		            <td class="w-25"><%=r[2]%></td>
  		           	<td class="w-25"><%=r[3]%></td>
  		        </tr>
  		       
  		      <% }%>
  		  
  		    </table>

  		 
  		   </div>
  		 `;
  		 
})

document.querySelector("#fifth-year").addEventListener("click", function() {
	 
	 document.querySelector(".dash-board-data").innerHTML =`

 			<div class="container">
		 <form action="searchRno.jsp">
	 <div class="d-flex flex-row justify-content-end">
			<input type="text" name="rno" class="form-control mx-2 w-25" placeHolder="Search with Roll No.">
			<input type="submit" name="search" value="Search" class="btn btn-secondary">
		</div>
		</form>
 		   
 		  <%
 			List<String[]> fifthRows = dao.listStudentsByYear("Fifth Year");
   		%>
     	  <h2 class=" m-4">Fifth Year Students Data</h2>
      
	    <table class="table table-bordered">
		   
		        <tr>
		            <th>Roll No.</th>
		            <th>Name</th>
		            <th>Year</th>
		            <th>Major</th>
		        </tr>
   		<%
   		for(String[] r : fifthRows){
   			%>    
 		  
   			
 		        <tr>
 		            <td class="w-25"><%=r[0]%></td>
 		            <td class="w-25"><%=r[1]%></td>
 		            <td class="w-25"><%=r[2]%></td>
 		           	<td class="w-25"><%=r[3]%></td>
 		        </tr>
 		       
 		      <% }%>
 		  
 		    </table>

 		 
 		   </div>
 		 `;
 		 
})

    
    
      })

      
      
      
      document.querySelector("#tuto").addEventListener("click", () =>{
    	  document.querySelector(".dash-board-data").innerHTML = `
    		  <div class="container">
              <div class="d-flex justify-content-center align-items-center flex-column mt-3">
            <h4>Add New Assignments and Tutorials</h4>
                <div class="mb-4">
                    <form action="saveTuto.jsp" method="get">
                <label for="yy" class="form-label mt-2">Year</label>
                <input type="text" class="form-control w-100" id="yy" name="yy" required > 
	
                <label for="sub" class="form-label mt-2">Subject Code</label>
                <input type="text" class="form-control w-100" id="sub" name="sub" required >
                
                <label for="subject" class="form-label mt-2">Subject</label>
                <input type="text" class="form-control w-100" id="subject" name="subject" required >
                
               
                <label for="tt" class="form-label mt-2">Time</label>
                <input type="text" class="form-control w-100" id="tt" name="tt" required >
               
                <label for="dd" class="form-label mt-2">Date</label>
                <input type="date" class="form-control w-100" id="dd" name="dd" required >
               
                <select name="aort" id="aort" class="form-select mt-4" required >
                <option value="Assignment">Assignment</option>
                <option value="Tutorial">Tutorial</option>
              </select>
                
                <div class="d-flex justify-content-center">
                <input type="submit" value="Submit" class="btn btn-primary mt-4 w-100" name="submit">
                </div>
                </form>
                    </div>
              </div>
        </div>
    	  `;
      })
      
      document.querySelector("#allSchedule").addEventListener("click", () => {
    	  document.querySelector(".dash-board-data").innerHTML =`
    		  
    			<div class="container">
    		  <form action="search.jsp">
    		  <div class="d-flex justify-content-end">

   			<input type="text" name="sub" class="form-control mx-2 w-25" placeHolder="Search with Subject Code">
   			<input type="submit" name="search" value="Search" class="btn btn-secondary">
   			</form>
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
           
   document.querySelector("#stuAcc").addEventListener("click", () => {
	   document.querySelector(".dash-board-data").innerHTML =`
		   <div class="container">
		      <form action="saveStuAcc.jsp">
		        <div
		          class="d-flex justify-content-center align-items-center flex-column mt-3"
		        >
		          <h2 class="mb-3">Create New Student Account</h2>
		          <div class="col-md-4 mb-3">
		            <label for="validationServer01" class="form-label">Username</label>
		            <input type="text" class="form-control" id="userName" required="" name="username" />
		            <div class="valid-feedback">Looks good!</div>
		          </div>

		          <div class="col-md-4 mb-3">
		            <label for="validationServer01" class="form-label">Edu mail</label>
		            <input type="text" class="form-control" id="mail" required="" name="mail" />
		            <div class="valid-feedback">Looks good!</div>
		          </div>

		          <div class="col-md-4 mb-3">
		            <label for="validationServer01" class="form-label">Password</label>
		            <input type="password" class="form-control" id="password" required="" />
		            <div class="valid-feedback">Looks good!</div>
		          </div>

		          <div class="col-md-4 mb-3">
		            <label for="validationServer01" class="form-label"
		              >Confirm Password</label
		            >
		            <input
		              type="password"
		              class="form-control"
		              id="cpassword"
		              required=""
		              name="password"
		            />
		            <div class="valid-feedback">Looks good!</div>
		          </div>

		          <input
		            type="submit"
		            value="Create"
		            class="btn btn-primary col-md-4 my-4 w-45"
		            name="submit"
		          />
		        </div>
		      </form>
		    </div>
		    
		    
		  
	   `;
	     let nameReg = /^[a-zA-Z]{6,}$/;
	      let mailReg = /^\w+([\.-]?\w+)*@\ucspinlon([\.-]?\ edu)*(\.\w{2,})+$/;
	      let passwordReg = /^[a-zA-Z0-9]{6,}$/;

	      function validate() {
	        var username = document.querySelector("#userName").value;
	        var mail = document.querySelector("#mail").value;
	        var password = document.querySelector("#password").value;
	        var cpassword = document.querySelector("#cpassword").value;

	        if (username != "") {
	          if (nameReg.test(username)) {
	            document.querySelector("#userName").classList.remove("is-invalid");
	            document.querySelector("#userName").classList.add("is-valid");
	          } else {
	            document.querySelector("#userName").classList.remove("is-valid");
	            document.querySelector("#userName").classList.add("is-invalid");
	          }
	        }

	        if (mail != "") {
	          if (mailReg.test(mail)) {
	            document.querySelector("#mail").classList.remove("is-invalid");
	            document.querySelector("#mail").classList.add("is-valid");
	          } else {
	            document.querySelector("#mail").classList.remove("is-valid");
	            document.querySelector("#mail").classList.add("is-invalid");
	          }
	        }

	        if (password != "") {
	          if (passwordReg.test(password)) {
	           
	            document.querySelector("#password").classList.remove("is-invalid");
	             document.querySelector("#password").classList.add("is-valid");
	          } else {
	            document.querySelector("#password").classList.remove("is-valid");
	            document.querySelector("#password").classList.add("is-invalid");
	          }

	        
	        }

	        if(password != "" && cpassword != ""){
	            if(password == cpassword){
	                document.querySelector("#cpassword").classList.remove("is-invalid");
	             document.querySelector("#cpassword").classList.add("is-valid");
	            } else {
	            document.querySelector("#cpassword").classList.remove("is-valid");
	            document.querySelector("#cpassword").classList.add("is-invalid");
	          }
	        }
	      }

	      document.querySelector("#userName").addEventListener("blur", validate);
	      document.querySelector("#mail").addEventListener("blur", validate);
	      document.querySelector("#password").addEventListener("blur", validate);
	        document.querySelector("#cpassword").addEventListener("blur", validate);
   })
  
   document.querySelector("#stuAccInfo").addEventListener("click", () => {
	   document.querySelector(".dash-board-data").innerHTML =`
	   	
		   <div class="container">
 		 
 		  <div class="d-flex justify-content-end">

			
		</div>
 		    <div class="d-flex justify-content-center align-items-center flex-column">
 		  <%
    		List<String[]> accRows = dao.listAccounts();
      		%>
      		
      	  <h2 class=" m-4">All Student Account Information</h2>
		    <table class="table table-bordered">
		        <tr>
		            <th>Username</th>
		            <th>Mail</th>
		            <th>Password </th>

		        </tr>
      		<%
      		for(String[] r : accRows){
      			%>    
 		  
 		        <tr>
 		            <td class="w-25">
 		            <%=r[0]%>
 					</td>
 					 <td><%=r[1]%>
 					 </td>
 		            <td><span class="text-muted">••••••••</span></td>
  		        </tr>
 		 <% }%>
 		    </table>
		
 		    </div>
 		    

 		   </div>
		`;
		   })
   
	   
      document.querySelector("#logOut").addEventListener("click", () => {
    	  
      		alert("Account will log out ⚠️")
    		window.location.href = "home.html";
      })
     
       document.querySelector("#timeTable").addEventListener("click", () => {

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
     
  	 document.querySelector("#annou").addEventListener("click", () =>{
    	  document.querySelector(".dash-board-data").innerHTML = `
    		  <div class="container">
              <div class="d-flex justify-content-center align-items-center flex-column mt-5">
            <h4>Enter Announcement</h4>
                <div class="my-4">
                    <form action="saveAnnouncement.jsp" method="get">
                
                <textarea type="text" class="form-control" id="ann" name="ann" required cols="30" rows="10"> 
				</textarea>
                
                <div class="d-flex justify-content-center">
                <input type="submit" value="Submit" class="btn btn-primary mt-4 w-100" name="submit">
                </div>
                </form>
                    </div>
              </div>
        </div>
   `;
  	 })
	
  
      	
      	</script>

  </body>
</html>
    
