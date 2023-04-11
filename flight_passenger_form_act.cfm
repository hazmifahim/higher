
<cfoutput>
<cfsetting showDebugOutput="No">

<cfif isDefined('form.action') AND form.action EQ 'register'>

   <cfquery name="register" datasource="higher">
      INSERT INTO passenger 
         (
            flight_id,
            `name`,
            age_type,
            pilot_id,
            driver_id
         )
      VALUES 
         (
            #form.flight_id#,
            '#form.name#',
            #form.age_type#,
            #form.pilot_id#,
            #form.driver_id#
         )
   </cfquery>

   Swal.fire({
      title: 'Passenger Has Been Registered',
      text: 'Lets Go!',
      icon: 'success',
      confirmButtonText: 'Okay'
   }).then((result) => {

      BootstrapDialog.closeAll();

      if (typeof reload_reg_passenger_list == 'function')
			{
				reload_reg_passenger_list();
			}
   });

</cfif>

<cfif isDefined('form.action') AND form.action EQ 'delete'>

   <cfquery name="register" datasource="higher">
      DELETE 
      FROM passenger 
      WHERE id = #form.id#
   </cfquery>

   Swal.fire({
      title: 'Passenger Deleted',
      text: 'Lets Go!',
      icon: 'success',
      confirmButtonText: 'Okay'
   }).then((result) => {

      if (typeof reload_reg_passenger_list == 'function')
			{
				reload_reg_passenger_list();
			}
   });
   
</cfif>

</cfoutput>