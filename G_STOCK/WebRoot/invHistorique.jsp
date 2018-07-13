<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="CDB.Methodes"%>
<%@page import="CDB.Inventaire"%>
<%@page import="CDB.Acess_donner"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import = "org.json.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.ResultSet" %>
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
    
    <title>Historique</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
   <%	
  		// Getting session ...	
  		HttpSession Session = request.getSession();
  		
  		 // Checking connexion 
		if(Session.getAttribute("Connected") == null) {
			 response.sendRedirect("Home.faces");	
		}
		
  		// Getting current date ...
  		Date date = new Date();
  		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
  		String Date = ft.format(date).toString();
  		
  		// initiating alert value
  		String alert = "";
		
  		
  		//Testing session for alerts !! 
  		if(Session.getAttribute("alert") != null)	 {  alert = (String) Session.getAttribute("alert"); Session.removeAttribute("alert");};
  		
  		// Getting articles ... 
  		ResultSet Articles = Acess_donner.selection("SELECT * FROM `articles`","g_vente");
  		
  		// Getting inventories list from session
  		ArrayList<Inventaire> inventaires = (ArrayList<Inventaire>) Session.getAttribute("invHistorique");
  		
  		// Getting the date of the last history check  from session  
  		if(Session.getAttribute("date") != null) Date = (String) Session.getAttribute("date");
  		int Quantite = 0;
  		double Montant = 0 , PBB = 0;
  		
  		
   %>
   
   
 	<!--  Including Header page  -->
 	<jsp:include page="Header.jsp" />
  
  <body ng-app="">


  <div class="container col-md bg-white">
  	<div class="row">
  		<div class="col-sm-1 bg-dark "  style="padding-top : 10%">
  		
				<!--  Loading Sidebar menu  -->
				<%@include  file="sideBarMenu.html" %>
				
  		</div>
  		<div class="col-sm-11 bg-light "  style="padding : 0px">
  		  	  	
		  
			<!--------------------------- navBar menu d'histoire d'inventaire  ------------------------------>
			
			<nav class="navbar navbar-expand-lg navbar-dark bg-success">
			  <a class="navbar-brand"  ><i style="font-size:20px;" class="fa text-light">&#xf054;</i></a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active text-light">
			        <B>Liste d'historique des inventaires </B>
			      </li>
			    </ul>

			  </div>
			</nav>
			
			<!-------------------- Champ de choix de date  d'inventaire  --------------------->
		  	
  			<div class="bg-light" >
  				<form method="post" action="invHistorique.do">
	  			<br />
	  				<center>
		  				<div class="form-group col-sm-5 row">
						    <label for="type" class="col-sm-2 text-dark text-left col-form-label"><B>*Date</B></label>
						    <div class="col-sm-8 ">
						      <input  type="date" class="form-control"   name="date" id="mDate"  value="<%=Date %>" />
						    </div>
						    <div class="col-sm-2 ">
						      <button  type="submit" class="form-control btn bg-light text-center"   style="font-size:24px"  ><i class="fa ">&#xf021;</i></button>
						    </div>
		  				</div>
	  				</center> 
	  				
  				</form>
  			</div>
			
			<!--------------------------------- Search bar ----------------------------->
			
		    <div class="input-group input-group-lg">
  				<div class="input-group-prepend">
    				<span class="input-group-text" id="inputGroup-sizing-lg"><i class="fa fa-search"></i></span>
 				 </div>
  				<input type="text" class="form-control" id="search" placeholder="Recherche ..." onkeyup="searchFilter()" aria-describedby="inputGroup-sizing-sm" / >
			</div>	
			
			<!------------------------ Liste des  des articles   ------------------------->
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-striped text-center" >
					  <thead>
					    <tr>
					      <th scope="col">Code d'article</th>
					      <th scope="col">Nom d'article</th>
					      <th scope="col">Description</th>
					      
					      <th scope="col">Cout unitaire</th>
					      <th scope="col">Date</th>
					      <th scope="col">Montant</th>
					      <th scope="col" >Quantité</th>
					    </tr>
					  </thead>
					  <tbody id="invTable">
					   <% if(inventaires != null){ for(int i = 0 ; i < inventaires.size(); ++i) {
					   				Quantite+=	inventaires.get(i).qteArt; 
					   				Montant += inventaires.get(i).prixArt*inventaires.get(i).qteArt;
					   				
								%>
									<tr>
									<td><%= inventaires.get(i).codArt %></td>
									<td><%= inventaires.get(i).nomArt %></td>
									<td><%= inventaires.get(i).descInv %></td>
									<td>{{<%= inventaires.get(i).prixArt %>| currency : ''}} DH</td> <!-- currency if a filter in *ANGULARJS* that formate numbers in currency form  -->
									<td><%= inventaires.get(i).dateInv %></td>	
									<td>{{<%= inventaires.get(i).prixArt*inventaires.get(i).qteArt %>| currency : ''}} DH</td>
									<td><%= inventaires.get(i).qteArt %></td>
								</tr>
									<% }} %> 
					  </tbody>
				</table>
			</div>
		</div>
	</div>

  </div>
  
 	<script>

 		$(document).ready(function(){
    		
    		// GEtting windows height for sideBarMenu height 
    		$('#ss').height( $(document).height()-57.8);
    		
    		// Getting alert type from jsp value
    		var message = '<%=alert %>';
    		
    		
    		// Checking message for the alert's type ! 
    		 
    		 if(message == 'Ajouter'){ 
    		 	swal({
	                title: "Congratulations",
	                text: "L'inventaire a été ajouté avec succès",
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
			                title: "Congratulations",
			                text: "La modification de l'inventaire a échoué !",
			                type: "error",
			                timer: 2000,
		                	showConfirmButton: false
		            	});
            	}else 
            		if(message == 'SupprimerF'){ 
		    		 	swal({
			                title: "Congratulations",
			                text: "La suppression de l'inventaire a échoué !",
			                type: "error",
			                timer: 2000,
		                	showConfirmButton: false
		            	});
            	}else 
            		if(message == 'AjouterF'){ 
		    		 	swal({
			                title: "Congratulations",
			                text: "L'ajout de l'inventaire a échoué !",
			                type: "error",
			                timer: 2000,
		                	showConfirmButton: false
		            	});
            	}
});
	
    </script>
  </body>
</html>
