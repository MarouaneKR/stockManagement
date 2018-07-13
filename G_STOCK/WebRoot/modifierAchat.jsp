<%@ page language="java" import="java.util.*,java.sql.ResultSet" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  <%
  		// Obtenir la liste des articles a partir de la requête 
  		ResultSet Articles = CDB.Acess_donner.selection("SELECT * FROM `articles`","g_vente");
   %>
    <div id="Modifer">
		    <nav class="navbar navbar-expand-lg navbar-dark bg-info">
			  <a class="navbar-brand" ><i style="font-size:20px;" class="fa text-light">&#xf054;</i></a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active text-light">
			        <B>Modifier une achat</B>
			      </li>
			    </ul>
			    <button type="button" class="btn bg-white btn-default  btn-sm "  onclick="xModifier()" >
			       &nbsp;<span class="fa">&#xf00d;</span>&nbsp;
			    </button>
			  </div>
			</nav>
			<form method="get" action="modifierAchat.do" style="margin : 20px;" class="form-group" name="MyForm" id="myForm" onsubmit="return verifyModificationInput(); return true;" >
				<div class="form-group row">
					<div class="col-sm-6 ">
					  <div class="form-group row">
					    <label for="type" class="col-sm-4 text-dark col-form-label">*Code d'achat </label>
					    <div class="col-sm-8 float-right">
					      <input type="text" class="form-control" id="mCode"   name="codeAchat" /><br />
					    	<span class="text-danger" id="mInvAlert"></span>
					    </div>
					  </div>
					</div>
					<div class="col-sm-6  ">
					  <div class="form-group row">
					    <label for="type" class="col-sm-4 text-dark text-center col-form-label">*Code d'article</label>
					    <div class="col-sm-8 ">
					      <select class="form-control custom-select"  name="nom" id="mNom" >
					    	<option value="">Choisissez un article ...</option>
					    	<% while(Articles.next()){ %>
					    		<option value="<%=Articles.getInt("codeArt") %>"><%=Articles.getString("nomArt") %></option>
					    	<%} %>
					      </select>
					      <span class="text-danger" id="mCArtAlert"></span>
					    </div>
					  </div>
					</div>
				    
				  </div>
			
				<div class="row ">
			    	<div class="col-sm-6 ">
					  <div class="form-group row">
					    <label for="type" class="col-sm-4 text-dark col-form-label">*Quantité </label>
					    <div class="col-sm-8 float-right">
					      <input type="text" class="form-control" id="mQuantite"   name="quantite" /><br />
					    	<span class="text-danger" id="mQuantiteAlert"></span>
					    </div>
					  </div>
					</div>
					<div class="col-sm-6  ">
					  <div class="form-group row">
					    <label for="type" class="col-sm-4 text-dark text-center col-form-label">*Date</label>
					    <div class="col-sm-8 ">
					      <input  type="date" class="form-control"   name="date" id="mDate"  value="2018-06-12" />
					    </div>
					  </div>
					</div>
				</div>
			   <div class=" text-right">
    			<input   type="submit" class="btn bg-info text-white   btn-lg "  value="  Enregistrer  "  />
    		  </div>  <br /><br />
			</form>
			</div>
  </body>
</html>
