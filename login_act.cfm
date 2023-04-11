<cfoutput>
  <cfsetting showDebugOutput="No">

  <cfquery name="getUser" datasource="higher">
    SELECT *
    FROM users
    WHERE username = '#form.username#'
  </cfquery>
  
  <!--- Validate user input --->

  <cfif getUser.recordCount eq 0>
    Swal.fire({
      title: 'Oops',
      text: 'Wrong Username or Password',
      icon: 'danger',
      confirmButtonText: 'Okay'
    })
  <cfelse>
    <cfif getUser.password neq form.password>
      Swal.fire({
        title: 'Oops',
        text: 'Wrong Username or Password',
        icon: 'warning',
        confirmButtonText: 'Okay'
      })
    <cfelse>
      <!--- Start a session --->

      <cfset session.userID = getUser.id>
      <cfset session.userName = getUser.fullname>
      Swal.fire({
        title: 'You Are Logged In',
        text: 'Lets Go!',
        icon: 'success',
        confirmButtonText: 'Okay'
      }).then((result) => {
        window.location.href = "intro.cfm";
      });
    </cfif>
  </cfif>

</cfoutput>