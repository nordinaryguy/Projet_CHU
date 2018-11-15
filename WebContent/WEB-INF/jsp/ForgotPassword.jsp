<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr-FR">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="UA.png">

    <title>ESTER</title>

    <!-- Bootstrap core CSS -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <!-- Custom styles for this template -->
    <link href="/Projet_ESTER/css/Accueil.css" rel="stylesheet">
  </head>

  <body>
  	<div class="row">
		    <form class="form-signin" method="post">
			  <div class="text-center mb-4">
			            
			        <div class="row">
			       		 <div class="col-md-6 pl-2"><img class="mb-4" src="http://ester.univ-angers.fr/_resources-images/logo/logo-labo_max0x0.png" alt="" width="205" height="90"></div>
			       		 <div class="col-md-6 pr-2"><img class="mb-4" src="http://www.univ-angers.fr/_contents-images/ametys-internal%253Asites/univangers/ametys-internal%253Acontents/logo-article-8/_metadata/content/_data/ua_h_couleur_ecran.png_57x189" alt="" width="189" height="57"></div>
			       </div>    
		      
		           
			       <div class="row">        
			      		 <div class="col-md-12 col-centered "><h5 class="h5 mb-3 font-weight-normal">Veuillez saisir votre email</h5></div>
			       </div>
		
				 	<div class="form-label-group">
				        <input type="email" name="Email" value="${empty email ? '' : email}" class="form-control"  required>
				        <label for="Email">email</label>
				    </div>
				    <!-- afficher email envoyer ou email non existant -->
				     <div class="row">  
			      		 <div class="col-md-12 col-centered "><strong style="color:red"> ${message } </strong></div>
			        </div>
				   <button class="btn btn-lg btn-primary btn-block" type="submit">VALIDER</button>
		    
			     <div class="row pt-2">
			 		<div class="col-md-6 pr-6" ><a href="Accueil.html">Page d'Accueil</a></div>
				 </div>
			 </div>	             
		   </form>
		   <div class="row mb-2 text-muted text-center fixed-bottom right">
		 		<div class="col-md-4 pr-1" ><a href="#">Inscription</a></div>
		 		 <div class="col-md-4" ><a href="#">Projet</a></div>
		 		<div class="col-md-4  pl-1" ><a href="#">Contacts</a></div>
		  </div>
    </div>
  </body>
</html>