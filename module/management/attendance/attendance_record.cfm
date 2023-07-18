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

<cfset table_id = 'attendance_recordss'>
<cfset form_id = 'attendance_record_filter'>
<cfset curr_month = month(now())>

<div class="row mt-5">
	<div class="col-md-12">
	   <div class="white_shd full margin_bottom_30">
		  <div class="full graph_head mb-5">
			 <div class="heading1 margin_0">
				<h2>Attendance Record</b></h2>
			 </div>
		  </div>
		  <form id="#form_id#" name="#form_id#">
			<div class="col-sm-12">
				<div class="row" style="padding:20px">
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
								<option value="1" <cfif isDefined("curr_month") AND curr_month EQ 1>selected</cfif>>January</option>
								<option value="2" <cfif isDefined("curr_month") AND curr_month EQ 2>selected</cfif>>February</option>
								<option value="3" <cfif isDefined("curr_month") AND curr_month EQ 3>selected</cfif>>March</option>
								<option value="4" <cfif isDefined("curr_month") AND curr_month EQ 4>selected</cfif>>April</option>
								<option value="5" <cfif isDefined("curr_month") AND curr_month EQ 5>selected</cfif>>May</option>
								<option value="6" <cfif isDefined("curr_month") AND curr_month EQ 6>selected</cfif>>June</option>
								<option value="7" <cfif isDefined("curr_month") AND curr_month EQ 7>selected</cfif>>July</option>
								<option value="8" <cfif isDefined("curr_month") AND curr_month EQ 8>selected</cfif>>August</option>
								<option value="9" <cfif isDefined("curr_month") AND curr_month EQ 9>selected</cfif>>September</option>
								<option value="10" <cfif isDefined("curr_month") AND curr_month EQ 10>selected</cfif>>October</option>
								<option value="11" <cfif isDefined("curr_month") AND curr_month EQ 11>selected</cfif>>November</option>
								<option value="12" <cfif isDefined("curr_month") AND curr_month EQ 12>selected</cfif>>December</option>
							</select>
						</div>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="button_block"><button type="button" id="search_filter_attendance" class="btn cur-p btn-info float-right"><i class="fa fa-search"></i> Search</button></div>
					</div>
				</div>
			</div>
			
		  </form>
		  <div class="full price_table padding_infor_info">

				<table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="text-center" style="width:5%">No.</th>
							<th class="text-center">Date</th>
							<th class="text-center">Name</th>
							<th class="text-center">I.C Number</th>
							<th class="text-center">Clock In</th>
							<th class="text-center">Clock Out</th>
							<th class="text-center"></th>
						</tr>
					</thead>
				</table>
			   

		  </div>

	   </div>
	</div>
	<!-- end row -->
 </div>

<script>

	var #table_id# = $('###table_id#').DataTable({

		"processing": true,
		"serverSide": true,
		"searching": true,
		"ordering": false,
		"ajax": $.fn.dataTable.pipeline({
			url: "module/management/attendance/attendance_record_data.cfm",
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
				"mRender": function ( data, type, row ) {
					return moment(data).format("DD/MM/YYYY");
				}
			},
			{
				"aTargets": [4,5],
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
				"aTargets": [4,5],
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

					var info_btn = '<a type="button" title="Kemaskini" onclick="open_modal(\'info\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-pencil"></i></a>';
					return '';
				}
			}
		]
	});

	reload_#table_id# = function() {
      #table_id#.clearPipeline();
		#table_id#.ajax.reload(null, false);
    }

	$('##search_filter_attendance').on('click',function(){
		reload_#table_id#();
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
					},
					{
						label: 'Submit',
						cssClass: 'btn-primary',
						action: function(dialogItself){
							var clock_in = $("##clock_in").val();
							var clock_out = $("##clock_out").val();

							$.post("attendance_act.cfm", //Required URL of the page on server
							{ // Data Sending With Request To Server
								clock_in:clock_in,
								clock_out:clock_out,
								userid:data
							},
							function(){ // Required Callback Function
							}, "script");
						}
					}]
				});
		}

</script>

</cfoutput>