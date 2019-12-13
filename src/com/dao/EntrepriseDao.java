package com.dao;

import java.util.ArrayList;

import com.beans.Entreprise;

public interface EntrepriseDao {
	
    void creer( Entreprise entreprise ) throws DAOException;
    ArrayList<Entreprise> trouverTous() throws DAOException;

}
