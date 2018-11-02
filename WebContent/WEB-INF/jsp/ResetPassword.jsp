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
    <script src="/Projet_ESTER/js/checkPass.js"></script>
    <!-- Custom styles for this template -->
    <link href="/Projet_ESTER/CSS/Accueil.css" rel="stylesheet">
     <link rel="stylesheet" href="/Projet_ESTER/CSS/form-reset.css">
  </head>

  <body>
  	<div class="row">
			  <div class="text-center mb-4">
			            
			        <div class="row">
			       		 <div class="col-md-6 pl-2"><img class="mb-4" src="http://ester.univ-angers.fr/_resources-images/logo/logo-labo_max0x0.png" alt="" width="205" height="90"></div>
			       		 <div class="col-md-6 pr-2"><img class="mb-4" src="http://www.univ-angers.fr/_contents-images/ametys-internal%253Asites/univangers/ametys-internal%253Acontents/logo-article-8/_metadata/content/_data/ua_h_couleur_ecran.png_57x189" alt="" width="189" height="57"></div>
			       </div>    
		      
		           
			       <div class="row">
						<form class="form-reset" method="post">
				            <div class="form-title-row">
				                <h3>Veuillez entrer un nouveau mot de passe  </h3>
				            </div>
							<div class="form-row">	
				               <div class="col-xs-12 center-block text-center"> 
				               		<strong>${message} </strong>
				               </div>
				            </div>
				            <div class="form-row">
								<span>Email : </span> 		
				               <div class="col-xs-12 center-block text-center"> 
				               		<strong>${email} </strong>
				               </div>
				            </div>
				            
				            <div class="form-row">
				          		<label for=#password>
									Nouveau mot de passe : 
								</label>		
				                 <input type='password' name='password' id='pass_1' onkeyup="return passwordChanged();" required>
				            	 <span id="strength" class="col col-xs-2"></span>
				            </div> 
				            <div class="row" >
				          		
				          	</div>
				           <div class="form-row">
				          		<label>
									Confirmer le mot de passe : 	
								</label>	
				                <input type="password" name="passwordConfirm" id="pass_2" onBlur="checkPass()" required>
				           </div>
				           <div id="divcomp">
				          	<div class="row" >
				          		
				          	</div>
				          </div>
				          <div class="row showPass">
				            	 <label><input type="checkbox" id="showPass" onchange="document.getElementById('pass_2').type = this.checked ? 'text' : 'password';document.getElementById('pass_1').type = this.checked ? 'text' : 'password'">Mot de passe visible</label>
				          </div>
				          <div class="row">
				          	<button id="submit" class="btn  btn-primary" type="submit" disabled>VALIDER</button>
				          </div>
				       </form>
				</div>
			</div>	             
		   <div class="row mb-2 text-muted text-center fixed-bottom right">
		 		<div class="col-md-4 pr-1" ><a href="#">Inscription</a></div>
		 		 <div class="col-md-4" ><a href="#">Projet</a></div>
		 		<div class="col-md-4  pl-1" ><a href="#">Contacts</a></div>
		  </div>
    </div>
  </body>
</html>