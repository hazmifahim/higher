<cfoutput>

<style>
	table.table-bordered.dataTable tbody th, table.table-bordered.dataTable tbody td {
		vertical-align : middle;
	}
	.circle-btn {
		display: inline-block;
		position: relative;
		cursor: pointer;
		width: 23px;
		height: 23px;
		border: 2px solid ##ddd;
		padding: 0;
		text-decoration: none!important;
		text-align: center;
		background: ##fff;
		font-size: 12px;
		font-weight: 400;
		line-height: 1.7em;
		border-radius: 27px;
	}
	.circle-btn:hover {
		opacity: 0.7;
	}
	.circle-btn-warning {
		border-color: ##f39c12;
		color: ##f39c12;
	}

</style>

<cfquery name="get_attendance" datasource="higher">
	SELECT * FROM `attendance`
	WHERE `user_id` = #url.employee_id#
	ORDER BY `created_date` DESC
	
</cfquery>

<cfset table_id = 'attendance_record'>

<div class="row">
	<div class="col-sm-12">
		  <div class="full price_table ">
				<table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="text-center" style="width:5%">No.</th>
							<th class="text-center">Date</th>
							<th class="text-center">Clock In</th>
							<th class="text-center">Clock Out</th>
							<th class="text-center">Status</th>
							<th class="text-center"></th>
						</tr>
						
						<!--- <cfloop query="get_attendance">
							<tr>
								<td class="text-center">#currentrow#</td>
								<td class="text-center">#dateFormat(created_date,'dd-mm-yyyy')#</td>
								<td class="text-center">#TimeFormat(clock_in_datetime,'hh:nn:ss tt')#</td>
								<td class="text-center">#TimeFormat(clock_out_datetime,'hh:nn:ss tt')#</td>
								<td class="text-center">
									<cfif TimeFormat(clock_in_datetime,'HH:nn:ss') GT '08:00:00'>
										<b>Clock-In : <span class="text-danger">LATE</span></b><br>
									<cfelse>
										<b>Clock-In : <span class="text-success">ON TIME</span></b><br>
									</cfif>
									<cfif TimeFormat(clock_out_datetime,'HH:nn:ss') LT '17:00:00'>
										<b>Clock-Out : <span class="text-danger">EARLY</span></b><br>
									<cfelse>
										<b>Clock-Out : <span class="text-success">ON TIME</span></b><br>
									</cfif>
								</td>
								<td class="text-center"></td>
							</tr>
						</cfloop> --->
						
					</thead>
				</table>
			   

		  </div>
	</div>
 </div>

<script>

	var #table_id# = $('###table_id#').DataTable({

		"processing": true,
		"serverSide": true,
		"searching": true,
		"ordering": false,
		"ajax": $.fn.dataTable.pipeline({
			url: "module/management/employee/attendance_list_data.cfm",
			type: "POST",
			dataType: "script",
			data: {
				user_id: #url.employee_id#
			}
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
				"aTargets": [ 1 ],
				"sClass": "text-center",
				"mRender": function ( data, type, row ) {
					return moment(data).format("DD/MM/YYYY");
				}
			},
			{
				"aTargets": [ 2,3 ],
				"sClass": "text-center",
				render: function (data,type,full)
				{
					var now = new Date(data);
					var time = now.toLocaleTimeString();

					return time;
				}
			},
			{
				"aTargets": [ 4 ],
				"sClass": "text-center",
				"mRender": function ( data, type, row ) {
					var date_in = new Date(row[2]);
					var date_out = new Date(row[3]);

					var date_in_time = date_in.getHours().toString().padStart(2, '0') + ':' + date_in.getMinutes().toString().padStart(2, '0') + ':' + date_in.getSeconds().toString().padStart(2, '0');
					var date_out_time = date_out.getHours().toString().padStart(2, '0') + ':' + date_out.getMinutes().toString().padStart(2, '0') + ':' + date_in.getSeconds().toString().padStart(2, '0');
					
					if (date_in_time > '9:00:00') {
						return 'late'
					} else {
						return 'early'
					}

					if (date_out_time > '17:00:00') {
						return 'on time'
					} else {
						return 'early'
					}

				}
			},
			{
				"aTargets": [5],
				"sClass": "text-center",
				render: function (data, type, full) {

					var info_btn = '<a type="button" title="Kemaskini" onclick="open_modal(\'info\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-pencil"></i></a>';
					return info_btn;
				}
			}
		]
	});

	function open_modal(process,data) 
		{
			if(process == 'info')
			{
				let param = $.param({
					id: data
				});

				var title = 'Attendance Info';
				var target = 'attendance_form.cfm?'+param;
			}

			BootstrapDialog.show({
				size: BootstrapDialog.SIZE_WIDE,
				type: 	BootstrapDialog.TYPE_PRIMARY,
				title: title,
				message: $('<div></div>').load(target),
				closable: true,
				closeByBackdrop: true,
				closeByKeyboard: false,
				buttons: [{
						label: 'Close',
						action: function(dialogItself){
							dialogItself.close();
						}
					}]
				});
		}

</script>

</cfoutput>