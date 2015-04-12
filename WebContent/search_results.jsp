<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="develop.com.jackmytour.core.Restaurant"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
    ArrayList<Restaurant> rests = (ArrayList<Restaurant>) request.getAttribute("restutants_yelp");
	Iterator<Restaurant> iter = rests.iterator();
       if (rests.size()>0) {       
       
    	   for (Restaurant restaurant: rests) {            
                %>
                <blockquote>Name: <%= restaurant.getName() %></blockquote>
                <blockquote>Address: <%= restaurant.getAddress() %></blockquote>
                <%
            }
        }
 %>
</body>
</html>