<cfoutput>
    <cftransaction>

        <cfif isdefined("chk_exist.recordCount") AND chk_exist.recordCount NEQ 0>
        
        <cfelse>

            <cfquery name="insert_new" datasource="higher">
                INSERT INTO `advance_salary`
                (
                    `user_id`,
                    `advance_amount`,
                    `month`,
                    `year`,
                    `created_date`,
                    `payment_date`,
                    `payment_ref`
                )
                VALUES 
                (
                    <cfqueryparam cfsqltype="integer" value="#form.user_id#">,
                    #form.advance_amt#,
                    #form.month#,
                    #year(now())#,
                    now(),
                    '#form.payment_dt#',
                    '#form.payment_ref#'
                )
            </cfquery>

            Swal.fire({
                title: 'Success',
                text: 'Advance Has Been Added',
                icon: 'success',
                confirmButtonText: 'Okay'
            }).then((result) => {

                BootstrapDialog.closeAll();

                if (typeof reload_advance_record_list == 'function')
                    {
                        reload_advance_record_list();
                    }
            });
        </cfif>

        
  
    </cftransaction>
</cfoutput>