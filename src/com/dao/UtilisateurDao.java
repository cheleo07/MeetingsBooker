package com.dao;

import java.util.ArrayList;

import com.beans.Utilisateur;

public interface UtilisateurDao {

    void creer( Utilisateur utilisateur ) throws DAOException;

    Utilisateur trouver( String email ) throws DAOException;
    
    ArrayList<Utilisateur> trouverTous() throws DAOException;

}