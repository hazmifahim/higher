<cfoutput>

   <cfquery name="get_data" datasource="higher">
      SELECT * FROM users
      limit 1
   </cfquery>
   <div class="row">
      <div class="col-sm-12">

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
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">E-Mail </label>
                     <div class="col-sm-8">
                        <input type="text" id="" name="" class="form-control">
                     </div>
                  </div>
               </div>
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
                     <label class="col-sm-4 col-form-label">Gender </label>
                     <div class="col-sm-8">
                        <select class="form-control" id="nationality" name="nationality">
                           <option value="">Please choose...</option>
                           <option value="1">Male</option>
                           <option value="2">Female</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Date Of Birth</label>
                     <div class="col-sm-8">
                        <input type="text" id="dob" name="dob" class="form-control" value="#dateformat(NOW(),'dd/mm/yyyy')#">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Worker Status </label>
                     <div class="col-sm-8">
                        <select class="form-control" id="nationality" name="nationality">
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
                        <select class="form-control" id="nationality" name="nationality">
                           <option value="">Please choose...</option>
                           <option value="1">Single</option>
                           <option value="2">Married</option>
                           <option value="3">Divorced</option>
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
                              <input type="radio" id="check_2" name="disability_status" value="">
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
                        <select class="form-control" id="nationality" name="nationality">
                           <option value="">Please choose...</option>
                           <option value="1">Malay</option>
                           <option value="2">Chinese</option>
                           <option value="3">Indian</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Street Address </label>
                     <div class="col-sm-8">
                        <input type="text" id="" name="" class="form-control" value="">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">City </label>
                     <div class="col-sm-8">
                        <input type="text" id="" name="" class="form-control" value="">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">State </label>
                     <div class="col-sm-8">
                        <select class="form-control" id="nationality" name="nationality">
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
                        <input type="text" id="" name="" class="form-control" value="">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Mobile No. </label>
                     <div class="col-sm-8">
                        <input type="text" id="" name="" class="form-control" value="">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Emergency Contact Name </label>
                     <div class="col-sm-8">
                        <input type="text" id="" name="" class="form-control">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Emergency Contact No. </label>
                     <div class="col-sm-8">
                        <input type="text" id="" name="" class="form-control">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Bank Name </label>
                     <div class="col-sm-8">
                        <input type="text" id="" name="" class="form-control">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Account No.</label>
                     <div class="col-sm-8">
                        <input type="text" id="" name="" class="form-control">
                     </div>
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