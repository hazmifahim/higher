<cfoutput>

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

      <!-- custom css -->
      <link rel="stylesheet" href="css/custom.css" />
      <link rel="stylesheet" href="css/datatables.min.css">
      <link rel="stylesheet" href="css/sweetalert2.min.css">
      <link rel="stylesheet" href="css/jquery-ui.min.css">

      <link rel="stylesheet" href="plugin/floating-ws/whatsapp-chat.css">
      <link href="build/css/bootstrap-datetimepicker.css" rel="stylesheet">

   </head>

   <cfif isdefined("session.userName")>
      <cflocation url="intro.cfm" addtoken="No">
   <cfelse>  
   <body class="inner_page login">
      <div class="full_container">
         <div class="container">
            <div class="center verticle_center full_height">
               <div class="login_section">
                  <div class="logo_login">
                     <div class="center">
                        <img width="210" src="images/logo/logo.png" alt="##" />
                     </div>
                  </div>
                  <div class="login_form">
                     <form id="loginform">
                        <fieldset>
                           <div class="field">
                              <label class="label_field">Username</label>
                              <input type="name" id="username" name="username" placeholder="Username" />
                           </div>
                           <div class="field">
                              <label class="label_field">Password</label>
                              <input type="password" id="password" name="password" placeholder="Password" />
                           </div>
                           <div class="field">
                              <label class="label_field hidden">hidden label</label>
                              <label class="form-check-label"><input type="checkbox" class="form-check-input"> Remember Me</label>
                              <a class="forgot" href="">Forgotten Password?</a>
                           </div>
                           <div class="field margin_0">
                              <label class="label_field hidden">hidden label</label>
                              <button type="button" class="main_bt" onclick="logMe();">Sign In</button>
                           </div>
                        </fieldset>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <div id="myButton">test</div>
   </cfif>

      <!-- jQuery -->
      <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
      <!--- <script src="js/popper.min.js"></script> --->
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

      <script src="js/customize.js"></script>
      <script src="js/datatables.min.js"></script>
      <script src="js/sweetalert2.min.js"></script>
      <script src="js/moment.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="plugin/datepicker/build/js/bootstrap-datetimepicker.min.js"></script>

   </body>

</html>

<script>
   whatsappchat.multipleUser(
       {
           selector: '##myButton',
           users: [
               {
                   name:'Joey Tribbiani',
                   phone: '8801343434343',
                   designation: 'Customer Support',
                   image : 'https://upload.wikimedia.org/wikipedia/en/d/da/Matt_LeBlanc_as_Joey_Tribbiani.jpg'
               },
               {
                   name:'Chandler Bing',
                   phone: '8801343434343',
                   designation: 'Customer Support',
                   image: 'https://upload.wikimedia.org/wikipedia/en/6/66/Matthew_Perry_as_Chandler_Bing.png'

               },
               {
                   name:'Kazi Naimul Hoque',
                   phone: '8801343434343',
                   active: false
               },
           ],
           headerMessage: 'You can also terus pergi contact <b>SUHAIL</b>',
           chatBoxMessage: 'Team replies in a minute',
           color: '##25D366'
       }
   );
</script>

</cfoutput>