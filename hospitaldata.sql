CREATE DATABASE  IF NOT EXISTS `team_a_hospital_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `team_a_hospital_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: team_a_hospital_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.6-MariaDB

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
-- Table structure for table `Condition`
--

DROP TABLE IF EXISTS `Condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Condition` (
  `condition_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`condition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Condition`
--

LOCK TABLES `Condition` WRITE;
/*!40000 ALTER TABLE `Condition` DISABLE KEYS */;
INSERT INTO `Condition` VALUES (1,'Abdominal aortic aneurysm','An abdominal aortic aneurysm (AAA) is a swelling (aneurysm) of the aorta – the main blood vessel that leads away from the heart, down through the abdomen to the rest of the body.'),(2,'Acne','Acne is a common skin condition that affects most people at some point. It causes spots, oily skin and sometimes skin that\'s hot or painful to touch.'),(3,'Asthma','Asthma is a common long-term condition that can cause coughing, wheezing, chest tightness and breathlessness.'),(4,'Autism spectrum disorder (ASD)','Autism spectrum disorder (ASD) is a condition that affects social interaction, communication, interests and behaviour.'),(5,'Bronchitis','Bronchitis is an infection of the main airways of the lungs (bronchi), causing them to become irritated and inflamed.'),(6,'Common Cold','A cold is a mild viral infection of the nose, throat, sinuses and upper airways. It\'s very common and usually clears up on its own within a week or two.'),(7,'Constipation','Constipation is a common condition that affects people of all ages. It can mean that you\'re not passing stools regularly or you\'re unable to completely empty your bowel.'),(8,'Diabetes','Diabetes is a lifelong condition that causes a person\'s blood sugar level to become too high.'),(9,'Flu','Flu (influenza) is a common infectious viral illness spread by coughs and sneezes. It can be very unpleasant, but you\'ll usually begin to feel better within about a week.'),(10,'Heart failure','Heart failure is a serious condition, but it does not actually mean that your heart has failed. It means that your heart is not pumping blood around your body very efficiently.'),(11,'Insomnia','Insomnia is difficulty getting to sleep or staying asleep for long enough to feel refreshed the next morning.'),(12,'Liver Cancer','Primary liver cancer is an uncommon but serious type of cancer that begins in the liver.'),(13,'Migraines','A migraine is usually a moderate or severe headache felt as a throbbing pain on one side of the head.'),(14,'Psoriasis','Psoriasis is a skin condition that causes red, flaky, crusty patches of skin covered with silvery scales.'),(15,'Schizophrenia','Schizophrenia is a long-term mental health condition that causes a range of different psychological symptoms'),(16,'Melanoma','Melanoma is a type of skin cancer that can spread to other organs in the body.'),(17,'Sore throat','Sore throats are very common and usually nothing to worry about. They normally get better within a week.'),(18,'Urinary tract infection','Urinary tract infections (UTIs) are common infections that can affect the bladder, the kidneys and the tubes connected to them.'),(19,'Leg ulcer','A leg ulcer is a long-lasting (chronic) sore that takes more than 4 to 6 weeks to heal. They usually develop on the inside of the leg, just above the ankle.'),(20,'Yellow fever','Yellow fever is a serious viral infection that is spread by certain types of mosquito. It’s mainly found in sub-Saharan Africa, South America and parts of the Caribbean.'),(21,'Healthy','Patient is healthy');
/*!40000 ALTER TABLE `Condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diagnosis`
--

DROP TABLE IF EXISTS `Diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Diagnosis` (
  `diagnosis_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` int(10) unsigned NOT NULL,
  `condition_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`diagnosis_id`),
  KEY `fk_Diagnosis_Visit1_idx` (`visit_id`),
  KEY `fk_Diagnosis_Condition1_idx` (`condition_id`),
  CONSTRAINT `fk_Diagnosis_Condition1` FOREIGN KEY (`condition_id`) REFERENCES `Condition` (`condition_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diagnosis_Visit1` FOREIGN KEY (`visit_id`) REFERENCES `Visit` (`visit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnosis`
--

LOCK TABLES `Diagnosis` WRITE;
/*!40000 ALTER TABLE `Diagnosis` DISABLE KEYS */;
INSERT INTO `Diagnosis` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,21),(7,7,6),(8,8,21),(9,9,21),(10,10,8),(11,11,10),(12,12,12),(13,13,9),(14,14,15),(15,15,16),(16,16,19),(17,17,15),(18,18,21),(19,19,21),(20,20,21),(21,21,21),(22,22,15),(23,23,17),(24,24,21),(25,25,21),(26,26,21),(27,27,21),(28,28,2),(29,29,6),(30,30,19),(31,31,4),(32,32,9),(33,33,3),(34,34,15),(35,35,3),(36,36,1),(37,37,21),(38,38,21),(39,39,15),(40,40,16),(41,41,17),(42,42,21),(43,43,21),(44,44,21),(45,45,19),(46,46,2),(47,47,8),(48,48,3),(49,49,21),(50,50,21),(51,51,4),(52,52,12),(53,53,12),(54,54,12),(55,55,12),(56,56,19),(57,57,19),(58,58,19),(59,59,19);
/*!40000 ALTER TABLE `Diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `doctor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,'Braelyn','Richmond','Braelyn1Richmond@hospitalteam.com','(628) 737-8387'),(2,'Kameron','Benson','Kameron2Benson@hospitalteam.com','(412) 542-1964'),(3,'Hugo','Randolph','Hugo3Randolph@hospitalteam.com','(977) 281-4408'),(4,'Adalyn','Aguilar','Adalyn4Aguilar@hospitalteam.com','(897) 406-2496'),(5,'Deborah','Stevens','Deborah5Stevens@hospitalteam.com','(295) 952-1762'),(6,'Riya','Valdez','Riya6Valdez@hospitalteam.com','(456) 630-2623'),(7,'Paityn','Liu','Paityn7Liu@hospitalteam.com','(357) 707-9281'),(8,'Dorian','Gray','Dorian8Gray@hospitalteam.com','(342) 587-7675'),(9,'Lillie','Madden','Lillie9Madden@hospitalteam.com','(242) 303-5504'),(10,'Marlie','Carson','Marlie10Carson@hospitalteam.com','(840) 215-7859'),(11,'Eric','Little','Eric11Little@hospitalteam.com','(240) 946-4206'),(12,'Draven','Bauer','Draven12Bauer@hospitalteam.com','(752) 320-9309'),(13,'Judith','Walker','Judith13Walker@hospitalteam.com','(298) 754-7168'),(14,'Paris','Villa','Paris14Villa@hospitalteam.com','(747) 652-9428'),(15,'Francesca','Valencia','Francesca15Valencia@hospitalteam.com','(871) 849-2091');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicine`
--

DROP TABLE IF EXISTS `Medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medicine` (
  `medicine_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicine`
--

LOCK TABLES `Medicine` WRITE;
/*!40000 ALTER TABLE `Medicine` DISABLE KEYS */;
INSERT INTO `Medicine` VALUES (1,'Carvedilol (Coreg)','Beta blockers'),(2,'Tetracycline','Oral antibiotics'),(3,'Fluticasone (Flovent HFA)','Fluticasone (Flovent HFA)'),(4,'Prozac','selective serotonin reuptake inhibitors (SSRIs)'),(5,'Ibuprofen','Over the counter drug'),(6,'Theraflu','Over the counter drug for cold and flu'),(7,'Pepto Bismol','Over the counter drug for constipation'),(8,'Novolin','short acting insulin'),(9,'Theraflu','Over the counter drug for cold and flu'),(10,'Novolin','Decreases blood clotting'),(11,'Lunesta','Non-benzodiazepine sedative'),(12,'Cabozantinib-S-Malate','Cancer treatment medication'),(13,'Tylenon','Over the counter pain medication'),(14,'Enbrel','psoriasis treatment'),(15,'Clozapine (Clozaril)','antipsychotic medication'),(16,'Aldesleukin','Skin cancer medication'),(17,'Mucinex','Over the counter drug for sore throat'),(18,'AZO','Urinary pain relief'),(19,'UlcerGard','uleg ulcer medication');
/*!40000 ALTER TABLE `Medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse`
--

DROP TABLE IF EXISTS `Nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nurse` (
  `nurse_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`nurse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nurse`
--

LOCK TABLES `Nurse` WRITE;
/*!40000 ALTER TABLE `Nurse` DISABLE KEYS */;
INSERT INTO `Nurse` VALUES (1,'Jane','Donahoe','(202)123-4567'),(2,'Alejandro','Reeves','(228) 767-2381'),(3,'Osvaldo','Hammond','(624) 676-7199'),(4,'Lou','Parrish','(946) 734-6099'),(5,'Louise','Weeks','(404) 350-5679'),(6,'Phyllis','Hammond','(254) 594-1551'),(7,'Teisha','Sims','(974) 375-5679'),(8,'Robena','Munoz','(210) 227-4128'),(9,'Marlen','Mcclure','(705) 252-7850'),(10,'Sarita','Schmidt','(782) 374-9636'),(11,'Tuyet','Gordon','(760) 304-0471'),(12,'Jennie','Villarreal','(744) 967-4471'),(13,'Tonette','Wong','(519) 712-4392'),(14,'Xochitl','Camacho','(419) 741-2167'),(15,'Kiley','Bond','(616) 635-7448'),(16,'Eliza','Gentry','(764) 305-0869'),(17,'Steven','West','(240) 803-6370'),(18,'Audra','Griffin','(923) 222-7030'),(19,'Laurene','Hughes','(814) 260-7938'),(20,'Tashina','Roberson','(223) 810-1251'),(21,'Noma','Walter','(672) 662-4794'),(22,'Tamiko','Singleton','(426) 794-5879'),(23,'Minna','Henderson','(567) 831-1194'),(24,'Manda','Maldonado','(629) 950-2738'),(25,'Maribel','Morgan','(509) 805-7702'),(26,'Corie','Cain','(330) 708-6683'),(27,'Gertrude','Ritter','(734) 235-5739'),(28,'Lia','Riley','(436) 515-6860'),(29,'Shizue','Hancock','(215) 664-7452'),(30,'Lakendra','Hanna','(702) 772-1655'),(31,'Wendell','Ker','(634) 937-9124'),(32,'Paul','John','(918) 230-3234');
/*!40000 ALTER TABLE `Nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `patient_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `street_address` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,'John','Roberts','JohnRoberts1@gmail.com','(301) 123-4567','1234 Gude St.','Silver Spring',20910,'MD','United States of America','M'),(2,'Deandre','Barrera','DeandreBarrera2@gmail.com','(214) 710-6821','9730 Valley View Street','Rockville',20910,'MD','United States of America','M'),(3,'Maryrose','Duffy','MaryroseDuffy3@gmail.com','(212) 815-7338','86 Brookside Drive','Rockville',20910,'MD','United States of America','F'),(4,'Jarvis','Smith','JarvisSmith4@gmail.com','(313) 745-2060','331 Old Marlborough Street','Silver Spring',20910,'MD','United States of America','M'),(5,'Enedina','Arellano','EnedinaArellano5@gmail.com','(386) 774-2873','7294 Pineknoll Court','Silver Spring',20910,'MD','United States of America','F'),(6,'Chuck','Cameron','ChuckCameron6@gmail.com','(715) 878-4217','145 East Tanglewood Ave.','Silver Spring',20910,'MD','United States of America','M'),(7,'Honey','Curry','HoneyCurry7@gmail.com','(489) 766-9947','863 Bridgeton St.','Rockville',20821,'MD','United States of America','F'),(8,'Napoleon','Bridges','NapoleonBridges8@gmail.com','(648) 838-3283','620 East Rockland Dr.','Arlington',20312,'VA','United States of America','M'),(9,'Camelia','Walters','CameliaWalters9@gmail.com','(333) 798-5478','5 Poplar Dr.','Alexandria',39492,'VA','United States of America','F'),(10,'Herschel','Fuentes','HerschelFuentes10@gmail.com','(498) 852-7313','4 West Berkshire Ave.','Arlington',20821,'VA','United States of America','M'),(11,'Ignacia','Nichols','IgnaciaNichols11@gmail.com','(304) 296-3704','127 Manor St.','Arlington',20821,'VA','United States of America','F'),(12,'Letty','Mckinney','LettyMckinney12@gmail.com','(883) 703-6834','8668 SW. Sugar St.','Alexandria',20821,'VA','United States of America','F'),(13,'Cleopatra','Choi','CleopatraChoi13@gmail.com','(428) 465-8888','9201 Monroe Court','Silver Spring',20821,'MD','United States of America','F'),(14,'Felisha','Mathis','FelishaMathis14@gmail.com','(930) 751-3796','8707 E. Cypress St.','Silver Spring',20821,'MD','United States of America','F'),(15,'Margaret','Mejia','MargaretMejia15@gmail.com','(283) 767-9818','7232 Gregory Rd.','Rockville',20986,'MD','United States of America','F'),(16,'Flo','Porter','FloPorter16@gmail.com','(331) 872-4501','1 Glen Creek St.','Alexandria',20821,'VA','United States of America','F'),(17,'Sarai','Montgomery','SaraiMontgomery17@gmail.com','(641) 496-1829','446 Orchard Lane','Arlington',20821,'VA','United States of America','F'),(18,'Kai','Eaton','KaiEaton18@gmail.com','(842) 910-6719','16 Wagon Ave.','Alexandria',20821,'VA','United States of America','F'),(19,'Antoinette','Cisneros','AntoinetteCisneros19@gmail.com','(996) 676-1136','9894 Sheffield St.','Arlington',50273,'VA','United States of America','F'),(20,'Jewell','Phillips','JewellPhillips20@gmail.com','(903) 546-3207','6 Gonzales St.','Alexandria',30284,'VA','United States of America','M'),(21,'Rosemarie','Riggs','RosemarieRiggs21@gmail.com','(578) 787-1286','Bethel Park, PA 15102','Alexandria',40282,'VA','United States of America','F'),(22,'Pamala','Clay','PamalaClay22@gmail.com','(791) 293-6354','30 John Lane','Rockville',30291,'MD','United States of America','F'),(23,'Torri','Lam','TorriLam23@gmail.com','(446) 830-2529','301 Prairie Drive','Silver Spring',20910,'MD','United States of America','F'),(24,'Kia','Harris','KiaHarris24@gmail.com','(225) 782-0857','9889 Liberty Lane','Silver Spring',20910,'MD','United States of America','F'),(25,'Patsy','Aguilar','PatsyAguilar25@gmail.com','(596) 737-5732','8707 Hartford Circle','Silver Spring',20910,'MD','United States of America','F'),(26,'Charlette','Sutton','CharletteSutton26@gmail.com','(830) 390-3914','255 North Belmont St.','Silver Spring',20910,'MD','United States of America','F'),(27,'Nikia','Stevens','NikiaStevens27@gmail.com','(223) 742-4816','9931 Smith Store Street','Rockville',20986,'MD','United States of America','F'),(28,'Antonette','Shaw','AntonetteShaw28@gmail.com','(312) 345-4961','9339 Newcastle Dr.','Rockville',20986,'MD','United States of America','F'),(29,'Cythia','Branch','CythiaBranch29@gmail.com','(601) 821-3797','646 1st Ave.','Rockville',20986,'MD','United States of America','F'),(30,'Daine','Roach','DaineRoach30@gmail.com','(756) 735-9841','7070 Theatre Street','Rockville',20986,'MD','United States of America','F'),(31,'Karol','Grimes','KarolGrimes31@gmail.com','(950) 386-9884','8 Tallwood Lane','Alexandria',30284,'VA','United States of America','F'),(32,'Ian','Reed','IanReed32@gmail.com','(681) 500-0039','664 Johnson Ave.','Alexandria',40282,'VA','United States of America','M'),(33,'Cesar','Lambert','CesarLambert33@gmail.com','(625) 736-5145','9911 Colonial Lane','Arlington',30284,'VA','United States of America','M'),(34,'Michaele','Mclean','MichaeleMclean34@gmail.com','(672) 846-2951','87 Shub Farm Road','Arlington',40282,'VA','United States of America','F'),(35,'Eusebia','Whitehead','EusebiaWhitehead35@gmail.com','(622) 413-1680','9400 Morris Circle','Arlington',30284,'VA','United States of America','F'),(36,'Norman','Spence','NormanSpence36@gmail.com','(765) 664-0007','347 Westminster St.','Arlington',40282,'VA','United States of America','M'),(37,'Delorse','Brown','DelorseBrown37@gmail.com','(314) 460-4346','8493 Mulberry Lane','Arlington',32382,'VA','United States of America','F'),(38,'Brenda','Schaefer','BrendaSchaefer38@gmail.com','(389) 252-5476','8630 Fairview Ave.','Arlington',40923,'VA','United States of America','F'),(39,'Minnie','Randall','MinnieRandall39@gmail.com','(690) 956-3552','4 South Hill Field St.','Arlington',30284,'VA','United States of America','F'),(40,'Moses','Peterson','MosesPeterson40@gmail.com','(423) 678-8686','51 Manor St.','Alexandria',40282,'VA','United States of America','M'),(41,'Gerardo','Ramirez','GerardoRamirez41@gmail.com','(692) 783-8733','624 Schoolhouse Street','Arlington',14345,'VA','United States of America','M'),(42,'Madelaine','Orozco','MadelaineOrozco42@gmail.com','(239) 982-5563','9208 Brickell St.','Alexandria',30283,'VA','United States of America','F'),(43,'Rochel','Chan','RochelChan43@gmail.com','(688) 606-0666','978 Belmont Lane','Alexandria',30283,'VA','United States of America','F'),(44,'Refugia','Solomon','RefugiaSolomon44@gmail.com','(300) 383-3417','62 Cedar Swamp Rd.','Alexandria',30283,'VA','United States of America','F'),(45,'Bethanie','Callahan','BethanieCallahan45@gmail.com','(296) 241-1734','7906 N. Church Dr.','Alexandria',20986,'VA','United States of America','F'),(46,'Siu','Zuniga','SiuZuniga46@gmail.com','(473) 550-9106','7740 East Carriage St.','Silver Spring',20821,'MD','United States of America','F'),(47,'Dorla','Escobar','DorlaEscobar47@gmail.com','(918) 883-6593','555 Cambridge Lane','Arlington',20821,'VA','United States of America','F'),(48,'Delena','Shaffer','DelenaShaffer48@gmail.com','(730) 936-3927','98 Lakeview St.','Rockville',20986,'MD','United States of America','F'),(49,'Milo','Farley','MiloFarley49@gmail.com','(681) 568-4457','441 Cleveland Street','Arlington',20986,'VA','United States of America','M'),(50,'Beryl','Everett','BerylEverett50@gmail.com','(713) 878-4338','901 W. High Noon Dr.','Rockville',20821,'MD','United States of America','F'),(51,'Stacy','Dixon','StacyDixon51@gmail.com','(441) 276-4008','9273 Kent Street','Rockville',32845,'MD','United States of America','F');
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_Nurse`
--

DROP TABLE IF EXISTS `Patient_Nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient_Nurse` (
  `patient_nurse_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) unsigned NOT NULL,
  `nurse_id` int(10) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`patient_nurse_id`),
  KEY `fk_Patient_has_Nurse_Nurse1_idx` (`nurse_id`),
  KEY `fk_Patient_has_Nurse_Patient1_idx` (`patient_id`),
  CONSTRAINT `fk_Patient_has_Nurse_Nurse1` FOREIGN KEY (`nurse_id`) REFERENCES `Nurse` (`nurse_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_has_Nurse_Patient1` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_Nurse`
--

LOCK TABLES `Patient_Nurse` WRITE;
/*!40000 ALTER TABLE `Patient_Nurse` DISABLE KEYS */;
INSERT INTO `Patient_Nurse` VALUES (1,1,1,'2019-11-01',NULL),(2,3,3,'2019-11-03',NULL),(3,4,4,'2019-11-05',NULL),(4,5,7,'2019-11-07',NULL),(5,10,9,'2019-11-09',NULL),(6,11,11,'2019-11-11',NULL),(7,12,14,'2019-11-13','2019-11-14'),(8,14,16,'2019-11-15',NULL),(9,15,18,'2019-11-17',NULL),(10,16,20,'2019-11-19',NULL),(11,22,21,'2019-11-21',NULL),(12,30,22,'2019-11-23','2019-11-24'),(13,31,29,'2019-11-25',NULL),(14,33,1,'2019-11-27',NULL),(15,35,12,'2019-11-29',NULL),(16,36,32,'2019-12-01',NULL),(17,39,31,'2019-12-03',NULL),(18,40,30,'2019-12-05',NULL),(19,45,3,'2019-12-07',NULL),(20,47,4,'2019-12-09',NULL),(21,48,7,'2019-12-11',NULL),(22,51,12,'2019-12-13',NULL),(23,12,1,'2019-12-15','2019-12-17'),(24,30,3,'2019-12-17','2019-12-20'),(25,2,4,'2019-12-19',NULL),(26,6,7,'2019-12-21',NULL),(27,7,9,'2019-12-23',NULL),(28,8,11,'2019-12-25',NULL),(29,9,14,'2019-12-27',NULL),(30,13,16,'2019-12-29',NULL),(31,12,18,'2019-12-31','2020-01-02'),(32,17,20,'2020-01-02',NULL),(33,30,21,'2020-01-04','2020-01-06'),(34,18,22,'2020-01-06',NULL),(35,19,29,'2020-01-08',NULL),(36,20,1,'2020-01-10',NULL),(37,30,12,'2020-01-12','2020-01-16'),(38,12,32,'2020-01-14','2020-01-16'),(39,21,31,'2020-01-16',NULL),(40,34,30,'2020-01-18',NULL),(41,37,3,'2020-01-20',NULL),(42,38,4,'2020-01-22',NULL),(43,30,7,'2020-01-24','2020-01-26'),(44,41,12,'2020-01-26',NULL),(45,42,1,'2020-01-28',NULL),(46,43,3,'2020-01-30',NULL),(47,44,4,'2020-02-01',NULL),(48,12,7,'2020-02-03','2020-02-05'),(49,46,9,'2020-02-05',NULL),(50,30,11,'2020-02-07','2020-02-10');
/*!40000 ALTER TABLE `Patient_Nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_Room`
--

DROP TABLE IF EXISTS `Patient_Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient_Room` (
  `inpatient_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`inpatient_id`),
  KEY `fk_Patient_has_Room_Room1_idx` (`room_id`),
  KEY `fk_Patient_has_Room_Patient1_idx` (`patient_id`),
  CONSTRAINT `fk_Patient_has_Room_Patient1` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_has_Room_Room1` FOREIGN KEY (`room_id`) REFERENCES `Room` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_Room`
--

LOCK TABLES `Patient_Room` WRITE;
/*!40000 ALTER TABLE `Patient_Room` DISABLE KEYS */;
INSERT INTO `Patient_Room` VALUES (1,1,1,'2019-11-01',NULL),(2,3,5,'2019-11-03',NULL),(3,4,6,'2019-11-05',NULL),(4,5,14,'2019-11-07',NULL),(5,10,15,'2019-11-09',NULL),(6,11,16,'2019-11-11',NULL),(7,12,17,'2019-11-13','2019-11-14'),(8,14,19,'2019-11-15',NULL),(9,15,24,'2019-11-17',NULL),(10,16,26,'2019-11-19',NULL),(11,22,27,'2019-11-21',NULL),(12,30,28,'2019-11-23','2019-11-24'),(13,31,33,'2019-11-25',NULL),(14,33,40,'2019-11-27',NULL),(15,35,44,'2019-11-29',NULL),(16,36,45,'2019-12-01',NULL),(17,39,47,'2019-12-03',NULL),(18,40,48,'2019-12-05',NULL),(19,45,54,'2019-12-07',NULL),(20,47,58,'2019-12-09',NULL),(21,48,62,'2019-12-11',NULL),(22,51,65,'2019-12-13',NULL),(23,12,1,'2019-12-15','2019-12-17'),(24,30,5,'2019-12-17','2019-12-20'),(25,2,6,'2019-12-19',NULL),(26,6,14,'2019-12-21',NULL),(27,7,15,'2019-12-23',NULL),(28,8,16,'2019-12-25',NULL),(29,9,14,'2019-12-27',NULL),(30,13,15,'2019-12-29',NULL),(31,12,16,'2019-12-31','2020-01-02'),(32,17,17,'2020-01-02',NULL),(33,30,19,'2020-01-04','2020-01-06'),(34,18,24,'2020-01-06',NULL),(35,19,28,'2020-01-08',NULL),(36,20,33,'2020-01-10',NULL),(37,30,40,'2020-01-12','2020-01-16'),(38,12,44,'2020-01-14','2020-01-16'),(39,21,45,'2020-01-16',NULL),(40,34,47,'2020-01-18',NULL),(41,37,48,'2020-01-20',NULL),(42,38,54,'2020-01-22',NULL),(43,30,28,'2020-01-24','2020-01-26'),(44,41,33,'2020-01-26',NULL),(45,42,40,'2020-01-28',NULL),(46,43,44,'2020-01-30',NULL),(47,44,45,'2020-02-01',NULL),(48,12,47,'2020-02-03','2020-02-05'),(49,46,48,'2020-02-05',NULL),(50,30,54,'2020-02-07','2020-02-10');
/*!40000 ALTER TABLE `Patient_Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription`
--

DROP TABLE IF EXISTS `Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prescription` (
  `prescription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diagnosis_id` int(10) unsigned NOT NULL,
  `prescription_date` date NOT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `fk_Prescription_Diagnosis1_idx` (`diagnosis_id`),
  CONSTRAINT `fk_Prescription_Diagnosis1` FOREIGN KEY (`diagnosis_id`) REFERENCES `Diagnosis` (`diagnosis_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription`
--

LOCK TABLES `Prescription` WRITE;
/*!40000 ALTER TABLE `Prescription` DISABLE KEYS */;
INSERT INTO `Prescription` VALUES (1,1,'2019-11-01'),(2,2,'2018-08-11'),(3,3,'2019-11-03'),(4,4,'2019-11-05'),(5,5,'2019-11-07'),(6,7,'2017-05-13'),(7,10,'2019-11-09'),(8,11,'2019-11-11'),(9,12,'2019-11-13'),(10,13,'2018-11-09'),(11,14,'2019-11-15'),(12,15,'2019-11-17'),(13,16,'2019-11-19'),(14,17,'2017-05-13'),(15,22,'2019-11-21'),(16,23,'2018-08-11'),(17,28,'2018-08-11'),(18,29,'2018-11-09'),(19,30,'2019-11-23'),(20,31,'2019-11-25'),(21,32,'2017-05-13'),(22,33,'2019-11-27'),(23,34,'2018-08-11'),(24,35,'2019-11-29'),(25,36,'2019-12-01'),(26,39,'2019-12-03'),(27,40,'2019-12-05'),(28,41,'2017-05-13'),(29,45,'2019-12-07'),(30,46,'2017-05-13'),(31,47,'2019-12-09'),(32,48,'2019-12-11'),(33,51,'2019-12-13');
/*!40000 ALTER TABLE `Prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription_Medicine`
--

DROP TABLE IF EXISTS `Prescription_Medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prescription_Medicine` (
  `prescription_id` int(10) unsigned NOT NULL,
  `medicine_id` int(10) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`prescription_id`,`medicine_id`),
  KEY `fk_Prescription_Medicine_Prescription1_idx` (`prescription_id`),
  KEY `fk_Prescription_Medicine_Medicine1_idx` (`medicine_id`),
  CONSTRAINT `fk_Prescription_Medicine_Medicine1` FOREIGN KEY (`medicine_id`) REFERENCES `Medicine` (`medicine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prescription_Medicine_Prescription1` FOREIGN KEY (`prescription_id`) REFERENCES `Prescription` (`prescription_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription_Medicine`
--

LOCK TABLES `Prescription_Medicine` WRITE;
/*!40000 ALTER TABLE `Prescription_Medicine` DISABLE KEYS */;
INSERT INTO `Prescription_Medicine` VALUES (1,1,'2019-11-01','2019-11-30',35),(2,2,'2018-08-11','2018-12-01',40),(3,3,'2019-11-03','2019-12-02',20),(4,4,'2019-11-05','2019-12-03',30),(5,5,'2019-11-07','2019-12-04',40),(6,6,'2017-05-13','2017-06-05',60),(7,8,'2019-11-09','2019-12-06',20),(8,10,'2019-11-11','2019-12-07',30),(9,12,'2019-11-13','2019-12-08',30),(10,9,'2018-11-09','2018-12-09',30),(11,15,'2019-11-15','2019-12-10',60),(12,16,'2019-11-17','2019-12-11',90),(13,19,'2019-11-19','2019-12-12',70),(14,15,'2017-05-13','2017-07-13',60),(15,15,'2019-11-21','2019-12-14',30),(16,17,'2018-08-11','2018-11-15',20),(17,2,'2018-08-11','2018-11-16',20),(18,6,'2018-11-09','2018-12-17',20),(19,19,'2019-11-23','2019-12-18',10),(20,4,'2019-11-25','2019-12-19',10),(21,9,'2017-05-13','2017-12-20',20),(22,3,'2019-11-27','2019-12-21',30),(23,15,'2018-08-11','2018-12-22',40),(24,3,'2019-11-29','2019-12-23',40),(25,1,'2019-12-01','2019-12-24',30),(26,15,'2019-12-03','2019-12-25',30),(27,16,'2019-12-05','2019-12-26',20),(28,17,'2017-05-13','2017-06-27',10),(29,19,'2019-12-07','2019-12-28',10),(30,2,'2017-05-13','2017-07-29',50),(31,8,'2019-12-09','2019-12-30',30),(32,3,'2019-12-11','2019-12-31',20),(33,4,'2019-12-13','2020-01-01',40);
/*!40000 ALTER TABLE `Prescription_Medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (1,'occupied'),(2,'vacant'),(3,'vacant'),(4,'vacant'),(5,'occupied'),(6,'occupied'),(7,'vacant'),(8,'vacant'),(9,'vacant'),(10,'vacant'),(11,'vacant'),(12,'vacant'),(13,'vacant'),(14,'occupied'),(15,'occupied'),(16,'occupied'),(17,'vacant'),(18,'vacant'),(19,'occupied'),(20,'vacant'),(21,'vacant'),(22,'vacant'),(23,'vacant'),(24,'occupied'),(25,'vacant'),(26,'occupied'),(27,'occupied'),(28,'vacant'),(29,'vacant'),(30,'vacant'),(31,'vacant'),(32,'vacant'),(33,'occupied'),(34,'vacant'),(35,'vacant'),(36,'vacant'),(37,'vacant'),(38,'vacant'),(39,'vacant'),(40,'occupied'),(41,'vacant'),(42,'vacant'),(43,'vacant'),(44,'occupied'),(45,'occupied'),(46,'vacant'),(47,'occupied'),(48,'occupied'),(49,'vacant'),(50,'vacant'),(51,'vacant'),(52,'vacant'),(53,'vacant'),(54,'occupied'),(55,'vacant'),(56,'vacant'),(57,'vacant'),(58,'occupied'),(59,'vacant'),(60,'vacant'),(61,'vacant'),(62,'occupied'),(63,'vacant'),(64,'vacant'),(65,'occupied'),(66,'vacant'),(67,'vacant'),(68,'vacant'),(69,'vacant'),(70,'vacant'),(71,'vacant'),(72,'vacant'),(73,'vacant'),(74,'vacant');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visit`
--

DROP TABLE IF EXISTS `Visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visit` (
  `visit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) unsigned NOT NULL,
  `doctor_id` int(10) unsigned NOT NULL,
  `visit_date` date NOT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `fk_Doctor_has_Patient_Patient1_idx` (`patient_id`),
  KEY `fk_Doctor_has_Patient_Doctor_idx` (`doctor_id`),
  CONSTRAINT `fk_Doctor_has_Patient_Doctor` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_has_Patient_Patient1` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visit`
--

LOCK TABLES `Visit` WRITE;
/*!40000 ALTER TABLE `Visit` DISABLE KEYS */;
INSERT INTO `Visit` VALUES (1,1,1,'2019-11-01'),(2,2,1,'2018-08-11'),(3,3,2,'2019-11-03'),(4,4,3,'2019-11-05'),(5,5,4,'2019-11-07'),(6,6,1,'2018-11-09'),(7,7,2,'2017-05-13'),(8,8,3,'2018-08-11'),(9,9,4,'2018-08-11'),(10,10,5,'2019-11-09'),(11,11,6,'2019-11-11'),(12,12,7,'2019-11-13'),(13,13,8,'2018-11-09'),(14,14,9,'2019-11-15'),(15,15,10,'2019-11-17'),(16,16,11,'2019-11-19'),(17,17,12,'2017-05-13'),(18,18,13,'2018-08-11'),(19,19,14,'2018-08-11'),(20,20,15,'2018-11-09'),(21,21,11,'2017-05-13'),(22,22,12,'2019-11-21'),(23,23,13,'2018-08-11'),(24,24,14,'2018-08-11'),(25,25,15,'2018-11-09'),(26,26,12,'2017-05-13'),(27,27,1,'2018-08-11'),(28,28,2,'2018-08-11'),(29,29,3,'2018-11-09'),(30,30,4,'2019-11-23'),(31,31,5,'2019-11-25'),(32,32,6,'2017-05-13'),(33,33,7,'2019-11-27'),(34,34,8,'2020-01-18'),(35,35,9,'2019-11-29'),(36,36,10,'2019-12-01'),(37,37,11,'2018-08-11'),(38,38,12,'2020-01-22'),(39,39,13,'2019-12-03'),(40,40,14,'2019-12-05'),(41,41,15,'2020-01-26'),(42,42,1,'2020-01-28'),(43,43,2,'2020-01-30'),(44,44,3,'2020-02-01'),(45,45,4,'2019-12-07'),(46,46,5,'2020-02-05'),(47,47,6,'2019-12-09'),(48,48,7,'2019-12-11'),(49,49,8,'2018-08-11'),(50,50,9,'2018-08-11'),(51,51,10,'2019-12-13'),(52,12,7,'2019-12-15'),(53,12,7,'2019-12-31'),(54,12,7,'2020-01-14'),(55,12,7,'2020-02-03'),(56,30,4,'2019-12-17'),(57,30,4,'2020-01-04'),(58,30,4,'2020-01-12'),(59,30,4,'2020-02-07');
/*!40000 ALTER TABLE `Visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-02 20:27:22
