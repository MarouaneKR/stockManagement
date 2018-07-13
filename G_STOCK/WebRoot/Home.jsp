
<%@page import="CDB.Acess_donner"%><%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%><%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import = "org.json.*" %>


<%@ page import="java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "CDB.Acess_donner" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
     
    <!-----------------------  Bootstrap Libraries  ------------------->
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <link href="js/bootstrap.min.css" rel='stylesheet'/>
    <link href="js/bootstrap.min.js" rel='stylesheet'/>
    
    <!-----------------------  JQuery Library  ------------------->
    <script src="js/jquery.min.js" ></script>
    
    <!-----------------------  AngularJS Library ------------------->
    <script src="js/angular.min.js" ></script>
    
    <!-----------------------  JQuery methodes file   ------------------->
    <script src="js/controleur.js" ></script>
    
    <!-----------------------  Icons library  ------------------->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <title>Accueil</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/style.css">
	
  </head>
 
  <%
  	
  	// Getting session
	HttpSession Session = request.getSession();
	
	// Checking if the user is connected redirect to inventory
	if(Session.getAttribute("Connected") != null) {
			 response.sendRedirect("Inventaire.jsp");	
	}
	
	// Error in case of incorrect information (username / password)
	String Error = ""; 
	if(Session.getAttribute("Error") != null) 
		// String error from session in variable
		Error =  (String) Session.getAttribute("Error");
	
	// Deleting session ater checking ...
	Session.removeAttribute("Error");
		 
   %>
  
  <!--------- Including header page  ---------------->
  <jsp:include page="Header.jsp" />
  
  <body>
  	
   			<f:view>
				<div class="container   col-sm-3">
					
					<h:form id="loginForm" styleClass="form-group" rendered="true">
					<div styleClass="form-group ">
						
						<B>Nom d'utilisateur : </B>	<h:inputText id="username"  styleClass="form-control" value="#{UserLogin.userName}"  rendered="true" required="true"></h:inputText>
					</div>
						<br/>
						<div styleClass="form-group ">
						<B>Mot de passe :  </B><h:inputSecret id="password" styleClass="form-control" value="#{UserLogin.password}"  rendered="true" required="true"></h:inputSecret>
						<br/>
						
						 <div class="text-danger"><%=Error %></div>
						</div><br /><br />
						<h:commandButton value="Submit" styleClass="btn btn-primary btn-lg float-right" action="#{UserLogin.login}"></h:commandButton>
						
						</h:form>
						</div>
				</f:view>
  </body>
</html>
