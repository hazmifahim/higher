<cfoutput>
<cfsetting showDebugOutput="No">

<cfquery name="data" datasource="higher"> 
   SELECT *
   FROM users
   WHERE id = #url.pilot_id#
</cfquery>

<div class="row">
   <!-- user profile section --> 
   <!-- profile image -->
   <div class="col-lg-12">
      <div class="full dis_flex center_text">
         <div class="profile_img"><img width="180" class="rounded-circle" src="images/layout_img/user_img.jpg" alt="##" /></div>
         <div class="profile_contant">
            <div class="contact_inner">
               <h3>#data.fullname# <small>(#data.name#)</small></h3>
               <p><strong>Role: </strong>Pilot</p>
               <ul class="list-unstyled">
                  <li><i class="fa fa-envelope-o"></i> : #data.email#</li>
                  <li><i class="fa fa-phone"></i> : #data.mobile#</li>
               </ul>
            </div>
            <div class="user_progress_bar">
               <div class="progress_bar">
                  <!-- Skill Bars -->
                  <span class="skill" style="width:45%;">Total Number Of Flights <span class="info_valume">1000</span></span>                   
                  <div class="progress skill-bar ">
                     <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%;">
                     </div>
                  </div>
                  <span class="skill" style="width:55%;">Number Of Flights This Year (#YEAR(NOW())#)<span class="info_valume">257</span></span>                   
                  <div class="progress skill-bar ">
                     <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" style="width: 55%;">
                     </div>
                  </div>
                  <span class="skill" style="width:78%;">Glider Lifespan <span class="info_valume">78%</span></span>   
                  <div class="progress skill-bar">
                     <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%;">
                     </div>
                  </div>
                  <span class="skill" style="width:47%;">Key Performance Indicator <span class="info_valume">47%</span></span>
                  <div class="progress skill-bar">
                     <div class="progress-bar progress-bar-animated progress-bar-striped" role="progressbar" aria-valuenow="54" aria-valuemin="0" aria-valuemax="100" style="width: 54%;">
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!--- <!-- profile contant section -->
      <div class="full inner_elements margin_top_30">
         <div class="tab_style2">
            <div class="tabbar">
               <nav>
                  <div class="nav nav-tabs" id="nav-tab" role="tablist">
                     <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="##recent_activity" role="tab" aria-selected="true">Recent Activity</a>
                     <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="##project_worked" role="tab" aria-selected="false">Projects Worked on</a>
                     <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="##profile_section" role="tab" aria-selected="false">Profile</a>
                  </div>
               </nav>
               <div class="tab-content" id="nav-tabContent">
                  <div class="tab-pane fade show active" id="recent_activity" role="tabpanel" aria-labelledby="nav-home-tab">
                     <div class="msg_list_main">
                        <ul class="msg_list">
                           <li>
                              <span><img src="images/layout_img/msg2.png" class="img-responsive" alt="##"></span>
                              <span>
                              <span class="name_user">Taison Jack</span>
                              <span class="msg_user">Sed ut perspiciatis unde omnis.</span>
                              <span class="time_ago">12 min ago</span>
                              </span>
                           </li>
                           <li>
                              <span><img src="images/layout_img/msg3.png" class="img-responsive" alt="##"></span>
                              <span>
                              <span class="name_user">Mike John</span>
                              <span class="msg_user">On the other hand, we denounce.</span>
                              <span class="time_ago">12 min ago</span>
                              </span>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="tab-pane fade" id="project_worked" role="tabpanel" aria-labelledby="nav-profile-tab">
                     <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et 
                        quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos 
                        qui ratione voluptatem sequi nesciunt.
                     </p>
                  </div>
                  <div class="tab-pane fade" id="profile_section" role="tabpanel" aria-labelledby="nav-contact-tab">
                     <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et 
                        quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos 
                        qui ratione voluptatem sequi nesciunt.
                     </p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end user profile section --> --->
   </div>
</div>

<script>
   
</script>

</cfoutput>