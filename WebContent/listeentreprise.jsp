<%@ page pageEncoding="UTF-8" %>
<%@page import="com.beans.Entreprise"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="form.css" />

    </head>

    <body>
   
	Liste des entreprises:
       <table border=1>
       <tr>
       		<td> nom </td>
       		<td> email </td>
       		<td> date d'inscription </td>
       </tr>
        <% ArrayList<Entreprise> listeinscrits=(ArrayList<Entreprise>) request.getAttribute("listeentreprise"); %>
       
       <% if (listeinscrits!=null)
    	   {
    	   	for (Entreprise entreprise:listeentreprise) { %>
    	   
       
       		<tr>
       			<td>
       		
    				<% out.println(entreprise.getNom()); %>
    			</td>
    			<td>
    	
    				<% out.println(entreprise.getEmail()); %>
    			</td>
    			
    			<td>
    	
    				<% out.println(entreprise.getDateInscription()); %>
    			</td>
      		 </tr>
	   <%		}
    	   }
	   %>
       
       
       </table>
	
<body>

</body>
</html>