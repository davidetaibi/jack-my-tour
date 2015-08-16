<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="org.apache.shiro.session.Session" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<jsp:include page="include.jsp"/>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>Jack My Tour</title>

    
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/fontawesome/4.3.0/css/font-awesome.min.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,600,400&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/awesome-bootstrap-checkbox/v0.2.3/awesome-bootstrap-checkbox.min.css" />
    <link rel="stylesheet" href="css/styles.css">
    
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
   

   
   
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js"></script>
    <script type="text/javascript" src="js/datepicker.js"></script>
  
  
 
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">  
    
<script>
		(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/en_US/all.js";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		// async init once loading is done
		window.fbAsyncInit = function() {
		  FB.init({appId: 389121671278273, status: false});
		};
</script>
    
    
        <script>
    (function($,W,D)
    		{
        var JQUERY4U = {};
     
        JQUERY4U.UTIL =
        {
            setupFormValidation: function()
            {
                //form validation rules
                $("#register-form").validate({
                    rules: {
                        location: "required",
                       
                        
                                         
                    },
                    messages: {
                        location: "Please enter your location",
                        
                        
							
                    },
                    submitHandler: function(form) {
                        form.submit();
                    }
                });
            }
        }
     
        //when the dom has loaded setup form validation rules
        $(D).ready(function($) {
            JQUERY4U.UTIL.setupFormValidation();
        });
     
    })(jQuery, window, document);
    
  
   
    </script>
 
<!--  For the slider    -->
  <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
    
    <!--[if IE]>
        <script src="https://cdn.jsdelivr.net/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body ng-app>
    
 
    <div class="container">
    
        <div ng-include="'header.jsp'"></div>
        
    </div>

     
    <main class="container-fluid startpage">
        <div class="row-fluid" id="row1">
            <div class="col-xs-12 startpage">
 
<!-- <ul class="slider">
  <li>
    <img src="images/jackCharleston.png"> random image
  </li>
  <li>
    <img src="images/bannerJack2015.png"> random image
  </li>
  <li>
    <img src="images/hawaiiJack.png"> random image
  </li>

</ul>  -->

 <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
  <!-- Indicators -->
  
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active"> <img src="images/bannerJackFinal.png" style="width:100%" alt="First slide">
      <div class="container">
       
      </div>
    </div>
    <div class="item">  <img src="images/jackCharleston.png" style="width:100%" data-src="" alt="Second    slide">
      <div class="container">
        
      </div>
    </div>
    <div class="item">  <img src="images/hawaiiJack.png" style="width:100%" data-src="" alt="Third slide">
      <div class="container">
        
      </div>
    </div>
        <div class="item">  <img src="images/bolzanoJack.png" style="width:100%" data-src="" alt="Third slide">
      <div class="container">
        
      </div>
    </div>
  </div>
  <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> </div>
                       

			            
   
 
   
         <div class="row">
            <form action="search" method="post" id="register-form" novalidate="novalidate"  class="form-inline col-sm-10 col-sm-offset-1 col-lg-8 col-lg-offset-2">
            	
			   <label id="question">Where and when?</label>
                
                <fieldset class="row">
                    <div class="form-group col-sm-6" id="group-location">
                        <label for="location">Location:</label>
                        <input type="text" name="location" class="form-control" id="location" placeholder="Bolzano">
                    </div>
                  

                    <div class="form-group col-sm-3"  id="group-date1">
                        <label for="from">From:</label>
                        <input type="text"  class="form-control" id="from" name="from">
                    </div>
                    
                    <div class="form-group col-sm-3"  id="group-date2">
                        <label for="to">To:</label>
                        <input type="text" class="form-control" id="to" name="to">
                    </div>
      				<div class="form-group col-sm-6" id="group-location">
                        <label for="startAddress">Address:</label>
                        <input type="text" name="StartAddress" class="form-control" id="location" placeholder="via Roma">
                    </div>
                    
                </fieldset>
                
                <label id="question">What?</label>
                
                <fieldset class="row">
                    <div class="checkbox checkbox-warning col-xs-6 col-sm-4 col-md-3">
                        <input id="Music" type="checkbox" name="tabs" value="Music" checked>
                        <label  for="Music"> Music </label>
                    </div>

                    <div class="checkbox checkbox-warning col-xs-6 col-sm-4 col-md-3">
                        <input id="Food" type="checkbox" name="tabs" value="Food" checked>
                        <label for="Food"> Food </label>
                    </div>

                    <div class="checkbox checkbox-warning col-xs-6 col-sm-4 col-md-3">
                        <input  id="Sports" type="checkbox" name="tabs" value="Sports" checked>
                        <label for="Sports"> Sports </label>
                    </div>

                    <div class="checkbox checkbox-warning col-xs-6 col-sm-4 col-md-3">
                        <input  id="Drinks" type="checkbox" name="tabs" value="Drinks" checked>
                        <label for="Drinks"> Drinks </label>
                    </div>

                </fieldset>
                    
                <div class="col-xs-12 col-sm-offset-4 col-sm-4 col-md-offset-4 col-md-4 text-center">
                    
                    <input type="submit" value="Search" role="button" class="btn btn-primary btn-lg btn-block"/>
                </div>
            </form>
        </div>
        
               
        <shiro:user>
        	<li>Hello, <%= org.apache.shiro.SecurityUtils.getSubject().getPrincipal().toString() %>- Your last trips</li>
        	
        	<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/jmt"
                   user="root"  password="root"/>

			<%  
			Session shiroSession = org.apache.shiro.SecurityUtils.getSubject().getSession();
			String id = (String) shiroSession.getAttribute("user_id");
			System.out.println("user ID at index page: " + id);
			long sessionTimeout = shiroSession.getTimeout();
			System.out.println(sessionTimeout);
            %>

			<c:set var="user_id" value="<%= id %>"/>

			<sql:query var = "result" dataSource="${dataSource}">
				SELECT tripId, city, link FROM trip where travellerId = ? 
				 <sql:param value="${user_id}" />
			</sql:query>

			<table>
				<c:forEach var="row" items="${result.rows}">
				<tr>
				<td>Trip to: <a href="showTrip?trip_id=${row.tripId}"><c:out value="${row.city}"/></a></td>
				<td><button onclick="gogogo(${row.tripId})">Share this trip</button></td>
				</tr>
				</c:forEach>
			</table>
        
        </shiro:user>
        
        <script>
			function gogogo(tripId) {
			  FB.ui({
			    method: 'feed',
			    link: 'http://127.0.0.1:8080/Jackmytour/showTrip?trip_id='+tripId,
			    // picture: 'http://fbrell.com/f8.jpg',
			    name: 'My new trip',
			    caption: 'Have a look at my next trip',
			    //description: 'Must read daily!'
			  });
			} 
		</script>
  
        
        <div class="row-fluid">
        
        <div class="col-xs-12 description">
        

            
<div class="row centerText">
    
    <div class="col-sm-4 extraP">
        <span class="glyphicon glyphicon-map-marker bigger"></span>
        
        <p class="extraP">Start with your exact location to see what is going on for the day, or plan ahead and search for a city that you are traveling to. </p>
    </div>
    <div class="col-sm-4 extraP">
        <span class="glyphicon glyphicon-road bigger"></span>
        <p class="extraP"> Jack My Tour will help you create an agenda for your travels. Just plug in your location, date, and time and let us do the work for you!</p>
    </div>
    <div class="col-sm-4 extraP">
        <span class="glyphicon glyphicon-info-sign bigger"></span>      
      <p class="extraP">We provide you with the most up to day information to provide you with the best touring experiece possible!</p>
      
    </div>
  </div>  
            </div>
        
            </div>
            
            

     </main>
    
     <div class="container footer" >
    
        <div ng-include="'footer.html'"></div>
     
        
        
    </div>
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    


</body>

</html>