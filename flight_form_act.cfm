
<cfoutput>
<cfsetting showDebugOutput="No">

<cfquery name="register" datasource="higher" result="res">
   INSERT INTO flight 
      (
         fullname, 
         ic_num, 
         location_id,
         pax_qty,
         adult,
         children,
         nationality,
         flight_dt,
         video_qty,
         total_payment,
         lt_status_id,
         created_id,
         created_dt
      )
   VALUES 
      (
         '#form.fullname#',
         '#form.ic_num#',
         #form.location_id#,
         '#form.adult#' + '#form.children#',
         '#form.adult#',
         '#form.children#',
         #form.nationality#,
         #createODBCDateTime(dateformat(form.flight_dt,'dd-mm-yyyy'))#,
         '#form.video_qty#',
         #REReplace(form.total_payment,',','','all')#,
         3,
         #session.userID#,
         #createODBCDateTime(NOW())#

      )
</cfquery>

Swal.fire({
   title: 'Flight Has Been Registered',
   text: 'Lets Go!',
   icon: 'success',
   confirmButtonText: 'Okay'
 }).then((result) => {
   loadContent("flight_passenger_list.cfm?id=#res.generated_key#");
 });

</cfoutput>