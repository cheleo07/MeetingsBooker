<%@ page pageEncoding="UTF-8" %>
<%@page import="com.beans.Utilisateur"%>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="utf-8" />

        <title>Inscription</title>

        <link type="text/css" rel="stylesheet" href="form.css" />

    </head>

    <body>
		<% Utilisateur utilisateur= (Utilisateur) request.getAttribute("utilisateur"); 
		   String  validation=(String) request.getAttribute("validation"); 
		String email="";
		String nom="";
		if (validation!=null)
		   if ((utilisateur!=null)&&(validation.equals("echec")))
		   {
			   email=utilisateur.getEmail(); 
			   nom=utilisateur.getNom(); 
		   }
		   
		   	
		%>
		
        <form method="post" action="inscription">

            <fieldset>

                <legend>Inscription</legend>

                <p>Vous pouvez vous inscrire via ce formulaire.</p>


                <label for="email">Adresse email <span class="requis">*</span></label>

                <input type="email" id="email" name="email" value="<% if (email!=null) out.println(email); %>" size="20" maxlength="60" />

                

                <br />


                <label for="motdepasse">Mot de passe <span class="requis">*</span></label>

                <input type="password" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" />

               

                <br />


                <label for="confirmation">Confirmation du mot de passe <span class="requis">*</span></label>

                <input type="password" id="confirmation" name="confirmation" value="" size="20" maxlength="20" />

                

                <br />


                <label for="nom">Nom d'utilisateur</label>

                <input type="text" id="nom" name="nom" value="<% if (nom!=null) out.println(nom);%>" size="20" maxlength="20" />

               

                <br />


                <input type="submit" value="Inscription" class="sansLabel" />

                <br />

                
				<% if(validation !=null)
					if(validation.equals("succes")) 
					{
				%>
                	<p class="succes">Succès de l'inscription</p>
                <%
                	}
					else
					{
				%>
					<p class="erreur">Echec de l'inscription</p>
				<%
					}
				%>

            </fieldset>

        </form>

    </body>

</html>