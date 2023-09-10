<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import = "in.pandit.persistance.DatabaseConnection" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "java.util.Date" %>
    
<html>
	<head>
		<title>Super Dashboard</title>
		<link rel="stylesheet" href="css/style.css" type="text/css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
}
.profile p{
	color: white;
	font-weight: 500;
	margin-left: -60px;
	margin-top: 5px;
	font-size: 13.5px;
	width: 200px;
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
	width: 96%;
	height: 50px;
	background-color: #272c4a;
	margin-left: 10px;
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
.boxform{
	width: 96%;
	height: 470px;
	background-color: #272c4a;
	margin-left: 10px;
	padding:10px;
}
input{
	border: none;
	border-radius: 2px;
	padding: 7px;
	height: 30px;
	width: 250px;
	font-size: 17px;
	background-color: off-white;
}
select{
	border: none;
	border-radius: 2px;
	padding: 7px;
	height: 30px;
	width: 250px;
	font-size: 17px;
	background-color: off-white;
}

input[type=text] {
  margin: 8px 0;
  box-sizing: border-box;
  border: 1px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}

input[type=text]:focus {
  border: 2px solid green;
}
.btn{
	width: 250px;
	height: 35px;
	background-color: rgba(12, 188, 6, 0.8);
	font-size: 15px;
	color: white;
	border: none;
	border-radius: 5px;
}
.btn:hover{
	box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
	transition: 0.5s ease;
	background-color: rgba(7, 217, 0, 0.8);
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
<!-- This cdn is for sweet alert -->
<script src=
"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js">
  </script>
  
  <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
</head>

<body>
	<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // Preventing from back after logout.
		if(session.getAttribute("email") == null)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('You are no longer logged in');");
			out.println("</script>");
			response.sendRedirect("index.jsp");
		}
	%>
	
	<%
	if (request.getAttribute("messages") != null) {
		out.print("<script>swal('Thank You!', 'We will get in touch soon!', 'success')</script>");
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
	  	<p style = "margin-top: 340px; margin-left: 5px; font-size: 18px; color: gray;">Date and Time</p>
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
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav"  > Dashboard</span>
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav2"  > Dashboard</span>
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
				<p> <%
						Connection connect = DatabaseConnection.getConnection();
						int c = 0;
						PreparedStatement st = connect.prepareStatement("SELECT COUNT(id) from leads");

						ResultSet rs = st.executeQuery();
						if (rs.next()) {
						c = rs.getInt(1);
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
				PreparedStatement stmtt = connect.prepareStatement("SELECT COUNT(id) from users where isadmin = ? and issuperadmin = ?");
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
				PreparedStatement stm = connect.prepareStatement("SELECT COUNT(id) from users where isadmin = ? and issuperadmin = ?");
				stm.setString(1, "a");
				stm.setString(2, "false");
				ResultSet rse = stmtt.executeQuery();
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
		
		
		<!-- Adding new leads form -->
		<div class="clearfix"></div>
		<br/>
		
		<div class="col-12">
			<div class="boxheading">
				<p>Add New Lead</p>
				<%
					
				%>
			</div>
		</div>
		<hr style="width:97%;text-align:left;margin-left:10px">
		<div class="col-12">
			<div class="boxform">
				<form action = "addLeadsSuperAdmin" method = "post">
					<table>
						<tr>
							<td>Name </td>
							<td><input type = "text" name = "name" required/></td>
							<td>Email </td>
							<td><input type = "email" name = "email" required/></td>
						</tr>
						<tr>
							<td>Address </td>
							<td><input type = "text" name = "address" required/></td>
							<td>Mobile </td>
							<td><input type = "tel" name = "mobile" maxlength= "10" required/></td>
						</tr>
						<tr>
							<td>Source </td>
							<td><input type = "text" name = "source" required/></td>
							<td>Date </td>
							<td><input type = "date" name = "date" required/></td>
						</tr>
						<tr>
							<td>Time </td>
							<td><input type = "time" name = "time" required/></td>
							<td>Owner Email</td>
							
							
							<td>
								<input type = "email" name = "owner"  value = "<% 
								
								List<String> lst = new ArrayList<String>();
								try{
									String email = session.getAttribute("email").toString();
									PreparedStatement pstmt = connect.prepareStatement("select email from users where email = ?");			
									pstmt.setString(1, email);
									ResultSet rst = pstmt.executeQuery();
					
									while(rst.next()) {
										lst.add(rst.getString(1));
									}
									for(String x : lst){
										out.print(x);											}
									}catch(Exception e){
										System.out.println(e);
									}
								
								%>" readonly>
						
							</td>
							
						</tr>
						<tr>
							<td>Current Owner </td>
							<td>
							<select name = "currentOwner" required>
								<option selected disabled > --Select--</option>
								<%
										List<String> lst1 = new ArrayList<String>();
										try{
											String email = session.getAttribute("email").toString();
											PreparedStatement pstmt = connect.prepareStatement("select email from users");			
														
											ResultSet rst = pstmt.executeQuery();
							
											while(rst.next()) {
												lst1.add(rst.getString(1));
											}
											for(String x : lst1){
												out.print("<option>" + x + "</option>");											}
											}catch(Exception e){
												System.out.println(e);
											}
									%>
							</select>
							</td>
							
							<td>Status </td>
							<td>
							<select name = "status" required>
								<option selected disabled > --Select--</option>
								<option>New</option>
								<option>Progress</option>
								<option>Finished</option>
							</select>
							</td>
						</tr>
						<tr>
							<td>Priority </td>
							<td>
							<select name = "priority" required>
								<option selected disabled > --Select--</option>
								<option>Low</option>
								<option>Medium</option>
								<option>High</option>
							</select>
							</td>
							<td></td>
							<td><button type= "submit" class = "btn">Add Lead</button></td>
						</tr>		
					</table>
				</form>
			</div>
		</div>	
		
		
			<br><br><br><br><br><br>
		
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

	</script>
	
	</body>

</body>
</html>