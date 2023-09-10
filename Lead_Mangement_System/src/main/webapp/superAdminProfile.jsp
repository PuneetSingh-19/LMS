<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import = "in.pandit.persistance.DatabaseConnection" %>
<%@page import ="java.text.SimpleDateFormat"%>
<%@page import = "java.util.Date"  %>
<%@page import = "java.sql.Blob" %>
<%@page import = "java.io.OutputStream" %>
<%@page import = "java.io.*" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "java.util.Date" %>
<!Doctype HTML>
	<html>
	<head>
		<title>Profile</title>
		<link rel="stylesheet" href="css/style.css" type="text/css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<!-- cdn for table with pagination -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		
<style>
body{
	margin:0px;
	padding: 0px;
	background-color:#1b203d;
	/* overflow: hidden; */
	font-family: system-ui;
}
.clearfix{
	clear: both;
}
.logo{
	margin: 0px;
	margin-left: 80px;
    font-weight: bold;
    color: white;
    margin-bottom: 30px;
}
.logo span{
	color: #f7403b;
}
.sidenav {
  height: 100%;
  width: 300px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #272c4a;
  overflow: hidden;
  transition: 0.5s;
  padding-top: 30px;
}
.sidenav a {
  padding: 15px 8px 15px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  transition: 0.3s;
}
.sidenav a:hover {
  color: #f1f1f1;
  background-color:#1b203d;
}
.sidenav{
  position: fixed;
  top: 0;
  right: 25px;
  font-size: 36px;
}
#main {
  transition: margin-left .5s;
  padding: 16px;
  margin-left: 300px;
}
.head{
	padding:20px;
}
.col-div-6{
	width: 50%;
	float: left;
}
.profile{
	display: inline-block;
	float: right;
	width: 160px;
}
.pro-img{
	float: left;
	width: 40px;
	margin-top: 5px;
	margin-left: -80px;
	border-radius: 50px;
}
.profile p{
	color: white;
	font-weight: 500;
	margin-left: -70px;
	margin-top: 3px;
	font-size: 13.5px;
}
.profile p span{
	font-weight: 400;
    font-size: 12px;
    display: block;
    color: #8e8b8b;
}
.col-div-3{
	width: 25%;
	float: left;
}
.box{
	width: 85%;
	height: 100px;
	background-color: #272c4a;
	margin-left: 10px;
	padding:10px;
}
.box p{
	 font-size: 35px;
    color: white;
    font-weight: bold;
    line-height: 30px;
    padding-left: 10px;
    margin-top: 20px;
    display: inline-block;
}
.box p span{
	font-size: 20px;
	font-weight: 400;
	color: #818181;
}
.box-icon{
	font-size: 40px!important;
    float: right;
    margin-top: 35px!important;
    color: #818181;
    padding-right: 10px;
}
.col-div-8{
	width: 70%;
	float: left;
}
.col-div-4{
	width: 30%;
	float: left;
}
.content-box{
	padding: 20px;
}
.content-box p{
	margin: 0px;
    font-size: 20px;
    color: #f7403b;
}
.content-box p span{
	float: right;
    background-color: #ddd;
    padding: 3px 10px;
    font-size: 15px;
}
.box-8, .box-4{
	width: 95%;
	background-color: #272c4a;
	height: 330px;
	
}
.nav2{
	display: none;
}

.box-8{
	margin-left: 10px;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  
}
td, th {
  text-align: left;
  padding:15px;
  color: #ddd;
  border-bottom: 1px solid #81818140;
}
.circle-wrap {
  margin: 50px auto;
  width: 150px;
  height: 150px;
  background: #e6e2e7;
  border-radius: 50%;
}
.circle-wrap .circle .mask,
.circle-wrap .circle .fill {
  width: 150px;
  height: 150px;
  position: absolute;
  border-radius: 50%;
}
.circle-wrap .circle .mask {
  clip: rect(0px, 150px, 150px, 75px);
}

.circle-wrap .circle .mask .fill {
  clip: rect(0px, 75px, 150px, 0px);
  background-color: #f7403b;
}
.circle-wrap .circle .mask.full,
.circle-wrap .circle .fill {
  animation: fill ease-in-out 3s;
  transform: rotate(126deg);
}

@keyframes fill {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(126deg);
  }
}
.circle-wrap .inside-circle {
  width: 130px;
  height: 130px;
  border-radius: 50%;
  background: #fff;
  line-height: 130px;
  text-align: center;
  margin-top: 10px;
  margin-left: 10px;
  position: absolute;
  z-index: 100;
  font-weight: 700;
  font-size: 2em;
}

/* Css for add lead form */
.boxheading{
	width: 98%;
	height: 600px;
	background-color: #272c4a;
	padding:10px;
}
.boxheading p{
	 font-size: 25px;
    color: white;
    line-height: 30px;
    padding-left: 10px;
    margin-top: 7px;
    display: inline-block;
}
/* Table Desing */


table th , table td{
    text-align: center;
}

table tr:nth-child(even){
    background-color: #1b203d;
}

.pagination li:hover{
    cursor: pointer;
}
		table tbody tr {
			display: none;
		}

/* Profile Image Styling */
.profile-img{
	width: 110px;
	height: 110px;
	border-radius: 100px;
	background: linear-gradient(red, yellow, lime, aqua, blue, magenta, red);
	padding: 4.3px;
	display: flex;
}
.profile-img img{
	width: 100px;
	height: 100px;
	object-fit: cover;
	/* border: 7px solid  rgba(14, 0, 56, 0.98); */
	border-radius: 50px;
		
}

.btnUpdate{
	margin-left: 15px;
	padding: 6px 30px 6px 30px;
	border: 1px solid white;
	border-radius: 10px;
	background-color: transparent;
	color: white;
}
.btnUpdate:hover{
	background-color: green;
	border: none;
	color: white;
	transition: 0.5s ease all;
	box-shadow: 0px 25px 80px rgba(217, 254, 244, 0.8);
}

/* Alert css code */
.alert {
    padding: 10px;
    background-color: green;
    color: white;
}

.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
}

.closebtn:hover {
    color: black;
}
.editpf{
	display: flex;
	color: white;
	display: flex;
	font-size: 20px;
	padding: 10px;
	 background: linear-gradient(orange, red, purple, blue);
	border-radius: 40px;
}
.btnProfile{
	background-color: transparent;
	width: 0px;
	height: 0px;
	border: none;
	border-radius: 100px;
	display: flex;
	position: absolute;
	top: 75px;
	left: 105px;
	
}



/* Popup for user profile */
      .popup {
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            display: none;
        }
        .popup-content {
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888888;
            width: 25%;
            height: 25%;
            font-weight: bolder;
        }
        .popup-content button {
            display: block;
            margin: 0 auto;
        }
        .show {
            display: block;
        }
        h1 {
            color: green;
        }
        .updateProfielbtn{
        	position:absolute;
			margin-top: 50px;
			padding: 4px 30px 4px 30px;
			border: 1px solid gray;
			border-radius: 10px;
			background-color: transparent;
			color: gray;
        }
        .updateProfielbtn:hover{
			background-color: green;
			border: none;
			color: white;
			transition: 0.5s ease all;
			box-shadow: 0px 25px 80px rgba(217, 254, 244, 0.8);
		}

		.closeBtn{
			position:absolute;
			left: 56%;
			padding: 4px 30px 4px 30px;
			border: 1px solid gray;
			border-radius: 10px;
			background-color: transparent;
			color: gray;
			
		}
     .closeBtn:hover{
			background-color: green;
			border: none;
			color: white;
			transition: 0.5s ease all;
			box-shadow: 0px 25px 80px rgba(217, 254, 244, 0.8);
		}

.logBtn{
	width: 100%;
	height: 40px;
	background-color: transparent;
	color: gray;
	border: none;
	font-size: 20px;
	color: #818181;
  	display: block;
  	transition: 0.3s;
  	text-align: left;
  	margin-left: -5px;
}
.logBtn:hover {
  color: #f1f1f1;
  background-color:#1b203d;
}
</style>
<!-- This is for success popup -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>


	<body>
		
		<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("email") == null)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('You are no longer logged in');");
			out.println("</script>");
			response.sendRedirect("index.jsp");
		}
	%>
		
	  <div id="mySidenav" class="sidenav">
	  <p class="logo"><span>L </span>M S</p>
	  <a href="superadmin.jsp" class="icon-a"><i class="fa fa-dashboard icons"></i>   Dashboard</a>
	  <a href="allLeadsSuperAdmin.jsp"class="icon-a"><i class="fa fa-line-chart icons"></i>   All Leads</a>
	  <a href="allAdmin.jsp"class="icon-a"><i class="fa fa-user-circle icons"></i>   All Admin</a>
	  <a href="allUsersSuperAdmin.jsp"class="icon-a"><i class="fa fa-users icons"></i>   All Users</a>
	  <a href="superAdminProfile.jsp"class="icon-a"><i class="fa fa-user icons"></i>   Profile</a>
	  <a href="superAdminHelp.jsp"class="icon-a"><i class="fa fa-question-circle icons"></i>   Help</a>
	  <form action = "logout" method = "post"><a href="#"class="icon-a"><button type = "submit" class = "logBtn"><i class="fa fa-sign-out icons"></i> Logout</button></a></form> 
		 <div class = "timeDate">
	  	<p style = "margin-top: 330px; margin-left: 5px; font-size: 18px; color: gray;">Date and Time</p>
	  	<%
	  		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
			Date date = new Date();
	    	out.println("<p style = 'margin-top: -20px; margin-left: 5px; font-size: 16px; color: lightgray;''>"+formatter.format(date)+"</p>");
	  	%>
	  </div>
	</div>
	<div id="main">

		<div class="head">
			<div class="col-div-6">
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav"  > My Profile</span>
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav2"  > My Profile</span>
	</div>
		
		<div class="col-div-6">
		<div class="profile">

			<img src="image/xyz.jfif" class="pro-img" />
			<%
			String namedb = null;
			String emaildb = null;
			try{
				Connection connect = DatabaseConnection.getConnection();
				String email = session.getAttribute("email").toString();
				PreparedStatement pstmt = connect.prepareStatement("select name, email from users where email = ?");			
				pstmt.setString(1, email);
				ResultSet rst = pstmt.executeQuery();

				while(rst.next()) {
					namedb = rst.getString(1);
					emaildb = rst.getString(2);
				}
				%>
					<p style="font-size:20px; text-align: center;"><% out.print(namedb); %> <span  style="font-size:12px; text-align: center;"><% out.print(emaildb); %></span></p>
				<%									
				}catch(Exception e){
					System.out.println(e);
				}
			%>
		</div>
	</div>
		<div class="clearfix"></div>
	</div>

		<div class="clearfix"></div>
		<br/>
		
		<div class="col-div-3">
			<div class="box">
				<p>
					<%
					Connection conn = DatabaseConnection.getConnection();
					int c = 0;
					PreparedStatement stt = conn.prepareStatement("SELECT COUNT(id) from leads");

					ResultSet rset = stt.executeQuery();
					if (rset.next()) {
					c = rset.getInt(1);
					}
					out.print(c);
					%> 
				<br/><span>Total Leads</span></p>
				<i class="fa fa-line-chart box-icon"></i>
			</div>
		</div>
		<div class="col-div-3">
			<div class="box">
				<p>
					<%
				
				int d = 0;
				PreparedStatement stmtt = conn.prepareStatement("SELECT COUNT(id) from users where isadmin = ? and issuperadmin = ?");
				stmtt.setString(1, "false");
				stmtt.setString(2, "false");
				ResultSet rsett = stmtt.executeQuery();
				if (rsett.next()) {
				d = rsett.getInt(1);
				}
				out.print(d);
					%>
				<br/><span>All Users</span></p>
				<i class="fa fa-users box-icon"></i>
			</div>
		</div>
		<div class="col-div-3">
			<div class="box">
				<p>
					<%
				
				int f = 0;
				PreparedStatement stm = conn.prepareStatement("SELECT COUNT(id) from users where isadmin = ? and issuperadmin = ?");
				stm.setString(1, "a");
				stm.setString(2, "false");
				ResultSet rse = stm.executeQuery();
				if (rse.next()) {
				f = rse.getInt(1);
				}
				out.print(f);
					%>
				<br/><span>All Admin</span></p>
				<i class="fa fa-user-circle box-icon"></i>
			</div>
		</div>
		<div class="col-div-3">
			<div class="box">
				<p>0<br/><span>Enrolled</span></p>
				<i class="fa fa-tasks box-icon"></i>
			</div>
		</div>
		
		<div class="clearfix"></div>
		<br/>
		
		
		<!-- User Profile -->
		<div class="clearfix"></div>
		<br/>
		
		<div class="col-12">
			<div class="boxheading">
				
				<div class="profile-img">
					<img src="image/profile image.png"  />
					
					<%-- <%
						String imgLen = null;
						byte[] rb = null;
						int len = 0;
						String userEmail = session.getAttribute("email").toString();
						Connection conn = DatabaseConnection.getConnection();
						try{
							PreparedStatement pstmt = conn.prepareStatement("select image from users where email = ?");			
							pstmt.setString(1, userEmail);	
							
							ResultSet rst = pstmt.executeQuery();
							while(rst.next()) {
								imgLen = rst.getString(1);
				                System.out.println(imgLen.length());
				                len = imgLen.length();
				                rb = new byte[len];
				                InputStream readImg = rst.getBinaryStream(1);
				                int index = readImg.read(rb, 0, len);
				                
				                response.reset();
				                response.setContentType("image/png");
								}
				                %>
				                	<img src="<% response.getOutputStream().write(rb, 0, len); %>" width= "20" height = "20" />
				                <%
				                response.getOutputStream().flush();
							
						
						}catch(Exception e){
							System.out.println(e);
						}
					%> --%>
					<div class = "heading">
						<p style = "margin-left: 10px;"><b>My Profile</b></p>
					</div>		
				</div>
				
				
				<button type = "submit" id="myButton" class = "btnProfile"><i class="fa fa-camera icons editpf"></i></button>

				<div id="myPopup" class="popup">
					<div class="popup-content">
						<h2 style="color: green;">Choose your profile picture</h2>
						<hr style="height:2px;border-width:0;color:gray;background-color:gray"><br>
						
						<form action = "updateProfileImage" method = "post" enctype="multipart/form-data">
							<label>Choose image</label>
							<input type= "file" name = "pfImage"/><br><br>
							<button type = "submit" class = "updateProfielbtn">Update</button>							
						</form>
						<button id="closePopup" class = "closeBtn">Close</button>
					</div>
				</div>

				<hr style="height:2px;border-width:0;color:gray;background-color:gray">
				<% try{String success = session.getAttribute("msg").toString(); 
					if(success!= null){
						out.print("<div class='alert alert-danger alert-dismissible fade show alert1'>"+
									"<button type='button' class='close' data-dismiss='alert'>×</button>"+
									" <strong>Success!</strong> Data updated successfully </div>");
					}
					session.removeAttribute("msg");
					}catch(Exception e)
					{System.out.println(e);} 
				%>
				<% try{String success = session.getAttribute("imgStatus").toString(); 
					if(success!= null){
						out.print("<div class='alert alert-danger alert-dismissible fade show alert1'>"+
									"<button type='button' class='close' data-dismiss='alert'>×</button>"+
									" <strong>Success!</strong> Image updated successfully </div>");
					}
					session.removeAttribute("imgStatus");
					}catch(Exception e)
					{System.out.println(e);} 
				%>
		<div class="container-fluid">
				<div class="form-group"> 	
				<br>
				
				<% 
						
				String name = null;
				String emailid = null;
				String mobile = null;
				try{
							String email =  session.getAttribute("email").toString(); 
							
							Connection connect1 = DatabaseConnection.getConnection();
														
							PreparedStatement pstmt = connect1.prepareStatement("select name, email, mobile from users where email = ?");			
							pstmt.setString(1, email);			
							ResultSet rst = pstmt.executeQuery();
						
						while (rst.next()) {
							name = rst.getString(1);
							emailid = rst.getString(2);
							mobile = rst.getString(3);
						}
						
						session.setAttribute("name", name);
						
						}catch(Exception e){
							System.out.println(e);
						}
					%>
				
				<h3 style = "color: white;">Name : <%out.print(name); %></h3><br>
				<hr>
				<h3 style = "color: white;">Email :	<% out.print(emailid); %></h3><br>
				<hr>
				<h3 style = "color: white;">Mobile : <% out.print(mobile); %></h3><br>
				<hr>
				
			 
		</div>

		</div>
		<form action = "updateSuperAdminProfile.jsp" method = "post"><button type= "submit" value = "" class ="btnUpdate">Update Profile</button></form>
		</div>
		</div>
		
		<br><br><br>	
		</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>

	  $(".nav").click(function(){
	    $("#mySidenav").css('width','70px');
	    $("#main").css('margin-left','70px');
	    $(".logo").css('visibility', 'hidden');
	    $(".logo span").css('visibility', 'visible');
	     $(".logo span").css('margin-left', '-10px');
	     $(".icon-a").css('visibility', 'hidden');
	     $(".icons").css('visibility', 'visible');
	     $(".icons").css('margin-left', '-8px');
	      $(".nav").css('display','none');
	      $(".nav2").css('display','block');
	  });

	$(".nav2").click(function(){
	    $("#mySidenav").css('width','300px');
	    $("#main").css('margin-left','300px');
	    $(".logo").css('visibility', 'visible');
	     $(".icon-a").css('visibility', 'visible');
	     $(".icons").css('visibility', 'visible');
	     $(".nav").css('display','block');
	      $(".nav2").css('display','none');
	 });
	
 /* Alert message code */
 $(document).ready(function () {  
            $(".close").click(function () {  
                $("#myAlert").alert("close");  
            });  
        });
 
 /* Popup for user profile */
  myButton.addEventListener("click", function () {
            myPopup.classList.add("show");
        });
        closePopup.addEventListener("click", function () {
            myPopup.classList.remove("show");
        });
        window.addEventListener("click", function (event) {
            if (event.target == myPopup) {
                myPopup.classList.remove("show");
            }
        });
 
	</script>

	</body>


	</html>