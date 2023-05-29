<cfoutput>

   <cfquery name="users" datasource="higher">
      SELECT * FROM users
      WHERE id = #url.employee_id#
   </cfquery>
   <div class="row">
      <div class="col-sm-12">

         <div class="panel-body">
            <div class="row mb-space">
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Full Name </label>
                     <div class="col-sm-8">
                        <input type="text" id="fullname" name="fullname" class="form-control" value="#users.fullname#">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">E-Mail </label>
                     <div class="col-sm-8">
                        <input type="text" id="email" name="email" class="form-control" value="#users.email#">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">I.C Number </label>
                     <div class="col-sm-8">
                        <input type="text" id="ic_no" name="ic_no" class="form-control" value="#users.ic_no#">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Gender </label>
                     <div class="col-sm-8">
                        <select class="form-control" id="sex" name="sex">
                           <option value="">Please choose...</option>
                           <option value="1" <cfif isDefined("users.sex") AND users.sex EQ 1>selected</cfif>>Male</option>
                           <option value="2" <cfif isDefined("users.sex") AND users.sex EQ 2>selected</cfif>>Female</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Date Of Birth</label>
                     <div class="col-sm-8">
                        <input type="text" id="birthdate" name="birthdate" class="form-control" value="#dateformat(NOW(),'dd/mm/yyyy')#">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Worker Status </label>
                     <div class="col-sm-8">
                        <select class="form-control" id="worker_status" name="worker_status">
                           <option value="">Please choose...</option>
                           <option value="1">Ordinary</option>
                           <option value="2">Extraordinary</option>
                        </select>
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
                     <label class="col-sm-4 col-form-label">Marital Status </label>
                     <div class="col-sm-8">
                        <select class="form-control" id="married" name="married">
                           <option value="">Please choose...</option>
                           <option value="1" <cfif isDefined("users.married") AND users.married EQ 1>selected</cfif>>Single</option>
                           <option value="2" <cfif isDefined("users.married") AND users.married EQ 2>selected</cfif>>Married</option>
                           <option value="3" <cfif isDefined("users.married") AND users.married EQ 3>selected</cfif>>Divorced</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Disability Status </label>
                     <div class="col-sm-8">
                        <div class="row mt-2">
                           <div class="col-sm-6">
                              <input type="radio" id="check_1" name="disability_status" checked value="">
                              <label for="check_1"> Not Disabled</label><br>
                           </div>
                           <div class="col-sm-6">
                              <input type="radio" id="check_2" name="disability_status" value="1">
                              <label for="check_2"> Disabled</label><br>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Race </label>
                     <div class="col-sm-8">
                        <select class="form-control" id="race" name="race">
                           <option value="">Please choose...</option>
                           <option value="1" <cfif isDefined("users.race") AND users.race EQ 1>selected</cfif>>Malay</option>
                           <option value="2" <cfif isDefined("users.race") AND users.race EQ 2>selected</cfif>>Chinese</option>
                           <option value="3" <cfif isDefined("users.race") AND users.race EQ 3>selected</cfif>>Indian</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Street Address </label>
                     <div class="col-sm-8">
                        <input type="text" id="address" name="address" class="form-control" value="">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">City </label>
                     <div class="col-sm-8">
                        <input type="text" id="city" name="city" class="form-control" value="">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">State </label>
                     <div class="col-sm-8">
                        <select class="form-control" id="state" name="state">
                           <option value="">Please choose...</option>
                           <option value="1">Sabah</option>
                           <option value="2">Johor</option>
                           <option value="3">Perak</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Post Code </label>
                     <div class="col-sm-8">
                        <input type="text" id="poscode" name="poscode" class="form-control" value="">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Mobile No. </label>
                     <div class="col-sm-8">
                        <input type="text" id="mobile" name="mobile" class="form-control" value="#users.mobile#">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Emergency Contact Name </label>
                     <div class="col-sm-8">
                        <input type="text" id="emergency_name" name="emergency_name" class="form-control">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Emergency Contact No. </label>
                     <div class="col-sm-8">
                        <input type="text" id="emergency_mobile" name="emergency_mobile" class="form-control">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Bank Name </label>
                     <div class="col-sm-8">
                        <input type="text" id="bank" name="bank" class="form-control" value="#users.bank#">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Account No.</label>
                     <div class="col-sm-8">
                        <input type="text" id="bank_acc" name="bank_acc" class="form-control" value="#users.bank_acc#">
                     </div>
                  </div>
               </div>
            </div>

            <hr class="mb-space">
            <div class="row mb-space">
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Salary Paid Method </label>
                     <div class="col-sm-8">
                        <select class="form-control" id="salary_method" name="salary_method">
                           <option value="">Please choose...</option>
                           <option value="1" <cfif isDefined("users.salary_method") AND users.salary_method EQ 1>selected</cfif>>Monthly</option>
                           <option value="2" <cfif isDefined("users.salary_method") AND users.salary_method EQ 2>selected</cfif>>Daily</option>
                           <option value="3" <cfif isDefined("users.salary_method") AND users.salary_method EQ 3>selected</cfif>>Per Trip</option>
                        </select>
                     </div>
                  </div>
              </div>
              <div class="col-sm-6">
                  <div class="row">
                      <label class="col-sm-4 col-form-label">Rate (RM) </label>
                      <div class="col-sm-8">
                          <input type="text" id="salary_rate" name="salary_rate" class="form-control" value="#users.salary_rate#">
                      </div>
                  </div>
              </div>
            </div>
            <div class="col-sm-6">
               <div class="row">
                   <label class="col-sm-4 col-form-label">PCB (RM) </label>
                   <div class="col-sm-8">
                       <input type="text" id="pcb" name="pcb" class="form-control" value="#users.pcb#">
                   </div>
               </div>
           </div>
         </div>

         <div class="button_block mt-2"><button type="button" onclick="submit_flight_form();" class="btn cur-p btn-primary">Submit</button></div>

      </div>
   </div>

<script>

   $('select').selectpicker();

   $(document).ready(function() {
      $("##dob").datepicker({
         dateFormat: "dd-mm-yy"
      });
   });

</script>
</cfoutput>