<cfoutput>
    <cftransaction>

        <cfquery name="update_info" datasource="higher">
            UPDATE `users`
            SET     
                `fullname` = '#form.fullname#',
                `ic_no` = '#form.ic_no#',
                `sex` = '#form.sex#',
                `married` = '#form.married#',
                `mobile` = '#form.mobile#',
                `email` = '#form.email#',
                `race` = '#form.race#',
                `bank` = '#form.bank#',
                `bank_acc` = '#form.bank_acc#',
                `salary_method` = '#form.salary_method#',
                `salary_rate` = '#form.salary_rate#',
                `pcb` = '#form.pcb#'
            WHERE `id` = #form.userid#
        </cfquery>

        Swal.fire({
            title: 'Personal Info Has Been Updated',
            text: 'Success',
            icon: 'success',
            confirmButtonText: 'Okay'
        }).then((result) => {

            BootstrapDialog.closeAll();

        });

    </cftransaction>
</cfoutput>
