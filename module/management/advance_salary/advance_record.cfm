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
<cfset form_id = 'advance_record_filter'>

<div class="row mt-5">
	<div class="col-sm-12">

		<div class="white_shd full margin_bottom_30">
			<div class="full graph_head mb-5">
			   <div class="heading1 margin_0">
				  <h2>Advance Record</b></h2>
			   </div>
			   <div class="pull-right box-tools">
					<div class="button_block mt-2"><button type="button" onclick="open_modal()"  class="btn cur-p btn-primary"><i class="fa fa-plus"></i> Register Advance</button></div>
					<!--- <a id="btn-reg-verification" onclick="open_modal()" class="btn btn-sm btn-primary" data-type="modal" title="Register Advance" data-title="Register Advance"><i class="fa fa-plus"></i> Register Advance</a> --->
				</div>
			</div>
			<form id="#form_id#" name="#form_id#">
				<div class="row" style="padding:35px">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-5">
								<cfparam name="yr" default="#YEAR(now())#">
								<cfparam name="min_yr" default="#yr-5#">
								<div class="row">
								<label class="col-sm-4 col-form-label">Year </label>
								<div class="col-sm-8">
									<select name="yr" id="yr" class="form-control">
										<cfloop from="#yr#" to="#min_yr#" index="i" step="-1">
											<option value="#i#">#i#</option>
										</cfloop>
									</select>
								</div>
								</div>
							</div>
							<div class="col-sm-5">
								<div class="row">
								<label class="col-sm-4 col-form-label">Month </label>
								<div class="col-sm-8">
									<select class="form-control" id="mnth" name="mnth">
										<option value="1">January</option>
										<option value="2">February</option>
										<option value="3">March</option>
										<option value="4">April</option>
										<option value="5">May</option>
										<option value="6">June</option>
										<option value="7">July</option>
										<option value="8">August</option>
										<option value="9">September</option>
										<option value="10">October</option>
										<option value="11">November</option>
										<option value="12">December</option>
									</select>
								</div>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="button_block"><button type="button" id="search_filter_advance" class="btn cur-p btn-info float-right"><i class="fa fa-search"></i> Search</button></div>
							</div>
						</div>
					</div>
				</div>
			</form> --->
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
			method: 'POST',
				"data": function(d) {
				var dataFrom = $('###form_id#').serializeArray();
				$.each(dataFrom, function(key, val) {
					d[val.name] = val.value;
				});
				},
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

	$('##search_filter_advance').on('click',function(){
		reload_#table_id#();
	});

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