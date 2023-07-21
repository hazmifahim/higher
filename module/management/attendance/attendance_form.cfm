<cfoutput>

    <form name="attendance_form" id="attendance_form">
      <div class="row mb-2">
        <div class="col-6">
          <label for="type_work">Type</label>
          <div class="sm-12">
            <select name="type_work" id="type_work" class="form-control">
              <option value="1">Daily</option>  
              <option value="2">Over Time</option>
              <option value="3">Off Day</option>
            </select>
          </div>
        </div>
        <div class="col-6">
          <label for="rate">Rate</label>
          <div class="sm-12">
            <select name="rate" id="rate" class="form-control">
              <option value="1">Normal</option>
              <option value="2">Double</option>
              <option value="3">Triple</option>
            </select>
          </div>
        </div>
      </div>
      <div class="row" id="clock_in_out">
        <div class="col-6">
          <label for="clock_in">Clock In</label>
        <input type="time" id="clock_in" name="clock_in" class="form-control">
        </div>
        <div class="col-6">
          <label for="clock_out">Clock Out</label>
          <input type="time" id="clock_out" name="clock_out" class="form-control">
        </div>
      </div>

      <input type="hidden" name="userid" id="userid" value="#url.id#">
    </form>

    <script>
   
   var $button_send = $('<button class="btn btn-success mt-2 pull-right">Update</button>');

    $('.modal-footer').append($button_send);

    $button_send.on('click',
        function ()
        {   
          Swal.fire({
            title: 'Are you sure',
            text: 'Attendance Record Will Be Saved',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: "No",
          }).then((result) => {
            if (result.value) {
              // user clicked "Yes"
              $.ajax({
                url: 'module/management/attendance/attendance_act.cfm',
                type: "POST",
                data : $('##attendance_form').serialize(),
                dataType: "script"
              });
            } else {
              // user clicked "No"
              Swal.fire("Submission Fail", "", "error");
            }
          });
        }
    );
    
    </script>

</cfoutput>