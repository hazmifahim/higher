<cfoutput>
    <cftransaction>
        <cfquery name="chk_exist" datasource="higher">
            SELECT * FROM `attendance`
            WHERE `user_id` = #form.userid#
            AND date(created_date) = date(NOW())
        </cfquery>

        <cfif isdefined("chk_exist.recordCount") AND chk_exist.recordCount NEQ 0>
        
        <cfelse>
            <cfquery name="insert_new" datasource="higher">
                INSERT INTO `attendance`
                (
                    `user_id`,
                    `created_date`,
                    `clock_in_datetime`,
                    `clock_out_datetime`
                )
                VALUES 
                (
                    #form.userid#,
                    now(),
                    '#dateFormat(now(),'yyyy-mm-dd')# #form.clock_in#',
                    '#dateFormat(now(),'yyyy-mm-dd')# #form.clock_out#'
                )
            </cfquery>
        </cfif>
  
    </cftransaction>
</cfoutput>