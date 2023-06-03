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

<cfquery name="get_payslips" datasource="higher">
	SELECT * FROM `payslips`
	WHERE `user_id` = #url.employee_id#
	ORDER BY `created_date` DESC
	
</cfquery>

<cfset table_id = 'payslips_record'>

<div class="row">
	<div class="col-sm-12">
		  <div class="full price_table ">
				<table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="text-center" style="width:5%">No.</th>
							<th class="text-center">Month / Year</th>
							<th class="text-center">Total Payment (RM)</th>
							<th class="text-center"></th>
						</tr>
						
						<!--- <cfloop query="get_payslips">
							<tr>
								<td class="text-center">#currentrow#</td>
								<td class="text-center">#month# / #year#</td>
								<td class="text-center">#numberformat(gross_amount,'__,__.00')#</td>
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
			url: "module/management/employee/payslips_list_data.cfm",
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

					return monthName+' '+full[5];
				}
			},
			{
				"aTargets": [ 2 ],
				"sClass": "text-right",
				render: function (data,type,full)
				{
					return $.fn.dataTable.render.number(',', '.', 2).display(data);
				}
			},
			{
				"aTargets": [3],
				"sClass": "text-center",
				render: function (data, type, full) {

					var info_btn = '<a type="button" title="Kemaskini" onclick="print_payslip(\'payslip\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-print"></i></a>';
					return info_btn;
				}
			}
		]
	});

	function print_payslip(process,data) 
		{
			if(process == 'payslip')
				{
					let param = $.param({
						id: data
					});

					var refh = '/higher/module/print/payslip.cfm?'+param;
					var encodedRef = encodeURIComponent(refh);
				}

			BootstrapDialog.show({
				size: BootstrapDialog.SIZE_WIDE,
				type: 	BootstrapDialog.TYPE_PRIMARY,
				title: 'Payslip For',
				message: '<div><iframe width="100%" height="800px" frameborder="0" scrolling="no" src="plugin/pdfjs/web/goviewer.cfm?file='+encodedRef+'"></iframe></div>',
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