
<cfoutput>
<cfsetting showDebugOutput="No">

<cfif isDefined('url.flight_id')>

   <cfquery name="data" datasource="higher">
      SELECT 
         id,
         ref_num,
         passenger_num,
         camera,
         pilot_id,
         flight_dt
      FROM `pilot_task_flight`
      WHERE id = #url.flight_id#
   </cfquery>

   <cfset id = data.id>
   <cfset flight_dt = dateformat(data.flight_dt,'mm/dd/yyyy')>
   <cfset pilot_id = data.pilot_id>
   <cfset ref_num = data.ref_num>
   <cfset passenger_num = data.passenger_num>
   <cfset camera = data.camera>
   <cfset action = 'update'>

   <cfset lbl_btn = 'Update'>
   <cfset lbl_clr = 'warning'>

<cfelse>

   <cfquery name="pilot_data" datasource="higher">
      SELECT `id`,`name`
      FROM `users`
      WHERE id = #url.pilot_id#
   </cfquery>
   
   <cfquery name="chck_cnt" datasource="higher">
      SELECT COUNT(id) AS total
      FROM `pilot_task_flight`
      WHERE pilot_id = #url.pilot_id#
      AND DATE_FORMAT(flight_dt, "%m/%d/%Y") = '#dateformat(url.task_dt,'mm/dd/yyyy')#'
   </cfquery>

   <cfset flight_cnt = chck_cnt.total + 1>

   <cfset id = ''>
   <cfset flight_dt = url.task_dt>
   <cfset pilot_id = pilot_data.id>
   <cfset ref_num = 'PLT-#UCASE(pilot_data.name)#/#dateformat(url.task_dt,'mmddyy')#/F#flight_cnt#'>
   <cfset passenger_num = ''>
   <cfset camera = ''>
   <cfset action = 'register'>

   <cfset lbl_btn = 'Submit'>
   <cfset lbl_clr = 'success'>

</cfif>

<cfset form_id = 'pilot_flight_form'>

   <form id="#form_id#" name="#form_id#">
      <div class="row mb-space">
         <div class="col-sm-6">
            <div class="row">
               <label class="col-sm-4 col-form-label">Flight Date</label>
               <div class="col-sm-8">
                  <input type="text" id="flight_dt" name="flight_dt" class="form-control" value="#flight_dt#" readonly>
               </div>
            </div>
         </div>
         <div class="col-sm-6">
            <div class="row">
               <label class="col-sm-4 col-form-label">Reference Number </label>
               <div class="col-sm-8">
                  <input type="text" id="ref_num" name="ref_num" class="form-control" value="#ref_num#" readonly>
               </div>
            </div>
         </div>
         <div class="col-sm-6">
            <div class="row">
               <label class="col-sm-4 col-form-label">Passenger Serial Number </label>
               <div class="col-sm-8">
                  <input type="text" id="passenger_num" name="passenger_num" class="form-control" value="#passenger_num#">
               </div>
            </div>
         </div>
         <div class="col-sm-6">
            <div class="row">
               <label class="col-sm-4 col-form-label">Camera </label>
               <div class="col-sm-8">
                  <div class="row mt-2">
                     <div class="col-sm-6">
                        <input type="radio" id="stat_1" name="camera" <cfif camera EQ 'Y'>checked<cfelseif camera EQ ''>checked<cfelse></cfif> value="Y">
                        <label for="stat_1"> Yes</label><br>
                     </div>
                     <div class="col-sm-6">
                        <input type="radio" id="stat_2" name="camera" <cfif camera EQ 'N'>checked</cfif> value="N">
                        <label for="stat_2"> No</label><br>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <input type="hidden" id="id" name="id" value="#id#">
         <input type="hidden" id="pilot_id" name="pilot_id" value="#pilot_id#">
         <input type="hidden" id="action" name="action" value="#action#">

      </div>
   </form>

<script>

   var $button_send = $('<button class="btn btn-#lbl_clr# mt-2 pull-right">#lbl_btn#</button>');

   $('.modal-footer').append($button_send);

   $button_send.on('click',
        function ()
        {   
         Swal.fire({
               title: 'Are you sure',
               text: 'Pilot Flight Will Be Saved',
               icon: 'question',
               showCancelButton: true,
               confirmButtonText: 'Yes',
               cancelButtonText: "No",
            }).then((result) => {
               if (result.value) {
                  // user clicked "Yes"
                  $.ajax({
                  url: 'module/pilot/pilot_flight_form_act.cfm',
                  type: "POST",
                  data : $('###form_id#').serialize(),
                  dataType: "script"
                  });
               } else {
                  // user clicked "No"
                  Swal.fire("Submission Fail", "", "error");
               }
            });
        }
    );
   
</script>

</cfoutput>