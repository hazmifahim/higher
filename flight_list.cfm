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

<cfset table_id = 'all_booking_list'>

<div class="row mt-5">
	<div class="col-md-12">
	   <div class="white_shd full margin_bottom_30">
		  <div class="full graph_head mb-5">
			 <div class="heading1 margin_0">
				<h2>List Of All Flights</h2>
			 </div>
		  </div>
		  <form id="flight_filter" name="flight_filter" role="form">
			<div class="col-sm-12">
				<div class="col-sm-6">
					<div class="row">
						<label class="col-sm-4 col-form-label">Flight Date</label>
						<div class="col-sm-8">
							<div class="input-group date">
								<input type="text" class="form-control input-sm" name="date_filter" id="date_filter" placeholder="Choose date..." value="">
								<span class="input-group-btn">
									<button id="search_flight_date" type="button" class="btn cur-p btn-primary"><i class="fa fa-search"></i></button>
								</span> 
							</div>
						</div>
					</div>
				</div>
			</div>
		  </form>
		  <div class="full price_table padding_infor_info">
				<table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="text-center" style="width:5%">No.</th>
							<th class="text-center">Name</th>
							<th class="text-center">Location</th>
							<th class="text-center">No. Of Pax</th>
							<th class="text-center">Status</th>
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

	$(document).ready(function() {
			$("##date_filter").datepicker({
				dateFormat: "dd/mm/yy"
			});
		});

	var #table_id# = $('###table_id#').DataTable({

		"processing": true,
		"serverSide": true,
		"searching": true,
		"ordering": false,
		"ajax": $.fn.dataTable.pipeline({
			url: "flight_list_data.cfm",
			method: 'GET',
				"data": function(d) {
				var dataFrom = $('##flight_filter').serializeArray();
				$.each(dataFrom, function(key, val) {
					d[val.name] = val.value;
				});
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
				"aTargets": [3],
				"sClass": "text-center"
			},
			{
				"aTargets": [4],
				"sClass": "text-center",
				render: function (data, type, full) {
					if(data == 'In Progress')
					{
						return '<b><span style="color:orange">' + data + '</span></b>'
					}
					else
					{
						return '<b><span style="color:green">' + data + '</span></b>'
					}
				}
			},
			{
				"aTargets": [5],
				"sClass": "text-center",
				render: function (data, type, full) {

					var info_btn = '<a type="button" title="Kemaskini" onclick="open_modal(\'info\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-info"></i></a>';
					return info_btn;
				}
			}
		]
	});

	$('##search_flight_date').on('click',function(){
		#table_id#.clearPipeline();
		#table_id#.ajax.reload();
	});

	function open_modal(process,data) 
		{
			if(process == 'info')
			{
				let param = $.param({
					id: data
				});

				var title = 'Pilot Info';
				var target = 'pilot_info.cfm?'+param;
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