package com.dao;

import static com.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Entreprise;

public class EntrepriseDaoImpl implements EntrepriseDao{
	private static final String SQL_SELECT_PAR_EMAIL = "SELECT id, email, nom, mot_de_passe, date_inscription FROM Utilisateur WHERE email = ?";
    private static final String SQL_SELECT = "SELECT id, email, nom, mot_de_passe, date_inscription FROM Utilisateur";
    private static final String SQL_INSERT           = "INSERT INTO Utilisateur (email, mot_de_passe, nom, date_inscription) VALUES (?, ?, ?, NOW())";

    private DAOFactory          daoFactory;

    EntrepriseDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    /* Implémentation de la méthode définie dans l'interface EntrepriseDao 
    @Override
    public Entreprise trouver( String email ) throws DAOException {
        return trouver( SQL_SELECT_PAR_EMAIL, email );
    }*/
    /* Implémentation de la méthode définie dans l'interface EntrepriseDao */
    @Override
    public ArrayList<Entreprise> trouverTous() throws DAOException {
    	  	return trouverTous( SQL_SELECT);
    }

    /* Implémentation de la méthode définie dans l'interface EntrepriseDao */
    @Override
    public void creer( Entreprise entreprise ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT, true, entreprise.getEmail(), entreprise.getTypeinscrirption(), entreprise.getNoment() );
            int statut = preparedStatement.executeUpdate();
            if ( statut == 0 ) {
                throw new DAOException( "Échec de la création de l'entreprise, aucune ligne ajoutée dans la table." );
            }
            valeursAutoGenerees = preparedStatement.getGeneratedKeys();
            if ( valeursAutoGenerees.next() ) {
            	entreprise.setIdent( valeursAutoGenerees.getLong( 1 ) );//String->Long
            } else {
                throw new DAOException( "Échec de la création de l'entreprise en base, aucun ID auto-généré retourné." );
            }
        } catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( valeursAutoGenerees, preparedStatement, connexion );
        }
    }

    /*
     * Méthode générique utilisée pour retourner une l'entreprise depuis la base
     * de données, correspondant à la requête SQL donnée prenant en paramètres
     * les objets passés en argument.
     */
    private Entreprise trouver( String sql, Object... objets ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Entreprise entreprise = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            /*
             * Préparation de la requête avec les objets passés en arguments
             * (ici, uniquement une adresse email) et exécution.
             */
            preparedStatement = initialisationRequetePreparee( connexion, sql, false, objets );
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de données retournée dans le ResultSet */
            if ( resultSet.next() ) {
            	entreprise = map( resultSet );
            }
        } catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return entreprise;
    }

    /*
     * Méthode générique utilisée pour retourner un utilisateur depuis la base
     * de données, correspondant à la requête SQL donnée prenant en paramètres
     * les objets passés en argument.
     */
    private ArrayList<Entreprise> trouverTous( String sql, Object... objets ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Entreprise entreprise = null;
        ArrayList<Entreprise> listeentreprise=new ArrayList<Entreprise>();

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            /*
             * Préparation de la requête avec les objets passés en arguments
             * (ici, uniquement une adresse email) et exécution.
             */
            preparedStatement = initialisationRequetePreparee( connexion, sql, false, objets );
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de données retournée dans le ResultSet */
            while ( resultSet.next() ) {
            	
            	entreprise = map( resultSet );
                System.out.println("nom:"+ utilisateur.getNom());
                listeutilisateurs.add(utilisateur);
            }
        } catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return listeutilisateurs;
    }

    
    /*
     * Simple méthode utilitaire permettant de faire la correspondance (le
     * mapping) entre une ligne issue de la table des utilisateurs (un
     * ResultSet) et un bean Utilisateur.
     */
    private static Utilisateur map( ResultSet resultSet ) throws SQLException {
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setId( resultSet.getLong( "id" ) );
        utilisateur.setEmail( resultSet.getString( "email" ) );
        utilisateur.setMotDePasse( resultSet.getString( "mot_de_passe" ) );
        utilisateur.setNom( resultSet.getString( "nom" ) );
        utilisateur.setDateInscription( resultSet.getTimestamp( "date_inscription" ) );
        return utilisateur;
    }
	
}
