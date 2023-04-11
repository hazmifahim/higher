
<cfoutput>
<cfsetting showDebugOutput="No">

<cfquery name="data" datasource="higher">
   SELECT 
      a.id,
      a.fullname,
      a.flight_dt,
      b.description AS `location`,
      a.pax_qty
   FROM flight a 
   LEFT JOIN lt_location b ON (a.location_id = b.id)
   WHERE a.id = #url.id#
</cfquery>

<cfset table_id = 'reg_passenger_list'>

<div class="row mt-5">
   <div class="col-md-12">
      <div class="white_shd full margin_bottom_30">
         <div class="full graph_head">
            <div class="heading1 margin_0">
               <h2>Passenger Detail</h2>
            </div>
         </div>

         <div class="full price_table padding_infor_info">
            <div class="row">
               <div class="col-sm-12">
                  <div class="panel">
                     <div class="panel-heading">
                        <b><i class="fa fa-info-circle"></i>&nbsp; Flight General Information</b>
                     </div>
                     <div class="panel-body">
                        <div class="row mb-space">
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">Full Name </label>
                                 <div class="col-sm-8">
                                    <input type="text" class="form-control" value="#data.fullname#" readonly>
                                 </div>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">Flight Date</label>
                                 <div class="col-sm-8">
                                    <input type="text" class="form-control" value="#dateformat(data.flight_dt,'dd/mm/yyyy')#" readonly>
                                 </div>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">Location </label>
                                 <div class="col-sm-8">
                                    <input type="text" class="form-control" value="#data.location#" readonly>
                                 </div>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="row">
                                 <label class="col-sm-4 col-form-label">Pax Quantity</label>
                                 <div class="col-sm-8">
                                    <input type="text" class="form-control" value="#data.pax_qty#" readonly>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="full price_table padding_infor_info" style="margin-top:-60px">
            <div class="row">
               <div class="col-sm-12">
                  <div class="panel">
                     <div class="panel-heading">
                        <b><i class="fa fa-list"></i>&nbsp; List Of Passenger</b>
                     </div>
                     <div class="panel-body">
                        <div class="row mb-space">
                           <div class="col-sm-12">
                              <table id="#table_id#" class="table table-bordered small-font table-striped table-hover" cellspacing="0" width="100%">
                                 <thead>
                                    <tr>
                                       <th class="text-center" style="width:5%">No.</th>
                                       <th class="text-center">Name</th>
                                       <th class="text-center">Age Type</th>
                                       <th class="text-center">Pilot</th>
                                       <th class="text-center">Driver</th>
                                       <th class="text-center"></th>
                                    </tr>
                                 </thead>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="full price_table padding_infor_info" style="margin-top:-60px">
            <div class="row">
               <div class="col-sm-12">
                  <button type="button" onclick="save_btn();" class="btn cur-p btn-success"  style="float:right"><i class="fa fa-save"></i>&nbsp; Save</button>
               </div>
            </div>
         </div>


      </div>
   </div>
</div>

<script>

   var #table_id# = $('###table_id#').DataTable({
   "lengthChange": false,
   "processing": true,
   "serverSide": true,
   // "searching": true,
   "ordering": false,
   "initComplete" : function() {
        var input = $('###table_id#_wrapper .dataTables_filter input').unbind(),
          self = this.api(),
          $searchButton = $('<button class="btn btn-sm btn-info">')
                 .text('Search')
                 .click(function() {
                  self.search(input.val()).draw();
                 })
          input.bind('keyup', function(e){
            if (e.which == 13){
              self.search(input.val()).draw();
            }
          })
        $daftarButton = '<button type="button" class="btn btn-sm btn-primary" onclick="mng_reg_passenger(\'add\');">Add Passenger</button>'

        $('###table_id#_wrapper .dataTables_filter input').wrap( "<div class='input-group input-group-sm'></div>" ).after("<span class='input-group-btn'></span>");
        $('###table_id#_wrapper .dataTables_filter span.input-group-btn').append($searchButton,$daftarButton);
      },
   "ajax": $.fn.dataTable.pipeline({
      url: "flight_passenger_list_data.cfm"
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

            var info_btn = '<a type="button" title="Kemaskini" onclick="mng_reg_passenger(\'delete\','+full[0]+');" href="##" class="circle-btn circle-btn-warning"><i class="fa fa-times" style="color:red"></i></a>';
            return info_btn;
         }
      }
   ]
   });

   reload_#table_id# = function() {
      #table_id#.clearPipeline();
		#table_id#.ajax.reload(null, false);
    }

   mng_reg_passenger = function(process,data)
      {
         if(process == 'add')
         {
            let param = $.param({
               flight_id : '#url.id#'
            });

            var title = 'Passenger Detail';
            var target = 'flight_passenger_form.cfm?'+param;

            BootstrapDialog.show({
               size: BootstrapDialog.SIZE_WIDE,
               type: 	BootstrapDialog.TYPE_PRIMARY,
               title: title,
               closable: true,
               closeByBackdrop: true,
               closeByKeyboard: false,
               buttons: [{
                     label: 'Close',
                     action: function(dialogItself){
                        dialogItself.close();
                     }
                  }],
                  onshown: function(dialogRef){
                     $('##'+dialogRef.options.id+' .bootstrap-dialog-message').load(target)
                  }
				});
         }

      if(process == 'delete')
         {
            Swal.fire({
               title: 'Delete Passenger?',
               text: 'Are You Sure',
               icon: 'warning',
               confirmButtonText: 'Yes',
               allowOutsideClick: false,
               showCancelButton: true
            }).then((result) => {
               $.ajax({
                  url: 'flight_passenger_form_act.cfm',
                  type: "POST",
                  data : 
                        {
                           id : data,
                           action : 'delete'
                        },
                  dataType: "script"
               });
            });
         }
      }
   
</script>

</cfoutput>