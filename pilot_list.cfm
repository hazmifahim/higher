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
		  <div class="full graph_head">
			 <div class="heading1 margin_0">
				<h2>Pilots On Duty</h2>
			 </div>
		  </div>
		  <div class="full price_table padding_infor_info">


				<table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="text-center" style="width:5%">No.</th>
							<th class="text-center">Name</th>
							<th class="text-center">I.C Number</th>
							<th class="text-center">Gender</th>
							<th class="text-center">Mobile Num</th>
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
			url: "pilot_list_data.cfm"
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
				"aTargets": [5],
				"sClass": "text-center",
				render: function (data, type, full) {

					var info_btn = '<a type="button" title="Kemaskini" onclick="open_modal(\'info\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-info"></i></a>';
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