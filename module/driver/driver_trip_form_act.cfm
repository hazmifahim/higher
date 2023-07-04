
<cfoutput>
<cfsetting showDebugOutput="No">


   <cfif isDefined('form.action') AND form.action EQ 'register'>

      <cfquery name="chck_log" datasource="higher">
         SELECT COUNT(id) AS total
         FROM `driver_log`
         WHERE driver_id = #form.driver_id#
         AND DATE_FORMAT(log_dt, "%m/%d/%Y") = '#form.trip_dt#'
      </cfquery>

      <cfif chck_log.total EQ 0>

         <cfquery name="reg_log" datasource="higher" result="new_log_id">
            INSERT INTO `driver_log`
               (
                  log_dt,
                  driver_id,
                  trip_qty
               )
            VALUES 
               (
                  #createODBCDate(form.trip_dt)#,
                  #form.driver_id#,
                  '0'
               )
         </cfquery>

         <cfset log_id = new_log_id.generated_key>

      <cfelse>

         <cfquery name="log" datasource="higher">
            SELECT id
            FROM `driver_log`
            WHERE driver_id = #form.driver_id#
            AND DATE_FORMAT(log_dt, "%m/%d/%Y") = '#form.trip_dt#'
         </cfquery>

         <cfset log_id = log.id>

      </cfif>

      <cfquery name="register" datasource="higher" result="res">
         INSERT INTO `driver_log_trip` 
            (
               trip_dt,
               log_id,
               ref_num,
               `from`,
               `to`,
               trip_time,
               driver_id,
               <!---authorize_id,--->
               authorize_name,
               trip_remark_id,
               lt_status_id,
               created_id,
               created_dt
            )
         VALUES 
            (
               #createODBCDateTime(form.trip_dt)#,
               #log_id#,
               '#form.ref_num#',
               '#form.from#',
               '#form.to#',
               '#DATEFORMAT(NOW(),'yyyy-mm-dd')# #form.trip_time#',
               #form.driver_id#,
               <!---#form.authorize_id#,--->
               '#form.authorize_name#',
               '#form.trip_remark_id#',
               1,
               #session.userID#,
               #NOW()#
            )
      </cfquery>

      <cfquery name="chk_qty" datasource="higher">
         SELECT trip_qty
         FROM `driver_log`
         WHERE id = #log_id#
      </cfquery>

      <cfquery name="add_qty" datasource="higher">
         UPDATE `driver_log`
         SET trip_qty = #chk_qty.trip_qty# + 1
         WHERE id = #log_id#
      </cfquery>

      <cfquery name="dsp_qty" datasource="higher">
         SELECT trip_qty
         FROM `driver_log`
         WHERE id = #log_id#
      </cfquery>

      Swal.fire({
         title: 'Driver Trip Has Been Registered',
         text: 'Lets Go!',
         icon: 'success',
         confirmButtonText: 'Okay'
      }).then((result) => {
         BootstrapDialog.closeAll();
         $('##dsp_log_qty').text(#dsp_qty.trip_qty#)
         if (typeof reload_driver_log_list == 'function')
         {
             reload_driver_log_list();
         }
       });
      
   </cfif>

   <cfif isDefined('form.action') AND form.action EQ 'update'>

      <cfquery name="update" datasource="higher">
         UPDATE `driver_log_trip`
         SET 
            `from` = '#form.from#',
            `to` = '#form.to#',
            trip_time = '#DATEFORMAT(NOW(),'yyyy-mm-dd')# #form.trip_time#',
            authorize_name = '#form.authorize_name#',
            trip_remark_id = #form.trip_remark_id#,
            updated_id = #session.userID#,
            updated_dt = #NOW()#
         WHERE id = #form.id#
      </cfquery>

      Swal.fire({
         title: 'Driver Trip Has Been Updated',
         text: 'Lets Go!',
         icon: 'success',
         confirmButtonText: 'Okay'
      }).then((result) => {
         BootstrapDialog.closeAll();
         if (typeof reload_driver_log_list == 'function')
         {
             reload_driver_log_list();
         }
       });
      
   </cfif>

   <cfif isDefined('form.action') AND form.action EQ 'delete'>

      <cfquery name="chk_qty" datasource="higher">
         SELECT a.id,a.trip_qty
         FROM `driver_log` a
         LEFT JOIN `driver_log_trip` b ON (a.id = b.log_id)
         WHERE b.id = #form.trip_id#
      </cfquery>

      <cfquery name="deduct_qty" datasource="higher">
         UPDATE `driver_log`
         SET trip_qty = #chk_qty.trip_qty# - 1
         WHERE id = #chk_qty.id#
      </cfquery>

      <cfquery name="dsp_qty" datasource="higher">
         SELECT trip_qty
         FROM `driver_log`
         WHERE id = #chk_qty.id#
      </cfquery>

      <cfquery name="update" datasource="higher">
         DELETE 
         FROM `driver_log_trip`
         WHERE id = #form.trip_id#
      </cfquery>

      Swal.fire({
         title: 'Driver Trip Has Been Deleted',
         text: 'Lets Go!',
         icon: 'success',
         confirmButtonText: 'Okay'
      }).then((result) => {
         BootstrapDialog.closeAll();
         $('##dsp_log_qty').text(#dsp_qty.trip_qty#)
         if (typeof reload_driver_log_list == 'function')
         {
             reload_driver_log_list();
         }
       });
      
   </cfif>


</cfoutput>