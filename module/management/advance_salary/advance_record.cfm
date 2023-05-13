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
	ORDER BY `created_date` DESC
</cfquery>

<cfset table_id = 'advance_record_list'>

<div class="row mt-5">
	<div class="col-sm-12">

		<div class="white_shd full margin_bottom_30">
			<div class="full graph_head">
			   <div class="heading1 margin_0">
				  <h2>Advance Record</b></h2>
			   </div>
			   <div class="pull-right box-tools">
					<a id="btn-reg-verification" onclick="open_modal()" class="btn btn-sm btn-primary" data-type="modal" title="Register Advance" data-title="Register Advance"><i class="fa fa-plus"></i> Register Advance</a>
				</div>
			</div>
		  <div class="full price_table padding_infor_info">
				<table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="text-center" style="width:5%">No.</th>
							<th class="text-center">Month</th>
							<th class="text-center">Year</th>
							<th class="text-center">Name</th>
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
 </div>

<script>

	var #table_id# = $('###table_id#').DataTable({

		"processing": true,
		"serverSide": true,
		"searching": true,
		"ordering": false,
		"ajax": $.fn.dataTable.pipeline({
			url: "module/management/advance_salary/advance_record_data.cfm",
			type: "POST",
			dataType: "script"
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
				"aTargets": [ 4 ],
				"sClass": "text-right",
				render: function (data,type,full)
				{
					return $.fn.dataTable.render.number(',', '.', 2).display(data);
				}
			},
			{
				"aTargets": [ 5 ],
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
				"aTargets": [ 6 ],
				"sClass": "text-center",
				"mRender": function ( data, type, row ) {
					return moment(data).format("DD/MM/YYYY");
				}
			},
			{
				"aTargets": [ 7 ],
				"sClass": "text-center",
				render: function (data, type, full) {

					var info_btn = '<a type="button" title="Kemaskini" onclick="open_modal(\'info\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-print"></i></a>';
					return info_btn;
				}
			}
		]
	});

	reload_#table_id# = function() {
      #table_id#.clearPipeline();
		#table_id#.ajax.reload(null, false);
    }

	function open_modal() 
	{
		var title = 'Advance Form';
		var target = 'module/management/advance_salary/advance_form.cfm';
	
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
				},
				{
					label: 'Submit',
					cssClass: 'btn-primary',
					action: function(dialogItself){
						var month = $("##month").val();
						var advance_amt = $("##advance_amt").val();
						var payment_dt = $("##payment_dt").val();
						var payment_ref = $("##payment_ref").val();
						var user_id = $("##user_id").val();

						$.post("module/management/advance_salary/advance_act.cfm", //Required URL of the page on server
						{ // Data Sending With Request To Server
							month:month,
							advance_amt:advance_amt,
							payment_dt:payment_dt,
							payment_ref:payment_ref,
							user_id:user_id
						},
						function(){ // Required Callback Function
						}, "script");
					}
				}]
			});
	}

</script>

</cfoutput>