<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="CDB.Methodes"%>
<%@page import="CDB.Statistiques"%>
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
    
    
    <title>Statistiques</title>
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
	
  		// Getting list from session
  		ArrayList<Statistiques> Ventes = (ArrayList<Statistiques>) Session.getAttribute("Ventes");
  		ArrayList<Statistiques> Achats = (ArrayList<Statistiques>) Session.getAttribute("Achats");
  		
  		// String where the json form of arraz wil be stored 
  		String venteJson = "";
  		String achatJson = "";
  		
  		// Checking if purchase and sale arraz wasnt null !
  		if(Ventes != null) {
	  		// Converting purchases array to json array
	  		
	  		JSONObject tempAchat = new JSONObject();
	  		JSONArray achatJsonTemp =new JSONArray();
	  		
	  		// Adding each item of the array to the json table 
	  		for(int i = 0; i < Achats.size() ; ++i){
	  			tempAchat.put("x",  Achats.get(i).x);
	  			tempAchat.put("y",  Achats.get(i).y);
	  			achatJsonTemp.put(tempAchat);
	  			
	  			tempAchat = new JSONObject();
	  		}
	  		 
	  		 // Convertig the json table to string 
	  		 achatJson = achatJsonTemp.toString();
	  		
	  		
	  		// Same with Sales array 
	  		JSONObject tempVente = new JSONObject();
	  		JSONArray venteJsonTemp =new JSONArray();
	  		for(int i = 0; i < Ventes.size() ; ++i){
	  			tempVente.put("x",  Ventes.get(i).x);
	  			tempVente.put("y",  Ventes.get(i).y);
	  			venteJsonTemp.put(tempVente);
	  			
	  			tempVente = new JSONObject();
	  		}
	  		 venteJson = venteJsonTemp.toString();
  		}
   %>
  
  <!-----------------   Including header page --------------------->
  <jsp:include page="Header.jsp" />
  
  
  <body ng-app="">
  
  <div class="container col-md bg-white">
  	<div class="row">
  		<div class="col-sm-1 bg-dark "  style="padding-top : 10%" id="ss">
				<!--  Loading Sidebar menu  -->
				<%@include  file="sideBarMenu.html" %>
  		</div>
  		<div class="col-sm-11 bg-light "  style="padding : 0px">
  		  	  	
		  
			<!--------------------------- navBar menu inventaire  ------------------------------>
			
			<nav class="navbar navbar-expand-lg navbar-dark bg-success">
			  <a class="navbar-brand"  ><i style="font-size:20px;" class="fa text-light">&#xf054;</i></a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active text-light">
			        <B>Liste d'histoire des inventaires </B>
			      </li>
			    </ul>

			  </div>
			</nav>
			
			<!-------------------- Champ de chois de type des statistiques   --------------------->
		  	
  			<div class="bg-light" >
  				<form method="post" action="statistiques.do">
	  			<br />
	  				<center>
		  				<div class="form-group col-sm-5 row">
						    <label for="type" class="col-sm-4 text-dark text-left col-form-label"><B>*Statistiques par : </B></label>
						    <div class="col-sm-6 ">
						      <select   class="form-control"   name="type" id="mDate"   >
						      		<!-- <option value="week">Semaine</option> -->
						      		<option value="month">Mois</option>
						      		<!-- <option value="year">Année</option>  -->
						      </select>
						    </div>
						    <div class="col-sm-2 ">
						      <button  type="submit" class="form-control btn bg-light text-center"   style="font-size:24px"  ><i class="fa ">&#xf021;</i></button>
						    </div>
		  				</div>
	  				</center> 
	  				
  				</form>
  			</div>
			
	
			<!------------------------ Statistics chart  ------------------------->
					<div>
						<div id="chartContainer"   class="col-sm-12" style="  padding : 0px;height: 470px; width: 100%;"></div>
					</div>
			</div>
					
	</div>

  </div>
  
 	<script>

 		$(document).ready(function(){
 		
 			// GEtting window height for sideBarMenu height
    		$('#ss').height( $(document).height()-57.8);
    		
    		// Getting json tables of purchase and sale from jsp  
    		var Achat = JSON.parse('<%= achatJson%>');
    		var Vente = JSON.parse('<%= venteJson%>');
    		
    		
    		// Statistics Chart function ... 
    		var chart = new CanvasJS.Chart("chartContainer", {
		    animationEnabled: true,
		    theme: "light8",
		    title:{
		        text: "Les statistiques des achats et ventes pour ce mois"
		    },
		    legend:{
		        cursor: "pointer",
		        verticalAlign: "center",
		        horizontalAlign: "right",
		        itemclick: toggleDataSeries
		    },
		    data: [{
		        type: "column",
		        name: "Achat",
		        color : "#dc3545",
		        indexLabel: "{y}",
		        yValueFormatString: "#0.##",
		        showInLegend: true,
		        dataPoints: Achat
		    },{
		        type: "column",
		        name: "Vente",
		        color : "#28a745",
		        indexLabel: "{y}",
		        yValueFormatString: "#0.##",
		        showInLegend: true,
		        dataPoints: Vente
		    }]
		});
		chart.render();
		 
		function toggleDataSeries(e){
		    if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		        e.dataSeries.visible = false;
		    }
		    else{
		        e.dataSeries.visible = true;
		    }
		    chart.render();
		}
});
	
    </script>
  </body>
  	<!--------------------------- Statistics chart library --------------------------->
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</html>
