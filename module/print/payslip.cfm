<cfoutput>

	<cfparam name="format" default="PDF">
	<cfset lib.xCubeReport3 = createObject("component", "higher.module.print.xCubeReport3") />
    
    <cfset rpt_dttm = 'Cetakan Pada #dateTimeFormat(now(),"dd/mm/yyyy hh:nn tt")#'>

    <cfquery name = "getData" datasource = "higher">
        SELECT
            *
        FROM `users`
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
            jasperPath = 'payslip.jasper'
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