
<cfoutput>
<cfsetting showDebugOutput="No">


   <cfif isDefined('form.action') AND form.action EQ 'register'>

      <cfquery name="chck_task" datasource="higher">
         SELECT COUNT(id) AS total
         FROM `pilot_task`
         WHERE pilot_id = #form.pilot_id#
         AND DATE_FORMAT(task_dt, "%m/%d/%Y") = '#form.flight_dt#'
      </cfquery>

      <cfif chck_task.total EQ 0>

         <cfquery name="reg_task" datasource="higher" result="new_task_id">
            INSERT INTO `pilot_task`
               (
                  task_dt,
                  pilot_id,
                  flight_qty
               )
            VALUES 
               (
                  #createODBCDate(form.flight_dt)#,
                  #form.pilot_id#,
                  '0'
               )
         </cfquery>

         <cfset task_id = new_task_id.generated_key>

      <cfelse>

         <cfquery name="task" datasource="higher">
            SELECT id
            FROM `pilot_task`
            WHERE pilot_id = #form.pilot_id#
            AND DATE_FORMAT(task_dt, "%m/%d/%Y") = '#form.flight_dt#'
         </cfquery>

         <cfset task_id = task.id>

      </cfif>

      <cfquery name="register" datasource="higher" result="res">
         INSERT INTO `pilot_task_flight` 
            (
               flight_dt,
               task_id,
               ref_num,
               passenger_num,
               pilot_id,
               camera,
               lt_status_id,
               created_id,
               created_dt
            )
         VALUES 
            (
               #createODBCDateTime(form.flight_dt)#,
               #task_id#,
               '#form.ref_num#',
               '#form.passenger_num#',
               #form.pilot_id#,
               '#form.camera#',
               1,
               #session.userID#,
               #NOW()#
            )
      </cfquery>

      <cfquery name="chk_qty" datasource="higher">
         SELECT flight_qty
         FROM `pilot_task`
         WHERE id = #task_id#
      </cfquery>

      <cfquery name="add_qty" datasource="higher">
         UPDATE `pilot_task`
         SET flight_qty = #chk_qty.flight_qty# + 1
         WHERE id = #task_id#
      </cfquery>

      <cfquery name="dsp_qty" datasource="higher">
         SELECT flight_qty
         FROM `pilot_task`
         WHERE id = #task_id#
      </cfquery>

      Swal.fire({
         title: 'Pilot Flight Has Been Registered',
         text: 'Lets Go!',
         icon: 'success',
         confirmButtonText: 'Okay'
      }).then((result) => {
         BootstrapDialog.closeAll();
         $('##dsp_task_qty').text(#dsp_qty.flight_qty#)
         if (typeof reload_pilot_flight_list == 'function')
         {
             reload_pilot_flight_list();
         }
       });
      
   </cfif>

   <cfif isDefined('form.action') AND form.action EQ 'update'>

      <cfquery name="update" datasource="higher">
         UPDATE `pilot_task_flight`
         SET 
            passenger_num = '#form.passenger_num#',
            camera = '#form.camera#',
            updated_id = #session.userID#,
            updated_dt = #NOW()#
         WHERE id = #form.id#
      </cfquery>

      Swal.fire({
         title: 'Pilot Flight Has Been Updated',
         text: 'Lets Go!',
         icon: 'success',
         confirmButtonText: 'Okay'
      }).then((result) => {
         BootstrapDialog.closeAll();
         if (typeof reload_pilot_flight_list == 'function')
         {
             reload_pilot_flight_list();
         }
       });
      
   </cfif>

   <cfif isDefined('form.action') AND form.action EQ 'delete'>

      <cfquery name="chk_qty" datasource="higher">
         SELECT a.id,a.flight_qty
         FROM `pilot_task` a
         LEFT JOIN `pilot_task_flight` b ON (a.id = b.task_id)
         WHERE b.id = #form.flight_id#
      </cfquery>

      #chk_qty.flight_qty#

      <cfquery name="deduct_qty" datasource="higher">
         UPDATE `pilot_task`
         SET flight_qty = #chk_qty.flight_qty# - 1
         WHERE id = #chk_qty.id#
      </cfquery>

      <cfquery name="dsp_qty" datasource="higher">
         SELECT flight_qty
         FROM `pilot_task`
         WHERE id = #chk_qty.id#
      </cfquery>

      <cfquery name="update" datasource="higher">
         DELETE 
         FROM `pilot_task_flight`
         WHERE id = #form.flight_id#
      </cfquery>

      Swal.fire({
         title: 'Pilot Flight Has Been Deleted',
         text: 'Lets Go!',
         icon: 'success',
         confirmButtonText: 'Okay'
      }).then((result) => {
         BootstrapDialog.closeAll();
         $('##dsp_task_qty').text(#dsp_qty.flight_qty#)
         if (typeof reload_pilot_flight_list == 'function')
         {
             reload_pilot_flight_list();
         }
       });
      
   </cfif>


</cfoutput>