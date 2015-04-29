<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.ArrayList" %>
        <%@ page import="java.util.Iterator" %>
            <%@ page import="develop.com.jackmytour.core.Restaurant" %>
                <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

                <head>
                    <meta charset="UTF-8">
                    <meta content="IE=edge" http-equiv="X-UA-Compatible">
                    <meta content="width=device-width, initial-scale=1" name="viewport">
                    <meta name="description" content="Jack My Tour application">
                    <meta name="author" content="Matas Turskis">
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
                            <Restaurant>) request.getAttribute("restutants_yelp"); %>
                    
                        <div class="row">
                            <div class="col-sm-offset-1 col-sm-10">
                            <form method="POST" ACTION="createAgenda">
                            
                                <ul class="nav nav-tabs nav-justified" id="myTab">
                                    <% 
                            			String[] tabs = (String[]) request.getAttribute("tabs");
                                    	if(tabs != null) { 
                                    		for(String tab : tabs) { %>
                                    			 <li><a href="#<%=tab%>" data-toggle="tab"><%=tab%></a>
                                                 </li>
                                    		<%}
                                    	}
                                    %>
                                    
                                </ul>
                                <div class="tab-content">
                                    
                                    <% 
                                    for(String tab : tabs) { 
                       			 			if(tab.equals("Food")) { 
                       			 					if(rests.size() != 0) {%> 
                       			 					<div class="tab-pane active" id="Food">
                                                    <ul class="list-group"><% 
                                                    		Iterator<Restaurant> iter = rests.iterator(); 
                                                    			int i=0; 
                                                    			for (Restaurant restaurant: rests) { 
                                                    				i=i+1; String a="rest"+i;
                                                    				%>
                                                    <div class="checkbox checkbox-warning">	
                                                    	<input id="<%=a%>" type="checkbox" name="rests" value="<%=restaurant.getName()+"+"+restaurant.getAddress()%>">
                                                            <label for="<%=a%>" class="rest-item"><%=restaurant.getName() %>
                                                            	</br><span><%= restaurant.getAddress() %></span>
                                                            </label>
                                                    </div>	
                                                    <div class="item-line"></div>		
                                                    			<%}
                                                    		
                                                    	%>
                                                        
                                                    </ul>
                                                </div><% 
                       			 					}else { 
                       			 						//qui finisce il tab content del food
                       			 					}
                       			 			}else {%>
                   			 					<div class="tab-pane active" id="<%=tab%>">
                                                	<ul class="list-group">
                                                		<li class="list-group-item">First item</li>
                                                        <li class="list-group-item">Second item</li>
                                                                       
                                                	</ul>
                                            	</div>
                       			 			<% }
                       				}
                                    %>
                                    
                                    <!-- @end #hello -->
									
                                 
                                    <!-- @end #empty -->
                                    
                                    <!-- @end #sports -->
 </div>
 <INPUT TYPE=submit name=submit Value="Create agenda">
 </form>
                                </div>
                            </div>
                        

                        
                    </main>

                    <div class="container footer">

                        <div ng-include="'footer.html'"></div>

                    </div>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
                    <script type="text/javascript" src="bootstrap-tabcollapse.js"></script>
                    <script type="text/javascript">
                        $('#myTab').tabCollapse();
                    </script>

                </body>

                </html>