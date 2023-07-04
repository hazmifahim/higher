
<cfoutput>
<cfsetting showDebugOutput="No">

<cfif isDefined('url.trip_id')>

   <cfquery name="data" datasource="higher">
      SELECT 
         a.id,
         a.ref_num,
         a.driver_id,
         a.trip_dt,
         a.trip_time,
         a.`from`,
         a.`to`,
         a.authorize_name,
         a.trip_remark_id
      FROM `driver_log_trip` a
      LEFT JOIN `users` b ON (a.authorize_id = b.id)
      WHERE a.id = #url.trip_id#
   </cfquery>

   <cfset id = data.id>
   <cfset trip_dt = dateformat(data.trip_dt,'mm/dd/yyyy')>
   <cfset driver_id = data.driver_id>
   <cfset ref_num = data.ref_num>
   <cfset from = data.from>
   <cfset to = data.to>
   <cfset trip_time = data.trip_time>
   <cfset authorize_name = data.authorize_name>
   <cfset trip_remark_id = data.trip_remark_id>
   <cfset action = 'update'>

   <cfset lbl_btn = 'Update'>
   <cfset lbl_clr = 'warning'>

<cfelse>

   <cfquery name="driver_data" datasource="higher">
      SELECT `id`,`name`
      FROM `users`
      WHERE id = #url.driver_id#
   </cfquery>
   
   <cfquery name="chck_cnt" datasource="higher">
      SELECT COUNT(id) AS total
      FROM `driver_log_trip`
      WHERE driver_id = #url.driver_id#
      AND DATE_FORMAT(trip_dt, "%m/%d/%Y") = '#dateformat(url.log_dt,'mm/dd/yyyy')#'
   </cfquery>

   <cfset trip_cnt = chck_cnt.total + 1>

   <cfset id = ''>
   <cfset trip_dt = url.log_dt>
   <cfset driver_id = driver_data.id>
   <cfset ref_num = 'DRV-#UCASE(driver_data.name)#/#dateformat(url.log_dt,'mmddyy')#/T#trip_cnt#'>
   <cfset from = ''>
   <cfset to = ''>
   <cfset trip_time = ''>
   <cfset authorize_name = ''>
   <cfset trip_remark_id = ''>
   <cfset action = 'register'>

   <cfset lbl_btn = 'Submit'>
   <cfset lbl_clr = 'success'>

</cfif>

<cfset form_id = 'driver_trip_form'>

   <form id="#form_id#" name="#form_id#">
      <div class="row mb-space">
         <div class="col-sm-6">
            <div class="row">
               <label class="col-sm-4 col-form-label">Trip Date</label>
               <div class="col-sm-8">
                  <input type="text" id="trip_dt" name="trip_dt" class="form-control" value="#trip_dt#" readonly>
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
               <label class="col-sm-4 col-form-label">From </label>
               <div class="col-sm-8">
                  <select class="form-control" id="from" name="from">
                     <option value="">Please choose...</option>
                     <option value="OFFICE" <cfif from EQ 'OFFICE'>selected</cfif>>OFFICE - Office</option>
                     <option value="LZ1" <cfif from EQ 'LZ1'>selected</cfif>>LZ1 - Landing Zone 1</option>
                     <option value="LZ2" <cfif from EQ 'LZ2'>selected</cfif>>LZ2 - Landing Zone 2</option>
                     <option value="LZ3" <cfif from EQ 'LZ3'>selected</cfif>>LZ3 - Landing Zone 3</option>
                     <option value="TO1" <cfif from EQ 'TO1'>selected</cfif>>TO1 - Take-Off 1</option>
                     <option value="TO2" <cfif from EQ 'TO2'>selected</cfif>>TO2 - Take-Off 2</option>
                     <option value="TO3" <cfif from EQ 'TO3'>selected</cfif>>TO3 - Take-Off 3</option>
                     <option value="KOMPLEKS" <cfif from EQ 'KOMPLEKS'>selected</cfif>>KOMPLEKS - Kompleks</option>
                  </select>
               </div>
            </div>
         </div>
         <div class="col-sm-6">
            <div class="row">
               <label class="col-sm-4 col-form-label">To </label>
               <div class="col-sm-8">
                  <select class="form-control" id="to" name="to">
                     <option value="">Please choose...</option>
                     <option value="OFFICE" <cfif from EQ 'OFFICE'>selected</cfif>>OFFICE - Office</option>
                     <option value="LZ1" <cfif to EQ 'LZ1'>selected</cfif>>LZ1 - Landing Zone 1</option>
                     <option value="LZ2" <cfif to EQ 'LZ2'>selected</cfif>>LZ2 - Landing Zone 2</option>
                     <option value="LZ3" <cfif to EQ 'LZ3'>selected</cfif>>LZ3 - Landing Zone 3</option>
                     <option value="TO1" <cfif to EQ 'TO1'>selected</cfif>>TO1 - Take-Off 1</option>
                     <option value="TO2" <cfif to EQ 'TO2'>selected</cfif>>TO2 - Take-Off 2</option>
                     <option value="TO3" <cfif to EQ 'TO3'>selected</cfif>>TO3 - Take-Off 3</option>
                     <option value="KOMPLEKS" <cfif to EQ 'KOMPLEKS'>selected</cfif>>KOMPLEKS - Kompleks</option>
                  </select>
               </div>
            </div>
         </div>
         <div class="col-6">
            <div class="row">
               <label class="col-sm-4 col-form-label">Time</label>
               <div class="col-sm-8">
                  <input type="time" id="trip_time" name="trip_time" class="form-control" value="#TimeFormat(trip_time, 'HH:mm')#">
               </div>
            </div>
         </div>
         <div class="col-sm-6">
            <div class="row">
               <label class="col-sm-4 col-form-label">Authorize Name </label>
               <div class="col-sm-8">
                  <input type="text" id="authorize_name" name="authorize_name" class="form-control" value="#authorize_name#">
               </div>
            </div>
         </div>
         <div class="col-sm-6">
            <div class="row">
               <label class="col-sm-4 col-form-label">Trip Remark </label>
               <div class="col-sm-8">
                  <cfquery name="lt_trip_remark" datasource="higher">
                     SELECT * FROM lt_trip_remark
                  </cfquery>
                  <select class="form-control" id="trip_remark_id" name="trip_remark_id">
                     <option value="">Please choose...</option>
                     <cfloop query="lt_trip_remark">
                        <option value="#lt_trip_remark.id#" <cfif trip_remark_id EQ lt_trip_remark.id>selected</cfif>>#lt_trip_remark.code# - #lt_trip_remark.description#</option>
                     </cfloop>
                  </select>
               </div>
            </div>
         </div>

         <input type="hidden" id="id" name="id" value="#id#">
         <input type="hidden" id="driver_id" name="driver_id" value="#driver_id#">
         <input type="hidden" id="action" name="action" value="#action#">

      </div>
   </form>

<script>

   $('select').selectpicker();

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
                  url: 'module/driver/driver_trip_form_act.cfm',
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