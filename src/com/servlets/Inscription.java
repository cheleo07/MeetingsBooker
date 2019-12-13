package com.servlets;

import java.io.IOException;


import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import com.beans.Utilisateur;

import com.dao.DAOFactory;

import com.dao.UtilisateurDao;




public class Inscription extends HttpServlet {
	
	private static final String CHAMP_EMAIL      = "email";
	private static final String CHAMP_PASS       = "motdepasse";
	private static final String CHAMP_CONF       = "confirmation";
	private static final String CHAMP_NOM        = "nom";

    public static final String CONF_DAO_FACTORY = "daofactory";

    public static final String ATT_USER         = "utilisateur";
    public static final String ATT_VALIDATION         = "validation";

        public static final String VUE              = "/inscription.jsp";


    private UtilisateurDao     utilisateurDao;


    public void init() throws ServletException {

        /* Récupération d'une instance de notre DAO Utilisateur */

        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();

    }


    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        /* Affichage de la page d'inscription */

        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }


    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
    	
    	/* Traitement de la requête et création du bean en résultant */
    	
    	String email =  request.getParameter( CHAMP_EMAIL  );
        String motDePasse =  request.getParameter ( CHAMP_PASS );
        String confirmation =  request.getParameter ( CHAMP_CONF );
        String nom =  request.getParameter ( CHAMP_NOM );
        
        String validation;
        
        Utilisateur utilisateur = new Utilisateur();
        if ((email!=null)&&(email.trim().length()!=0)&&(motDePasse!=null)&&(motDePasse.trim().length()!=0)&&(confirmation!=null)&&(confirmation.trim().length()!=0)&&(nom!=null)&&(nom.trim().length()!=0))
        {
        	utilisateur.setEmail(email);
        	utilisateur.setMotDePasse(motDePasse);
        	utilisateur.setNom(nom);
        	
        	utilisateurDao.creer( utilisateur );
        	
        	validation="succes";
        }
        else
        {
        	validation="echec";
        }


        /* Stockage  du bean dans l'objet request */
        request.setAttribute( ATT_VALIDATION, validation );
        request.setAttribute( ATT_USER, utilisateur );

        /*Routage vers la vue d'inscription*/
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }

}