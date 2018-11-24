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

	<link rel="stylesheet" href="<c:url value="/css/Acceuil.css"/>">
		<link rel="stylesheet" href="<c:url value="/css/default.css"/>">
	
	<link rel="stylesheet" href="<c:url value="/css/form-patient.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    <script src="<c:url value="/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/js/popper.min.js"/>"></script>
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/js/populateSelect.js"/>"></script>
		
</head>

<body >  

	    <c:import url="/jsp/MenuPage.jsp"/>
  			<div class="row"> 			
  			
  				<div class="col-md-2" style="background: repeating-linear-gradient(-45deg, #0097ae, #0097ae 4px, #00889b 4px, #0097ae 6px);">
			  		<ul class="mt-2" style="color:white;">
				  		<li>
					        <a class="dropdown-toggle" href="#" id="gestionComptesMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:white;">
					          Création de compte
					        </a>		 
								 <div class="dropdown-menu" aria-labelledby="gestionComptesMenu">
						          <a class="dropdown-item" href="#">Préventeurs</a>
						          <a class="dropdown-item" href="#">Infirmiers</a>
						          <a class="dropdown-item" href="#">Assistants</a>
						          <a class="dropdown-item" href="#">Entreprises</a>
						          <a class="dropdown-item" href="<%= request.getContextPath()%>/Medecin?page=createSalarie">Salariés</a>
								</div>
						</li>
						
						<li class="dropdown">
					        <a class="dropdown-toggle" href="#" id="gestionSalariesMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:white;">
					          Gestion des salariés
					        </a>	 
								 <div class="dropdown-menu" aria-labelledby="gestionSalariesMenu">
						         	<a class="dropdown-item" href="#">Liste des salariés</a>
						         	<a class="dropdown-item" href="#">Profil du salarié</a>		
						       	 </div>
						</li>		
				        
						<li class="dropdown">
				       		<a class="dropdown-toggle" href="#" id="gestionQuestionnaireMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:white;">Gestion des questionnaires</a>
						 
							 <div class="dropdown-menu" aria-labelledby="gestionQuestionnaireMenu">
					         	<a class="dropdown-item" href="#">Créer un questionnaire</a>
					         	<a class="dropdown-item" href="#">Modifier un questionnaire</a>
		          			 	<a class="dropdown-item" href="#">Administrer les questionnaires</a>	
					         </div>
					   	</li>	        
				              
				        <li>
				        	<a href="#" style="color:white;">Modifier les valeurs de référence</a>
				        </li>
				        
				        <li>
				        	<a href="#" style="color:white;">Afficher les statistiques</a>
				        </li>
				        
				        <li>
				        	<a href="#" style="color:white;">Exporter les données</a>
				        </li>
				        				  
				    </ul> 
			    </div>
			    
				<div class="col-md-10">
					<div class="container-fluid" style="background:white">
					    <h1>Médecin</h1>
						<p>Bienvenue sur la partie Médecin du Projet ESTER</p>
					</div>
				</div>
			</div> 
			<div class="row container">
				<c:if test="${param.page == 'createSalarie'}">
					<div class="container">
				     <form class="pt-2 row" id="saisi" method="post">
						<input type="submit" value="Génerer code patient ">        
					 </form>  	
					 <p class="row"> 
				     		${ empty message ? '' : message }
				     </p>	  	        
			 		</div>
				</c:if>
			</div>
<<<<<<< HEAD
		</div>
     <c:import url="/jsp/Footer.jsp"/>
=======
			
			
		            <c:import url="/jsp/Footer.jsp"/>
		
    
>>>>>>> connexion/interface_graphic
</body>
</html>