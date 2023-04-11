<cfoutput>
<!--- Check if the user is logged in --->
<cfif not structKeyExists(session, "userID")>
  <cflocation url="check.cfm">
</cfif>

<!--- Display secure content --->
<h1>Welcome!</h1>
<p>You are now logged in and can access the secure content.</p>

#session.userID#
#session.userName#
</cfoutput>