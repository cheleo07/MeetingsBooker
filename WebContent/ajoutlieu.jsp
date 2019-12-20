<%@ page pageEncoding="UTF-8" %>
<%@page import="com.beans.Lieu"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />

        <title>AjoutLieu</title>

        <link type="text/css" rel="stylesheet" href="form.css" />

</head>

<body>
		<% Lieu lieu= (Lieu) request.getAttribute("lieu"); 
		   String  validation=(String) request.getAttribute("validation"); 
		String libelle="";
		if (validation!=null)
		   if ((lieu!=null)&&(validation.equals("echec")))
		   {
			   libelle=lieu.getLibellelieu(); 
		   }
		   
		   	
		%>
		
        <form method="post" action="inscription">

            <fieldset>

                <legend>Ajout lieu</legend>

                <p>Ajoutez un lieu:</p>


                <label for="libelle">Nom <span class="requis">*</span></label>

                <input type="text" id="nom" name="nom" value="<% if (libelle!=null) out.println(libelle); %>" size="20" maxlength="60" />

                

                <br />


                <label for="coordx">Coordonnée X <span class="requis">*</span></label>

                <input type="text" id="coordx" name="coordx" value="" size="20" maxlength="20" />

               

                <br />


                <label for="coordy">Coordonnée Y <span class="requis">*</span></label>

                <input type="text" id="coordy" name="coordy" value="" size="20" maxlength="20" />

                

                <br />


                <label for="etoiles">Nombre d'étoiles</label>

                <input type="text" id="etoiles" name="etoiles" value="" size="20" maxlength="20" />
                
                
                <br />


                <label for="descriptif">Descriptif</label>

                <input type="text" id="descriptif" name="descriptif" value="" size="20" maxlength="20" />

               

                <br />


                <input type="submit" value="AjoutLieu" class="sansLabel" />

                <br />

                
				<% if(validation !=null)
					if(validation.equals("succes")) 
					{
				%>
                	<p class="succes">Succès de l'ajout</p>
                <%
                	}
					else
					{
				%>
					<p class="erreur">Echec de l'ajout</p>
				<%
					}
				%>

            </fieldset>

        </form>

<body>

</body>
</html>