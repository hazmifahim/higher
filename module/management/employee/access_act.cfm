<cfoutput>
    <cftransaction>

        <cfset hashedPassword = hash(form.password, "SHA-256")>

        <cfquery name="update_pwd" datasource="higher">
            UPDATE `users`
            SET `username` = '#form.username#',
            `password` = '#hashedPassword#'
            WHERE `id` = #form.userid#
        </cfquery>

        Swal.fire({
            title: 'Password Has Been Updated',
            text: 'Success',
            icon: 'success',
            confirmButtonText: 'Okay'
        }).then((result) => {

            BootstrapDialog.closeAll();

        });

    </cftransaction>
</cfoutput>
