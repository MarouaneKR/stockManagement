<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="CDB.Methodes"%>
<%@page import="CDB.Achat"%>
<%@page import="CDB.Acess_donner"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import = "org.json.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
   	
   	<!-----------------------  Alert libraries  ------------------->
    <link href="js/sweetalert.css" type="text/css" rel="stylesheet">
    <script src="js/sweetalert.min.js" type="text/javascript"></script>

    
    <title>Achat</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
 	
 	<!------------------  Including header page -------------->
 	<jsp:include page="Header.jsp" />
  
  
  <body ng-app="">
  <%	
  		// alert to test if needs to show the  alert !! (in case of adding or modification !)
  		String alert = "";
		
		// Getting the session   		
  		HttpSession Session = request.getSession();
  		
  		// Checking connexion 
		if(Session.getAttribute("Connected") == null) {
			 response.sendRedirect("Home.faces");	
		}
		
  		// Checking for alert stored in the session
  		if(Session.getAttribute("alert") != null)	 {  alert = (String) Session.getAttribute("alert"); Session.removeAttribute("alert");};
  		
  		// Getting articles  for the select option input ..
  		ResultSet Articles = Acess_donner.selection("SELECT * FROM `articles`","g_vente");
  		
  		// GEtting purchases  
  		ArrayList<Achat> achats = Methodes.getAchat();
  		int Quantite = 0;
  		double Montant = 0 ;
  		  		
   %>

  <div class="container col-md bg-white">
  	<div class="row">
  		<div class="col-sm-1 bg-dark"  style="padding-top : 10%" id="ss">
				
				<!-- Loading sidbare menu-->
				<%@include  file="sideBarMenu.html" %>
  		</div>
  		<div class="col-sm-11 bg-light"  style="padding : 0px">
		  	
		  	<!-------------------- Champ de modification d'une achat  --------------------->
		  	
  			<div id="Modifier" style="display: none;">
  				<jsp:include page="modifierAchat.jsp" />
  			</div>
  			
  			<!------------------------ Champ d'ajout d'une achat  ------------------------->
  			
  			<div id="Ajout" style="display: none;">
		    <jsp:include page="ajouterAchat.jsp" />
			</div>
			
			<!------------------------navBar menu achat  ------------------------->
			
			<nav class="navbar navbar-expand-lg navbar-dark bg-success">
			  <a class="navbar-brand" ><i style="font-size:20px;" class="fa text-light">&#xf054;</i></a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active text-light">
			        <B>Liste des achats </B>
			      </li>
			    </ul>
			    <button type="button" class="btn bg-white btn-default  btn-sm " id="ad"  onclick="Ajouter()" >
			              &nbsp;<span class="fa">&#xf067;</span>&nbsp;
			          </button>
			  </div>
			</nav>
			
			<!--------------------------------- Search bar ----------------------------->
			
		    <div class="input-group input-group-lg">
  				<div class="input-group-prepend">
    				<span class="input-group-text" id="inputGroup-sizing-lg"><i class="fa fa-search"></i></span>
 				 </div>
  				<input type="text" class="form-control" id="search" placeholder="Recherche ..." onkeyup="searchFilter()" aria-describedby="inputGroup-sizing-sm" / >
			</div>
			
			<!------------------------ Liste des  achats  ------------------------->
				
			<table class="table table-bordered table-hover table-striped text-center" >
				  <thead>
				    <tr>
				      <th scope="col">Code d'achat</th>
				      <th scope="col">Code d'article</th>
				      <th scope="col">Nom d'article</th>
				      <th scope="col">Description</th>
				      <th scope="col">Quantité</th>
				      <th scope="col">Cout unitaire</th>
				      <th scope="col">Date</th>
				      <th scope="col">Montant</th>
				      <th scope="col">Modifier/Supprimer</th>
				    </tr>
				  </thead>
				  <tbody id="invTable">
				   <% if(achats != null){ for(int i = 0 ; i < achats.size(); ++i) {
				   				Quantite+=	achats.get(i).qteAchete; 
				   				Montant += achats.get(i).prixArt*achats.get(i).qteAchete;
				   				
							%>
								<tr>
								<td><%= achats.get(i).codeAchat %></td>
								<td><%= achats.get(i).codArt %></td>
								<td><%= achats.get(i).nomArt %></td>
								<td><%= achats.get(i).descArt %></td>
								<td><%= achats.get(i).qteAchete %></td>
								<td>{{<%= achats.get(i).prixArt %>| currency : ''}} DH</td> <!--  AngularJS filter that form number of currency form 1  -->
								<td><%= achats.get(i).dateReception %></td>	
								<td>{{<%= achats.get(i).prixArt*achats.get(i).qteAchete %>| currency : ''}} DH</td>
								<td class="text-center">
									<i class="fa text-info btn" style="font-size:24px;color:green" onclick="modifier(<%= achats.get(i).codeAchat %>,<%= achats.get(i).codArt %>,'<%= achats.get(i).qteAchete%>','<%= achats.get(i).dateReception %>','<%= achats.get(i).descArt%>')">&#xf044;</i>
									<!-- <form action="supprimerAchat.do" onsubmit="return supp(); return true;" ><input type="hidden" value="<%=achats.get(i).codeAchat %>" name="codeAchat" id="codeAchat" /><button type="submit" class="btn bg-light" ><i class="fa text-danger btn" type="submit" style="font-size:24px;color:red" >&#xf00d;</i></button></form>  -->
										 <i class="fa text-danger btn" style="font-size:24px;color:red"  onclick="supprimerAchat(<%= achats.get(i).codeAchat %>)">&#xf00d;</i>		
								</td> 
							</tr>
								<% }} %> 
				  </tbody>
			</table>
		</div>
	</div>

  </div>
  
 	<script>

 		$(document).ready(function(){
    		
    		// Getting window hight for th sideBarMenu
    		$('#ss').height( $(document).height()-57.8);
    		
    		// GEtting alert type from jsp
    		var message = '<%=alert %>';
    		
    		// Testing fot the alert type  
    		 if(message == 'Ajouter'){ 
    		 	swal({
	                title: "Congratulations",
	                text: "L'achat a été ajoutée avec succès",
	                type: "success",
	                timer: 2000,
                	showConfirmButton: false
            	});
    		 	 
    		 	}else 
    		 		if(message == 'Supprimer'){ 
		    		 	swal({
			                title: "Congratulations",
			                text: "La suppression a été faite avec succès",
			                type: "success",
			                timer: 2000,
		                	showConfirmButton: false
		            	});
            	} else 
            		if(message == 'Modifier'){ 
		    		 	swal({
			                title: "Congratulations",
			                text: "La modification a été faite avec succès",
			                type: "success",
			                timer: 2000,
		                	showConfirmButton: false
		            	});
            	}else 
            		if(message == 'ModifierF'){ 
		    		 	swal({
			                title: "Oups",
			                text: "La modification de l'achat a échouée !",
			                type: "error",
			                timer: 2000,
		                	showConfirmButton: false
		            	});
            	}else 
            		if(message == 'SupprimerF'){ 
		    		 	swal({
			                title: "Oups",
			                text: "La suppression de l'achat a échouée !",
			                type: "error",
			                timer: 2000,
		                	showConfirmButton: false
		            	});
            	}else 
            		if(message == 'AjouterF'){ 
		    		 	swal({
			                title: "Oups",
			                text: "L'ajout de l'achat a échouée !",
			                type: "error",
			                timer: 2000,
		                	showConfirmButton: false
		            	});
            	}
});
	
    </script>
  </body>
</html>
