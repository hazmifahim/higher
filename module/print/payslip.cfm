<cfoutput>

	<cfparam name="format" default="PDF">
	<cfset lib.xCubeReport3 = createObject("component", "higher.module.print.xCubeReport3") />
    <cfset rpt_dttm = 'Cetakan Pada #dateTimeFormat(now(),"dd/mm/yyyy hh:nn tt")#'>


    <!--- LOGO SETTING --->
    <cfquery name="logo_setting" datasource="higher">
        SELECT 
        `filename`,
        `value`
        FROM `setting`
        WHERE `setting_name` = 'LOGO_PATH_PRINTING'
    </cfquery>
    <!--- LOGO SETTING --->

    <cfquery name = "getData" datasource = "higher">
       SELECT
            t1.*,
            t2.`fullname`,
            t2.`ic_no`
        FROM
            `payslips` t1
        INNER JOIN `users` t2
            ON t2.`id` = t1.`user_id`
        WHERE t1.`id` = #url.id#
        LIMIT 1
    </cfquery>



    <cfscript>
    	cfg = {
            format = format,
            reportData = getData
        };

        conf = {
            paged = format EQ 'html',
            dataProvider = 'data',
            fullname = getData.fullname,
            jasperPath = 'payslip.jasper',
            logo_path = logo_setting.value
        };

        StructAppend(conf, url);
        StructAppend(conf, form);
        StructDelete(conf,'FIELDNAMES');

        cfg['tempDir'] = GetDirectoryFromPath(ExpandPath( "*.*")) & 'temp/';
        cfg['jasperPath'] = GetDirectoryFromPath(ExpandPath( "*.*")) & conf.jasperPath;
        cfg['conf'] = conf;

        lib.xCubeReport3.genReport(argumentCollection=cfg);

    </cfscript>
    
</cfoutput>