<%@ page pageEncoding="UTF-8" %>
<%@page import="com.beans.Entreprise"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="form.css" />

    </head>

    <body>
   
	Liste des entreprises:
       <br></br>
       <table border=1>
       <tr>
       		<td> nom entreprise </td>
       		<td> adresse entreprise </td>
       		<td> nom loueur</td>
       		<td> prenom loueur</td>
       		<td> type d'inscription </td>
       </tr>
        <% ArrayList<Entreprise> listeEntreprise=(ArrayList<Entreprise>) request.getAttribute("listentreprise"); %>
       
       <% if (listeEntreprise!=null)
    	   {
    	   	for (Entreprise entreprise:listeEntreprise) { %>
    	   	
       
       		<tr>
       			<td>
       		
    				<% out.println(entreprise.getNoment()); %>
    			</td>
    			<td>
    	
    				<% out.println(entreprise.getAdresseent()); %>
    			</td>
    			
    			<td>
    	
    				<% out.println(entreprise.getNom()); %>
    			</td>
    			<td>
    	
    				<% out.println(entreprise.getPrenom()); %>
    			</td>
    			<td>
    	
    				<% out.println(entreprise.getTypeinscrirption()); %>
    			</td>
      		 </tr>
	   <%		}
    	   }
	   %>
	   </table>
	   <br></br>
	   Selectionnez une entreprise:
	   <br></br>
		<form>
		<select>
			<% ArrayList<Entreprise> listeEntreprises=(ArrayList<Entreprise>) request.getAttribute("listentreprise"); %>
       
       <% if (listeEntreprise!=null)
    	   {
    	   	for (Entreprise entreprise:listeEntreprise) { %>
    	   	<option><% out.println(entreprise.getNoment()); %> <% out.println(entreprise.getAdresseent()); %></option>
	   <%		}
    	   }
	   %>
		</select>
		</form>
	
<body>

</body>
</html>