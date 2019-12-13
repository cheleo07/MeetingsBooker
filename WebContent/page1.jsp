<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Hello world!
<% for (int i=0;i<10;i++)
{
	out.println("i="+i+"<br/>");
}
%>

<%@page import="com.beans.Utilisateur"%>
       
<% 

Utilisateur user=new Utilisateur();
user.setNom("DUPOND");

out.println("user:"+user.getNom()+"<br/>");
%>

<%@page import="com.dao.UtilisateurDao"%>
<%@page import="com.dao.DAOFactory"%>
<%@page import="java.util.ArrayList"%>

       
<% 


DAOFactory ladaofactory=DAOFactory.getInstance();

UtilisateurDao userdao=ladaofactory.getUtilisateurDao();
ArrayList<Utilisateur> lesusers=userdao.trouverTous();

out.println("<br/>Utilisateurs de la base de donnees:<br/>");
for(Utilisateur unuser:lesusers)
{
	out.println("nom:"+unuser.getNom()+"<br/>");
}


%>

</body>
</html>