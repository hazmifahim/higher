<cfsetting showDebugOutput="No">

<cfset dataSource= 'higher'>
<cfset tableFields= ['id','ref_num','from','to','trip_time','authorize_name','trip_remark_id']>
<cfset noOfTableFields = ArrayLen(tableFields)>
<cfset searchFields= ['fullname', 'stay']>
<cfset noOfSearchFields = ArrayLen(searchFields)>
<cfparam name='form.draw' default='' type="string">
<cfparam name='form.start' default='0' type="integer">
<cfparam name='form.length' default='10' type="integer">
<cfparam name="form['search[value]']" default='' type="string">
<cfparam name="form['order[0][dir]']" default='asc' type="string">
<cfset start= Int(Val(FORM.start))>
<cfset length= Int(Val(FORM.length))>
<cfset search= Trim(form['search[value]'])>

<cfif structKeyExists(FORM,'order[0][column]')>
	<cfset iSortCol_0= Int(Val(FORM['order[0][column]']))>
<cfelse>
	<cfset iSortCol_0= "">
</cfif>
<cfif LCase(FORM['order[0][dir]']) EQ 'asc'>
	<cfset sSortDir_0='asc'>
<cfelse>
	<cfset sSortDir_0='desc'>
</cfif>
<cfset queryWhere="">
<cfif (search NEQ '')> 
	<cfset queryWhere ="AND (">
	<cfset counterSearchList = 0>
	<cfset searchListLen = listlen(search," ")>
	<cfloop list="#search#" delimiters=" " index="word">
	<cfset counterSearchList = counterSearchList+1>
		<cfloop from="1" to="#noOfSearchFields#" index="counter">
			<cfset queryWhere=queryWhere &" lower(#searchFields[counter]#) LIKE '%#Lcase(word)#%' ">
			<cfif counter LT noOfSearchFields>
			<cfset queryWhere=queryWhere&" OR">
			</cfif>
		</cfloop>
		<cfif searchListLen NEQ counterSearchList>
			<cfset queryWhere=queryWhere&") AND (">
		</cfif>
	</cfloop>
	<cfset queryWhere=queryWhere&")">
</cfif>
<cfif iSortCol_0 NEQ "">
	<cfset queryOrder='ORDER BY #tableFields[iSortCol_0 + 1]# #sSortDir_0#'>
<cfelse>
	<cfset queryOrder='ORDER BY id DESC'>
</cfif>
<cfif length NEQ 0>
	<cfset queryLimit='LIMIT #start#, #length#'>
<cfelse>
	<cfset queryLimit=''>
</cfif>
<cfquery name="queryResult" datasource="#datasource#">
	SELECT 
		a.id,
		a.ref_num,
		a.`from`,
		a.`to`,
		a.authorize_name,
		a.trip_time,
		a.trip_remark_id
	FROM `driver_log_trip` a
	LEFT JOIN `users` b ON (a.authorize_id = b.id)
	WHERE a.driver_id = #url.driver_id#
	AND DATE_FORMAT(a.trip_dt, "%m/%d/%Y") = '#url.log_dt#'

	#PreserveSingleQuotes(queryWhere)# 
</cfquery>

<cfquery name="querycount" datasource="#datasource#">
	SELECT COUNT(id) AS total 
	FROM `driver_log_trip` 
	WHERE driver_id = #url.driver_id#
	AND DATE_FORMAT(trip_dt, "%m/%d/%Y") = '#url.log_dt#'

	#PreserveSingleQuotes(queryWhere)#
</cfquery>
<cfsavecontent variable="datatablesjson"><cfloop from="1" to="#queryResult.RecordCount#" index="counter"><cfoutput>[<cfloop from="1"  to="#noOfTableFields#" index="innerCounter"><cfif tableFields[innerCounter] EQ "start_date">"#JSStringFormat(dateformat(queryResult[tableFields[innerCounter]][counter],'yyyy/mm/dd'))#"<cfelse>"#replacenocase(JSStringFormat(queryResult[rereplace(tableFields[innerCounter],'"','','all')][counter]),"\'","'","all")#"</cfif><cfif innerCounter LT noOfTableFields>,</cfif></cfloop>]<cfif counter LT queryResult.RecordCount>,</cfif></cfoutput></cfloop></cfsavecontent>
	<cfoutput>{"draw":#Int(Val(URL.draw))#,"recordsTotal":<cfif querycount.total GT 0>#querycount.total#<cfelse>0</cfif>,"recordsFiltered":<cfif querycount.total GT 0>#querycount.total#<cfelse>0</cfif>,"data":[#datatablesjson#]}</cfoutput>