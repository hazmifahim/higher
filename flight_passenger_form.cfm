
<cfoutput>
<cfsetting showDebugOutput="No">

<cfquery name="get_pilot" datasource="higher">
   SELECT *
   FROM `users`
   WHERE CONCAT(',', role_ids, ',') LIKE '%,3,%'
</cfquery>

<cfquery name="get_driver" datasource="higher">
   SELECT *
   FROM `users`
   WHERE CONCAT(',', role_ids, ',') LIKE '%,4,%'
</cfquery>

<cfset form_id = 'passenger_forms'>

<form id="#form_id#" name="#form_id#">
   <div class="row mb-space">
      <div class="col-sm-6">
         <div class="row">
            <label class="col-sm-4 col-form-label">Name </label>
            <div class="col-sm-8">
               <input type="text" id="name" name="name" class="form-control" value="">
            </div>
         </div>
      </div>
      <div class="col-sm-6">
         <div class="row">
            <label class="col-sm-4 col-form-label">Age Type</label>
            <div class="col-sm-8">
               <select id="age_type" name="age_type" class="selectpicker form-control">
                  <option value="">Please choose...</option>
                  <option value="1">Adult</option>
                  <option value="2">Children</option>
               </select>
            </div>
         </div>
      </div>
      <div class="col-sm-6">
         <div class="row">
            <label class="col-sm-4 col-form-label">Pilot </label>
            <div class="col-sm-8">
               <select id="pilot_id" name="pilot_id"  class="selectpicker form-control">
                  <option value="">Please choose...</option>
                  <cfloop query="get_pilot">
                     <option value="#get_pilot.id#">#get_pilot.fullname#</option>
                  </cfloop>
               </select>
            </div>
         </div>
      </div>
      <div class="col-sm-6">
         <div class="row">
            <label class="col-sm-4 col-form-label">Driver</label>
            <div class="col-sm-8">
               <select id="driver_id" name="driver_id"  class="selectpicker form-control">
                  <option value="">Please choose...</option>
                  <cfloop query="get_driver">
                     <option value="#get_driver.id#">#get_driver.fullname#</option>
                  </cfloop>
               </select>
            </div>
         </div>
      </div>

      <input type="hidden" id="flight_id" name="flight_id" value="#url.flight_id#">
      <input type="hidden" id="action" name="action" value="register">

      <div class="col-sm-12"><button type="button" onclick="save_btn();" class="btn cur-p btn-success"  style="float:right"><i class="fa fa-save"></i>&nbsp; Save</button></div>
   </div>
</form>

<script>

   $('select').selectpicker();

   save_btn = function(process,data)
      {
         Swal.fire({
            title: 'Register Passenger?',
            text: 'Lets Go!',
            icon: 'success',
            confirmButtonText: 'Okay'
         }).then((result) => {
            $.ajax({
               url: 'flight_passenger_form_act.cfm',
               type: "POST",
               data : $('###form_id#').serialize(),
               dataType: "script"
            });
         });
      }

</script>

</cfoutput>