package com.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Entreprise;
import com.dao.DAOFactory;
import com.dao.EntrepriseDao;

public class ListeEntreprise extends HttpServlet{
	
	public static final String CONF_DAO_FACTORY = "daofactory";

    public static final String ATT_LISTUSER         = "listeentreprise";

    public static final String VUE              = "/listeentreprise.jsp";


    private EntrepriseDao     entrepriseDao;


    public void init() throws ServletException {

        /* Récupération d'une instance de notre DAO Utilisateur */

        this.entrepriseDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getEntrepriseDao();

    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

       
    	ArrayList<Entreprise> listeentreprise = entrepriseDao.trouverTous();
    	request.setAttribute( ATT_LISTUSER, listeentreprise );

        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }


    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

       this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }

}
