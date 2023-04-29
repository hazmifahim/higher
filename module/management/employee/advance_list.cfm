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

<cfquery name="get_advance" datasource="higher">
	SELECT * FROM `advance_salary`
	WHERE `user_id` = #url.employee_id#
	ORDER BY `created_date` DESC
</cfquery>

<cfset table_id = 'advance_record'>

<div class="row">
	<div class="col-sm-12">
		  <div class="full price_table ">
				<table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="text-center" style="width:5%">No.</th>
							<th class="text-center">Month</th>
							<th class="text-center">Year</th>
							<th class="text-center">Total Advance (RM)</th>
							<th class="text-center">Payment Status</th>
							<th class="text-center">Payment Date</th>
							<th class="text-center"></th>
						</tr>
						
						<!--- <cfloop query="get_advance">
							<tr>
								<td class="text-center">#currentrow#</td>
								<td class="text-center">#month#</td>
								<td class="text-center">#year#</td>
								<td class="text-center">#numberformat(advance_amount,'__,__.00')#</td>
								<td class="text-center">PAID</td>
								<td class="text-center">
									#payment_datetime#
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
			url: "module/management/employee/advance_list_data.cfm",
			type: "POST",
			dataType: "script",
			data: {
				user_id: #url.employee_id#
			}
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
				render: function (data,type,full)
				{
					var monthNumber = data;
					var monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
					var monthName = monthNames[monthNumber - 1];

					return monthName;
				}
			},
			{
				"aTargets": [ 2 ],
				"sClass": "text-center"
			},
			{
				"aTargets": [ 3 ],
				"sClass": "text-right",
				render: function (data,type,full)
				{
					return $.fn.dataTable.render.number(',', '.', 2).display(data);
				}
			},
			{
				"aTargets": [ 4 ],
				"sClass": "text-center",
				render: function (data,type,full)
				{
					if (data == '' || data == null)
					{
						return '<span class="text-danger">UNPAID</span>'
					} else {
						return '<span class="text-success">PAID</span>'
					}
				}
			},
			{
				"aTargets": [ 5 ],
				"sClass": "text-center",
				"mRender": function ( data, type, row ) {
					return moment(data).format("DD/MM/YYYY");
				}
			},
			{
				"aTargets": [6],
				"sClass": "text-center",
				render: function (data, type, full) {

					var info_btn = '<a type="button" title="Kemaskini" onclick="open_modal(\'info\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-print"></i></a>';
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
				var target = 'advance_form.cfm?'+param;
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