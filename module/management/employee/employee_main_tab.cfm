
<cfoutput>
<cfsetting showDebugOutput="No">

<div class="row mt-5">
   <div class="col-md-12">
      <div class="white_shd full margin_bottom_30">
         <div class="full graph_head">
            <div class="heading1 margin_0">
               <h2>Employee's Information</h2>
            </div>
         </div>

               <div class="full inner_elements">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="tab_style1">
                           <div class="tabbar padding_infor_info">
                              <nav>
                                 <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="##nav-home" role="tab" aria-controls="nav-home" aria-selected="true" data-url="module/management/employee/personal_info.cfm?#cgi.QUERY_STRING#"><i class="fa fa-user"></i> Personal Info</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="##nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false" data-url="module/management/employee/payroll_settings.cfm?#cgi.QUERY_STRING#"><i class="fa fa-unlock"></i> Log-In Info</a>
                                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="##nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false" data-url="module/management/employee/payslips_list.cfm?#cgi.QUERY_STRING#"><i class="fa fa-folder-open-o"></i> Payslips Records</a>
                                    <a class="nav-item nav-link" id="nav-advance-tab" data-toggle="tab" href="##nav-advance" role="tab" aria-controls="nav-advance" aria-selected="false" data-url="module/management/employee/advance_list.cfm?#cgi.QUERY_STRING#"><i class="fa fa-dollar"></i> Advance Records</a>
                                    <a class="nav-item nav-link" id="nav-attendance-tab" data-toggle="tab" href="##nav-attendance" role="tab" aria-controls="nav-attendance" aria-selected="false" data-url="module/management/employee/attendance_list.cfm?#cgi.QUERY_STRING#"><i class="fa fa-clock-o"></i> Attendance Records</a>
                                 </div>
                              </nav>
                              <div class="tab-content" id="nav-tabContent">
                                 <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"></div>
                                 <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab"></div>
                                 <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab"></div>
                                 <div class="tab-pane fade" id="nav-advance" role="tabpanel" aria-labelledby="nav-advance-tab"></div>
                                 <div class="tab-pane fade" id="nav-attendance" role="tabpanel" aria-labelledby="nav-attendance-tab"></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

      </div>
   </div>
</div>
   <!-- end row -->

<script>

   loadTabContent()
   
   
</script>

</cfoutput>