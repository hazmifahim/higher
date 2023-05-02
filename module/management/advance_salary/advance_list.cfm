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

<cfset table_id = 'advance_list'>

<div class="row mt-5">
	<div class="col-md-12">
	   <div class="white_shd full margin_bottom_30">
		  <div class="full graph_head">
			 <div class="heading1 margin_0">
				<h2>Attendance For <b>#dateFormat(now(),'dd-mm-yyyy')#</b></h2>
			 </div>
		  </div>
		  <div class="full price_table padding_infor_info">


				<table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="text-center" style="width:5%">No.</th>
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
			url: "module/management/advance_salary/advance_list_data.cfm"
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
				"aTargets": [3,4],
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
				"aTargets": [5],
				"sClass": "text-center",
				render: function (data, type, full) {

					var info_btn = '<a type="button" title="Kemaskini" onclick="open_modal(\'info\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-pencil"></i></a>';
					return info_btn;
				}
			}
		]
	});

	reload_#table_id# = function() {
      #table_id#.clearPipeline();
		#table_id#.ajax.reload(null, false);
    }

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