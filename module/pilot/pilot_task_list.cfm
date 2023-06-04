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

<cfset table_id = 'pilot_task_by_date'>

<div class="row mt-5">
	<div class="col-md-12">
	   <div class="white_shd full margin_bottom_30">
			<div class="full graph_head mb-5">
				<div class="heading1 margin_0">
					<h2>Pilot's Task On <b><span class="text-primary" id="dsp_dt"></span></b></h2>
				</div>
			</div>	
			<form id="task_filter" name="task_filter" role="form">
				<div class="col-sm-12">
					<div class="col-sm-6">
						<div class="row">
							<label class="col-sm-4 col-form-label">Flight Date</label>
							<div class="col-sm-8">
								<div class="input-group date">
									<input type="text" class="form-control input-sm" name="date_filter" id="date_filter" value="#dateFormat(NOW(),'dd/mm/yyyy')#">
									<span class="input-group-btn">
										<button id="search_date" type="button" class="btn cur-p btn-primary"><i class="fa fa-search"></i></button>
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
			url: "module/pilot/pilot_task_list_data.cfm",
			method: 'GET',
				"data": function(d) {
				var dataFrom = $('##task_filter').serializeArray();
				$.each(dataFrom, function(key, val) {
					d[val.name] = val.value;
				});
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
				"aTargets": [5],
				"sClass": "text-center",
				render: function (data, type, full) {

					var info_btn = '<a type="button" title="Kemaskini" onclick="open_task(\'task\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-info"></i></a>';
					return info_btn;
				}
			}
		]
	});

	$('##dsp_dt').text($('##date_filter').val());

	$('##search_date').on('click',function(){
		#table_id#.clearPipeline();
		#table_id#.ajax.reload();

		$('##dsp_dt').text($('##date_filter').val());
	});


	function open_task(process,data) 
		{
			var task_dt = $('##date_filter').val();

			if(process == 'task')
			{
				loadContent("module/pilot/pilot_task.cfm?pilot_id=" + data + '&task_dt=' + task_dt);
			}
		}

</script>

</cfoutput>