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

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `attendance`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `attendance`
			<cfquery datasource="higher">
				CREATE TABLE `attendance` (
				`id` int NOT NULL AUTO_INCREMENT,
				`user_id` int DEFAULT NULL,
				`created_date` datetime DEFAULT NULL,
				`clock_in_datetime` datetime DEFAULT NULL,
				`clock_out_datetime` datetime DEFAULT NULL,
				PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `advance_salary`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `advance_salary`
			<cfquery datasource="higher">
				CREATE TABLE `advance_salary` (
					`id` int NOT NULL AUTO_INCREMENT,
					`advance_amount` double(11,2) DEFAULT NULL,
					`month` int DEFAULT NULL,
					`year` int DEFAULT NULL,
					`created_date` datetime DEFAULT NULL,
					`payment_date` datetime DEFAULT NULL,
					`payment_ref` varchar(100) DEFAULT NULL,
					`user_id` int DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB 
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `payslips`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `payslips`
			<cfquery datasource="higher">
				CREATE TABLE `payslips` (
					`id` int NOT NULL AUTO_INCREMENT,
					`user_id` int DEFAULT NULL,
					`month` int DEFAULT NULL,
					`year` int DEFAULT NULL,
					`gross_amount` double(11,2) DEFAULT NULL,
					`net_amount` double(11,2) DEFAULT NULL,
					`created_date` datetime DEFAULT NULL,
					`payment_status` varchar(1) DEFAULT NULL COMMENT 'Y = Done payment',
					`payment_ref` varchar(150) DEFAULT NULL,
					`payment_datetime` datetime DEFAULT NULL,
					`epf_amount` double(11,2) DEFAULT NULL,
					`socso_amount` double(11,2) DEFAULT NULL,
					`eis_amount` double(11,2) DEFAULT NULL,
					`pcb_amount` double(11,2) DEFAULT NULL,
					PRIMARY KEY (`id`)
					) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `salary_method` FROM `users`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>ALTER TABLE `users` 
			<br>ADD COLUMN `salary_method` INT(11) NULL,
			<br>ADD COLUMN `salary_rate` DOUBLE(11,2) NULL
			<cfquery datasource="higher">
				ALTER TABLE `users` 
				ADD COLUMN `salary_method` INT(11) NULL,
				ADD COLUMN `salary_rate` DOUBLE(11,2) NULL
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `total_advance` FROM `payslips`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>ALTER TABLE `payslips` 
			<br>ADD COLUMN `total_advance` DOUBLE(11,2) NULL
			<cfquery datasource="higher">
				ALTER TABLE `payslips` 
				ADD COLUMN `total_advance` DOUBLE(11,2) NULL
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `setting`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `setting`
			<cfquery datasource="higher">
				CREATE TABLE `setting` (
					`id` int NOT NULL AUTO_INCREMENT,
					`setting_name` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Nama Setting',
					`filename` varchar(700) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Masukkan nama file',
					`value` char(10) DEFAULT NULL,
					`description` varchar(150) DEFAULT NULL,
					PRIMARY KEY (`ID`),
					KEY `setting_name` (`setting_name`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cfquery datasource="higher" name="chk_LOGO_PATH_PRINTING">
		SELECT id FROM setting WHERE setting_name = 'LOGO_PATH_PRINTING'
	  </cfquery>
	  <cfif chk_LOGO_PATH_PRINTING.recordcount EQ 0>
		<br>Auto generated
		<br>INSERT INTO `setting` (`type`, `setting_name`, `description`)
		<br>VALUES ( 'CTRL', 'LOGO_PATH_PRINTING', 'Path untuk logo dalam printing' );
		<cfquery datasource="higher">
		  INSERT INTO `setting` 
		  ( 
			`setting_name`, 
			`description`
		  ) 
		  VALUES 
		  (
			'LOGO_PATH_PRINTING', 
			'Path untuk logo dalam printing'
		  );
		</cfquery>
	  </cfif>

	  <cftry>
		<cfquery datasource="higher">
			SELECT `pcb` FROM `users`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>ALTER TABLE `users` 
			<br>ADD COLUMN `pcb` DOUBLE(11,2) NULL
			<cfquery datasource="higher">
				ALTER TABLE `users` 
				ADD COLUMN `pcb` DOUBLE(11,2) NULL
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `pcb` FROM `users`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>ALTER TABLE `users` 
			<br>ADD COLUMN `pcb` DOUBLE(11,2) NULL
			<cfquery datasource="higher">
				ALTER TABLE `users` 
				ADD COLUMN `pcb` DOUBLE(11,2) NULL
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `pilot_task`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `pilot_task`
			<cfquery datasource="higher">
				CREATE TABLE `pilot_task` (
					`id` int NOT NULL AUTO_INCREMENT,
					`task_dt` datetime DEFAULT NULL,
					`pilot_id` int DEFAULT NULL,
					`flight_qty` varchar(50) DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `pilot_task_flight`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `pilot_task_flight`
			<cfquery datasource="higher">
				CREATE TABLE `pilot_task_flight` (
					`id` int NOT NULL AUTO_INCREMENT,
					`task_id` int DEFAULT NULL,
					`flight_dt` datetime DEFAULT NULL,
					`ref_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
					`passenger_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
					`pilot_id` int DEFAULT NULL,
					`camera` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
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
			SELECT `id` FROM `driver_log`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `driver_log`
			<cfquery datasource="higher">
				CREATE TABLE `driver_log` (
					`id` int NOT NULL AUTO_INCREMENT,
					`log_dt` datetime DEFAULT NULL,
					`driver_id` int DEFAULT NULL,
					`trip_qty` varchar(50) DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cftry>
		<cfquery datasource="higher">
			SELECT `id` FROM `driver_log_trip`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `driver_log_trip`
			<cfquery datasource="higher">
				CREATE TABLE `driver_log_trip` (
					`id` int NOT NULL AUTO_INCREMENT,
					`log_id` int DEFAULT NULL,
					`trip_dt` datetime DEFAULT NULL,
					`ref_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
					`driver_id` int DEFAULT NULL,
					`from` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
					`to` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
					`trip_time` datetime DEFAULT NULL,
					`authorize_id` int DEFAULT NULL,
					`authorize_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
					`trip_remark_id` int DEFAULT NULL,
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
			SELECT `id` FROM `lt_trip_remark`
		</cfquery>
		<cfcatch type="database">
			<br>Auto generated
			<br>CREATE TABLE `lt_trip_remark`
			<cfquery datasource="higher">
				CREATE TABLE `lt_trip_remark` (
					`id` int NOT NULL AUTO_INCREMENT,
					`code` char(10) DEFAULT NULL,
					`description` varchar(150) DEFAULT NULL,
					PRIMARY KEY (`id`)
				) ENGINE=InnoDB
			</cfquery>     
		</cfcatch>
	</cftry>

	<cfquery datasource="higher" name="chk_insert_lt_trip_remark">
		SELECT id FROM lt_trip_remark WHERE code = 'A'
	  </cfquery>
	  <cfif chk_insert_lt_trip_remark.recordcount EQ 0>
		<br>Auto generated
		<br>INSERT INTO `lt_trip_remark` 
		<cfquery datasource="higher">
		  INSERT INTO `lt_trip_remark` 
		  ( 
			`code`, 
			`description`
		  ) 
		  VALUES 
		  (
			'A', 
			'KOMPLEKS > LZ3/T02 > KOMPLEKS'
		  );

		  INSERT INTO `lt_trip_remark` 
		  ( 
			`code`, 
			`description`
		  ) 
		  VALUES 
		  (
			'B', 
			'KOMPLEKS > TAKEOFF/LZ3 > TAKEOFF/LZ1 > KOMPLEKS'
		  );

		  INSERT INTO `lt_trip_remark` 
		  ( 
			`code`, 
			`description`
		  ) 
		  VALUES 
		  (
			'C', 
			'KOMPLEKS > LZ2 > KOMPLEKS'
		  );

		  INSERT INTO `lt_trip_remark` 
		  ( 
			`code`, 
			`description`
		  ) 
		  VALUES 
		  (
			'D', 
			'LZ1 > TAKEOFF'
		  );

		  INSERT INTO `lt_trip_remark` 
		  ( 
			`code`, 
			`description`
		  ) 
		  VALUES 
		  (
			'E', 
			'LZ2 > TAKEOFF'
		  );
		</cfquery>
	  </cfif>
	
	<br><br>End of checking

</cfoutput>