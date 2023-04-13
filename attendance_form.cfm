<cfoutput>

    <form name="attendance_form">
      <div class="row">
        <div class="col-6">
          <label for="appt">Clock In</label>
        <input type="time" id="appt" name="appt" class="form-control">
        </div>
        <div class="col-6">
          <label for="appt">Clock Out</label>
        <input type="time" id="appt" name="appt" class="form-control">
        </div>
      </div>
    </form>

    <script>
      var $button_save = $('<button class="btn btn-action btn-success ladda-button " data-style="zoom-in"><span class="ladda-label">Submit</span></button>');
      $('##' + BootstrapDialogTopId() + ' .bootstrap-dialog-footer-buttons').prepend($button_save);
    </script>

</cfoutput>