<cfoutput>
    <div class="row">
        <div class="col-sm-12">
  
            <div class="panel-body">
                <div class="row mb-space">
                    <div class="col-sm-6">
                        <div class="row">
                           <label class="col-sm-4 col-form-label">Salary Paid Method </label>
                           <div class="col-sm-8">
                              <select class="form-control" id="paid_method" name="paid_method">
                                 <option value="">Please choose...</option>
                                 <option value="1">Monthly</option>
                                 <option value="2">Daily</option>
                                 <option value="3">Per Trip</option>
                              </select>
                           </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="row">
                            <label class="col-sm-4 col-form-label">Rate (RM) </label>
                            <div class="col-sm-8">
                                <input type="text" id="fullname" name="fullname" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="row">
                            <label class="col-sm-4 col-form-label">Employee EPF Rate </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="employee_rate" name="employee_rate">
                                   <option value="">Please choose...</option>
                                   <option value="1">11%</option>
                                   <option value="2">13%</option>
                                </select>
                             </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="row">
                            <label class="col-sm-4 col-form-label">Employee EPF (RM)</label>
                            <div class="col-sm-8">
                                <input type="text" id="fullname" name="fullname" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="row">
                            <label class="col-sm-4 col-form-label">Employer EPF Rate </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="employer_rate" name="employer_rate">
                                    <option value="">Please choose...</option>
                                    <option value="1">11%</option>
                                    <option value="2">13%</option>
                                 </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="row">
                            <label class="col-sm-4 col-form-label">Employer EPF (RM)</label>
                            <div class="col-sm-8">
                                <input type="text" id="fullname" name="fullname" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="row">
                            <label class="col-sm-4 col-form-label">SOCSO </label>
                            <div class="col-sm-8">
                                <input type="text" id="fullname" name="fullname" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="row">
                            <label class="col-sm-4 col-form-label">EIS </label>
                            <div class="col-sm-8">
                                <input type="text" id="fullname" name="fullname" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="row">
                            <label class="col-sm-4 col-form-label">PCB </label>
                            <div class="col-sm-8">
                                <input type="text" id="fullname" name="fullname" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</cfoutput>