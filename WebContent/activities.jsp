<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
        <%@ page import="java.util.Iterator" %>
            <%@ page import="develop.com.jackmytour.core.Restaurant" %>
            <%@ page import="develop.com.jackmytour.core.Item" %>
            <%@ page import="develop.com.jackmytour.core.DrinkBar" %>
            <%@ page import="com.evdb.javaapi.data.Event"%>
                <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

                <head>
                    <meta charset="UTF-8">
                    <meta content="IE=edge" http-equiv="X-UA-Compatible">
                    <meta content="width=device-width, initial-scale=1" name="viewport">
                    <title>Jack My Tour</title>

                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
                    <link rel="stylesheet" href="//cdn.jsdelivr.net/fontawesome/4.3.0/css/font-awesome.min.css" />
                    <link href="http://fonts.googleapis.com/css?family=Open+Sans:700,600,400&subset=latin,latin-ext" rel="stylesheet" type="text/css">
                    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/awesome-bootstrap-checkbox/v0.2.3/awesome-bootstrap-checkbox.min.css" />
                    <link rel="stylesheet" href="css/styles.css">

                    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js"></script>
                                      

                    <!--[if IE]>
        <script src="https://cdn.jsdelivr.net/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
                </head>

                <body ng-app>


                    <div class="container">

                        <div ng-include="'header.html'"></div>

                    </div>


                    <main class="container" id="act">
                    <% ArrayList<Restaurant> rests = (ArrayList
                            <Restaurant>) request.getAttribute("restutants_yelp"); 
                    
                    ArrayList<DrinkBar> drinks = (ArrayList<DrinkBar>) request.getAttribute("drinks");     
                    
                	List<Event> sports= (List<Event>) request.getAttribute("sports");
            		
                	List<Event> musics = (List<Event>) request.getAttribute("musics");                     
                    %>
                    
                        <div class="row">
                            <div class="col-sm-offset-1 col-sm-10">
                            <form method="POST" ACTION="createAgenda">
                            
                                <ul class="nav nav-tabs nav-justified" id="myTab">
                                    <% 
                            			String[] tabs = (String[]) request.getAttribute("tabs");
                                    	if(tabs != null) { 
                                    		boolean check = true;
                                    		for(String tab : tabs) { 
                                    		if(check){ %>
                                    			 <li class="active"><a href="#<%=tab%>" data-toggle="tab"><%=tab%></a>
                                                 </li>
                                                 <% } else {%>
                                                 <li><a href="#<%=tab%>" data-toggle="tab"><%=tab%></a>
                                                 </li>
                                    		<% } check = false;}
                                    	}
                                    %>
                                    
                                </ul>
                                <div class="tab-content">
                                   
                                    <% 
                                    boolean check2 = true;
                                    String classactive = "";
                                    for(String tab : tabs) { 
                                    	if(check2){classactive = "active"; } else {classactive = ""; }
                       			 			if(tab.equals("Food")) { 
                       			 					if(rests.size() != 0) {%> 
                       			 					<div class="tab-pane <%= classactive %>" id="Food">
                                                        <select class="form-control" id="food-type">
                                                          <option>all</option>
                                                          <option>chinese</option>
                                                          <option>italian</option>
                                                          <option>Vegetarian</option>
                                                          <option>Japanese</option>
                                                          <option>Indian</option>
                                                        </select>
                                                      
                                                        <div id="test"></div>
                                                     
                                                    <ul class="list-group" id="food-list"><% 
                                                    		Iterator<Restaurant> iter = rests.iterator(); 
                                                    			int i=0; 
                                                    			for (Restaurant restaurant: rests) { 
                                                    				i=i+1; String a="rest"+i;
                                                     %>
                                                         <div class="item-line"></div>	
                                                    <div class="checkbox checkbox-warning">	
                                                    	<input id="<%=a%>" type="checkbox" name="rests" value="<%=restaurant.getName()+"+"+restaurant.getAddress()%>">
                                                            <label for="<%=a%>" class="rest-item"><%=restaurant.getName() %>
                                                            	</br><span>Address: <%= restaurant.getAddress() %></span>
                                                            </label>
                                                    </div>	
                                                    		
                                                    			<%}
                                                    		
                                                    	%>
                                                        
                                                    </ul>
                                                </div><% 
                       			 					}else { 
                       			 						//qui finisce il tab content del food
                       			 					}
                       			 			}else if(tab.equals("Drinks")) {
                   			 					    if(drinks.size() != 0) {%> 
                       			 					<div class="tab-pane  <%= classactive %>" id="Drinks">

                                                    <ul class="list-group"  id="notfood"><% 
                                                    		Iterator<DrinkBar> iter = drinks.iterator(); 
                                                    			int i=0; 
                                                    			for (DrinkBar bar: drinks) { 
                                                    				i=i+1; String a="bar"+i;
                                                     %>
                                                    <div class="item-line"></div>	
                                                    <div class="checkbox checkbox-warning">	
                                                    	<input id="<%=a%>" type="checkbox" name="drinks" value="<%=bar.getName()+"+"+bar.getAddress()%>">
                                                            <label for="<%=a%>" class="rest-item"><%=bar.getName() %>
                                                            	</br><span>Address: <%= bar.getAddress() %></span>
                                                            </label>
                                                    </div>	
                                                    		
                                                    	        <%}
                                                    		
                                                    	%>
                                                        
                                                    </ul>
                                                </div><% 
                       			 					}else { 
                       			 						//qui finisce il tab content del food
                       			 					}
                       			 			 }else if(tab.equals("Music")) {
                			 					    if(musics.size() != 0) {%> 
                    			 					<div class="tab-pane  <%= classactive %>" id="Music">

                                                 <ul class="list-group"  id="notfood"><% 
                                                 		Iterator<Event> iter = musics.iterator(); 
                                                 			int i=0; 
                                                 			for (Event event: musics) { 
                                                 				i=i+1; String a="musicEvent"+i;
                                                  %>
                                                 <div class="item-line"></div>	
                                                 <div class="checkbox checkbox-warning">	
                                                 	<input id="<%=a%>" type="checkbox" name="musics" value="<%= event.getTitle()+"+"+ event.getVenue().getAddress() %>">
                                                         <label for="<%=a%>" class="rest-item"><%=event.getTitle() %>
                                                         	</br><span>Address: <%= event.getVenue().getAddress() %></span>
                                                         </label>
                                                 </div>	
                                                 		
                                                 	      <%}
                                                 		
                                                 	%>
                                                     
                                                 </ul>
                                             </div><% 
                    			 					}else { 
                    			 						
                    			 					}
                    			 			 }else if(tab.equals("Sports")) {
             			 					    if(sports.size() != 0) {%> 
                 			 					<div class="tab-pane  <%= classactive %>" id="Sports">

                                              <ul class="list-group"  id="notfood"><% 
                                              		Iterator<Event> iter = sports.iterator(); 
                                              			int i=0; 
                                              			for (Event event: sports) { 
                                              				i=i+1; String a="sportEvent"+i;
                                               %>
                                              <div class="item-line"></div>	
                                              <div class="checkbox checkbox-warning">	
                                              	<input id="<%=a%>" type="checkbox" name="sports" value="<%= event.getTitle()+"+"+ event.getVenue().getAddress() %>">
                                                      <label for="<%=a%>" class="rest-item"><%=event.getTitle() %>
                                                      	</br><span>Address: <%= event.getVenue().getAddress() %></span>
                                                      </label>
                                              </div>	
                                              		
                                              	      <%}
                                              		
                                              	%>
                                                  
                                              </ul>
                                          </div><% 
                 			 					}else { 
                 			 						
                 			 					}
                 			 			 } check2 = false;
                       				}
                                    %>
                                    
                                    <!-- @end #hello -->
									
                                 
                                    <!-- @end #empty -->
                                    
                                    <!-- @end #sports -->
 </div>
 
 <div class="col-xs-12">
 <INPUT class="btn btn-primary btn-lg btn-block" TYPE=submit name=submit Value="Create agenda" id="ag">
 </div>
 </form>
                                </div>
                            </div>
                        

                        
                    </main>

                    <div class="container footer">

                        <div ng-include="'footer.html'"></div>

                    </div>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
                    <script type="text/javascript" src="js/bootstrap-tabcollapse.js"></script>
                    <script type="text/javascript">
                        $('#myTab').tabCollapse();
                    </script>
                      <script type="text/javascript">
                      $(document).ready(function() {
                        $("#food-type").change(function(){
                        	 var term = $('#food-type :selected').text();
                       	  $.ajax({
                        	      url: 'UpdateActivities',
                        	        type: "POST",
                        	        data: {"term" : term},
                        	        success: function(request, response){
                        	        rests  = data.rests;     
                        	    $("#test").html("success"); 
                        	  
                        	         },
                        	        error: function(request, response){
                          	          //  rests  = data.rests;
                          	          $('#test').html("fail"); 
                          	         },
                        	    }); 
                        });
                      });
                    </script>


                </body>

                </html>