
<cfoutput>
<cfsetting showDebugOutput="No">

<cfquery name="data" datasource="higher">
   SELECT *
   FROM `users`
   WHERE id = #url.pilot_id#
</cfquery>

<cfquery name="cnt_qty_task" datasource="higher">
   SELECT flight_qty
   FROM `pilot_task`
   WHERE pilot_id = #url.pilot_id#
   AND DATE_FORMAT(task_dt, "%m/%d/%Y") = '#url.task_dt#'
</cfquery>

<cfif cnt_qty_task.RecordCount EQ 0>
   <cfset task_qty = '0'>
<cfelse>
   <cfset task_qty = cnt_qty_task.flight_qty>
</cfif>

<cfset table_id = 'pilot_flight_list'>

<div class="row mt-5">
   <div class="col-md-12">
      <div class="white_shd full margin_bottom_30">
         <div class="full graph_head">
            <div class="heading1 margin_0">
               <h2>Pilot Task Info</h2>
            </div>
         </div>

         <div class="full price_table padding_infor_info" style="margin-bottom:-20px">
            <div class="row">
               <div class="col-sm-12">
                  <div class="panel">
                     <div class="panel-heading">
                        <b>Pilot Information</b>
                     </div>
                     <div class="panel-body">
                        <div class="row mb-space">
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">Full Name </label>
                                 <label class="col-sm-8 col-form-label text-primary">#data.fullname#</label>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">Post </label>
                                 <label class="col-sm-4 col-form-label text-primary">Pilot</label>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">I.C Number </label>
                                 <label class="col-sm-4 col-form-label text-primary">#data.ic_no#</label>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">Mobile</label>
                                 <label class="col-sm-4 col-form-label text-primary">#data.mobile#</label>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">Task Date</label>
                                 <label class="col-sm-4 col-form-label text-primary">#url.task_dt#</label>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">Total Flight</label>
                                 <label class="col-sm-4 col-form-label text-primary"><span id="dsp_task_qty">#task_qty#</span></label>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="padding_infor_info">
            <div class="col-sm-12">
               <table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
                  <thead>
                     <tr>
                        <th class="text-center" style="width:5%">No.</th>
                        <th class="text-center">Reference Num.</th>
                        <th class="text-center">Passanger Serial Num.</th>
                        <th class="text-center">Camera</th>
                        <th class="text-center"></th>
                     </tr>
                  </thead>
               </table>
            </div>
         </div>

      </div>
   </div>
</div>

<script>

   reload_#table_id# = function() {
			#table_id#.clearPipeline();
			#table_id#.ajax.reload(null, false);
		}

   var #table_id# = $('###table_id#').DataTable({
      "processing": true,
      "serverSide": true,
      "searching": true,
      "ordering": false,
      "initComplete" : function() 
			{
				var input = $('###table_id#_wrapper .dataTables_filter input').unbind(),
				self = this.api(),

				$searchButton = $('<button class="btn btn-sm btn-info">')
				.html('<i class="fa fa-search font-8></i><span class="font-8"> Search</span>')
				.click(function() {
					self.search(input.val()).draw();
				})

				input.bind('keyup', function(e){
					if (e.which == 13){
						self.search(input.val()).draw();
					}
				})

				$addButton = '<button type="button" class="btn btn-sm btn-primary font-6" onclick="manage_pilot_task(\'reg_flight\');">New Flight</button>';

				$('###table_id#_wrapper .dataTables_filter input').wrap( "<div class='input-group input-group-sm'></div>" ).after("<span class='input-group-btn'></span>");
				$('###table_id#_wrapper .dataTables_filter span.input-group-btn').append($searchButton,$addButton);
			},
      "ajax": $.fn.dataTable.pipeline({
         url: "module/pilot/pilot_task_data.cfm?#cgi.QUERY_STRING#"
         //pages: 5, // number of pages to cache
      }),
      "aoColumnDefs": 
      [
         {
            "aTargets": [0],
            "sClass": "text-center",
            render: function (data, type, row, meta) {
               return meta.row + meta.settings._iDisplayStart + 1;
            }
         },
         {
            "aTargets": [3],
            "sClass": "text-center",
            render: function (data, type, full) {
               if(data == 'Y')
               {
                  return 'Yes'
               }
               else
               {
                  return 'No'
               }
            }
         },
         {
            "aTargets": [4],
            "sClass": "text-center",
            render: function (data, type, full) {

               var flight_info_btn = '<a type="button" title="Update" onclick="manage_pilot_task(\'updt_flight\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-pencil"></i></a>';
               var dlt_btn = '<a type="button" title="Delete" onclick="delete_item('+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-trash"></i></a>';
               return flight_info_btn + ' ' + dlt_btn;
            }
         }
      ]
   });

// settle

   manage_pilot_task = function(process,data)
      {
         if(process == 'reg_flight')
         {
            let param = $.param({
               pilot_id: '#url.pilot_id#',
               task_dt: '#url.task_dt#'
            });

            var title = 'Register New Flight';
            var target = 'module/pilot/pilot_flight_form.cfm?'+param;

         }

         if(process == 'updt_flight')
         {
            let param = $.param({
               flight_id: data
            });

            var title = 'Update Flight';
            var target = 'module/pilot/pilot_flight_form.cfm?'+param;

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

   function delete_item(data) {
      Swal.fire({
         title: 'Flight Will Be Deleted',
         text: 'Are You Sure!',
         icon: 'question',
         confirmButtonText: 'Okay'
      }).then((result) => {
         if (result.isConfirmed) 
         {
            $.ajax({
               url: 'module/pilot/pilot_flight_form_act.cfm',
               type: "POST",
               data : 
               {
                  action : 'delete',
                  flight_id : data
               },
               dataType: "script"
            });
         }
         else
         {
            Swal.fire("Alert!", "Process Fail", "error");	
         }
       });
	};

// settle
      
</script>

</cfoutput>