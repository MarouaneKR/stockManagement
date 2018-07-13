<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page  language="java" import="java.sql.ResultSet" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ajouterInv.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  <%
  	//  Obtenir la date courante  ...
  		Date date = new Date();
  		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
  		String Date = ft.format(date).toString();
  		
  	//	 Obtenir la liste des articles ...	
  		ResultSet Articles = CDB.Acess_donner.selection("SELECT * FROM `articles`","g_vente");
   %>
   
   <!------------------------ NavBar champ d'ajout  ------------------------->
   
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
	  <a class="navbar-brand" ><i style="font-size:20px;" class="fa text-light">&#xf054;</i></a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active text-light">
	        <B>Ajouter Nouveau Inventaire</B>
	      </li>
	    </ul>
	    <button type="button" class="btn bg-white btn-default  btn-sm "  onclick="xAjouter()" >
	              &nbsp;<span class="fa">&#xf00d;</span>&nbsp;
	          </button>
	  </div>
	</nav>
	
	<!------------------------ Formulaire d'ajout d'un inventaire  ------------------------->
	
	<form method="get" action="newInventaire.do" style="margin : 20px;" class="form-group" name="MyForm" id="myForm" onsubmit="return verifyInput(); return true;" >
		<div class="form-group row">
		    <label for="type" class="col-sm-2 text-dark col-form-label">*Nom</label>
		    <div class="col-sm-10">
			    <select class="form-control custom-select"  name="nom" id="Nom" >
			    	<option value="">Choisissez un article ...</option>
			    	<% while(Articles.next()){ %>
			    		<option value="<%=Articles.getInt("codeArt") %>"><%=Articles.getString("nomArt") %></option>
			    	<%} %>
			    </select>
			  <span class="text-danger" id="nomAlert" ></span>
		    </div>
		  </div>
	
		<div class="row ">
	    	<div class="col-sm-6 ">
			  <div class="form-group row">
			    <label for="type" class="col-sm-4 text-dark col-form-label">*Quantité </label>
			    <div class="col-sm-8 float-right">
			      <input type="text" class="form-control" id="Quantite"   name="quantite" /><br />
			    	<span class="text-danger" id="quantiteAlert"></span>
			    </div>
			  </div>
			</div>
			<div class="col-sm-6  ">
			  <div class="form-group row">
			    <label for="type" class="col-sm-4 text-dark text-center col-form-label">*Date</label>
			    <div class="col-sm-8 ">
			      <input  type="date" class="form-control"   name="date"   value="<%=Date %>" />
			    </div>
			  </div>
			</div>
		</div>
	 	<div class="form-group row">
		    <label for="description" class="col-sm-2 text-dark col-form-label">Description</label>
		    <div class="col-sm-10">
		      <textarea type="text" class="form-control" id="description"   name="description"></textarea>
	    </div>
	  </div>
	   <div class=" text-right">
	 			<input   type="submit" class="btn bg-danger btn-default text-white btn-lg "  value="  Enregistrer  "  />
	 		  </div>  <br /><br />
	</form>
  </body>
</html>
