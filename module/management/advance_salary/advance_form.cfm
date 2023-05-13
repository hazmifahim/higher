<cfoutput>

  <cfquery name="get_user" datasource="higher">
    SELECT * FROM users
 </cfquery>

  <form name="payroll_form">
    <div class="row">
      <div class="col-sm-12">

         <div class="panel-body">
            <div class="row mb-space">
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Full Name </label>
                     <div class="col-sm-8">                        
                        <select class="form-control" id="user_id" name="user_id">
                          <cfloop query="get_user">
                            <option value="#id#">#UCASE(fullname)#</option>
                          </cfloop>
                      </select>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                <div class="row">
                  <label class="col-sm-4 col-form-label">Advance Month </label>
                  <div class="col-sm-8">
                      <select class="form-control" id="month" name="month">
                          <cfloop from="#month(now())#" to="12" index="m">
                            <option value="#m#">#m#</option>
                        </cfloop>
                      </select>
                  </div>
                  </div>
              </div>  
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Advance Amount (RM) </label>
                     <div class="col-sm-8">
                        <input type="text" id="advance_amt" name="advance_amt" class="form-control">
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                <div class="row">
                   <label class="col-sm-4 col-form-label">Payment Date</label>
                   <div class="col-sm-8">
                      <input type="date" id="payment_dt" name="payment_dt" class="form-control" value="#dateformat(now())#">
                   </div>
                </div>
             </div>
               <div class="col-sm-6">
                  <div class="row">
                     <label class="col-sm-4 col-form-label">Payment Reference </label>
                     <div class="col-sm-8">
                        <input type="text" id="payment_ref" name="payment_ref" class="form-control">
                     </div>
                  </div>
               </div>              
            </div>
         </div>
      </div>
   </div>
  </form>

  <script>
    $('##btn-confirm').on('click', function(e) {
      console.log('hi');
    });

    $('select').selectpicker();

   $(document).ready(function() {
      $("##payment_dt").datepicker({
         dateFormat: "dd-mm-yy"
      });
   });
  </script>

</cfoutput>