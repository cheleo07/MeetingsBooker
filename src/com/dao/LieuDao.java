package com.dao;

import java.util.ArrayList;

import com.beans.Lieu;

public interface LieuDao {

	void creer( Lieu lieu ) throws DAOException;
    ArrayList<Lieu> trouverTous() throws DAOException;
}
