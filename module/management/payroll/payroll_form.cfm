<cfoutput>

    <form name="payroll_form">
        <div class="row">
            <div class="col-sm-12">      
                <div class="panel-body">
                    <div class="row mb-space">
                        <div class="col-sm-6">
                            <div class="row">
                            <label class="col-sm-4 col-form-label">Year </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="year" name="year">
                                    <cfloop from="#year(now())#" to="2019" index="i" step="-1">
                                        <option value="#i#">#i#</option>
                                    </cfloop>
                                    
                                </select>
                            </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="row">
                            <label class="col-sm-4 col-form-label">Month </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="month" name="month">
                                    <cfloop from="1" to="12" index="m">
										<option value="#m#">#m#</option>
									</cfloop>
                                </select>
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
    </script>

</cfoutput>