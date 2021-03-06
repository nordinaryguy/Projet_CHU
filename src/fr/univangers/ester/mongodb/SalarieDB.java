package fr.univangers.ester.mongodb;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;

public class SalarieDB extends Database {
	
	private static final String C_SALARIE = "C_SALARIE";

	private static final String IDENTIFIANT = "Identifiant";
	private static final String SEX = "Sexe";
	private static final String BIRTHYEARINF = "Année de naissance inférieure";
	private static final String BIRTHYEARSUP = "Année de naissance supérieure";
	private static final String DEPARTMENT = "Département";
	private static final String ACTIVITYAREA = "Secteur d’activité";
	private static final String FIRSTCONNECTION = "Première connexion";
	private static final String POSTNAME = "Nom du poste";
	private static final String QUESTIONNAIRESANSWERED = "Questionnaires répondus";
	private static final String QUESTIONNAIRESUNANSWERED = "Questionnaires non répondus";
	private static final String ENTREPRISE = "Entreprise";
	private static final String USERESTER = "Utilisateur ESTER ID";
	private static final String NBCONNECTION = "Nombre de connexion";
	private static final String TIMECONNECTION = "Durée de la connexion";
	private static final String ERROR_NO_EXIST = "Salarie n'existe pas.";
	
	public void add(String identifiant, String entreprise, String userEster) {
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		Document salarie = new Document(IDENTIFIANT, identifiant)
				.append(FIRSTCONNECTION, true)
				.append(QUESTIONNAIRESANSWERED, new ArrayList<Document>())
				.append(QUESTIONNAIRESUNANSWERED, new ArrayList<Document>())
				.append(ENTREPRISE, entreprise)
				.append(USERESTER, userEster)
				.append(NBCONNECTION, 0)
				.append(TIMECONNECTION, 0);	
		salaries.insertOne(salarie);
		EntrepriseDB entrepriseDB = new EntrepriseDB();
		entrepriseDB.pushSalarieIntoEntreprise(entreprise, identifiant);
	}
	
	public boolean update(String identifiant, String sex, int birthYearInf, int birthYearSup,
			String department, String activityArea, String postName) {
		if(!exist(identifiant)) {
			throw new IllegalArgumentException(ERROR_NO_EXIST);	
		}
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		return (salaries.findOneAndUpdate(Filters.eq(IDENTIFIANT, identifiant),
			 new Document("$set", new Document(FIRSTCONNECTION, false)
					.append(SEX, sex)
					.append(BIRTHYEARINF, birthYearInf)
					.append(BIRTHYEARSUP, birthYearSup)
					.append(DEPARTMENT, department)
					.append(ACTIVITYAREA, activityArea)
					.append(POSTNAME, postName)))) != null;
	}
	
	public List<String> getIdentifiantSalaries() {
		List<String> identifiantSalaries = new ArrayList<>();
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
	    MongoCursor<Document> cursor = salaries.find().iterator();
	    while(cursor.hasNext())
	    	identifiantSalaries.add(cursor.next().getString(IDENTIFIANT));
	    return identifiantSalaries;
	}
	
	public void delete(String identifiant) {
		if(!exist(identifiant)) {
			throw new IllegalArgumentException(ERROR_NO_EXIST);	
		}
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		salaries.deleteOne(Filters.eq(IDENTIFIANT, identifiant));
	}
	
	public boolean isFirstCnx(String identifiant) {
		boolean res=true;
		if(exist(identifiant)) {
			MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		    FindIterable<Document> iterable = salaries.find(Filters.eq(IDENTIFIANT, identifiant));
			res=iterable.first().getBoolean(FIRSTCONNECTION);
		}
		return res;
	}
	
	public void incCnx(String identifiant) {
		if(!exist(identifiant)) {
			throw new IllegalArgumentException(ERROR_NO_EXIST);	
		}
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		salaries.findOneAndUpdate(Filters.eq(IDENTIFIANT, identifiant),
				new Document("$inc", new Document(NBCONNECTION, 1)));
	}
	
	public List<String> getQuestionnaireAnswered(String identifiant) {
		List<String> questionnaireAnswered = new ArrayList<>();
		if(!exist(identifiant)) {
			throw new IllegalArgumentException(ERROR_NO_EXIST);	
		}
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
	    Document salarie = salaries.find(Filters.eq(IDENTIFIANT, identifiant)).first();
	    if(salarie.get(QUESTIONNAIRESANSWERED) instanceof List<?>) {
		    List<?> objects = (List<?>)salarie.get(QUESTIONNAIRESANSWERED);
	    	for(Object object : objects) {
	    	    if (object instanceof String) {
	    	    	questionnaireAnswered.add((String) object);
	    	    }
	    	}
	    }
	    return questionnaireAnswered;
	}
	
	public String getSex(String identifiant) {
		if(!exist(identifiant)) {
			throw new IllegalArgumentException(ERROR_NO_EXIST);
		}
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		return (String) salaries.find(Filters.eq(IDENTIFIANT, identifiant)).first().get(SEX);
	}
	
	public void pushQuestionnaireAnswered(String identifiantSalarie, String identifiantQuestionnaire) {
		if(!exist(identifiantSalarie)) {
			throw new IllegalArgumentException(ERROR_NO_EXIST);
		}
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		salaries.findOneAndUpdate(Filters.eq(IDENTIFIANT, identifiantSalarie),
				new Document("$push", new Document(QUESTIONNAIRESANSWERED, identifiantQuestionnaire)));
	}
	
	public void pullQuestionnaireAnswered(String identifiantSalarie, String identifiantQuestionnaire) {
		if(!exist(identifiantSalarie)) {
			throw new IllegalArgumentException(ERROR_NO_EXIST);
		}
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		salaries.findOneAndUpdate(Filters.eq(IDENTIFIANT, identifiantSalarie),
				new Document("$pull", new Document(QUESTIONNAIRESANSWERED, identifiantQuestionnaire)));
	}
	
	public List<String> getQuestionnaireUnanswered(String identifiant) {
		List<String> questionnaireUnanswered = new ArrayList<>();
		if(!exist(identifiant)) {
			throw new IllegalArgumentException(ERROR_NO_EXIST);	
		}
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
	    Document salarie = salaries.find(Filters.eq(IDENTIFIANT, identifiant)).first();
	    if(salarie.get(QUESTIONNAIRESUNANSWERED) instanceof List<?>) {
		    List<?> objects = (List<?>)salarie.get(QUESTIONNAIRESUNANSWERED);
	    	for(Object object : objects) {
	    	    if (object instanceof String) {
	    	    	questionnaireUnanswered.add((String) object);
	    	    }
	    	}
	    }
	    return questionnaireUnanswered;
	}
	
	public void pushQuestionnaireUnanswered(String identifiantSalarie, String identifiantQuestionnaire) {
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		salaries.findOneAndUpdate(Filters.eq(IDENTIFIANT, identifiantSalarie),
				new Document("$push", new Document(QUESTIONNAIRESUNANSWERED, identifiantQuestionnaire)));
	}
	
	public void pullQuestionnaireUnanswered(String identifiantSalarie, String identifiantQuestionnaire) {
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		salaries.findOneAndUpdate(Filters.eq(IDENTIFIANT, identifiantSalarie),
				new Document("$pull", new Document(QUESTIONNAIRESUNANSWERED, identifiantQuestionnaire)));
	}
	
	public void changeFirstConnectionSalarie(String identifant, boolean firstConnection) {
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
		salaries.findOneAndUpdate(Filters.eq(IDENTIFIANT, identifant),
				new Document("$set", new Document(FIRSTCONNECTION, firstConnection)));
	}
	
	public boolean exist(String identifiant) {
		MongoCollection<Document> salaries = db().getCollection(C_SALARIE);
	    FindIterable<Document> iterable = salaries.find(Filters.eq(IDENTIFIANT, identifiant));
		return iterable.first() != null;
	}
	
	public boolean connect(String identifiant) {
		return exist(identifiant);
	}
}
