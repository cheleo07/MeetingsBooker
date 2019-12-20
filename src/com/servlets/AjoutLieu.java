package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Lieu;
import com.dao.DAOFactory;
import com.dao.LieuDao;

public class AjoutLieu extends HttpServlet{

	private static final String CHAMP_EMAIL      = "email";
	private static final String CHAMP_PASS       = "motdepasse";
	private static final String CHAMP_CONF       = "confirmation";
	private static final String CHAMP_NOM        = "nom";

    public static final String CONF_DAO_FACTORY = "daofactory";

    public static final String ATT_USER         = "lieu";
    public static final String ATT_VALIDATION         = "validation";

        public static final String VUE              = "/ajoutlieu.jsp";


    private LieuDao lieudao;


    public void init() throws ServletException {

        /* Récupération d'une instance de notre DAO Utilisateur */

        this.lieudao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getLieuDao();

    }


    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        /* Affichage de la page d'inscription */

        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }


    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
    	
    	/* Traitement de la requête et création du bean en résultant */
    	
    	String libelle =  request.getParameter( CHAMP_NOM );
        String coordx =  request.getParameter ( CHAMP_NOM );
        String coordy =  request.getParameter ( CHAMP_NOM );
        //String annulation =  request.getParameter ( CHAMP_CONF );
        String etoiles =  request.getParameter ( CHAMP_NOM );
        String descriptif =  request.getParameter ( CHAMP_NOM );
        
        String validation;
        
        Lieu lieu = new Lieu();
        if ((libelle!=null)&&(libelle.trim().length()!=0)&&(coordx!=null)&&(coordx.trim().length()!=0)&&(coordy!=null)&&(coordy.trim().length()!=0)&&(etoiles!=null)&&(etoiles.trim().length()!=0)&&(descriptif!=null)&&(descriptif.trim().length()!=0))
        {
        	lieu.setLibellelieu(libelle);
        	lieu.setCoordx(coordx);
        	lieu.setCoordy(coordy);
        	lieu.setNbetoiles(etoiles);
        	lieu.setDescriptif(descriptif);
        	
        	lieudao.creer( lieu );
        	
        	validation="succes";
        }
        else
        {
        	validation="echec";
        }


        /* Stockage  du bean dans l'objet request */
        request.setAttribute( ATT_VALIDATION, validation );
        request.setAttribute( ATT_USER, lieu );

        /*Routage vers la vue d'inscription*/
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }
}
