<cfoutput>

    <form name="attendance_form">
      <div class="row">
        <div class="col-6">
          <label for="appt">Clock In</label>
        <input type="time" id="clock_in" name="clock_in" class="form-control">
        </div>
        <div class="col-6">
          <label for="appt">Clock Out</label>
        <input type="time" id="clock_out" name="clock_out" class="form-control">
        </div>
      </div>
    </form>

    <script>
      $('##btn-confirm').on('click', function(e) {
        console.log('hi');
      });
    </script>

</cfoutput>