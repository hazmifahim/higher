
<cfoutput>
<cfsetting showDebugOutput="No">

<cfset form_id = 'flight_forms'>

<cfquery name="pilot" datasource="higher">
   SELECT *
   FROM `users`
   WHERE CONCAT(',', role_ids, ',') LIKE '%,3,%'
</cfquery>

<cfquery name="driver" datasource="higher">
   SELECT *
   FROM `users`
   WHERE CONCAT(',', role_ids, ',') LIKE '%,4,%'
</cfquery>


<div class="row mt-5">
   <div class="col-md-12">
      <div class="white_shd full margin_bottom_30">
         <div class="full graph_head">
            <div class="heading1 margin_0">
               <h2>Register New Flight</h2>
            </div>
         </div>

         <form id="#form_id#" name="#form_id#">
            <div class="full price_table padding_infor_info">
               <div class="row">
                     <div class="col-sm-12">
                        <div class="panel">
                           <div class="panel-heading">
                            <b>General Information</b>
                           </div>
                           <div class="panel-body">
                              <div class="row mb-space">
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Full Name </label>
                                       <div class="col-sm-8">
                                          <input type="text" id="fullname" name="fullname" class="form-control">
                                       </div>
                                    </div>
                                 </div>
                                 <!--- <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Date Of Birth</label>
                                       <div class="col-sm-8">
                                          <input type="text" id="dob" name="dob" class="form-control">
                                       </div>
                                    </div>
                                 </div> --->
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">I.C Number </label>
                                       <div class="col-sm-8">
                                          <input type="text" id="ic_num" name="ic_num" class="form-control">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Nationality </label>
                                       <div class="col-sm-8">
                                          <select class="form-control" id="nationality" name="nationality">
                                             <option value="">Please choose...</option>
                                             <option value="1">Malaysian</option>
                                             <option value="2">International</option>
                                          </select>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Flight Date</label>
                                       <div class="col-sm-8">
                                          <input type="text" id="flight_dt" name="flight_dt" class="form-control" value="#dateformat(NOW(),'dd/mm/yyyy')#" readonly>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Location </label>
                                       <div class="col-sm-8">
                                          <select class="form-control" id="location_id" name="location_id">
                                             <cfquery name="loc" datasource="higher">
                                                SELECT *
                                                FROM `lt_location`
                                             </cfquery>
                                             <option value="">Please choose...</option>
                                             <cfloop query="loc">
                                                <option value="#loc.id#">#loc.description#</option>
                                             </cfloop>
                                          </select>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Adult Pax</label>
                                       <div class="col-sm-8">
                                          <input type="number" id="adult" name="adult" class="form-control">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Children Pax</label>
                                       <div class="col-sm-8">
                                          <input type="number" id="children" name="children" class="form-control">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Videos</label>
                                       <div class="col-sm-8">
                                          <input type="number" id="video_qty" name="video_qty" class="form-control">
                                       </div>
                                    </div>
                                 </div>
      
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Total Payment</label>
                                       <div class="col-sm-8">
                                          <div class="input-group">
                                             <span class="input-group-text">RM</span>
                                             <input type="text" id="total_payment" name="total_payment" class="form-control numOnly" placeholder="0.00">
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <!--- <div class="panel">
                           <div class="panel-heading">
                            <b>Technical Information</b>
                           </div>
                           <div class="panel-body">
                              <div class="row mb-space">
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Pilot </label>
                                       <div class="col-sm-8">
                                          <select class="selectpicker form-control">
                                             <option>Please choose...</option>
                                             <cfloop query="pilot">
                                                <option value="#pilot.id#">#pilot.fullname#</option>
                                             </cfloop>
                                           </select>
                                           
                                          <!--- <div class="input-group">
                                             <input type="text" id="pilot" name="pilot" class="form-control" placeholder="Choose pilot..." readonly>
                                             <input type="hidden" id="pilot_id" name="pilot_id">
                                             <div class="input-group-append">
                                               <button class="btn btn-info" type="button" onclick="open_popup('get_pilot')"><i class="fa fa-search"></i></button>
                                             </div>
                                          </div> --->
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="row">
                                       <label class="col-sm-4 col-form-label">Driver </label>
                                       <div class="col-sm-8">
                                          <select class="selectpicker form-control">
                                             <option>Please choose...</option>
                                             <cfloop query="driver">
                                                <option value="#driver.id#">#driver.fullname#</option>
                                             </cfloop>
                                          </select>
                                          <!--- <div class="input-group">
                                             <input type="text" id="fullname" name="fullname" class="form-control" placeholder="Choose driver..." readonly>
                                             <input type="hidden" id="pilot_id" name="pilot_id">
                                             <div class="input-group-append">
                                               <button class="btn btn-info" type="button"><i class="fa fa-search"></i></button>
                                             </div>
                                          </div> --->
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div> --->

                           <div class="button_block mt-2"><button type="button" onclick="submit_flight_form();" class="btn cur-p btn-primary">Submit</button></div>
      
                        </div>
                     </div>
               </div>
            </div>
         </form>
      </div>
   </div>
   <!-- end row -->
</div>

<script>

   $('select').selectpicker();

   $(document).ready(function() {
      $("##from_dt, ##end_dt, ##dob").datepicker({
         dateFormat: "dd-mm-yy"
      });
   });

   $(".numOnly").ForceNumericOnly();

   $('##adult').keyup(function() {  
      $('##video_qty').val($('##adult').val());
      doMath();
   });

   $('##children').keyup(function() {  
      $('##video_qty').val($('##children').val());
      doMath();
   });
   
  function doMath() 
  {
      var adult_num = '';
      var child_num = '';

      var updateTotal = function () 
      {
         var adult_num = parseFloat($('##adult').val());
         var child_num = parseFloat($('##children').val());
         var total = (adult_num + child_num)

         if (isNaN(adult_num) || isNaN(child_num)) 
         {
            if(!child_num)
            {
               $('##video_qty').val($('##adult').val());
            }
            
            if(!adult_num)
            {
               $('##video_qty').val($('##children').val());
            }
         } 
         else 
         {          
            $('##video_qty').val(total);
         }
      };
      updateTotal()
   };

// settle

   open_popup = function(process)
      {
         if(process == 'get_pilot')
         {
            let param = $.param({
               get_me: 'pilot_id:id;pilot:fullname;'
            });

            var title = 'Choose Pilot';
            var target = 'pop_pilot.cfm?'+param;

         }

         BootstrapDialog.show({
				size: BootstrapDialog.SIZE_WIDE,
				type: 	BootstrapDialog.TYPE_PRIMARY,
				title: title,
				closable: true,
				closeByBackdrop: true,
				closeByKeyboard: false,
				buttons: [{
						label: 'Close',
						action: function(dialogItself){
							dialogItself.close();
						}
					}],
               onshown: function(dialogRef){
                  $('##'+dialogRef.options.id+' .bootstrap-dialog-message').load(target)
               }
				});
      }

// settle
      

   function submit_flight_form() 
   {
      Swal.fire({
            title: 'Are you sure',
            text: 'All the information will be saved',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: "No",
         }).then((result) => {
            if (result.value) {
               // user clicked "Yes"
               $.ajax({
               url: 'flight_form_act.cfm',
               type: "POST",
               data : $('###form_id#').serialize(),
               dataType: "script"
               });
            } else {
               // user clicked "No"
               Swal.fire("Registration Fail", "", "error");
            }
         });
   };
   
</script>

</cfoutput>