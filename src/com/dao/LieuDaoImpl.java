package com.dao;

import static com.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Lieu;

public class LieuDaoImpl implements LieuDao{

	 private static final String SQL_SELECT = "SELECT idlieu, idcateg, libellelieu FROM lieu";
	    private static final String SQL_INSERT = "INSERT INTO lieu (idlieu, idcateg, idphoto, idville, ident, libellelieu, coordx, coordy, annulationgratuite, nbetoiles, descriptif) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    private DAOFactory          daoFactory;

	    LieuDaoImpl( DAOFactory daoFactory ) {
	        this.daoFactory = daoFactory;
	    }

	    /* Implémentation de la méthode définie dans l'interface LieuDao 
	    @Override
	    public Entreprise trouver( String email ) throws DAOException {
	        return trouver( SQL_SELECT_PAR_EMAIL, email );
	    }*/
	    /* Implémentation de la méthode définie dans l'interface LieuDao */
	    @Override
	    public ArrayList<Lieu> trouverTous() throws DAOException {
	    	  	return trouverTous( SQL_SELECT);
	    }

	    /* Implémentation de la méthode définie dans l'interface EntrepriseDao */
	    @Override
	    public void creer( Lieu lieu ) throws DAOException {
	        Connection connexion = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet valeursAutoGenerees = null;

	        try {
	            connexion = daoFactory.getConnection();
	            preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT, true);
	            int statut = preparedStatement.executeUpdate();
	            if ( statut == 0 ) {
	                throw new DAOException( "Échec de la création du lieu , aucune ligne ajoutée dans la table." );
	            }
	            valeursAutoGenerees = preparedStatement.getGeneratedKeys();
	            if ( valeursAutoGenerees.next() ) {
	            	lieu.setIdent( valeursAutoGenerees.getLong( 1 ) );//String->Long error
	            } else {
	                throw new DAOException( "Échec de la création du lieu en base, aucun ID auto-généré retourné." );
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
	    private Lieu trouver( String sql, Object... objets ) throws DAOException {
	        Connection connexion = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        Lieu lieu = null;

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
	            	lieu = map( resultSet );
	            }
	        } catch ( SQLException e ) {
	            throw new DAOException( e );
	        } finally {
	            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
	        }

	        return lieu;
	    }

	    /*
	     * Méthode générique utilisée pour retourner un utilisateur depuis la base
	     * de données, correspondant à la requête SQL donnée prenant en paramètres
	     * les objets passés en argument.
	     */
	    private ArrayList<Lieu> trouverTous( String sql, Object... objets ) throws DAOException {
	        Connection connexion = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        Lieu lieu = null;
	        ArrayList<Lieu> listelieu=new ArrayList<Lieu>();

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
	            	
	            	lieu = map( resultSet );
	                //System.out.println("nom:"+ lieu.getNom());
	                listelieu.add(lieu);
	            }
	        } catch ( SQLException e ) {
	            throw new DAOException( e );
	        } finally {
	            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
	        }

	        return listelieu;
	    }

	    
	    /*
	     * Simple méthode utilitaire permettant de faire la correspondance (le
	     * mapping) entre une ligne issue de la table des utilisateurs (un
	     * ResultSet) et un bean Utilisateur.
	     */
	    private static Lieu map( ResultSet resultSet ) throws SQLException {
	    	Lieu lieu = new Lieu();
	    	lieu.setIdlieu( resultSet.getString( "idlieu" ) );
	    	lieu.setIdcateg( resultSet.getString( "idcateg" ) );
	    	lieu.setIdphoto( resultSet.getString( "idphoto" ) );
	    	lieu.setIdville( resultSet.getString( "idville" ) );
	    	lieu.setIdent( resultSet.getLong( "ident" ) );
	    	lieu.setLibellelieu( resultSet.getString( "libellelieu" ) );
	    	lieu.setCoordx( resultSet.getString( "coordx" ) );
	    	lieu.setCoordy( resultSet.getString( "coordy" ) );
	    	lieu.setAnnulationgratuite( resultSet.getBoolean( "annulationgratuite" ) );
	    	lieu.setNbetoiles( resultSet.getString( "nbetoiles" ) );
	    	lieu.setDescriptif( resultSet.getString( "descriptif" ) );
	        return lieu;
	    }
		
}
