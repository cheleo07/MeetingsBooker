package com.beans;

public class Entreprise {
	private long ident;
	private String noment;
	private String adresseent;
	private String telent;
	private String email;
	//loueur
	private String nom;
	private String prenom;
	private Boolean contacteo_n;
	private Boolean acontacteo_n;
	private String typeinscrirption;
	//private String datefinvalidite;
	
	public long getIdent() {
		return ident;
	}
	public void setIdent(long ident) {
		this.ident=ident;
	}
	
	public String getNoment() {
		return noment;
	}
	public void setNoment(String noment) {
		this.noment=noment;
	}
	
	public String getAdresseent() {
		return adresseent;
	}
	public void setAdresseent(String adresseent) {
		this.adresseent=adresseent;
	}
	
	public String getTelent() {
		return telent;
	}
	public void setTelent(String telent) {
		this.telent=telent;
	}
    
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	//loueur
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom=nom;
	}
	
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom=prenom;
	}
	
	public Boolean getContacteo_n() {
		return contacteo_n;
	}
	public void setContacteo_n(Boolean contacteo_n) {
		this.contacteo_n=contacteo_n;
	}
	
	public Boolean getAcontacteo_n() {
		return acontacteo_n;
	}
	public void setAcontacteo_n(Boolean acontacteo_n) {
		this.acontacteo_n=acontacteo_n;
	}
	
	public String getTypeinscrirption() {
		return typeinscrirption;
	}
	public void setTypeinscrirption(String typeinscrirption) {
		this.typeinscrirption=typeinscrirption;
	}
}