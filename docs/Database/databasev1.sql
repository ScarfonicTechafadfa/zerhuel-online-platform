/*
SQLyog Community v12.5.0 (64 bit)
MySQL - 5.5.11 : Database - zerhuel_online_platform_db_dev
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zerhuel_online_platform_db_dev` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zerhuel_online_platform_db_dev`;

/*Table structure for table `master_sitelogs_v1` */

DROP TABLE IF EXISTS `master_sitelogs_v1`;

CREATE TABLE `master_sitelogs_v1` (
  `sitelogid` bigint(20) NOT NULL,
  `ci_session` varchar(25) DEFAULT NULL,
  `php_session` varchar(40) DEFAULT NULL,
  `ip_address` varchar(20) DEFAULT NULL,
  `requested_url` varchar(150) DEFAULT NULL,
  `referer_page` varchar(150) DEFAULT NULL,
  `platform` varchar(25) DEFAULT NULL,
  `user_agent` varchar(25) DEFAULT NULL,
  `user_agentstring` varchar(150) DEFAULT NULL,
  `page_name` varchar(150) DEFAULT NULL,
  `query_string` varchar(250) DEFAULT NULL,
  `data_timestamps` datetime DEFAULT NULL,
  PRIMARY KEY (`sitelogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `master_sitelogs_v1` */

/*Table structure for table `site_log` */

DROP TABLE IF EXISTS `site_log`;

CREATE TABLE `site_log` (
  `site_log_id` bigint(15) unsigned NOT NULL AUTO_INCREMENT,
  `no_of_visits` int(10) unsigned NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `requested_url` tinytext NOT NULL,
  `referer_page` tinytext NOT NULL,
  `page_name` tinytext NOT NULL,
  `query_string` tinytext NOT NULL,
  `user_agent` tinytext NOT NULL,
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `access_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`site_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=utf8;

/*Data for the table `site_log` */

insert  into `site_log`(`site_log_id`,`no_of_visits`,`ip_address`,`requested_url`,`referer_page`,`page_name`,`query_string`,`user_agent`,`is_unique`,`access_date`) values 
(665,1,'::1','/zerhuel-online-platform/xx_public/about','','about/index','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36',0,'2019-03-19 01:26:21');

/* Procedure structure for procedure `spmaster_sitelogs_getidv1` */

/*!50003 DROP PROCEDURE IF EXISTS  `spmaster_sitelogs_getidv1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spmaster_sitelogs_getidv1`(
	_sitelogid BIGINT
	 
    )
BEGIN

	SELECT
		sitelogid,
		ci_session,
		php_session,
		ip_address,
		requested_url,
		referer_page,
		platform,
		user_agent,
		user_agent,
		page_name,
		query_string,
		date_timestamps

	FROM
		master_sitelogs_v1
	WHERE sitelogid = _sitelogid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spmaster_sitelogs_postv1` */

/*!50003 DROP PROCEDURE IF EXISTS  `spmaster_sitelogs_postv1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spmaster_sitelogs_postv1`(
	_ci_session VARCHAR(25),
	_php_session VARCHAR(40),
	_ip_address VARCHAR(20),
	_requested_url VARCHAR(150),
	_referer_page VARCHAR(150),
	_platform VARCHAR(25),
	_user_agent VARCHAR(25),
	_user_agentstring VARCHAR(150),
	_page_name VARCHAR(150),
	_query_string VARCHAR(250)
	 
    )
BEGIN
		SELECT @_sitelogid := IFNULL(MAX(sitelogid), 0) + 1 FROM master_sitelogs_v1;

		INSERT INTO category(
		sitelogid,
		ci_session,
		php_session,
		ip_address,
		requested_url,
		referer_page,
		platform,
		user_agent,
		user_agent,
		page_name,
		query_string,
		date_timestamps
			) 
		VALUES (
		@sitelogid,_ci_session,
		_php_session,
		_ip_address,
		_requested_url,
		_referer_page,
		_platform,
		_user_agent,
		_user_agent,
		_page_name,
		_query_string,
		now()
		);
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
