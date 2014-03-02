-- MySQL dump 10.13  Distrib 5.5.33, for osx10.6 (i386)
--
-- Host: localhost    Database: semfundc_zidisha
-- ------------------------------------------------------
-- Server version	5.5.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_guests`
--

DROP TABLE IF EXISTS `active_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_guests` (
  `ip` varchar(15) NOT NULL,
  `timestamp` int(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_guests`
--

LOCK TABLES `active_guests` WRITE;
/*!40000 ALTER TABLE `active_guests` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_users`
--

DROP TABLE IF EXISTS `active_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_users` (
  `username` varchar(20) NOT NULL,
  `timestamp` int(32) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_users`
--

LOCK TABLES `active_users` WRITE;
/*!40000 ALTER TABLE `active_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_lendbids`
--

DROP TABLE IF EXISTS `auto_lendbids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_lendbids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanbid_id` int(11) NOT NULL,
  `lender_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `amount` double(11,3) NOT NULL,
  `interest_rate` double(11,3) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loanbid_id` (`loanbid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_lendbids`
--

LOCK TABLES `auto_lendbids` WRITE;
/*!40000 ALTER TABLE `auto_lendbids` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_lendbids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_lending`
--

DROP TABLE IF EXISTS `auto_lending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_lending` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lender_id` int(11) NOT NULL,
  `preference` smallint(6) NOT NULL,
  `desired_interest` double(10,2) NOT NULL,
  `max_desired_interest` double(10,2) NOT NULL DEFAULT '0.00',
  `current_allocated` tinyint(4) NOT NULL,
  `lender_credit` double(10,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bid_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `bid_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_lending`
--

LOCK TABLES `auto_lending` WRITE;
/*!40000 ALTER TABLE `auto_lending` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_lending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_lending_history`
--

DROP TABLE IF EXISTS `auto_lending_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_lending_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_lending_id` int(11) NOT NULL,
  `lender_id` int(11) NOT NULL,
  `preference` smallint(6) NOT NULL,
  `desired_interest` double(10,2) NOT NULL,
  `max_desired_interest` double(10,2) NOT NULL DEFAULT '0.00',
  `current_allocated` tinyint(4) NOT NULL,
  `lender_credit` double(10,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Active` tinyint(4) NOT NULL,
  `bk_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_lending_history`
--

LOCK TABLES `auto_lending_history` WRITE;
/*!40000 ALTER TABLE `auto_lending_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_lending_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_comments`
--

DROP TABLE IF EXISTS `b_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_comments` (
  `userid` int(5) NOT NULL,
  `comment` mediumtext NOT NULL,
  `tr_comment` text,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `senderid` int(5) NOT NULL DEFAULT '0',
  `reply` int(10) unsigned NOT NULL DEFAULT '0',
  `editdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_comments`
--

LOCK TABLES `b_comments` WRITE;
/*!40000 ALTER TABLE `b_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid_payment`
--

DROP TABLE IF EXISTS `bid_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bid_payment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bidinvoiceid` int(10) DEFAULT NULL,
  `lenderid` int(10) DEFAULT NULL,
  `loanid` int(10) DEFAULT NULL,
  `borrowerid` int(10) DEFAULT NULL,
  `bidamt` double(12,2) DEFAULT NULL,
  `bidint` double(12,2) DEFAULT NULL,
  `bidup` int(1) NOT NULL DEFAULT '1',
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid_payment`
--

LOCK TABLES `bid_payment` WRITE;
/*!40000 ALTER TABLE `bid_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_reports`
--

DROP TABLE IF EXISTS `borrower_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_reports` (
  `borrower_id` int(11) NOT NULL,
  `recipient` varchar(100) NOT NULL,
  `cc` mediumtext NOT NULL,
  `replyto` varchar(100) NOT NULL,
  `subject` mediumtext NOT NULL,
  `message` mediumtext NOT NULL,
  `sent_on` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_reports`
--

LOCK TABLES `borrower_reports` WRITE;
/*!40000 ALTER TABLE `borrower_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_review`
--

DROP TABLE IF EXISTS `borrower_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_review` (
  `borrower_id` int(11) NOT NULL,
  `is_photo_clear` mediumtext,
  `is_desc_clear` mediumtext,
  `is_addr_locatable` mediumtext,
  `is_number_provided` mediumtext,
  `is_nat_id_uploaded` mediumtext,
  `is_rec_form_uploaded` mediumtext,
  `is_rec_form_offcr_name` mediumtext,
  `is_pending_mediation` mediumtext,
  `created` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`borrower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_review`
--

LOCK TABLES `borrower_review` WRITE;
/*!40000 ALTER TABLE `borrower_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_verification`
--

DROP TABLE IF EXISTS `borrower_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_verification` (
  `borrower_id` int(11) NOT NULL,
  `complete_later` int(11) NOT NULL DEFAULT '0',
  `is_identity_verify` mediumtext,
  `is_participate_verification` mediumtext,
  `is_app_know_zidisha` mediumtext,
  `is_how_contact` mediumtext,
  `is_recomnd_addr_locatable` mediumtext,
  `is_commLead_know_applicant` mediumtext,
  `is_commLead_recomnd_sign` mediumtext,
  `is_commLead_mediate` mediumtext,
  `is_eligible` mediumtext,
  `is_eligible_ByAdmin` int(11) DEFAULT NULL,
  `additional_comments` mediumtext NOT NULL,
  `verifier_name` varchar(100) NOT NULL,
  `created` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` int(11) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`borrower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_verification`
--

LOCK TABLES `borrower_verification` WRITE;
/*!40000 ALTER TABLE `borrower_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowers`
--

DROP TABLE IF EXISTS `borrowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowers` (
  `userid` int(5) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `PAddress` mediumtext NOT NULL,
  `City` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `TelMobile` varchar(45) NOT NULL,
  `reffered_by` text,
  `Email` varchar(100) DEFAULT NULL,
  `AnnualIncome` double(15,2) DEFAULT '0.00',
  `About` mediumtext NOT NULL,
  `tr_About` text,
  `BizDesc` mediumtext NOT NULL,
  `tr_BizDesc` text,
  `Active` tinyint(1) NOT NULL COMMENT 'Borrower Active or Inactive',
  `Photo` varchar(100) DEFAULT NULL,
  `PartnerId` int(5) DEFAULT '0',
  `ActiveLoan` tinyint(1) DEFAULT '0' COMMENT 'loan stage configuration',
  `currency` int(10) unsigned NOT NULL DEFAULT '0',
  `activeLoanID` int(10) unsigned NOT NULL DEFAULT '0',
  `nationId` varchar(1024) NOT NULL,
  `loanHist` text,
  `Assigned_to` int(10) NOT NULL DEFAULT '0' COMMENT 'partner id to whome a verification request is sent',
  `Assigned_date` int(11) DEFAULT NULL COMMENT 'verification request sent date, declined by partner date',
  `Assigned_status` int(1) NOT NULL DEFAULT '0' COMMENT '0 for pending review, 1 for approve, 2 for declined',
  `declined_reason` text,
  `communityNameNo` text,
  `frontNationalId` text,
  `backNationalId` text,
  `addressProof` text,
  `legalDeclaration` text,
  `legal_declaration2` text,
  `islastrepaid` tinyint(4) DEFAULT '0',
  `isdebtfree` tinyint(4) DEFAULT '0',
  `iscomplete_later` tinyint(4) DEFAULT '0',
  `lastVisited` int(11) DEFAULT NULL,
  `admin_notes` text,
  `borrower_behalf_id` int(11) NOT NULL,
  `share_update` tinyint(4) NOT NULL DEFAULT '0',
  `Created` int(11) DEFAULT NULL,
  `completed_on` int(11) DEFAULT '0',
  `LastModified` int(11) DEFAULT NULL,
  `family_contact` text,
  `neighbour_contact` text,
  `grant_co` int(11) DEFAULT '0',
  `grant_co_date` int(11) DEFAULT NULL,
  `grant_co_note` text,
  `home_location` text,
  `lending_inst_name` varchar(100) DEFAULT NULL,
  `lending_inst_add` text,
  `lending_inst_phone` varchar(45) DEFAULT NULL,
  `lending_inst_officer` varchar(100) DEFAULT NULL,
  `refer_member_name` text NOT NULL,
  `endorser` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `userid` (`userid`),
  KEY `Email` (`Email`),
  KEY `borrower_behalf_id` (`borrower_behalf_id`),
  KEY `Active` (`Active`,`Assigned_status`,`iscomplete_later`),
  KEY `City` (`City`),
  KEY `Country` (`Country`,`Active`),
  FULLTEXT KEY `FirstName` (`FirstName`),
  FULLTEXT KEY `LastName` (`LastName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowers`
--

LOCK TABLES `borrowers` WRITE;
/*!40000 ALTER TABLE `borrowers` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowers_extn`
--

DROP TABLE IF EXISTS `borrowers_extn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowers_extn` (
  `userid` int(11) NOT NULL,
  `family_member1` text,
  `family_member2` text,
  `family_member3` text,
  `neighbor1` text,
  `neighbor2` text,
  `neighbor3` text,
  `rec_form_offcr_name` varchar(100) DEFAULT NULL COMMENT 'the name of the official who signed the Recommendation Form',
  `rec_form_offcr_num` varchar(45) DEFAULT NULL COMMENT 'the telephone number of the official who signed the Recommendation Form',
  `mentor_id` int(11) DEFAULT '0',
  `fb_data` longblob,
  `created` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  `repayment_reminder` int(11) DEFAULT NULL,
  `late_repayment_reminder` int(11) DEFAULT NULL,
  `late_repayment_reminders` int(11) DEFAULT NULL,
  `fb_frnd_uname` longblob,
  PRIMARY KEY (`userid`),
  KEY `userid` (`userid`,`mentor_id`) USING BTREE,
  KEY `mentor_id` (`mentor_id`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowers_extn`
--

LOCK TABLES `borrowers_extn` WRITE;
/*!40000 ALTER TABLE `borrowers_extn` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowers_extn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `max_use` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `message` varchar(200) NOT NULL,
  `active` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partid` int(5) NOT NULL,
  `userid` int(5) NOT NULL,
  `date` varchar(15) NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `lpaid` varchar(3) NOT NULL,
  `ontime` varchar(3) NOT NULL,
  `feedback` varchar(10) NOT NULL,
  `comment` mediumtext NOT NULL,
  `editDate` varchar(15) NOT NULL DEFAULT '0',
  `loneid` int(12) NOT NULL DEFAULT '0',
  `lender` varchar(50) DEFAULT NULL,
  `rate` double(10,6) DEFAULT NULL,
  `refOfficial_name` varchar(50) DEFAULT NULL,
  `refOfficial_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loneid` (`loneid`,`partid`),
  KEY `userid` (`userid`,`date`),
  KEY `userid_2` (`userid`,`loneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commissions`
--

DROP TABLE IF EXISTS `commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commissions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(10) NOT NULL,
  `referrer_id` int(10) NOT NULL,
  `referral_id` int(10) NOT NULL,
  `paid_amt` double(12,2) DEFAULT NULL,
  `paid_date` int(11) DEFAULT NULL,
  `date` int(11) NOT NULL,
  `loan_id` int(10) DEFAULT NULL,
  `failed_reason` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commissions`
--

LOCK TABLES `commissions` WRITE;
/*!40000 ALTER TABLE `commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_organizers`
--

DROP TABLE IF EXISTS `community_organizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_organizers` (
  `user_id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `grant_date` int(11) NOT NULL,
  `note` mediumtext,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_organizers`
--

LOCK TABLES `community_organizers` WRITE;
/*!40000 ALTER TABLE `community_organizers` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_organizers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loc` varchar(2) DEFAULT NULL,
  `code` varchar(2) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(4) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_setting`
--

DROP TABLE IF EXISTS `credit_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(10) NOT NULL,
  `loanamt_limit` int(11) NOT NULL,
  `character_limit` int(11) DEFAULT NULL,
  `comments_limit` int(11) DEFAULT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1 for comments credit and 2 for ontime repayment credits',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_setting`
--

LOCK TABLES `credit_setting` WRITE;
/*!40000 ALTER TABLE `credit_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credits_earned`
--

DROP TABLE IF EXISTS `credits_earned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credits_earned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrower_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `credit_type` tinyint(4) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits_earned`
--

LOCK TABLES `credits_earned` WRITE;
/*!40000 ALTER TABLE `credits_earned` DISABLE KEYS */;
/*!40000 ALTER TABLE `credits_earned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(10) DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `capital` varchar(100) NOT NULL,
  `currencyname` varchar(100) NOT NULL,
  `Currency` varchar(100) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `donation_amt` double(12,2) DEFAULT NULL,
  `payment_type` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation_transaction`
--

DROP TABLE IF EXISTS `donation_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donation_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `amount` double(10,6) NOT NULL,
  `date` int(11) NOT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `txn_type` varchar(50) NOT NULL DEFAULT 'paysimple',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation_transaction`
--

LOCK TABLES `donation_transaction` WRITE;
/*!40000 ALTER TABLE `donation_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_register`
--

DROP TABLE IF EXISTS `email_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_register` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `posted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_register`
--

LOCK TABLES `email_register` WRITE;
/*!40000 ALTER TABLE `email_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endorser`
--

DROP TABLE IF EXISTS `endorser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endorser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowerid` int(11) NOT NULL,
  `endorserid` int(11) DEFAULT NULL,
  `ename` varchar(100) NOT NULL,
  `e_email` varchar(200) NOT NULL,
  `validation_code` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `e_know_brwr` mediumtext NOT NULL,
  `e_cnfdnt_brwr` mediumtext NOT NULL,
  `e_candisplay` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `borrowerid` (`borrowerid`)
) ENGINE=MyISAM AUTO_INCREMENT=7391 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endorser`
--

LOCK TABLES `endorser` WRITE;
/*!40000 ALTER TABLE `endorser` DISABLE KEYS */;
/*!40000 ALTER TABLE `endorser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_name` int(5) DEFAULT NULL,
  `event_fields` varchar(1024) DEFAULT NULL,
  `processed` int(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2297 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excrate`
--

DROP TABLE IF EXISTS `excrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excrate` (
  `rate` double(10,5) DEFAULT '0.00000',
  `start` int(12) DEFAULT NULL,
  `stop` int(12) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` int(10) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `currency` (`currency`,`start`) USING BTREE,
  KEY `start` (`start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excrate`
--

LOCK TABLES `excrate` WRITE;
/*!40000 ALTER TABLE `excrate` DISABLE KEYS */;
/*!40000 ALTER TABLE `excrate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facebook_info`
--

DROP TABLE IF EXISTS `facebook_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook_id` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `facebook_data` longblob NOT NULL,
  `accept` int(11) NOT NULL,
  `date` int(50) NOT NULL,
  `zidisha_email` varchar(200) DEFAULT NULL,
  `ip_address` varchar(256) NOT NULL,
  `fail_reason` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `facebook_id` (`facebook_id`),
  KEY `ip_address` (`ip_address`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook_info`
--

LOCK TABLES `facebook_info` WRITE;
/*!40000 ALTER TABLE `facebook_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `facebook_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forgiven_loans`
--

DROP TABLE IF EXISTS `forgiven_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forgiven_loans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `loan_id` int(10) NOT NULL,
  `lender_id` int(10) NOT NULL,
  `borrower_id` int(10) NOT NULL,
  `amount` double(12,6) NOT NULL,
  `damount` double(12,6) NOT NULL,
  `date` int(11) NOT NULL,
  `tnc` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`,`lender_id`),
  KEY `borrower_id` (`borrower_id`),
  KEY `loan_id_2` (`loan_id`,`date`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forgiven_loans`
--

LOCK TABLES `forgiven_loans` WRITE;
/*!40000 ALTER TABLE `forgiven_loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `forgiven_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_cards`
--

DROP TABLE IF EXISTS `gift_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_cards` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `txn_id` int(10) NOT NULL,
  `order_type` varchar(10) NOT NULL,
  `card_amount` double(10,6) NOT NULL,
  `recipient_email` varchar(50) DEFAULT NULL,
  `to_name` varchar(50) DEFAULT NULL,
  `from_name` varchar(50) DEFAULT NULL,
  `message` varchar(1024) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `date` int(11) NOT NULL,
  `exp_date` int(11) NOT NULL,
  `card_code` varchar(20) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `claimed` int(1) NOT NULL DEFAULT '0',
  `claimed_by` int(11) DEFAULT '0',
  `donated` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `txn_id` (`txn_id`,`claimed_by`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_cards`
--

LOCK TABLES `gift_cards` WRITE;
/*!40000 ALTER TABLE `gift_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_transaction`
--

DROP TABLE IF EXISTS `gift_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `txn_id` int(10) DEFAULT NULL,
  `txn_type` varchar(50) NOT NULL DEFAULT 'paysimple',
  `userid` int(10) DEFAULT NULL,
  `invoiceid` int(10) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `total_cards` int(5) NOT NULL,
  `amount` double(10,6) NOT NULL,
  `donation` double(12,2) NOT NULL DEFAULT '0.00',
  `date` int(11) NOT NULL,
  `ip` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_transaction`
--

LOCK TABLES `gift_transaction` WRITE;
/*!40000 ALTER TABLE `gift_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_uploadcommentfile`
--

DROP TABLE IF EXISTS `grp_uploadcommentfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grp_uploadcommentfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentid` int(11) NOT NULL,
  `senderid` int(11) NOT NULL,
  `receiverid` int(11) NOT NULL,
  `forumid` int(11) NOT NULL,
  `uploadfile` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_uploadcommentfile`
--

LOCK TABLES `grp_uploadcommentfile` WRITE;
/*!40000 ALTER TABLE `grp_uploadcommentfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp_uploadcommentfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invites` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `lender` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` int(11) NOT NULL,
  `visited` int(1) NOT NULL DEFAULT '0',
  `reinvite` int(11) NOT NULL DEFAULT '0',
  `cookie_value` varchar(100) DEFAULT NULL,
  `invitee_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labels` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mainkey` varchar(50) DEFAULT NULL,
  `subkey` varchar(50) DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `text` text NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels1`
--

DROP TABLE IF EXISTS `labels1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labels1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mainkey` varchar(50) DEFAULT NULL,
  `subkey` varchar(50) DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `text` text NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels1`
--

LOCK TABLES `labels1` WRITE;
/*!40000 ALTER TABLE `labels1` DISABLE KEYS */;
/*!40000 ALTER TABLE `labels1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `langcode` varchar(10) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lender_groups`
--

DROP TABLE IF EXISTS `lender_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lender_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `website` varchar(512) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `about_grp` mediumtext NOT NULL,
  `member_name1` varchar(100) DEFAULT NULL,
  `member_email1` varchar(100) DEFAULT NULL,
  `member_name2` varchar(100) DEFAULT NULL,
  `member_email2` varchar(100) DEFAULT NULL,
  `member_name3` varchar(100) DEFAULT NULL,
  `member_email3` varchar(100) DEFAULT NULL,
  `member_name4` varchar(100) DEFAULT NULL,
  `member_email4` varchar(100) DEFAULT NULL,
  `member_name5` varchar(100) DEFAULT NULL,
  `member_email5` varchar(100) DEFAULT NULL,
  `member_name6` varchar(100) DEFAULT NULL,
  `member_email6` varchar(100) DEFAULT NULL,
  `member_name7` varchar(100) DEFAULT NULL,
  `member_email7` varchar(100) DEFAULT NULL,
  `member_name8` varchar(100) DEFAULT NULL,
  `member_email8` varchar(100) DEFAULT NULL,
  `member_name9` varchar(100) DEFAULT NULL,
  `member_email9` varchar(100) DEFAULT NULL,
  `member_name10` varchar(100) DEFAULT NULL,
  `member_email10` varchar(100) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `grp_leader` int(11) DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lender_groups`
--

LOCK TABLES `lender_groups` WRITE;
/*!40000 ALTER TABLE `lender_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `lender_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lenders`
--

DROP TABLE IF EXISTS `lenders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lenders` (
  `userid` int(5) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `About` text,
  `PhotoPath` varchar(50) DEFAULT NULL,
  `T_Amount` double(10,2) DEFAULT '0.00',
  `hide_Amount` tinyint(1) DEFAULT '0',
  `LastLogin` int(12) DEFAULT '0',
  `City` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `sendMail` tinyint(4) NOT NULL DEFAULT '0',
  `Active` tinyint(4) NOT NULL DEFAULT '1',
  `emailcomment` tinyint(4) NOT NULL DEFAULT '1',
  `email_loan_repayment` int(1) NOT NULL DEFAULT '1',
  `loan_app_notify` int(1) NOT NULL DEFAULT '1',
  `subscribe_newsletter` int(1) NOT NULL DEFAULT '1',
  `groupmsg_notify` varchar(100) DEFAULT '0',
  `isTranslator` int(1) NOT NULL DEFAULT '0',
  `trans_Lang` varchar(1024) DEFAULT NULL,
  `admin_donate` tinyint(4) DEFAULT '0',
  `website` text,
  `sharebox_off` int(1) NOT NULL COMMENT 'If set to 1, do not display social share modal box when loan bid is placed',
  `DonationAcct` tinyint(4) NOT NULL COMMENT 'if set to 1, the lender account is a donation account and withdrawals are disabled',
  PRIMARY KEY (`userid`),
  KEY `userid` (`userid`),
  KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lenders`
--

LOCK TABLES `lenders` WRITE;
/*!40000 ALTER TABLE `lenders` DISABLE KEYS */;
/*!40000 ALTER TABLE `lenders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lending_cart`
--

DROP TABLE IF EXISTS `lending_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lending_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `status` varchar(40) NOT NULL,
  `session_id` varchar(40) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lending_cart`
--

LOCK TABLES `lending_cart` WRITE;
/*!40000 ALTER TABLE `lending_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `lending_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lending_group_comment`
--

DROP TABLE IF EXISTS `lending_group_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lending_group_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderid` int(11) NOT NULL,
  `receiverid` int(11) NOT NULL,
  `subject` varchar(1024) NOT NULL,
  `tr_subject` varchar(2028) DEFAULT NULL,
  `message` text NOT NULL,
  `tr_message` text,
  `parentid` int(11) NOT NULL,
  `forumid` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `thread` int(11) NOT NULL,
  `pub_date` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  `left` int(11) DEFAULT NULL,
  `right` int(11) DEFAULT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lending_group_comment`
--

LOCK TABLES `lending_group_comment` WRITE;
/*!40000 ALTER TABLE `lending_group_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `lending_group_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lending_group_members`
--

DROP TABLE IF EXISTS `lending_group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lending_group_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `leaved` tinyint(4) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lending_group_members`
--

LOCK TABLES `lending_group_members` WRITE;
/*!40000 ALTER TABLE `lending_group_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `lending_group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_notes`
--

DROP TABLE IF EXISTS `loan_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `disbursement_notes` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_notes`
--

LOCK TABLES `loan_notes` WRITE;
/*!40000 ALTER TABLE `loan_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanapplic`
--

DROP TABLE IF EXISTS `loanapplic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loanapplic` (
  `loanid` int(5) NOT NULL AUTO_INCREMENT,
  `borrowerid` int(5) NOT NULL,
  `Amount` double(10,2) NOT NULL DEFAULT '0.00',
  `interest` double(7,3) NOT NULL DEFAULT '0.000',
  `period` int(3) NOT NULL,
  `original_period` int(3) NOT NULL DEFAULT '0',
  `grace` int(2) NOT NULL,
  `loanuse` mediumtext,
  `tr_loanuse` text,
  `tr_user` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//loan stage configuration define("NO_LOAN", 4); define("LOAN_OPEN", 0); define("LOAN_FUNDED", 1); define("LOAN_ACTIVE", 2); define("LOAN_REPAID", 3); define("LOAN_DEFAULTED", 5); define("LOAN_CANCELED", 6); define("LOAN_EXPIRED", 7);',
  `expires` int(32) unsigned DEFAULT NULL,
  `finalrate` double(7,3) NOT NULL DEFAULT '0.000',
  `applydate` int(11) DEFAULT '0',
  `AcceptDate` int(11) DEFAULT '0',
  `WebFee` double(10,3) DEFAULT '0.000',
  `ActiveDate` int(15) DEFAULT '0',
  `RepaidDate` int(15) DEFAULT '0',
  `auth_date` int(15) NOT NULL,
  `p_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `tnc` smallint(1) NOT NULL DEFAULT '0',
  `AmountGot` double(10,2) NOT NULL DEFAULT '0.00',
  `reqdamt` double(10,2) NOT NULL DEFAULT '0.00',
  `adminDelete` tinyint(4) NOT NULL DEFAULT '0',
  `feedback_reminder` int(5) NOT NULL DEFAULT '0',
  `weekly_inst` tinyint(4) DEFAULT NULL COMMENT 'If set to 1, installments are due weekly. Otherwise they are due monthly.',
  `installment_day` int(11) DEFAULT '0',
  `installment_weekday` tinyint(4) DEFAULT NULL COMMENT 'Day of week installments are due for loans repaid weekly. 0 = Sun, 1 = Mon, 2 = Tue, 3 = Wed, 4 = Thu, 5 = Fri, 6 = Sat',
  `extra_days` int(11) NOT NULL DEFAULT '0',
  `expiry_mail` tinyint(4) NOT NULL DEFAULT '0',
  `accept_bid_note` text,
  PRIMARY KEY (`loanid`),
  KEY `borrowerid` (`borrowerid`,`loanid`) USING BTREE,
  KEY `active` (`active`),
  KEY `loanid` (`loanid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanapplic`
--

LOCK TABLES `loanapplic` WRITE;
/*!40000 ALTER TABLE `loanapplic` DISABLE KEYS */;
/*!40000 ALTER TABLE `loanapplic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanbids`
--

DROP TABLE IF EXISTS `loanbids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loanbids` (
  `bidid` int(11) NOT NULL AUTO_INCREMENT,
  `loanid` int(5) NOT NULL,
  `lenderid` int(5) NOT NULL,
  `bidamount` double(12,3) NOT NULL,
  `bidint` double(10,5) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `givenamount` double(10,3) NOT NULL DEFAULT '0.000',
  `biddate` varchar(13) NOT NULL DEFAULT '0',
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`bidid`),
  UNIQUE KEY `bidid` (`bidid`),
  KEY `lenderid` (`lenderid`),
  KEY `loanid` (`loanid`,`bidint`,`bidid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanbids`
--

LOCK TABLES `loanbids` WRITE;
/*!40000 ALTER TABLE `loanbids` DISABLE KEYS */;
/*!40000 ALTER TABLE `loanbids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans_to_forgive`
--

DROP TABLE IF EXISTS `loans_to_forgive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans_to_forgive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowerid` int(11) NOT NULL,
  `loanid` int(11) NOT NULL,
  `comment` mediumtext NOT NULL,
  `time` int(11) NOT NULL,
  `lender_denied` mediumtext,
  `validation_code` varchar(100) DEFAULT NULL,
  `reminder_sent` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans_to_forgive`
--

LOCK TABLES `loans_to_forgive` WRITE;
/*!40000 ALTER TABLE `loans_to_forgive` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans_to_forgive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanstage`
--

DROP TABLE IF EXISTS `loanstage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loanstage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanid` int(11) NOT NULL,
  `borrowerid` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `startdate` int(11) NOT NULL,
  `enddate` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanstage`
--

LOCK TABLES `loanstage` WRITE;
/*!40000 ALTER TABLE `loanstage` DISABLE KEYS */;
/*!40000 ALTER TABLE `loanstage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minfund`
--

DROP TABLE IF EXISTS `minfund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minfund` (
  `amount` double(10,5) NOT NULL DEFAULT '0.00000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minfund`
--

LOCK TABLES `minfund` WRITE;
/*!40000 ALTER TABLE `minfund` DISABLE KEYS */;
/*!40000 ALTER TABLE `minfund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `on_borrower_behalf`
--

DROP TABLE IF EXISTS `on_borrower_behalf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `on_borrower_behalf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact_no` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `town` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `on_borrower_behalf`
--

LOCK TABLES `on_borrower_behalf` WRITE;
/*!40000 ALTER TABLE `on_borrower_behalf` DISABLE KEYS */;
/*!40000 ALTER TABLE `on_borrower_behalf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pagename` varchar(50) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners` (
  `userid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `PostAddress` text NOT NULL,
  `City` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `emails_notify` text,
  `Website` varchar(100) DEFAULT NULL,
  `Description` text,
  `Active` tinyint(1) NOT NULL,
  `activedate` int(12) NOT NULL DEFAULT '0',
  `LastLogin` int(12) unsigned zerofill DEFAULT NULL,
  `postcomment` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`),
  KEY `email` (`email`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn_raw_log`
--

DROP TABLE IF EXISTS `paypal_ipn_raw_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_ipn_raw_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_timestamp` bigint(20) DEFAULT NULL,
  `ipn_data_serialized` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn_raw_log`
--

LOCK TABLES `paypal_ipn_raw_log` WRITE;
/*!40000 ALTER TABLE `paypal_ipn_raw_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn_raw_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_txns`
--

DROP TABLE IF EXISTS `paypal_txns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_txns` (
  `invoiceid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `txnid` varchar(45) DEFAULT '0',
  `txn_type` varchar(50) NOT NULL DEFAULT 'fund',
  `txndate` int(10) unsigned DEFAULT NULL,
  `amount` float(12,2) NOT NULL,
  `paypal_tran_fee` double(12,2) NOT NULL DEFAULT '0.00',
  `donation` double(12,2) NOT NULL DEFAULT '0.00',
  `total_amount` double(12,2) NOT NULL DEFAULT '0.00',
  `status` varchar(45) NOT NULL,
  `paypaldata` mediumtext,
  `updateddate` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `custom` varchar(100) NOT NULL,
  PRIMARY KEY (`invoiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_txns`
--

LOCK TABLES `paypal_txns` WRITE;
/*!40000 ALTER TABLE `paypal_txns` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_txns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paysimple_ipn_raw_log`
--

DROP TABLE IF EXISTS `paysimple_ipn_raw_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paysimple_ipn_raw_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_timestamp` bigint(20) DEFAULT NULL,
  `ipn_data_serialized` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paysimple_ipn_raw_log`
--

LOCK TABLES `paysimple_ipn_raw_log` WRITE;
/*!40000 ALTER TABLE `paysimple_ipn_raw_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `paysimple_ipn_raw_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paysimple_txns`
--

DROP TABLE IF EXISTS `paysimple_txns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paysimple_txns` (
  `invoiceid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `txnid` varchar(45) DEFAULT '0',
  `txndate` int(10) unsigned DEFAULT NULL,
  `amount` float(12,2) NOT NULL,
  `status` varchar(45) NOT NULL,
  `paysimpledata` mediumtext,
  `updateddate` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `custom` varchar(100) NOT NULL,
  PRIMARY KEY (`invoiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paysimple_txns`
--

LOCK TABLES `paysimple_txns` WRITE;
/*!40000 ALTER TABLE `paysimple_txns` DISABLE KEYS */;
/*!40000 ALTER TABLE `paysimple_txns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paysimple_withdraw`
--

DROP TABLE IF EXISTS `paysimple_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paysimple_withdraw` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(12) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(11) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `amount` double(12,6) NOT NULL,
  `date1` varchar(15) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paysimple_withdraw`
--

LOCK TABLES `paysimple_withdraw` WRITE;
/*!40000 ALTER TABLE `paysimple_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `paysimple_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_log`
--

DROP TABLE IF EXISTS `phone_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) DEFAULT NULL,
  `phoneno` varchar(100) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_log`
--

LOCK TABLES `phone_log` WRITE;
/*!40000 ALTER TABLE `phone_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_codes`
--

DROP TABLE IF EXISTS `referral_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referral_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `referral_code` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(25) NOT NULL,
  `cookie` varchar(200) NOT NULL,
  `txn_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_codes`
--

LOCK TABLES `referral_codes` WRITE;
/*!40000 ALTER TABLE `referral_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrals` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `start` int(11) NOT NULL,
  `stop` int(11) NOT NULL DEFAULT '0',
  `country` varchar(10) NOT NULL,
  `ref_commission` double(12,2) NOT NULL,
  `percent_repay` int(5) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_fee`
--

DROP TABLE IF EXISTS `registration_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_fee` (
  `S.No.` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `currency_name` varchar(50) NOT NULL,
  `Amount` double DEFAULT NULL,
  PRIMARY KEY (`S.No.`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_fee`
--

LOCK TABLES `registration_fee` WRITE;
/*!40000 ALTER TABLE `registration_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repay_report_detail`
--

DROP TABLE IF EXISTS `repay_report_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repay_report_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanid` int(11) NOT NULL,
  `borrowerid` int(11) NOT NULL,
  `expected_repaydate` int(11) DEFAULT NULL,
  `note` mediumtext,
  `created` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  `lastVisited` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrowerid` (`borrowerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repay_report_detail`
--

LOCK TABLES `repay_report_detail` WRITE;
/*!40000 ALTER TABLE `repay_report_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `repay_report_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repayment_instructions`
--

DROP TABLE IF EXISTS `repayment_instructions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repayment_instructions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repayment_instructions`
--

LOCK TABLES `repayment_instructions` WRITE;
/*!40000 ALTER TABLE `repayment_instructions` DISABLE KEYS */;
/*!40000 ALTER TABLE `repayment_instructions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repaymentschedule`
--

DROP TABLE IF EXISTS `repaymentschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repaymentschedule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `loanid` int(10) unsigned NOT NULL,
  `duedate` varchar(40) DEFAULT NULL,
  `amount` double(12,6) DEFAULT NULL,
  `paiddate` int(10) unsigned DEFAULT NULL,
  `paidamt` double(12,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`,`loanid`,`duedate`) USING BTREE,
  KEY `loanid` (`loanid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repaymentschedule`
--

LOCK TABLES `repaymentschedule` WRITE;
/*!40000 ALTER TABLE `repaymentschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `repaymentschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repaymentschedule_actual`
--

DROP TABLE IF EXISTS `repaymentschedule_actual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repaymentschedule_actual` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `loanid` int(10) unsigned NOT NULL,
  `paiddate` int(11) unsigned DEFAULT NULL,
  `paidamt` double(15,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`,`loanid`) USING BTREE,
  KEY `loanid` (`loanid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repaymentschedule_actual`
--

LOCK TABLES `repaymentschedule_actual` WRITE;
/*!40000 ALTER TABLE `repaymentschedule_actual` DISABLE KEYS */;
/*!40000 ALTER TABLE `repaymentschedule_actual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repaymentschedule_actual_history`
--

DROP TABLE IF EXISTS `repaymentschedule_actual_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repaymentschedule_actual_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repaymentschedule_actual_id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `reschedule_id` int(10) DEFAULT NULL,
  `userid` int(10) unsigned NOT NULL,
  `loanid` int(10) unsigned NOT NULL,
  `paiddate` int(11) unsigned DEFAULT NULL,
  `paidamt` double(12,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3179 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repaymentschedule_actual_history`
--

LOCK TABLES `repaymentschedule_actual_history` WRITE;
/*!40000 ALTER TABLE `repaymentschedule_actual_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `repaymentschedule_actual_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repaymentschedule_history`
--

DROP TABLE IF EXISTS `repaymentschedule_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repaymentschedule_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repaymentschedule_id` int(10) unsigned NOT NULL,
  `forgiven_loans_id` int(10) DEFAULT NULL,
  `reschedule_id` int(10) DEFAULT NULL,
  `userid` int(10) unsigned NOT NULL,
  `loanid` int(10) unsigned NOT NULL,
  `duedate` varchar(40) DEFAULT NULL,
  `amount` double(12,6) DEFAULT NULL,
  `paiddate` int(10) unsigned DEFAULT NULL,
  `paidamt` double(12,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reschedule_id` (`loanid`,`reschedule_id`) USING BTREE,
  KEY `loanid` (`loanid`,`forgiven_loans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repaymentschedule_history`
--

LOCK TABLES `repaymentschedule_history` WRITE;
/*!40000 ALTER TABLE `repaymentschedule_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `repaymentschedule_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reschedule`
--

DROP TABLE IF EXISTS `reschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reschedule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `loan_id` int(10) NOT NULL,
  `borrower_id` int(10) NOT NULL,
  `reschedule_reason` mediumtext,
  `period` int(3) DEFAULT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`,`date`,`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reschedule`
--

LOCK TABLES `reschedule` WRITE;
/*!40000 ALTER TABLE `reschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `reschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `value` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` char(1) DEFAULT 'Y',
  `countrycode` varchar(2) NOT NULL DEFAULT 'US',
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `value` longblob NOT NULL,
  `date` int(11) NOT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country` (`country`,`date`),
  KEY `Name` (`Name`,`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `amount` double(12,4) NOT NULL DEFAULT '0.0000',
  `txn_desc` varchar(100) NOT NULL,
  `loanid` int(10) unsigned NOT NULL DEFAULT '0',
  `TrDate` int(10) unsigned NOT NULL,
  `conversionrate` double(10,3) NOT NULL,
  `txn_type` int(11) NOT NULL DEFAULT '0',
  `txn_sub_type` int(5) NOT NULL DEFAULT '0',
  `loanbid_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `loanid` (`loanid`,`TrDate`),
  KEY `userid` (`userid`,`TrDate`),
  KEY `TrDate` (`TrDate`),
  KEY `txn_type` (`txn_type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_security`
--

DROP TABLE IF EXISTS `u_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_security` (
  `userid` int(5) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `LastLogin` int(12) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'O-inactive, 1-Active',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_security`
--

LOCK TABLES `u_security` WRITE;
/*!40000 ALTER TABLE `u_security` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(5) NOT NULL AUTO_INCREMENT,
  `facebook_id` varchar(100) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `userlevel` int(1) NOT NULL DEFAULT '0',
  `regdate` int(32) NOT NULL,
  `last_login` int(32) DEFAULT NULL,
  `tnc` tinyint(1) NOT NULL DEFAULT '0',
  `lang` varchar(10) DEFAULT 'en',
  `emailVerified` int(1) NOT NULL DEFAULT '0',
  `accountExpiedMail` tinyint(4) NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT NULL,
  `fb_post` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw`
--

DROP TABLE IF EXISTS `withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdraw` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(12) unsigned NOT NULL,
  `amount` double(12,6) NOT NULL,
  `date` varchar(15) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `paypalemail` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw`
--

LOCK TABLES `withdraw` WRITE;
/*!40000 ALTER TABLE `withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zi_comment`
--

DROP TABLE IF EXISTS `zi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zi_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderid` int(11) NOT NULL,
  `receiverid` int(11) NOT NULL,
  `subject` varchar(1024) NOT NULL,
  `tr_subject` varchar(2028) DEFAULT NULL,
  `message` text NOT NULL,
  `tr_message` text,
  `tr_user` int(11) DEFAULT NULL,
  `parentid` int(11) NOT NULL,
  `forumid` int(11) NOT NULL,
  `thread` int(11) NOT NULL,
  `pub_date` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  `left` int(11) DEFAULT NULL,
  `right` int(11) DEFAULT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT '1',
  `reschedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receiverid` (`receiverid`,`forumid`) USING BTREE,
  KEY `senderid` (`senderid`,`forumid`) USING BTREE,
  KEY `parentid` (`parentid`),
  KEY `publish` (`publish`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zi_comment`
--

LOCK TABLES `zi_comment` WRITE;
/*!40000 ALTER TABLE `zi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `zi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zi_uploadcommentfile`
--

DROP TABLE IF EXISTS `zi_uploadcommentfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zi_uploadcommentfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentid` int(11) NOT NULL,
  `senderid` int(11) NOT NULL,
  `receiverid` int(11) NOT NULL,
  `forumid` int(11) NOT NULL,
  `uploadfile` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zi_uploadcommentfile`
--

LOCK TABLES `zi_uploadcommentfile` WRITE;
/*!40000 ALTER TABLE `zi_uploadcommentfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `zi_uploadcommentfile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-03  9:02:13
