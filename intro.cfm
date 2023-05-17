<cfoutput>

<cfif NOT isdefined("session.userName")>
   <cflocation url="index.cfm" addtoken="No">
<cfelse>  
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>HIGHER Management System</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- site icon -->
      <link rel="icon" href="images/fevicon.png" type="image/png" />
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="css/responsive.css" />

      <!-- select bootstrap -->
      <!--- <link rel="stylesheet" href="css/bootstrap-select.css" /> --->
      <!--- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css"> --->
      <link rel="stylesheet" href="plugin/bootstrap-select/dist/css/bootstrap-select.min.css">
      <!-- scrollbar css -->
      <link rel="stylesheet" href="css/perfect-scrollbar.css" />
      <!-- custom css -->
      <link rel="stylesheet" href="css/custom.css" />
      <link rel="stylesheet" href="css/datatables.min.css">
      <link rel="stylesheet" href="css/sweetalert2.min.css">
      <link rel="stylesheet" href="css/jquery-ui.min.css">
      <link rel="stylesheet" href="css/bootstrap-dialog.css">
   </head>

   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                     <div class="logo_section">
                        <a href="index.html"><img class="logo_icon img-responsive" src="images/logo/logo_icon.png" alt="##" /></a>
                     </div>
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                      <center><img width="50%" class="img-responsive" src="images/layout_img/livein-logo.png" alt="##" /></center> 
                     </div>
                  </div>
               </div>
               <div class="sidebar_blog_2">
                  <h4>General</h4>
                  <ul class="list-unstyled components">
                     <li class="active"><a id="page_dashboard" href="##"><i class="fa fa-dashboard orange_color"></i> <span>Dashboard</span></a></li>
                     <li>
                        <a href="##management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-folder-open green_color"></i> <span>Management</span></a>
                        <ul class="collapse list-unstyled" id="management">
                           <li><a id="employee_area" href="##">> <span>Employee</span></a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="##attendance" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-users brown_color"></i> <span>Attendance</span></a>
                        <ul class="collapse list-unstyled" id="attendance">
                           <li><a style="cursor:pointer" id="attendance_form" href="##">> <span>Attendance Form</span></a></li>
                           <li><a style="cursor:pointer" id="attendance_record" href="##">> <span>Attendance Record</span></a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="##advance" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-money yellow_color"></i> <span>Advance</span></a>
                        <ul class="collapse list-unstyled" id="advance">
                        
                           <li><a style="cursor:pointer" id="advance_record" href="##">> <span>Advance Record</span></a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="##payroll" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-usd green_color"></i> <span>Payroll</span></a>
                        <ul class="collapse list-unstyled" id="payroll">
                           <li><a style="cursor:pointer" id="payroll_record">> <span>Payroll Record</span></a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="##bookings" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-list blue2_color"></i> <span>Bookings</span></a>
                        <ul class="collapse list-unstyled" id="bookings">
                           <li><a id="booking_register" href="##">> <span>Register New Booking</span></a></li>
                           <li><a id="booking_all" href="##">> <span>All Booking</span></a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="##flight" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-send green_color"></i> <span>Flights</span></a>
                        <ul class="collapse list-unstyled" id="flight">
                           <li><a id="flight_form" href="##">> <span>Register New Flight</span></a></li>
                           <li><a id="today_list" href="##">> <span>Today's Flight</span></a></li>
                           <li><a id="flight_list" href="##">> <span>All Flight</span></a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="##pilot_sec" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-user-secret orange_color"></i> <span>Pilot Section</span></a>
                        <ul class="collapse list-unstyled" id="pilot_sec">
                           <li><a id="pilot_list" href="##">> <span>Pilot's Profile</span></a></li>
                           <li><a id="" href="##">> <span>Pilot's Task</span></a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="##driver_sec" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-car purple_color"></i> <span>Driver Section</span></a>
                        <ul class="collapse list-unstyled" id="driver_sec">
                           <li><a id="" href="##">> <span>Driver's Profile</span></a></li>
                           <li><a id="" href="##">> <span>Driver's Task</span></a></li>
                        </ul>
                     </li>
                  </ul>
               </div>
            </nav>
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               <div class="topbar">
                  <nav class="navbar navbar-expand-lg navbar-light">
                     <div class="full">
                        <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i></button>
                    
                        <div class="right_topbar">
                           <div class="icon_info">
                              <ul>
                                 <li><a href="##"><i class="fa fa-bell-o"></i><span class="badge">2</span></a></li>
                                 <li><a href="##"><i class="fa fa-question-circle"></i></a></li>
                                 <li><a href="##"><i class="fa fa-envelope-o"></i><span class="badge">3</span></a></li>
                              </ul>
                              <ul class="user_profile_dd">
                                 <li>
                                    <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="images/layout_img/user_img.jpg" alt="##" /><span class="name_user">#session.userName#</span></a>
                                    <div class="dropdown-menu">
                                       <a class="dropdown-item" href="##">Settings</a>
                                       <a class="dropdown-item" onclick="logout();" href="##"><span>Log Out</span> <i class="fa fa-sign-out"></i></a>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
               <!-- end topbar -->
               <!-- dashboard inner -->
               <div class="midde_cont">
                  <div id="mainPanel" class="container-fluid"></div>
            </div>
         </div>
      </div>
      <!-- jQuery -->
      <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <!-- wow animation -->
      <script src="js/animate.js"></script>
      <!-- select country -->
      <!--- <script src="js/bootstrap-select.js"></script> --->
      
      <!-- owl carousel -->
      <script src="js/owl.carousel.js"></script> 
      <!-- chart js -->
      <script src="js/Chart.min.js"></script>
      <script src="js/Chart.bundle.min.js"></script>
      <script src="js/utils.js"></script>
      <script src="js/analyser.js"></script>
      <!-- nice scrollbar -->
      <script src="js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('##sidebar');
      </script>
      <!-- custom js -->
      <script src="js/custom.js"></script>
      <script src="js/customize.js"></script>
      <script src="js/datatables.min.js"></script>
      <script src="js/sweetalert2.min.js"></script>
      <script src="js/moment.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="js/bootstrap-dialog.min.js"></script>
      <script src="plugin/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

   </body>

   <script>

      function loadContent(url) {
         $("##mainPanel").addClass("fade-out-cust");

         setTimeout(function() {
            $.ajax({
               url: url,
               success: function(result) {
               $("##mainPanel").html(result);
               $("##mainPanel").addClass("fade-in-cust");
               setTimeout(function() {
                  $("##mainPanel").removeClass("fade-out-cust");
               }, 250);
               }
            });
         }, 500);
      }

      function loadTabContent() {
         const tabs = document.querySelectorAll('[data-url]');

         tabs.forEach(tab => {
            const url = tab.getAttribute('data-url');

            fetch(url)
               .then(response => response.text())
               .then(data => {
               const tabContent = document.querySelector(tab.getAttribute('href'));
               tabContent.innerHTML = data;

               // Execute scripts in loaded content
               const scripts = tabContent.querySelectorAll('script');
               scripts.forEach(script => {
                  const newScript = document.createElement('script');
                  newScript.innerHTML = script.innerHTML;
                  document.body.appendChild(newScript);
               });
               })
               .catch(error => {
               console.error(`Error loading tab content: ${error}`);
               });
         });
      }

      loadContent("page-dashboard.cfm");

      $("##page_dashboard").click(function(){
         loadContent("page-dashboard.cfm");
      });

      $("##flight_form").click(function(){
         loadContent("flight_form.cfm");
      });

      $("##pilot_list").click(function(){
         loadContent("pilot_list.cfm");
      });

      $("##employee_area").click(function(){
         loadContent("module/management/employee/employee_list.cfm");
      });

      $("##attendance_form").click(function(){
         loadContent("module/management/attendance/attendance_list.cfm");
      });

      $("##attendance_record").click(function(){
         loadContent("module/management/attendance/attendance_record.cfm");
      });

      $("##advance_record").click(function(){
         loadContent("module/management/advance_salary/advance_record.cfm");
      });

      $("##payroll_record").click(function(){
         loadContent("module/management/payroll/payroll_record.cfm");
      });

   </script>
</html>
</cfif>
</cfoutput>