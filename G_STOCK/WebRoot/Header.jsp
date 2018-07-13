<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <!-- bootstrap and jquery libs -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='js/bootstrap.min.css' rel='stylesheet'/>
    <script src='js/jquery.min.js'></script>  
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	
    <!-- jquery functions  file  -->
    <script src="js/controleur.js"></script>
    <title>My JSP 'Header.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<meta name="viewport" content="width=device-width, initial-scale=1">


  </head>
  		<%
  			// GEtting session
  			HttpSession Session = request.getSession();		
  	 	%>
  <body>
    <nav class='navbar navbar-expand-sm bg-dark text-light sticky-top'>
	  <a class='navbar-brand'><img src="images/logo.png"   height = "45px" /></a>
	  <button class='navbar-toggler' data-target='#colli' data-toggle='collapse' type='button'>
	    <span class='navbar-toggler-icon'/>
	  </button>
	  <div class='collapse navbar-collapse' id='colli'>
	    
	    <ul class='navbar-nav'>
	      <li class='nav-item'>&nbsp;
	     
	    </ul>
	  </div>
	  <!-- 		Checking if connected or not !! 	 -->
	  <% if(Session.getAttribute("Connected") != null) { %>
	      <div class='navbar-nav' >
		       <div class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle btn"  id="navbardrop" data-toggle="dropdown">
		             <span class="fa"  >&#xf2bd;</span>&nbsp;&nbsp; <%= Session.getAttribute("Connected") %>
		            </a>
		            <div class="dropdown-menu dropdown-menu-right">
		              <a class="dropdown-item btn text-secondary" ><span class="fa"  >&#xf06a;</span> profile</a>
		              <a class="dropdown-item btn" onclick="disconnect()" ><span class="fa"  >&#xf08b;</span> Se déconnecter</a>
		            </div>
		        </div>  
		    </div>    
	  <%} else {%>

	  <%} %> 
	</nav>
  </body>
</html>
