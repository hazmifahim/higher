<cfoutput>
    <form id="access_setting">
        <div class="row">
            <div class="col-sm-12">
    
                <div class="panel-body">
                    <div class="row mb-space">
                        <div class="col-sm-6">
                            <div class="row">
                                <label class="col-sm-4 col-form-label">Username </label>
                                <div class="col-sm-8">
                                    <input type="text" id="username" name="username" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="row">
                                <label class="col-sm-4 col-form-label">Password</label>
                                <div class="col-sm-8">
                                    <input type="password" id="password" name="password" class="form-control">
                                </div>
                            </div>
                        </div>

                        <input type="hidden" name="userid" id="userid" value="#url.employee_id#">
                        
                    </div>

                    <div class="button_block mt-2">
                        <button type="button" onclick="submit_flight_form();" class="btn cur-p btn-primary">
                            Update
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        function submit_flight_form() {
            $.ajax({
                url: 'module/management/employee/access_act.cfm',
                type: "POST",
                data : $('##access_setting').serialize(),
                dataType: "script"
            }).fail(function($xhr) {
                swal('Maaf, proses gagal!','Sila ulangi proses anda. Jika berterusan sila lapor kepada sistem admin','warning','html');
            });
        }
    </script>
</cfoutput>