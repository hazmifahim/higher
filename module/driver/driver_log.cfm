<cfoutput>
<cfsetting showDebugOutput="No">

<style>
   table.dataTable thead th, table.dataTable thead td {
		vertical-align : middle;
	}
</style>

<cfquery name="data" datasource="higher">
   SELECT *
   FROM `users`
   WHERE id = #url.driver_id#
</cfquery>

<cfquery name="cnt_qty_trip" datasource="higher">
   SELECT trip_qty
   FROM `driver_log`
   WHERE driver_id = #url.driver_id#
   AND DATE_FORMAT(log_dt, "%m/%d/%Y") = '#url.log_dt#'
</cfquery>

<cfif cnt_qty_trip.RecordCount EQ 0>
   <cfset log_qty = '0'>
<cfelse>
   <cfset log_qty = cnt_qty_trip.trip_qty>
</cfif>

<cfset table_id = 'driver_log_list'>

<div class="row mt-5">
   <div class="col-md-12">
      <div class="white_shd full margin_bottom_30">
         <div class="full graph_head">
            <div class="heading1 margin_0">
               <h2>Driver's Transport Log</h2>
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
                                 <label class="col-sm-4 col-form-label text-primary">Driver</label>
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
                                 <label class="col-sm-4 col-form-label">Log Date</label>
                                 <label class="col-sm-4 col-form-label text-primary">#url.log_dt#</label>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">Total Trip</label>
                                 <label class="col-sm-4 col-form-label text-primary"><span id="dsp_log_qty">#log_qty#</span></label>
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
                        <th rowspan="2" class="text-center" style="width:5%">No.</th>
                        <th rowspan="2" class="text-center">Reference Num.</th>
                        <th rowspan="2" class="text-center">From</th>
                        <th rowspan="2" class="text-center">To</th>
                        <th rowspan="2" class="text-center">Time</th>
                        <th rowspan="2" class="text-center">Authorize</th>
                        <th colspan="5" class="text-center">Trip Remark</th>
                        <th rowspan="2" class="text-center"></th>
                     </tr>
                     <tr>
                        <th class="text-center">A</th>
                        <th class="text-center">B</th>
                        <th class="text-center">C</th>
                        <th class="text-center">D</th>
                        <th class="text-center">E</th>
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

				$addTripButton = '<button type="button" class="btn btn-sm btn-primary font-6" onclick="manage_driver_log(\'reg_trip\');">New Trip</button>';

				$('###table_id#_wrapper .dataTables_filter input').wrap( "<div class='input-group input-group-sm'></div>" ).after("<span class='input-group-btn'></span>");
				$('###table_id#_wrapper .dataTables_filter span.input-group-btn').append($searchButton,$addTripButton);
			},
      "ajax": $.fn.dataTable.pipeline({
         url: "module/driver/driver_log_data.cfm?#cgi.QUERY_STRING#"
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
				"aTargets": [4],
				"sClass": "text-center",
				render: function (data, type, row) {
					const newDate = new Date(data);
					if (data == "") {
						return ''
					} else {
					return newDate.toLocaleTimeString();
					}
				}
			},
         {
            "aTargets": [6],
            "sClass": "text-center",
            render: function (data, type, full) {
               if(data == 1)
               {
                  return '<i class="fa fa-check text-success"></i>'
               }
               else
               {
                  return '';
               }
            }
         },
         {
            "aTargets": [7],
            "sClass": "text-center",
            render: function (data, type, full) {
               if(full[6] == 2)
               {
                  return '<i class="fa fa-check text-success"></i>'
               }
               else
               {
                  return '';
               }
            }
         },
         {
            "aTargets": [8],
            "sClass": "text-center",
            render: function (data, type, full) {
               if(full[6] == 3)
               {
                  return '<i class="fa fa-check text-success"></i>'
               }
               else
               {
                  return '';
               }
            }
         },
         {
            "aTargets": [9],
            "sClass": "text-center",
            render: function (data, type, full) {
               if(full[6] == 4)
               {
                  return '<i class="fa fa-check text-success"></i>'
               }
               else
               {
                  return '';
               }
            }
         },
         {
            "aTargets": [10],
            "sClass": "text-center",
            render: function (data, type, full) {
               if(full[6] == 5)
               {
                  return '<i class="fa fa-check text-success"></i>'
               }
               else
               {
                  return '';
               }
            }
         },
         {
            "aTargets": [11],
            "sClass": "text-center",
            render: function (data, type, full) {

               var flight_info_btn = '<a type="button" title="Update" onclick="manage_driver_log(\'updt_trip\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-pencil"></i></a>';
               var dlt_btn = '<a type="button" title="Delete" onclick="delete_trip('+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-trash"></i></a>';
               return flight_info_btn + ' ' + dlt_btn;
            }
         }
      ]
   });

// settle

   manage_driver_log = function(process,data)
      {
         if(process == 'reg_trip')
         {
            let param = $.param({
               driver_id: '#url.driver_id#',
               log_dt: '#url.log_dt#'
            });

            var title = 'Register New trip';
            var target = 'module/driver/driver_trip_form.cfm?'+param;

         }

         if(process == 'updt_trip')
         {
            let param = $.param({
               trip_id: data
            });

            var title = 'Update Trip';
            var target = 'module/driver/driver_trip_form.cfm?'+param;

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

   function delete_trip(data) {
      Swal.fire({
         title: 'Trip Will Be Deleted',
         text: 'Are You Sure!',
         icon: 'question',
         confirmButtonText: 'Okay'
      }).then((result) => {
         if (result.isConfirmed) 
         {
            $.ajax({
               url: 'module/driver/driver_trip_form_act.cfm',
               type: "POST",
               data : 
               {
                  action : 'delete',
                  trip_id : data
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