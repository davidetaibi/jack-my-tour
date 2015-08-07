<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<header>

    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><img class="img-responsive" src="images/suitcase.png"></a>

            </div>

            <div class="collapse navbar-collapse navbar-right">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    
                    <shiro:guest>
                    <li><a href="register.jsp">Register</a></li>
                  	<li><a href="login.jsp">Log in</a></li>
                  	</shiro:guest>
                    
                    <shiro:user>
                   	<li>Hello, <%= org.apache.shiro.SecurityUtils.getSubject().getPrincipal().toString() %><li>
        			<li><a href="logout">Log out</a></li>
        			</shiro:user>
        			
        			<!--  <li><a href="register.jsp">Register</a></li>-->
                </ul>
                <!--  <button type="button" class="btn btn-primary navbar-btn navbar-right">Login</button>-->
            </div>
            <!--.nav-collapse -->
        </div>
    </nav>
</header>