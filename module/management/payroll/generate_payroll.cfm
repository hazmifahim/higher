<cfoutput>
    <cftransaction>

        <cfquery name="chk_existing" datasource="higher">
            SELECT * FROM `payslips`
            WHERE month = #form.month#
            AND year = #form.year#
        </cfquery>

        <cfif isDefined("chk_existing.recordCount") AND chk_existing.recordCount NEQ 0>

            Swal.fire({
                title: 'Alert!',
                text: 'Payroll Has Already Exists',
                icon: 'warning',
                confirmButtonText: 'Okay'
             }).then((result) => {
          
                BootstrapDialog.closeTop();
          
                if (typeof reload_payroll_record_list == 'function')
                      {
                          reload_payroll_record_list();
                      }
             });

        <cfelse>

            <cfquery name="get_user" datasource="higher">
                SELECT * FROM `users`
            </cfquery>
    
            <cfloop query="get_user">
    
                <!--- monthly --->
                <cfif isdefined("get_user.salary_method") AND get_user.salary_method EQ 1>
                
                    <!--- gross salary --->
                    <cfset gross_salary = get_user.salary_rate>
                
                    <cfset employee_epf = gross_salary*0.11>
                    <cfset employer_epf = gross_salary*0.13>

                <!--- daily --->
                <cfelseif isdefined("get_user.salary_method") AND get_user.salary_method EQ 2>

                    <cfquery name="get_attendance" datasource="higher">
                        SELECT COUNT(*) AS total FROM `attendance`
                        WHERE `user_id` = #get_user.id#
                    </cfquery>
    
                    <cfset gross_salary = get_attendance.total*get_user.salary_rate>
    
                    <cfset employee_epf = 0.0>
                    <cfset employer_epf = 0.0>

                <!--- per trip 3.pilot 4.driver--->
                <cfelse>
    
                   <cfif get_user.role_ids EQ 3>
                        <cfquery name="get_pilot_task" datasource="higher">
                            SELECT
                                SUM(trip_qty) AS total_trip
                            FROM
                                `pilot_task`
                            WHERE pilot_id = #get_user.id#
                            AND MONTH(task_dt) = #form.month#
                            AND YEAR(task_dt) = #form.year#
                        </cfquery>

                        <cfset gross_salary = get_pilot_task.total_trip*get_user.salary_rate>
                   <cfelse>


                        <cfquery name="get_driver_task" datasource="higher">
                            SELECT
                                SUM(trip_qty) AS total_trip
                            FROM
                                `driver_log`
                            WHERE driver_id = #get_user.id#
                            AND MONTH(log_dt) = #form.month#
                            AND YEAR(log_dt) = #form.year#
                        </cfquery>

                        <cfset gross_salary = get_driver_task.total_trip*get_user.salary_rate>
                   </cfif>
    
                    
    
                    <cfset employee_epf = 0.0>
                    <cfset employer_epf = 0.0>
    
                </cfif>

                <cfquery name="get_advance" datasource="higher">
                    SELECT ifnull(sum(advance_amount),0) AS total_advance 
                    FROM `advance_salary`
                    WHERE `user_id` = #get_user.id#
                    AND `month` = #form.month#
                    AND `year` = #form.year#
                </cfquery>
    
                <cfquery name="get_socso" datasource="higher">
                    SELECT employee_contribution, employer_contribution FROM socso_rate
                    WHERE #gross_salary# >= min_salary AND #gross_salary# < max_salary;
                </cfquery>
    
                <cfquery name="get_eis" datasource="higher">
                    SELECT employee_contribution, employer_contribution FROM eis_rate
                    WHERE #gross_salary# >= min_salary AND #gross_salary# < max_salary;
                </cfquery>
    
                <cfset employee_socso = get_socso.employee_contribution>
                <cfset employer_socso = get_socso.employer_contribution>
                <cfset employee_eis = get_eis.employee_contribution>
                <cfset employer_eis = get_eis.employer_contribution>
    
                <cfset net_amount = gross_salary-employee_epf-employee_socso-employee_eis-get_advance.total_advance>
    
                <cfquery name="insert_data" datasource="higher">
                    INSERT INTO `payslips`
                    (
                        user_id,
                        month,
                        year,
                        created_date,
                        gross_amount,
                        net_amount,
                        employee_epf_amount,
                        employee_socso_amount,
                        employee_eis_amount,
                        employer_epf_amount,
                        employer_socso_amount,
                        employer_eis_amount,
                        total_advance
                    )
                    VALUES 
                    (
                        #get_user.id#,
                        #form.month#,
                        #form.year#,
                        now(),
                        #gross_salary#,
                        #net_amount#,
                        #employee_epf#,
                        #employee_socso#,
                        #employee_eis#,
                        #employer_epf#,
                        #employer_socso#,
                        #employer_eis#,
                        #get_advance.total_advance#
                    )
                </cfquery>
    
            </cfloop>
    
            Swal.fire({
                title: 'Success',
                text: 'Payroll Has Been Generated',
                icon: 'success',
                confirmButtonText: 'Okay'
             }).then((result) => {
          
                BootstrapDialog.closeAll();
          
                if (typeof reload_payroll_record_list == 'function')
                      {
                          reload_payroll_record_list();
                      }
             });

        </cfif>

        

    </cftransaction>
</cfoutput>