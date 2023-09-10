<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import = "in.pandit.persistance.DatabaseConnection" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "java.util.Date" %>
<!Doctype HTML>
	<html>
	<head>
		<title>All Admin</title>
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
}
.profile p{
	color: white;
	font-weight: 500;
	margin-left: -70px;
	margin-top: 4px;
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
	height: 625px;
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

/* css for pregress bar */
.animated-progress {
  width: 200px;
  height: 28px;
  border-radius: 5px;
  margin: 10px 10px;
  border: 1px solid rgb(189, 113, 113);
  overflow: hidden;
  position: relative;
}

.animated-progress span {
  height: 100%;
  display: block;
  width: 0;
  color: rgb(255, 251, 251);
  line-height: 30px;
  position: absolute;
  text-align: end;
  padding-right: 5px;
}

.progress-green span {
  background-color: green;
}
.progress-purple span {
  background-color: #d35400;
}
.progress-red span {
  background-color: red;
}
/* Alert css code */
.alert {
    padding: 10px;
    background-color: red;
    color: white;
}
.alert1 {
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

<!-- This is for popup message -->
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
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav"  > All Admin</span>
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav2"  > All Admin</span>
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
		
		
		<!-- Adding new leads form -->
		<div class="clearfix"></div>
		<br/>
		
		<div class="col-12">
			<div class="boxheading">
				<p>Admin</p>
				

		<div class="container-fluid">
				<div class="form-group"> 	<!--		Show Numbers Of Rows 		-->
			 		<select class  ="form-control bg-dark text-white" name="state" id="maxRows">
						 <option value="5000">Show ALL Rows</option>
						 <option value="5">5</option>
						 <option value="10">10</option>
						 <option value="15">15</option>
						 <option value="20">20</option>
						 <option value="50">50</option>
						 <option value="70">70</option>
						 <option value="100">100</option>
						</select>
			 		
			  	</div>
				<% try{String success = session.getAttribute("msg").toString(); 
					if(success!= null){
						out.print("<div class='alert alert-danger alert-dismissible fade show'>"+
									"<button type='button' class='close' data-dismiss='alert'>×</button>"+
									" <strong>Danger!</strong> Data deleted successfully </div>");
					}
					session.removeAttribute("msg");
					}catch(Exception e)
					{System.out.println(e);} 
				%>
				<% try{String success = session.getAttribute("updateMsg").toString(); 
					if(success!= null){
						out.print("<div class='alert alert-danger alert-dismissible fade show alert1'>"+
									"<button type='button' class='close' data-dismiss='alert'>×</button>"+
									" <strong>Success!</strong> Data updated successfully </div>");
					}
					session.removeAttribute("updateMsg");
					}catch(Exception e)
					{System.out.println(e);} 
				%>
				<table class="table table-striped table-class" id= "table-id">
  
  					<thead>
						<tr>
							<th>Name</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Action</th>
						</tr>
    
  					</thead>
  
  				<tbody>
  			<%
  			try{
  				Connection connect = DatabaseConnection.getConnection();
  				String owner =  null;
  				// Getting email from dashboard setAttribute
  				String email2 = session.getAttribute("email").toString(); 
  				// Getting name form user table
  				PreparedStatement stmt = connect.prepareStatement("select name from users where email = ?");
				stmt.setString(1, email2);
				ResultSet rs3 = stmt.executeQuery();
				while (rs3.next()) {
				owner = rs3.getString(1);
				} 
  				// This is for id counter
  				int count = 0;
				PreparedStatement st = connect.prepareStatement("select max(id) as id from leads");

				ResultSet rs1 = st.executeQuery();
				while (rs1.next()) {
				count = rs1.getInt("id");
				}
				
  				PreparedStatement ps = connect.prepareStatement("select name, email, mobile from users where isadmin = ? and issuperadmin = ?");
				
				 /* for (int a = 1; a <= count; a++) {  */
									
					 		ps.setString(1, "a");
					 		ps.setString(2, "false");
							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
								
								String name = rs.getString(1);
								String email = rs.getString(2);
								String mobile = rs.getString(3);
												
								out.print("<tr>");
				
								out.print("<td>" + name + "</td>");
								out.print("<td>" + email + "</td>");
								out.print("<td>" + mobile + "</td>");
								
								out.print("<td><form action ='deleteAdmin' method = 'post'><button type = 'submit' class = 'btn btn-danger' name = 'delete' value = '+ "+email+"+' onclick='myFunction()'>Delete</button></form></td>");
				
								out.print("</tr>");
							
							 } 	
							
						/* } */
					
					} catch (Exception e) {
						System.out.println(e);
					}
					
				%>
   				</tbody>

			</table>

<!--		Start Pagination -->
			<div class='pagination-container' >
				<nav>
				  <ul class="pagination">
            
            <li data-page="prev" >
								     <span style = "color: white;"> <button class ="btn btn-primary">Prev</button> <span class="sr-only text-white">(current)</span></span>
								    </li>
				   <!--	Here the JS Function Will Add the Rows -->
        <li data-page="next" id="prev">
								       <span style = "color: white;"> <button class = "btn btn-primary">Next</button> <span class="sr-only text-white">(current)</span></span>
								    </li>
				  </ul>
				</nav>
			</div>

			</div>
			</div>
		</div>
		
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
	/* Table script */
	          getPagination('#table-id');
			
		 

function getPagination(table) {
  var lastPage = 1;

  $('#maxRows')
    .on('change', function(evt) {
      //$('.paginationprev').html('');						// reset pagination

     lastPage = 1;
      $('.pagination')
        .find('li')
        .slice(1, -1)
        .remove();
      var trnum = 0; // reset tr counter
      var maxRows = parseInt($(this).val()); // get Max Rows from select option

      if (maxRows == 5000) {
        $('.pagination').hide();
      } else {
        $('.pagination').show();
      }

      var totalRows = $(table + ' tbody tr').length; // numbers of rows
      $(table + ' tr:gt(0)').each(function() {
        // each TR in  table and not the header
        trnum++; // Start Counter
        if (trnum > maxRows) {
          // if tr number gt maxRows

          $(this).hide(); // fade it out
        }
        if (trnum <= maxRows) {
          $(this).show();
        } // else fade in Important in case if it ..
      }); //  was fade out to fade it in
      if (totalRows > maxRows) {
        // if tr total rows gt max rows option
        var pagenum = Math.ceil(totalRows / maxRows); // ceil total(rows/maxrows) to get ..
        //	numbers of pages
        for (var i = 1; i <= pagenum; ) {
          // for each page append pagination li
          $('.pagination #prev')
            .before(
              '<li data-page="' +
                i +
                '">\
								  <span>' +
                i++ +
                '<span class="sr-only">(current)</span></span>\
								</li>'
            )
            .show();
        } // end for i
      } // end if row count > max rows
      $('.pagination [data-page="1"]').addClass('active'); // add active class to the first li
      $('.pagination li').on('click', function(evt) {
        // on click each page
        evt.stopImmediatePropagation();
        evt.preventDefault();
        var pageNum = $(this).attr('data-page'); // get it's number

        var maxRows = parseInt($('#maxRows').val()); // get Max Rows from select option

        if (pageNum == 'prev') {
          if (lastPage == 1) {
            return;
          }
          pageNum = --lastPage;
        }
        if (pageNum == 'next') {
          if (lastPage == $('.pagination li').length - 2) {
            return;
          }
          pageNum = ++lastPage;
        }

        lastPage = pageNum;
        var trIndex = 0; // reset tr counter
        $('.pagination li').removeClass('active'); // remove active class from all li
        $('.pagination [data-page="' + lastPage + '"]').addClass('active'); // add active class to the clicked
        // $(this).addClass('active');					// add active class to the clicked
	  	limitPagging();
        $(table + ' tr:gt(0)').each(function() {
          // each tr in table not the header
          trIndex++; // tr index counter
          // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
          if (
            trIndex > maxRows * pageNum ||
            trIndex <= maxRows * pageNum - maxRows
          ) {
            $(this).hide();
          } else {
            $(this).show();
          } //else fade in
        }); // end of for each tr in table
      }); // end of on click pagination list
	  limitPagging();
    })
    .val(5)
    .change();

  // end of on select change

  // END OF PAGINATION
}

function limitPagging(){
	// alert($('.pagination li').length)

	if($('.pagination li').length > 7 ){
			if( $('.pagination li.active').attr('data-page') <= 3 ){
			$('.pagination li:gt(5)').hide();
			$('.pagination li:lt(5)').show();
			$('.pagination [data-page="next"]').show();
		}if ($('.pagination li.active').attr('data-page') > 3){
			$('.pagination li:gt(0)').hide();
			$('.pagination [data-page="next"]').show();
			for( let i = ( parseInt($('.pagination li.active').attr('data-page'))  -2 )  ; i <= ( parseInt($('.pagination li.active').attr('data-page'))  + 2 ) ; i++ ){
				$('.pagination [data-page="'+i+'"]').show();

			}

		}
	}
}

/* script for back prevent */
$(function() {
  // Just to append id number for each row
  $('table tr:eq(0)').prepend('<th> S.No. </th>');

  var id = 0;

  $('table tr:gt(0)').each(function() {
    id++;
    $(this).prepend('<td>' + id + '</td>');
  });
});

/* Script for progress bar */
$(".animated-progress span").each(function () {
  $(this).animate(
    {
      width: $(this).attr("data-progress") + "%",
    },
    1000
  );
  $(this).text($(this).attr("data-progress") + "%");
});

/* Alert message code */
$(document).ready(function () {  
           $(".close").click(function () {  
               $("#myAlert").alert("close");  
           });  
       });
       
/* Delete confirmation alert */
function myFunction() {
		confirm("Are you sure want to delete?");
	}
	</script>

	</body>


	</html>