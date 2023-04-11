<cfoutput>

<style>
	table.table-bordered.dataTable tbody th, table.table-bordered.dataTable tbody td {
		vertical-align : middle;
	}
</style>

<cfset table_id = 'pop_pilot_list'>

<div class="row mt-5">
	<div class="col-md-12">
	
		  <div class="full price_table padding_infor_info">

				<table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="text-center" style="width:5%">No.</th>
							<th class="text-center">Name</th>
							<th class="text-center">I.C Number</th>
							<th class="text-center">Gender</th>
							<th class="text-center">Mobile Num</th>
						</tr>
					</thead>
				</table>
			   
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
	"initComplete": function (oSettings, json) {
		var label = json.label;
		$('###table_id# tbody').on('click', 'tr', function () 
		{
			<cfloop list = "#url.get_me#" delimiters = ";" index = "items"> 
				<cfif listgetat(items, 1, ":") EQ "callback">
					<cfset fn_name = listgetat(items, 2, ":")> 
				<cfelse>
					$('###listgetat(items,1,":")#').val(#table_id#.row(this).data()[label.indexOf("#listgetat(items,2,": ")#")]);
				</cfif>
			</cfloop>
			<cfif isdefined("fn_name") AND fn_name NEQ "" >
				#fn_name#();
			</cfif>
			BootstrapDialogCloseTop();
		});
	},
	"ajax": $.fn.dataTable.pipeline({
		url: "pop_pilot_data.cfm"
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
		}
	]
	});



</script>

</cfoutput>