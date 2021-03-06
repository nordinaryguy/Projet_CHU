package fr.univangers.ester.beans;

import fr.univangers.ester.mongodb.EntrepriseDB;

public class Entreprise implements UtilisateurBeans {

	private String identifiant;
	private String password;

	@Override
	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}

	@Override
	public String getIdentifiant() {
		return identifiant;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}

	@Override
	public boolean validate() {
		EntrepriseDB entrepriseDB = new EntrepriseDB();
		return entrepriseDB.connect(identifiant, password);
	}

	@Override
	public boolean isEntreprise() {
		return true;
	}

	@Override
	public boolean isSalarie() {
		return false;
	}

	@Override
	public boolean isUtilisateur() {
		return false;
	}

	@Override
	public boolean isAdministrateur() {
		return false;
	}

	@Override
	public boolean isMedecin() {
		return false;
	}

	@Override
	public boolean isPreventeur() {
		return false;
	}

	@Override
	public boolean isAssistant() {
		return false;
	}

	@Override
	public boolean isInfirmier() {
		return false;
	}

	@Override
	public boolean isFirstConnection() {
		EntrepriseDB entrepriseDB = new EntrepriseDB();
		return entrepriseDB.isFirstCnx(identifiant);
	}

}
