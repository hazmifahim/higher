<cfoutput>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `booking`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `booking`
			<cfquery datasource="higher">
				CREATE TABLE `booking` 
				(
					`id` int NOT NULL AUTO_INCREMENT,
					`fullname` varchar(250) DEFAULT NULL,
					`booking_name` varchar(250) DEFAULT NULL,
					`location_id` int DEFAULT NULL,
					`location_name` varchar(250) DEFAULT NULL,
					`pax_qty` varchar(10) DEFAULT NULL,
					`flight_dt` datetime DEFAULT NULL,
					`video_fg` int DEFAULT NULL,
					`total_payment` double(20,5) DEFAULT NULL,
					`deposit` double(20,5) DEFAULT NULL,
					`comp_agent_id` int DEFAULT NULL,
					`com_agent` varchar(250) DEFAULT NULL,
					`booking_comp_id` int DEFAULT NULL,
					`booking_comp` varchar(250) DEFAULT NULL,
					`lt_status_id` int DEFAULT NULL,
					`created_id` int DEFAULT NULL,
					`created_dt` datetime DEFAULT NULL,
					`updated_id` int DEFAULT NULL,
					`updated_dt` datetime DEFAULT NULL,
					`deleted_id` int DEFAULT NULL,
					`deleted_dt` datetime DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `vendor`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `vendor`
			<cfquery datasource="higher">
				CREATE TABLE `vendor` (
					`id` int NOT NULL AUTO_INCREMENT,
					`vendor_name` varchar(250) DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `flight`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `flight`
			<cfquery datasource="higher">
				CREATE TABLE `flight` (
					`id` int NOT NULL AUTO_INCREMENT,
					`fullname` varchar(250) DEFAULT NULL,
					`name` varchar(250) DEFAULT NULL,
					`ic_num` varchar(15) DEFAULT NULL,
					`location_id` int DEFAULT NULL,
					`location` varchar(150) DEFAULT NULL,
					`pax_qty` varchar(10) DEFAULT NULL,
					`adult` varchar(10) DEFAULT NULL,
					`children` varchar(10) DEFAULT NULL,
					`nationality` int DEFAULT NULL COMMENT '1-malaysian 2-international',
					`country` varchar(100) DEFAULT NULL,
					`flight_dt` datetime DEFAULT NULL,
					`video_fg` int DEFAULT NULL,
					`video_qty` varchar(10) DEFAULT NULL,
					`total_payment` double(20,5) DEFAULT NULL,
					`deposit` double(20,5) DEFAULT NULL,
					`remaining_payment` double(20,5) DEFAULT NULL,
					`lt_status_id` int DEFAULT NULL,
					`created_id` int DEFAULT NULL,
					`created_dt` datetime DEFAULT NULL,
					`updated_id` int DEFAULT NULL,
					`updated_dt` datetime DEFAULT NULL,
					`deleted_id` int DEFAULT NULL,
					`deleted_dt` datetime DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `lt_location`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `lt_location`
			<cfquery datasource="higher">
				CREATE TABLE `lt_location` (
					`id` int NOT NULL AUTO_INCREMENT,
					`description` varchar(250) DEFAULT NULL,
					`address` varchar(300) DEFAULT NULL,
					`lt_status_id` int DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `lt_status_id`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `lt_status_id`
			<cfquery datasource="higher">
				CREATE TABLE `lt_status_id` (
					`id` int NOT NULL AUTO_INCREMENT,
					`type` varchar(50) DEFAULT NULL,
					`description` varchar(50) DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `passenger`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `passenger`
			<cfquery datasource="higher">
				CREATE TABLE `passenger` (
					`id` int NOT NULL AUTO_INCREMENT,
					`flight_id` int DEFAULT NULL,
					`name` varchar(150) DEFAULT NULL,
					`age_type` int DEFAULT NULL COMMENT '1-adult 2-children',
					`pilot_id` int DEFAULT NULL,
					`pilot` varchar(150) DEFAULT NULL,
					`driver_id` int DEFAULT NULL,
					`driver` varchar(150) DEFAULT NULL,
					`lt_status_id` int DEFAULT NULL,
					`created_id` int DEFAULT NULL,
					`created_dt` datetime DEFAULT NULL,
					`updated_id` int DEFAULT NULL,
					`updated_dt` datetime DEFAULT NULL,
					`deleted_id` int DEFAULT NULL,
					`deleted_dt` datetime DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `roles`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `roles`
			<cfquery datasource="higher">
				CREATE TABLE `roles` (
					`id` int NOT NULL AUTO_INCREMENT,
					`description` varchar(50) DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `users`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `users`
			<cfquery datasource="higher">
				CREATE TABLE `users` (
					`id` int NOT NULL AUTO_INCREMENT,
					`username` varchar(100) DEFAULT NULL,
					`password` varchar(100) DEFAULT NULL,
					`fullname` varchar(250) DEFAULT NULL,
					`name` varchar(150) DEFAULT NULL,
					`ic_no` varchar(15) DEFAULT NULL,
					`sex` varchar(10) DEFAULT NULL,
					`married` varchar(10) DEFAULT NULL,
					`address` varchar(400) DEFAULT NULL,
					`mobile` varchar(15) DEFAULT NULL,
					`email` varchar(50) DEFAULT NULL,
					`birthdate` datetime DEFAULT NULL,
					`birth_place` varchar(150) DEFAULT NULL,
					`race` varchar(150) DEFAULT NULL,
					`religion` varchar(150) DEFAULT NULL,
					`bank` varchar(30) DEFAULT NULL,
					`bank_acc` varchar(30) DEFAULT NULL,
					`join_dt` datetime DEFAULT NULL,
					`lt_status_id` int DEFAULT NULL,
					`role_ids` varchar(50) DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<br><br>End of checking

</cfoutput>