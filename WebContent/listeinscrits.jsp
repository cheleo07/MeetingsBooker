<%@ page pageEncoding="UTF-8" %>
<%@page import="com.beans.Utilisateur"%>
<%@page import="java.util.ArrayList"%>



<!DOCTYPE html>

<html>

    <head>

        <meta charset="utf-8" />

        <title>Liste des inscrits</title>

        <link type="text/css" rel="stylesheet" href="form.css" />

    </head>

    <body>
   
	Liste des inscrits:
       <table border=1>
       <tr>
       		<td> nom </td>
       		<td> email </td>
       		<td> date d'inscription </td>
       </tr>
        <% ArrayList<Utilisateur> listeinscrits=(ArrayList<Utilisateur>) request.getAttribute("listeinscrits"); %>
       
       <% if (listeinscrits!=null)
    	   {
    	   	for (Utilisateur inscrit:listeinscrits) { %>
    	   
       
       		<tr>
       			<td>
       		
    				<% out.println(inscrit.getNom()); %>
    			</td>
    			<td>
    	
    				<% out.println(inscrit.getEmail()); %>
    			</td>
    			
    			<td>
    	
    				<% out.println(inscrit.getDateInscription()); %>
    			</td>
      		 </tr>
	   <%		}
    	   }
	   %>
       
       
       </table>
	
    </body>

</html>