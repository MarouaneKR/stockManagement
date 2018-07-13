// Verifying inputs 
function verifyInput() {
		
		if ($("#Nom").val() == "") {
			$("#Nom").focus();
			$("#nomAlert").html("Le nom est requis !");
			return false;
		
		}else{
			$("#nomAlert").html("");
		}
		
		if ($("#Quantite").val() == "") {
			$("#Quantite").focus();
			$("#quantiteAlert").html("La quantité est requise !");
			return false;
			
		}else if(isNaN(parseInt($("#Quantite").val())) ){
			$("#quantiteAlert").html("La quantite doit etre un nombre positive !");
			return false;
		
		}else{
			$("#quantiteAlert").html("");
		}

		return true;
	}


// verifying input in modification interfaces 
function verifyModificationInput() {
		
		if ($("#mCode").val() == "") {
			$("#mCode").focus();
			$("#mInvAlert").html("Le code est requis !");
			return false;
			
		}else if(isNaN(parseInt($("#mCode").val())) || parseInt($("#mCode").val())==0 ){
			$("#mInvAlert").html("Le code doit etre un nombre positive !");
			return false;
		
		}else{
			$("#mInvAlert").html("");
		}
		
		if ($("#mQuantite").val() == "") {
			$("#mQuantite").focus();
			$("#mQuantiteAlert").html("La quantité est requise !");
			return false;
			
		}else if(isNaN(parseInt($("#mQuantite").val())) ){
			$("#mQuantiteAlert").html("La quantite doit etre un nombre positive !");
			return false;
		
		}else{
			$("#mQuantiteAlert").html("");
		}

		if ($("#mNom").val() == "") {
			$("#mNom").focus();
			$("#mCArtAlert").html("Le nom est requis !");
			return false;
		
		}else{
			$("#mCArtAlert").html("");
		}


		return true;
	}

// showing Adding new purchase/sasle form
function Ajouter(){
	$("#Ajout").slideDown();
	$("#Modifier").slideUp(1000);
}

// hidinig  new purchase/sasle form
function xAjouter(){
	$("#Ajout").slideUp(1000);
}

// hiding modification  form
function xModifier(){
	$("#Modifier").slideUp(1000);
}

// submit form function 
function Submit(form){
	$(form).submit();
}


// fill inputs in modification interface  
function modifier(idInv,idArt,quantite,date,descr){
	$("#Ajout").slideUp();
	$("#Modifier").slideDown();
	
	$("#mCode").val(idInv);
	$("#mNom").val(idArt);
	$("#mDate").val(date);
	$("#mQuantite").val(quantite);
	$("#mDescription").val(descr);	
}

// Suppression d'un inventaire
function supprimerInv(codeInv){
	    
            swal({
            title: "Attention",
            text: "Êtes-vous sûr de vouloir supprimer ce inventaire !",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: 'Supprimer',
            cancelButtonText: 'Anuller'
            }, function() {
	            $.ajax({
			            type: "POST",
						url: "supprimerInv.do",
						data: "codeInv=" + codeInv,
						success: function(response){
							// we have the response
							//alert(response);
	            	//location.reload();
							window.location.replace("Inventaire.jsp");
						},
						error: function(e){
							alert('Error: ' + e);
					 	}
			    });
            }); 
}


// Suppression d'une achat  (not working !!)
function supp() {
	var is = true;
	  swal({
            title: "Attention",
            text: "Êtes-vous sûr de vouloir supprimer cette achat !",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: 'Supprimer',
            cancelButtonText: 'Anuller'
            }, function() {
	            is = true;
            });
	
	return is;
}

// Suppression d'une achat  using struts with ajax 
function supprimerAchat(codeAchat){
	    
            swal({
            title: "Attention",
            text: "Êtes-vous sûr de vouloir supprimer cette achat !",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: 'Supprimer',
            cancelButtonText: 'Anuller'
            }, function() {
	            $.ajax({
			            type: "POST",
						url: "supprimerAchat.do",
						data: "codeAchat=" + codeAchat,
						success: function(response){
							// we have the response
							//alert(response);
	            	//location.reload();
					window.location.replace("Achat.jsp");
						},
						error: function(e){
							alert('Error: ' + e);
					 	}
			    });
            }); 
}


// Filterring tables
function searchFilter() {
	
	$("#search").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#invTable tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	
}


// Deconnexion
function disconnect(){
			$.ajax({
            type: "POST",
			url: "disconnect.do",
			data: "null = dadsa",
			success: function(response){
				// we have the response
				//alert(response);
          	//location.reload();
				window.location.replace("Home.faces");
			},
			error: function(e){
				alert('Error: ' + e);
		 	}
			    });
		 
		}



