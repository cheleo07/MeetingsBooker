package com.beans;

public class Entreprise {
	private String ident;
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
	//reservant
	private String numcb;
	private String nomtitulaire;
	private String code;
	private String datefinvalidite;
	
	public String getIdent() {
		return ident;
	}
	public void setIdent(String ident) {
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
	//reservant
	public String getNumcb() {
		return numcb;
	}
	public void setNumcb(String numcb) {
		this.numcb=numcb;
	}
	
	public String getNomtitulaire() {
		return nomtitulaire;
	}
	public void setNomtitulaire(String nomtitulaire) {
		this.nomtitulaire=nomtitulaire;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code=code;
	}
	
	public String getDatefinvalidite() {
		return datefinvalidite;
	}
	public void setDatefinvalidite(String datefinvalidite) {
		this.datefinvalidite=datefinvalidite;
	}
	
}
