/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : zencart

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-05-20 09:13:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zen_address_book`
-- ----------------------------
DROP TABLE IF EXISTS `zen_address_book`;
CREATE TABLE `zen_address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) NOT NULL DEFAULT '',
  `entry_company` varchar(64) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL DEFAULT '',
  `entry_city` varchar(32) NOT NULL DEFAULT '',
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_address_book
-- ----------------------------
INSERT INTO `zen_address_book` VALUES ('1', '1', 'm', 'JustaDemo', 'Bill', 'Smith', '123 Any Avenue', '', '12345', 'Here', '', '223', '12');

-- ----------------------------
-- Table structure for `zen_address_format`
-- ----------------------------
DROP TABLE IF EXISTS `zen_address_format`;
CREATE TABLE `zen_address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL DEFAULT '',
  `address_summary` varchar(48) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_format_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_address_format
-- ----------------------------
INSERT INTO `zen_address_format` VALUES ('1', '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country');
INSERT INTO `zen_address_format` VALUES ('2', '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country');
INSERT INTO `zen_address_format` VALUES ('3', '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country');
INSERT INTO `zen_address_format` VALUES ('4', '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
INSERT INTO `zen_address_format` VALUES ('5', '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');
INSERT INTO `zen_address_format` VALUES ('6', '$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country', '$postcode / $country');

-- ----------------------------
-- Table structure for `zen_admin`
-- ----------------------------
DROP TABLE IF EXISTS `zen_admin`;
CREATE TABLE `zen_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) NOT NULL DEFAULT '',
  `admin_email` varchar(96) NOT NULL DEFAULT '',
  `admin_profile` int(11) NOT NULL DEFAULT '0',
  `admin_pass` varchar(40) NOT NULL DEFAULT '',
  `prev_pass1` varchar(40) NOT NULL DEFAULT '',
  `prev_pass2` varchar(40) NOT NULL DEFAULT '',
  `prev_pass3` varchar(40) NOT NULL DEFAULT '',
  `pwd_last_change_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset_token` varchar(60) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_ip` varchar(45) NOT NULL DEFAULT '',
  `failed_logins` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lockout_expires` int(11) NOT NULL DEFAULT '0',
  `last_failed_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_failed_ip` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`),
  KEY `idx_admin_name_zen` (`admin_name`),
  KEY `idx_admin_email_zen` (`admin_email`),
  KEY `idx_admin_profile_zen` (`admin_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_admin
-- ----------------------------
INSERT INTO `zen_admin` VALUES ('1', 'admin@admin.com', 'admin@admin.com', '1', 'b8a744a40f011f2722595d1aaf94aab9:e7', '', '', '', '0000-00-00 00:00:00', '1369291981}67bdc277ccbc2c337c0acf294d458802:4c', '2013-05-20 08:49:13', '0000-00-00 00:00:00', '', '0', '0', '0000-00-00 00:00:00', '');

-- ----------------------------
-- Table structure for `zen_admin_activity_log`
-- ----------------------------
DROP TABLE IF EXISTS `zen_admin_activity_log`;
CREATE TABLE `zen_admin_activity_log` (
  `log_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) NOT NULL DEFAULT '',
  `page_parameters` text,
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `flagged` tinyint(4) NOT NULL DEFAULT '0',
  `attention` varchar(255) NOT NULL DEFAULT '',
  `gzpost` mediumblob,
  PRIMARY KEY (`log_id`),
  KEY `idx_page_accessed_zen` (`page_accessed`),
  KEY `idx_access_date_zen` (`access_date`),
  KEY `idx_flagged_zen` (`flagged`),
  KEY `idx_ip_zen` (`ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_admin_activity_log
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_admin_menus`
-- ----------------------------
DROP TABLE IF EXISTS `zen_admin_menus`;
CREATE TABLE `zen_admin_menus` (
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `menu_key` (`menu_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_admin_menus
-- ----------------------------
INSERT INTO `zen_admin_menus` VALUES ('configuration', 'BOX_HEADING_CONFIGURATION', '1');
INSERT INTO `zen_admin_menus` VALUES ('catalog', 'BOX_HEADING_CATALOG', '2');
INSERT INTO `zen_admin_menus` VALUES ('modules', 'BOX_HEADING_MODULES', '3');
INSERT INTO `zen_admin_menus` VALUES ('customers', 'BOX_HEADING_CUSTOMERS', '4');
INSERT INTO `zen_admin_menus` VALUES ('taxes', 'BOX_HEADING_LOCATION_AND_TAXES', '5');
INSERT INTO `zen_admin_menus` VALUES ('localization', 'BOX_HEADING_LOCALIZATION', '6');
INSERT INTO `zen_admin_menus` VALUES ('reports', 'BOX_HEADING_REPORTS', '7');
INSERT INTO `zen_admin_menus` VALUES ('tools', 'BOX_HEADING_TOOLS', '8');
INSERT INTO `zen_admin_menus` VALUES ('gv', 'BOX_HEADING_GV_ADMIN', '9');
INSERT INTO `zen_admin_menus` VALUES ('access', 'BOX_HEADING_ADMIN_ACCESS', '10');
INSERT INTO `zen_admin_menus` VALUES ('extras', 'BOX_HEADING_EXTRAS', '11');

-- ----------------------------
-- Table structure for `zen_admin_pages`
-- ----------------------------
DROP TABLE IF EXISTS `zen_admin_pages`;
CREATE TABLE `zen_admin_pages` (
  `page_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `main_page` varchar(64) NOT NULL DEFAULT '',
  `page_params` varchar(64) NOT NULL DEFAULT '',
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `display_on_menu` char(1) NOT NULL DEFAULT 'N',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_admin_pages
-- ----------------------------
INSERT INTO `zen_admin_pages` VALUES ('configMyStore', 'BOX_CONFIGURATION_MY_STORE', 'FILENAME_CONFIGURATION', 'gID=1', 'configuration', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('configMinimumValues', 'BOX_CONFIGURATION_MINIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=2', 'configuration', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('configMaximumValues', 'BOX_CONFIGURATION_MAXIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=3', 'configuration', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('configImages', 'BOX_CONFIGURATION_IMAGES', 'FILENAME_CONFIGURATION', 'gID=4', 'configuration', 'Y', '4');
INSERT INTO `zen_admin_pages` VALUES ('configCustomerDetails', 'BOX_CONFIGURATION_CUSTOMER_DETAILS', 'FILENAME_CONFIGURATION', 'gID=5', 'configuration', 'Y', '5');
INSERT INTO `zen_admin_pages` VALUES ('configShipping', 'BOX_CONFIGURATION_SHIPPING_PACKAGING', 'FILENAME_CONFIGURATION', 'gID=7', 'configuration', 'Y', '6');
INSERT INTO `zen_admin_pages` VALUES ('configProductListing', 'BOX_CONFIGURATION_PRODUCT_LISTING', 'FILENAME_CONFIGURATION', 'gID=8', 'configuration', 'Y', '7');
INSERT INTO `zen_admin_pages` VALUES ('configStock', 'BOX_CONFIGURATION_STOCK', 'FILENAME_CONFIGURATION', 'gID=9', 'configuration', 'Y', '8');
INSERT INTO `zen_admin_pages` VALUES ('configLogging', 'BOX_CONFIGURATION_LOGGING', 'FILENAME_CONFIGURATION', 'gID=10', 'configuration', 'Y', '9');
INSERT INTO `zen_admin_pages` VALUES ('configEmail', 'BOX_CONFIGURATION_EMAIL_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=12', 'configuration', 'Y', '10');
INSERT INTO `zen_admin_pages` VALUES ('configAttributes', 'BOX_CONFIGURATION_ATTRIBUTE_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=13', 'configuration', 'Y', '11');
INSERT INTO `zen_admin_pages` VALUES ('configGzipCompression', 'BOX_CONFIGURATION_GZIP_COMPRESSION', 'FILENAME_CONFIGURATION', 'gID=14', 'configuration', 'Y', '12');
INSERT INTO `zen_admin_pages` VALUES ('configSessions', 'BOX_CONFIGURATION_SESSIONS', 'FILENAME_CONFIGURATION', 'gID=15', 'configuration', 'Y', '13');
INSERT INTO `zen_admin_pages` VALUES ('configRegulations', 'BOX_CONFIGURATION_REGULATIONS', 'FILENAME_CONFIGURATION', 'gID=11', 'configuration', 'Y', '14');
INSERT INTO `zen_admin_pages` VALUES ('configGvCoupons', 'BOX_CONFIGURATION_GV_COUPONS', 'FILENAME_CONFIGURATION', 'gID=16', 'configuration', 'Y', '15');
INSERT INTO `zen_admin_pages` VALUES ('configCreditCards', 'BOX_CONFIGURATION_CREDIT_CARDS', 'FILENAME_CONFIGURATION', 'gID=17', 'configuration', 'Y', '16');
INSERT INTO `zen_admin_pages` VALUES ('configProductInfo', 'BOX_CONFIGURATION_PRODUCT_INFO', 'FILENAME_CONFIGURATION', 'gID=18', 'configuration', 'Y', '17');
INSERT INTO `zen_admin_pages` VALUES ('configLayoutSettings', 'BOX_CONFIGURATION_LAYOUT_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=19', 'configuration', 'Y', '18');
INSERT INTO `zen_admin_pages` VALUES ('configWebsiteMaintenance', 'BOX_CONFIGURATION_WEBSITE_MAINTENANCE', 'FILENAME_CONFIGURATION', 'gID=20', 'configuration', 'Y', '19');
INSERT INTO `zen_admin_pages` VALUES ('configNewListing', 'BOX_CONFIGURATION_NEW_LISTING', 'FILENAME_CONFIGURATION', 'gID=21', 'configuration', 'Y', '20');
INSERT INTO `zen_admin_pages` VALUES ('configFeaturedListing', 'BOX_CONFIGURATION_FEATURED_LISTING', 'FILENAME_CONFIGURATION', 'gID=22', 'configuration', 'Y', '21');
INSERT INTO `zen_admin_pages` VALUES ('configAllListing', 'BOX_CONFIGURATION_ALL_LISTING', 'FILENAME_CONFIGURATION', 'gID=23', 'configuration', 'Y', '22');
INSERT INTO `zen_admin_pages` VALUES ('configIndexListing', 'BOX_CONFIGURATION_INDEX_LISTING', 'FILENAME_CONFIGURATION', 'gID=24', 'configuration', 'Y', '23');
INSERT INTO `zen_admin_pages` VALUES ('configDefinePageStatus', 'BOX_CONFIGURATION_DEFINE_PAGE_STATUS', 'FILENAME_CONFIGURATION', 'gID=25', 'configuration', 'Y', '24');
INSERT INTO `zen_admin_pages` VALUES ('configEzPagesSettings', 'BOX_CONFIGURATION_EZPAGES_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=30', 'configuration', 'Y', '25');
INSERT INTO `zen_admin_pages` VALUES ('categories', 'BOX_CATALOG_CATEGORIES_PRODUCTS', 'FILENAME_CATEGORIES', '', 'catalog', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('productTypes', 'BOX_CATALOG_PRODUCT_TYPES', 'FILENAME_PRODUCT_TYPES', '', 'catalog', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('priceManager', 'BOX_CATALOG_PRODUCTS_PRICE_MANAGER', 'FILENAME_PRODUCTS_PRICE_MANAGER', '', 'catalog', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('optionNames', 'BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER', 'FILENAME_OPTIONS_NAME_MANAGER', '', 'catalog', 'Y', '4');
INSERT INTO `zen_admin_pages` VALUES ('optionValues', 'BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER', 'FILENAME_OPTIONS_VALUES_MANAGER', '', 'catalog', 'Y', '5');
INSERT INTO `zen_admin_pages` VALUES ('attributes', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER', 'FILENAME_ATTRIBUTES_CONTROLLER', '', 'catalog', 'Y', '6');
INSERT INTO `zen_admin_pages` VALUES ('downloads', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER', 'FILENAME_DOWNLOADS_MANAGER', '', 'catalog', 'Y', '7');
INSERT INTO `zen_admin_pages` VALUES ('optionNameSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_NAME', 'FILENAME_PRODUCTS_OPTIONS_NAME', '', 'catalog', 'Y', '8');
INSERT INTO `zen_admin_pages` VALUES ('optionValueSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_VALUES', 'FILENAME_PRODUCTS_OPTIONS_VALUES', '', 'catalog', 'Y', '9');
INSERT INTO `zen_admin_pages` VALUES ('manufacturers', 'BOX_CATALOG_MANUFACTURERS', 'FILENAME_MANUFACTURERS', '', 'catalog', 'Y', '10');
INSERT INTO `zen_admin_pages` VALUES ('reviews', 'BOX_CATALOG_REVIEWS', 'FILENAME_REVIEWS', '', 'catalog', 'Y', '11');
INSERT INTO `zen_admin_pages` VALUES ('specials', 'BOX_CATALOG_SPECIALS', 'FILENAME_SPECIALS', '', 'catalog', 'Y', '12');
INSERT INTO `zen_admin_pages` VALUES ('featured', 'BOX_CATALOG_FEATURED', 'FILENAME_FEATURED', '', 'catalog', 'Y', '13');
INSERT INTO `zen_admin_pages` VALUES ('salemaker', 'BOX_CATALOG_SALEMAKER', 'FILENAME_SALEMAKER', '', 'catalog', 'Y', '14');
INSERT INTO `zen_admin_pages` VALUES ('productsExpected', 'BOX_CATALOG_PRODUCTS_EXPECTED', 'FILENAME_PRODUCTS_EXPECTED', '', 'catalog', 'Y', '15');
INSERT INTO `zen_admin_pages` VALUES ('product', 'BOX_CATALOG_PRODUCT', 'FILENAME_PRODUCT', '', 'catalog', 'N', '16');
INSERT INTO `zen_admin_pages` VALUES ('productsToCategories', 'BOX_CATALOG_PRODUCTS_TO_CATEGORIES', 'FILENAME_PRODUCTS_TO_CATEGORIES', '', 'catalog', 'N', '17');
INSERT INTO `zen_admin_pages` VALUES ('payment', 'BOX_MODULES_PAYMENT', 'FILENAME_MODULES', 'set=payment', 'modules', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('shipping', 'BOX_MODULES_SHIPPING', 'FILENAME_MODULES', 'set=shipping', 'modules', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('orderTotal', 'BOX_MODULES_ORDER_TOTAL', 'FILENAME_MODULES', 'set=ordertotal', 'modules', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('customers', 'BOX_CUSTOMERS_CUSTOMERS', 'FILENAME_CUSTOMERS', '', 'customers', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('orders', 'BOX_CUSTOMERS_ORDERS', 'FILENAME_ORDERS', '', 'customers', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('groupPricing', 'BOX_CUSTOMERS_GROUP_PRICING', 'FILENAME_GROUP_PRICING', '', 'customers', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('paypal', 'BOX_CUSTOMERS_PAYPAL', 'FILENAME_PAYPAL', '', 'customers', 'Y', '4');
INSERT INTO `zen_admin_pages` VALUES ('invoice', 'BOX_CUSTOMERS_INVOICE', 'FILENAME_ORDERS_INVOICE', '', 'customers', 'N', '5');
INSERT INTO `zen_admin_pages` VALUES ('packingslip', 'BOX_CUSTOMERS_PACKING_SLIP', 'FILENAME_ORDERS_PACKINGSLIP', '', 'customers', 'N', '6');
INSERT INTO `zen_admin_pages` VALUES ('linkpointReview', 'BOX_CUSTOMERS_LINKPOINT_REVIEW', 'FILENAME_LINKPOINT_REVIEW', '', 'customers', 'Y', '7');
INSERT INTO `zen_admin_pages` VALUES ('countries', 'BOX_TAXES_COUNTRIES', 'FILENAME_COUNTRIES', '', 'taxes', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('zones', 'BOX_TAXES_ZONES', 'FILENAME_ZONES', '', 'taxes', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('geoZones', 'BOX_TAXES_GEO_ZONES', 'FILENAME_GEO_ZONES', '', 'taxes', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('taxClasses', 'BOX_TAXES_TAX_CLASSES', 'FILENAME_TAX_CLASSES', '', 'taxes', 'Y', '4');
INSERT INTO `zen_admin_pages` VALUES ('taxRates', 'BOX_TAXES_TAX_RATES', 'FILENAME_TAX_RATES', '', 'taxes', 'Y', '5');
INSERT INTO `zen_admin_pages` VALUES ('currencies', 'BOX_LOCALIZATION_CURRENCIES', 'FILENAME_CURRENCIES', '', 'localization', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('languages', 'BOX_LOCALIZATION_LANGUAGES', 'FILENAME_LANGUAGES', '', 'localization', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('ordersStatus', 'BOX_LOCALIZATION_ORDERS_STATUS', 'FILENAME_ORDERS_STATUS', '', 'localization', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('reportCustomers', 'BOX_REPORTS_ORDERS_TOTAL', 'FILENAME_STATS_CUSTOMERS', '', 'reports', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('reportReferrals', 'BOX_REPORTS_CUSTOMERS_REFERRALS', 'FILENAME_STATS_CUSTOMERS_REFERRALS', '', 'reports', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('reportLowStock', 'BOX_REPORTS_PRODUCTS_LOWSTOCK', 'FILENAME_STATS_PRODUCTS_LOWSTOCK', '', 'reports', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('reportProductsSold', 'BOX_REPORTS_PRODUCTS_PURCHASED', 'FILENAME_STATS_PRODUCTS_PURCHASED', '', 'reports', 'Y', '4');
INSERT INTO `zen_admin_pages` VALUES ('reportProductsViewed', 'BOX_REPORTS_PRODUCTS_VIEWED', 'FILENAME_STATS_PRODUCTS_VIEWED', '', 'reports', 'Y', '5');
INSERT INTO `zen_admin_pages` VALUES ('templateSelect', 'BOX_TOOLS_TEMPLATE_SELECT', 'FILENAME_TEMPLATE_SELECT', '', 'tools', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('layoutController', 'BOX_TOOLS_LAYOUT_CONTROLLER', 'FILENAME_LAYOUT_CONTROLLER', '', 'tools', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('banners', 'BOX_TOOLS_BANNER_MANAGER', 'FILENAME_BANNER_MANAGER', '', 'tools', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('mail', 'BOX_TOOLS_MAIL', 'FILENAME_MAIL', '', 'tools', 'Y', '4');
INSERT INTO `zen_admin_pages` VALUES ('newsletters', 'BOX_TOOLS_NEWSLETTER_MANAGER', 'FILENAME_NEWSLETTERS', '', 'tools', 'Y', '5');
INSERT INTO `zen_admin_pages` VALUES ('server', 'BOX_TOOLS_SERVER_INFO', 'FILENAME_SERVER_INFO', '', 'tools', 'Y', '6');
INSERT INTO `zen_admin_pages` VALUES ('whosOnline', 'BOX_TOOLS_WHOS_ONLINE', 'FILENAME_WHOS_ONLINE', '', 'tools', 'Y', '7');
INSERT INTO `zen_admin_pages` VALUES ('storeManager', 'BOX_TOOLS_STORE_MANAGER', 'FILENAME_STORE_MANAGER', '', 'tools', 'Y', '9');
INSERT INTO `zen_admin_pages` VALUES ('developersToolKit', 'BOX_TOOLS_DEVELOPERS_TOOL_KIT', 'FILENAME_DEVELOPERS_TOOL_KIT', '', 'tools', 'Y', '10');
INSERT INTO `zen_admin_pages` VALUES ('ezpages', 'BOX_TOOLS_EZPAGES', 'FILENAME_EZPAGES_ADMIN', '', 'tools', 'Y', '11');
INSERT INTO `zen_admin_pages` VALUES ('definePagesEditor', 'BOX_TOOLS_DEFINE_PAGES_EDITOR', 'FILENAME_DEFINE_PAGES_EDITOR', '', 'tools', 'Y', '12');
INSERT INTO `zen_admin_pages` VALUES ('sqlPatch', 'BOX_TOOLS_SQLPATCH', 'FILENAME_SQLPATCH', '', 'tools', 'Y', '13');
INSERT INTO `zen_admin_pages` VALUES ('couponAdmin', 'BOX_COUPON_ADMIN', 'FILENAME_COUPON_ADMIN', '', 'gv', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('couponRestrict', 'BOX_COUPON_RESTRICT', 'FILENAME_COUPON_RESTRICT', '', 'gv', 'N', '1');
INSERT INTO `zen_admin_pages` VALUES ('gvQueue', 'BOX_GV_ADMIN_QUEUE', 'FILENAME_GV_QUEUE', '', 'gv', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('gvMail', 'BOX_GV_ADMIN_MAIL', 'FILENAME_GV_MAIL', '', 'gv', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('gvSent', 'BOX_GV_ADMIN_SENT', 'FILENAME_GV_SENT', '', 'gv', 'Y', '4');
INSERT INTO `zen_admin_pages` VALUES ('profiles', 'BOX_ADMIN_ACCESS_PROFILES', 'FILENAME_PROFILES', '', 'access', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('users', 'BOX_ADMIN_ACCESS_USERS', 'FILENAME_USERS', '', 'access', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('pageRegistration', 'BOX_ADMIN_ACCESS_PAGE_REGISTRATION', 'FILENAME_ADMIN_PAGE_REGISTRATION', '', 'access', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('adminlogs', 'BOX_ADMIN_ACCESS_LOGS', 'FILENAME_ADMIN_ACTIVITY', '', 'access', 'Y', '4');
INSERT INTO `zen_admin_pages` VALUES ('recordArtists', 'BOX_CATALOG_RECORD_ARTISTS', 'FILENAME_RECORD_ARTISTS', '', 'extras', 'Y', '1');
INSERT INTO `zen_admin_pages` VALUES ('recordCompanies', 'BOX_CATALOG_RECORD_COMPANY', 'FILENAME_RECORD_COMPANY', '', 'extras', 'Y', '2');
INSERT INTO `zen_admin_pages` VALUES ('musicGenre', 'BOX_CATALOG_MUSIC_GENRE', 'FILENAME_MUSIC_GENRE', '', 'extras', 'Y', '3');
INSERT INTO `zen_admin_pages` VALUES ('mediaManager', 'BOX_CATALOG_MEDIA_MANAGER', 'FILENAME_MEDIA_MANAGER', '', 'extras', 'Y', '4');
INSERT INTO `zen_admin_pages` VALUES ('mediaTypes', 'BOX_CATALOG_MEDIA_TYPES', 'FILENAME_MEDIA_TYPES', '', 'extras', 'Y', '5');

-- ----------------------------
-- Table structure for `zen_admin_pages_to_profiles`
-- ----------------------------
DROP TABLE IF EXISTS `zen_admin_pages_to_profiles`;
CREATE TABLE `zen_admin_pages_to_profiles` (
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `page_key` varchar(32) NOT NULL DEFAULT '',
  UNIQUE KEY `profile_page` (`profile_id`,`page_key`),
  UNIQUE KEY `page_profile` (`page_key`,`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_admin_pages_to_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_admin_profiles`
-- ----------------------------
DROP TABLE IF EXISTS `zen_admin_profiles`;
CREATE TABLE `zen_admin_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_admin_profiles
-- ----------------------------
INSERT INTO `zen_admin_profiles` VALUES ('1', 'Superuser');

-- ----------------------------
-- Table structure for `zen_authorizenet`
-- ----------------------------
DROP TABLE IF EXISTS `zen_authorizenet`;
CREATE TABLE `zen_authorizenet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) NOT NULL DEFAULT '',
  `authorization_type` varchar(50) NOT NULL DEFAULT '',
  `transaction_id` bigint(20) DEFAULT NULL,
  `sent` longtext NOT NULL,
  `received` longtext NOT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_authorizenet
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_banners`
-- ----------------------------
DROP TABLE IF EXISTS `zen_banners`;
CREATE TABLE `zen_banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL DEFAULT '',
  `banners_url` varchar(255) NOT NULL DEFAULT '',
  `banners_image` varchar(64) NOT NULL DEFAULT '',
  `banners_group` varchar(15) NOT NULL DEFAULT '',
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banners_id`),
  KEY `idx_status_group_zen` (`status`,`banners_group`),
  KEY `idx_expires_date_zen` (`expires_date`),
  KEY `idx_date_scheduled_zen` (`date_scheduled`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_banners
-- ----------------------------
INSERT INTO `zen_banners` VALUES ('1', 'Zen Cart', 'http://www.zen-cart.com', 'banners/zencart_468_60_02.gif', 'Wide-Banners', '', '0', null, null, '2004-01-11 20:59:12', null, '1', '1', '1', '0');
INSERT INTO `zen_banners` VALUES ('2', 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125zen_logo.gif', 'SideBox-Banners', '', '0', null, null, '2004-01-11 20:59:12', null, '1', '1', '1', '0');
INSERT INTO `zen_banners` VALUES ('3', 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125x125_zen_logo.gif', 'SideBox-Banners', '', '0', null, null, '2004-01-11 20:59:12', null, '1', '1', '1', '0');
INSERT INTO `zen_banners` VALUES ('4', 'if you have to think ... you haven\'t been Zenned!', 'http://www.zen-cart.com', 'banners/think_anim.gif', 'Wide-Banners', '', '0', null, null, '2004-01-12 20:53:18', null, '1', '1', '1', '0');
INSERT INTO `zen_banners` VALUES ('5', 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/bw_zen_88wide.gif', 'BannersAll', '', '0', null, null, '2005-05-13 10:54:38', null, '1', '1', '1', '10');
INSERT INTO `zen_banners` VALUES ('6', 'Start Accepting Credit Cards For Your Business Today!', 'http://www.zen-cart.com/partners/payment', 'banners/cardsvcs_468x60.gif', 'Wide-Banners', '', '0', null, null, '2006-03-13 11:02:43', null, '1', '1', '1', '0');
INSERT INTO `zen_banners` VALUES ('7', 'eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/big-book-ad.gif', 'Wide-Banners', '', '0', null, null, '2007-02-10 00:00:00', null, '1', '1', '1', '1');
INSERT INTO `zen_banners` VALUES ('8', 'eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/tall-book.gif', 'SideBox-Banners', '', '0', null, null, '2007-02-10 00:00:00', null, '1', '1', '1', '1');
INSERT INTO `zen_banners` VALUES ('9', 'eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/tall-book.gif', 'BannersAll', '', '0', null, null, '2007-02-10 00:00:00', null, '1', '1', '1', '15');

-- ----------------------------
-- Table structure for `zen_banners_history`
-- ----------------------------
DROP TABLE IF EXISTS `zen_banners_history`;
CREATE TABLE `zen_banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_id_zen` (`banners_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_banners_history
-- ----------------------------
INSERT INTO `zen_banners_history` VALUES ('1', '8', '1', '0', '2013-05-20 09:09:08');
INSERT INTO `zen_banners_history` VALUES ('2', '5', '1', '0', '2013-05-20 09:09:08');
INSERT INTO `zen_banners_history` VALUES ('3', '9', '1', '0', '2013-05-20 09:09:08');
INSERT INTO `zen_banners_history` VALUES ('4', '8', '1', '0', '2013-05-20 09:09:08');
INSERT INTO `zen_banners_history` VALUES ('5', '7', '1', '0', '2013-05-20 09:09:08');

-- ----------------------------
-- Table structure for `zen_categories`
-- ----------------------------
DROP TABLE IF EXISTS `zen_categories`;
CREATE TABLE `zen_categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(64) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categories_id`),
  KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`),
  KEY `idx_status_zen` (`categories_status`),
  KEY `idx_sort_order_zen` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_categories
-- ----------------------------
INSERT INTO `zen_categories` VALUES ('1', 'categories/category_hardware.gif', '0', '1', '2003-12-23 03:18:19', '2004-05-21 00:32:17', '1');
INSERT INTO `zen_categories` VALUES ('2', 'categories/category_software.gif', '0', '2', '2003-12-23 03:18:19', '2004-05-22 21:14:57', '1');
INSERT INTO `zen_categories` VALUES ('3', 'categories/category_dvd_movies.gif', '0', '3', '2003-12-23 03:18:19', '2004-05-21 00:22:39', '1');
INSERT INTO `zen_categories` VALUES ('4', 'categories/subcategory_graphic_cards.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('5', 'categories/subcategory_printers.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('6', 'categories/subcategory_monitors.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('7', 'categories/subcategory_speakers.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('8', 'categories/subcategory_keyboards.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('9', 'categories/subcategory_mice.gif', '1', '0', '2003-12-23 03:18:19', '2004-05-21 00:34:10', '1');
INSERT INTO `zen_categories` VALUES ('10', 'categories/subcategory_action.gif', '3', '0', '2003-12-23 03:18:19', '2004-05-21 00:39:17', '1');
INSERT INTO `zen_categories` VALUES ('11', 'categories/subcategory_science_fiction.gif', '3', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('12', 'categories/subcategory_comedy.gif', '3', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('13', 'categories/subcategory_cartoons.gif', '3', '0', '2003-12-23 03:18:19', '2004-05-21 00:23:13', '1');
INSERT INTO `zen_categories` VALUES ('14', 'categories/subcategory_thriller.gif', '3', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('15', 'categories/subcategory_drama.gif', '3', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('16', 'categories/subcategory_memory.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('17', 'categories/subcategory_cdrom_drives.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('18', 'categories/subcategory_simulation.gif', '2', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('19', 'categories/subcategory_action_games.gif', '2', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('20', 'categories/subcategory_strategy.gif', '2', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `zen_categories` VALUES ('21', 'categories/gv_25.gif', '0', '4', '2003-12-23 03:18:19', '2004-05-21 00:26:06', '1');
INSERT INTO `zen_categories` VALUES ('22', 'categories/box_of_color.gif', '0', '5', '2003-12-23 03:18:19', '2004-05-21 00:28:43', '1');
INSERT INTO `zen_categories` VALUES ('23', 'waybkgnd.gif', '0', '500', '2003-12-28 02:26:19', '2003-12-29 23:21:35', '1');
INSERT INTO `zen_categories` VALUES ('24', 'categories/category_free.gif', '0', '600', '2003-12-28 11:48:46', '2004-01-02 19:13:45', '1');
INSERT INTO `zen_categories` VALUES ('25', 'sample_image.gif', '0', '515', '2003-12-31 02:39:17', '2004-01-24 01:49:12', '1');
INSERT INTO `zen_categories` VALUES ('27', 'sample_image.gif', '49', '10', '2004-01-04 14:13:08', '2004-01-24 16:16:23', '1');
INSERT INTO `zen_categories` VALUES ('28', 'sample_image.gif', '0', '510', '2004-01-04 17:13:47', '2004-01-05 23:54:23', '1');
INSERT INTO `zen_categories` VALUES ('31', 'sample_image.gif', '48', '30', '2004-01-04 23:16:46', '2004-01-24 01:48:29', '1');
INSERT INTO `zen_categories` VALUES ('32', 'sample_image.gif', '48', '40', '2004-01-05 01:34:56', '2004-01-24 01:48:36', '1');
INSERT INTO `zen_categories` VALUES ('33', 'categories/subcategory.gif', '0', '700', '2004-01-05 02:08:31', '2004-05-20 10:35:31', '1');
INSERT INTO `zen_categories` VALUES ('34', 'categories/subcategory.gif', '33', '10', '2004-01-05 02:08:50', '2004-05-20 10:35:57', '1');
INSERT INTO `zen_categories` VALUES ('35', 'categories/subcategory.gif', '33', '20', '2004-01-05 02:09:01', '2004-01-24 00:07:33', '1');
INSERT INTO `zen_categories` VALUES ('36', 'categories/subcategory.gif', '33', '30', '2004-01-05 02:09:12', '2004-01-24 00:07:41', '1');
INSERT INTO `zen_categories` VALUES ('37', 'categories/subcategory.gif', '35', '10', '2004-01-05 02:09:28', '2004-01-24 00:22:39', '1');
INSERT INTO `zen_categories` VALUES ('38', 'categories/subcategory.gif', '35', '20', '2004-01-05 02:09:39', '2004-01-24 00:22:46', '1');
INSERT INTO `zen_categories` VALUES ('39', 'categories/subcategory.gif', '35', '30', '2004-01-05 02:09:49', '2004-01-24 00:22:53', '1');
INSERT INTO `zen_categories` VALUES ('40', 'categories/subcategory.gif', '34', '10', '2004-01-05 02:17:27', '2004-05-20 10:36:19', '1');
INSERT INTO `zen_categories` VALUES ('41', 'categories/subcategory.gif', '36', '10', '2004-01-05 02:21:02', '2004-01-24 00:23:04', '1');
INSERT INTO `zen_categories` VALUES ('42', 'categories/subcategory.gif', '36', '30', '2004-01-05 02:21:14', '2004-01-24 00:23:18', '1');
INSERT INTO `zen_categories` VALUES ('43', 'categories/subcategory.gif', '34', '20', '2004-01-05 02:21:29', '2004-01-24 00:21:37', '1');
INSERT INTO `zen_categories` VALUES ('44', 'categories/subcategory.gif', '36', '20', '2004-01-05 02:21:47', '2004-01-24 00:23:11', '1');
INSERT INTO `zen_categories` VALUES ('45', 'sample_image.gif', '48', '10', '2004-01-05 23:54:56', '2004-01-24 01:48:22', '1');
INSERT INTO `zen_categories` VALUES ('46', 'sample_image.gif', '50', '10', '2004-01-06 00:01:48', '2004-01-24 01:39:56', '1');
INSERT INTO `zen_categories` VALUES ('47', 'sample_image.gif', '48', '20', '2004-01-06 03:09:57', '2004-01-24 01:48:05', '1');
INSERT INTO `zen_categories` VALUES ('48', 'sample_image.gif', '0', '1000', '2004-01-07 02:24:07', '2004-01-07 02:44:26', '1');
INSERT INTO `zen_categories` VALUES ('49', 'sample_image.gif', '0', '1100', '2004-01-07 02:27:31', '2004-01-07 02:44:34', '1');
INSERT INTO `zen_categories` VALUES ('50', 'sample_image.gif', '0', '1200', '2004-01-07 02:28:18', '2004-01-07 02:47:19', '1');
INSERT INTO `zen_categories` VALUES ('51', 'sample_image.gif', '50', '20', '2004-01-07 02:33:55', '2004-01-24 01:40:05', '1');
INSERT INTO `zen_categories` VALUES ('52', 'sample_image.gif', '49', '20', '2004-01-24 16:09:35', '2004-01-24 16:16:33', '1');
INSERT INTO `zen_categories` VALUES ('53', 'categories/subcategory.gif', '0', '1500', '2004-04-25 23:07:41', null, '1');
INSERT INTO `zen_categories` VALUES ('54', 'categories/subcategory.gif', '0', '1510', '2004-04-26 12:02:35', '2004-05-20 11:45:20', '1');
INSERT INTO `zen_categories` VALUES ('55', 'categories/subcategory.gif', '54', '0', '2004-04-28 01:48:47', '2004-05-20 11:45:51', '1');
INSERT INTO `zen_categories` VALUES ('56', 'categories/subcategory.gif', '54', '0', '2004-04-28 01:49:16', '2004-04-28 01:53:14', '1');
INSERT INTO `zen_categories` VALUES ('57', 'categories/subcategory.gif', '54', '0', '2004-05-01 01:29:13', null, '1');
INSERT INTO `zen_categories` VALUES ('58', 'categories/subcategory.gif', '54', '110', '2004-05-02 12:35:02', '2004-05-18 10:46:13', '1');
INSERT INTO `zen_categories` VALUES ('60', 'categories/subcategory.gif', '54', '0', '2004-05-02 23:45:21', null, '1');
INSERT INTO `zen_categories` VALUES ('61', 'categories/subcategory.gif', '54', '100', '2004-05-18 10:13:46', '2004-05-18 10:46:02', '1');
INSERT INTO `zen_categories` VALUES ('62', 'sample_image.gif', '0', '1520', '2003-12-23 03:18:19', '2004-05-22 21:14:57', '1');
INSERT INTO `zen_categories` VALUES ('63', 'categories/subcategory.gif', '0', '1530', '2003-12-23 03:18:19', '2004-07-12 17:45:24', '1');
INSERT INTO `zen_categories` VALUES ('64', 'categories/subcategory.gif', '0', '1550', '2004-07-12 15:22:27', null, '1');

-- ----------------------------
-- Table structure for `zen_categories_description`
-- ----------------------------
DROP TABLE IF EXISTS `zen_categories_description`;
CREATE TABLE `zen_categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL DEFAULT '',
  `categories_description` text NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name_zen` (`categories_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_categories_description
-- ----------------------------
INSERT INTO `zen_categories_description` VALUES ('1', '1', 'Hardware', 'We offer a variety of Hardware from printers to graphics cards and mice to keyboards.');
INSERT INTO `zen_categories_description` VALUES ('2', '1', 'Software', 'Select from an exciting list of software titles. <br /><br />Not seeing a title that you are looking for?');
INSERT INTO `zen_categories_description` VALUES ('3', '1', 'DVD Movies', 'We offer a variety of DVD movies enjoyable for the whole family.<br /><br />Please browse the various categories to find your favorite movie today!');
INSERT INTO `zen_categories_description` VALUES ('4', '1', 'Graphics Cards', '');
INSERT INTO `zen_categories_description` VALUES ('5', '1', 'Printers', '');
INSERT INTO `zen_categories_description` VALUES ('6', '1', 'Monitors', '');
INSERT INTO `zen_categories_description` VALUES ('7', '1', 'Speakers', '');
INSERT INTO `zen_categories_description` VALUES ('8', '1', 'Keyboards', '');
INSERT INTO `zen_categories_description` VALUES ('9', '1', 'Mice', 'Pick the right mouse for your individual computer needs!<br /><br />Contact Us if you are looking for a particular mouse that we do not currently have in stock.');
INSERT INTO `zen_categories_description` VALUES ('10', '1', 'Action', '<p>Get into the action with our Action collection of DVD movies!<br /><br />Don\'t miss the excitement and order your\'s today!<br /><br /></p>');
INSERT INTO `zen_categories_description` VALUES ('11', '1', 'Science Fiction', '');
INSERT INTO `zen_categories_description` VALUES ('12', '1', 'Comedy', '');
INSERT INTO `zen_categories_description` VALUES ('13', '1', 'Cartoons', 'Something you can enjoy with children of all ages!');
INSERT INTO `zen_categories_description` VALUES ('14', '1', 'Thriller', '');
INSERT INTO `zen_categories_description` VALUES ('15', '1', 'Drama', '');
INSERT INTO `zen_categories_description` VALUES ('16', '1', 'Memory', '');
INSERT INTO `zen_categories_description` VALUES ('17', '1', 'CDROM Drives', '');
INSERT INTO `zen_categories_description` VALUES ('18', '1', 'Simulation', '');
INSERT INTO `zen_categories_description` VALUES ('19', '1', 'Action', '');
INSERT INTO `zen_categories_description` VALUES ('20', '1', 'Strategy', '');
INSERT INTO `zen_categories_description` VALUES ('60', '1', 'Downloads', '');
INSERT INTO `zen_categories_description` VALUES ('58', '1', 'Real Sale', '');
INSERT INTO `zen_categories_description` VALUES ('21', '1', 'Gift Certificates', 'Send a Gift Certificate today!<br /><br />Gift Certificates are good for anything in the store.');
INSERT INTO `zen_categories_description` VALUES ('57', '1', 'Text Pricing', '');
INSERT INTO `zen_categories_description` VALUES ('56', '1', 'Attributes', '');
INSERT INTO `zen_categories_description` VALUES ('22', '1', 'Big Linked', 'All of these products are &quot;Linked Products&quot;.<br /><br />This means that they appear in more than one Category.<br /><br />However, you only have to maintain the product in one place.<br /><br />The Master Product is used for pricing purposes.');
INSERT INTO `zen_categories_description` VALUES ('55', '1', 'Discount Qty', '<p>Discount Quantities can be set for Products or on the individual attributes.<br /><br />Discounts on the Product do NOT reflect on the attributes price.<br /><br />Only discounts based on Special and Sale Prices are applied to attribute prices.</p>');
INSERT INTO `zen_categories_description` VALUES ('23', '1', 'Test Examples', '');
INSERT INTO `zen_categories_description` VALUES ('24', '1', 'Free Call Stuff', '');
INSERT INTO `zen_categories_description` VALUES ('25', '1', 'Test 10% by Attrib', '');
INSERT INTO `zen_categories_description` VALUES ('27', '1', '$5.00 off', '');
INSERT INTO `zen_categories_description` VALUES ('28', '1', 'Test 10%', '');
INSERT INTO `zen_categories_description` VALUES ('31', '1', '10% off Skip', '');
INSERT INTO `zen_categories_description` VALUES ('32', '1', '10% off Price', '');
INSERT INTO `zen_categories_description` VALUES ('47', '1', '10% off Attrib', '');
INSERT INTO `zen_categories_description` VALUES ('33', '1', 'A Top Level Cat', '<p>This is a top level category description.</p>');
INSERT INTO `zen_categories_description` VALUES ('34', '1', 'SubLevel 2 A', 'This is a sublevel category description.');
INSERT INTO `zen_categories_description` VALUES ('35', '1', 'SubLevel 2 B', '');
INSERT INTO `zen_categories_description` VALUES ('36', '1', 'SubLevel 2 C', '');
INSERT INTO `zen_categories_description` VALUES ('37', '1', 'Sub Sub Cat 2B1', '');
INSERT INTO `zen_categories_description` VALUES ('38', '1', 'Sub Sub Cat 2B2', '');
INSERT INTO `zen_categories_description` VALUES ('39', '1', 'Sub Sub Cat 2B3', '');
INSERT INTO `zen_categories_description` VALUES ('40', '1', 'Sub Sub Cat 2A1', 'This is a sub-sub level category description.');
INSERT INTO `zen_categories_description` VALUES ('41', '1', 'Sub Sub Cat 2C1', '');
INSERT INTO `zen_categories_description` VALUES ('42', '1', 'Sub Sub Cat 2C3', '');
INSERT INTO `zen_categories_description` VALUES ('43', '1', 'Sub Sub Cat 2A2', '');
INSERT INTO `zen_categories_description` VALUES ('44', '1', 'Sub Sub Cat 2C2', '');
INSERT INTO `zen_categories_description` VALUES ('45', '1', '10% off', '');
INSERT INTO `zen_categories_description` VALUES ('46', '1', 'Set $100', '');
INSERT INTO `zen_categories_description` VALUES ('48', '1', 'Sale Percentage', '');
INSERT INTO `zen_categories_description` VALUES ('49', '1', 'Sale Deduction', '');
INSERT INTO `zen_categories_description` VALUES ('50', '1', 'Sale New Price', '');
INSERT INTO `zen_categories_description` VALUES ('51', '1', 'Set $100 Skip', '');
INSERT INTO `zen_categories_description` VALUES ('52', '1', '$5.00 off Skip', '');
INSERT INTO `zen_categories_description` VALUES ('53', '1', 'Big Unlinked', '');
INSERT INTO `zen_categories_description` VALUES ('54', '1', 'New v1.2', '<p>The New Products show many of the newest features that have been added to Zen Cart.<br /><br />Take the time to review these and the other Demo Products to better understand all the options and features that Zen Cart has to offer.</p>');
INSERT INTO `zen_categories_description` VALUES ('61', '1', 'Real', '');
INSERT INTO `zen_categories_description` VALUES ('62', '1', 'Music', '');
INSERT INTO `zen_categories_description` VALUES ('63', '1', 'Documents', 'Documents can now be added to the category tree. For example you may want to add servicing/Technical documents. Or use Documents as an integrated FAQ system on your site. The implemetation here is fairly spartan, but could be expanded to offer PDF downloads, links to purchaseable download files. The possibilities are endless and left to your imagination.');
INSERT INTO `zen_categories_description` VALUES ('64', '1', 'Mixed Product Types', 'This is a category with mixed product types.\r\n\r\nThis includes both products and documents. There are two types of documents - Documents that are for reading and Documents that are for reading and purchasing.');

-- ----------------------------
-- Table structure for `zen_configuration`
-- ----------------------------
DROP TABLE IF EXISTS `zen_configuration`;
CREATE TABLE `zen_configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_cfg_grp_id_zen` (`configuration_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=537 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_configuration
-- ----------------------------
INSERT INTO `zen_configuration` VALUES ('1', 'Store Name', 'STORE_NAME', 'Zencart Store Name', 'The name of my store', '1', '1', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('2', 'Store Owner', 'STORE_OWNER', 'Store Owner', 'The name of my store owner', '1', '2', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('3', 'Telephone - Customer Service', 'STORE_TELEPHONE_CUSTSERVICE', '', 'Enter a telephone number for customers to reach your Customer Service department. This number may be sent as part of payment transaction details.', '1', '3', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('4', 'Country', 'STORE_COUNTRY', '150', 'The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>', '1', '6', null, '2013-05-20 08:49:13', 'zen_get_country_name', 'zen_cfg_pull_down_country_list(');
INSERT INTO `zen_configuration` VALUES ('5', 'Zone', 'STORE_ZONE', '', 'The zone my store is located in', '1', '7', null, '2013-05-20 08:49:13', 'zen_cfg_get_zone_name', 'zen_cfg_pull_down_zone_list(');
INSERT INTO `zen_configuration` VALUES ('6', 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', '1', '8', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'asc\', \'desc\'), ');
INSERT INTO `zen_configuration` VALUES ('7', 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', '1', '9', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'products_name\', \'date_expected\'), ');
INSERT INTO `zen_configuration` VALUES ('8', 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language\'s currency when it is changed', '1', '10', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('9', 'Language Selector', 'LANGUAGE_DEFAULT_SELECTOR', 'Default', 'Should the default language be based on the Store preferences, or the customer\'s browser settings?<br /><br />Default: Store\'s default settings', '1', '11', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'Default\', \'Browser\'), ');
INSERT INTO `zen_configuration` VALUES ('10', 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', '6', '12', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('11', 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', '1', '14', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('12', 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', '1', '17', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'and\', \'or\'), ');
INSERT INTO `zen_configuration` VALUES ('13', 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\r\n Address\r\n Country\r\n Phone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', '1', '7', null, '2013-05-20 08:49:13', null, 'zen_cfg_textarea(');
INSERT INTO `zen_configuration` VALUES ('14', 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', '1', '19', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('15', 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', '1', '20', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('16', 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', '1', '21', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('17', 'Display Prices with Tax in Admin', 'DISPLAY_PRICE_WITH_TAX_ADMIN', 'false', 'Display prices with tax included (true) or add the tax at the end (false) in Admin(Invoices)', '1', '21', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('18', 'Basis of Product Tax', 'STORE_PRODUCT_TAX_BASIS', 'Shipping', 'On what basis is Product Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', '1', '21', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ');
INSERT INTO `zen_configuration` VALUES ('19', 'Basis of Shipping Tax', 'STORE_SHIPPING_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone - Can be overriden by correctly written Shipping Module', '1', '21', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ');
INSERT INTO `zen_configuration` VALUES ('20', 'Sales Tax Display Status', 'STORE_TAX_DISPLAY_STATUS', '0', 'Always show Sales Tax even when amount is $0.00?<br />0= Off<br />1= On', '1', '21', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('21', 'Show Split Tax Lines', 'SHOW_SPLIT_TAX_CHECKOUT', 'false', 'If multiple tax rates apply, show each rate as a separate line at checkout', '1', '22', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('22', 'Admin Session Time Out in Seconds', 'SESSION_TIMEOUT_ADMIN', '900', 'Enter the time in seconds.<br />Max allowed is 900 for PCI Compliance Reasons.<br /> Default=900<br />Example: 900= 15 min <br /><br />Note: Too few seconds can result in timeout issues when adding/editing products', '1', '40', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'900\', \'600\', \'300\'), ');
INSERT INTO `zen_configuration` VALUES ('23', 'Admin Set max_execution_time for processes', 'GLOBAL_SET_TIME_LIMIT', '60', 'Enter the time in seconds for how long the max_execution_time of processes should be. Default=60<br />Example: 60= 1 minute<br /><br />Note: Changing the time limit is only needed if you are having problems with the execution time of a process', '1', '42', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('24', 'Show if version update available', 'SHOW_VERSION_UPDATE_IN_HEADER', 'false', 'Automatically check to see if a new version of Zen Cart is available. Enabling this can sometimes slow down the loading of Admin pages. (Displayed on main Index page after login, and Server Info page.)', '1', '44', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('25', 'Store Status', 'STORE_STATUS', '0', 'What is your Store Status<br />0= Normal Store<br />1= Showcase no prices<br />2= Showcase with prices', '1', '25', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('26', 'Server Uptime', 'DISPLAY_SERVER_UPTIME', 'true', 'Displaying Server uptime can cause entries in error logs on some servers. (true = Display, false = don\'t display)', '1', '46', '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('27', 'Missing Page Check', 'MISSING_PAGE_CHECK', 'Page Not Found', 'Zen Cart can check for missing pages in the URL and redirect to Index page. For debugging you may want to turn this off. <br /><br /><strong>Default=On</strong><br />On = Send missing pages to \'index\'<br />Off = Don\'t check for missing pages<br />Page Not Found = display the Page-Not-Found page', '1', '48', '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(\'On\', \'Off\', \'Page Not Found\'),');
INSERT INTO `zen_configuration` VALUES ('28', 'cURL Proxy Status', 'CURL_PROXY_REQUIRED', 'False', 'Does your host require that you use a proxy for cURL communication?', '6', '50', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('29', 'cURL Proxy Address', 'CURL_PROXY_SERVER_DETAILS', '', 'If you have a hosting service that requires use of a proxy to talk to external sites via cURL, enter their proxy address here.<br />format: address:port<br />ie: 127.0.0.1:3128', '6', '51', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('30', 'HTML Editor', 'HTML_EDITOR_PREFERENCE', 'NONE', 'Please select the HTML/Rich-Text editor you wish to use for composing Admin-related emails, newsletters, and product descriptions', '1', '110', null, '2013-05-20 08:49:13', null, 'zen_cfg_pull_down_htmleditors(');
INSERT INTO `zen_configuration` VALUES ('31', 'Enable phpBB linkage?', 'PHPBB_LINKS_ENABLED', 'false', 'Should Zen Cart synchronize new account information to your (already-installed) phpBB forum?', '1', '120', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('32', 'Show Category Counts - Admin', 'SHOW_COUNTS_ADMIN', 'true', 'Show Category Counts in Admin?', '1', '19', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('33', 'Currency Conversion Ratio', 'CURRENCY_UPLIFT_RATIO', '1.05', 'When auto-updating currencies, what \"uplift\" ratio should be used to calculate the exchange rate used by your store?<br />ie: the bank rate is obtained from the currency-exchange servers; how much extra do you want to charge in order to make up the difference between the bank rate and the consumer rate?<br /><br /><strong>Default: 1.05 </strong><br />This will cause the published bank rate to be multiplied by 1.05 to set the currency rates in your store.', '1', '55', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('34', 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', '2', '1', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('35', 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', '2', '2', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('36', 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', '2', '3', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('37', 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', '2', '4', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('38', 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', '2', '5', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('39', 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '0', 'Minimum length of company name', '2', '6', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('40', 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', '2', '7', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('41', 'City', 'ENTRY_CITY_MIN_LENGTH', '2', 'Minimum length of city', '2', '8', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('42', 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', '2', '9', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('43', 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', '2', '10', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('44', 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '7', 'Minimum length of password', '2', '11', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('45', 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', '2', '12', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('46', 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', '2', '13', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('47', 'Credit Card CVV Number', 'CC_CVV_MIN_LENGTH', '3', 'Minimum length of credit card CVV number', '2', '13', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('48', 'Product Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of product review text', '2', '14', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('49', 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', '2', '15', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('50', 'Also Purchased Products', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the \'This Customer Also Purchased\' box', '2', '16', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('51', 'Nick Name', 'ENTRY_NICK_MIN_LENGTH', '3', 'Minimum length of Nick Name', '2', '1', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('52', 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', '3', '1', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('53', 'Admin Search Results Per Page', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Number of products to list on an Admin search result page', '3', '2', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('54', 'Prev/Next Navigation Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of \'number\' links use for page-sets', '3', '3', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('55', 'Products on Special ', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Number of products on special to display', '3', '4', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('56', 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Number of new products to display in a category', '3', '5', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('57', 'Upcoming Products ', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Number of \'upcoming\' products to display', '3', '6', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('58', 'Manufacturers List - Scroll Box Size/Style', 'MAX_MANUFACTURERS_LIST', '3', 'Number of manufacturers names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', '3', '7', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('59', 'Manufacturers List - Verify Product Exist', 'PRODUCTS_MANUFACTURERS_STATUS', '1', 'Verify that at least 1 product exists and is active for the manufacturer name to show<br /><br />Note: When this feature is ON it can produce slower results on sites with a large number of products and/or manufacturers<br />0= off 1= on', '3', '7', null, '2013-05-20 08:49:13', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('60', 'Music Genre List - Scroll Box Size/Style', 'MAX_MUSIC_GENRES_LIST', '3', 'Number of music genre names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', '3', '7', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('61', 'Record Company List - Scroll Box Size/Style', 'MAX_RECORD_COMPANY_LIST', '3', 'Number of record company names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', '3', '7', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('62', 'Length of Record Company Name', 'MAX_DISPLAY_RECORD_COMPANY_NAME_LEN', '15', 'Used in record companies box; maximum length of record company name to display. Longer names will be truncated.', '3', '8', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('63', 'Length of Music Genre Name', 'MAX_DISPLAY_MUSIC_GENRES_NAME_LEN', '15', 'Used in music genres box; maximum length of music genre name to display. Longer names will be truncated.', '3', '8', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('64', 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display. Longer names will be truncated.', '3', '8', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('65', 'New Product Reviews Per Page', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Number of new reviews to display on each page', '3', '9', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('66', 'Random Product Reviews for SideBox', 'MAX_RANDOM_SELECT_REVIEWS', '1', 'Number of random product REVIEWS to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', '3', '10', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('67', 'Random New Products for SideBox', 'MAX_RANDOM_SELECT_NEW', '3', 'Number of random NEW products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', '3', '11', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('68', 'Random Products On Special for SideBox', 'MAX_RANDOM_SELECT_SPECIALS', '2', 'Number of random products on SPECIAL to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', '3', '12', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('69', 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', '3', '13', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('70', 'New Products Listing- Number Per Page', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Number of new products listed per page', '3', '14', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('71', 'Best Sellers For Box', 'MAX_DISPLAY_BESTSELLERS', '10', 'Number of best sellers to display in box', '3', '15', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('72', 'Also Purchased Products', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Number of products to display in the \'This Customer Also Purchased\' box', '3', '16', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('73', 'Recent Purchases Box- NOTE: box is disabled ', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Number of products to display in the recent purchases box', '3', '17', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('74', 'Customer Order History List Per Page', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Number of orders to display in the order history list in \'My Account\'', '3', '18', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('75', 'Maximum Display of Customers on Customers Page', 'MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER', '20', '', '3', '19', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('76', 'Maximum Display of Orders on Orders Page', 'MAX_DISPLAY_SEARCH_RESULTS_ORDERS', '20', '', '3', '20', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('77', 'Maximum Display of Products on Reports', 'MAX_DISPLAY_SEARCH_RESULTS_REPORTS', '20', '', '3', '21', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('78', 'Maximum Categories Products Display List', 'MAX_DISPLAY_RESULTS_CATEGORIES', '10', 'Number of products to list per screen', '3', '22', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('79', 'Products Listing- Number Per Page', 'MAX_DISPLAY_PRODUCTS_LISTING', '10', 'Maximum Number of Products to list per page on main page', '3', '30', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('80', 'Products Attributes - Option Names and Values Display', 'MAX_ROW_LISTS_OPTIONS', '10', 'Maximum number of option names and values to display in the products attributes page', '3', '24', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('81', 'Products Attributes - Attributes Controller Display', 'MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER', '30', 'Maximum number of attributes to display in the Attributes Controller page', '3', '25', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('82', 'Products Attributes - Downloads Manager Display', 'MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER', '30', 'Maximum number of attributes downloads to display in the Downloads Manager page', '3', '26', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('83', 'Featured Products - Number to Display Admin', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN', '10', 'Number of featured products to list per screen - Admin', '3', '27', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('84', 'Maximum Display of Featured Products - Main Page', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED', '9', 'Number of featured products to list on main page', '3', '28', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('85', 'Maximum Display of Featured Products Page', 'MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS', '10', 'Number of featured products to list per screen', '3', '29', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('86', 'Random Featured Products for SideBox', 'MAX_RANDOM_SELECT_FEATURED_PRODUCTS', '2', 'Number of random FEATURED products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', '3', '30', null, '2013-05-20 08:49:13', null, null);
INSERT INTO `zen_configuration` VALUES ('87', 'Maximum Display of Specials Products - Main Page', 'MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX', '9', 'Number of special products to list on main page', '3', '31', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('88', 'New Product Listing - Limited to ...', 'SHOW_NEW_PRODUCTS_LIMIT', '0', 'Limit the New Product Listing to<br />0= All Products<br />1= Current Month<br />7= 7 Days<br />14= 14 Days<br />30= 30 Days<br />60= 60 Days<br />90= 90 Days<br />120= 120 Days', '3', '40', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'7\', \'14\', \'30\', \'60\', \'90\', \'120\'), ');
INSERT INTO `zen_configuration` VALUES ('89', 'Maximum Display of Products All Page', 'MAX_DISPLAY_PRODUCTS_ALL', '10', 'Number of products to list per screen', '3', '45', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('90', 'Maximum Display of Language Flags in Language Side Box', 'MAX_LANGUAGE_FLAGS_COLUMNS', '3', 'Number of Language Flags per Row', '3', '50', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('91', 'Maximum File Upload Size', 'MAX_FILE_UPLOAD_SIZE', '2048000', 'What is the Maximum file size for uploads?<br />Default= 2048000', '3', '60', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('92', 'Allowed Filename Extensions for uploading', 'UPLOAD_FILENAME_EXTENSIONS', 'jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip', 'List the permissible filetypes (filename extensions) to be allowed when files are uploaded to your site by customers. Separate multiple values with commas(,). Do not include the dot(.).<br /><br />Suggested setting: \"jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip\"', '3', '61', null, '2013-05-20 08:49:14', null, 'zen_cfg_textarea(');
INSERT INTO `zen_configuration` VALUES ('93', 'Maximum Orders Detail Display on Admin Orders Listing', 'MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING', '0', 'Maximum number of Order Details<br />0 = Unlimited', '3', '65', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('94', 'Maximum PayPal IPN Display on Admin Listing', 'MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN', '20', 'Maximum number of PayPal IPN Lisings in Admin<br />Default is 20', '3', '66', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('95', 'Maximum Display Columns Products to Multiple Categories Manager', 'MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS', '3', 'Maximum Display Columns Products to Multiple Categories Manager<br />3 = Default', '3', '70', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('96', 'Maximum Display EZ-Pages', 'MAX_DISPLAY_SEARCH_RESULTS_EZPAGE', '20', 'Maximum Display EZ-Pages<br />20 = Default', '3', '71', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('97', 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', '4', '1', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('98', 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', '4', '2', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('99', 'Heading Image Width - Admin', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin', '4', '3', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('100', 'Heading Image Height - Admin', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin', '4', '4', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('101', 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', '4', '5', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('102', 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', '4', '6', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('103', 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', '4', '7', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('104', 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', '4', '8', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('105', 'Image - Shopping Cart Status', 'IMAGE_SHOPPING_CART_STATUS', '1', 'Show product image in the shopping cart?<br />0= off 1= on', '4', '9', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('106', 'Image - Shopping Cart Width', 'IMAGE_SHOPPING_CART_WIDTH', '50', 'Default = 50', '4', '10', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('107', 'Image - Shopping Cart Height', 'IMAGE_SHOPPING_CART_HEIGHT', '40', 'Default = 40', '4', '11', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('108', 'Category Icon Image Width - Product Info Pages', 'CATEGORY_ICON_IMAGE_WIDTH', '57', 'The pixel width of Category Icon heading images for Product Info Pages', '4', '13', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('109', 'Category Icon Image Height - Product Info Pages', 'CATEGORY_ICON_IMAGE_HEIGHT', '40', 'The pixel height of Category Icon heading images for Product Info Pages', '4', '14', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('110', 'Top Subcategory Image Width', 'SUBCATEGORY_IMAGE_TOP_WIDTH', '150', 'The pixel width of Top subcategory images<br />Top subcategory is when the Category contains subcategories', '4', '15', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('111', 'Top Subcategory Image Height', 'SUBCATEGORY_IMAGE_TOP_HEIGHT', '85', 'The pixel height of Top subcategory images<br />Top subcategory is when the Category contains subcategories', '4', '16', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('112', 'Product Info - Image Width', 'MEDIUM_IMAGE_WIDTH', '150', 'The pixel width of Product Info images', '4', '20', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('113', 'Product Info - Image Height', 'MEDIUM_IMAGE_HEIGHT', '120', 'The pixel height of Product Info images', '4', '21', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('114', 'Product Info - Image Medium Suffix', 'IMAGE_SUFFIX_MEDIUM', '_MED', 'Product Info Medium Image Suffix<br />Default = _MED', '4', '22', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('115', 'Product Info - Image Large Suffix', 'IMAGE_SUFFIX_LARGE', '_LRG', 'Product Info Large Image Suffix<br />Default = _LRG', '4', '23', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('116', 'Product Info - Number of Additional Images per Row', 'IMAGES_AUTO_ADDED', '3', 'Product Info - Enter the number of additional images to display per row<br />Default = 3', '4', '30', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('117', 'Image - Product Listing Width', 'IMAGE_PRODUCT_LISTING_WIDTH', '100', 'Default = 100', '4', '40', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('118', 'Image - Product Listing Height', 'IMAGE_PRODUCT_LISTING_HEIGHT', '80', 'Default = 80', '4', '41', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('119', 'Image - Product New Listing Width', 'IMAGE_PRODUCT_NEW_LISTING_WIDTH', '100', 'Default = 100', '4', '42', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('120', 'Image - Product New Listing Height', 'IMAGE_PRODUCT_NEW_LISTING_HEIGHT', '80', 'Default = 80', '4', '43', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('121', 'Image - New Products Width', 'IMAGE_PRODUCT_NEW_WIDTH', '100', 'Default = 100', '4', '44', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('122', 'Image - New Products Height', 'IMAGE_PRODUCT_NEW_HEIGHT', '80', 'Default = 80', '4', '45', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('123', 'Image - Featured Products Width', 'IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH', '100', 'Default = 100', '4', '46', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('124', 'Image - Featured Products Height', 'IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT', '80', 'Default = 80', '4', '47', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('125', 'Image - Product All Listing Width', 'IMAGE_PRODUCT_ALL_LISTING_WIDTH', '100', 'Default = 100', '4', '48', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('126', 'Image - Product All Listing Height', 'IMAGE_PRODUCT_ALL_LISTING_HEIGHT', '80', 'Default = 80', '4', '49', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('127', 'Product Image - No Image Status', 'PRODUCTS_IMAGE_NO_IMAGE_STATUS', '1', 'Use automatic No Image when none is added to product<br />0= off<br />1= On', '4', '60', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('128', 'Product Image - No Image picture', 'PRODUCTS_IMAGE_NO_IMAGE', 'no_picture.gif', 'Use automatic No Image when none is added to product<br />Default = no_picture.gif', '4', '61', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('129', 'Image - Use Proportional Images on Products and Categories', 'PROPORTIONAL_IMAGES_STATUS', '1', 'Use Proportional Images on Products and Categories?<br /><br />NOTE: Do not use 0 height or width settings for Proportion Images<br />0= off 1= on', '4', '75', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('130', 'Email Salutation', 'ACCOUNT_GENDER', 'true', 'Display salutation choice during account creation and with account information', '5', '1', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('131', 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth field during account creation and with account information<br />NOTE: Set Minimum Value Date of Birth to blank for not required<br />Set Minimum Value Date of Birth > 0 to require', '5', '2', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('132', 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company field during account creation and with account information', '5', '3', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('133', 'Address Line 2', 'ACCOUNT_SUBURB', 'true', 'Display address line 2 field during account creation and with account information', '5', '4', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('134', 'State', 'ACCOUNT_STATE', 'true', 'Display state field during account creation and with account information', '5', '5', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('135', 'State - Always display as pulldown?', 'ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN', 'false', 'When state field is displayed, should it always be a pulldown menu?', '5', '5', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('136', 'Create Account Default Country ID', 'SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY', '223', 'Set Create Account Default Country ID to:<br />Default is 223', '5', '6', null, '2013-05-20 08:49:14', 'zen_get_country_name', 'zen_cfg_pull_down_country_list_none(');
INSERT INTO `zen_configuration` VALUES ('137', 'Fax Number', 'ACCOUNT_FAX_NUMBER', 'true', 'Display fax number field during account creation and with account information', '5', '10', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('138', 'Show Newsletter Checkbox', 'ACCOUNT_NEWSLETTER_STATUS', '1', 'Show Newsletter Checkbox<br />0= off<br />1= Display Unchecked<br />2= Display Checked<br /><strong>Note: Defaulting this to accepted may be in violation of certain regulations for your state or country</strong>', '5', '45', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('139', 'Customer Default Email Preference', 'ACCOUNT_EMAIL_PREFERENCE', '0', 'Set the Default Customer Default Email Preference<br />0= Text<br />1= HTML<br />', '5', '46', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('140', 'Customer Product Notification Status', 'CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS', '1', 'Customer should be asked about product notifications after checkout success and in account preferences<br />0= Never ask<br />1= Ask (ignored on checkout if has already selected global notifications)<br /><br />Note: Sidebox must be turned off separately', '5', '50', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('141', 'Customer Shop Status - View Shop and Prices', 'CUSTOMERS_APPROVAL', '0', 'Customer must be approved to shop<br />0= Not required<br />1= Must login to browse<br />2= May browse but no prices unless logged in<br />3= Showroom Only<br /><br />It is recommended that Option 2 be used for the purposes of Spiders if you wish customers to login to see prices.', '5', '55', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('142', 'Customer Approval Status - Authorization Pending', 'CUSTOMERS_APPROVAL_AUTHORIZATION', '0', 'Customer must be Authorized to shop<br />0= Not required<br />1= Must be Authorized to Browse<br />2= May browse but no prices unless Authorized<br />3= Customer May Browse and May see Prices but Must be Authorized to Buy<br /><br />It is recommended that Option 2 or 3 be used for the purposes of Spiders', '5', '65', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('143', 'Customer Authorization: filename', 'CUSTOMERS_AUTHORIZATION_FILENAME', 'customers_authorization', 'Customer Authorization filename<br />Note: Do not include the extension<br />Default=customers_authorization', '5', '66', null, '2013-05-20 08:49:14', null, '');
INSERT INTO `zen_configuration` VALUES ('144', 'Customer Authorization: Hide Header', 'CUSTOMERS_AUTHORIZATION_HEADER_OFF', 'false', 'Customer Authorization: Hide Header <br />(true=hide false=show)', '5', '67', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('145', 'Customer Authorization: Hide Column Left', 'CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF', 'false', 'Customer Authorization: Hide Column Left <br />(true=hide false=show)', '5', '68', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('146', 'Customer Authorization: Hide Column Right', 'CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF', 'false', 'Customer Authorization: Hide Column Right <br />(true=hide false=show)', '5', '69', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('147', 'Customer Authorization: Hide Footer', 'CUSTOMERS_AUTHORIZATION_FOOTER_OFF', 'false', 'Customer Authorization: Hide Footer <br />(true=hide false=show)', '5', '70', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('148', 'Customer Authorization: Hide Prices', 'CUSTOMERS_AUTHORIZATION_PRICES_OFF', 'false', 'Customer Authorization: Hide Prices <br />(true=hide false=show)', '5', '71', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('149', 'Customers Referral Status', 'CUSTOMERS_REFERRAL_STATUS', '0', 'Customers Referral Code is created from<br />0= Off<br />1= 1st Discount Coupon Code used<br />2= Customer can add during create account or edit if blank<br /><br />NOTE: Once the Customers Referral Code has been set it can only be changed in the Admin Customer', '5', '80', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('150', 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'freecharger.php;moneyorder.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: freecharger.php;cod.php;paypal.php)', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('151', 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('152', 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php;freeshipper.php;item.php;storepickup.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('153', 'Enable Free Shipping', 'MODULE_SHIPPING_FREESHIPPER_STATUS', 'True', 'Do you want to offer Free shipping?', '6', '0', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('154', 'Free Shipping Cost', 'MODULE_SHIPPING_FREESHIPPER_COST', '0.00', 'What is the Shipping cost?', '6', '6', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('155', 'Handling Fee', 'MODULE_SHIPPING_FREESHIPPER_HANDLING', '0', 'Handling fee for this shipping method.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('156', 'Tax Class', 'MODULE_SHIPPING_FREESHIPPER_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `zen_configuration` VALUES ('157', 'Shipping Zone', 'MODULE_SHIPPING_FREESHIPPER_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `zen_configuration` VALUES ('158', 'Sort Order', 'MODULE_SHIPPING_FREESHIPPER_SORT_ORDER', '0', 'Sort order of display.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('159', 'Enable Store Pickup Shipping', 'MODULE_SHIPPING_STOREPICKUP_STATUS', 'True', 'Do you want to offer In Store rate shipping?', '6', '0', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('160', 'Shipping Cost', 'MODULE_SHIPPING_STOREPICKUP_COST', '0.00', 'The shipping cost for all orders using this shipping method.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('161', 'Tax Class', 'MODULE_SHIPPING_STOREPICKUP_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `zen_configuration` VALUES ('162', 'Tax Basis', 'MODULE_SHIPPING_STOREPICKUP_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', '6', '0', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\'), ');
INSERT INTO `zen_configuration` VALUES ('163', 'Shipping Zone', 'MODULE_SHIPPING_STOREPICKUP_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `zen_configuration` VALUES ('164', 'Sort Order', 'MODULE_SHIPPING_STOREPICKUP_SORT_ORDER', '0', 'Sort order of display.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('165', 'Enable Item Shipping', 'MODULE_SHIPPING_ITEM_STATUS', 'True', 'Do you want to offer per item rate shipping?', '6', '0', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('166', 'Shipping Cost', 'MODULE_SHIPPING_ITEM_COST', '2.50', 'The shipping cost will be multiplied by the number of items in an order that uses this shipping method.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('167', 'Handling Fee', 'MODULE_SHIPPING_ITEM_HANDLING', '0', 'Handling fee for this shipping method.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('168', 'Tax Class', 'MODULE_SHIPPING_ITEM_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `zen_configuration` VALUES ('169', 'Tax Basis', 'MODULE_SHIPPING_ITEM_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', '6', '0', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ');
INSERT INTO `zen_configuration` VALUES ('170', 'Shipping Zone', 'MODULE_SHIPPING_ITEM_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `zen_configuration` VALUES ('171', 'Sort Order', 'MODULE_SHIPPING_ITEM_SORT_ORDER', '0', 'Sort order of display.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('172', 'Enable Free Charge Module', 'MODULE_PAYMENT_FREECHARGER_STATUS', 'True', 'Do you want to accept Free Charge payments?', '6', '1', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('173', 'Sort order of display.', 'MODULE_PAYMENT_FREECHARGER_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('174', 'Payment Zone', 'MODULE_PAYMENT_FREECHARGER_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', null, '2013-05-20 08:49:14', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `zen_configuration` VALUES ('175', 'Set Order Status', 'MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `zen_configuration` VALUES ('176', 'Enable Check/Money Order Module', 'MODULE_PAYMENT_MONEYORDER_STATUS', 'True', 'Do you want to accept Check/Money Order payments?', '6', '1', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('177', 'Make Payable to:', 'MODULE_PAYMENT_MONEYORDER_PAYTO', 'the Store Owner/Website Name', 'Who should payments be made payable to?', '6', '1', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('178', 'Sort order of display.', 'MODULE_PAYMENT_MONEYORDER_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('179', 'Payment Zone', 'MODULE_PAYMENT_MONEYORDER_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', null, '2013-05-20 08:49:14', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `zen_configuration` VALUES ('180', 'Set Order Status', 'MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `zen_configuration` VALUES ('181', 'Include Tax', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX', 'false', 'Include Tax value in amount before discount calculation?', '6', '6', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('182', 'This module is installed', 'MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS', 'true', '', '6', '1', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\'), ');
INSERT INTO `zen_configuration` VALUES ('183', 'Sort Order', 'MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER', '290', 'Sort order of display.', '6', '2', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('184', 'Include Shipping', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING', 'false', 'Include Shipping value in amount before discount calculation?', '6', '5', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('185', 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX', 'Standard', 'Re-Calculate Tax', '6', '7', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'), ');
INSERT INTO `zen_configuration` VALUES ('186', 'Tax Class', 'MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS', '0', 'Use the following tax class when treating Group Discount as Credit Note.', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `zen_configuration` VALUES ('187', 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', '6', '0', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('188', 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('189', 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `zen_configuration` VALUES ('190', 'Tax Basis', 'MODULE_SHIPPING_FLAT_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', '6', '0', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ');
INSERT INTO `zen_configuration` VALUES ('191', 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `zen_configuration` VALUES ('192', 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('193', 'Default Currency', 'DEFAULT_CURRENCY', 'EUR', 'Default Currency', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('194', 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('195', 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('196', 'Admin configuration_key shows', 'ADMIN_CONFIGURATION_KEY_ON', '0', 'Manually switch to value of 1 to see the configuration_key name in configuration displays', '6', '0', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('197', 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '150', 'Select the country of origin to be used in shipping quotes.', '7', '1', null, '2013-05-20 08:49:14', 'zen_get_country_name', 'zen_cfg_pull_down_country_list(');
INSERT INTO `zen_configuration` VALUES ('198', 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes. NOTE: For USA zip codes, only use your 5 digit zip code.', '7', '2', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('199', 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', '7', '3', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('200', 'Package Tare Small to Medium - added percentage:weight', 'SHIPPING_BOX_WEIGHT', '0:3', 'What is the weight of typical packaging of small to medium packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0', '7', '4', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('201', 'Larger packages - added packaging percentage:weight', 'SHIPPING_BOX_PADDING', '10:0', 'What is the weight of typical packaging for Large packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0', '7', '5', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('202', 'Display Number of Boxes and Weight Status', 'SHIPPING_BOX_WEIGHT_DISPLAY', '3', 'Display Shipping Weight and Number of Boxes?<br /><br />0= off<br />1= Boxes Only<br />2= Weight Only<br />3= Both Boxes and Weight', '7', '15', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('203', 'Shipping Estimator Display Settings for Shopping Cart', 'SHOW_SHIPPING_ESTIMATOR_BUTTON', '1', '<br />0= Off<br />1= Display as Button on Shopping Cart<br />2= Display as Listing on Shopping Cart Page', '7', '20', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('204', 'Display Order Comments on Admin Invoice', 'ORDER_COMMENTS_INVOICE', '1', 'Do you want to display the Order Comments on the Admin Invoice?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order', '7', '25', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('205', 'Display Order Comments on Admin Packing Slip', 'ORDER_COMMENTS_PACKING_SLIP', '1', 'Do you want to display the Order Comments on the Admin Packing Slip?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order', '7', '26', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('206', 'Order Free Shipping 0 Weight Status', 'ORDER_WEIGHT_ZERO_STATUS', '0', 'If there is no weight to the order, does the order have Free Shipping?<br />0= no<br />1= yes<br /><br />Note: When using Free Shipping, Enable the Free Shipping Module this will only show when shipping is free.', '7', '15', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('207', 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', '8', '1', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('208', 'Display Product Manufacturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', '8', '2', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('209', 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', '8', '3', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('210', 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', '8', '4', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('211', 'Display Product Price/Add to Cart', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price/Add to Cart', '8', '5', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('212', 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', '8', '6', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('213', 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', '8', '7', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('214', 'Display Product Price/Add to Cart Column Width', 'PRODUCTS_LIST_PRICE_WIDTH', '125', 'Define the width of the Price/Add to Cart column<br />Default= 125', '8', '8', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('215', 'Display Category/Manufacturer Filter (0=off; 1=on)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', '8', '9', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('216', 'Prev/Next Split Page Navigation (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '3', 'Sets the location of the Prev/Next Split Page Navigation', '8', '10', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('217', 'Display Product Listing Default Sort Order', 'PRODUCT_LISTING_DEFAULT_SORT_ORDER', '', 'Product Listing Default sort order?<br />NOTE: Leave Blank for Product Sort Order. Sort the Product Listing in the order you wish for the default display to start in to get the sort order setting. Example: 2a', '8', '15', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('218', 'Display Product Add to Cart Button (0=off; 1=on; 2=on with Qty Box per Product)', 'PRODUCT_LIST_PRICE_BUY_NOW', '1', 'Do you want to display the Add to Cart Button?<br /><br /><strong>NOTE:</strong> Turn OFF Display Multiple Products Qty Box Status to use Option 2 on with Qty Box per Product', '8', '20', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('219', 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', '8', '25', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('220', 'Display Product Description', 'PRODUCT_LIST_DESCRIPTION', '150', 'Do you want to display the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', '8', '30', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('221', 'Product Listing Ascending Sort Order', 'PRODUCT_LIST_SORT_ORDER_ASCENDING', '+', 'What do you want to use to indicate Sort Order Ascending?<br />Default = +', '8', '40', null, '2013-05-20 08:49:14', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('222', 'Product Listing Descending Sort Order', 'PRODUCT_LIST_SORT_ORDER_DESCENDING', '-', 'What do you want to use to indicate Sort Order Descending?<br />Default = -', '8', '41', null, '2013-05-20 08:49:14', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('223', 'Include Product Listing Alpha Sorter Dropdown', 'PRODUCT_LIST_ALPHA_SORTER', 'true', 'Do you want to include an Alpha Filter dropdown on the Product Listing?', '8', '50', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('224', 'Include Product Listing Sub Categories Image', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS', 'true', 'Do you want to include the Sub Categories Image on the Product Listing?', '8', '52', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('225', 'Include Product Listing Top Categories Image', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP', 'true', 'Do you want to include the Top Categories Image on the Product Listing?', '8', '53', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('226', 'Show SubCategories on Main Page while navigating', 'PRODUCT_LIST_CATEGORY_ROW_STATUS', '1', 'Show Sub-Categories on Main Page while navigating through Categories<br /><br />0= off<br />1= on', '8', '60', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('227', 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', '9', '1', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('228', 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', '9', '2', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('229', 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', '9', '3', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('230', 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', '9', '4', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('231', 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', '9', '5', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('232', 'Products status in Catalog when out of stock should be set to', 'SHOW_PRODUCTS_SOLD_OUT', '0', 'Show Products when out of stock<br /><br />0= set product status to OFF<br />1= leave product status ON', '9', '10', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('233', 'Show Sold Out Image in place of Add to Cart', 'SHOW_PRODUCTS_SOLD_OUT_IMAGE', '1', 'Show Sold Out Image instead of Add to Cart Button<br /><br />0= off<br />1= on', '9', '11', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('234', 'Product Quantity Decimals', 'QUANTITY_DECIMALS', '0', 'Allow how many decimals on Quantity<br /><br />0= off', '9', '15', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('235', 'Show Shopping Cart - Delete Checkboxes or Delete Button', 'SHOW_SHOPPING_CART_DELETE', '3', 'Show on Shopping Cart Delete Button and/or Checkboxes<br /><br />1= Delete Button Only<br />2= Checkbox Only<br />3= Both Delete Button and Checkbox', '9', '20', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('236', 'Show Shopping Cart - Update Cart Button Location', 'SHOW_SHOPPING_CART_UPDATE', '3', 'Show on Shopping Cart Update Cart Button Location as:<br /><br />1= Next to each Qty Box<br />2= Below all Products<br />3= Both Next to each Qty Box and Below all Products', '9', '22', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('237', 'Show New Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS', '1', 'Show New Products on empty Shopping Cart Page<br />0= off or set the sort order', '9', '30', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('238', 'Show Featured Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS', '2', 'Show Featured Products on empty Shopping Cart Page<br />0= off or set the sort order', '9', '31', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('239', 'Show Special Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS', '3', 'Show Special Products on empty Shopping Cart Page<br />0= off or set the sort order', '9', '32', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('240', 'Show Upcoming Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_UPCOMING', '4', 'Show Upcoming Products on empty Shopping Cart Page<br />0= off or set the sort order', '9', '33', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('241', 'Show Notice of Combining Shopping Cart on Login', 'SHOW_SHOPPING_CART_COMBINED', '1', 'When a customer logs in and has a previously stored shopping cart, the products are combined with the existing shopping cart.<br /><br />Do you wish to display a Notice to the customer?<br /><br />0= OFF, do not display a notice<br />1= Yes show notice and go to shopping cart<br />2= Yes show notice, but do not go to shopping cart', '9', '35', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('242', 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', '10', '1', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('243', 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', 'F:/EasyPHP-DevServer-13.1VC9/data/2toko/www/installers/zencart_v1.5.1/cache/page_parse_time.log', 'Directory and filename of the page parse time log', '10', '2', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('244', 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', '10', '3', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('245', 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'false', 'Display the page parse time on the bottom of each page<br />You do not need to store the times to display them in the Catalog', '10', '4', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('246', 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', '10', '5', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('247', 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'PHP', 'Defines the method for sending mail.<br /><strong>PHP</strong> is the default, and uses built-in PHP wrappers for processing.<br />Servers running on Windows and MacOS should change this setting to <strong>SMTP</strong>.<br /><br /><strong>SMTPAUTH</strong> should only be used if your server requires SMTP authorization to send messages. You must also configure your SMTPAUTH settings in the appropriate fields in this admin section.<br /><br /><strong>sendmail</strong> is for linux/unix hosts using the sendmail program on the server<br /><strong>\"sendmail-f\"</strong> is only for servers which require the use of the -f parameter to send mail. This is a security setting often used to prevent spoofing. Will cause errors if your host mailserver is not configured to use it.<br /><br /><strong>Qmail</strong> is used for linux/unix hosts running Qmail as sendmail wrapper at /var/qmail/bin/sendmail.', '12', '1', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'PHP\', \'sendmail\', \'sendmail-f\', \'smtp\', \'smtpauth\', \'Qmail\'),');
INSERT INTO `zen_configuration` VALUES ('248', 'SMTP Email Account Mailbox', 'EMAIL_SMTPAUTH_MAILBOX', 'YourEmailAccountNameHere', 'Enter the mailbox account name (me@mydomain.com) supplied by your host. This is the account name that your host requires for SMTP authentication.<br />Only required if using SMTP Authentication for email.', '12', '101', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('249', 'SMTP Email Account Password', 'EMAIL_SMTPAUTH_PASSWORD', 'YourPasswordHere', 'Enter the password for your SMTP mailbox. <br />Only required if using SMTP Authentication for email.', '12', '101', null, '2013-05-20 08:49:14', 'zen_cfg_password_display', null);
INSERT INTO `zen_configuration` VALUES ('250', 'SMTP Email Mail Host', 'EMAIL_SMTPAUTH_MAIL_SERVER', 'mail.EnterYourDomain.com', 'Enter the DNS name of your SMTP mail server.<br />ie: mail.mydomain.com<br />or 55.66.77.88<br />Only required if using SMTP Authentication for email.', '12', '101', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('251', 'SMTP Email Mail Server Port', 'EMAIL_SMTPAUTH_MAIL_SERVER_PORT', '25', 'Enter the IP port number that your SMTP mailserver operates on.<br />Only required if using SMTP Authentication for email.', '12', '101', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('252', 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', '12', '2', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO `zen_configuration` VALUES ('253', 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', '12', '3', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('254', 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', '6', '6', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('255', 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', '12', '5', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('256', 'Email Archiving Active?', 'EMAIL_ARCHIVE', 'false', 'If you wish to have email messages archived/stored when sent, set this to \"true\".', '12', '6', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('257', 'E-Mail Friendly-Errors', 'EMAIL_FRIENDLY_ERRORS', 'true', 'Do you want to display friendly errors if emails fail?  Setting this to false will display PHP errors and likely cause the script to fail. Only set to false while troubleshooting, and true for a live shop.', '12', '7', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('258', 'Email Address (Displayed to Contact you)', 'STORE_OWNER_EMAIL_ADDRESS', 'Owner@email.com', 'Email address of Store Owner.  Used as \"display only\" when informing customers of how to contact you.', '12', '10', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('259', 'Email Address (sent FROM)', 'EMAIL_FROM', 'Owner@email.com', 'Address from which email messages will be \"sent\" by default. Can be over-ridden at compose-time in admin modules.', '12', '11', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('260', 'Emails must send from known domain?', 'EMAIL_SEND_MUST_BE_STORE', 'Yes', 'Does your mailserver require that all outgoing emails have their \"from\" address match a known domain that exists on your webserver?<br /><br />This is often required in order to prevent spoofing and spam broadcasts.  If set to Yes, this will cause the email address (sent FROM) to be used as the \"from\" address on all outgoing mail.', '12', '11', null, '0001-01-01 00:00:00', null, 'zen_cfg_select_option(array(\'No\', \'Yes\'), ');
INSERT INTO `zen_configuration` VALUES ('261', 'Email Admin Format?', 'ADMIN_EXTRA_EMAIL_FORMAT', 'TEXT', 'Please select the Admin extra email format', '12', '12', null, '0001-01-01 00:00:00', null, 'zen_cfg_select_option(array(\'TEXT\', \'HTML\'), ');
INSERT INTO `zen_configuration` VALUES ('262', 'Send Copy of Order Confirmation Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', 'Owner@email.com', 'Send COPIES of order confirmation emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '12', '12', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('263', 'Send Copy of Create Account Emails To - Status', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS', '0', 'Send copy of Create Account Status<br />0= off 1= on', '12', '13', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('264', 'Send Copy of Create Account Emails To', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO', 'Owner@email.com', 'Send copy of Create Account emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '12', '14', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('265', 'Send Copy of Customer GV Send Emails To - Status', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS', '0', 'Send copy of Customer GV Send Status<br />0= off 1= on', '12', '17', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('266', 'Send Copy of Customer GV Send Emails To', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO', 'Owner@email.com', 'Send copy of Customer GV Send emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '12', '18', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('267', 'Send Copy of Admin GV Mail Emails To - Status', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin GV Mail Status<br />0= off 1= on', '12', '19', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('268', 'Send Copy of Customer Admin GV Mail Emails To', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO', 'Owner@email.com', 'Send copy of Admin GV Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '12', '20', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('269', 'Send Copy of Admin Discount Coupon Mail Emails To - Status', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin Discount Coupon Mail Status<br />0= off 1= on', '12', '21', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('270', 'Send Copy of Customer Admin Discount Coupon Mail Emails To', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO', 'Owner@email.com', 'Send copy of Admin Discount Coupon Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '12', '22', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('271', 'Send Copy of Admin Orders Status Emails To - Status', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin Orders Status Status<br />0= off 1= on', '12', '23', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('272', 'Send Copy of Admin Orders Status Emails To', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO', 'Owner@email.com', 'Send copy of Admin Orders Status emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '12', '24', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('273', 'Send Notice of Pending Reviews Emails To - Status', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS', '0', 'Send copy of Pending Reviews Status<br />0= off 1= on', '12', '25', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('274', 'Send Notice of Pending Reviews Emails To', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO', 'Owner@email.com', 'Send copy of Pending Reviews emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '12', '26', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('275', 'Set \"Contact Us\" Email Dropdown List', 'CONTACT_US_LIST', '', 'On the \"Contact Us\" Page, set the list of email addresses , in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '12', '40', null, '2013-05-20 08:49:14', null, 'zen_cfg_textarea(');
INSERT INTO `zen_configuration` VALUES ('276', 'Contact Us - Show Store Name and Address', 'CONTACT_US_STORE_NAME_ADDRESS', '1', 'Include Store Name and Address<br />0= off 1= on', '12', '50', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('277', 'Send Low Stock Emails', 'SEND_LOWSTOCK_EMAIL', '0', 'When stock level is at or below low stock level send an email<br />0= off<br />1= on', '12', '60', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('278', 'Send Low Stock Emails To', 'SEND_EXTRA_LOW_STOCK_EMAILS_TO', 'Owner@email.com', 'When stock level is at or below low stock level send an email to this address, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '12', '61', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('279', 'Display \"Newsletter Unsubscribe\" Link?', 'SHOW_NEWSLETTER_UNSUBSCRIBE_LINK', 'true', 'Show \"Newsletter Unsubscribe\" link in the \"Information\" side-box?', '12', '70', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('280', 'Audience-Select Count Display', 'AUDIENCE_SELECT_DISPLAY_COUNTS', 'true', 'When displaying lists of available audiences/recipients, should the recipients-count be included? <br /><em>(This may make things slower if you have a lot of customers or complex audience queries)</em>', '12', '90', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('281', 'Enable Downloads', 'DOWNLOAD_ENABLED', 'true', 'Enable the products download functions.', '13', '1', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('282', 'Download by Redirect', 'DOWNLOAD_BY_REDIRECT', 'true', 'Use browser redirection for download. Disable on non-Unix systems.<br /><br />Note: Set /pub to 777 when redirect is true', '13', '2', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('283', 'Download by streaming', 'DOWNLOAD_IN_CHUNKS', 'false', 'If download-by-redirect is disabled, and your PHP memory_limit setting is under 8 MB, you might need to enable this setting so that files are streamed in smaller segments to the browser.<br /><br />Has no effect if Download By Redirect is enabled.', '13', '2', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('284', 'Download Expiration (Number of Days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', '13', '3', null, '2013-05-20 08:49:14', null, '');
INSERT INTO `zen_configuration` VALUES ('285', 'Number of Downloads Allowed - Per Product', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', '13', '4', null, '2013-05-20 08:49:14', null, '');
INSERT INTO `zen_configuration` VALUES ('286', 'Downloads Controller Update Status Value', 'DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '4', 'What orders_status resets the Download days and Max Downloads - Default is 4', '13', '10', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('287', 'Downloads Controller Order Status Value >= lower value', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS', '2', 'Downloads Controller Order Status Value - Default >= 2<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status greater than this value will be available for download. The orders status is set for an order by the Payment Modules. Set the lower range for this range.', '13', '12', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('288', 'Downloads Controller Order Status Value <= upper value', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS_END', '4', 'Downloads Controller Order Status Value - Default <= 4<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status less than this value will be available for download. The orders status is set for an order by the Payment Modules.  Set the upper range for this range.', '13', '13', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('289', 'Enable Price Factor', 'ATTRIBUTES_ENABLED_PRICE_FACTOR', 'true', 'Enable the Attributes Price Factor.', '13', '25', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('290', 'Enable Qty Price Discount', 'ATTRIBUTES_ENABLED_QTY_PRICES', 'true', 'Enable the Attributes Quantity Price Discounts.', '13', '26', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('291', 'Enable Attribute Images', 'ATTRIBUTES_ENABLED_IMAGES', 'true', 'Enable the Attributes Images.', '13', '28', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('292', 'Enable Text Pricing by word or letter', 'ATTRIBUTES_ENABLED_TEXT_PRICES', 'true', 'Enable the Attributes Text Pricing by word or letter.', '13', '35', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('293', 'Text Pricing - Spaces are Free', 'TEXT_SPACES_FREE', '1', 'On Text pricing Spaces are Free<br /><br />0= off 1= on', '13', '36', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('294', 'Read Only option type - Ignore for Add to Cart', 'PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED', '1', 'When a Product only uses READONLY attributes, should the Add to Cart button be On or Off?<br />0= OFF<br />1= ON', '13', '37', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('295', 'Enable GZip Compression', 'GZIP_LEVEL', '0', '0= off 1= on', '14', '1', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('296', 'Session Directory', 'SESSION_WRITE_DIRECTORY', 'F:/EasyPHP-DevServer-13.1VC9/data/2toko/www/installers/zencart_v1.5.1/cache', 'If sessions are file based, store them in this directory.', '15', '1', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('297', 'Cookie Domain', 'SESSION_USE_FQDN', 'True', 'If True the full domain name will be used to store the cookie, e.g. www.mydomain.com. If False only a partial domain name will be used, e.g. mydomain.com. If you are unsure about this, always leave set to true.', '15', '2', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('298', 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', '15', '2', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('299', 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', '15', '3', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('300', 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', '15', '4', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('301', 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', '15', '5', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('302', 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', '15', '6', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('303', 'Recreate Session', 'SESSION_RECREATE', 'True', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', '15', '7', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('304', 'IP to Host Conversion Status', 'SESSION_IP_TO_HOST_ADDRESS', 'true', 'Convert IP Address to Host Address<br /><br />Note: on some servers this can slow down the initial start of a session or execution of Emails', '15', '10', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('305', 'Length of the redeem code', 'SECURITY_CODE_LENGTH', '10', 'Enter the length of the redeem code<br />The longer the more secure', '16', '1', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('306', 'Default Order Status For Zero Balance Orders', 'DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID', '2', 'When an order\'s balance is zero, this order status will be assigned to it.', '16', '0', null, '2013-05-20 08:49:14', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `zen_configuration` VALUES ('307', 'New Signup Discount Coupon ID#', 'NEW_SIGNUP_DISCOUNT_COUPON', '', 'Select the coupon<br />', '16', '75', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_coupon_id(');
INSERT INTO `zen_configuration` VALUES ('308', 'New Signup Gift Voucher Amount', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '', 'Leave blank for none<br />Or enter an amount ie. 10 for $10.00', '16', '76', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('309', 'Maximum Discount Coupons Per Page', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS', '20', 'Number of Discount Coupons to list per Page', '16', '81', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('310', 'Maximum Discount Coupon Report Results Per Page', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS', '20', 'Number of Discount Coupons to list on Reports Page', '16', '81', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('311', 'Credit Card Enable Status - VISA', 'CC_ENABLED_VISA', '1', 'Accept VISA 0= off 1= on', '17', '1', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('312', 'Credit Card Enable Status - MasterCard', 'CC_ENABLED_MC', '1', 'Accept MasterCard 0= off 1= on', '17', '2', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('313', 'Credit Card Enable Status - AmericanExpress', 'CC_ENABLED_AMEX', '0', 'Accept AmericanExpress 0= off 1= on', '17', '3', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('314', 'Credit Card Enable Status - Diners Club', 'CC_ENABLED_DINERS_CLUB', '0', 'Accept Diners Club 0= off 1= on', '17', '4', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('315', 'Credit Card Enable Status - Discover Card', 'CC_ENABLED_DISCOVER', '0', 'Accept Discover Card 0= off 1= on', '17', '5', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('316', 'Credit Card Enable Status - JCB', 'CC_ENABLED_JCB', '0', 'Accept JCB 0= off 1= on', '17', '6', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('317', 'Credit Card Enable Status - AUSTRALIAN BANKCARD', 'CC_ENABLED_AUSTRALIAN_BANKCARD', '0', 'Accept AUSTRALIAN BANKCARD 0= off 1= on', '17', '7', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('318', 'Credit Card Enable Status - SOLO', 'CC_ENABLED_SOLO', '0', 'Accept SOLO Card 0= off 1= on', '17', '8', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('319', 'Credit Card Enable Status - Switch', 'CC_ENABLED_SWITCH', '0', 'Accept SWITCH Card 0= off 1= on', '17', '9', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('320', 'Credit Card Enable Status - Maestro', 'CC_ENABLED_MAESTRO', '0', 'Accept MAESTRO Card 0= off 1= on', '17', '10', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('321', 'Credit Card Enabled - Show on Payment', 'SHOW_ACCEPTED_CREDIT_CARDS', '0', 'Show accepted credit cards on Payment page?<br />0= off<br />1= As Text<br />2= As Images<br /><br />Note: images and text must be defined in both the database and language file for specific credit card types.', '17', '50', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('322', 'This module is installed', 'MODULE_ORDER_TOTAL_GV_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `zen_configuration` VALUES ('323', 'Sort Order', 'MODULE_ORDER_TOTAL_GV_SORT_ORDER', '840', 'Sort order of display.', '6', '2', null, '2003-10-30 22:16:40', null, null);
INSERT INTO `zen_configuration` VALUES ('324', 'Queue Purchases', 'MODULE_ORDER_TOTAL_GV_QUEUE', 'true', 'Do you want to queue purchases of the Gift Voucher?', '6', '3', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('325', 'Include Shipping', 'MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'true', 'Include Shipping in calculation', '6', '5', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('326', 'Include Tax', 'MODULE_ORDER_TOTAL_GV_INC_TAX', 'true', 'Include Tax in calculation.', '6', '6', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('327', 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_GV_CALC_TAX', 'None', 'Re-Calculate Tax', '6', '7', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),');
INSERT INTO `zen_configuration` VALUES ('328', 'Tax Class', 'MODULE_ORDER_TOTAL_GV_TAX_CLASS', '0', 'Use the following tax class when treating Gift Voucher as Credit Note.', '6', '0', null, '2003-10-30 22:16:40', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `zen_configuration` VALUES ('329', 'Credit including Tax', 'MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'false', 'Add tax to purchased Gift Voucher when crediting to Account', '6', '8', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('330', 'Set Order Status', 'MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID', '0', 'Set the status of orders made where GV covers full payment', '6', '0', null, '2013-05-20 08:49:14', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `zen_configuration` VALUES ('331', 'This module is installed', 'MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:43', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `zen_configuration` VALUES ('332', 'Sort Order', 'MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '400', 'Sort order of display.', '6', '2', null, '2003-10-30 22:16:43', null, null);
INSERT INTO `zen_configuration` VALUES ('333', 'Allow Low Order Fee', 'MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'false', 'Do you want to allow low order fees?', '6', '3', null, '2003-10-30 22:16:43', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('334', 'Order Fee For Orders Under', 'MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '50', 'Add the low order fee to orders under this amount.', '6', '4', null, '2003-10-30 22:16:43', 'currencies->format', null);
INSERT INTO `zen_configuration` VALUES ('335', 'Order Fee', 'MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '5', 'For Percentage Calculation - include a % Example: 10%<br />For a flat amount just enter the amount - Example: 5 for $5.00', '6', '5', null, '2003-10-30 22:16:43', '', null);
INSERT INTO `zen_configuration` VALUES ('336', 'Attach Low Order Fee On Orders Made', 'MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'both', 'Attach low order fee for orders sent to the set destination.', '6', '6', null, '2003-10-30 22:16:43', null, 'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO `zen_configuration` VALUES ('337', 'Tax Class', 'MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '0', 'Use the following tax class on the low order fee.', '6', '7', null, '2003-10-30 22:16:43', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `zen_configuration` VALUES ('338', 'No Low Order Fee on Virtual Products', 'MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL', 'false', 'Do not charge Low Order Fee when cart is Virtual Products Only', '6', '8', null, '2004-04-20 22:16:43', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('339', 'No Low Order Fee on Gift Vouchers', 'MODULE_ORDER_TOTAL_LOWORDERFEE_GV', 'false', 'Do not charge Low Order Fee when cart is Gift Vouchers Only', '6', '9', null, '2004-04-20 22:16:43', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('340', 'This module is installed', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:46', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `zen_configuration` VALUES ('341', 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '200', 'Sort order of display.', '6', '2', null, '2003-10-30 22:16:46', null, null);
INSERT INTO `zen_configuration` VALUES ('342', 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', '6', '3', null, '2003-10-30 22:16:46', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('343', 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', '6', '4', null, '2003-10-30 22:16:46', 'currencies->format', null);
INSERT INTO `zen_configuration` VALUES ('344', 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', '6', '5', null, '2003-10-30 22:16:46', null, 'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO `zen_configuration` VALUES ('345', 'This module is installed', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:49', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `zen_configuration` VALUES ('346', 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '100', 'Sort order of display.', '6', '2', null, '2003-10-30 22:16:49', null, null);
INSERT INTO `zen_configuration` VALUES ('347', 'This module is installed', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:52', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `zen_configuration` VALUES ('348', 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '300', 'Sort order of display.', '6', '2', null, '2003-10-30 22:16:52', null, null);
INSERT INTO `zen_configuration` VALUES ('349', 'This module is installed', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:55', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `zen_configuration` VALUES ('350', 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '999', 'Sort order of display.', '6', '2', null, '2003-10-30 22:16:55', null, null);
INSERT INTO `zen_configuration` VALUES ('351', 'Tax Class', 'MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '0', 'Use the following tax class when treating Discount Coupon as Credit Note.', '6', '0', null, '2003-10-30 22:16:36', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `zen_configuration` VALUES ('352', 'Include Tax', 'MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'false', 'Include Tax in calculation.', '6', '6', null, '2003-10-30 22:16:36', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('353', 'Sort Order', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '280', 'Sort order of display.', '6', '2', null, '2003-10-30 22:16:36', null, null);
INSERT INTO `zen_configuration` VALUES ('354', 'Include Shipping', 'MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'false', 'Include Shipping in calculation', '6', '5', null, '2003-10-30 22:16:36', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('355', 'This module is installed', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:36', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `zen_configuration` VALUES ('356', 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'Standard', 'Re-Calculate Tax', '6', '7', null, '2003-10-30 22:16:36', null, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),');
INSERT INTO `zen_configuration` VALUES ('357', 'Admin Demo Status', 'ADMIN_DEMO', '0', 'Admin Demo should be on?<br />0= off 1= on', '6', '0', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('358', 'Product option type Select', 'PRODUCTS_OPTIONS_TYPE_SELECT', '0', 'The number representing the Select type of product option.', '0', null, '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('359', 'Text product option type', 'PRODUCTS_OPTIONS_TYPE_TEXT', '1', 'Numeric value of the text product option type', '6', null, '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('360', 'Radio button product option type', 'PRODUCTS_OPTIONS_TYPE_RADIO', '2', 'Numeric value of the radio button product option type', '6', null, '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('361', 'Check box product option type', 'PRODUCTS_OPTIONS_TYPE_CHECKBOX', '3', 'Numeric value of the check box product option type', '6', null, '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('362', 'File product option type', 'PRODUCTS_OPTIONS_TYPE_FILE', '4', 'Numeric value of the file product option type', '6', null, '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('363', 'ID for text and file products options values', 'PRODUCTS_OPTIONS_VALUES_TEXT_ID', '0', 'Numeric value of the products_options_values_id used by the text and file attributes.', '6', null, '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('364', 'Upload prefix', 'UPLOAD_PREFIX', 'upload_', 'Prefix used to differentiate between upload options and other options', '0', null, '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('365', 'Text prefix', 'TEXT_PREFIX', 'txt_', 'Prefix used to differentiate between text option values and other option values', '0', null, '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('366', 'Read Only option type', 'PRODUCTS_OPTIONS_TYPE_READONLY', '5', 'Numeric value of the file product option type', '6', null, '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('367', 'login mode https', 'SSLPWSTATUSCHECK', '', 'System setting. Do not edit.', '6', '99', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('368', 'Products Info - Products Option Name Sort Order', 'PRODUCTS_OPTIONS_SORT_ORDER', '0', 'Sort order of Option Names for Products Info<br />0= Sort Order, Option Name<br />1= Option Name', '18', '35', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('369', 'Products Info - Product Option Value of Attributes Sort Order', 'PRODUCTS_OPTIONS_SORT_BY_PRICE', '1', 'Sort order of Product Option Values of Attributes for Products Info<br />0= Sort Order, Price<br />1= Sort Order, Option Value Name', '18', '36', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('370', 'Product Info - Show Option Values Name Below Attributes Image', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES', '1', 'Product Info - Show the name of the Option Value beneath the Attribute Image?<br />0= off 1= on', '18', '41', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('371', 'Product Info - Show Sales Discount Savings Status', 'SHOW_SALE_DISCOUNT_STATUS', '1', 'Product Info - Show the amount of discount savings?<br />0= off 1= on', '18', '45', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('372', 'Product Info - Show Sales Discount Savings Dollars or Percentage', 'SHOW_SALE_DISCOUNT', '1', 'Product Info - Show the amount of discount savings display as:<br />1= % off 2= $amount off', '18', '46', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('373', 'Product Info - Show Sales Discount Savings Percentage Decimals', 'SHOW_SALE_DISCOUNT_DECIMALS', '0', 'Product Info - Show discount savings display as a Percentage with how many decimals?:<br />Default= 0', '18', '47', null, '2013-05-20 08:49:14', null, null);
INSERT INTO `zen_configuration` VALUES ('374', 'Product Info - Price is Free Image or Text Status', 'OTHER_IMAGE_PRICE_IS_FREE_ON', '1', 'Product Info - Show the Price is Free Image or Text on Displayed Price<br />0= Text<br />1= Image', '18', '50', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('375', 'Product Info - Price is Call for Price Image or Text Status', 'PRODUCTS_PRICE_IS_CALL_IMAGE_ON', '1', 'Product Info - Show the Price is Call for Price Image or Text on Displayed Price<br />0= Text<br />1= Image', '18', '51', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('376', 'Product Quantity Box Status - Adding New Products', 'PRODUCTS_QTY_BOX_STATUS', '1', 'What should the Default Quantity Box Status be set to when adding New Products?<br /><br />0= off<br />1= on<br />NOTE: This will show a Qty Box when ON and default the Add to Cart to 1', '18', '55', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('377', 'Product Reviews Require Approval', 'REVIEWS_APPROVAL', '1', 'Do product reviews require approval?<br /><br />Note: When Review Status is off, it will also not show<br /><br />0= off 1= on', '18', '62', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('378', 'Meta Tags - Include Product Model in Title', 'META_TAG_INCLUDE_MODEL', '1', 'Do you want to include the Product Model in the Meta Tag Title?<br /><br />0= off 1= on', '18', '69', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('379', 'Meta Tags - Include Product Price in Title', 'META_TAG_INCLUDE_PRICE', '1', 'Do you want to include the Product Price in the Meta Tag Title?<br /><br />0= off 1= on', '18', '70', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('380', 'Meta Tags Generated Description Maximum Length?', 'MAX_META_TAG_DESCRIPTION_LENGTH', '50', 'Set Generated Meta Tag Description Maximum Length to (words) Default 50:', '18', '71', null, '2013-05-20 08:49:14', '', '');
INSERT INTO `zen_configuration` VALUES ('381', 'Also Purchased Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS', '3', 'Also Purchased Products Columns per Row<br />0= off or set the sort order', '18', '72', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO `zen_configuration` VALUES ('382', 'Previous Next - Navigation Bar Position', 'PRODUCT_INFO_PREVIOUS_NEXT', '1', 'Location of Previous/Next Navigation Bar<br />0= off<br />1= Top of Page<br />2= Bottom of Page<br />3= Both Top and Bottom of Page', '18', '21', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'Top of Page\'), array(\'id\'=>\'2\', \'text\'=>\'Bottom of Page\'), array(\'id\'=>\'3\', \'text\'=>\'Both Top & Bottom of Page\')),');
INSERT INTO `zen_configuration` VALUES ('383', 'Previous Next - Sort Order', 'PRODUCT_INFO_PREVIOUS_NEXT_SORT', '1', 'Products Display Order by<br />0= Product ID<br />1= Product Name<br />2= Model<br />3= Price, Product Name<br />4= Price, Model<br />5= Product Name, Model<br />6= Product Sort Order', '18', '22', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Product ID\'), array(\'id\'=>\'1\', \'text\'=>\'Name\'), array(\'id\'=>\'2\', \'text\'=>\'Product Model\'), array(\'id\'=>\'3\', \'text\'=>\'Product Price - Name\'), array(\'id\'=>\'4\', \'text\'=>\'Product Price - Model\'), array(\'id\'=>\'5\', \'text\'=>\'Product Name - Model\'), array(\'id\'=>\'6\', \'text\'=>\'Product Sort Order\')),');
INSERT INTO `zen_configuration` VALUES ('384', 'Previous Next - Button and Image Status', 'SHOW_PREVIOUS_NEXT_STATUS', '0', 'Button and Product Image status settings are:<br />0= Off<br />1= On', '18', '20', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),');
INSERT INTO `zen_configuration` VALUES ('385', 'Previous Next - Button and Image Settings', 'SHOW_PREVIOUS_NEXT_IMAGES', '0', 'Show Previous/Next Button and Product Image Settings<br />0= Button Only<br />1= Button and Product Image<br />2= Product Image Only', '18', '21', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Button Only\'), array(\'id\'=>\'1\', \'text\'=>\'Button and Product Image\'), array(\'id\'=>\'2\', \'text\'=>\'Product Image Only\')),');
INSERT INTO `zen_configuration` VALUES ('386', 'Previous Next - Image Width?', 'PREVIOUS_NEXT_IMAGE_WIDTH', '50', 'Previous/Next Image Width?', '18', '22', null, '2013-05-20 08:49:14', '', '');
INSERT INTO `zen_configuration` VALUES ('387', 'Previous Next - Image Height?', 'PREVIOUS_NEXT_IMAGE_HEIGHT', '40', 'Previous/Next Image Height?', '18', '23', null, '2013-05-20 08:49:14', '', '');
INSERT INTO `zen_configuration` VALUES ('388', 'Previous Next - Navigation Includes Category Position', 'PRODUCT_INFO_CATEGORIES', '1', 'Product\'s Category Image and Name Alignment Above Previous/Next Navigation Bar<br />0= off<br />1= Align Left<br />2= Align Center<br />3= Align Right', '18', '20', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'Align Left\'), array(\'id\'=>\'2\', \'text\'=>\'Align Center\'), array(\'id\'=>\'3\', \'text\'=>\'Align Right\')),');
INSERT INTO `zen_configuration` VALUES ('389', 'Previous Next - Navigation Includes Category Name and Image Status', 'PRODUCT_INFO_CATEGORIES_IMAGE_STATUS', '2', 'Product\'s Category Image and Name Status<br />0= Category Name and Image always shows<br />1= Category Name only<br />2= Category Name and Image when not blank', '18', '20', '2013-05-20 08:49:14', '2013-05-20 08:49:14', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Category Name and Image Always\'), array(\'id\'=>\'1\', \'text\'=>\'Category Name only\'), array(\'id\'=>\'2\', \'text\'=>\'Category Name and Image when not blank\')),');
INSERT INTO `zen_configuration` VALUES ('390', 'Column Width - Left Boxes', 'BOX_WIDTH_LEFT', '150px', 'Width of the Left Column Boxes<br />px may be included<br />Default = 150px', '19', '1', null, '2003-11-21 22:16:36', null, null);
INSERT INTO `zen_configuration` VALUES ('391', 'Column Width - Right Boxes', 'BOX_WIDTH_RIGHT', '150px', 'Width of the Right Column Boxes<br />px may be included<br />Default = 150px', '19', '2', null, '2003-11-21 22:16:36', null, null);
INSERT INTO `zen_configuration` VALUES ('392', 'Bread Crumbs Navigation Separator', 'BREAD_CRUMBS_SEPARATOR', '&nbsp;::&nbsp;', 'Enter the separator symbol to appear between the Navigation Bread Crumb trail<br />Note: Include spaces with the &amp;nbsp; symbol if you want them part of the separator.<br />Default = &amp;nbsp;::&amp;nbsp;', '19', '3', null, '2003-11-21 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('393', 'Define Breadcrumb Status', 'DEFINE_BREADCRUMB_STATUS', '1', 'Enable the Breadcrumb Trail Links?<br />0= OFF<br />1= ON<br />2= Off for Home Page Only', '19', '4', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('394', 'Bestsellers - Number Padding', 'BEST_SELLERS_FILLER', '&nbsp;', 'What do you want to Pad the numbers with?<br />Default = &amp;nbsp;', '19', '5', null, '2003-11-21 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('395', 'Bestsellers - Truncate Product Names', 'BEST_SELLERS_TRUNCATE', '35', 'What size do you want to truncate the Product Names?<br />Default = 35', '19', '6', null, '2003-11-21 22:16:36', null, null);
INSERT INTO `zen_configuration` VALUES ('396', 'Bestsellers - Truncate Product Names followed by ...', 'BEST_SELLERS_TRUNCATE_MORE', 'true', 'When truncated Product Names follow with ...<br />Default = true', '19', '7', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('397', 'Categories Box - Show Specials Link', 'SHOW_CATEGORIES_BOX_SPECIALS', 'true', 'Show Specials Link in the Categories Box', '19', '8', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('398', 'Categories Box - Show Products New Link', 'SHOW_CATEGORIES_BOX_PRODUCTS_NEW', 'true', 'Show Products New Link in the Categories Box', '19', '9', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('399', 'Shopping Cart Box Status', 'SHOW_SHOPPING_CART_BOX_STATUS', '1', 'Shopping Cart Shows<br />0= Always<br />1= Only when full<br />2= Only when full but not when viewing the Shopping Cart', '19', '10', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('400', 'Categories Box - Show Featured Products Link', 'SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS', 'true', 'Show Featured Products Link in the Categories Box', '19', '11', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('401', 'Categories Box - Show Products All Link', 'SHOW_CATEGORIES_BOX_PRODUCTS_ALL', 'true', 'Show Products All Link in the Categories Box', '19', '12', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('402', 'Column Left Status - Global', 'COLUMN_LEFT_STATUS', '1', 'Show Column Left, unless page override exists?<br />0= Column Left is always off<br />1= Column Left is on, unless page override', '19', '15', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('403', 'Column Right Status - Global', 'COLUMN_RIGHT_STATUS', '1', 'Show Column Right, unless page override exists?<br />0= Column Right is always off<br />1= Column Right is on, unless page override', '19', '16', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('404', 'Column Width - Left', 'COLUMN_WIDTH_LEFT', '150px', 'Width of the Left Column<br />px may be included<br />Default = 150px', '19', '20', null, '2003-11-21 22:16:36', null, null);
INSERT INTO `zen_configuration` VALUES ('405', 'Column Width - Right', 'COLUMN_WIDTH_RIGHT', '150px', 'Width of the Right Column<br />px may be included<br />Default = 150px', '19', '21', null, '2003-11-21 22:16:36', null, null);
INSERT INTO `zen_configuration` VALUES ('406', 'Categories Separator between links Status', 'SHOW_CATEGORIES_SEPARATOR_LINK', '1', 'Show Category Separator between Category Names and Links?<br />0= off<br />1= on', '19', '24', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('407', 'Categories Separator between the Category Name and Count', 'CATEGORIES_SEPARATOR', '-&gt;', 'What separator do you want between the Category name and the count?<br />Default = -&amp;gt;', '19', '25', null, '2003-11-21 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('408', 'Categories Separator between the Category Name and Sub Categories', 'CATEGORIES_SEPARATOR_SUBS', '|_&nbsp;', 'What separator do you want between the Category name and Sub Category Name?<br />Default = |_&amp;nbsp;', '19', '26', null, '2004-03-25 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('409', 'Categories Count Prefix', 'CATEGORIES_COUNT_PREFIX', '&nbsp;(', 'What do you want to Prefix the count with?<br />Default= (', '19', '27', null, '2003-01-21 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('410', 'Categories Count Suffix', 'CATEGORIES_COUNT_SUFFIX', ')', 'What do you want as a Suffix to the count?<br />Default= )', '19', '28', null, '2003-01-21 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('411', 'Categories SubCategories Indent', 'CATEGORIES_SUBCATEGORIES_INDENT', '&nbsp;&nbsp;', 'What do you want to use as the subcategories indent?<br />Default= &nbsp;&nbsp;', '19', '29', null, '2004-06-24 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('412', 'Categories with 0 Products Status', 'CATEGORIES_COUNT_ZERO', '0', 'Show Category Count for 0 Products?<br />0= off<br />1= on', '19', '30', null, '2013-05-20 08:49:14', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('413', 'Split Categories Box', 'CATEGORIES_SPLIT_DISPLAY', 'True', 'Split the categories box display by product type', '19', '31', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('414', 'Shopping Cart - Show Totals', 'SHOW_TOTALS_IN_CART', '1', 'Show Totals Above Shopping Cart?<br />0= off<br />1= on: Items Weight Amount<br />2= on: Items Weight Amount, but no weight when 0<br />3= on: Items Amount', '19', '31', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('415', 'Customer Greeting - Show on Index Page', 'SHOW_CUSTOMER_GREETING', '1', 'Always Show Customer Greeting on Index?<br />0= off<br />1= on', '19', '40', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('416', 'Categories - Always Show on Main Page', 'SHOW_CATEGORIES_ALWAYS', '0', 'Always Show Categories on Main Page<br />0= off<br />1= on<br />Default category can be set to Top Level or a Specific Top Level', '19', '45', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('417', 'Main Page - Opens with Category', 'CATEGORIES_START_MAIN', '0', '0= Top Level Categories<br />Or enter the Category ID#<br />Note: Sub Categories can also be used Example: 3_10', '19', '46', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('418', 'Categories - Always Open to Show SubCategories', 'SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS', '1', 'Always Show Categories and SubCategories<br />0= off, just show Top Categories<br />1= on, Always show Categories and SubCategories when selected', '19', '47', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('419', 'Banner Display Groups - Header Position 1', 'SHOW_BANNERS_GROUP_SET1', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 1?<br />Leave blank for none', '19', '55', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('420', 'Banner Display Groups - Header Position 2', 'SHOW_BANNERS_GROUP_SET2', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 2?<br />Leave blank for none', '19', '56', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('421', 'Banner Display Groups - Header Position 3', 'SHOW_BANNERS_GROUP_SET3', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 3?<br />Leave blank for none', '19', '57', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('422', 'Banner Display Groups - Footer Position 1', 'SHOW_BANNERS_GROUP_SET4', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 1?<br />Leave blank for none', '19', '65', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('423', 'Banner Display Groups - Footer Position 2', 'SHOW_BANNERS_GROUP_SET5', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 2?<br />Leave blank for none', '19', '66', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('424', 'Banner Display Groups - Footer Position 3', 'SHOW_BANNERS_GROUP_SET6', 'Wide-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />Default Group is Wide-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 3?<br />Leave blank for none', '19', '67', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('425', 'Banner Display Groups - Side Box banner_box', 'SHOW_BANNERS_GROUP_SET7', 'SideBox-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box?<br />Leave blank for none', '19', '70', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('426', 'Banner Display Groups - Side Box banner_box2', 'SHOW_BANNERS_GROUP_SET8', 'SideBox-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box2?<br />Leave blank for none', '19', '71', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('427', 'Banner Display Group - Side Box banner_box_all', 'SHOW_BANNERS_GROUP_SET_ALL', 'BannersAll', 'The Banner Display Group may only be from one (1) Banner Group for the Banner All sidebox<br /><br />Default Group is BannersAll<br /><br />What Banner Group do you want to use in the Side Box - banner_box_all?<br />Leave blank for none', '19', '72', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('428', 'Footer - Show IP Address status', 'SHOW_FOOTER_IP', '1', 'Show Customer IP Address in the Footer<br />0= off<br />1= on<br />Should the Customer IP Address show in the footer?', '19', '80', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('429', 'Product Discount Quantities - Add how many blank discounts?', 'DISCOUNT_QTY_ADD', '5', 'How many blank discount quantities should be added for Product Pricing?', '19', '90', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('430', 'Product Discount Quantities - Display how many per row?', 'DISCOUNT_QUANTITY_PRICES_COLUMN', '5', 'How many discount quantities should show per row on Product Info Pages?', '19', '95', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_configuration` VALUES ('431', 'Categories/Products Display Sort Order', 'CATEGORIES_PRODUCTS_SORT_ORDER', '0', 'Categories/Products Display Sort Order<br />0= Categories/Products Sort Order/Name<br />1= Categories/Products Name<br />2= Products Model<br />3= Products Qty+, Products Name<br />4= Products Qty-, Products Name<br />5= Products Price+, Products Name<br />6= Products Price-, Products Name', '19', '100', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\'), ');
INSERT INTO `zen_configuration` VALUES ('432', 'Option Names and Values Global Add, Copy and Delete Features Status', 'OPTION_NAMES_VALUES_GLOBAL_STATUS', '1', 'Option Names and Values Global Add, Copy and Delete Features Status<br />0= Hide Features<br />1= Show Features<br />(Default=1)', '19', '110', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('433', 'Categories-Tabs Menu ON/OFF', 'CATEGORIES_TABS_STATUS', '1', 'Categories-Tabs<br />This enables the display of your store\'s categories as a menu across the top of your header. There are many potential creative uses for this.<br />0= Hide Categories Tabs<br />1= Show Categories Tabs', '19', '112', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('434', 'Site Map - include My Account Links?', 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP', 'No', 'Should the links to My Account show up on the site-map?<br />Note: Spiders will try to index this page, and likely should not be sent to secure pages, since there is no benefit in indexing a login page.<br /><br />Default: false', '19', '115', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'Yes\', \'No\'), ');
INSERT INTO `zen_configuration` VALUES ('435', 'Skip 1-prod Categories', 'SKIP_SINGLE_PRODUCT_CATEGORIES', 'True', 'Skip single-product categories<br />If this option is set to True, then if the customer clicks on a link to a category which only contains a single item, then Zen Cart will take them directly to that product-page, rather than present them with another link to click in order to see the product.<br />Default: True', '19', '120', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('436', 'Use split-login page', 'USE_SPLIT_LOGIN_MODE', 'False', 'The login page can be displayed in two modes: Split or Vertical.<br />In Split mode, the create-account options are accessed by clicking a button to get to the create-account page.  In Vertical mode, the create-account input fields are all displayed inline, below the login field, making one less click for the customer to create their account.<br />Default: False', '19', '121', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `zen_configuration` VALUES ('437', 'CSS Buttons', 'IMAGE_USE_CSS_BUTTONS', 'No', 'CSS Buttons<br />Use CSS buttons instead of images (GIF/JPG)?<br />Button styles must be configured in the stylesheet if you enable this option.', '19', '147', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'No\', \'Yes\'), ');
INSERT INTO `zen_configuration` VALUES ('438', '<strong>Down for Maintenance: ON/OFF</strong>', 'DOWN_FOR_MAINTENANCE', 'false', 'Down for Maintenance <br />(true=on false=off)', '20', '1', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('439', 'Down for Maintenance: filename', 'DOWN_FOR_MAINTENANCE_FILENAME', 'down_for_maintenance', 'Down for Maintenance filename<br />Note: Do not include the extension<br />Default=down_for_maintenance', '20', '2', null, '2013-05-20 08:49:15', null, '');
INSERT INTO `zen_configuration` VALUES ('440', 'Down for Maintenance: Hide Header', 'DOWN_FOR_MAINTENANCE_HEADER_OFF', 'false', 'Down for Maintenance: Hide Header <br />(true=hide false=show)', '20', '3', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('441', 'Down for Maintenance: Hide Column Left', 'DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'false', 'Down for Maintenance: Hide Column Left <br />(true=hide false=show)', '20', '4', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('442', 'Down for Maintenance: Hide Column Right', 'DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'false', 'Down for Maintenance: Hide Column Right <br />(true=hide false=show)', '20', '5', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('443', 'Down for Maintenance: Hide Footer', 'DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'false', 'Down for Maintenance: Hide Footer <br />(true=hide false=show)', '20', '6', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('444', 'Down for Maintenance: Hide Prices', 'DOWN_FOR_MAINTENANCE_PRICES_OFF', 'false', 'Down for Maintenance: Hide Prices <br />(true=hide false=show)', '20', '7', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('445', 'Down For Maintenance (exclude this IP-Address)', 'EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', 'your IP (ADMIN)', 'This IP Address is able to access the website while it is Down For Maintenance (like webmaster)<br />To enter multiple IP Addresses, separate with a comma. If you do not know your IP Address, check in the Footer of your Shop.', '20', '8', '2003-03-21 13:43:22', '2003-03-21 21:20:07', null, null);
INSERT INTO `zen_configuration` VALUES ('446', 'NOTICE PUBLIC Before going Down for Maintenance: ON/OFF', 'WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'false', 'Give a WARNING some time before you put your website Down for Maintenance<br />(true=on false=off)<br />If you set the \'Down For Maintenance: ON/OFF\' to true this will automaticly be updated to false', '20', '9', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('447', 'Date and hours for notice before maintenance', 'PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '15/05/2003  2-3 PM', 'Date and hours for notice before maintenance website, enter date and hours for maintenance website', '20', '10', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, null);
INSERT INTO `zen_configuration` VALUES ('448', 'Display when webmaster has enabled maintenance', 'DISPLAY_MAINTENANCE_TIME', 'false', 'Display when Webmaster has enabled maintenance <br />(true=on false=off)<br />', '20', '11', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('449', 'Display website maintenance period', 'DISPLAY_MAINTENANCE_PERIOD', 'false', 'Display Website maintenance period <br />(true=on false=off)<br />', '20', '12', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `zen_configuration` VALUES ('450', 'Website maintenance period', 'TEXT_MAINTENANCE_PERIOD_TIME', '2h00', 'Enter Website Maintenance period (hh:mm)', '20', '13', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, null);
INSERT INTO `zen_configuration` VALUES ('451', 'Confirm Terms and Conditions During Checkout Procedure', 'DISPLAY_CONDITIONS_ON_CHECKOUT', 'false', 'Show the Terms and Conditions during the checkout procedure which the customer must agree to.', '11', '1', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('452', 'Confirm Privacy Notice During Account Creation Procedure', 'DISPLAY_PRIVACY_CONDITIONS', 'false', 'Show the Privacy Notice during the account creation procedure which the customer must agree to.', '11', '2', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `zen_configuration` VALUES ('453', 'Display Product Image', 'PRODUCT_NEW_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '21', '1', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('454', 'Display Product Quantity', 'PRODUCT_NEW_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '21', '2', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('455', 'Display Product Buy Now Button', 'PRODUCT_NEW_BUY_NOW', '1300', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '21', '3', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('456', 'Display Product Name', 'PRODUCT_NEW_LIST_NAME', '2101', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '21', '4', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('457', 'Display Product Model', 'PRODUCT_NEW_LIST_MODEL', '2201', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '21', '5', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('458', 'Display Product Manufacturer Name', 'PRODUCT_NEW_LIST_MANUFACTURER', '2302', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '21', '6', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('459', 'Display Product Price', 'PRODUCT_NEW_LIST_PRICE', '2402', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '21', '7', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('460', 'Display Product Weight', 'PRODUCT_NEW_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '21', '8', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('461', 'Display Product Date Added', 'PRODUCT_NEW_LIST_DATE_ADDED', '2601', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '21', '9', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('462', 'Display Product Description', 'PRODUCT_NEW_LIST_DESCRIPTION', '150', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', '21', '10', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('463', 'Display Product Display - Default Sort Order', 'PRODUCT_NEW_LIST_SORT_DEFAULT', '6', 'What Sort Order Default should be used for New Products Display?<br />Default= 6 for Date New to Old<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', '21', '11', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ');
INSERT INTO `zen_configuration` VALUES ('464', 'Default Products New Group ID', 'PRODUCT_NEW_LIST_GROUP_ID', '21', 'Warning: Only change this if your Products New Group ID has changed from the default of 21<br />What is the configuration_group_id for New Products Listings?', '21', '12', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('465', 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', '21', '25', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('466', 'Mask Upcoming Products from being include as New Products', 'SHOW_NEW_PRODUCTS_UPCOMING_MASKED', '0', 'Do you want to mask Upcoming Products from being included as New Products in Listing, Sideboxes and Centerbox?<br />0= off<br />1= on', '21', '30', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('467', 'Display Product Image', 'PRODUCT_FEATURED_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '22', '1', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('468', 'Display Product Quantity', 'PRODUCT_FEATURED_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '22', '2', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('469', 'Display Product Buy Now Button', 'PRODUCT_FEATURED_BUY_NOW', '1300', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '22', '3', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('470', 'Display Product Name', 'PRODUCT_FEATURED_LIST_NAME', '2101', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '22', '4', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('471', 'Display Product Model', 'PRODUCT_FEATURED_LIST_MODEL', '2201', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '22', '5', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('472', 'Display Product Manufacturer Name', 'PRODUCT_FEATURED_LIST_MANUFACTURER', '2302', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '22', '6', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('473', 'Display Product Price', 'PRODUCT_FEATURED_LIST_PRICE', '2402', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '22', '7', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('474', 'Display Product Weight', 'PRODUCT_FEATURED_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '22', '8', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('475', 'Display Product Date Added', 'PRODUCT_FEATURED_LIST_DATE_ADDED', '2601', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '22', '9', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('476', 'Display Product Description', 'PRODUCT_FEATURED_LIST_DESCRIPTION', '150', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', '22', '10', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('477', 'Display Product Display - Default Sort Order', 'PRODUCT_FEATURED_LIST_SORT_DEFAULT', '1', 'What Sort Order Default should be used for Featured Product Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', '22', '11', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ');
INSERT INTO `zen_configuration` VALUES ('478', 'Default Featured Products Group ID', 'PRODUCT_FEATURED_LIST_GROUP_ID', '22', 'Warning: Only change this if your Featured Products Group ID has changed from the default of 22<br />What is the configuration_group_id for Featured Products Listings?', '22', '12', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('479', 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', '22', '25', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('480', 'Display Product Image', 'PRODUCT_ALL_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '23', '1', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('481', 'Display Product Quantity', 'PRODUCT_ALL_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '23', '2', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('482', 'Display Product Buy Now Button', 'PRODUCT_ALL_BUY_NOW', '1300', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '23', '3', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('483', 'Display Product Name', 'PRODUCT_ALL_LIST_NAME', '2101', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '23', '4', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('484', 'Display Product Model', 'PRODUCT_ALL_LIST_MODEL', '2201', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '23', '5', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('485', 'Display Product Manufacturer Name', 'PRODUCT_ALL_LIST_MANUFACTURER', '2302', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '23', '6', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('486', 'Display Product Price', 'PRODUCT_ALL_LIST_PRICE', '2402', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '23', '7', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('487', 'Display Product Weight', 'PRODUCT_ALL_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '23', '8', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('488', 'Display Product Date Added', 'PRODUCT_ALL_LIST_DATE_ADDED', '2601', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', '23', '9', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('489', 'Display Product Description', 'PRODUCT_ALL_LIST_DESCRIPTION', '150', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', '23', '10', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('490', 'Display Product Display - Default Sort Order', 'PRODUCT_ALL_LIST_SORT_DEFAULT', '1', 'What Sort Order Default should be used for All Products Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', '23', '11', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ');
INSERT INTO `zen_configuration` VALUES ('491', 'Default Products All Group ID', 'PRODUCT_ALL_LIST_GROUP_ID', '23', 'Warning: Only change this if your Products All Group ID has changed from the default of 23<br />What is the configuration_group_id for Products All Listings?', '23', '12', null, '2013-05-20 08:49:15', null, null);
INSERT INTO `zen_configuration` VALUES ('492', 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', '23', '25', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `zen_configuration` VALUES ('493', 'Show New Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS', '1', 'Show New Products on Main Page<br />0= off or set the sort order', '24', '65', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('494', 'Show Featured Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page<br />0= off or set the sort order', '24', '66', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('495', 'Show Special Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS', '3', 'Show Special Products on Main Page<br />0= off or set the sort order', '24', '67', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('496', 'Show Upcoming Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_UPCOMING', '4', 'Show Upcoming Products on Main Page<br />0= off or set the sort order', '24', '68', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('497', 'Show New Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS', '1', 'Show New Products on Main Page - Category with SubCategories<br />0= off or set the sort order', '24', '70', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('498', 'Show Featured Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page - Category with SubCategories<br />0= off or set the sort order', '24', '71', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('499', 'Show Special Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS', '3', 'Show Special Products on Main Page - Category with SubCategories<br />0= off or set the sort order', '24', '72', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('500', 'Show Upcoming Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_UPCOMING', '4', 'Show Upcoming Products on Main Page - Category with SubCategories<br />0= off or set the sort order', '24', '73', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('501', 'Show New Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS', '1', 'Show New Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', '24', '75', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('502', 'Show Featured Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', '24', '76', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('503', 'Show Special Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS', '3', 'Show Special Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', '24', '77', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('504', 'Show Upcoming Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_UPCOMING', '4', 'Show Upcoming Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', '24', '78', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('505', 'Show New Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS', '1', 'Show New Products below Product Listing<br />0= off or set the sort order', '24', '85', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('506', 'Show Featured Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS', '2', 'Show Featured Products below Product Listing<br />0= off or set the sort order', '24', '86', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('507', 'Show Special Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS', '3', 'Show Special Products below Product Listing<br />0= off or set the sort order', '24', '87', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('508', 'Show Upcoming Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING', '4', 'Show Upcoming Products below Product Listing<br />0= off or set the sort order', '24', '88', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `zen_configuration` VALUES ('509', 'New Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS', '3', 'New Products Columns per Row', '24', '95', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO `zen_configuration` VALUES ('510', 'Featured Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS', '3', 'Featured Products Columns per Row', '24', '96', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO `zen_configuration` VALUES ('511', 'Special Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS', '3', 'Special Products Columns per Row', '24', '97', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO `zen_configuration` VALUES ('512', 'Filter Product Listing for Current Top Level Category When Enabled', 'SHOW_PRODUCT_INFO_ALL_PRODUCTS', '1', 'Filter the products when Product Listing is enabled for current Main Category or show products from all categories?<br />0= Filter Off 1=Filter On ', '24', '100', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `zen_configuration` VALUES ('513', 'Define Main Page Status', 'DEFINE_MAIN_PAGE_STATUS', '1', 'Enable the Defined Main Page Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '60', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('514', 'Define Contact Us Status', 'DEFINE_CONTACT_US_STATUS', '1', 'Enable the Defined Contact Us Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '61', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('515', 'Define Privacy Status', 'DEFINE_PRIVACY_STATUS', '1', 'Enable the Defined Privacy Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '62', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('516', 'Define Shipping & Returns', 'DEFINE_SHIPPINGINFO_STATUS', '1', 'Enable the Defined Shipping & Returns Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '63', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('517', 'Define Conditions of Use', 'DEFINE_CONDITIONS_STATUS', '1', 'Enable the Defined Conditions of Use Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '64', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('518', 'Define Checkout Success', 'DEFINE_CHECKOUT_SUCCESS_STATUS', '1', 'Enable the Defined Checkout Success Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '65', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('519', 'Define Discount Coupon', 'DEFINE_DISCOUNT_COUPON_STATUS', '1', 'Enable the Defined Discount Coupon Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '66', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('520', 'Define Site Map Status', 'DEFINE_SITE_MAP_STATUS', '1', 'Enable the Defined Site Map Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '67', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('521', 'Define Page-Not-Found Status', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', 'Enable the Defined Page-Not-Found Text from define-pages?<br />0= Define Text OFF<br />1= Define Text ON', '25', '67', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('522', 'Define Page 2', 'DEFINE_PAGE_2_STATUS', '1', 'Enable the Defined Page 2 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '82', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('523', 'Define Page 3', 'DEFINE_PAGE_3_STATUS', '1', 'Enable the Defined Page 3 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '83', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('524', 'Define Page 4', 'DEFINE_PAGE_4_STATUS', '1', 'Enable the Defined Page 4 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', '25', '84', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `zen_configuration` VALUES ('525', 'EZ-Pages Display Status - HeaderBar', 'EZPAGES_STATUS_HEADER', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Header Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', '30', '10', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('526', 'EZ-Pages Display Status - FooterBar', 'EZPAGES_STATUS_FOOTER', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Footer Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', '30', '11', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('527', 'EZ-Pages Display Status - Sidebox', 'EZPAGES_STATUS_SIDEBOX', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Sidebox<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', '30', '12', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('528', 'EZ-Pages Header Link Separator', 'EZPAGES_SEPARATOR_HEADER', '&nbsp;::&nbsp;', 'EZ-Pages Header Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;', '30', '20', null, '2013-05-20 08:49:15', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('529', 'EZ-Pages Footer Link Separator', 'EZPAGES_SEPARATOR_FOOTER', '&nbsp;::&nbsp;', 'EZ-Pages Footer Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;', '30', '21', null, '2013-05-20 08:49:15', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('530', 'EZ-Pages Prev/Next Buttons', 'EZPAGES_SHOW_PREV_NEXT_BUTTONS', '2', 'Display Prev/Continue/Next buttons on EZ-Pages pages?<br />0=OFF (no buttons)<br />1=\"Continue\"<br />2=\"Prev/Continue/Next\"<br /><br />Default setting: 2.', '30', '30', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `zen_configuration` VALUES ('531', 'EZ-Pages Table of Contents for Chapters Status', 'EZPAGES_SHOW_TABLE_CONTENTS', '1', 'Enable EZ-Pages Table of Contents for Chapters?<br />0= OFF<br />1= ON', '30', '35', '2013-05-20 08:49:15', '2013-05-20 08:49:15', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `zen_configuration` VALUES ('532', 'EZ-Pages Pages to disable headers', 'EZPAGES_DISABLE_HEADER_DISPLAY_LIST', '', 'EZ-Pages \"pages\" on which to NOT display the normal \"header\" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 1,5,2<br />or leave blank.', '30', '40', null, '2013-05-20 08:49:15', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('533', 'EZ-Pages Pages to disable footers', 'EZPAGES_DISABLE_FOOTER_DISPLAY_LIST', '', 'EZ-Pages \"pages\" on which to NOT display the normal \"footer\" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,7<br />or leave blank.', '30', '41', null, '2013-05-20 08:49:15', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('534', 'EZ-Pages Pages to disable left-column', 'EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages \"pages\" on which to NOT display the normal \"left\" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 21<br />or leave blank.', '30', '42', null, '2013-05-20 08:49:15', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('535', 'EZ-Pages Pages to disable right-column', 'EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages \"pages\" on which to NOT display the normal \"right\" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,82,13<br />or leave blank.', '30', '43', null, '2013-05-20 08:49:15', null, 'zen_cfg_textarea_small(');
INSERT INTO `zen_configuration` VALUES ('536', 'Convert currencies for Text emails', 'CURRENCIES_TRANSLATIONS', '', 'What currency conversions do you need for Text emails?<br />Example = &amp;pound;,&pound;:&amp;euro;,&euro;', '12', '120', null, '2003-11-21 00:00:00', null, 'zen_cfg_textarea_small(');

-- ----------------------------
-- Table structure for `zen_configuration_group`
-- ----------------------------
DROP TABLE IF EXISTS `zen_configuration_group`;
CREATE TABLE `zen_configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`),
  KEY `idx_visible_zen` (`visible`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_configuration_group
-- ----------------------------
INSERT INTO `zen_configuration_group` VALUES ('1', 'My Store', 'General information about my store', '1', '1');
INSERT INTO `zen_configuration_group` VALUES ('2', 'Minimum Values', 'The minimum values for functions / data', '2', '1');
INSERT INTO `zen_configuration_group` VALUES ('3', 'Maximum Values', 'The maximum values for functions / data', '3', '1');
INSERT INTO `zen_configuration_group` VALUES ('4', 'Images', 'Image parameters', '4', '1');
INSERT INTO `zen_configuration_group` VALUES ('5', 'Customer Details', 'Customer account configuration', '5', '1');
INSERT INTO `zen_configuration_group` VALUES ('6', 'Module Options', 'Hidden from configuration', '6', '0');
INSERT INTO `zen_configuration_group` VALUES ('7', 'Shipping/Packaging', 'Shipping options available at my store', '7', '1');
INSERT INTO `zen_configuration_group` VALUES ('8', 'Product Listing', 'Product Listing configuration options', '8', '1');
INSERT INTO `zen_configuration_group` VALUES ('9', 'Stock', 'Stock configuration options', '9', '1');
INSERT INTO `zen_configuration_group` VALUES ('10', 'Logging', 'Logging configuration options', '10', '1');
INSERT INTO `zen_configuration_group` VALUES ('11', 'Regulations', 'Regulation options', '16', '1');
INSERT INTO `zen_configuration_group` VALUES ('12', 'E-Mail Options', 'General settings for E-Mail transport and HTML E-Mails', '12', '1');
INSERT INTO `zen_configuration_group` VALUES ('13', 'Attribute Settings', 'Configure products attributes settings', '13', '1');
INSERT INTO `zen_configuration_group` VALUES ('14', 'GZip Compression', 'GZip compression options', '14', '1');
INSERT INTO `zen_configuration_group` VALUES ('15', 'Sessions', 'Session options', '15', '1');
INSERT INTO `zen_configuration_group` VALUES ('16', 'GV Coupons', 'Gift Vouchers and Coupons', '16', '1');
INSERT INTO `zen_configuration_group` VALUES ('17', 'Credit Cards', 'Credit Cards Accepted', '17', '1');
INSERT INTO `zen_configuration_group` VALUES ('18', 'Product Info', 'Product Info Display Options', '18', '1');
INSERT INTO `zen_configuration_group` VALUES ('19', 'Layout Settings', 'Layout Options', '19', '1');
INSERT INTO `zen_configuration_group` VALUES ('20', 'Website Maintenance', 'Website Maintenance Options', '20', '1');
INSERT INTO `zen_configuration_group` VALUES ('21', 'New Listing', 'New Products Listing', '21', '1');
INSERT INTO `zen_configuration_group` VALUES ('22', 'Featured Listing', 'Featured Products Listing', '22', '1');
INSERT INTO `zen_configuration_group` VALUES ('23', 'All Listing', 'All Products Listing', '23', '1');
INSERT INTO `zen_configuration_group` VALUES ('24', 'Index Listing', 'Index Products Listing', '24', '1');
INSERT INTO `zen_configuration_group` VALUES ('25', 'Define Page Status', 'Define Main Pages and HTMLArea Options', '25', '1');
INSERT INTO `zen_configuration_group` VALUES ('30', 'EZ-Pages Settings', 'EZ-Pages Settings', '30', '1');

-- ----------------------------
-- Table structure for `zen_counter`
-- ----------------------------
DROP TABLE IF EXISTS `zen_counter`;
CREATE TABLE `zen_counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_counter
-- ----------------------------
INSERT INTO `zen_counter` VALUES ('20130520', '1');

-- ----------------------------
-- Table structure for `zen_counter_history`
-- ----------------------------
DROP TABLE IF EXISTS `zen_counter_history`;
CREATE TABLE `zen_counter_history` (
  `startdate` char(8) NOT NULL DEFAULT '',
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL,
  PRIMARY KEY (`startdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_counter_history
-- ----------------------------
INSERT INTO `zen_counter_history` VALUES ('20130520', '1', '1');

-- ----------------------------
-- Table structure for `zen_countries`
-- ----------------------------
DROP TABLE IF EXISTS `zen_countries`;
CREATE TABLE `zen_countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`countries_id`),
  KEY `idx_countries_name_zen` (`countries_name`),
  KEY `idx_address_format_id_zen` (`address_format_id`),
  KEY `idx_iso_2_zen` (`countries_iso_code_2`),
  KEY `idx_iso_3_zen` (`countries_iso_code_3`)
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_countries
-- ----------------------------
INSERT INTO `zen_countries` VALUES ('240', 'Aaland Islands', 'AX', 'ALA', '1');
INSERT INTO `zen_countries` VALUES ('1', 'Afghanistan', 'AF', 'AFG', '1');
INSERT INTO `zen_countries` VALUES ('2', 'Albania', 'AL', 'ALB', '1');
INSERT INTO `zen_countries` VALUES ('3', 'Algeria', 'DZ', 'DZA', '1');
INSERT INTO `zen_countries` VALUES ('4', 'American Samoa', 'AS', 'ASM', '1');
INSERT INTO `zen_countries` VALUES ('5', 'Andorra', 'AD', 'AND', '1');
INSERT INTO `zen_countries` VALUES ('6', 'Angola', 'AO', 'AGO', '1');
INSERT INTO `zen_countries` VALUES ('7', 'Anguilla', 'AI', 'AIA', '1');
INSERT INTO `zen_countries` VALUES ('8', 'Antarctica', 'AQ', 'ATA', '1');
INSERT INTO `zen_countries` VALUES ('9', 'Antigua and Barbuda', 'AG', 'ATG', '1');
INSERT INTO `zen_countries` VALUES ('10', 'Argentina', 'AR', 'ARG', '1');
INSERT INTO `zen_countries` VALUES ('11', 'Armenia', 'AM', 'ARM', '1');
INSERT INTO `zen_countries` VALUES ('12', 'Aruba', 'AW', 'ABW', '1');
INSERT INTO `zen_countries` VALUES ('13', 'Australia', 'AU', 'AUS', '1');
INSERT INTO `zen_countries` VALUES ('14', 'Austria', 'AT', 'AUT', '5');
INSERT INTO `zen_countries` VALUES ('15', 'Azerbaijan', 'AZ', 'AZE', '1');
INSERT INTO `zen_countries` VALUES ('16', 'Bahamas', 'BS', 'BHS', '1');
INSERT INTO `zen_countries` VALUES ('17', 'Bahrain', 'BH', 'BHR', '1');
INSERT INTO `zen_countries` VALUES ('18', 'Bangladesh', 'BD', 'BGD', '1');
INSERT INTO `zen_countries` VALUES ('19', 'Barbados', 'BB', 'BRB', '1');
INSERT INTO `zen_countries` VALUES ('20', 'Belarus', 'BY', 'BLR', '1');
INSERT INTO `zen_countries` VALUES ('21', 'Belgium', 'BE', 'BEL', '1');
INSERT INTO `zen_countries` VALUES ('22', 'Belize', 'BZ', 'BLZ', '1');
INSERT INTO `zen_countries` VALUES ('23', 'Benin', 'BJ', 'BEN', '1');
INSERT INTO `zen_countries` VALUES ('24', 'Bermuda', 'BM', 'BMU', '1');
INSERT INTO `zen_countries` VALUES ('25', 'Bhutan', 'BT', 'BTN', '1');
INSERT INTO `zen_countries` VALUES ('26', 'Bolivia', 'BO', 'BOL', '1');
INSERT INTO `zen_countries` VALUES ('27', 'Bosnia and Herzegowina', 'BA', 'BIH', '1');
INSERT INTO `zen_countries` VALUES ('28', 'Botswana', 'BW', 'BWA', '1');
INSERT INTO `zen_countries` VALUES ('29', 'Bouvet Island', 'BV', 'BVT', '1');
INSERT INTO `zen_countries` VALUES ('30', 'Brazil', 'BR', 'BRA', '1');
INSERT INTO `zen_countries` VALUES ('31', 'British Indian Ocean Territory', 'IO', 'IOT', '1');
INSERT INTO `zen_countries` VALUES ('32', 'Brunei Darussalam', 'BN', 'BRN', '1');
INSERT INTO `zen_countries` VALUES ('33', 'Bulgaria', 'BG', 'BGR', '1');
INSERT INTO `zen_countries` VALUES ('34', 'Burkina Faso', 'BF', 'BFA', '1');
INSERT INTO `zen_countries` VALUES ('35', 'Burundi', 'BI', 'BDI', '1');
INSERT INTO `zen_countries` VALUES ('36', 'Cambodia', 'KH', 'KHM', '1');
INSERT INTO `zen_countries` VALUES ('37', 'Cameroon', 'CM', 'CMR', '1');
INSERT INTO `zen_countries` VALUES ('38', 'Canada', 'CA', 'CAN', '2');
INSERT INTO `zen_countries` VALUES ('39', 'Cape Verde', 'CV', 'CPV', '1');
INSERT INTO `zen_countries` VALUES ('40', 'Cayman Islands', 'KY', 'CYM', '1');
INSERT INTO `zen_countries` VALUES ('41', 'Central African Republic', 'CF', 'CAF', '1');
INSERT INTO `zen_countries` VALUES ('42', 'Chad', 'TD', 'TCD', '1');
INSERT INTO `zen_countries` VALUES ('43', 'Chile', 'CL', 'CHL', '1');
INSERT INTO `zen_countries` VALUES ('44', 'China', 'CN', 'CHN', '1');
INSERT INTO `zen_countries` VALUES ('45', 'Christmas Island', 'CX', 'CXR', '1');
INSERT INTO `zen_countries` VALUES ('46', 'Cocos (Keeling) Islands', 'CC', 'CCK', '1');
INSERT INTO `zen_countries` VALUES ('47', 'Colombia', 'CO', 'COL', '1');
INSERT INTO `zen_countries` VALUES ('48', 'Comoros', 'KM', 'COM', '1');
INSERT INTO `zen_countries` VALUES ('49', 'Congo', 'CG', 'COG', '1');
INSERT INTO `zen_countries` VALUES ('50', 'Cook Islands', 'CK', 'COK', '1');
INSERT INTO `zen_countries` VALUES ('51', 'Costa Rica', 'CR', 'CRI', '1');
INSERT INTO `zen_countries` VALUES ('52', 'Cote D\'Ivoire', 'CI', 'CIV', '1');
INSERT INTO `zen_countries` VALUES ('53', 'Croatia', 'HR', 'HRV', '1');
INSERT INTO `zen_countries` VALUES ('54', 'Cuba', 'CU', 'CUB', '1');
INSERT INTO `zen_countries` VALUES ('55', 'Cyprus', 'CY', 'CYP', '1');
INSERT INTO `zen_countries` VALUES ('56', 'Czech Republic', 'CZ', 'CZE', '1');
INSERT INTO `zen_countries` VALUES ('57', 'Denmark', 'DK', 'DNK', '1');
INSERT INTO `zen_countries` VALUES ('58', 'Djibouti', 'DJ', 'DJI', '1');
INSERT INTO `zen_countries` VALUES ('59', 'Dominica', 'DM', 'DMA', '1');
INSERT INTO `zen_countries` VALUES ('60', 'Dominican Republic', 'DO', 'DOM', '1');
INSERT INTO `zen_countries` VALUES ('61', 'Timor-Leste', 'TL', 'TLS', '1');
INSERT INTO `zen_countries` VALUES ('62', 'Ecuador', 'EC', 'ECU', '1');
INSERT INTO `zen_countries` VALUES ('63', 'Egypt', 'EG', 'EGY', '1');
INSERT INTO `zen_countries` VALUES ('64', 'El Salvador', 'SV', 'SLV', '1');
INSERT INTO `zen_countries` VALUES ('65', 'Equatorial Guinea', 'GQ', 'GNQ', '1');
INSERT INTO `zen_countries` VALUES ('66', 'Eritrea', 'ER', 'ERI', '1');
INSERT INTO `zen_countries` VALUES ('67', 'Estonia', 'EE', 'EST', '1');
INSERT INTO `zen_countries` VALUES ('68', 'Ethiopia', 'ET', 'ETH', '1');
INSERT INTO `zen_countries` VALUES ('69', 'Falkland Islands (Malvinas)', 'FK', 'FLK', '1');
INSERT INTO `zen_countries` VALUES ('70', 'Faroe Islands', 'FO', 'FRO', '1');
INSERT INTO `zen_countries` VALUES ('71', 'Fiji', 'FJ', 'FJI', '1');
INSERT INTO `zen_countries` VALUES ('72', 'Finland', 'FI', 'FIN', '1');
INSERT INTO `zen_countries` VALUES ('73', 'France', 'FR', 'FRA', '1');
INSERT INTO `zen_countries` VALUES ('75', 'French Guiana', 'GF', 'GUF', '1');
INSERT INTO `zen_countries` VALUES ('76', 'French Polynesia', 'PF', 'PYF', '1');
INSERT INTO `zen_countries` VALUES ('77', 'French Southern Territories', 'TF', 'ATF', '1');
INSERT INTO `zen_countries` VALUES ('78', 'Gabon', 'GA', 'GAB', '1');
INSERT INTO `zen_countries` VALUES ('79', 'Gambia', 'GM', 'GMB', '1');
INSERT INTO `zen_countries` VALUES ('80', 'Georgia', 'GE', 'GEO', '1');
INSERT INTO `zen_countries` VALUES ('81', 'Germany', 'DE', 'DEU', '5');
INSERT INTO `zen_countries` VALUES ('82', 'Ghana', 'GH', 'GHA', '1');
INSERT INTO `zen_countries` VALUES ('83', 'Gibraltar', 'GI', 'GIB', '1');
INSERT INTO `zen_countries` VALUES ('84', 'Greece', 'GR', 'GRC', '1');
INSERT INTO `zen_countries` VALUES ('85', 'Greenland', 'GL', 'GRL', '1');
INSERT INTO `zen_countries` VALUES ('86', 'Grenada', 'GD', 'GRD', '1');
INSERT INTO `zen_countries` VALUES ('87', 'Guadeloupe', 'GP', 'GLP', '1');
INSERT INTO `zen_countries` VALUES ('88', 'Guam', 'GU', 'GUM', '1');
INSERT INTO `zen_countries` VALUES ('89', 'Guatemala', 'GT', 'GTM', '1');
INSERT INTO `zen_countries` VALUES ('90', 'Guinea', 'GN', 'GIN', '1');
INSERT INTO `zen_countries` VALUES ('91', 'Guinea-bissau', 'GW', 'GNB', '1');
INSERT INTO `zen_countries` VALUES ('92', 'Guyana', 'GY', 'GUY', '1');
INSERT INTO `zen_countries` VALUES ('93', 'Haiti', 'HT', 'HTI', '1');
INSERT INTO `zen_countries` VALUES ('94', 'Heard and Mc Donald Islands', 'HM', 'HMD', '1');
INSERT INTO `zen_countries` VALUES ('95', 'Honduras', 'HN', 'HND', '1');
INSERT INTO `zen_countries` VALUES ('96', 'Hong Kong', 'HK', 'HKG', '1');
INSERT INTO `zen_countries` VALUES ('97', 'Hungary', 'HU', 'HUN', '1');
INSERT INTO `zen_countries` VALUES ('98', 'Iceland', 'IS', 'ISL', '1');
INSERT INTO `zen_countries` VALUES ('99', 'India', 'IN', 'IND', '1');
INSERT INTO `zen_countries` VALUES ('100', 'Indonesia', 'ID', 'IDN', '1');
INSERT INTO `zen_countries` VALUES ('101', 'Iran (Islamic Republic of)', 'IR', 'IRN', '1');
INSERT INTO `zen_countries` VALUES ('102', 'Iraq', 'IQ', 'IRQ', '1');
INSERT INTO `zen_countries` VALUES ('103', 'Ireland', 'IE', 'IRL', '1');
INSERT INTO `zen_countries` VALUES ('104', 'Israel', 'IL', 'ISR', '1');
INSERT INTO `zen_countries` VALUES ('105', 'Italy', 'IT', 'ITA', '1');
INSERT INTO `zen_countries` VALUES ('106', 'Jamaica', 'JM', 'JAM', '1');
INSERT INTO `zen_countries` VALUES ('107', 'Japan', 'JP', 'JPN', '1');
INSERT INTO `zen_countries` VALUES ('108', 'Jordan', 'JO', 'JOR', '1');
INSERT INTO `zen_countries` VALUES ('109', 'Kazakhstan', 'KZ', 'KAZ', '1');
INSERT INTO `zen_countries` VALUES ('110', 'Kenya', 'KE', 'KEN', '1');
INSERT INTO `zen_countries` VALUES ('111', 'Kiribati', 'KI', 'KIR', '1');
INSERT INTO `zen_countries` VALUES ('112', 'Korea, Democratic People\'s Republic of', 'KP', 'PRK', '1');
INSERT INTO `zen_countries` VALUES ('113', 'Korea, Republic of', 'KR', 'KOR', '1');
INSERT INTO `zen_countries` VALUES ('114', 'Kuwait', 'KW', 'KWT', '1');
INSERT INTO `zen_countries` VALUES ('115', 'Kyrgyzstan', 'KG', 'KGZ', '1');
INSERT INTO `zen_countries` VALUES ('116', 'Lao People\'s Democratic Republic', 'LA', 'LAO', '1');
INSERT INTO `zen_countries` VALUES ('117', 'Latvia', 'LV', 'LVA', '1');
INSERT INTO `zen_countries` VALUES ('118', 'Lebanon', 'LB', 'LBN', '1');
INSERT INTO `zen_countries` VALUES ('119', 'Lesotho', 'LS', 'LSO', '1');
INSERT INTO `zen_countries` VALUES ('120', 'Liberia', 'LR', 'LBR', '1');
INSERT INTO `zen_countries` VALUES ('121', 'Libyan Arab Jamahiriya', 'LY', 'LBY', '1');
INSERT INTO `zen_countries` VALUES ('122', 'Liechtenstein', 'LI', 'LIE', '1');
INSERT INTO `zen_countries` VALUES ('123', 'Lithuania', 'LT', 'LTU', '1');
INSERT INTO `zen_countries` VALUES ('124', 'Luxembourg', 'LU', 'LUX', '1');
INSERT INTO `zen_countries` VALUES ('125', 'Macao', 'MO', 'MAC', '1');
INSERT INTO `zen_countries` VALUES ('126', 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', '1');
INSERT INTO `zen_countries` VALUES ('127', 'Madagascar', 'MG', 'MDG', '1');
INSERT INTO `zen_countries` VALUES ('128', 'Malawi', 'MW', 'MWI', '1');
INSERT INTO `zen_countries` VALUES ('129', 'Malaysia', 'MY', 'MYS', '1');
INSERT INTO `zen_countries` VALUES ('130', 'Maldives', 'MV', 'MDV', '1');
INSERT INTO `zen_countries` VALUES ('131', 'Mali', 'ML', 'MLI', '1');
INSERT INTO `zen_countries` VALUES ('132', 'Malta', 'MT', 'MLT', '1');
INSERT INTO `zen_countries` VALUES ('133', 'Marshall Islands', 'MH', 'MHL', '1');
INSERT INTO `zen_countries` VALUES ('134', 'Martinique', 'MQ', 'MTQ', '1');
INSERT INTO `zen_countries` VALUES ('135', 'Mauritania', 'MR', 'MRT', '1');
INSERT INTO `zen_countries` VALUES ('136', 'Mauritius', 'MU', 'MUS', '1');
INSERT INTO `zen_countries` VALUES ('137', 'Mayotte', 'YT', 'MYT', '1');
INSERT INTO `zen_countries` VALUES ('138', 'Mexico', 'MX', 'MEX', '1');
INSERT INTO `zen_countries` VALUES ('139', 'Micronesia, Federated States of', 'FM', 'FSM', '1');
INSERT INTO `zen_countries` VALUES ('140', 'Moldova', 'MD', 'MDA', '1');
INSERT INTO `zen_countries` VALUES ('141', 'Monaco', 'MC', 'MCO', '1');
INSERT INTO `zen_countries` VALUES ('142', 'Mongolia', 'MN', 'MNG', '1');
INSERT INTO `zen_countries` VALUES ('143', 'Montserrat', 'MS', 'MSR', '1');
INSERT INTO `zen_countries` VALUES ('144', 'Morocco', 'MA', 'MAR', '1');
INSERT INTO `zen_countries` VALUES ('145', 'Mozambique', 'MZ', 'MOZ', '1');
INSERT INTO `zen_countries` VALUES ('146', 'Myanmar', 'MM', 'MMR', '1');
INSERT INTO `zen_countries` VALUES ('147', 'Namibia', 'NA', 'NAM', '1');
INSERT INTO `zen_countries` VALUES ('148', 'Nauru', 'NR', 'NRU', '1');
INSERT INTO `zen_countries` VALUES ('149', 'Nepal', 'NP', 'NPL', '1');
INSERT INTO `zen_countries` VALUES ('150', 'Netherlands', 'NL', 'NLD', '1');
INSERT INTO `zen_countries` VALUES ('151', 'Netherlands Antilles', 'AN', 'ANT', '1');
INSERT INTO `zen_countries` VALUES ('152', 'New Caledonia', 'NC', 'NCL', '1');
INSERT INTO `zen_countries` VALUES ('153', 'New Zealand', 'NZ', 'NZL', '1');
INSERT INTO `zen_countries` VALUES ('154', 'Nicaragua', 'NI', 'NIC', '1');
INSERT INTO `zen_countries` VALUES ('155', 'Niger', 'NE', 'NER', '1');
INSERT INTO `zen_countries` VALUES ('156', 'Nigeria', 'NG', 'NGA', '1');
INSERT INTO `zen_countries` VALUES ('157', 'Niue', 'NU', 'NIU', '1');
INSERT INTO `zen_countries` VALUES ('158', 'Norfolk Island', 'NF', 'NFK', '1');
INSERT INTO `zen_countries` VALUES ('159', 'Northern Mariana Islands', 'MP', 'MNP', '1');
INSERT INTO `zen_countries` VALUES ('160', 'Norway', 'NO', 'NOR', '1');
INSERT INTO `zen_countries` VALUES ('161', 'Oman', 'OM', 'OMN', '1');
INSERT INTO `zen_countries` VALUES ('162', 'Pakistan', 'PK', 'PAK', '1');
INSERT INTO `zen_countries` VALUES ('163', 'Palau', 'PW', 'PLW', '1');
INSERT INTO `zen_countries` VALUES ('164', 'Panama', 'PA', 'PAN', '1');
INSERT INTO `zen_countries` VALUES ('165', 'Papua New Guinea', 'PG', 'PNG', '1');
INSERT INTO `zen_countries` VALUES ('166', 'Paraguay', 'PY', 'PRY', '1');
INSERT INTO `zen_countries` VALUES ('167', 'Peru', 'PE', 'PER', '1');
INSERT INTO `zen_countries` VALUES ('168', 'Philippines', 'PH', 'PHL', '1');
INSERT INTO `zen_countries` VALUES ('169', 'Pitcairn', 'PN', 'PCN', '1');
INSERT INTO `zen_countries` VALUES ('170', 'Poland', 'PL', 'POL', '1');
INSERT INTO `zen_countries` VALUES ('171', 'Portugal', 'PT', 'PRT', '1');
INSERT INTO `zen_countries` VALUES ('172', 'Puerto Rico', 'PR', 'PRI', '1');
INSERT INTO `zen_countries` VALUES ('173', 'Qatar', 'QA', 'QAT', '1');
INSERT INTO `zen_countries` VALUES ('174', 'Reunion', 'RE', 'REU', '1');
INSERT INTO `zen_countries` VALUES ('175', 'Romania', 'RO', 'ROU', '1');
INSERT INTO `zen_countries` VALUES ('176', 'Russian Federation', 'RU', 'RUS', '1');
INSERT INTO `zen_countries` VALUES ('177', 'Rwanda', 'RW', 'RWA', '1');
INSERT INTO `zen_countries` VALUES ('178', 'Saint Kitts and Nevis', 'KN', 'KNA', '1');
INSERT INTO `zen_countries` VALUES ('179', 'Saint Lucia', 'LC', 'LCA', '1');
INSERT INTO `zen_countries` VALUES ('180', 'Saint Vincent and the Grenadines', 'VC', 'VCT', '1');
INSERT INTO `zen_countries` VALUES ('181', 'Samoa', 'WS', 'WSM', '1');
INSERT INTO `zen_countries` VALUES ('182', 'San Marino', 'SM', 'SMR', '1');
INSERT INTO `zen_countries` VALUES ('183', 'Sao Tome and Principe', 'ST', 'STP', '1');
INSERT INTO `zen_countries` VALUES ('184', 'Saudi Arabia', 'SA', 'SAU', '1');
INSERT INTO `zen_countries` VALUES ('185', 'Senegal', 'SN', 'SEN', '1');
INSERT INTO `zen_countries` VALUES ('186', 'Seychelles', 'SC', 'SYC', '1');
INSERT INTO `zen_countries` VALUES ('187', 'Sierra Leone', 'SL', 'SLE', '1');
INSERT INTO `zen_countries` VALUES ('188', 'Singapore', 'SG', 'SGP', '4');
INSERT INTO `zen_countries` VALUES ('189', 'Slovakia (Slovak Republic)', 'SK', 'SVK', '1');
INSERT INTO `zen_countries` VALUES ('190', 'Slovenia', 'SI', 'SVN', '1');
INSERT INTO `zen_countries` VALUES ('191', 'Solomon Islands', 'SB', 'SLB', '1');
INSERT INTO `zen_countries` VALUES ('192', 'Somalia', 'SO', 'SOM', '1');
INSERT INTO `zen_countries` VALUES ('193', 'South Africa', 'ZA', 'ZAF', '1');
INSERT INTO `zen_countries` VALUES ('194', 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', '1');
INSERT INTO `zen_countries` VALUES ('195', 'Spain', 'ES', 'ESP', '3');
INSERT INTO `zen_countries` VALUES ('196', 'Sri Lanka', 'LK', 'LKA', '1');
INSERT INTO `zen_countries` VALUES ('197', 'St. Helena', 'SH', 'SHN', '1');
INSERT INTO `zen_countries` VALUES ('198', 'St. Pierre and Miquelon', 'PM', 'SPM', '1');
INSERT INTO `zen_countries` VALUES ('199', 'Sudan', 'SD', 'SDN', '1');
INSERT INTO `zen_countries` VALUES ('200', 'Suriname', 'SR', 'SUR', '1');
INSERT INTO `zen_countries` VALUES ('201', 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '1');
INSERT INTO `zen_countries` VALUES ('202', 'Swaziland', 'SZ', 'SWZ', '1');
INSERT INTO `zen_countries` VALUES ('203', 'Sweden', 'SE', 'SWE', '1');
INSERT INTO `zen_countries` VALUES ('204', 'Switzerland', 'CH', 'CHE', '1');
INSERT INTO `zen_countries` VALUES ('205', 'Syrian Arab Republic', 'SY', 'SYR', '1');
INSERT INTO `zen_countries` VALUES ('206', 'Taiwan', 'TW', 'TWN', '1');
INSERT INTO `zen_countries` VALUES ('207', 'Tajikistan', 'TJ', 'TJK', '1');
INSERT INTO `zen_countries` VALUES ('208', 'Tanzania, United Republic of', 'TZ', 'TZA', '1');
INSERT INTO `zen_countries` VALUES ('209', 'Thailand', 'TH', 'THA', '1');
INSERT INTO `zen_countries` VALUES ('210', 'Togo', 'TG', 'TGO', '1');
INSERT INTO `zen_countries` VALUES ('211', 'Tokelau', 'TK', 'TKL', '1');
INSERT INTO `zen_countries` VALUES ('212', 'Tonga', 'TO', 'TON', '1');
INSERT INTO `zen_countries` VALUES ('213', 'Trinidad and Tobago', 'TT', 'TTO', '1');
INSERT INTO `zen_countries` VALUES ('214', 'Tunisia', 'TN', 'TUN', '1');
INSERT INTO `zen_countries` VALUES ('215', 'Turkey', 'TR', 'TUR', '1');
INSERT INTO `zen_countries` VALUES ('216', 'Turkmenistan', 'TM', 'TKM', '1');
INSERT INTO `zen_countries` VALUES ('217', 'Turks and Caicos Islands', 'TC', 'TCA', '1');
INSERT INTO `zen_countries` VALUES ('218', 'Tuvalu', 'TV', 'TUV', '1');
INSERT INTO `zen_countries` VALUES ('219', 'Uganda', 'UG', 'UGA', '1');
INSERT INTO `zen_countries` VALUES ('220', 'Ukraine', 'UA', 'UKR', '1');
INSERT INTO `zen_countries` VALUES ('221', 'United Arab Emirates', 'AE', 'ARE', '1');
INSERT INTO `zen_countries` VALUES ('222', 'United Kingdom', 'GB', 'GBR', '6');
INSERT INTO `zen_countries` VALUES ('223', 'United States', 'US', 'USA', '2');
INSERT INTO `zen_countries` VALUES ('224', 'United States Minor Outlying Islands', 'UM', 'UMI', '1');
INSERT INTO `zen_countries` VALUES ('225', 'Uruguay', 'UY', 'URY', '1');
INSERT INTO `zen_countries` VALUES ('226', 'Uzbekistan', 'UZ', 'UZB', '1');
INSERT INTO `zen_countries` VALUES ('227', 'Vanuatu', 'VU', 'VUT', '1');
INSERT INTO `zen_countries` VALUES ('228', 'Vatican City State (Holy See)', 'VA', 'VAT', '1');
INSERT INTO `zen_countries` VALUES ('229', 'Venezuela', 'VE', 'VEN', '1');
INSERT INTO `zen_countries` VALUES ('230', 'Viet Nam', 'VN', 'VNM', '1');
INSERT INTO `zen_countries` VALUES ('231', 'Virgin Islands (British)', 'VG', 'VGB', '1');
INSERT INTO `zen_countries` VALUES ('232', 'Virgin Islands (U.S.)', 'VI', 'VIR', '1');
INSERT INTO `zen_countries` VALUES ('233', 'Wallis and Futuna Islands', 'WF', 'WLF', '1');
INSERT INTO `zen_countries` VALUES ('234', 'Western Sahara', 'EH', 'ESH', '1');
INSERT INTO `zen_countries` VALUES ('235', 'Yemen', 'YE', 'YEM', '1');
INSERT INTO `zen_countries` VALUES ('236', 'Serbia', 'RS', 'SRB', '1');
INSERT INTO `zen_countries` VALUES ('238', 'Zambia', 'ZM', 'ZMB', '1');
INSERT INTO `zen_countries` VALUES ('239', 'Zimbabwe', 'ZW', 'ZWE', '1');
INSERT INTO `zen_countries` VALUES ('241', 'Palestinian Territory', 'PS', 'PSE', '1');
INSERT INTO `zen_countries` VALUES ('242', 'Montenegro', 'ME', 'MNE', '1');
INSERT INTO `zen_countries` VALUES ('243', 'Guernsey', 'GG', 'GGY', '1');
INSERT INTO `zen_countries` VALUES ('244', 'Isle of Man', 'IM', 'IMN', '1');
INSERT INTO `zen_countries` VALUES ('245', 'Jersey', 'JE', 'JEY', '1');

-- ----------------------------
-- Table structure for `zen_coupons`
-- ----------------------------
DROP TABLE IF EXISTS `zen_coupons`;
CREATE TABLE `zen_coupons` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type` char(1) NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) DEFAULT NULL,
  `restrict_to_categories` varchar(255) DEFAULT NULL,
  `restrict_to_customers` text,
  `coupon_active` char(1) NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`),
  KEY `idx_coupon_code_zen` (`coupon_code`),
  KEY `idx_coupon_type_zen` (`coupon_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_coupons
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_coupons_description`
-- ----------------------------
DROP TABLE IF EXISTS `zen_coupons_description`;
CREATE TABLE `zen_coupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(32) NOT NULL DEFAULT '',
  `coupon_description` text,
  PRIMARY KEY (`coupon_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_coupons_description
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_coupon_email_track`
-- ----------------------------
DROP TABLE IF EXISTS `zen_coupon_email_track`;
CREATE TABLE `zen_coupon_email_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) DEFAULT NULL,
  `sent_lastname` varchar(32) DEFAULT NULL,
  `emailed_to` varchar(32) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_coupon_email_track
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_coupon_gv_customer`
-- ----------------------------
DROP TABLE IF EXISTS `zen_coupon_gv_customer`;
CREATE TABLE `zen_coupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_coupon_gv_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_coupon_gv_queue`
-- ----------------------------
DROP TABLE IF EXISTS `zen_coupon_gv_queue`;
CREATE TABLE `zen_coupon_gv_queue` (
  `unique_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `release_flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`unique_id`),
  KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`),
  KEY `idx_release_flag_zen` (`release_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_coupon_gv_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_coupon_redeem_track`
-- ----------------------------
DROP TABLE IF EXISTS `zen_coupon_redeem_track`;
CREATE TABLE `zen_coupon_redeem_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(45) NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_coupon_redeem_track
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_coupon_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `zen_coupon_restrict`;
CREATE TABLE `zen_coupon_restrict` (
  `restrict_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`restrict_id`),
  KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_coupon_restrict
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_currencies`
-- ----------------------------
DROP TABLE IF EXISTS `zen_currencies`;
CREATE TABLE `zen_currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` char(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(24) DEFAULT NULL,
  `symbol_right` varchar(24) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_currencies
-- ----------------------------
INSERT INTO `zen_currencies` VALUES ('1', 'US Dollar', 'USD', '$', '', '.', ',', '2', '1.00000000', '2013-05-20 08:49:15');
INSERT INTO `zen_currencies` VALUES ('2', 'Euro', 'EUR', '&euro;', '', '.', ',', '2', '1.00000000', '2013-05-20 08:49:15');
INSERT INTO `zen_currencies` VALUES ('3', 'GB Pound', 'GBP', '&pound;', '', '.', ',', '2', '0.67259997', '2013-05-20 08:49:15');
INSERT INTO `zen_currencies` VALUES ('4', 'Canadian Dollar', 'CAD', '$', '', '.', ',', '2', '1.10420001', '2013-05-20 08:49:15');
INSERT INTO `zen_currencies` VALUES ('5', 'Australian Dollar', 'AUD', '$', '', '.', ',', '2', '1.17890000', '2013-05-20 08:49:15');

-- ----------------------------
-- Table structure for `zen_customers`
-- ----------------------------
DROP TABLE IF EXISTS `zen_customers`;
CREATE TABLE `zen_customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_nick` varchar(96) NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(40) NOT NULL DEFAULT '',
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customers_id`),
  KEY `idx_email_address_zen` (`customers_email_address`),
  KEY `idx_referral_zen` (`customers_referral`(10)),
  KEY `idx_grp_pricing_zen` (`customers_group_pricing`),
  KEY `idx_nick_zen` (`customers_nick`),
  KEY `idx_newsletter_zen` (`customers_newsletter`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_customers
-- ----------------------------
INSERT INTO `zen_customers` VALUES ('1', 'm', 'Bill', 'Smith', '2001-01-01 00:00:00', 'root@localhost.com', '', '1', '12345', '', 'd95e8fa7f20a009372eb3477473fcd34:1c', '0', '0', 'TEXT', '0', '', '', '0');

-- ----------------------------
-- Table structure for `zen_customers_basket`
-- ----------------------------
DROP TABLE IF EXISTS `zen_customers_basket`;
CREATE TABLE `zen_customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `customers_basket_date_added` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_customers_basket
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_customers_basket_attributes`
-- ----------------------------
DROP TABLE IF EXISTS `zen_customers_basket_attributes`;
CREATE TABLE `zen_customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `products_options_id` varchar(64) NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_customers_basket_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_customers_info`
-- ----------------------------
DROP TABLE IF EXISTS `zen_customers_info`;
CREATE TABLE `zen_customers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_customers_info
-- ----------------------------
INSERT INTO `zen_customers_info` VALUES ('1', '0001-01-01 00:00:00', '0', '2004-01-21 01:35:28', '0001-01-01 00:00:00', '0');

-- ----------------------------
-- Table structure for `zen_db_cache`
-- ----------------------------
DROP TABLE IF EXISTS `zen_db_cache`;
CREATE TABLE `zen_db_cache` (
  `cache_entry_name` varchar(64) NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL,
  PRIMARY KEY (`cache_entry_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_db_cache
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_email_archive`
-- ----------------------------
DROP TABLE IF EXISTS `zen_email_archive`;
CREATE TABLE `zen_email_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_to_name` varchar(96) NOT NULL DEFAULT '',
  `email_to_address` varchar(96) NOT NULL DEFAULT '',
  `email_from_name` varchar(96) NOT NULL DEFAULT '',
  `email_from_address` varchar(96) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_html` text NOT NULL,
  `email_text` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`archive_id`),
  KEY `idx_email_to_address_zen` (`email_to_address`),
  KEY `idx_module_zen` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_email_archive
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_ezpages`
-- ----------------------------
DROP TABLE IF EXISTS `zen_ezpages`;
CREATE TABLE `zen_ezpages` (
  `pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `alt_url` varchar(255) NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) NOT NULL DEFAULT '',
  `pages_html_text` mediumtext,
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `idx_lang_id_zen` (`languages_id`),
  KEY `idx_ezp_status_header_zen` (`status_header`),
  KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`),
  KEY `idx_ezp_status_footer_zen` (`status_footer`),
  KEY `idx_ezp_status_toc_zen` (`status_toc`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_ezpages
-- ----------------------------
INSERT INTO `zen_ezpages` VALUES ('1', '1', 'EZPages', '', '', 'This is the main page listed under the Link EZPages in the Header<br /><br />\r\n\r\n<strong>See: What is EZPages? Link for detailed use of EZPages</strong><br /><br />\r\n\r\nThis Link could show in the Header, Footer or Sidebox or a combination of all three locations.<br /><br />\r\n\r\nThe Chapter and TOC settings are for using this Page in combination with other Pages.<br /><br />\r\n\r\nThe other Pages can be shown either *only* with this Link in the Chapter and TOC or as their own Link in the Header, Footer or Sidebox, depending on how you would like them to appear on your site.<br /><br />\r\n\r\nThere is no true \"Master\" Link, other than the Links you actually have configured to display. But any Link in a Chapter can be displayed in any of the 3 locations for the Header, Footer or Sidebox or not at all, where it only appears together with the other Links in the Chapter.', '1', '0', '0', '1', '10', '0', '0', '10', '0', '0', '10');
INSERT INTO `zen_ezpages` VALUES ('2', '1', 'A New Page', '', '', 'This is another page that is linked to the Chapter 10 via the Chapter number used and is sorted based on the TOC Order.<br /><br />\r\n\r\nThere is not a link to this page via the Header, Footer nor the Sidebox.<br /><br />\r\n\r\nThis page is only seen if the \"main\" link is selected and then it will show in the TOC listing.<br /><br />\r\n\r\nThis is a handy way to have numerous links that are related but only show one main link to get to them all.<br /><br />', '0', '0', '0', '1', '0', '0', '0', '30', '0', '0', '10');
INSERT INTO `zen_ezpages` VALUES ('3', '1', 'Another New Page', '', '', 'This is yet another new page or link that is part of Chapter 10<br /><br />\r\n\r\nThe numbering of the Chapters can be done in any manner. But, by number in increments such as 10, 20, 30, etc. you can later insert pages, or links, as needed within the existing pages.<br /><br />\r\n\r\nThere is no limit to the number of pages, or links, that can be grouped together using the Chapter.<br /><br />\r\n\r\nThe display of the Previous/Next and TOC listing is a setting that can be turned on or off.', '0', '0', '0', '1', '0', '0', '0', '40', '0', '0', '10');
INSERT INTO `zen_ezpages` VALUES ('4', '1', 'My Link', '', '', 'This is a single page link that will be shown in the Sidebox.<br /><br />\r\n\r\nThere are no additional pages or links associated with this page as there is no Chapter.<br /><br />\r\n\r\nLater, if you want to expand on this link you can add a Chapter and TOC settings and build a group.<br /><br />\r\n\r\nNotice that the Previous/Next and TOC automatically disable when there isn\'t a Chapter. Even with a Chapter, there must be more than one (1) related link or page in the group before these will display.', '0', '1', '0', '0', '0', '10', '0', '0', '0', '0', '0');
INSERT INTO `zen_ezpages` VALUES ('5', '1', 'Anything', '', '', 'The title or link names can be anything that you would like to use.<br /><br />\r\n\r\nYou decide on the content and the link name relative to that content.<br /><br />\r\n\r\nThen, define where you want the link to show: Header, Footer or Sidebox or as a combination of these three locations.<br /><br />\r\n\r\nThe content of the page can be anything you like. Be sure that your content is valid in regard to table and stylesheet rules.<br /><br />\r\n\r\nYou can even set up the links to go to Secure or Non-Secure pages as well as open in the same or a new window.<br /><br />\r\n\r\nLinks can also be setup to use internal or external links vs the HTML Content. See: examples below in the Link URL settings.', '0', '1', '0', '0', '0', '20', '0', '0', '0', '0', '0');
INSERT INTO `zen_ezpages` VALUES ('6', '1', 'Shared', '', '', 'This link is a \"shared\" link between the Header, Footer and Sidebox.<br /><br />\r\n\r\nThe number on the order was set to 50 on all of the settings just for the sake of an easier notation on entering it.<br /><br />\r\n\r\nThe order can be the same or different for the three locations.<br /><br />\r\n\r\nIf you wanted to really get creative, you could also have this as part of a Chapter not related to the link order.<br /><br />', '1', '1', '1', '0', '50', '50', '50', '0', '0', '0', '0');
INSERT INTO `zen_ezpages` VALUES ('7', '1', 'My Account', 'index.php?main_page=account', '', '', '0', '0', '1', '0', '0', '0', '10', '0', '0', '1', '0');
INSERT INTO `zen_ezpages` VALUES ('8', '1', 'Site Map', 'index.php?main_page=site_map', '', '', '0', '1', '1', '0', '0', '40', '20', '0', '0', '0', '0');
INSERT INTO `zen_ezpages` VALUES ('9', '1', 'Privacy Notice', 'index.php?main_page=privacy', '', '', '1', '0', '1', '0', '30', '0', '40', '0', '0', '0', '0');
INSERT INTO `zen_ezpages` VALUES ('10', '1', 'Zen Cart', '', 'http://www.zen-cart.com', '', '1', '0', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `zen_ezpages` VALUES ('11', '1', 'Gift Certificates', 'index.php?main_page=index&cPath=21', '', '', '0', '1', '0', '0', '0', '60', '0', '0', '0', '0', '0');
INSERT INTO `zen_ezpages` VALUES ('12', '1', 'Action DVDs', 'index.php?main_page=index&cPath=3_10', '', '', '0', '0', '1', '0', '0', '0', '60', '0', '0', '0', '0');
INSERT INTO `zen_ezpages` VALUES ('13', '1', 'Google', '', 'http://www.google.com', '', '0', '1', '0', '0', '0', '70', '0', '0', '1', '0', '0');
INSERT INTO `zen_ezpages` VALUES ('14', '1', 'What is EZ-Pages?', '', '', '<table cellspacing=\"4\" cellpadding=\"4\" border=\"3\" align=\"center\" style=\"width: 80%;\"><tbody><tr><td><span style=\"font-style: italic;\">\r\n<span style=\"font-weight: bold;\">Note: This EZ-Page has been written with the help of the HTMLarea Editor.<br /> <br />This means that this EZ-page will not validate correctly based on how HTMLarea or other editors renders the code.</span></span></td></tr></tbody></table><br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">Summary</span><br /><br /><span style=\"font-weight: bold;\">EZ-Pages</span> is a fast, easy way of creating links and additional pages.<br /><br />The additional Pages can be for:<br /><ul><li>New Pages</li><li>Internal Links</li><li>External Links</li><li>Secure or Non-Secure pages</li><li>Same or New Window</li></ul>In Addition, there is the ability to create &quot;related&quot; links in the format of a Chapter (group) and its TOC (related pages/links).<br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">Link Naming</span><br /><br />Links are named by the Page Title. All Links need a Page Title in order to function.<br /><br />If you forget to add a Page Title, then you will not be able to add the Link.<br /><br />If you do not assign an Order for the Header, Sidebox or Footer, then the Link will not display even if you have a Page Title.<br /><br /><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">Link Placement</span><br /><br /></span>While you have the option of adding Additional Links to the Header, Footer and Sidebox with EZ-Pages, you are not limited to these three Link locations. Links can be in one or more locations simply by enabling the Order for the Location(s) where the Link should appear..<br /><br />The Link Location Status for the Header, Footer and Sidebox is controlled simply by setting these to Yes or No for each setting. Then, set the Order in which the Link should appear for each location.<br /><br />This means that if you were to set Header to Yes 30 and Sidebox to Yes 50 then the link would appear in both the Header and Sidebox in the Order of your Links.<br /><br />The Order numbering method is up to you. Numbering using 10, 20, 30, etc. will allow you to sort the Links and add additional Links later.<br /><br />Note: a 0 value for the Order will disable the Link from displaying.<br /><br /><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">Open in New Window and Secure Pages</span><br /></span><br />With EZ-Pages, each Link can take you to the same, main window for your shop; or, you can have the Link open a brand new New Window. In addition, there is an option for making the Link open as a Secure Page or a Non-Secure Page.<br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">Chapter and TOC</span><br style=\"font-weight: bold; color: rgb(255, 0, 0);\" /><br />The Chapter and TOC, or Table of Contents, are a unique method of building Multiple Links that interact together.<br /><br />While these Links still follow the rules of the Header, Footer and Sidebox placement, the difference is that only one of the Links, the Main Link, needs to be displayed anywhere on the site.<br /><br />If you had, for example, 5 related Links, you could add the first Link as the Main Link by setting its location to the Header, Footer or Sidebox and set its Order, as usual.<br /><br />Next, you need to assign a Chapter or Group number to the Link. This Chapter holds the related Links together.<br /><br />Then, set the TOC or Table of Contents setting. This is a secondary Sort Order for within the Chapter.<br /><br />Again, you can display any of the Links within a Chapter, as well as making any of these Links the Main Link. Whether the Links all show, or just one or more of the Links show, the Chapter is the key to grouping these Links together in the TOC or Previous/Next. <br /><br /><span style=\"font-weight: bold; font-style: italic;\">NOTE: While all Links within a Chapter will display together, you can have the different Links display in the Header, Footer or Sidebox on their own. Or, you can have the additional Links only display when the Main Link or one of the Additional Links within the Chapter has been opened.</span><br style=\"font-weight: bold; font-style: italic;\" /><br />The versitility of EZ-Pages will make adding new Links and Pages extreamly easy for the beginner as well as the advance user.<br /><br />While this page was made in HTMLarea editor, any HTML editor could be used.<br /><br />However, be careful ... HTML editors will often add the opening and closing tags for the &lt;html&gt;, &lt;head&gt; and &lt;body&gt; to the file you are working on.<br /><br />These are already added to the pages via EZ-Pages.<br /><br /><span style=\"color: rgb(255, 0, 0); font-weight: bold;\">External Link URL</span><br /><br />External Link URLs are links to outside pages not within your shop. These can be to any valid URL such as:<br /><br />http://www.sashbox.net<br /><br />You need to include the full URL path to any External Link URL. You may also mark these to open in a New Window or the Same Window.<br /><br /><span style=\"color: rgb(255, 0, 0); font-weight: bold;\">Internal Link URL</span><br /><br />Internal Link URLs are links to internal pages within your shop. These can be to any valid URL, but should be written as relative links such as:<br /><br />index.php?main_page=index&amp;cPath=21<br /><br />The above Link would take you to the Category for categories_id 21<br /><br />While these links can be the Full URL to an Internal Link, it is best to write as a Relative Link so that if you change domains, are work on a temporary domain or an IP Address, the Link will remain valid if moved to another domain, IP Address, etc.<br /><br />Internal Links can also open in a New Window or the Same Window or be for Secure or Non-Secure Pages.<br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">EZ-Pages Additional Pages vs Internal Links vs External Links</span><br /><br />The Type of Link that you create is based on an order of precidence, where HTML Content will superceed both the Internal Link and the External Link values.<br /><br />The External Link URL will superceed the Internal Link URL.<br /><br />If you try to set a combination of HTML Content, Internal Link and/or External Link, the Link will be flagged in the listing with a read icon to alert you to your mistake.<br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">WARNING ...</span><br /><br />When using Editors such as HTMLarea, if you hit enter in the HTML Content area <br /> will be added. These will be detected as &quot;content&quot; and will override any Internal Link URL or External Link URL.<br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">Admin Only Display</span><br /><br />Sometimes, when working on EZ-Pages, you will want to be able to work on a Live Site and see the results of your work, but not allow the Customers to see this until you are done.<br /><br />There are 3 settings in the Configuration ... EZ-Pages Settings for the Header, Footer and Sidebox  Status:<br /><ul><li>OFF</li><li>ON</li><li>Admin Only</li></ul>The Admin Only setting is controlled by the IP Address(es) set in the Website Maintenance.<br /><br />This can be very handy when needing to work on a Live Site but not wanting customers to see the work in progress.<br /><br />', '0', '0', '0', '1', '0', '0', '0', '20', '0', '0', '10');

-- ----------------------------
-- Table structure for `zen_featured`
-- ----------------------------
DROP TABLE IF EXISTS `zen_featured`;
CREATE TABLE `zen_featured` (
  `featured_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`featured_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`featured_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_featured
-- ----------------------------
INSERT INTO `zen_featured` VALUES ('1', '34', '2004-02-21 16:34:31', '2004-02-21 16:34:31', '0001-01-01', '2004-02-21 16:34:31', '1', '0001-01-01');
INSERT INTO `zen_featured` VALUES ('2', '8', '2004-02-21 17:04:54', '2004-02-21 22:31:52', '2004-02-27', '2004-04-25 22:50:50', '0', '2004-02-21');
INSERT INTO `zen_featured` VALUES ('3', '12', '2004-02-21 17:10:49', '2004-02-21 17:10:49', '0001-01-01', '2004-02-21 17:10:49', '1', '0001-01-01');
INSERT INTO `zen_featured` VALUES ('4', '27', '2004-02-21 22:30:53', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `zen_featured` VALUES ('5', '26', '2004-02-21 22:31:24', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `zen_featured` VALUES ('6', '40', '2004-05-13 22:50:33', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `zen_featured` VALUES ('7', '171', '2004-07-12 15:47:22', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `zen_featured` VALUES ('8', '172', '2004-07-12 15:47:29', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `zen_featured` VALUES ('9', '168', '2004-07-12 15:47:37', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `zen_featured` VALUES ('10', '169', '2004-07-12 15:47:45', null, '0001-01-01', null, '1', '0001-01-01');

-- ----------------------------
-- Table structure for `zen_files_uploaded`
-- ----------------------------
DROP TABLE IF EXISTS `zen_files_uploaded`;
CREATE TABLE `zen_files_uploaded` (
  `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT,
  `sesskey` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`files_uploaded_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Must always have either a sesskey or customers_id';

-- ----------------------------
-- Records of zen_files_uploaded
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_geo_zones`
-- ----------------------------
DROP TABLE IF EXISTS `zen_geo_zones`;
CREATE TABLE `zen_geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_geo_zones
-- ----------------------------
INSERT INTO `zen_geo_zones` VALUES ('1', 'Florida', 'Florida local sales tax zone', null, '2013-05-20 08:49:15');

-- ----------------------------
-- Table structure for `zen_get_terms_to_filter`
-- ----------------------------
DROP TABLE IF EXISTS `zen_get_terms_to_filter`;
CREATE TABLE `zen_get_terms_to_filter` (
  `get_term_name` varchar(255) NOT NULL DEFAULT '',
  `get_term_table` varchar(64) NOT NULL,
  `get_term_name_field` varchar(64) NOT NULL,
  PRIMARY KEY (`get_term_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_get_terms_to_filter
-- ----------------------------
INSERT INTO `zen_get_terms_to_filter` VALUES ('manufacturers_id', 'TABLE_MANUFACTURERS', 'manufacturers_name');
INSERT INTO `zen_get_terms_to_filter` VALUES ('music_genre_id', 'TABLE_MUSIC_GENRE', 'music_genre_name');
INSERT INTO `zen_get_terms_to_filter` VALUES ('record_company_id', 'TABLE_RECORD_COMPANY', 'record_company_name');

-- ----------------------------
-- Table structure for `zen_group_pricing`
-- ----------------------------
DROP TABLE IF EXISTS `zen_group_pricing`;
CREATE TABLE `zen_group_pricing` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_group_pricing
-- ----------------------------
INSERT INTO `zen_group_pricing` VALUES ('1', 'Group 10', '10.00', null, '2004-04-29 00:21:04');

-- ----------------------------
-- Table structure for `zen_languages`
-- ----------------------------
DROP TABLE IF EXISTS `zen_languages`;
CREATE TABLE `zen_languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `idx_languages_name_zen` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_languages
-- ----------------------------
INSERT INTO `zen_languages` VALUES ('1', 'English', 'en', 'icon.gif', 'english', '1');

-- ----------------------------
-- Table structure for `zen_layout_boxes`
-- ----------------------------
DROP TABLE IF EXISTS `zen_layout_boxes`;
CREATE TABLE `zen_layout_boxes` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_template` varchar(64) NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_id`),
  KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`),
  KEY `idx_layout_box_status_zen` (`layout_box_status`),
  KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_layout_boxes
-- ----------------------------
INSERT INTO `zen_layout_boxes` VALUES ('1', 'default_template_settings', 'banner_box_all.php', '1', '1', '5', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('2', 'default_template_settings', 'banner_box.php', '1', '0', '300', '1', '127');
INSERT INTO `zen_layout_boxes` VALUES ('3', 'default_template_settings', 'banner_box2.php', '1', '1', '15', '1', '15');
INSERT INTO `zen_layout_boxes` VALUES ('4', 'default_template_settings', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `zen_layout_boxes` VALUES ('5', 'default_template_settings', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `zen_layout_boxes` VALUES ('6', 'default_template_settings', 'currencies.php', '0', '1', '80', '60', '0');
INSERT INTO `zen_layout_boxes` VALUES ('7', 'default_template_settings', 'document_categories.php', '1', '0', '0', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('8', 'default_template_settings', 'ezpages.php', '1', '1', '-1', '2', '1');
INSERT INTO `zen_layout_boxes` VALUES ('9', 'default_template_settings', 'featured.php', '1', '0', '45', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('10', 'default_template_settings', 'information.php', '1', '0', '50', '40', '1');
INSERT INTO `zen_layout_boxes` VALUES ('11', 'default_template_settings', 'languages.php', '0', '1', '70', '50', '0');
INSERT INTO `zen_layout_boxes` VALUES ('12', 'default_template_settings', 'manufacturers.php', '1', '0', '30', '20', '1');
INSERT INTO `zen_layout_boxes` VALUES ('13', 'default_template_settings', 'manufacturer_info.php', '1', '1', '35', '95', '1');
INSERT INTO `zen_layout_boxes` VALUES ('14', 'default_template_settings', 'more_information.php', '1', '0', '200', '200', '1');
INSERT INTO `zen_layout_boxes` VALUES ('15', 'default_template_settings', 'music_genres.php', '1', '1', '0', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('16', 'default_template_settings', 'order_history.php', '1', '1', '0', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('17', 'default_template_settings', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `zen_layout_boxes` VALUES ('18', 'default_template_settings', 'record_companies.php', '1', '1', '0', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('19', 'default_template_settings', 'reviews.php', '1', '0', '40', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('20', 'default_template_settings', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('21', 'default_template_settings', 'search_header.php', '0', '0', '0', '0', '1');
INSERT INTO `zen_layout_boxes` VALUES ('22', 'default_template_settings', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `zen_layout_boxes` VALUES ('23', 'default_template_settings', 'specials.php', '1', '1', '45', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('24', 'default_template_settings', 'whats_new.php', '1', '0', '20', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('25', 'default_template_settings', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `zen_layout_boxes` VALUES ('26', 'template_default', 'banner_box_all.php', '1', '1', '5', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('27', 'template_default', 'banner_box.php', '1', '0', '300', '1', '127');
INSERT INTO `zen_layout_boxes` VALUES ('28', 'template_default', 'banner_box2.php', '1', '1', '15', '1', '15');
INSERT INTO `zen_layout_boxes` VALUES ('29', 'template_default', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `zen_layout_boxes` VALUES ('30', 'template_default', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `zen_layout_boxes` VALUES ('31', 'template_default', 'currencies.php', '0', '1', '80', '60', '0');
INSERT INTO `zen_layout_boxes` VALUES ('32', 'template_default', 'ezpages.php', '1', '1', '-1', '2', '1');
INSERT INTO `zen_layout_boxes` VALUES ('33', 'template_default', 'featured.php', '1', '0', '45', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('34', 'template_default', 'information.php', '1', '0', '50', '40', '1');
INSERT INTO `zen_layout_boxes` VALUES ('35', 'template_default', 'languages.php', '0', '1', '70', '50', '0');
INSERT INTO `zen_layout_boxes` VALUES ('36', 'template_default', 'manufacturers.php', '1', '0', '30', '20', '1');
INSERT INTO `zen_layout_boxes` VALUES ('37', 'template_default', 'manufacturer_info.php', '1', '1', '35', '95', '1');
INSERT INTO `zen_layout_boxes` VALUES ('38', 'template_default', 'more_information.php', '1', '0', '200', '200', '1');
INSERT INTO `zen_layout_boxes` VALUES ('39', 'template_default', 'my_broken_box.php', '1', '0', '0', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('40', 'template_default', 'order_history.php', '1', '1', '0', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('41', 'template_default', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `zen_layout_boxes` VALUES ('42', 'template_default', 'reviews.php', '1', '0', '40', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('43', 'template_default', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('44', 'template_default', 'search_header.php', '0', '0', '0', '0', '1');
INSERT INTO `zen_layout_boxes` VALUES ('45', 'template_default', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `zen_layout_boxes` VALUES ('46', 'template_default', 'specials.php', '1', '1', '45', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('47', 'template_default', 'whats_new.php', '1', '0', '20', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('48', 'template_default', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `zen_layout_boxes` VALUES ('49', 'classic', 'banner_box.php', '1', '0', '300', '1', '127');
INSERT INTO `zen_layout_boxes` VALUES ('50', 'classic', 'banner_box2.php', '1', '1', '15', '1', '15');
INSERT INTO `zen_layout_boxes` VALUES ('51', 'classic', 'banner_box_all.php', '1', '1', '5', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('52', 'classic', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `zen_layout_boxes` VALUES ('53', 'classic', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `zen_layout_boxes` VALUES ('54', 'classic', 'currencies.php', '0', '1', '80', '60', '0');
INSERT INTO `zen_layout_boxes` VALUES ('55', 'classic', 'document_categories.php', '1', '0', '0', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('56', 'classic', 'ezpages.php', '1', '1', '-1', '2', '1');
INSERT INTO `zen_layout_boxes` VALUES ('57', 'classic', 'featured.php', '1', '0', '45', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('58', 'classic', 'information.php', '1', '0', '50', '40', '1');
INSERT INTO `zen_layout_boxes` VALUES ('59', 'classic', 'languages.php', '0', '1', '70', '50', '0');
INSERT INTO `zen_layout_boxes` VALUES ('60', 'classic', 'manufacturers.php', '1', '0', '30', '20', '1');
INSERT INTO `zen_layout_boxes` VALUES ('61', 'classic', 'manufacturer_info.php', '1', '1', '35', '95', '1');
INSERT INTO `zen_layout_boxes` VALUES ('62', 'classic', 'more_information.php', '1', '0', '200', '200', '1');
INSERT INTO `zen_layout_boxes` VALUES ('63', 'classic', 'music_genres.php', '1', '1', '0', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('64', 'classic', 'order_history.php', '1', '1', '0', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('65', 'classic', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `zen_layout_boxes` VALUES ('66', 'classic', 'record_companies.php', '1', '1', '0', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('67', 'classic', 'reviews.php', '1', '0', '40', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('68', 'classic', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('69', 'classic', 'search_header.php', '0', '0', '0', '0', '1');
INSERT INTO `zen_layout_boxes` VALUES ('70', 'classic', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `zen_layout_boxes` VALUES ('71', 'classic', 'specials.php', '1', '1', '45', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('72', 'classic', 'whats_new.php', '1', '0', '20', '0', '0');
INSERT INTO `zen_layout_boxes` VALUES ('73', 'classic', 'whos_online.php', '1', '1', '200', '200', '1');

-- ----------------------------
-- Table structure for `zen_manufacturers`
-- ----------------------------
DROP TABLE IF EXISTS `zen_manufacturers`;
CREATE TABLE `zen_manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `idx_mfg_name_zen` (`manufacturers_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_manufacturers
-- ----------------------------
INSERT INTO `zen_manufacturers` VALUES ('1', 'Matrox', 'manufacturers/manufacturer_matrox.gif', '2003-12-23 03:18:19', null);
INSERT INTO `zen_manufacturers` VALUES ('2', 'Microsoft', 'manufacturers/manufacturer_microsoft.gif', '2003-12-23 03:18:19', null);
INSERT INTO `zen_manufacturers` VALUES ('3', 'Warner', 'manufacturers/manufacturer_warner.gif', '2003-12-23 03:18:19', null);
INSERT INTO `zen_manufacturers` VALUES ('4', 'Fox', 'manufacturers/manufacturer_fox.gif', '2003-12-23 03:18:19', null);
INSERT INTO `zen_manufacturers` VALUES ('5', 'Logitech', 'manufacturers/manufacturer_logitech.gif', '2003-12-23 03:18:19', null);
INSERT INTO `zen_manufacturers` VALUES ('6', 'Canon', 'manufacturers/manufacturer_canon.gif', '2003-12-23 03:18:19', null);
INSERT INTO `zen_manufacturers` VALUES ('7', 'Sierra', 'manufacturers/manufacturer_sierra.gif', '2003-12-23 03:18:19', null);
INSERT INTO `zen_manufacturers` VALUES ('8', 'GT Interactive', 'manufacturers/manufacturer_gt_interactive.gif', '2003-12-23 03:18:19', null);
INSERT INTO `zen_manufacturers` VALUES ('9', 'Hewlett Packard', 'manufacturers/manufacturer_hewlett_packard.gif', '2003-12-23 03:18:19', null);

-- ----------------------------
-- Table structure for `zen_manufacturers_info`
-- ----------------------------
DROP TABLE IF EXISTS `zen_manufacturers_info`;
CREATE TABLE `zen_manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_manufacturers_info
-- ----------------------------
INSERT INTO `zen_manufacturers_info` VALUES ('1', '1', 'http://www.matrox.com', '0', null);
INSERT INTO `zen_manufacturers_info` VALUES ('2', '1', 'http://www.microsoft.com', '0', null);
INSERT INTO `zen_manufacturers_info` VALUES ('3', '1', 'http://www.warner.com', '0', null);
INSERT INTO `zen_manufacturers_info` VALUES ('4', '1', 'http://www.fox.com', '0', null);
INSERT INTO `zen_manufacturers_info` VALUES ('5', '1', 'http://www.logitech.com', '0', null);
INSERT INTO `zen_manufacturers_info` VALUES ('6', '1', 'http://www.canon.com', '0', null);
INSERT INTO `zen_manufacturers_info` VALUES ('7', '1', 'http://www.sierra.com', '0', null);
INSERT INTO `zen_manufacturers_info` VALUES ('8', '1', 'http://www.infogrames.com', '0', null);
INSERT INTO `zen_manufacturers_info` VALUES ('9', '1', 'http://www.hewlettpackard.com', '0', null);

-- ----------------------------
-- Table structure for `zen_media_clips`
-- ----------------------------
DROP TABLE IF EXISTS `zen_media_clips`;
CREATE TABLE `zen_media_clips` (
  `clip_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`clip_id`),
  KEY `idx_media_id_zen` (`media_id`),
  KEY `idx_clip_type_zen` (`clip_type`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_media_clips
-- ----------------------------
INSERT INTO `zen_media_clips` VALUES ('1', '1', '1', 'thehunter.mp3', '2004-06-01 20:57:43', '0000-00-00 00:00:00');
INSERT INTO `zen_media_clips` VALUES ('6', '2', '1', 'thehunter.mp3', '2004-07-13 00:45:09', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `zen_media_manager`
-- ----------------------------
DROP TABLE IF EXISTS `zen_media_manager`;
CREATE TABLE `zen_media_manager` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_name` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`media_id`),
  KEY `idx_media_name_zen` (`media_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_media_manager
-- ----------------------------
INSERT INTO `zen_media_manager` VALUES ('1', 'Russ Tippins - The Hunter', '2004-06-01 20:57:43', '2004-06-01 20:42:53');
INSERT INTO `zen_media_manager` VALUES ('2', 'Help!', '2004-07-13 01:01:14', '2004-07-12 17:57:45');

-- ----------------------------
-- Table structure for `zen_media_to_products`
-- ----------------------------
DROP TABLE IF EXISTS `zen_media_to_products`;
CREATE TABLE `zen_media_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_media_product_zen` (`media_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_media_to_products
-- ----------------------------
INSERT INTO `zen_media_to_products` VALUES ('1', '166');
INSERT INTO `zen_media_to_products` VALUES ('2', '169');

-- ----------------------------
-- Table structure for `zen_media_types`
-- ----------------------------
DROP TABLE IF EXISTS `zen_media_types`;
CREATE TABLE `zen_media_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) NOT NULL DEFAULT '',
  `type_ext` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_name_zen` (`type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_media_types
-- ----------------------------
INSERT INTO `zen_media_types` VALUES ('1', 'MP3', '.mp3');

-- ----------------------------
-- Table structure for `zen_meta_tags_categories_description`
-- ----------------------------
DROP TABLE IF EXISTS `zen_meta_tags_categories_description`;
CREATE TABLE `zen_meta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`categories_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_meta_tags_categories_description
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_meta_tags_products_description`
-- ----------------------------
DROP TABLE IF EXISTS `zen_meta_tags_products_description`;
CREATE TABLE `zen_meta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`products_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_meta_tags_products_description
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_music_genre`
-- ----------------------------
DROP TABLE IF EXISTS `zen_music_genre`;
CREATE TABLE `zen_music_genre` (
  `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_genre_name` varchar(32) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`music_genre_id`),
  KEY `idx_music_genre_name_zen` (`music_genre_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_music_genre
-- ----------------------------
INSERT INTO `zen_music_genre` VALUES ('1', 'Rock', '2004-06-01 20:53:26', null);
INSERT INTO `zen_music_genre` VALUES ('2', 'Jazz', '2004-06-01 20:53:45', null);

-- ----------------------------
-- Table structure for `zen_newsletters`
-- ----------------------------
DROP TABLE IF EXISTS `zen_newsletters`;
CREATE TABLE `zen_newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_newsletters
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_orders`
-- ----------------------------
DROP TABLE IF EXISTS `zen_orders`;
CREATE TABLE `zen_orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `customers_company` varchar(64) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) NOT NULL DEFAULT '',
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) NOT NULL DEFAULT '',
  `delivery_company` varchar(64) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) NOT NULL DEFAULT '',
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) NOT NULL DEFAULT '',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) NOT NULL DEFAULT '',
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_method` varchar(128) NOT NULL DEFAULT '',
  `shipping_module_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(14,2) DEFAULT NULL,
  `order_tax` decimal(14,2) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_id`),
  KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`),
  KEY `idx_date_purchased_zen` (`date_purchased`),
  KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_orders
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_orders_products`
-- ----------------------------
DROP TABLE IF EXISTS `zen_orders_products`;
CREATE TABLE `zen_orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`),
  KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_orders_products
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_orders_products_attributes`
-- ----------------------------
DROP TABLE IF EXISTS `zen_orders_products_attributes`;
CREATE TABLE `zen_orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) NOT NULL DEFAULT '',
  `products_options_values` text NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_orders_products_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_orders_products_download`
-- ----------------------------
DROP TABLE IF EXISTS `zen_orders_products_download`;
CREATE TABLE `zen_orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_id_zen` (`orders_id`),
  KEY `idx_orders_products_id_zen` (`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_orders_products_download
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_orders_status`
-- ----------------------------
DROP TABLE IF EXISTS `zen_orders_status`;
CREATE TABLE `zen_orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name_zen` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_orders_status
-- ----------------------------
INSERT INTO `zen_orders_status` VALUES ('1', '1', 'Pending');
INSERT INTO `zen_orders_status` VALUES ('2', '1', 'Processing');
INSERT INTO `zen_orders_status` VALUES ('3', '1', 'Delivered');
INSERT INTO `zen_orders_status` VALUES ('4', '1', 'Update');

-- ----------------------------
-- Table structure for `zen_orders_status_history`
-- ----------------------------
DROP TABLE IF EXISTS `zen_orders_status_history`;
CREATE TABLE `zen_orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_orders_status_history
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_orders_total`
-- ----------------------------
DROP TABLE IF EXISTS `zen_orders_total`;
CREATE TABLE `zen_orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_ot_orders_id_zen` (`orders_id`),
  KEY `idx_ot_class_zen` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_orders_total
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_paypal`
-- ----------------------------
DROP TABLE IF EXISTS `zen_paypal`;
CREATE TABLE `zen_paypal` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` varchar(6) NOT NULL DEFAULT '',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_paypal
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_paypal_payment_status`
-- ----------------------------
DROP TABLE IF EXISTS `zen_paypal_payment_status`;
CREATE TABLE `zen_paypal_payment_status` (
  `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_paypal_payment_status
-- ----------------------------
INSERT INTO `zen_paypal_payment_status` VALUES ('1', 'Completed');
INSERT INTO `zen_paypal_payment_status` VALUES ('2', 'Pending');
INSERT INTO `zen_paypal_payment_status` VALUES ('3', 'Failed');
INSERT INTO `zen_paypal_payment_status` VALUES ('4', 'Denied');
INSERT INTO `zen_paypal_payment_status` VALUES ('5', 'Refunded');
INSERT INTO `zen_paypal_payment_status` VALUES ('6', 'Canceled_Reversal');
INSERT INTO `zen_paypal_payment_status` VALUES ('7', 'Reversed');

-- ----------------------------
-- Table structure for `zen_paypal_payment_status_history`
-- ----------------------------
DROP TABLE IF EXISTS `zen_paypal_payment_status_history`;
CREATE TABLE `zen_paypal_payment_status_history` (
  `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) NOT NULL DEFAULT '',
  `payment_status` varchar(17) NOT NULL DEFAULT '',
  `pending_reason` varchar(14) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`payment_status_history_id`),
  KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_paypal_payment_status_history
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_paypal_session`
-- ----------------------------
DROP TABLE IF EXISTS `zen_paypal_session`;
CREATE TABLE `zen_paypal_session` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_session_id_zen` (`session_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_paypal_session
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_paypal_testing`
-- ----------------------------
DROP TABLE IF EXISTS `zen_paypal_testing`;
CREATE TABLE `zen_paypal_testing` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) NOT NULL DEFAULT '',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_paypal_testing
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_products`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products`;
CREATE TABLE `zen_products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_image` varchar(64) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_date_added_zen` (`products_date_added`),
  KEY `idx_products_status_zen` (`products_status`),
  KEY `idx_products_date_available_zen` (`products_date_available`),
  KEY `idx_products_ordered_zen` (`products_ordered`),
  KEY `idx_products_model_zen` (`products_model`),
  KEY `idx_products_price_sorter_zen` (`products_price_sorter`),
  KEY `idx_master_categories_id_zen` (`master_categories_id`),
  KEY `idx_products_sort_order_zen` (`products_sort_order`),
  KEY `idx_manufacturers_id_zen` (`manufacturers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_products
-- ----------------------------
INSERT INTO `zen_products` VALUES ('1', '1', '31', 'MG200MMS', 'matrox/mg200mms.gif', '299.9900', '0', '2003-11-03 12:32:17', '2004-04-26 23:57:34', null, '23', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '299.9900', '4', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('2', '1', '31', 'MG400-32MB', 'matrox/mg400-32mb.gif', '499.9900', '0', '2003-11-03 12:32:17', null, null, '23', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '499.9900', '4', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('3', '1', '500', 'MSIMPRO', 'microsoft/msimpro.gif', '49.9900', '0', '2003-11-03 12:32:17', null, null, '7', '1', '1', '2', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '39.9900', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('4', '1', '12', 'DVD-RPMK', 'dvd/replacement_killers.gif', '42.0000', '0', '2003-11-03 12:32:17', null, null, '23', '1', '1', '3', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '42.0000', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('5', '1', '15', 'DVD-BLDRNDC', 'dvd/blade_runner.gif', '35.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:44:28', null, '7', '1', '1', '3', '2', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '30.0000', '11', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('6', '1', '8', 'DVD-MATR', 'dvd/the_matrix.gif', '39.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:48:28', null, '7', '1', '1', '3', '2', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '30.0000', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('7', '1', '500', 'DVD-YGEM', 'dvd/youve_got_mail.gif', '34.9900', '0', '2003-11-03 12:32:17', '2004-04-27 14:53:17', null, '7', '1', '1', '3', '5', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '34.9900', '12', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('8', '1', '499', 'DVD-ABUG', 'dvd/a_bugs_life.gif', '35.9900', '0', '2003-11-03 12:32:17', '2004-04-27 14:52:54', null, '7', '1', '1', '3', '6', '1', '1', '0', '0', '0', '0', '0', '1', '0', '10', '1', '1', '35.9900', '13', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('9', '1', '10', 'DVD-UNSG', 'dvd/under_siege.gif', '29.9900', '0', '2003-11-03 12:32:17', '2004-05-17 13:35:27', null, '7', '1', '1', '3', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '29.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('10', '1', '9', 'DVD-UNSG2', 'dvd/under_siege2.gif', '29.9900', '0', '2003-11-03 12:32:17', null, null, '7', '1', '1', '3', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '29.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('11', '1', '10', 'DVD-FDBL', 'dvd/fire_down_below.gif', '29.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:43:40', null, '7', '1', '1', '3', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '29.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('12', '1', '9', 'DVD-DHWV', 'dvd/die_hard_3.gif', '39.9900', '0', '2003-11-03 12:32:17', '2004-05-16 00:34:33', null, '7', '1', '1', '4', '6', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '39.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('13', '1', '10', 'DVD-LTWP', 'dvd/lethal_weapon.gif', '34.9900', '0', '2003-11-03 12:32:17', '2004-04-27 00:07:35', null, '7', '1', '1', '3', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '34.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('14', '1', '9', 'DVD-REDC', 'dvd/red_corner.gif', '32.0000', '0', '2003-11-03 12:32:17', '2003-12-23 00:47:39', null, '7', '1', '1', '3', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '32.0000', '15', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('15', '1', '9', 'DVD-FRAN', 'dvd/frantic.gif', '35.0000', '0', '2003-11-03 12:32:17', '2003-12-23 00:43:55', null, '7', '1', '1', '3', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '35.0000', '14', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('16', '1', '9', 'DVD-CUFI', 'dvd/courage_under_fire.gif', '38.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:42:57', '2008-02-21 00:00:00', '7', '1', '1', '4', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '29.9900', '15', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('17', '1', '10', 'DVD-SPEED', 'dvd/speed.gif', '39.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:47:51', null, '7', '1', '1', '4', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '39.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('18', '1', '10', 'DVD-SPEED2', 'dvd/speed_2.gif', '42.0000', '0', '2003-11-03 12:32:17', null, null, '7', '1', '1', '4', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '42.0000', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('19', '1', '10', 'DVD-TSAB', 'dvd/theres_something_about_mary.gif', '49.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:49:00', null, '7', '1', '1', '4', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '49.9900', '12', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('20', '1', '8', 'DVD-BELOVED', 'dvd/beloved.gif', '54.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:42:34', null, '7', '1', '1', '3', '2', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '54.9900', '15', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('21', '1', '16', 'PC-SWAT3', 'sierra/swat_3.gif', '79.9900', '0', '2003-11-03 12:32:17', '2004-04-27 14:51:00', null, '7', '1', '1', '7', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '79.9900', '18', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('22', '1', '13', 'PC-UNTM', 'gt_interactive/unreal_tournament.gif', '89.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:49:29', null, '7', '1', '1', '8', '9', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '89.9900', '19', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('23', '1', '16', 'PC-TWOF', 'gt_interactive/wheel_of_time.gif', '99.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:48:50', null, '10', '1', '1', '8', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '99.9900', '20', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('24', '1', '16', 'PC-DISC', 'gt_interactive/disciples.gif', '90.0000', '0', '2003-11-03 12:32:17', '2003-12-23 00:43:24', null, '8', '1', '1', '8', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '90.0000', '20', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('25', '1', '16', 'MSINTKB', 'microsoft/intkeyboardps2.gif', '69.9900', '0', '2003-11-03 12:32:17', '2004-01-04 03:02:41', null, '8', '1', '1', '2', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '69.9900', '8', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('26', '1', '9', 'MSIMEXP', 'microsoft/imexplorer.gif', '64.9500', '0', '2003-11-03 12:32:17', '2004-05-03 01:47:47', null, '8', '1', '1', '2', '17', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '64.9500', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('27', '1', '70', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:45:03', null, '45', '1', '1', '9', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '499.9900', '5', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('28', '1', '999', 'GIFT005', 'gift_certificates/gv_5.gif', '5.0000', '1', '2003-11-03 12:32:17', '2004-01-10 02:57:18', null, '0', '1', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '5.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('29', '1', '985', 'GIFT 010', 'gift_certificates/gv_10.gif', '10.0000', '1', '2003-11-03 12:32:17', '2003-12-28 14:51:36', null, '0', '1', '0', '0', '15', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '10.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('30', '1', '992', 'GIFT025', 'gift_certificates/gv_25.gif', '25.0000', '1', '2003-11-03 12:32:17', null, null, '0', '1', '0', '0', '8', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '25.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('31', '1', '997', 'GIFT050', 'gift_certificates/gv_50.gif', '50.0000', '1', '2003-11-03 12:32:17', null, null, '0', '1', '0', '0', '4', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '50.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('32', '1', '995', 'GIFT100', 'gift_certificates/gv_100.gif', '100.0000', '1', '2003-11-03 12:32:17', null, null, '0', '1', '0', '0', '5', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '100.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('34', '1', '796', 'DVD-ABUG', 'dvd/a_bugs_life.gif', '35.9900', '0', '2003-11-07 22:03:45', '2004-01-01 14:16:01', '2005-02-21 00:00:00', '7', '1', '1', '3', '5', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '35.9900', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('36', '1', '700', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', '0', '2003-12-24 14:29:11', '2004-01-03 01:51:12', null, '45', '1', '1', '9', '0', '1', '1', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '499.0000', '25', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('100', '1', '700', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', '0', '2004-01-08 14:06:13', '2004-01-08 14:06:50', null, '45', '1', '1', '9', '0', '1', '1', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '374.2500', '25', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('39', '1', '997', 'TESTFREE', 'free.gif', '100.0000', '0', '2003-12-25 16:33:13', '2004-01-11 02:29:16', null, '1', '1', '1', '0', '3', '1', '1', '0', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('40', '1', '999', 'TESTCALL', 'call_for_price.jpg', '100.0000', '0', '2003-12-25 17:42:15', '2004-01-04 13:08:08', '2008-02-21 00:00:00', '1', '1', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '100.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('41', '1', '999', 'TESTCALL', 'call_for_price.jpg', '100.0000', '0', '2003-12-25 19:13:35', '2004-09-27 13:33:33', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '100.0000', '28', '0', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('42', '1', '998', 'TESTFREE', 'free.gif', '100.0000', '0', '2003-12-25 19:14:16', '2003-12-25 19:15:00', null, '1', '1', '1', '0', '1', '1', '1', '0', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0.0000', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('43', '1', '999', 'TESTFREEATTRIB', 'free.gif', '100.0000', '0', '2003-12-25 20:44:06', '2004-01-21 16:23:29', null, '0', '1', '1', '0', '0', '1', '1', '0', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('44', '1', '999', 'TESTMINUNITSNOMIX', 'sample_image.gif', '100.0000', '0', '2003-12-25 21:38:59', '2004-01-22 13:15:41', null, '1', '1', '1', '0', '0', '4', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '90.0000', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('46', '1', '981', 'TESTMINUNITSMIX', 'sample_image.gif', '100.0000', '0', '2003-12-25 21:53:07', '2003-12-29 02:00:50', null, '1', '1', '1', '0', '18', '4', '2', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('47', '1', '9996', 'GIFT', 'gift_certificates/gv.gif', '0.0000', '1', '2003-12-27 22:56:57', '2004-09-29 20:11:51', null, '0', '1', '0', '0', '4', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '5.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('48', '1', '9990', 'TEST1', '1_small.jpg', '39.0000', '0', '2003-12-28 02:27:47', '2004-01-11 02:56:37', null, '1', '1', '1', '0', '10', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '39.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('49', '1', '900', 'TEST2', '2_small.jpg', '20.0000', '0', '2003-12-28 02:28:42', '2003-12-29 23:00:27', null, '0.5', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '20.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('50', '1', '1000', 'TEST3', '3_small.jpg', '75.0000', '0', '2003-12-28 02:29:37', '2003-12-29 23:01:04', null, '1.5', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '75.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('51', '1', '998', 'Free1', 'b_g_grid.gif', '25.0000', '0', '2003-12-28 11:51:05', '2004-01-21 17:03:32', null, '10', '1', '1', '0', '2', '1', '1', '0', '1', '0', '1', '1', '1', '0', '0', '0', '0', '0.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('52', '1', '997', 'Free2', 'b_p_grid.gif', '0.0000', '1', '2003-12-28 12:24:58', '2004-01-21 17:01:18', null, '2', '1', '1', '0', '2', '1', '1', '0', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('53', '1', '991', 'MINUNITSMIX', 'b_c_grid.gif', '25.0000', '0', '2003-12-28 23:26:44', '2004-01-11 02:22:35', null, '1', '1', '1', '0', '6', '6', '3', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '20.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('54', '1', '991', 'MINUNITSNOMIX', 'waybkgnd.gif', '25.0000', '0', '2003-12-29 23:19:13', '2004-01-11 02:23:08', null, '1', '1', '1', '0', '0', '6', '3', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '25.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('55', '1', '991', 'MINUNITSMIXSALE', 'b_b_grid.gif', '25.0000', '0', '2003-12-31 11:11:46', '2004-01-11 02:26:28', null, '1', '1', '1', '0', '0', '6', '3', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '25.0000', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('56', '1', '991', 'MINUNITSNOMIXSALE', 'b_w_grid.gif', '25.0000', '0', '2003-12-31 11:13:08', '2004-01-11 02:26:49', null, '1', '1', '1', '0', '0', '6', '3', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '25.0000', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('57', '1', '998', 'TESTFREEALL', 'free.gif', '0.0000', '0', '2003-12-31 11:36:09', '2004-01-21 16:55:19', null, '1', '1', '1', '0', '1', '1', '1', '0', '1', '0', '1', '1', '1', '0', '0', '0', '0', '0.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('59', '1', '700', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', '0', '2003-12-31 14:36:57', '2003-12-31 14:37:05', null, '45', '1', '1', '9', '0', '1', '1', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '300.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('60', '1', '699', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.7500', '0', '2004-01-02 01:34:55', '2004-01-02 01:41:37', null, '45', '1', '1', '9', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '499.7500', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('61', '1', '699', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.7500', '0', '2004-01-02 01:44:09', '2004-01-02 01:45:45', null, '45', '1', '1', '9', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '499.7500', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('101', '1', '1000', 'Test120-90off-10', 'test_demo.jpg', '0.0000', '0', '2004-01-08 14:11:32', '2004-01-08 14:17:09', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '80.0000', '47', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('109', '1', '1000', 'HIDEQTYBOX', '1_small.jpg', '75.0000', '0', '2004-01-21 22:01:20', '2004-01-22 11:21:12', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '1', '0', '0', '0', '75.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('78', '1', '1000', 'Test25-10AttrAll', 'test_demo.jpg', '0.0000', '0', '2004-01-04 01:09:46', '2004-01-04 01:30:12', null, '0', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '112.5000', '25', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('79', '1', '1000', 'Test25-AttrAll', 'test_demo.jpg', '0.0000', '0', '2004-01-04 01:28:52', '2004-01-04 01:33:55', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '150.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('74', '1', '700', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', '0', '2004-01-02 15:34:49', '2004-01-02 15:35:17', null, '45', '1', '1', '9', '0', '1', '1', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '399.2000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('76', '1', '1000', 'Test25-10', 'test_demo.jpg', '100.0000', '0', '2004-01-03 23:08:33', null, null, '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '75.0000', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('80', '1', '1000', 'Test25', 'test_demo.jpg', '100.0000', '0', '2004-01-04 01:31:06', '2004-01-04 13:35:47', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '100.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('84', '1', '999', 'Test120', 'test_demo.jpg', '120.0000', '0', '2004-01-04 15:05:10', '2004-01-06 15:27:39', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '120.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('82', '1', '1000', 'Test120-5', 'test_demo.jpg', '120.0000', '0', '2004-01-04 14:50:38', '2004-01-04 17:09:03', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '115.0000', '27', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('83', '1', '1000', 'Test120-90-5', 'test_demo.jpg', '120.0000', '0', '2004-01-04 15:01:53', '2004-01-06 10:02:11', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '85.0000', '27', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('85', '1', '1000', 'Test90', 'test_demo.jpg', '120.0000', '0', '2004-01-04 15:19:00', '2004-01-06 10:00:35', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('88', '1', '1000', 'Test120-90-10-Skip', 'test_demo.jpg', '120.0000', '0', '2004-01-05 00:14:31', '2004-01-06 09:58:08', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '31', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('89', '1', '1000', 'Test120-90-10-Skip', 'test_demo.jpg', '120.0000', '0', '2004-01-05 00:41:40', '2004-01-06 09:57:42', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '108.0000', '31', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('95', '1', '1000', 'Test120-25-New100-Skip', 'test_demo.jpg', '120.0000', '0', '2004-01-07 02:35:44', '2004-01-07 02:37:27', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '51', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('90', '1', '999', 'Test120-90-10', 'test_demo.jpg', '120.0000', '0', '2004-01-05 23:55:18', '2004-01-06 00:08:58', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '45', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('92', '1', '1000', 'Test120-90off-10', 'test_demo.jpg', '120.0000', '0', '2004-01-05 23:58:54', '2004-01-06 00:09:28', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '120.0000', '45', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('93', '1', '1000', 'Test120-New100', 'test_demo.jpg', '120.0000', '0', '2004-01-06 00:02:32', '2004-01-06 00:04:25', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '100.0000', '46', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('94', '1', '1000', 'Test120-25-New100', 'test_demo.jpg', '120.0000', '0', '2004-01-06 00:04:31', '2004-01-06 00:07:08', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '100.0000', '46', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('96', '1', '1000', 'Test120-New100-Off-Skip', 'test_demo.jpg', '120.0000', '0', '2004-01-07 02:36:52', '2004-01-07 02:37:29', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '100.0000', '51', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('97', '1', '1000', 'Test120-90-10-Price', 'test_demo.jpg', '120.0000', '0', '2004-01-07 11:26:34', '2004-01-07 11:27:24', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '108.0000', '32', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('98', '1', '1000', 'Test120-90off-10-Price', 'test_demo.jpg', '120.0000', '0', '2004-01-07 11:28:16', '2004-01-07 11:29:57', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '108.0000', '32', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('99', '1', '997', 'FreeShipping', 'small_00.jpg', '25.0000', '0', '2004-01-07 13:27:30', '2004-01-21 01:48:48', null, '5', '1', '1', '0', '3', '1', '1', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '25.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('104', '1', '1000', 'HIDEQTY', '1_small.jpg', '75.0000', '0', '2004-01-11 03:02:51', '2004-01-22 11:21:36', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '75.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('105', '1', '999', 'MAXSAMPLE-1', 'waybkgnd.gif', '50.0000', '0', '2004-01-11 14:10:59', '2004-01-11 14:36:00', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '1', '0', '0', '0', '50.0000', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('106', '1', '1000', 'MAXSAMPLE-3', 'waybkgnd.gif', '50.0000', '0', '2004-01-11 14:36:08', '2004-01-11 15:32:56', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '3', '0', '0', '0', '50.0000', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('107', '1', '995', 'FreeShippingNoWeight', 'small_00.jpg', '25.0000', '0', '2004-01-21 01:41:22', '2004-01-21 02:01:54', null, '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '25.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('108', '1', '0', 'SoldOut', 'small_00.jpg', '25.0000', '0', '2004-01-21 01:53:20', null, null, '3', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '25.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('110', '1', '1000', 'Test120-5SKIP', 'test_demo.jpg', '120.0000', '0', '2004-01-24 16:09:52', '2004-01-24 16:15:25', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '115.0000', '52', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('111', '1', '1000', 'Test120-90-5SKIP', 'test_demo.jpg', '120.0000', '0', '2004-01-24 16:10:12', '2004-01-24 16:15:27', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '52', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('112', '1', '998', 'Test2', '', '25.0000', '0', '2004-04-26 02:24:57', '2004-04-26 02:25:44', null, '1', '1', '1', '0', '2', '1', '1', '0', '0', '0', '1', '0', '1', '0', '2', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('113', '1', '994', 'Test4', '', '25.0000', '0', '2004-04-26 02:25:03', '2004-04-26 02:25:35', null, '1', '1', '1', '0', '6', '1', '1', '0', '0', '0', '1', '0', '1', '0', '4', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('114', '1', '998', 'Test5', '', '25.0000', '0', '2004-04-26 02:25:53', '2004-04-26 02:26:15', null, '1', '1', '1', '0', '2', '1', '1', '0', '0', '0', '1', '0', '1', '0', '5', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('115', '1', '999', 'Test1', '', '25.0000', '0', '2004-04-26 02:26:23', '2004-05-06 21:50:19', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '1', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('116', '1', '997', 'Test8', '', '25.0000', '0', '2004-04-26 02:26:54', '2004-04-26 02:27:18', null, '1', '1', '1', '0', '3', '1', '1', '0', '0', '0', '1', '0', '1', '0', '8', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('117', '1', '995', 'Test3', '', '25.0000', '0', '2004-04-26 02:27:24', '2004-10-03 12:20:14', null, '1', '1', '1', '0', '5', '1', '1', '0', '0', '0', '1', '0', '1', '0', '3', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('118', '1', '999', 'Test10', '', '25.0000', '0', '2004-04-26 02:27:52', '2004-04-26 02:28:14', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '10', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('119', '1', '1000', 'Test6', '', '25.0000', '0', '2004-04-26 02:28:22', '2004-10-06 18:26:25', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '6', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('120', '1', '1000', 'Test7', '', '25.0000', '0', '2004-04-26 02:29:03', '2004-04-26 02:29:23', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '7', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('121', '1', '999', 'Test12', '', '25.0000', '0', '2004-04-26 02:29:36', '2004-04-28 13:02:47', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '12', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('122', '1', '998', 'Test9', '', '25.0000', '0', '2004-04-26 02:30:12', '2004-04-26 02:30:32', null, '1', '1', '1', '0', '2', '1', '1', '0', '0', '0', '1', '0', '1', '0', '9', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('123', '1', '999', 'Test11', '', '25.0000', '0', '2004-04-26 02:30:41', '2004-04-26 02:31:04', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '11', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('130', '1', '1000', 'Special', '2_small.jpg', '15.0000', '0', '2004-04-28 02:19:53', '2004-10-06 00:05:34', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '1', '1', '10.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('127', '1', '1000', 'Normal', 'small_00.jpg', '15.0000', '0', '2004-04-28 01:51:35', '2004-04-28 14:23:29', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '1', '0', '15.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('131', '1', '1000', 'PERWORDREQ', '', '0.0000', '0', '2004-05-01 01:31:28', '2004-05-07 21:30:23', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '5.0000', '57', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('132', '1', '997', 'GolfClub', '9_small.jpg', '0.0000', '0', '2004-05-02 12:36:12', '2004-05-02 18:04:36', null, '1', '1', '1', '0', '3', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '14.4500', '58', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('133', '1', '1000', 'DOWNLOAD2', '2_small.jpg', '49.9900', '0', '2004-05-02 23:51:33', '2004-05-03 00:06:58', null, '0', '1', '1', '0', '2', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '49.9900', '60', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('134', '1', '1000', 'PERLETTERREQ', '', '0.0000', '0', '2004-05-07 21:23:58', '2004-05-07 21:29:50', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '5.0000', '57', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('154', '1', '10000', 'ROPE', '9_small.jpg', '1.0000', '0', '2004-05-16 21:08:08', '2004-07-12 17:18:46', null, '0', '1', '1', '0', '0', '10', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '1.0000', '58', '0', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('155', '1', '1000', 'PRICEFACTOR', 'sample_image.gif', '10.0000', '0', '2004-05-17 23:03:10', '2004-07-12 17:21:04', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '10.0000', '56', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('156', '1', '1000', 'PRICEFACTOROFF', 'sample_image.gif', '10.0000', '0', '2004-05-17 23:05:24', '2004-05-17 23:10:12', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '10.0000', '56', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('157', '1', '1000', 'PRICEFACTOROFFATTR', 'sample_image.gif', '10.0000', '0', '2004-05-17 23:10:18', '2004-05-17 23:13:48', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '10.0000', '56', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('158', '1', '1000', 'ONETIME', 'b_b_grid.gif', '45.0000', '0', '2004-05-17 23:22:08', null, null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '45.0000', '56', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('159', '1', '10000', 'ATTQTYPRICE', 'b_c_grid.gif', '25.0000', '0', '2004-05-17 23:29:31', '2004-05-17 23:49:56', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '25.0000', '56', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('160', '1', '997', 'GolfClub', '9_small.jpg', '0.0000', '0', '2004-05-18 10:14:35', '2004-05-18 10:15:16', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '14.4500', '61', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('165', '1', '10000', 'ROPE', '9_small.jpg', '1.0000', '0', '2004-05-18 10:42:50', '2004-07-12 17:18:12', null, '0', '1', '1', '0', '0', '10', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '1.0000', '61', '0', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('166', '2', '10000', 'RTBHUNTER', 'sooty.jpg', '4.9900', '0', '2004-05-18 10:42:50', '2004-05-18 10:43:00', null, '3', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '3.0000', '62', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('167', '3', '0', '', '', '0.0000', '0', '2004-05-18 10:42:50', '2004-10-06 00:39:10', null, '0', '1', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0000', '63', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('168', '1', '1000', 'PGT', 'samples/1_small.jpg', '3.9500', '0', '2004-07-12 15:25:32', '2004-07-12 16:26:08', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '10', '0', '0', '3.9500', '64', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('169', '2', '1000', 'PMT', 'samples/2_small.jpg', '3.9500', '0', '2004-07-12 15:27:50', '2004-07-12 16:29:01', null, '1', '1', '1', null, '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '20', '0', '0', '3.9500', '64', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('170', '3', '0', '', 'samples/3_small.jpg', '0.0000', '0', '2004-07-12 15:29:23', '2004-09-27 23:11:25', null, '0', '1', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '30', '0', '0', '0.0000', '64', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('171', '4', '1000', 'DPT', 'samples/4_small.jpg', '0.9346', '0', '2004-07-12 15:32:40', '2004-07-12 17:46:49', null, '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '40', '0', '0', '3.9500', '64', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('172', '5', '1000', 'PFS', 'samples/5_small.jpg', '3.9500', '0', '2004-07-12 15:39:18', '2004-07-12 23:08:43', null, '5', '1', '0', '0', '0', '1', '1', '0', '0', '0', '1', '1', '1', '0', '50', '0', '0', '3.9500', '64', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('173', '1', '1000', 'Book', 'b_g_grid.gif', '0.0000', '0', '2004-09-24 23:54:34', '2004-09-26 02:50:59', null, '0', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '52.5000', '61', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('174', '1', '999', 'TESTCALL', 'call_for_price.jpg', '0.0000', '0', '2004-09-27 13:25:44', '2004-09-27 13:28:54', '2008-02-21 00:00:00', '1', '1', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.0000', '24', '0', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('175', '1', '1000', 'Normal', '1_small.jpg', '60.0000', '0', '2004-09-27 23:32:52', '2004-10-05 17:13:20', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '60.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('176', '1', '1000', 'Normal', 'small_00.jpg', '100.0000', '0', '2004-10-05 16:45:25', '2004-10-05 16:47:22', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '1', '0', '100.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('177', '1', '1000', 'Special', '2_small.jpg', '100.0000', '0', '2004-10-05 16:47:45', '2004-10-06 00:05:48', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '1', '1', '75.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('179', '1', '1000', 'DOWNLOAD1', '1_small.jpg', '39.0000', '0', '2004-10-06 00:08:33', '2004-10-06 00:18:51', null, '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '39.0000', '60', '1', '0', '0', '0', '0', '0');
INSERT INTO `zen_products` VALUES ('178', '1', '1000', 'Normal', '1_small.jpg', '60.0000', '0', '2004-10-05 16:54:52', '2004-10-05 17:15:02', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '50.0000', '55', '1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `zen_products_attributes`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products_attributes`;
CREATE TABLE `zen_products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(64) DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`),
  KEY `idx_opt_sort_order_zen` (`products_options_sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_products_attributes
-- ----------------------------
INSERT INTO `zen_products_attributes` VALUES ('1', '1', '4', '1', '0.0000', '', '10', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('2', '1', '4', '2', '50.0000', '+', '20', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('3', '1', '4', '3', '70.0000', '+', '30', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('4', '1', '3', '5', '0.0000', '+', '10', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('5', '1', '3', '6', '100.0000', '+', '20', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('6', '2', '4', '3', '10.0000', '-', '30', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('7', '2', '4', '4', '0.0000', '+', '40', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('8', '2', '3', '6', '0.0000', '+', '20', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('9', '2', '3', '7', '120.0000', '+', '30', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('10', '26', '3', '8', '0.0000', '+', '20', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('11', '26', '3', '9', '6.0000', '+', '10', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('26', '22', '5', '10', '0.0000', '+', '10', '0', '7', '-', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('27', '22', '5', '13', '0.0000', '+', '1000', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('85', '34', '1', '25', '0.2000', '+', '20', '0', '0.1', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('65', '34', '13', '35', '5.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('64', '34', '13', '36', '2.0000', '+', '20', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('63', '34', '13', '34', '1.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('56', '34', '7', '0', '0.2500', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('55', '34', '8', '0', '0.2500', '+', '0', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('54', '34', '11', '0', '1.0000', '+', '0', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('53', '34', '9', '0', '0.7500', '+', '0', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('52', '34', '10', '0', '0.5000', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('410', '54', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('47', '34', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('46', '34', '6', '22', '1.0000', '+', '20', '0', '2', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('45', '34', '6', '14', '36.9900', '+', '30', '0', '9', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('394', '50', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('393', '50', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('426', '55', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('44', '34', '2', '18', '0.0000', '+', '30', '0', '0', '+', '0', '1', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('43', '34', '2', '20', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('425', '55', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('42', '34', '2', '19', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('41', '34', '2', '21', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('40', '34', '1', '17', '0.3000', '+', '30', '0', '0.1', '', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('39', '34', '1', '16', '0.1000', '+', '10', '0', '0.1', '', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('38', '34', '1', '15', '0.4000', '+', '50', '0', '0', '', '0', '0', '1', 'attributes/a_bugs_life_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('48', '34', '5', '24', '1.0000', '+', '10', '0', '2', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('968', '100', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('422', '36', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('101', '36', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('102', '36', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('103', '36', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('104', '36', '1', '29', '519.0000', '', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('105', '36', '1', '30', '499.0000', '', '90', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('106', '36', '1', '15', '539.0000', '', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('967', '100', '1', '15', '539.0000', '', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('966', '100', '1', '30', '499.0000', '', '90', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('965', '100', '1', '29', '519.0000', '', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('964', '100', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('963', '100', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('962', '100', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('119', '43', '1', '16', '5.0000', '+', '10', '1', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('120', '43', '1', '17', '6.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('121', '43', '1', '29', '7.0000', '+', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('122', '43', '2', '21', '0.0000', '+', '20', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('123', '43', '2', '18', '1.0000', '+', '30', '1', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('124', '43', '2', '20', '2.0000', '+', '40', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('125', '44', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('126', '44', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('127', '44', '1', '29', '0.0000', '+', '80', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('128', '44', '2', '21', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('129', '44', '2', '18', '1.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('130', '44', '2', '20', '2.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('141', '46', '2', '18', '1.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('140', '46', '2', '21', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('139', '46', '1', '29', '0.0000', '+', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('138', '46', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('137', '46', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('142', '46', '2', '20', '2.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('143', '44', '2', '37', '0.0000', '+', '5', '0', '0', '+', '1', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('144', '46', '2', '37', '0.0000', '+', '5', '1', '0', '+', '1', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('160', '47', '14', '38', '5.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('161', '47', '14', '39', '10.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('162', '47', '14', '41', '15.0000', '+', '15', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('163', '47', '14', '43', '100.0000', '+', '100', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('164', '47', '14', '40', '25.0000', '+', '25', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('165', '47', '14', '42', '50.0000', '+', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('407', '49', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('401', '53', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('406', '49', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('405', '49', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('86', '34', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('311', '48', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('310', '48', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('308', '48', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('309', '48', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('307', '48', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('306', '48', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('398', '53', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('399', '53', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('395', '50', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('390', '50', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('400', '53', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('397', '53', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('392', '50', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('391', '50', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('403', '49', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('396', '53', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('404', '49', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('87', '34', '1', '27', '0.0000', '+', '60', '0', '0.1', '+', '0', '0', '1', 'attributes/a_bugs_life_purple.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('88', '34', '1', '28', '0.0000', '+', '70', '0', '0', '+', '0', '0', '1', 'attributes/a_bugs_life_brown.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('89', '34', '1', '30', '0.0000', '+', '90', '0', '0', '+', '0', '0', '1', 'attributes/a_bugs_life_white.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('90', '34', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/a_bugs_life_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('402', '49', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('411', '54', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('412', '54', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('413', '54', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('414', '54', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('415', '54', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('417', '46', '13', '34', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('418', '46', '13', '35', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('419', '46', '13', '36', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('420', '46', '13', '44', '0.0000', '+', '5', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('421', '43', '1', '45', '0.0000', '+', '5', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('427', '55', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('428', '55', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('429', '55', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('430', '55', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('431', '56', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('432', '56', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('433', '56', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('434', '56', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('435', '56', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('436', '56', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('449', '59', '1', '15', '539.0000', '', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('448', '59', '1', '30', '499.0000', '', '90', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('447', '59', '1', '29', '519.0000', '', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('446', '59', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('445', '59', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('444', '59', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('450', '59', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('451', '60', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('452', '60', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('453', '60', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('454', '60', '1', '29', '10.0000', '+', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('455', '60', '1', '30', '0.0000', '', '90', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('456', '60', '1', '15', '20.0000', '+', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('457', '60', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('458', '61', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('459', '61', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('460', '61', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('461', '61', '1', '29', '10.0000', '+', '80', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('462', '61', '1', '30', '0.0000', '', '90', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('463', '61', '1', '15', '20.0000', '+', '50', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('464', '61', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('972', '101', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('971', '101', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('970', '101', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('969', '101', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('991', '110', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('988', '109', '5', '52', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('987', '109', '5', '10', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('990', '110', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('483', '74', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('482', '74', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('484', '74', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('485', '74', '1', '29', '519.0000', '', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('486', '74', '1', '30', '499.0000', '', '90', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('487', '74', '1', '15', '539.0000', '', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('488', '74', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('505', '76', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('504', '76', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('503', '76', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('502', '76', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('501', '76', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('500', '76', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('499', '76', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('496', '46', '10', '0', '0.7500', '+', '0', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('497', '46', '9', '0', '0.5000', '+', '0', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('498', '46', '11', '0', '0.2500', '+', '0', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('506', '76', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('507', '76', '13', '36', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('508', '78', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('509', '78', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('510', '78', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('511', '78', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('512', '78', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('513', '78', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('514', '78', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('515', '78', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('516', '78', '13', '36', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('517', '79', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('518', '79', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('519', '79', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('520', '79', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('521', '79', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('522', '79', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('523', '79', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('524', '79', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('525', '79', '13', '36', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('526', '80', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('527', '80', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('528', '80', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('529', '80', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('530', '80', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('531', '80', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('532', '80', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('533', '80', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('534', '80', '13', '36', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('570', '84', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('569', '84', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('568', '84', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('567', '84', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('566', '84', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('565', '84', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('564', '84', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('563', '84', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('562', '84', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('678', '82', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('677', '82', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('676', '82', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('675', '82', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('674', '82', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('673', '82', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('694', '83', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('693', '83', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('692', '83', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('691', '83', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('690', '83', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('689', '83', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('571', '85', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('572', '85', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('573', '85', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('574', '85', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('575', '85', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('576', '85', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('577', '85', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('578', '85', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('579', '85', '13', '36', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('879', '88', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('878', '88', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('877', '88', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('876', '88', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('873', '88', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('874', '88', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('875', '88', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('895', '89', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('894', '89', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('893', '89', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('892', '89', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('889', '89', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('890', '89', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('891', '89', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('806', '90', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('805', '90', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('804', '90', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('803', '90', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('802', '90', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('801', '90', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('822', '92', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('821', '92', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('820', '92', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('819', '92', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('818', '92', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('817', '92', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('710', '93', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('709', '93', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('708', '93', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('707', '93', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('706', '93', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('705', '93', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('726', '94', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('725', '94', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('724', '94', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('723', '94', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('722', '94', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('721', '94', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('661', '84', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('662', '84', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('663', '84', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('668', '84', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('669', '84', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('671', '84', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('679', '82', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('672', '84', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('680', '82', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('681', '82', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('682', '82', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('683', '82', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('684', '82', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('685', '82', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('686', '82', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('687', '82', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('688', '82', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('695', '83', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('696', '83', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('697', '83', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('698', '83', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('699', '83', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('700', '83', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('701', '83', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('702', '83', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('703', '83', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('704', '83', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('711', '93', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('712', '93', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('713', '93', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('714', '93', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('715', '93', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('716', '93', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('717', '93', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('718', '93', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('719', '93', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('720', '93', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('727', '94', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('728', '94', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('729', '94', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('730', '94', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('731', '94', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('732', '94', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('733', '94', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('734', '94', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('735', '94', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('736', '94', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('872', '88', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('871', '88', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('870', '88', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('868', '88', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('869', '88', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('867', '88', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('866', '88', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('888', '89', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('887', '89', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('886', '89', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('884', '89', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('885', '89', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('883', '89', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('882', '89', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('807', '90', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('808', '90', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('809', '90', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('810', '90', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('811', '90', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('812', '90', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('813', '90', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('814', '90', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('815', '90', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('816', '90', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('823', '92', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('824', '92', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('825', '92', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('826', '92', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('827', '92', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('828', '92', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('829', '92', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('830', '92', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('831', '92', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('832', '92', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('865', '88', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('881', '89', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('880', '88', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('896', '89', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('897', '95', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('898', '95', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('899', '95', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('900', '95', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('901', '95', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('902', '95', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('903', '95', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('904', '95', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('905', '95', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('906', '95', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('907', '95', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('908', '95', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('909', '95', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('910', '95', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('911', '95', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('912', '95', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('913', '96', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('914', '96', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('915', '96', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('916', '96', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('917', '96', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('918', '96', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('919', '96', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('920', '96', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('921', '96', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('922', '96', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('923', '96', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('924', '96', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('925', '96', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('926', '96', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('927', '96', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('928', '96', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('929', '97', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('930', '97', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('931', '97', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('932', '97', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('933', '97', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('934', '97', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('935', '97', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('936', '97', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('937', '97', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('938', '97', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('939', '97', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('940', '97', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('941', '97', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('942', '97', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('943', '97', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('944', '97', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('945', '98', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('946', '98', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('947', '98', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('948', '98', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('949', '98', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('950', '98', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('951', '98', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('952', '98', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('953', '98', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('954', '98', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('955', '98', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('956', '98', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('957', '98', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('958', '98', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('959', '98', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('960', '98', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('973', '101', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('974', '101', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('975', '101', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('976', '101', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('977', '101', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('978', '101', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('979', '101', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('980', '101', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('981', '101', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('982', '101', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('983', '101', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('984', '101', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('992', '110', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('993', '110', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('994', '110', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('995', '110', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('996', '110', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('997', '110', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('998', '110', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('999', '110', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1000', '110', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1001', '110', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1002', '110', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1003', '110', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1004', '110', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1005', '110', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1006', '111', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1007', '111', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1008', '111', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1009', '111', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1010', '111', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1011', '111', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1012', '111', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1013', '111', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1014', '111', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1015', '111', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1016', '111', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1017', '111', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1018', '111', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1019', '111', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1020', '111', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1021', '111', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1027', '131', '1', '16', '5.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `zen_products_attributes` VALUES ('1028', '131', '1', '26', '5.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `zen_products_attributes` VALUES ('1025', '131', '10', '0', '0.0000', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0500', '0', '0.0000', '0', '1');
INSERT INTO `zen_products_attributes` VALUES ('1029', '131', '1', '17', '5.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `zen_products_attributes` VALUES ('1030', '131', '9', '0', '0.0000', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0500', '3', '0.0000', '0', '1');
INSERT INTO `zen_products_attributes` VALUES ('1031', '132', '16', '53', '14.4500', '+', '30', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1032', '132', '16', '54', '14.4500', '+', '40', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1033', '132', '16', '55', '14.4500', '+', '50', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1034', '132', '16', '56', '14.4500', '+', '60', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1035', '132', '16', '57', '14.4500', '+', '90', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1036', '132', '16', '58', '14.4500', '+', '200', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1037', '132', '16', '61', '14.4500', '+', '20', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1038', '132', '16', '59', '14.4500', '+', '70', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1039', '132', '16', '60', '14.4500', '+', '80', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1040', '133', '5', '10', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1041', '133', '17', '62', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1042', '133', '17', '63', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1043', '133', '5', '64', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1044', '133', '5', '52', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1045', '134', '10', '0', '0.0000', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0200', '0', '1');
INSERT INTO `zen_products_attributes` VALUES ('1046', '134', '1', '16', '5.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `zen_products_attributes` VALUES ('1047', '134', '1', '26', '5.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `zen_products_attributes` VALUES ('1048', '134', '1', '17', '5.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `zen_products_attributes` VALUES ('1049', '134', '9', '0', '0.0000', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0200', '3', '1');
INSERT INTO `zen_products_attributes` VALUES ('1050', '154', '18', '65', '0.0000', '+', '10', '0', '0.25', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1051', '154', '18', '66', '1.5000', '+', '20', '0', '0.75', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1052', '155', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '1.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1053', '155', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '2.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1054', '155', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '3.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1055', '156', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '1.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1056', '156', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '2.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1057', '156', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '3.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1058', '157', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '1.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1059', '157', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '2.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1060', '157', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '3.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1061', '158', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '5.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1062', '158', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '10.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1063', '158', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '15.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1064', '159', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1:11,3:10.00,6:9.00,9:8.00,12:7.00,15:6.00', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1065', '159', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '3:11.00,6:10.00,9:9.00,12:8.00,15:7.00', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1066', '159', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '3:10.50,6:9.50,9:8.50,12:7.50,15:6.50', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1071', '160', '16', '55', '14.4500', '+', '50', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1070', '160', '16', '54', '14.4500', '+', '40', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1069', '160', '16', '53', '14.4500', '+', '30', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1072', '160', '16', '56', '14.4500', '+', '60', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1073', '160', '16', '57', '14.4500', '+', '90', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1074', '160', '16', '58', '14.4500', '+', '200', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1075', '160', '16', '61', '14.4500', '+', '20', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1076', '160', '16', '59', '14.4500', '+', '70', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1077', '160', '16', '60', '14.4500', '+', '80', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1090', '165', '18', '65', '0.0000', '+', '10', '0', '0.25', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1091', '165', '18', '66', '1.5000', '+', '20', '0', '0.75', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1088', '171', '17', '63', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1089', '171', '17', '62', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1092', '172', '19', '67', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1093', '173', '5', '10', '20.0000', '', '10', '0', '0', '+', '0', '0', '0', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1094', '173', '5', '64', '20.0000', '', '100', '0', '0', '+', '0', '0', '0', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1095', '173', '5', '68', '52.5000', '', '5', '0', '1', '', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1096', '175', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1097', '175', '1', '26', '100.0000', '+', '40', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1098', '178', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1099', '178', '1', '26', '100.0000', '+', '40', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1100', '179', '17', '63', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `zen_products_attributes` VALUES ('1103', '179', '17', '62', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');

-- ----------------------------
-- Table structure for `zen_products_attributes_download`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products_attributes_download`;
CREATE TABLE `zen_products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_products_attributes_download
-- ----------------------------
INSERT INTO `zen_products_attributes_download` VALUES ('26', 'unreal.zip', '7', '3');
INSERT INTO `zen_products_attributes_download` VALUES ('1040', 'test.zip', '7', '5');
INSERT INTO `zen_products_attributes_download` VALUES ('1041', 'test2.zip', '7', '5');
INSERT INTO `zen_products_attributes_download` VALUES ('1042', 'test2.zip', '7', '5');
INSERT INTO `zen_products_attributes_download` VALUES ('1043', 'test.zip', '7', '5');
INSERT INTO `zen_products_attributes_download` VALUES ('1044', 'test.zip', '7', '5');
INSERT INTO `zen_products_attributes_download` VALUES ('1088', 'ms_word_sample.zip', '7', '5');
INSERT INTO `zen_products_attributes_download` VALUES ('1089', 'pdf_sample.zip', '7', '5');
INSERT INTO `zen_products_attributes_download` VALUES ('1093', 'test.zip', '7', '5');
INSERT INTO `zen_products_attributes_download` VALUES ('1094', 'test2.zip', '7', '5');
INSERT INTO `zen_products_attributes_download` VALUES ('1100', 'ms_word_sample.zip', '7', '5');
INSERT INTO `zen_products_attributes_download` VALUES ('1103', 'pdf_sample.zip', '7', '5');

-- ----------------------------
-- Table structure for `zen_products_description`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products_description`;
CREATE TABLE `zen_products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `idx_products_name_zen` (`products_name`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_products_description
-- ----------------------------
INSERT INTO `zen_products_description` VALUES ('1', '1', 'Matrox G200 MMS', 'Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br /><br />With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br /><br />Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.', 'www.matrox.com/mga/products/g200_mms/home.cfm', '0');
INSERT INTO `zen_products_description` VALUES ('2', '1', 'Matrox G400 32MB', 'Dramatically Different High Performance Graphics<br /><br />Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br /><br />Key features:<ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', '0');
INSERT INTO `zen_products_description` VALUES ('3', '1', 'Microsoft IntelliMouse Pro', 'Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.', 'www.microsoft.com/hardware/mouse/intellimouse.asp', '0');
INSERT INTO `zen_products_description` VALUES ('4', '1', 'The Replacement Killers', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 80 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.replacement-killers.com', '0');
INSERT INTO `zen_products_description` VALUES ('5', '1', 'Blade Runner - Director\'s Cut Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 112 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.bladerunner.com', '0');
INSERT INTO `zen_products_description` VALUES ('6', '1', 'The Matrix Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch.\r\n<br />\r\nAudio: Dolby Surround.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 131 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Making Of.', 'www.thematrix.com', '0');
INSERT INTO `zen_products_description` VALUES ('7', '1', 'You\'ve Got Mail Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch, Spanish. <br />Subtitles: English, Deutsch, Spanish, French, Nordic, Polish. <br />Audio: Dolby Digital 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 115 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.youvegotmail.com', '0');
INSERT INTO `zen_products_description` VALUES ('8', '1', 'A Bug\'s Life Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Digital 5.1 / Dolby Surround Stereo. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 91 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.abugslife.com', '0');
INSERT INTO `zen_products_description` VALUES ('9', '1', 'Under Siege Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Surround 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 98 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('10', '1', 'Under Siege 2 - Dark Territory', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 98 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('11', '1', 'Fire Down Below Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 100 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('12', '1', 'Die Hard With A Vengeance Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Surround 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 122 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('13', '1', 'Lethal Weapon Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 100 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('14', '1', 'Red Corner Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 117 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('15', '1', 'Frantic Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 115 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('16', '1', 'Courage Under Fire Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 112 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('17', '1', 'Speed Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 112 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('18', '1', 'Speed 2: Cruise Control', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 120 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('19', '1', 'There\'s Something About Mary Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 114 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('20', '1', 'Beloved Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 164 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `zen_products_description` VALUES ('21', '1', 'SWAT 3: Close Quarters Battle Linked', 'Windows 95/98<br /><br />211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and &quot;When needed&quot; to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!', 'www.swat3.com', '0');
INSERT INTO `zen_products_description` VALUES ('22', '1', 'Unreal Tournament Linked', 'From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br /><br />This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.', 'www.unrealtournament.net', '0');
INSERT INTO `zen_products_description` VALUES ('23', '1', 'The Wheel Of Time Linked', 'The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br /><br />During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.', 'www.wheeloftime.com', '0');
INSERT INTO `zen_products_description` VALUES ('24', '1', 'Disciples: Sacred Lands Linked', 'A new age is dawning...<br /><br />Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br /><br />The day of reckoning has come... and only the chosen will survive.', '', '0');
INSERT INTO `zen_products_description` VALUES ('25', '1', 'Microsoft Internet Keyboard PS/2', 'The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!', '', '0');
INSERT INTO `zen_products_description` VALUES ('26', '1', 'Microsoft IntelliMouse Explorer', 'Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!', 'www.microsoft.com/hardware/mouse/explorer.asp', '0');
INSERT INTO `zen_products_description` VALUES ('27', '1', 'Hewlett Packard LaserJet 1100Xi Linked', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br /><br />Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br /><br />HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `zen_products_description` VALUES ('28', '1', 'Gift Certificate $  5.00', 'Purchase a Gift Certificate today to share with your family, friends or business associates!', '', '0');
INSERT INTO `zen_products_description` VALUES ('29', '1', 'Gift Certificate $ 10.00', 'Purchase a Gift Certificate today to share with your family, friends or business associates!', '', '0');
INSERT INTO `zen_products_description` VALUES ('30', '1', 'Gift Certificate $ 25.00', 'Purchase a Gift Certificate today to share with your family, friends or business associates!', '', '0');
INSERT INTO `zen_products_description` VALUES ('31', '1', 'Gift Certificate $ 50.00', 'Purchase a Gift Certificate today to share with your family, friends or business associates!', '', '0');
INSERT INTO `zen_products_description` VALUES ('32', '1', 'Gift Certificate $100.00', 'Purchase a Gift Certificate today to share with your family, friends or business associates!', '', '0');
INSERT INTO `zen_products_description` VALUES ('34', '1', 'A Bug\'s Life \"Multi Pak\" Special 2003 Collectors Edition', 'A Bug\'s Life \"Multi Pak\" Special 2003 Collectors Edition\r\n<br />\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Digital 5.1 / Dolby Surround Stereo.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 91 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.abugslife.com', '0');
INSERT INTO `zen_products_description` VALUES ('36', '1', 'Hewlett Packard - by attributes SALE', 'The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are set for the discount to be applied, their prices before the discount are:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00<br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `zen_products_description` VALUES ('57', '1', 'A Free Product - All', 'This is a free product where there are no prices at all.\r\n<br /><br />\r\n\r\nThe Always Free Shipping is also turned ON.\r\n<br /><br />\r\n\r\nIf this is bought separately, the Zen Cart Free Charge payment module will show if there is no charges on shipping.\r\n<br /><br />\r\n\r\nIf other products are purchased with a price or shipping charge, then the Zen Cart Free Charge payment module will not show and the shipping will be applied accordingly.', '', '0');
INSERT INTO `zen_products_description` VALUES ('101', '1', 'TEST $120 Sale 10% Special off', 'Product is Priced by Attributes.\r\n<br /><br />\r\n\r\nAttribute Option Group: Color and Size are used for pricing by marking these as Included in Base Price.\r\n<br /><br />\r\n\r\nGift Options has everything marked included in base price also, but because None is set to $0.00 that groups lowest price is $0.00 so it is not affecting the Base Price.\r\n<br /><br />\r\n\r\nIf None was not part of this group and you did not want to include those prices, you would mark all of the Gift Option Attributes to NOT be included in the Base Price.\r\n<br /><br />\r\n\r\nProduct Product is $0.00\r\n<br /><br />\r\n\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('100', '1', 'Hewlett Packard - by attributes SALE with Special', 'The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are set for the discount to be applied, their prices before the discount are:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00<br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `zen_products_description` VALUES ('39', '1', 'A Free Product', 'This is a free product that is also on special.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br /><br />\r\n\r\nWhile this is a FREE product, this does have Shipping.', '', '0');
INSERT INTO `zen_products_description` VALUES ('40', '1', 'A Call for Price Product', 'This is a Call for Price product that is also on special.\r\n<br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('41', '1', 'A Call for Price Product SALE', 'This is a Call for Price product that is also on special and has a Sale price via Sale Maker.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons automatically change to Call for Price, which is defined as: TEXT_CALL_FOR_PRICE\r\n<br /><br />\r\n\r\nThis link will take the customer to the Contact Us page.\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('42', '1', 'A Free Product - SALE', 'This is a free product that is also on special.\r\n<br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('43', '1', 'A Free Product with Attributes', 'This is a free product that is also on special.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br /><br />\r\n\r\nAttributes can be added that can optionally be set to free or not free\r\n<br /><br />\r\n\r\nThe Color Red attribute is priced at $5.00 but marked as a Free Attribute when the Product is Free\r\n<br /><br />\r\n\r\nThe Size Medium attribute is priced at $1.00 but marked as a Free Attribute when Product is Free', '', '0');
INSERT INTO `zen_products_description` VALUES ('44', '1', 'A Mixed OFF Product with Attributes', 'This product has attributes and a minimum qty and units.\r\n<br /><br />\r\n\r\nMixed is OFF this means you CANNOT mix attributes to make the minimums and units.\r\n<br /><br />\r\n\r\nThe Size Option Value: Select from Below ... is a Display Only Attribute. \r\n<br /><br />\r\n\r\nThis means that the product cannot be added to the Shopping Cart if that Option Value is selected. If it is still selected, then an error is triggered when the Add to Cart is pressed with a warning to the customer on what the error is.\r\n<br /><br />\r\n\r\nNo checkout is allowed when errors exist.', '', '0');
INSERT INTO `zen_products_description` VALUES ('46', '1', 'A Mixed ON Product with Attributes', 'This product has attributes and a minimum qty and units.\r\n<br /><br />\r\n\r\nMixed is ON this means you CAN mix attributes to make the minimums and units.\r\n<br /><br />\r\n\r\nSelect from Below is a Display Only Attribute. This means that it cannot be added to the cart. If it is, then an error is triggered.\r\n<br /><br />\r\n\r\nNo checkout is allowed when errors exist.', '', '0');
INSERT INTO `zen_products_description` VALUES ('47', '1', 'Gift Certificates by attributes', 'Priced by Attributes Gift Certificates.', '', '0');
INSERT INTO `zen_products_description` VALUES ('48', '1', 'Test 1', 'This is a test product for copying and deleting attributes.\r\n<br /><br />\r\nAll of the images for this product are in the main /images directory and /large directory.\r\n<br /><br />\r\nThe main products_image is called 1_small.jpg\r\n<br /><br />\r\nThere are additional images for this product that will auto load located in /images called:<br />\r\n1_small_01.jpg<br />\r\n1_small_02.jpg<br />\r\n1_small_03.jpg<br />\r\n<br />\r\nThe large additional images are in /images/large called:<br />\r\n1_small_01_LRG.jpg<br />\r\n1_small_02_LRG.jpg<br />\r\n1_small_03_LRG.jpg<br />\r\n\r\n<br /><br />\r\n\r\nThe naming conventions for the additional images do not require that they be numeric. Using the numberic system helps establish the sort order of the images and how they will display.\r\n<br /><br />\r\n\r\nWhat is important is that all the additional images be located in the same directory and start with the same name: 1_small and end in the same extenion: .jpg\r\n<br /><br />\r\n\r\nThe additional large images need to be located in the /large directory and use the same name plus the Large image suffix, defined in the Admin ... Images ... in this case _LRG\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('49', '1', 'Test 2', 'This is a test product for copying and deleting attributes.\r\n<br /><br />\r\n\r\nThis was made using the Attributes Copy to Product in the new Admin ... Catalog ... Attributes Controller ... and copying the Attributes from the Test 1 product to Test 2.\r\n<br /><br />\r\n\r\nThis product does not have any additional images.\r\n<br /><br />\r\n\r\nIt does have a Large image located in /large\r\n<br /><br />\r\n\r\nThis uses the same name: 2_small plus the large image suffix _LRG plus the matching extension .jpg to give the new name: /images/large/2_small_LRG.jpg\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('50', '1', 'Test 3', 'This is a test product for copying and deleting attributes.\r\n<br /><br />\r\n\r\nThis was made using the Attributes Copy to Product in the new Admin ... Catalog ... Attributes Controller ... and copying the attributes from the Test 2 product to Test 3.\r\n<br /><br />\r\n\r\nThis product does not have any additional images.\r\n<br /><br />\r\n\r\nIt does NOT have a Large image located in /large\r\n<br /><br />\r\n\r\nThis means that when you click on the image for enlarge, unless the original image is larger than the small image settings you will see the same image in the popup.\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('51', '1', 'Free Ship & Payment Virtual weight 10', 'Free Shipping and Payment\r\n<br /><br />\r\n\r\nThe Price is set to 25.00 ... but what makes it Free is that this product has been marked as:\r\n<br />\r\nProduct is Free: Yes\r\n<br /><br />\r\n\r\nThis would allow the product to be listed with a price, but the actual charge is $0.00\r\n<br /><br />\r\n\r\nThe weight is set to 10 but could be set to 0. What really makes it truely Free Shipping is that it has been marked to be Always Free Shipping.\r\n<br /><br />\r\n\r\nAlways Free shipping is set to: Yes<br />\r\nThis will not charge for shipping, but requres a shipping address.\r\n<br /><br />\r\n\r\nBecause there is no shipping and the price is 0, the Zen Cart Free Charge comes up for the payment module and the other payment modules vanish.\r\n<br /><br />\r\n\r\nYou can change the text on the Zen Cart Free Charge module to read as you would prefer.\r\n<br /><br />\r\n\r\nNote: if you add products that incur a charge or shipping charge, then the Zen Cart Free Charge payment module will vanish and the regular payment modules will show.', '', '0');
INSERT INTO `zen_products_description` VALUES ('52', '1', 'Free Ship & Payment Virtual', 'Product Price is set to 0\r\n<br /><br />\r\n\r\nPayment weight is set to 2 ...\r\n<br /><br />\r\n\r\nVirtual is ON ... this will skip shipping address\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('53', '1', 'Min and Units MIX', 'This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to ON', '', '0');
INSERT INTO `zen_products_description` VALUES ('54', '1', 'Min and Units NOMIX', 'This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to OFF', '', '0');
INSERT INTO `zen_products_description` VALUES ('55', '1', 'Min and Units MIX - Sale', 'This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to ON\r\n<br /><br />\r\n\r\nThis product has been placed on Sale via Sale Maker', '', '0');
INSERT INTO `zen_products_description` VALUES ('56', '1', 'Min and Units NOMIX - Sale', 'This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to OFF\r\n<br /><br />\r\n\r\nThis product has been put on Sale via Sale Maker.', '', '0');
INSERT INTO `zen_products_description` VALUES ('59', '1', 'Hewlett Packard - by attributes', 'The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `zen_products_description` VALUES ('60', '1', 'Hewlett Packard - Sale with Attributes on Sale', 'The Product Price is set to 499.75\r\n<br /><br />\r\n\r\nA Sale Maker Discount of 10% is applied.\r\n<br /><br />\r\n\r\nThe attribute are marked to be discounted also.\r\n<br /><br />\r\n\r\nPrior to the discount being applied:<br />\r\nBlue +$20.00<br />\r\nBlack +$10.00<br />\r\nWhite $0.00\r\n<br /><br />\r\n\r\n4 meg +$50.00<br />\r\n8 meg +$75.00<br />\r\n16 meg +$100.00\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `zen_products_description` VALUES ('61', '1', 'Hewlett Packard - Sale with Attributes NOT on Sale', 'The Product Price is set to 499.75\r\n<br /><br />\r\n\r\nA Sale Maker Discount of 10% is applied.\r\n<br /><br />\r\n\r\nThe attribute are marked NOT to be discounted.\r\n<br /><br />\r\n\r\nPrior to the discount being applied:<br />\r\nBlue +$20.00<br />\r\nBlack +$10.00<br />\r\nWhite $0.00\r\n<br /><br />\r\n\r\n4 meg +$50.00<br />\r\n8 meg +$75.00<br />\r\n16 meg +$100.00\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `zen_products_description` VALUES ('111', '1', 'TEST $120 Special $90.00 Sale -$5.00 Skip', 'Product is $120\r\n<br /><br />\r\n\r\nSpecial $90.00 or 25% - Specials are Skipped\r\n<br /><br />\r\n\r\nSale is -$5.00\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('110', '1', 'TEST $120 Sale -$5.00 Skip', 'Product is $120\r\n<br /><br />\r\nSale is -$5.00\r\n<br /><br />\r\nSpecials are skipped\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('109', '1', 'Hide Quantity Box Methods', 'This product does not show the Quantity Box when Adding to the Shopping Cart.\r\n<br /><br />\r\n\r\nWhile Quantity Box Shows is set to YES, the Product Qty Max has been set to 1\r\n\r\nThis will add only 1 to the Shopping Cart when Add to Cart is hit.\r\n<br /><br />\r\n\r\nThe reason for this is that this is a download. As a download, there is never a reason to allow more than quantity 1 to be ordered.\r\n<br /><br />\r\n\r\nNOTE: If using Quantity Box Shows set to NO, unless Qty Max is also set to 1 then each time the Add to Cart is clicked the current cart quantity is updated by 1. If Qty Max is set to 1 then no more than 1 will be able to be added to the Shopping Cart per order.\r\n<br /><br />\r\n\r\nTwo methods are available to trigger the Hide Quantity Box.\r\n<br /><br />\r\n\r\nMethod 1: Set Quantity Box Shows to NO\r\n<br /><br />\r\n\r\nMethod 2: Set Qty Maximum to 1\r\n<br /><br />\r\n\r\nIn either case, you will only be able to add qty 1 to the shopping cart and the quantity box will not show.\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('133', '1', 'Multiple Downloads', '<p>This product is set up to have multiple downloads.</p><p>The Product Price is $49.99</p><p>The attributes are setup with two Option Names, one for each download to allow for two downloads at the same time.</p><p>The first Download is listed under:</p><p>Option Name: Version<br />Option Value: Download Windows - English<br />Option Value: Download Windows - Spanish<br />Option Value: DownloadMAC - English<br /></p><p>The second Download is listed under:</p><p>Option Name: Documentation<br />Option Value: PDF - English<br />Option Value:MS Word- English</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('134', '1', 'Per letter - required', '<p>Product is priced by attribute</p><p>The Option Name Line 1 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.02 per letter</p><p>The Option Name Line2 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.02 per letter with 3 letters free</p><p>The Colors are set up as radio buttons and Red is the Default.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('74', '1', 'Hewlett Packard - by attributes with Special% no SALE', 'The Product Price is set to 0.00 Special is set to 20%\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are, their prices before the Special discount is applied:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00\r\n<br /><br />\r\n\r\nThe Specials Price is a flat $100 discount. This $100 discount is applied to all attributes marked attributes_discounted Yes.', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `zen_products_description` VALUES ('130', '1', 'Special Product', '<p>This is a Special product priced at $15 with a $10 Special</p><p>There are quantity discounts setup which will be discounted from the Special Price.</p><p>Discounts are added on the Products Price Manager.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('131', '1', 'Per word - required', '<p>Product is priced by attribute</p><p>The Option Name Line 1 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.05 per word</p><p>The Option Name Line2 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.05 per word with 3 words Free</p><p>The Colors are set up as radio buttons and Red is the Default.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('132', '1', 'Golf Clubs', '<p>Products Price is set to 0 and Products Weight is set to 1</p><p>This is marked Price by Attributes</p><p>This is priced by attribute at 14.45 per club with an added weight of 1 on the attributes.</p><p>This will make the shipping weight 1lb for the product plus 1lb for each attribute (club) added.</p><p>The attributes are sorted so the clubs read in order on the Product Info, Shopping Cart, Order, Email and Account History.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('85', '1', 'TEST $120 Special $90', 'Product is $120\r\n<br /><br />\r\n\r\nThere is a $90.00 or 25% Special and no sale on this product.\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('78', '1', 'TEST 25% special 10% Sale Attribute Priced', 'Priced by Attributes - Product price is set to $0.00\r\n<br /><br />\r\nAll attributes are marked to make the price.\r\n\r\n<br /><br />\r\nProduct is $0\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />\r\nSale is 10%\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('79', '1', 'TEST 25% Special Attribute Priced', 'Priced by Attributes - Product price is set to $0.00\r\n<br /><br />\r\nAll attributes are marked to make the price.\r\n\r\n<br /><br />\r\nProduct is $0\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('80', '1', 'TEST 25% Special', 'Product is $100.00\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('84', '1', 'TEST $120', 'Product is $120\r\n<br /><br />\r\n\r\nThere is no special and no sale on this product.\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75<br />\r\n- Green $40\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nX-Small $40.00<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- None<br /> \r\n- Embossed Collector\'s Tin $40.00<br />\r\n- Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nFeatures: <br />\r\nQuality Design<br />\r\nCustom Handling<br />\r\nSame Day Shipping<br />\r\n<br /><br />\r\n\r\nNOTE: Select from below ... is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\n\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\n\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />\r\n\r\nNOTE: None is similar to Display Only, but this can be used when for when no option value is required.\r\n<br /><br />\r\n\r\nIts value is set the value to $0.00 and it is NOT marked Display Only. \r\n<br /><br />\r\n\r\nBecause its value is $0.00 if included in the Attributes Based Price on products Priced by Attributes, this Options group would not have any value included in the calculated price.\r\n<br /><br />\r\n\r\nNOTE: The Option Name: Featured is a READ ONLY Option Type\r\n<br /><br />\r\nThis can be for repeatative information or anything that occures on many products but functions like an attribute in setting up the information. It does not get added to the Shopping Cart nor display on the Order. They should be marked exclude from Attribute Based Price.\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('82', '1', 'TEST $120 Sale -$5.00', 'Product is $120\r\n<br /><br />\r\nSale is -$5.00\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('83', '1', 'TEST $120 Special $90.00 Sale -$5.00', 'Product is $120\r\n<br /><br />\r\n\r\nSpecial $90.00 or 25%\r\n<br /><br />\r\n\r\nSale is -$5.00\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('76', '1', 'TEST 25% special 10% Sale', 'Product is $100.00\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />\r\nSale is 10%\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('106', '1', 'A Maximum Sample of 3', 'This product only allows Quantity 1 because the Products Qty Maximum is set to 3.\r\n<br /><br />\r\n\r\nThis means there will be a Quantity box.\r\n<br /><br />\r\n\r\nAdd button will not add more than a total of 3 to the Shopping Cart.\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('104', '1', 'Hide Quantity Box', 'This product does not show the Quantity Box when Adding to the Shopping Cart.\r\n<br /><br />\r\n\r\nThis will add 1 to the Shopping Cart when Add to Cart is hit.\r\n<br /><br />\r\n\r\nNOTE: If using Quantity Box Shows set to NO, unless Qty Max is also set to 1 then each time the Add to Cart is clicked the current cart quantity is updated by 1. If Qty Max is set to 1 then no more than 1 will be able to be added to the Shopping Cart per order.\r\n<br /><br />\r\n\r\nBecause the Image name is: 1_small.jpg<br />\r\nand stored in the /images directory ...\r\n<br /><br />\r\n\r\nThe other matching images will show:\r\n<br /><br />\r\n/images/1_small_00.jpg<br />\r\n/images/1_small_02.jpg<br />\r\n/images/1_small_03.jpg\r\n<br /><br />\r\n\r\nThe matching large images from /images/large will show:\r\n<br /><br />\r\n/images/large/1_small_00_LRG.jpg<br />\r\n/images/large/1_small_02_LRG.jpg<br />\r\n/images/large/1_small_03_LRG.jpg\r\n<br /><br />\r\n\r\nA matching image must begin with the same exact name as the Product Image and end in the same extension.\r\n<br /><br />\r\n\r\nThese will then auto load.\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('105', '1', 'A Maximum Sample of 1', 'This product only allows Quantity 1 because the Products Qty Maximum is set to 1.\r\n<br /><br />\r\n\r\nThis means there will be no Quantity box.\r\n<br /><br />\r\n\r\nAdd button will not add more than a total of 1 to the Shopping Cart.\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('88', '1', 'TEST $120 Sale Special $90 Skip', 'Product is $120\r\n<br /><br />\r\nSpecial is $105\r\n<br /><br />\r\nSale Price is $90 or 25% - Skip Products with Specials\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('89', '1', 'TEST $120 Sale 10% Special off Skip', 'Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10% - Skip Products with Specials\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('90', '1', 'TEST $120 Sale 10% Special', 'Product is $120\r\n<br /><br />\r\nSpecial is 25% or $90\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('92', '1', 'TEST $120 Sale 10% Special off', 'Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('93', '1', 'TEST $120 Special off Sale New Price $100', 'Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('94', '1', 'TEST $120 Special 25% Sale New Price $100', 'Product is $120\r\n<br /><br />\r\nSpecial 25% or $90\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('95', '1', 'TEST $120 Special 25% Sale New Price $100 Skip Specials', 'Product is $120\r\n<br /><br />\r\nSpecial 25% or $90\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('96', '1', 'TEST $120 Special off Sale New Price $100 Skip Specials', 'Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('97', '1', 'TEST $120 Sale 10% Special - Apply to price', 'Product is $120\r\n<br /><br />\r\nSpecial is 25% or $90\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('98', '1', 'TEST $120 Sale 10% Special off - Apply to Price', 'Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('99', '1', 'Free Shipping Product with Weight', 'This product has Free Shipping.\r\n<br /><br />\r\n\r\nThe weight is set to 5\r\n<br /><br />\r\n\r\nWhile the weight is set to 5, it has the Always Free Shipping set to YES and the Free Shipping Module is installed.\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('107', '1', 'Free Shipping Product without Weight', 'This product has Free Shipping.\r\n<br /><br />\r\n\r\nThe weight is set to 0\r\n<br /><br />\r\n\r\nIt has the Always Free Shipping set to NO and the Free Shipping Module is installed but it will still ship for Free.\r\n<br /><br />\r\n\r\nIn the Configruation settings for Shipping/Packaging ... Order Free Shipping 0 Weight Status has been defined to be Free Shipping.\r\n<br /><br />\r\n\r\nNOTE: if that setting is changed, then this product will NOT ship for free, even though the weight is set to 0.\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('108', '1', 'A Sold Out Product', 'This product is Sold Out because the product quantity is <= 0\r\n<br /><br />\r\n\r\nBecause the Configuration Settings in Stock are defined that Sold Out Products are not disabled and Sold Out cannot be purchased, the add to cart buttons are changed to either the large or small Sold Out image.\r\n<br /><br />\r\n\r\nIf you change the Configuration Settings in Stock, then you will be able to purchase this product, even though it is Sold Out.\r\n<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('112', '1', 'Test Two', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('113', '1', 'Test Four', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('114', '1', 'Test Five', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('115', '1', 'Test One', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('116', '1', 'Test Eight', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('117', '1', '<strong>Test<br /> Three</strong>', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('118', '1', 'Test Ten', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('119', '1', 'Test Six', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('120', '1', 'Test Seven', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('121', '1', 'Test Twelve', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('122', '1', 'Test Nine', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('123', '1', 'Test Eleven', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `zen_products_description` VALUES ('127', '1', 'Normal Product', '<p>This is a normal product priced at $15</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('154', '1', 'Rope', '<p>Rope is sold by foot or yard with a minimum length of 10 feet or 10 yards</p><p>Product Price of $1.00<br />Product Weight of 0</p><p>Option Values:<br />per foot $0.00 weight .25<br />per yard $1.50 weight .75</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('155', '1', 'Price Factor', '<p>This product is priced at $10.00</p><p>The attributes are priced using the Price Factor</p><p>Red is $10<br />Yellow is $20<br />Green is $30</p><p>This makes the total price $10 + the price factor of the attribute.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('156', '1', 'Price Factor Offset', '<p>This product is priced at $10.00</p><p>The attributes are priced using the Price Factor and Price Factor Offset</p><p>Red is $10 ($0)<br />Yellow is $20 ($10)<br />Green is $30 ($20)</p><p>The Price Factor Offset is set to 1 to take out the price of the Product Price then make the total price $10 + the price factor * $10 - price factor offset * $10 for the attributes.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('157', '1', 'Price Factor Offset by Attribute', '<p>This product is priced at $10.00</p><p>It is marked Price by Attributes.</p><p>The attributes are priced using the Price Factor and Price Factor Offset. </p><p>The actual Product Price is used just to compute the Price Factor.</p><p>Red is $10 ($0)<br />Yellow is $20 ($10)<br />Green is $30 ($20)</p><p>The Price Factor Offset is set to 1 to take out the price of the Product Price then make the total price the price factor * $10 - price factor offset * $10 for the attributes.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('158', '1', 'One Time Charge', '<p>This product is $45 with a one time charge set on the colors.</p><p>Red $5<br />Yellow is $10<br />Green is $15</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('159', '1', 'Attribute Quantity Discount', '<p>Attribute qty discounts are attribute prices based on qty ordered.</p><p>Enter them as: </p><p>Red:<br />3:10.00,6:9.00,9:8.00,12:7.00,15:6.00</p><p>Yellow<br />3:10.50,6:9.50,9:8.50,12:7.50,15:6.50</p><p>Green:<br />3:11.00,6:10.00,9:9.00,12:8.00,15:7.00</p><p>A table will also show on the page to display these discounts as well as an indicator that qty discounts are available.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('160', '1', 'Golf Clubs', '<p>Products Price is set to 0 and Products Weight is set to 1</p><p>This is marked Price by Attributes</p><p>This is priced by attribute at 14.45 per club with an added weight of 1 on the attributes.</p><p>This will make the shipping weight 1lb for the product plus 1lb for each attribute (club) added.</p><p>The attributes are sorted so the clubs read in order on the Product Info, Shopping Cart, Order, Email and Account History.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('165', '1', 'Rope', '<p>Rope is sold by foot or yard with a minimum length of 10 feet or 10 yards</p><p>Product Price of $1.00<br />Product Weight of 0</p><p>Option Values:<br />per foot $0.00 weight .25<br />per yard $1.50 weight .75</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('166', '1', 'Russ Tippins Band - The Hunter', '', '', '0');
INSERT INTO `zen_products_description` VALUES ('167', '1', 'Test Document', 'This is a test document', '', '0');
INSERT INTO `zen_products_description` VALUES ('168', '1', 'Sample of Product General Type', 'Product General Type are your regular products.\r\n\r\nThere are no special needs or layout issues to work with.', '', '0');
INSERT INTO `zen_products_description` VALUES ('169', '1', 'Sample of Product Music Type', 'The Product Music Type is specially designed for music media.\r\n\r\nThis can offer a lot more flexibility than the Product General.', '', '0');
INSERT INTO `zen_products_description` VALUES ('170', '1', 'Sample of Document General Type', 'Document General Type is used for Products that are actually Documents.\r\n\r\nThese cannot be added to the cart but can be configured for the Document Sidebox. If your Document Sidebox is not showing, go to the Layout Controller and turn it on for your template.', '', '0');
INSERT INTO `zen_products_description` VALUES ('171', '1', 'Sample of Document Product Type', 'Document Product Type is used for Documents that are also available for sale. <br /><br />You might wish to display brief peices of the Document then offer it for sale. <br /><br />This Product Type is also handy for downloadable Documents or Documents available either on CD or by download. <br /><br />The Document Product Type could be used in the Document Sidebox or the Categories Sidebox depending on how you configure its master categories id. <br /><br />This product has also been added as a linked product to the Document Category. This will allow it to show in both the Category and Document Sidebox. While not marked specifically for the master product type id related to the Product Types, it now is in a Product Type set for Document General so it will show in both boxes.', '', '0');
INSERT INTO `zen_products_description` VALUES ('172', '1', 'Sample of Product Free Shipping Type', '<p>Product Free Shipping can be setup to highlight the Free Shipping aspect of the product. <br /><br />These pages include a Free Shipping Image on them. <br /><br />You can define the ALWAYS_FREE_SHIPPING_ICON in the language file. This can be Text, Image, Text/Image Combo or nothing. <br /><br />The weight does not matter on Always Free Shipping if you set Always Free Shipping to Yes. <br /><br />Be sure to have the Free Shipping Module Turned on! Otherwise, if this is the only product in the cart, it will not be able to be shipped. <br /><br />Notice that this is defined with a weight of 5lbs. But because of the Always Free Shipping being set to Y there will be no shipping charges for this product. <br /><br />You do not have to use the Product Free Shipping product type just to use Always Free Shipping. But the reason you may want to do this is so that the layout of the Product Free Shipping product info page can be layout specifically for the Free Shipping aspect of the product. <br /><br />This includes a READONLY attribute for Option Name: Shipping and Option Value: Free Shipping Included. READONLY attributes do not show on the options for the order.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('173', '1', 'Book', 'This Book is sold as a Book that is shipped to the customer or as a Download.<br /><br />\r\n\r\nOnly the Book itself is on Special. The Downloadable versions are not on Special.<br /><br />\r\n\r\nThis Book under Categories/Products is set to:<br /><br />\r\n\r\nProduct Priced by Attributes: Yes<br />\r\nProducts Price: 0.00<br />\r\nWeight: 0<br /><br />\r\n\r\nAn Option Name of: Version (type is dropdown)<br /><br />\r\nOption Values of: Book Hard Cover<br /><br />\r\nDownload: MAC English<br /><br />\r\nDownload: Windows English<br /><br />\r\n\r\nThe Attributes are set as:<br />\r\nOption Name: Version<br />\r\nOption Value: Book Hard Cover<br />\r\nPrice Prefix is blank<br />\r\nPrice: 52.50<br />\r\nWeight Prefix is blank\r\nWeight: 1<br />\r\nInclude in Base Price When Priced by Attributes Yes<br />\r\nApply Discounts Used by Product Special/Sale: Yes<br /><br />\r\n\r\nOption Name: Version<br />\r\nOption Value: Download: MAC English<br />\r\nPrice Prefix is blank<br />\r\nPrice: 20.00<br />\r\nWeight: 0\r\nInclude in Base Price When Priced by Attributes No<br />\r\nApply Discounts Used by Product Special/Sale: No<br /><br />\r\n\r\nOption Name: Version<br />\r\nOption Value: Download: Windows: English<br />\r\nPrice Prefix is blank<br />\r\nPrice: 20.00<br />\r\nWeight: 0<br />\r\nInclude in Base Price When Priced by Attributes No<br />\r\nApply Discounts Used by Product Special/Sale: No<br /><br />\r\n\r\nIt is on Special for $47.50<br /><br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('174', '1', 'A Call No Price', 'This is a Call for Price product with no price<br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br />', '', '0');
INSERT INTO `zen_products_description` VALUES ('175', '1', 'Qty Discounts by 1', '<p>This is a normal product priced at $60</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p><p>The Discounts are offered in increments of 1.</p><p>Note: Attributes do not inherit the Discount Qty discounts.</p><p>Attributes will inherit Discounts from Specials or sales. This can be customized per attribute by marking the Attribute to Include Product Price Special or Sale Discounts.</p><p>Red is $100.00 and marked to include the Price to Special discount but will not inherit the Discount Qty discount.</p><p>Green is $100 and marked not to include the Price to Special discount and will not inherit the Discount Qty discount.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('176', '1', 'Normal Product by the dozen', '<p>This is a normal product priced at $100</p><p>There are quantity discounts setup which will be discounted from the Products Price by the dozen.</p><p>Discounts are added on the Products Price Manager.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('177', '1', 'Special Product by the dozen', '<p>This is a Special product priced at $100 with a $75 Special</p><p>There are quantity discounts setup which will be discounted from the Special Price discounted by the dozen.</p><p>Discounts are added on the Products Price Manager.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('178', '1', 'Qty Discounts by 1 Special', '<p>This is a normal product priced at $60 with a special of $50</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p><p>The Discounts are offered in increments of 1.</p><p>Note: Attributes do not inherit the Discount Qty discounts.</p><p>Attributes will inherit Discounts from Specials or sales. This can be customized per attribute by marking the Attribute to Include Product Price Special or Sale Discounts.</p><p>Red is $100.00 and marked to include the Price to Special discount but will not inherit the Discount Qty discount.</p><p>Green is $100 and marked not to include the Price to Special discount and will not inherit the Discount Qty discount.</p>', '', '0');
INSERT INTO `zen_products_description` VALUES ('179', '1', 'Single Download', '<p>This product is set up to have a single download.</p><p>The Product Price is $39.99</p><p>The attributes are setup with 1 Option Name, for the download to allow for one download but of various types.</p><p>The Download is listed under:</p><p>Option Name: Documentation<br />Option Value: PDF - English<br />Option Value: MS Word - English</p>', '', '0');

-- ----------------------------
-- Table structure for `zen_products_discount_quantity`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products_discount_quantity`;
CREATE TABLE `zen_products_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  KEY `idx_id_qty_zen` (`products_id`,`discount_qty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_products_discount_quantity
-- ----------------------------
INSERT INTO `zen_products_discount_quantity` VALUES ('4', '127', '12', '10.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('3', '127', '9', '8.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('2', '127', '6', '7.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('1', '8', '3', '10.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('1', '127', '3', '5.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('4', '130', '12', '10.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('3', '130', '9', '8.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('2', '130', '6', '7.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('1', '130', '3', '5.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('9', '175', '9', '10.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('8', '175', '8', '9.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('7', '175', '7', '8.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('6', '175', '6', '7.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('5', '175', '5', '6.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('4', '175', '4', '5.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('3', '175', '3', '4.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('2', '175', '2', '3.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('1', '175', '10', '11.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('3', '178', '3', '4.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('2', '178', '2', '3.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('1', '178', '10', '11.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('6', '177', '36', '30.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('5', '176', '48', '30.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('4', '176', '36', '20.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('3', '176', '24', '10.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('2', '176', '12', '5.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('1', '176', '60', '40.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('5', '177', '24', '20.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('4', '177', '12', '10.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('3', '177', '6', '5.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('2', '177', '60', '50.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('1', '177', '48', '40.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('4', '178', '4', '5.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('5', '178', '5', '6.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('6', '178', '6', '7.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('7', '178', '7', '8.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('8', '178', '8', '9.0000');
INSERT INTO `zen_products_discount_quantity` VALUES ('9', '178', '9', '10.0000');

-- ----------------------------
-- Table structure for `zen_products_notifications`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products_notifications`;
CREATE TABLE `zen_products_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_products_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_products_options`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products_options`;
CREATE TABLE `zen_products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(64) DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`products_options_id`,`language_id`),
  KEY `idx_lang_id_zen` (`language_id`),
  KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`),
  KEY `idx_products_options_name_zen` (`products_options_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_products_options
-- ----------------------------
INSERT INTO `zen_products_options` VALUES ('1', '1', 'Color', '10', '2', '32', '', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('2', '1', 'Size', '20', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('3', '1', 'Model', '30', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('4', '1', 'Memory', '50', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('5', '1', 'Version', '40', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('6', '1', 'Media Type', '60', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('17', '1', 'Documentation', '45', '0', '32', null, '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('16', '1', 'Irons', '800', '3', '32', '', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('7', '1', 'Logo Back', '310', '4', '32', '', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('8', '1', 'Logo Front', '300', '4', '32', 'You may upload your own image file(s)', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('9', '1', 'Line 2', '410', '1', '64', '', '40', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('10', '1', 'Line 1', '400', '1', '64', 'Enter your text up to 64 characters, punctuation and spaces', '40', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('11', '1', 'Line 3', '420', '1', '64', '', '40', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('12', '1', 'Line 4', '430', '1', '64', '', '40', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('13', '1', 'Gift Options', '70', '3', '32', 'Special Option Options Available:', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('14', '1', 'Amount', '200', '2', '32', '', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('15', '1', 'Features', '700', '5', '32', '&nbsp;', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('18', '1', 'Length', '70', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `zen_products_options` VALUES ('19', '1', 'Shipping', '600', '5', '32', '', '32', '0', '0', '1');

-- ----------------------------
-- Table structure for `zen_products_options_types`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products_options_types`;
CREATE TABLE `zen_products_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`products_options_types_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Track products_options_types';

-- ----------------------------
-- Records of zen_products_options_types
-- ----------------------------
INSERT INTO `zen_products_options_types` VALUES ('0', 'Dropdown');
INSERT INTO `zen_products_options_types` VALUES ('1', 'Text');
INSERT INTO `zen_products_options_types` VALUES ('2', 'Radio');
INSERT INTO `zen_products_options_types` VALUES ('3', 'Checkbox');
INSERT INTO `zen_products_options_types` VALUES ('4', 'File');
INSERT INTO `zen_products_options_types` VALUES ('5', 'Read Only');

-- ----------------------------
-- Table structure for `zen_products_options_values`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products_options_values`;
CREATE TABLE `zen_products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_id`,`language_id`),
  KEY `idx_products_options_values_name_zen` (`products_options_values_name`),
  KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_products_options_values
-- ----------------------------
INSERT INTO `zen_products_options_values` VALUES ('0', '1', 'TEXT', '0');
INSERT INTO `zen_products_options_values` VALUES ('1', '1', '4 mb', '10');
INSERT INTO `zen_products_options_values` VALUES ('2', '1', '8 mb', '20');
INSERT INTO `zen_products_options_values` VALUES ('3', '1', '16 mb', '30');
INSERT INTO `zen_products_options_values` VALUES ('4', '1', '32 mb', '40');
INSERT INTO `zen_products_options_values` VALUES ('5', '1', 'Value', '10');
INSERT INTO `zen_products_options_values` VALUES ('6', '1', 'Premium', '20');
INSERT INTO `zen_products_options_values` VALUES ('7', '1', 'Deluxe', '30');
INSERT INTO `zen_products_options_values` VALUES ('8', '1', 'PS/2', '20');
INSERT INTO `zen_products_options_values` VALUES ('9', '1', 'USB', '10');
INSERT INTO `zen_products_options_values` VALUES ('10', '1', 'Download: Windows - English', '10');
INSERT INTO `zen_products_options_values` VALUES ('13', '1', 'Box: Windows - English', '1000');
INSERT INTO `zen_products_options_values` VALUES ('14', '1', 'DVD/VHS Combo Pak', '30');
INSERT INTO `zen_products_options_values` VALUES ('15', '1', 'Blue', '50');
INSERT INTO `zen_products_options_values` VALUES ('16', '1', 'Red', '10');
INSERT INTO `zen_products_options_values` VALUES ('17', '1', 'Yellow', '30');
INSERT INTO `zen_products_options_values` VALUES ('18', '1', 'Medium', '30');
INSERT INTO `zen_products_options_values` VALUES ('63', '1', 'MS Word - English', '20');
INSERT INTO `zen_products_options_values` VALUES ('19', '1', 'X-Small', '10');
INSERT INTO `zen_products_options_values` VALUES ('62', '1', 'PDF - English', '10');
INSERT INTO `zen_products_options_values` VALUES ('61', '1', '2 Iron', '20');
INSERT INTO `zen_products_options_values` VALUES ('20', '1', 'Large', '40');
INSERT INTO `zen_products_options_values` VALUES ('60', '1', '8 Iron', '80');
INSERT INTO `zen_products_options_values` VALUES ('59', '1', '7 Iron', '70');
INSERT INTO `zen_products_options_values` VALUES ('21', '1', 'Small', '20');
INSERT INTO `zen_products_options_values` VALUES ('58', '1', 'Wedge', '200');
INSERT INTO `zen_products_options_values` VALUES ('57', '1', '9 Iron', '90');
INSERT INTO `zen_products_options_values` VALUES ('22', '1', 'VHS', '20');
INSERT INTO `zen_products_options_values` VALUES ('23', '1', 'DVD', '10');
INSERT INTO `zen_products_options_values` VALUES ('56', '1', '6 Iron', '60');
INSERT INTO `zen_products_options_values` VALUES ('55', '1', '5 Iron', '50');
INSERT INTO `zen_products_options_values` VALUES ('24', '1', '20th Century', '10');
INSERT INTO `zen_products_options_values` VALUES ('54', '1', '4 Iron', '40');
INSERT INTO `zen_products_options_values` VALUES ('53', '1', '3 Iron', '30');
INSERT INTO `zen_products_options_values` VALUES ('25', '1', 'Orange', '20');
INSERT INTO `zen_products_options_values` VALUES ('26', '1', 'Green', '40');
INSERT INTO `zen_products_options_values` VALUES ('27', '1', 'Purple', '60');
INSERT INTO `zen_products_options_values` VALUES ('28', '1', 'Brown', '70');
INSERT INTO `zen_products_options_values` VALUES ('29', '1', 'Black', '80');
INSERT INTO `zen_products_options_values` VALUES ('30', '1', 'White', '90');
INSERT INTO `zen_products_options_values` VALUES ('31', '1', 'Silver', '100');
INSERT INTO `zen_products_options_values` VALUES ('32', '1', 'Gold', '110');
INSERT INTO `zen_products_options_values` VALUES ('64', '1', 'Download: MAC - English', '100');
INSERT INTO `zen_products_options_values` VALUES ('34', '1', 'Wrapping', '40');
INSERT INTO `zen_products_options_values` VALUES ('35', '1', 'Autographed Memorabilia Card', '30');
INSERT INTO `zen_products_options_values` VALUES ('36', '1', 'Collector\'s Tin', '20');
INSERT INTO `zen_products_options_values` VALUES ('37', '1', 'Select from below ...', '5');
INSERT INTO `zen_products_options_values` VALUES ('38', '1', '$5.00', '5');
INSERT INTO `zen_products_options_values` VALUES ('39', '1', '$10.00', '10');
INSERT INTO `zen_products_options_values` VALUES ('40', '1', '$25.00', '25');
INSERT INTO `zen_products_options_values` VALUES ('41', '1', '$15.00', '15');
INSERT INTO `zen_products_options_values` VALUES ('42', '1', '$50.00', '50');
INSERT INTO `zen_products_options_values` VALUES ('43', '1', '$100.00', '100');
INSERT INTO `zen_products_options_values` VALUES ('44', '1', 'Select from below ...', '5');
INSERT INTO `zen_products_options_values` VALUES ('45', '1', 'NONE', '5');
INSERT INTO `zen_products_options_values` VALUES ('46', '1', 'None', '5');
INSERT INTO `zen_products_options_values` VALUES ('47', '1', 'Embossed Collector\'s Tin', '10');
INSERT INTO `zen_products_options_values` VALUES ('49', '1', 'Custom Handling', '20');
INSERT INTO `zen_products_options_values` VALUES ('48', '1', 'None', '5');
INSERT INTO `zen_products_options_values` VALUES ('50', '1', 'Same Day Shipping', '30');
INSERT INTO `zen_products_options_values` VALUES ('51', '1', 'Quality Design', '10');
INSERT INTO `zen_products_options_values` VALUES ('52', '1', 'Download: Windows - Spanish', '20');
INSERT INTO `zen_products_options_values` VALUES ('65', '1', 'per Foot', '10');
INSERT INTO `zen_products_options_values` VALUES ('66', '1', 'per Yard', '20');
INSERT INTO `zen_products_options_values` VALUES ('67', '1', 'Free Shipping Included!', '10');
INSERT INTO `zen_products_options_values` VALUES ('68', '1', 'Book Hard Cover', '5');

-- ----------------------------
-- Table structure for `zen_products_options_values_to_products_options`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products_options_values_to_products_options`;
CREATE TABLE `zen_products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_to_products_options_id`),
  KEY `idx_products_options_id_zen` (`products_options_id`),
  KEY `idx_products_options_values_id_zen` (`products_options_values_id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_products_options_values_to_products_options
-- ----------------------------
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('1', '4', '1');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('2', '4', '2');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('3', '4', '3');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('4', '4', '4');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('5', '3', '5');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('6', '3', '6');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('7', '3', '7');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('8', '3', '8');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('9', '3', '9');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('10', '5', '10');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('13', '5', '13');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('14', '6', '14');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('15', '1', '15');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('16', '1', '16');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('17', '1', '17');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('18', '2', '18');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('19', '2', '19');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('20', '2', '20');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('21', '2', '21');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('22', '6', '22');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('23', '6', '23');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('24', '5', '24');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('61', '8', '0');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('60', '7', '0');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('59', '12', '0');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('58', '11', '0');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('57', '10', '0');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('56', '9', '0');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('35', '1', '25');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('36', '1', '26');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('37', '1', '27');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('38', '1', '28');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('39', '1', '29');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('40', '1', '30');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('41', '1', '31');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('42', '1', '32');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('89', '5', '64');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('55', '13', '36');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('54', '13', '35');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('53', '13', '34');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('62', '2', '37');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('63', '14', '38');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('64', '14', '39');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('65', '14', '40');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('66', '14', '41');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('67', '14', '42');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('68', '14', '43');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('69', '13', '44');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('70', '1', '45');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('71', '4', '46');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('72', '13', '47');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('73', '13', '48');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('74', '15', '49');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('75', '15', '50');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('76', '15', '51');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('77', '5', '52');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('78', '16', '53');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('79', '16', '54');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('80', '16', '55');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('81', '16', '56');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('82', '16', '57');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('83', '16', '58');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('84', '16', '59');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('85', '16', '60');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('86', '16', '61');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('87', '17', '62');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('88', '17', '63');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('90', '18', '65');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('91', '18', '66');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('92', '19', '67');
INSERT INTO `zen_products_options_values_to_products_options` VALUES ('93', '5', '68');

-- ----------------------------
-- Table structure for `zen_products_to_categories`
-- ----------------------------
DROP TABLE IF EXISTS `zen_products_to_categories`;
CREATE TABLE `zen_products_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`,`categories_id`),
  KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_products_to_categories
-- ----------------------------
INSERT INTO `zen_products_to_categories` VALUES ('1', '4');
INSERT INTO `zen_products_to_categories` VALUES ('2', '4');
INSERT INTO `zen_products_to_categories` VALUES ('3', '9');
INSERT INTO `zen_products_to_categories` VALUES ('4', '10');
INSERT INTO `zen_products_to_categories` VALUES ('5', '11');
INSERT INTO `zen_products_to_categories` VALUES ('5', '22');
INSERT INTO `zen_products_to_categories` VALUES ('6', '10');
INSERT INTO `zen_products_to_categories` VALUES ('6', '22');
INSERT INTO `zen_products_to_categories` VALUES ('7', '12');
INSERT INTO `zen_products_to_categories` VALUES ('7', '22');
INSERT INTO `zen_products_to_categories` VALUES ('8', '13');
INSERT INTO `zen_products_to_categories` VALUES ('8', '22');
INSERT INTO `zen_products_to_categories` VALUES ('9', '10');
INSERT INTO `zen_products_to_categories` VALUES ('9', '22');
INSERT INTO `zen_products_to_categories` VALUES ('10', '10');
INSERT INTO `zen_products_to_categories` VALUES ('11', '10');
INSERT INTO `zen_products_to_categories` VALUES ('11', '22');
INSERT INTO `zen_products_to_categories` VALUES ('12', '10');
INSERT INTO `zen_products_to_categories` VALUES ('12', '22');
INSERT INTO `zen_products_to_categories` VALUES ('13', '10');
INSERT INTO `zen_products_to_categories` VALUES ('13', '22');
INSERT INTO `zen_products_to_categories` VALUES ('14', '15');
INSERT INTO `zen_products_to_categories` VALUES ('14', '22');
INSERT INTO `zen_products_to_categories` VALUES ('15', '14');
INSERT INTO `zen_products_to_categories` VALUES ('15', '22');
INSERT INTO `zen_products_to_categories` VALUES ('16', '15');
INSERT INTO `zen_products_to_categories` VALUES ('16', '22');
INSERT INTO `zen_products_to_categories` VALUES ('17', '10');
INSERT INTO `zen_products_to_categories` VALUES ('17', '22');
INSERT INTO `zen_products_to_categories` VALUES ('18', '10');
INSERT INTO `zen_products_to_categories` VALUES ('19', '12');
INSERT INTO `zen_products_to_categories` VALUES ('19', '22');
INSERT INTO `zen_products_to_categories` VALUES ('20', '15');
INSERT INTO `zen_products_to_categories` VALUES ('20', '22');
INSERT INTO `zen_products_to_categories` VALUES ('21', '18');
INSERT INTO `zen_products_to_categories` VALUES ('21', '22');
INSERT INTO `zen_products_to_categories` VALUES ('22', '19');
INSERT INTO `zen_products_to_categories` VALUES ('22', '22');
INSERT INTO `zen_products_to_categories` VALUES ('23', '20');
INSERT INTO `zen_products_to_categories` VALUES ('23', '22');
INSERT INTO `zen_products_to_categories` VALUES ('24', '20');
INSERT INTO `zen_products_to_categories` VALUES ('24', '22');
INSERT INTO `zen_products_to_categories` VALUES ('25', '8');
INSERT INTO `zen_products_to_categories` VALUES ('26', '9');
INSERT INTO `zen_products_to_categories` VALUES ('27', '5');
INSERT INTO `zen_products_to_categories` VALUES ('27', '22');
INSERT INTO `zen_products_to_categories` VALUES ('28', '21');
INSERT INTO `zen_products_to_categories` VALUES ('29', '21');
INSERT INTO `zen_products_to_categories` VALUES ('30', '21');
INSERT INTO `zen_products_to_categories` VALUES ('31', '21');
INSERT INTO `zen_products_to_categories` VALUES ('32', '21');
INSERT INTO `zen_products_to_categories` VALUES ('34', '22');
INSERT INTO `zen_products_to_categories` VALUES ('36', '25');
INSERT INTO `zen_products_to_categories` VALUES ('39', '24');
INSERT INTO `zen_products_to_categories` VALUES ('40', '24');
INSERT INTO `zen_products_to_categories` VALUES ('41', '28');
INSERT INTO `zen_products_to_categories` VALUES ('42', '28');
INSERT INTO `zen_products_to_categories` VALUES ('43', '24');
INSERT INTO `zen_products_to_categories` VALUES ('44', '22');
INSERT INTO `zen_products_to_categories` VALUES ('46', '22');
INSERT INTO `zen_products_to_categories` VALUES ('47', '21');
INSERT INTO `zen_products_to_categories` VALUES ('48', '23');
INSERT INTO `zen_products_to_categories` VALUES ('49', '23');
INSERT INTO `zen_products_to_categories` VALUES ('50', '23');
INSERT INTO `zen_products_to_categories` VALUES ('51', '24');
INSERT INTO `zen_products_to_categories` VALUES ('52', '24');
INSERT INTO `zen_products_to_categories` VALUES ('53', '23');
INSERT INTO `zen_products_to_categories` VALUES ('54', '23');
INSERT INTO `zen_products_to_categories` VALUES ('55', '28');
INSERT INTO `zen_products_to_categories` VALUES ('56', '28');
INSERT INTO `zen_products_to_categories` VALUES ('57', '24');
INSERT INTO `zen_products_to_categories` VALUES ('59', '23');
INSERT INTO `zen_products_to_categories` VALUES ('60', '28');
INSERT INTO `zen_products_to_categories` VALUES ('61', '28');
INSERT INTO `zen_products_to_categories` VALUES ('74', '23');
INSERT INTO `zen_products_to_categories` VALUES ('76', '28');
INSERT INTO `zen_products_to_categories` VALUES ('78', '25');
INSERT INTO `zen_products_to_categories` VALUES ('79', '23');
INSERT INTO `zen_products_to_categories` VALUES ('80', '23');
INSERT INTO `zen_products_to_categories` VALUES ('82', '27');
INSERT INTO `zen_products_to_categories` VALUES ('83', '27');
INSERT INTO `zen_products_to_categories` VALUES ('84', '23');
INSERT INTO `zen_products_to_categories` VALUES ('85', '23');
INSERT INTO `zen_products_to_categories` VALUES ('88', '31');
INSERT INTO `zen_products_to_categories` VALUES ('89', '31');
INSERT INTO `zen_products_to_categories` VALUES ('90', '45');
INSERT INTO `zen_products_to_categories` VALUES ('92', '45');
INSERT INTO `zen_products_to_categories` VALUES ('93', '46');
INSERT INTO `zen_products_to_categories` VALUES ('94', '46');
INSERT INTO `zen_products_to_categories` VALUES ('95', '51');
INSERT INTO `zen_products_to_categories` VALUES ('96', '51');
INSERT INTO `zen_products_to_categories` VALUES ('97', '32');
INSERT INTO `zen_products_to_categories` VALUES ('98', '32');
INSERT INTO `zen_products_to_categories` VALUES ('99', '23');
INSERT INTO `zen_products_to_categories` VALUES ('100', '25');
INSERT INTO `zen_products_to_categories` VALUES ('101', '47');
INSERT INTO `zen_products_to_categories` VALUES ('104', '23');
INSERT INTO `zen_products_to_categories` VALUES ('105', '22');
INSERT INTO `zen_products_to_categories` VALUES ('106', '22');
INSERT INTO `zen_products_to_categories` VALUES ('107', '23');
INSERT INTO `zen_products_to_categories` VALUES ('108', '23');
INSERT INTO `zen_products_to_categories` VALUES ('109', '23');
INSERT INTO `zen_products_to_categories` VALUES ('110', '52');
INSERT INTO `zen_products_to_categories` VALUES ('111', '52');
INSERT INTO `zen_products_to_categories` VALUES ('112', '53');
INSERT INTO `zen_products_to_categories` VALUES ('113', '53');
INSERT INTO `zen_products_to_categories` VALUES ('114', '53');
INSERT INTO `zen_products_to_categories` VALUES ('115', '53');
INSERT INTO `zen_products_to_categories` VALUES ('116', '53');
INSERT INTO `zen_products_to_categories` VALUES ('117', '53');
INSERT INTO `zen_products_to_categories` VALUES ('118', '53');
INSERT INTO `zen_products_to_categories` VALUES ('119', '53');
INSERT INTO `zen_products_to_categories` VALUES ('120', '53');
INSERT INTO `zen_products_to_categories` VALUES ('121', '53');
INSERT INTO `zen_products_to_categories` VALUES ('122', '53');
INSERT INTO `zen_products_to_categories` VALUES ('123', '53');
INSERT INTO `zen_products_to_categories` VALUES ('127', '55');
INSERT INTO `zen_products_to_categories` VALUES ('130', '55');
INSERT INTO `zen_products_to_categories` VALUES ('131', '57');
INSERT INTO `zen_products_to_categories` VALUES ('132', '58');
INSERT INTO `zen_products_to_categories` VALUES ('133', '60');
INSERT INTO `zen_products_to_categories` VALUES ('134', '57');
INSERT INTO `zen_products_to_categories` VALUES ('154', '58');
INSERT INTO `zen_products_to_categories` VALUES ('155', '56');
INSERT INTO `zen_products_to_categories` VALUES ('156', '56');
INSERT INTO `zen_products_to_categories` VALUES ('157', '56');
INSERT INTO `zen_products_to_categories` VALUES ('158', '56');
INSERT INTO `zen_products_to_categories` VALUES ('159', '56');
INSERT INTO `zen_products_to_categories` VALUES ('160', '61');
INSERT INTO `zen_products_to_categories` VALUES ('165', '61');
INSERT INTO `zen_products_to_categories` VALUES ('166', '62');
INSERT INTO `zen_products_to_categories` VALUES ('167', '63');
INSERT INTO `zen_products_to_categories` VALUES ('168', '64');
INSERT INTO `zen_products_to_categories` VALUES ('169', '64');
INSERT INTO `zen_products_to_categories` VALUES ('170', '64');
INSERT INTO `zen_products_to_categories` VALUES ('171', '63');
INSERT INTO `zen_products_to_categories` VALUES ('171', '64');
INSERT INTO `zen_products_to_categories` VALUES ('172', '64');
INSERT INTO `zen_products_to_categories` VALUES ('173', '61');
INSERT INTO `zen_products_to_categories` VALUES ('174', '24');
INSERT INTO `zen_products_to_categories` VALUES ('175', '55');
INSERT INTO `zen_products_to_categories` VALUES ('176', '55');
INSERT INTO `zen_products_to_categories` VALUES ('177', '55');
INSERT INTO `zen_products_to_categories` VALUES ('178', '55');
INSERT INTO `zen_products_to_categories` VALUES ('179', '60');

-- ----------------------------
-- Table structure for `zen_product_music_extra`
-- ----------------------------
DROP TABLE IF EXISTS `zen_product_music_extra`;
CREATE TABLE `zen_product_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_music_genre_id_zen` (`music_genre_id`),
  KEY `idx_artists_id_zen` (`artists_id`),
  KEY `idx_record_company_id_zen` (`record_company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_product_music_extra
-- ----------------------------
INSERT INTO `zen_product_music_extra` VALUES ('166', '1', '0', '1');
INSERT INTO `zen_product_music_extra` VALUES ('169', '1', '1', '2');

-- ----------------------------
-- Table structure for `zen_product_types`
-- ----------------------------
DROP TABLE IF EXISTS `zen_product_types`;
CREATE TABLE `zen_product_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `type_handler` varchar(255) NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_master_type_zen` (`type_master_type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_product_types
-- ----------------------------
INSERT INTO `zen_product_types` VALUES ('1', 'Product - General', 'product', '1', 'Y', '', '2013-05-20 08:49:15', '2013-05-20 08:49:15');
INSERT INTO `zen_product_types` VALUES ('2', 'Product - Music', 'product_music', '1', 'Y', '', '2013-05-20 08:49:15', '2013-05-20 08:49:15');
INSERT INTO `zen_product_types` VALUES ('3', 'Document - General', 'document_general', '3', 'N', '', '2013-05-20 08:49:15', '2013-05-20 08:49:15');
INSERT INTO `zen_product_types` VALUES ('4', 'Document - Product', 'document_product', '3', 'Y', '', '2013-05-20 08:49:15', '2013-05-20 08:49:15');
INSERT INTO `zen_product_types` VALUES ('5', 'Product - Free Shipping', 'product_free_shipping', '1', 'Y', '', '2013-05-20 08:49:15', '2013-05-20 08:49:15');

-- ----------------------------
-- Table structure for `zen_product_types_to_category`
-- ----------------------------
DROP TABLE IF EXISTS `zen_product_types_to_category`;
CREATE TABLE `zen_product_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_category_id_zen` (`category_id`),
  KEY `idx_product_type_id_zen` (`product_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_product_types_to_category
-- ----------------------------
INSERT INTO `zen_product_types_to_category` VALUES ('3', '63');
INSERT INTO `zen_product_types_to_category` VALUES ('4', '63');
INSERT INTO `zen_product_types_to_category` VALUES ('2', '62');

-- ----------------------------
-- Table structure for `zen_product_type_layout`
-- ----------------------------
DROP TABLE IF EXISTS `zen_product_type_layout`;
CREATE TABLE `zen_product_type_layout` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_product_type_layout
-- ----------------------------
INSERT INTO `zen_product_type_layout` VALUES ('1', 'Show Model Number', 'SHOW_PRODUCT_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', '1', '1', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('2', 'Show Weight', 'SHOW_PRODUCT_INFO_WEIGHT', '1', 'Display Weight on Product Info 0= off 1= on', '1', '2', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('3', 'Show Attribute Weight', 'SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', '1', '3', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('4', 'Show Manufacturer', 'SHOW_PRODUCT_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', '1', '4', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('5', 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', '1', '5', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('6', 'Show Quantity in Stock', 'SHOW_PRODUCT_INFO_QUANTITY', '1', 'Display Quantity in Stock on Product Info 0= off 1= on', '1', '6', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('7', 'Show Product Reviews Count', 'SHOW_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', '1', '7', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('8', 'Show Product Reviews Button', 'SHOW_PRODUCT_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', '1', '8', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('9', 'Show Date Available', 'SHOW_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', '1', '9', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('10', 'Show Date Added', 'SHOW_PRODUCT_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', '1', '10', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('11', 'Show Product URL', 'SHOW_PRODUCT_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', '1', '11', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('12', 'Show Product Additional Images', 'SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', '1', '13', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('13', 'Show Starting At text on Price', 'SHOW_PRODUCT_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', '1', '12', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('14', 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', '1', '16', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('15', 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', '1', '100', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_product_type_layout` VALUES ('16', 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', '1', '101', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('17', 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', '1', '102', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('18', 'Show Model Number', 'SHOW_PRODUCT_MUSIC_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', '2', '1', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('19', 'Show Weight', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', '2', '2', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('20', 'Show Attribute Weight', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', '2', '3', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('21', 'Show Artist', 'SHOW_PRODUCT_MUSIC_INFO_ARTIST', '1', 'Display Artists Name on Product Info 0= off 1= on', '2', '4', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('22', 'Show Music Genre', 'SHOW_PRODUCT_MUSIC_INFO_GENRE', '1', 'Display Music Genre on Product Info 0= off 1= on', '2', '4', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('23', 'Show Record Company', 'SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY', '1', 'Display Record Company on Product Info 0= off 1= on', '2', '4', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('24', 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', '2', '5', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('25', 'Show Quantity in Stock', 'SHOW_PRODUCT_MUSIC_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', '2', '6', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('26', 'Show Product Reviews Count', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', '2', '7', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('27', 'Show Product Reviews Button', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', '2', '8', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('28', 'Show Date Available', 'SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', '2', '9', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('29', 'Show Date Added', 'SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', '2', '10', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('30', 'Show Starting At text on Price', 'SHOW_PRODUCT_MUSIC_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', '2', '12', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('31', 'Show Product Additional Images', 'SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', '2', '13', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('32', 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', '2', '16', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('33', 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', '2', '100', null, '2013-05-20 08:49:15', '', '');
INSERT INTO `zen_product_type_layout` VALUES ('34', 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', '2', '101', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('35', 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', '2', '102', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('36', 'Show Product Reviews Count', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', '3', '7', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('37', 'Show Product Reviews Button', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', '3', '8', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('38', 'Show Date Available', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', '3', '9', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('39', 'Show Date Added', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', '3', '10', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('40', 'Show Product URL', 'SHOW_DOCUMENT_GENERAL_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', '3', '11', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('41', 'Show Product Additional Images', 'SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', '3', '13', null, '2013-05-20 08:49:15', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('42', 'Show Model Number', 'SHOW_DOCUMENT_PRODUCT_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', '4', '1', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('43', 'Show Weight', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', '4', '2', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('44', 'Show Attribute Weight', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', '4', '3', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('45', 'Show Manufacturer', 'SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', '4', '4', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('46', 'Show Quantity in Shopping Cart', 'SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', '4', '5', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('47', 'Show Quantity in Stock', 'SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', '4', '6', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('48', 'Show Product Reviews Count', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', '4', '7', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('49', 'Show Product Reviews Button', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', '4', '8', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('50', 'Show Date Available', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', '4', '9', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('51', 'Show Date Added', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', '4', '10', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('52', 'Show Product URL', 'SHOW_DOCUMENT_PRODUCT_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', '4', '11', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('53', 'Show Product Additional Images', 'SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', '4', '13', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('54', 'Show Starting At text on Price', 'SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', '4', '12', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('55', 'Product Free Shipping Image Status - Catalog', 'SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', '4', '16', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('56', 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', '4', '100', null, '2013-05-20 08:49:16', '', '');
INSERT INTO `zen_product_type_layout` VALUES ('57', 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', '4', '101', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('58', 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', '4', '102', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('59', 'Show Model Number', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', '5', '1', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('60', 'Show Weight', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', '5', '2', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('61', 'Show Attribute Weight', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', '5', '3', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('62', 'Show Manufacturer', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', '5', '4', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('63', 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', '5', '5', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('64', 'Show Quantity in Stock', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY', '1', 'Display Quantity in Stock on Product Info 0= off 1= on', '5', '6', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('65', 'Show Product Reviews Count', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', '5', '7', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('66', 'Show Product Reviews Button', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', '5', '8', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('67', 'Show Date Available', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE', '0', 'Display Date Available on Product Info 0= off 1= on', '5', '9', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('68', 'Show Date Added', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', '5', '10', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('69', 'Show Product URL', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', '5', '11', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('70', 'Show Product Additional Images', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', '5', '13', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('71', 'Show Starting At text on Price', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', '5', '12', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('72', 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '1', 'Show the Free Shipping image/text in the catalog?', '5', '16', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('73', 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', '5', '100', null, '2013-05-20 08:49:16', '', '');
INSERT INTO `zen_product_type_layout` VALUES ('74', 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', '5', '101', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('75', 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '1', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', '5', '102', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('76', 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', '1', '50', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('77', 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', '1', '51', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('78', 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', '1', '52', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('79', 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', '1', '53', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('80', 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', '1', '54', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('81', 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', '2', '50', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('82', 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', '2', '51', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('83', 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', '2', '52', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('84', 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', '2', '53', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('85', 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', '2', '54', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('86', 'Show Metatags Title Default - Document Title', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS', '1', 'Display Document Title in Meta Tags Title 0= off 1= on', '3', '50', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('87', 'Show Metatags Title Default - Document Name', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Document Name in Meta Tags Title 0= off 1= on', '3', '51', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('88', 'Show Metatags Title Default - Document Tagline', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Document Tagline in Meta Tags Title 0= off 1= on', '3', '54', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('89', 'Show Metatags Title Default - Document Title', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Display Document Title in Meta Tags Title 0= off 1= on', '4', '50', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('90', 'Show Metatags Title Default - Document Name', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Document Name in Meta Tags Title 0= off 1= on', '4', '51', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('91', 'Show Metatags Title Default - Document Model', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Display Document Model in Meta Tags Title 0= off 1= on', '4', '52', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('92', 'Show Metatags Title Default - Document Price', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Display Document Price in Meta Tags Title 0= off 1= on', '4', '53', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('93', 'Show Metatags Title Default - Document Tagline', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Document Tagline in Meta Tags Title 0= off 1= on', '4', '54', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('94', 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', '5', '50', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('95', 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', '5', '51', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('96', 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', '5', '52', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('97', 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', '5', '53', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('98', 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', '5', '54', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('99', 'PRODUCT Attribute is Display Only - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', '1', '200', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('100', 'PRODUCT Attribute is Free - Default', 'DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', '1', '201', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('101', 'PRODUCT Attribute is Default - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', '1', '202', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('102', 'PRODUCT Attribute is Discounted - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', '1', '203', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('103', 'PRODUCT Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', '1', '204', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('104', 'PRODUCT Attribute is Required - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', '1', '205', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('105', 'PRODUCT Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_PRICE_PREFIX', '1', 'PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', '1', '206', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('106', 'PRODUCT Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', '1', '207', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('107', 'MUSIC Attribute is Display Only - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY', '0', 'MUSIC Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', '2', '200', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('108', 'MUSIC Attribute is Free - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE', '1', 'MUSIC Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', '2', '201', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('109', 'MUSIC Attribute is Default - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT', '0', 'MUSIC Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', '2', '202', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('110', 'MUSIC Attribute is Discounted - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED', '1', 'MUSIC Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', '2', '203', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('111', 'MUSIC Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'MUSIC Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', '2', '204', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('112', 'MUSIC Attribute is Required - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED', '0', 'MUSIC Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', '2', '205', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('113', 'MUSIC Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX', '1', 'MUSIC Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', '2', '206', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('114', 'MUSIC Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'MUSIC Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', '2', '207', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('115', 'DOCUMENT GENERAL Attribute is Display Only - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENT GENERAL Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', '3', '200', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('116', 'DOCUMENT GENERAL Attribute is Free - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE', '1', 'DOCUMENT GENERAL Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', '3', '201', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('117', 'DOCUMENT GENERAL Attribute is Default - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT', '0', 'DOCUMENT GENERAL Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', '3', '202', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('118', 'DOCUMENT GENERAL Attribute is Discounted - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENT GENERAL Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', '3', '203', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('119', 'DOCUMENT GENERAL Attribute is Included in Base Price - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENT GENERAL Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', '3', '204', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('120', 'DOCUMENT GENERAL Attribute is Required - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED', '0', 'DOCUMENT GENERAL Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', '3', '205', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('121', 'DOCUMENT GENERAL Attribute Price Prefix - Default', 'DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX', '1', 'DOCUMENT GENERAL Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', '3', '206', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('122', 'DOCUMENT GENERAL Attribute Weight Prefix - Default', 'DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENT GENERAL Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', '3', '207', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('123', 'DOCUMENT PRODUCT Attribute is Display Only - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENT PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', '4', '200', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('124', 'DOCUMENT PRODUCT Attribute is Free - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'DOCUMENT PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', '4', '201', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('125', 'DOCUMENT PRODUCT Attribute is Default - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'DOCUMENT PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', '4', '202', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('126', 'DOCUMENT PRODUCT Attribute is Discounted - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENT PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', '4', '203', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('127', 'DOCUMENT PRODUCT Attribute is Included in Base Price - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENT PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', '4', '204', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('128', 'DOCUMENT PRODUCT Attribute is Required - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'DOCUMENT PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', '4', '205', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('129', 'DOCUMENT PRODUCT Attribute Price Prefix - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX', '1', 'DOCUMENT PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', '4', '206', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('130', 'DOCUMENT PRODUCT Attribute Weight Prefix - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENT PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', '4', '207', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('131', 'PRODUCT FREE SHIPPING Attribute is Display Only - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODUCT FREE SHIPPING Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', '5', '201', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('132', 'PRODUCT FREE SHIPPING Attribute is Free - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE', '1', 'PRODUCT FREE SHIPPING Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', '5', '201', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('133', 'PRODUCT FREE SHIPPING Attribute is Default - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT', '0', 'PRODUCT FREE SHIPPING Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', '5', '202', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('134', 'PRODUCT FREE SHIPPING Attribute is Discounted - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED', '1', 'PRODUCT FREE SHIPPING Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', '5', '203', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('135', 'PRODUCT FREE SHIPPING Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODUCT FREE SHIPPING Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', '5', '204', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('136', 'PRODUCT FREE SHIPPING Attribute is Required - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED', '0', 'PRODUCT FREE SHIPPING Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', '5', '205', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('137', 'PRODUCT FREE SHIPPING Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX', '1', 'PRODUCT FREE SHIPPING Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', '5', '206', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `zen_product_type_layout` VALUES ('138', 'PRODUCT FREE SHIPPING Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODUCT FREE SHIPPING Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', '5', '207', null, '2013-05-20 08:49:16', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');

-- ----------------------------
-- Table structure for `zen_project_version`
-- ----------------------------
DROP TABLE IF EXISTS `zen_project_version`;
CREATE TABLE `zen_project_version` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`),
  UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking';

-- ----------------------------
-- Records of zen_project_version
-- ----------------------------
INSERT INTO `zen_project_version` VALUES ('1', 'Zen-Cart Main', '1', '5.1', '', '', '', '', 'New Installation', '2013-05-20 08:49:16');
INSERT INTO `zen_project_version` VALUES ('2', 'Zen-Cart Database', '1', '5.1', '', '', '', '', 'New Installation', '2013-05-20 08:49:16');

-- ----------------------------
-- Table structure for `zen_project_version_history`
-- ----------------------------
DROP TABLE IF EXISTS `zen_project_version_history`;
CREATE TABLE `zen_project_version_history` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking History';

-- ----------------------------
-- Records of zen_project_version_history
-- ----------------------------
INSERT INTO `zen_project_version_history` VALUES ('1', 'Zen-Cart Main', '1', '5.1', '', 'New Installation', '2013-05-20 08:49:16');
INSERT INTO `zen_project_version_history` VALUES ('2', 'Zen-Cart Database', '1', '5.1', '', 'New Installation', '2013-05-20 08:49:16');

-- ----------------------------
-- Table structure for `zen_query_builder`
-- ----------------------------
DROP TABLE IF EXISTS `zen_query_builder`;
CREATE TABLE `zen_query_builder` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_category` varchar(40) NOT NULL DEFAULT '',
  `query_name` varchar(80) NOT NULL DEFAULT '',
  `query_description` text NOT NULL,
  `query_string` text NOT NULL,
  `query_keys_list` text NOT NULL,
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `query_name` (`query_name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Stores queries for re-use in Admin email and report modules';

-- ----------------------------
-- Records of zen_query_builder
-- ----------------------------
INSERT INTO `zen_query_builder` VALUES ('1', 'email', 'All Customers', 'Returns all customers name and email address for sending mass emails (ie: for newsletters, coupons, GVs, messages, etc).', 'select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address', '');
INSERT INTO `zen_query_builder` VALUES ('2', 'email,newsletters', 'All Newsletter Subscribers', 'Returns name and email address of newsletter subscribers', 'select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = \'1\'', '');
INSERT INTO `zen_query_builder` VALUES ('3', 'email,newsletters', 'Dormant Customers (>3months) (Subscribers)', 'Subscribers who HAVE purchased something, but have NOT purchased for at least three months.', 'select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO `zen_query_builder` VALUES ('4', 'email,newsletters', 'Active customers in past 3 months (Subscribers)', 'Newsletter subscribers who are also active customers (purchased something) in last 3 months.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = \'1\' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO `zen_query_builder` VALUES ('5', 'email,newsletters', 'Active customers in past 3 months (Regardless of subscription status)', 'All active customers (purchased something) in last 3 months, ignoring newsletter-subscription status.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO `zen_query_builder` VALUES ('6', 'email,newsletters', 'Administrator', 'Just the email account of the current administrator', 'select \'ADMIN\' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id', '');
INSERT INTO `zen_query_builder` VALUES ('7', 'email,newsletters', 'Customers who have never completed a purchase', 'For sending newsletter to all customers who registered but have never completed a purchase', 'SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL', '');

-- ----------------------------
-- Table structure for `zen_record_artists`
-- ----------------------------
DROP TABLE IF EXISTS `zen_record_artists`;
CREATE TABLE `zen_record_artists` (
  `artists_id` int(11) NOT NULL AUTO_INCREMENT,
  `artists_name` varchar(32) NOT NULL DEFAULT '',
  `artists_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`),
  KEY `idx_rec_artists_name_zen` (`artists_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_record_artists
-- ----------------------------
INSERT INTO `zen_record_artists` VALUES ('1', 'The Russ Tippins Band', 'sooty.jpg', '2004-06-01 20:53:00', null);

-- ----------------------------
-- Table structure for `zen_record_artists_info`
-- ----------------------------
DROP TABLE IF EXISTS `zen_record_artists_info`;
CREATE TABLE `zen_record_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_record_artists_info
-- ----------------------------
INSERT INTO `zen_record_artists_info` VALUES ('1', '1', 'russtippinsband.users.btopenworld.com/', '0', null);

-- ----------------------------
-- Table structure for `zen_record_company`
-- ----------------------------
DROP TABLE IF EXISTS `zen_record_company`;
CREATE TABLE `zen_record_company` (
  `record_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_company_name` varchar(32) NOT NULL DEFAULT '',
  `record_company_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`),
  KEY `idx_rec_company_name_zen` (`record_company_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_record_company
-- ----------------------------
INSERT INTO `zen_record_company` VALUES ('1', 'HMV Group', null, '2004-07-09 14:11:52', null);

-- ----------------------------
-- Table structure for `zen_record_company_info`
-- ----------------------------
DROP TABLE IF EXISTS `zen_record_company_info`;
CREATE TABLE `zen_record_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_record_company_info
-- ----------------------------
INSERT INTO `zen_record_company_info` VALUES ('1', '1', 'www.hmvgroup.com', '0', null);

-- ----------------------------
-- Table structure for `zen_reviews`
-- ----------------------------
DROP TABLE IF EXISTS `zen_reviews`;
CREATE TABLE `zen_reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_customers_id_zen` (`customers_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_date_added_zen` (`date_added`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_reviews
-- ----------------------------
INSERT INTO `zen_reviews` VALUES ('1', '19', '0', 'Bill Smith', '5', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '11', '1');

-- ----------------------------
-- Table structure for `zen_reviews_description`
-- ----------------------------
DROP TABLE IF EXISTS `zen_reviews_description`;
CREATE TABLE `zen_reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_reviews_description
-- ----------------------------
INSERT INTO `zen_reviews_description` VALUES ('1', '1', 'This really is a very funny but old movie!');

-- ----------------------------
-- Table structure for `zen_salemaker_sales`
-- ----------------------------
DROP TABLE IF EXISTS `zen_salemaker_sales`;
CREATE TABLE `zen_salemaker_sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(30) NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text,
  `sale_categories_all` text,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`sale_id`),
  KEY `idx_sale_status_zen` (`sale_status`),
  KEY `idx_sale_date_start_zen` (`sale_date_start`),
  KEY `idx_sale_date_end_zen` (`sale_date_end`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_salemaker_sales
-- ----------------------------
INSERT INTO `zen_salemaker_sales` VALUES ('1', '0', '10% off Sale', '10.0000', '1', '1.0000', '1000.0000', '2', '25,28,45,47,58', ',25,28,45,47,58,', '2003-12-23', '2008-02-21', '2003-12-23', '2004-05-18', '2013-05-20');
INSERT INTO `zen_salemaker_sales` VALUES ('3', '0', 'Mice 20%', '20.0000', '1', '1.0000', '1000.0000', '2', '9', ',9,', '2003-12-24', '2004-04-21', '2003-12-31', '2003-12-31', '2004-04-25');
INSERT INTO `zen_salemaker_sales` VALUES ('6', '1', '$5.00 off', '5.0000', '0', '0.0000', '0.0000', '2', '27', ',27,', '0001-01-01', '0001-01-01', '2004-01-04', '2004-01-05', '2004-01-04');
INSERT INTO `zen_salemaker_sales` VALUES ('7', '1', '10% Skip Specials', '10.0000', '1', '0.0000', '0.0000', '1', '31', ',31,', '0001-01-01', '0001-01-01', '2004-01-04', '2004-05-18', '2004-01-04');
INSERT INTO `zen_salemaker_sales` VALUES ('8', '1', '10% Apply to Price', '10.0000', '1', '0.0000', '0.0000', '0', '32', ',32,', '0001-01-01', '0001-01-01', '2004-01-05', '2004-05-18', '2004-01-05');
INSERT INTO `zen_salemaker_sales` VALUES ('9', '1', 'New Price $100', '100.0000', '2', '0.0000', '0.0000', '2', '46', ',46,', '0001-01-01', '0001-01-01', '2004-01-06', '2004-01-07', '2004-01-06');
INSERT INTO `zen_salemaker_sales` VALUES ('10', '1', 'New Price $100 Skip Special', '100.0000', '2', '0.0000', '0.0000', '1', '51', ',51,', '0001-01-01', '0001-01-01', '2004-01-07', '2004-01-07', '2004-01-07');
INSERT INTO `zen_salemaker_sales` VALUES ('11', '1', '$5.00 off Skip Specials', '5.0000', '0', '0.0000', '0.0000', '1', '52', ',52,', '0001-01-01', '0001-01-01', '2004-01-24', '2004-01-24', '2004-01-24');

-- ----------------------------
-- Table structure for `zen_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `zen_sessions`;
CREATE TABLE `zen_sessions` (
  `sesskey` varchar(64) NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_sessions
-- ----------------------------
INSERT INTO `zen_sessions` VALUES ('l3j5uaqjcg9cnviudj7cscp215', '1369035188', 0x6332566A64584A7064486C556232746C626E787A4F6A4D794F694A6D4D444D305954466B4D44466B4E3249324D4746694F5455335957497A5A54466A596D45774E44466A596949375933567A644739745A584A7A58326876633352665957526B636D567A6333787A4F6A457A4F694A7362324E68624768766333517559323974496A746A59584A3053555238637A6F774F6949694F324E68636E5238547A6F784D6A6F696332687663484270626D644459584A30496A6F334F6E747A4F6A6736496D4E76626E526C626E527A496A74684F6A41366533317A4F6A5536496E527664474673496A74704F6A4137637A6F324F694A335A576C6E614851694F326B364D44747A4F6A45794F694A6A623235305A57353058335235634755694F3249364D44747A4F6A45344F694A6D636D566C58334E6F615842776157356E58326C305A5730694F326B364D44747A4F6A49774F694A6D636D566C58334E6F615842776157356E5833646C6157646F6443493761546F774F334D364D546B36496D5A795A5756666332687063484270626D646663484A70593255694F326B364D447439626D46326157646864476C76626E78504F6A45334F694A7559585A705A3246306157397553476C7A64473979655349364D6A7037637A6F304F694A775958526F496A74684F6A453665326B364D4474684F6A513665334D364E446F696347466E5A534937637A6F314F694A70626D526C65434937637A6F304F694A746232526C496A747A4F6A5936496B3550546C4E5454434937637A6F7A4F694A6E5A5851694F334D364D446F69496A747A4F6A5136496E4276633351694F3245364D44703766583139637A6F344F694A7A626D4677633268766443493759546F774F6E743966574E6F5A574E7258335A6862476C6B66484D364E446F6964484A315A534937624746755A3356685A325638637A6F334F694A6C626D647361584E6F496A74735957356E6457466E5A584E6661575238637A6F784F694978496A74735957356E6457466E5A584E665932396B5A58787A4F6A4936496D5675496A746A64584A795A57356A6558787A4F6A4D36496B5656556949376447396B59586C6661584E38637A6F784D446F694D6A41784D7930774E5330794D4349376458426B5958526C5258687761584A6864476C76626E4E38596A6F784F334E6C63334E706232356659323931626E526C636E78694F6A45375933567A644739745A584A7A58326C775832466B5A484A6C63334E38637A6F354F6949784D6A63754D4334774C6A45694F773D3D);

-- ----------------------------
-- Table structure for `zen_specials`
-- ----------------------------
DROP TABLE IF EXISTS `zen_specials`;
CREATE TABLE `zen_specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`specials_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`specials_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_specials
-- ----------------------------
INSERT INTO `zen_specials` VALUES ('1', '3', '39.9900', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('2', '5', '30.0000', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('3', '6', '30.0000', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('4', '16', '29.9900', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('5', '41', '90.0000', '2003-12-25 19:15:47', '2004-09-27 13:33:33', '2008-02-21', '2013-05-20 09:09:06', '0', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('6', '42', '95.0000', '2003-12-25 19:15:57', '2004-01-04 13:07:27', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('7', '44', '90.0000', '2003-12-25 21:54:50', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('8', '46', '90.0000', '2003-12-25 21:55:01', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('9', '53', '20.0000', '2003-12-28 23:59:03', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('10', '39', '75.0000', '2003-12-31 02:03:59', '2004-02-21 00:36:40', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('40', '100', '374.2500', '2004-01-08 14:07:31', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('42', '111', '90.0000', '2004-01-24 16:14:19', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('14', '74', '399.2000', '2004-01-02 15:35:30', '2004-01-02 17:38:43', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('29', '78', '112.5000', '2004-01-04 01:12:14', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('27', '59', '300.0000', '2004-01-03 01:51:50', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('28', '76', '75.0000', '2004-01-03 23:09:36', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('32', '85', '90.0000', '2004-01-04 15:19:59', '2004-01-06 09:59:59', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('31', '83', '90.0000', '2004-01-04 15:03:07', '2004-01-06 10:02:25', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('34', '88', '90.0000', '2004-01-05 00:16:22', '2004-01-06 09:59:30', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('35', '90', '90.0000', '2004-01-05 23:57:20', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('36', '94', '90.0000', '2004-01-06 00:07:34', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('39', '97', '90.0000', '2004-01-07 11:29:03', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('38', '95', '90.0000', '2004-01-07 02:39:58', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('44', '130', '10.0000', '2004-04-28 02:46:44', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('45', '173', '47.5000', '2004-09-24 23:57:05', null, '2004-09-28', '2004-09-28 18:48:42', '0', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('46', '166', '3.0000', '2004-10-03 20:24:53', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('47', '177', '75.0000', '2004-10-05 16:49:33', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('48', '178', '50.0000', '2004-10-05 16:56:46', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `zen_specials` VALUES ('50', '40', '75.0000', '2004-01-08 14:07:31', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');

-- ----------------------------
-- Table structure for `zen_tax_class`
-- ----------------------------
DROP TABLE IF EXISTS `zen_tax_class`;
CREATE TABLE `zen_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_tax_class
-- ----------------------------
INSERT INTO `zen_tax_class` VALUES ('1', 'Taxable Goods', 'The following types of products are included: non-food, services, etc', null, '2013-05-20 08:49:15');

-- ----------------------------
-- Table structure for `zen_tax_rates`
-- ----------------------------
DROP TABLE IF EXISTS `zen_tax_rates`;
CREATE TABLE `zen_tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_rates_id`),
  KEY `idx_tax_zone_id_zen` (`tax_zone_id`),
  KEY `idx_tax_class_id_zen` (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_tax_rates
-- ----------------------------
INSERT INTO `zen_tax_rates` VALUES ('1', '1', '1', '1', '7.0000', 'FL TAX 7.0%', '2013-05-20 08:49:15', '2013-05-20 08:49:15');

-- ----------------------------
-- Table structure for `zen_template_select`
-- ----------------------------
DROP TABLE IF EXISTS `zen_template_select`;
CREATE TABLE `zen_template_select` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_dir` varchar(64) NOT NULL DEFAULT '',
  `template_language` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `idx_tpl_lang_zen` (`template_language`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_template_select
-- ----------------------------
INSERT INTO `zen_template_select` VALUES ('1', 'classic', '0');

-- ----------------------------
-- Table structure for `zen_upgrade_exceptions`
-- ----------------------------
DROP TABLE IF EXISTS `zen_upgrade_exceptions`;
CREATE TABLE `zen_upgrade_exceptions` (
  `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `sql_file` varchar(50) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `errordate` datetime DEFAULT '0001-01-01 00:00:00',
  `sqlstatement` text,
  PRIMARY KEY (`upgrade_exception_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_upgrade_exceptions
-- ----------------------------

-- ----------------------------
-- Table structure for `zen_whos_online`
-- ----------------------------
DROP TABLE IF EXISTS `zen_whos_online`;
CREATE TABLE `zen_whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `session_id` varchar(128) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `time_entry` varchar(14) NOT NULL DEFAULT '',
  `time_last_click` varchar(14) NOT NULL DEFAULT '',
  `last_page_url` varchar(255) NOT NULL DEFAULT '',
  `host_address` text NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  KEY `idx_ip_address_zen` (`ip_address`),
  KEY `idx_session_id_zen` (`session_id`),
  KEY `idx_customer_id_zen` (`customer_id`),
  KEY `idx_time_entry_zen` (`time_entry`),
  KEY `idx_time_last_click_zen` (`time_last_click`),
  KEY `idx_last_page_url_zen` (`last_page_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_whos_online
-- ----------------------------
INSERT INTO `zen_whos_online` VALUES ('0', '&yen;Guest', 'l3j5uaqjcg9cnviudj7cscp215', '127.0.0.1', '1369033746', '1369033746', '/installers/zencart_v1.5.1/', 'localhost.com', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31');

-- ----------------------------
-- Table structure for `zen_zones`
-- ----------------------------
DROP TABLE IF EXISTS `zen_zones`;
CREATE TABLE `zen_zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone_id`),
  KEY `idx_zone_country_id_zen` (`zone_country_id`),
  KEY `idx_zone_code_zen` (`zone_code`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_zones
-- ----------------------------
INSERT INTO `zen_zones` VALUES ('1', '223', 'AL', 'Alabama');
INSERT INTO `zen_zones` VALUES ('2', '223', 'AK', 'Alaska');
INSERT INTO `zen_zones` VALUES ('3', '223', 'AS', 'American Samoa');
INSERT INTO `zen_zones` VALUES ('4', '223', 'AZ', 'Arizona');
INSERT INTO `zen_zones` VALUES ('5', '223', 'AR', 'Arkansas');
INSERT INTO `zen_zones` VALUES ('7', '223', 'AA', 'Armed Forces Americas');
INSERT INTO `zen_zones` VALUES ('9', '223', 'AE', 'Armed Forces Europe');
INSERT INTO `zen_zones` VALUES ('11', '223', 'AP', 'Armed Forces Pacific');
INSERT INTO `zen_zones` VALUES ('12', '223', 'CA', 'California');
INSERT INTO `zen_zones` VALUES ('13', '223', 'CO', 'Colorado');
INSERT INTO `zen_zones` VALUES ('14', '223', 'CT', 'Connecticut');
INSERT INTO `zen_zones` VALUES ('15', '223', 'DE', 'Delaware');
INSERT INTO `zen_zones` VALUES ('16', '223', 'DC', 'District of Columbia');
INSERT INTO `zen_zones` VALUES ('17', '223', 'FM', 'Federated States Of Micronesia');
INSERT INTO `zen_zones` VALUES ('18', '223', 'FL', 'Florida');
INSERT INTO `zen_zones` VALUES ('19', '223', 'GA', 'Georgia');
INSERT INTO `zen_zones` VALUES ('20', '223', 'GU', 'Guam');
INSERT INTO `zen_zones` VALUES ('21', '223', 'HI', 'Hawaii');
INSERT INTO `zen_zones` VALUES ('22', '223', 'ID', 'Idaho');
INSERT INTO `zen_zones` VALUES ('23', '223', 'IL', 'Illinois');
INSERT INTO `zen_zones` VALUES ('24', '223', 'IN', 'Indiana');
INSERT INTO `zen_zones` VALUES ('25', '223', 'IA', 'Iowa');
INSERT INTO `zen_zones` VALUES ('26', '223', 'KS', 'Kansas');
INSERT INTO `zen_zones` VALUES ('27', '223', 'KY', 'Kentucky');
INSERT INTO `zen_zones` VALUES ('28', '223', 'LA', 'Louisiana');
INSERT INTO `zen_zones` VALUES ('29', '223', 'ME', 'Maine');
INSERT INTO `zen_zones` VALUES ('30', '223', 'MH', 'Marshall Islands');
INSERT INTO `zen_zones` VALUES ('31', '223', 'MD', 'Maryland');
INSERT INTO `zen_zones` VALUES ('32', '223', 'MA', 'Massachusetts');
INSERT INTO `zen_zones` VALUES ('33', '223', 'MI', 'Michigan');
INSERT INTO `zen_zones` VALUES ('34', '223', 'MN', 'Minnesota');
INSERT INTO `zen_zones` VALUES ('35', '223', 'MS', 'Mississippi');
INSERT INTO `zen_zones` VALUES ('36', '223', 'MO', 'Missouri');
INSERT INTO `zen_zones` VALUES ('37', '223', 'MT', 'Montana');
INSERT INTO `zen_zones` VALUES ('38', '223', 'NE', 'Nebraska');
INSERT INTO `zen_zones` VALUES ('39', '223', 'NV', 'Nevada');
INSERT INTO `zen_zones` VALUES ('40', '223', 'NH', 'New Hampshire');
INSERT INTO `zen_zones` VALUES ('41', '223', 'NJ', 'New Jersey');
INSERT INTO `zen_zones` VALUES ('42', '223', 'NM', 'New Mexico');
INSERT INTO `zen_zones` VALUES ('43', '223', 'NY', 'New York');
INSERT INTO `zen_zones` VALUES ('44', '223', 'NC', 'North Carolina');
INSERT INTO `zen_zones` VALUES ('45', '223', 'ND', 'North Dakota');
INSERT INTO `zen_zones` VALUES ('46', '223', 'MP', 'Northern Mariana Islands');
INSERT INTO `zen_zones` VALUES ('47', '223', 'OH', 'Ohio');
INSERT INTO `zen_zones` VALUES ('48', '223', 'OK', 'Oklahoma');
INSERT INTO `zen_zones` VALUES ('49', '223', 'OR', 'Oregon');
INSERT INTO `zen_zones` VALUES ('50', '163', 'PW', 'Palau');
INSERT INTO `zen_zones` VALUES ('51', '223', 'PA', 'Pennsylvania');
INSERT INTO `zen_zones` VALUES ('52', '223', 'PR', 'Puerto Rico');
INSERT INTO `zen_zones` VALUES ('53', '223', 'RI', 'Rhode Island');
INSERT INTO `zen_zones` VALUES ('54', '223', 'SC', 'South Carolina');
INSERT INTO `zen_zones` VALUES ('55', '223', 'SD', 'South Dakota');
INSERT INTO `zen_zones` VALUES ('56', '223', 'TN', 'Tennessee');
INSERT INTO `zen_zones` VALUES ('57', '223', 'TX', 'Texas');
INSERT INTO `zen_zones` VALUES ('58', '223', 'UT', 'Utah');
INSERT INTO `zen_zones` VALUES ('59', '223', 'VT', 'Vermont');
INSERT INTO `zen_zones` VALUES ('60', '223', 'VI', 'Virgin Islands');
INSERT INTO `zen_zones` VALUES ('61', '223', 'VA', 'Virginia');
INSERT INTO `zen_zones` VALUES ('62', '223', 'WA', 'Washington');
INSERT INTO `zen_zones` VALUES ('63', '223', 'WV', 'West Virginia');
INSERT INTO `zen_zones` VALUES ('64', '223', 'WI', 'Wisconsin');
INSERT INTO `zen_zones` VALUES ('65', '223', 'WY', 'Wyoming');
INSERT INTO `zen_zones` VALUES ('66', '38', 'AB', 'Alberta');
INSERT INTO `zen_zones` VALUES ('67', '38', 'BC', 'British Columbia');
INSERT INTO `zen_zones` VALUES ('68', '38', 'MB', 'Manitoba');
INSERT INTO `zen_zones` VALUES ('69', '38', 'NL', 'Newfoundland');
INSERT INTO `zen_zones` VALUES ('70', '38', 'NB', 'New Brunswick');
INSERT INTO `zen_zones` VALUES ('71', '38', 'NS', 'Nova Scotia');
INSERT INTO `zen_zones` VALUES ('72', '38', 'NT', 'Northwest Territories');
INSERT INTO `zen_zones` VALUES ('73', '38', 'NU', 'Nunavut');
INSERT INTO `zen_zones` VALUES ('74', '38', 'ON', 'Ontario');
INSERT INTO `zen_zones` VALUES ('75', '38', 'PE', 'Prince Edward Island');
INSERT INTO `zen_zones` VALUES ('76', '38', 'QC', 'Quebec');
INSERT INTO `zen_zones` VALUES ('77', '38', 'SK', 'Saskatchewan');
INSERT INTO `zen_zones` VALUES ('78', '38', 'YT', 'Yukon Territory');
INSERT INTO `zen_zones` VALUES ('79', '81', 'NDS', 'Niedersachsen');
INSERT INTO `zen_zones` VALUES ('80', '81', 'BAW', 'Baden-Württemberg');
INSERT INTO `zen_zones` VALUES ('81', '81', 'BAY', 'Bayern');
INSERT INTO `zen_zones` VALUES ('82', '81', 'BER', 'Berlin');
INSERT INTO `zen_zones` VALUES ('83', '81', 'BRG', 'Brandenburg');
INSERT INTO `zen_zones` VALUES ('84', '81', 'BRE', 'Bremen');
INSERT INTO `zen_zones` VALUES ('85', '81', 'HAM', 'Hamburg');
INSERT INTO `zen_zones` VALUES ('86', '81', 'HES', 'Hessen');
INSERT INTO `zen_zones` VALUES ('87', '81', 'MEC', 'Mecklenburg-Vorpommern');
INSERT INTO `zen_zones` VALUES ('88', '81', 'NRW', 'Nordrhein-Westfalen');
INSERT INTO `zen_zones` VALUES ('89', '81', 'RHE', 'Rheinland-Pfalz');
INSERT INTO `zen_zones` VALUES ('90', '81', 'SAR', 'Saarland');
INSERT INTO `zen_zones` VALUES ('91', '81', 'SAS', 'Sachsen');
INSERT INTO `zen_zones` VALUES ('92', '81', 'SAC', 'Sachsen-Anhalt');
INSERT INTO `zen_zones` VALUES ('93', '81', 'SCN', 'Schleswig-Holstein');
INSERT INTO `zen_zones` VALUES ('94', '81', 'THE', 'Thüringen');
INSERT INTO `zen_zones` VALUES ('95', '14', 'WI', 'Wien');
INSERT INTO `zen_zones` VALUES ('96', '14', 'NO', 'Niederösterreich');
INSERT INTO `zen_zones` VALUES ('97', '14', 'OO', 'Oberösterreich');
INSERT INTO `zen_zones` VALUES ('98', '14', 'SB', 'Salzburg');
INSERT INTO `zen_zones` VALUES ('99', '14', 'KN', 'Kärnten');
INSERT INTO `zen_zones` VALUES ('100', '14', 'ST', 'Steiermark');
INSERT INTO `zen_zones` VALUES ('101', '14', 'TI', 'Tirol');
INSERT INTO `zen_zones` VALUES ('102', '14', 'BL', 'Burgenland');
INSERT INTO `zen_zones` VALUES ('103', '14', 'VB', 'Voralberg');
INSERT INTO `zen_zones` VALUES ('104', '204', 'AG', 'Aargau');
INSERT INTO `zen_zones` VALUES ('105', '204', 'AI', 'Appenzell Innerrhoden');
INSERT INTO `zen_zones` VALUES ('106', '204', 'AR', 'Appenzell Ausserrhoden');
INSERT INTO `zen_zones` VALUES ('107', '204', 'BE', 'Bern');
INSERT INTO `zen_zones` VALUES ('108', '204', 'BL', 'Basel-Landschaft');
INSERT INTO `zen_zones` VALUES ('109', '204', 'BS', 'Basel-Stadt');
INSERT INTO `zen_zones` VALUES ('110', '204', 'FR', 'Freiburg');
INSERT INTO `zen_zones` VALUES ('111', '204', 'GE', 'Genf');
INSERT INTO `zen_zones` VALUES ('112', '204', 'GL', 'Glarus');
INSERT INTO `zen_zones` VALUES ('113', '204', 'JU', 'Graubnden');
INSERT INTO `zen_zones` VALUES ('114', '204', 'JU', 'Jura');
INSERT INTO `zen_zones` VALUES ('115', '204', 'LU', 'Luzern');
INSERT INTO `zen_zones` VALUES ('116', '204', 'NE', 'Neuenburg');
INSERT INTO `zen_zones` VALUES ('117', '204', 'NW', 'Nidwalden');
INSERT INTO `zen_zones` VALUES ('118', '204', 'OW', 'Obwalden');
INSERT INTO `zen_zones` VALUES ('119', '204', 'SG', 'St. Gallen');
INSERT INTO `zen_zones` VALUES ('120', '204', 'SH', 'Schaffhausen');
INSERT INTO `zen_zones` VALUES ('121', '204', 'SO', 'Solothurn');
INSERT INTO `zen_zones` VALUES ('122', '204', 'SZ', 'Schwyz');
INSERT INTO `zen_zones` VALUES ('123', '204', 'TG', 'Thurgau');
INSERT INTO `zen_zones` VALUES ('124', '204', 'TI', 'Tessin');
INSERT INTO `zen_zones` VALUES ('125', '204', 'UR', 'Uri');
INSERT INTO `zen_zones` VALUES ('126', '204', 'VD', 'Waadt');
INSERT INTO `zen_zones` VALUES ('127', '204', 'VS', 'Wallis');
INSERT INTO `zen_zones` VALUES ('128', '204', 'ZG', 'Zug');
INSERT INTO `zen_zones` VALUES ('129', '204', 'ZH', 'Zürich');
INSERT INTO `zen_zones` VALUES ('130', '195', 'A Coruña', 'A Coruña');
INSERT INTO `zen_zones` VALUES ('131', '195', 'Álava', 'Álava');
INSERT INTO `zen_zones` VALUES ('132', '195', 'Albacete', 'Albacete');
INSERT INTO `zen_zones` VALUES ('133', '195', 'Alicante', 'Alicante');
INSERT INTO `zen_zones` VALUES ('134', '195', 'Almería', 'Almería');
INSERT INTO `zen_zones` VALUES ('135', '195', 'Asturias', 'Asturias');
INSERT INTO `zen_zones` VALUES ('136', '195', 'Ávila', 'Ávila');
INSERT INTO `zen_zones` VALUES ('137', '195', 'Badajoz', 'Badajoz');
INSERT INTO `zen_zones` VALUES ('138', '195', 'Baleares', 'Baleares');
INSERT INTO `zen_zones` VALUES ('139', '195', 'Barcelona', 'Barcelona');
INSERT INTO `zen_zones` VALUES ('140', '195', 'Burgos', 'Burgos');
INSERT INTO `zen_zones` VALUES ('141', '195', 'Cáceres', 'Cáceres');
INSERT INTO `zen_zones` VALUES ('142', '195', 'Cádiz', 'Cádiz');
INSERT INTO `zen_zones` VALUES ('143', '195', 'Cantabria', 'Cantabria');
INSERT INTO `zen_zones` VALUES ('144', '195', 'Castellón', 'Castellón');
INSERT INTO `zen_zones` VALUES ('145', '195', 'Ceuta', 'Ceuta');
INSERT INTO `zen_zones` VALUES ('146', '195', 'Ciudad Real', 'Ciudad Real');
INSERT INTO `zen_zones` VALUES ('147', '195', 'Córdoba', 'Córdoba');
INSERT INTO `zen_zones` VALUES ('148', '195', 'Cuenca', 'Cuenca');
INSERT INTO `zen_zones` VALUES ('149', '195', 'Girona', 'Girona');
INSERT INTO `zen_zones` VALUES ('150', '195', 'Granada', 'Granada');
INSERT INTO `zen_zones` VALUES ('151', '195', 'Guadalajara', 'Guadalajara');
INSERT INTO `zen_zones` VALUES ('152', '195', 'Guipúzcoa', 'Guipúzcoa');
INSERT INTO `zen_zones` VALUES ('153', '195', 'Huelva', 'Huelva');
INSERT INTO `zen_zones` VALUES ('154', '195', 'Huesca', 'Huesca');
INSERT INTO `zen_zones` VALUES ('155', '195', 'Jaén', 'Jaén');
INSERT INTO `zen_zones` VALUES ('156', '195', 'La Rioja', 'La Rioja');
INSERT INTO `zen_zones` VALUES ('157', '195', 'Las Palmas', 'Las Palmas');
INSERT INTO `zen_zones` VALUES ('158', '195', 'León', 'León');
INSERT INTO `zen_zones` VALUES ('159', '195', 'Lérida', 'Lérida');
INSERT INTO `zen_zones` VALUES ('160', '195', 'Lugo', 'Lugo');
INSERT INTO `zen_zones` VALUES ('161', '195', 'Madrid', 'Madrid');
INSERT INTO `zen_zones` VALUES ('162', '195', 'Málaga', 'Málaga');
INSERT INTO `zen_zones` VALUES ('163', '195', 'Melilla', 'Melilla');
INSERT INTO `zen_zones` VALUES ('164', '195', 'Murcia', 'Murcia');
INSERT INTO `zen_zones` VALUES ('165', '195', 'Navarra', 'Navarra');
INSERT INTO `zen_zones` VALUES ('166', '195', 'Ourense', 'Ourense');
INSERT INTO `zen_zones` VALUES ('167', '195', 'Palencia', 'Palencia');
INSERT INTO `zen_zones` VALUES ('168', '195', 'Pontevedra', 'Pontevedra');
INSERT INTO `zen_zones` VALUES ('169', '195', 'Salamanca', 'Salamanca');
INSERT INTO `zen_zones` VALUES ('170', '195', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife');
INSERT INTO `zen_zones` VALUES ('171', '195', 'Segovia', 'Segovia');
INSERT INTO `zen_zones` VALUES ('172', '195', 'Sevilla', 'Sevilla');
INSERT INTO `zen_zones` VALUES ('173', '195', 'Soria', 'Soria');
INSERT INTO `zen_zones` VALUES ('174', '195', 'Tarragona', 'Tarragona');
INSERT INTO `zen_zones` VALUES ('175', '195', 'Teruel', 'Teruel');
INSERT INTO `zen_zones` VALUES ('176', '195', 'Toledo', 'Toledo');
INSERT INTO `zen_zones` VALUES ('177', '195', 'Valencia', 'Valencia');
INSERT INTO `zen_zones` VALUES ('178', '195', 'Valladolid', 'Valladolid');
INSERT INTO `zen_zones` VALUES ('179', '195', 'Vizcaya', 'Vizcaya');
INSERT INTO `zen_zones` VALUES ('180', '195', 'Zamora', 'Zamora');
INSERT INTO `zen_zones` VALUES ('181', '195', 'Zaragoza', 'Zaragoza');
INSERT INTO `zen_zones` VALUES ('182', '13', 'ACT', 'Australian Capital Territory');
INSERT INTO `zen_zones` VALUES ('183', '13', 'NSW', 'New South Wales');
INSERT INTO `zen_zones` VALUES ('184', '13', 'NT', 'Northern Territory');
INSERT INTO `zen_zones` VALUES ('185', '13', 'QLD', 'Queensland');
INSERT INTO `zen_zones` VALUES ('186', '13', 'SA', 'South Australia');
INSERT INTO `zen_zones` VALUES ('187', '13', 'TAS', 'Tasmania');
INSERT INTO `zen_zones` VALUES ('188', '13', 'VIC', 'Victoria');
INSERT INTO `zen_zones` VALUES ('189', '13', 'WA', 'Western Australia');
INSERT INTO `zen_zones` VALUES ('190', '105', 'AG', 'Agrigento');
INSERT INTO `zen_zones` VALUES ('191', '105', 'AL', 'Alessandria');
INSERT INTO `zen_zones` VALUES ('192', '105', 'AN', 'Ancona');
INSERT INTO `zen_zones` VALUES ('193', '105', 'AO', 'Aosta');
INSERT INTO `zen_zones` VALUES ('194', '105', 'AR', 'Arezzo');
INSERT INTO `zen_zones` VALUES ('195', '105', 'AP', 'Ascoli Piceno');
INSERT INTO `zen_zones` VALUES ('196', '105', 'AT', 'Asti');
INSERT INTO `zen_zones` VALUES ('197', '105', 'AV', 'Avellino');
INSERT INTO `zen_zones` VALUES ('198', '105', 'BA', 'Bari');
INSERT INTO `zen_zones` VALUES ('199', '105', 'BT', 'Barletta Andria Trani');
INSERT INTO `zen_zones` VALUES ('200', '105', 'BL', 'Belluno');
INSERT INTO `zen_zones` VALUES ('201', '105', 'BN', 'Benevento');
INSERT INTO `zen_zones` VALUES ('202', '105', 'BG', 'Bergamo');
INSERT INTO `zen_zones` VALUES ('203', '105', 'BI', 'Biella');
INSERT INTO `zen_zones` VALUES ('204', '105', 'BO', 'Bologna');
INSERT INTO `zen_zones` VALUES ('205', '105', 'BZ', 'Bolzano');
INSERT INTO `zen_zones` VALUES ('206', '105', 'BS', 'Brescia');
INSERT INTO `zen_zones` VALUES ('207', '105', 'BR', 'Brindisi');
INSERT INTO `zen_zones` VALUES ('208', '105', 'CA', 'Cagliari');
INSERT INTO `zen_zones` VALUES ('209', '105', 'CL', 'Caltanissetta');
INSERT INTO `zen_zones` VALUES ('210', '105', 'CB', 'Campobasso');
INSERT INTO `zen_zones` VALUES ('211', '105', 'CI', 'Carbonia-Iglesias');
INSERT INTO `zen_zones` VALUES ('212', '105', 'CE', 'Caserta');
INSERT INTO `zen_zones` VALUES ('213', '105', 'CT', 'Catania');
INSERT INTO `zen_zones` VALUES ('214', '105', 'CZ', 'Catanzaro');
INSERT INTO `zen_zones` VALUES ('215', '105', 'CH', 'Chieti');
INSERT INTO `zen_zones` VALUES ('216', '105', 'CO', 'Como');
INSERT INTO `zen_zones` VALUES ('217', '105', 'CS', 'Cosenza');
INSERT INTO `zen_zones` VALUES ('218', '105', 'CR', 'Cremona');
INSERT INTO `zen_zones` VALUES ('219', '105', 'KR', 'Crotone');
INSERT INTO `zen_zones` VALUES ('220', '105', 'CN', 'Cuneo');
INSERT INTO `zen_zones` VALUES ('221', '105', 'EN', 'Enna');
INSERT INTO `zen_zones` VALUES ('222', '105', 'FM', 'Fermo');
INSERT INTO `zen_zones` VALUES ('223', '105', 'FE', 'Ferrara');
INSERT INTO `zen_zones` VALUES ('224', '105', 'FI', 'Firenze');
INSERT INTO `zen_zones` VALUES ('225', '105', 'FG', 'Foggia');
INSERT INTO `zen_zones` VALUES ('226', '105', 'FC', 'Forlì Cesena');
INSERT INTO `zen_zones` VALUES ('227', '105', 'FR', 'Frosinone');
INSERT INTO `zen_zones` VALUES ('228', '105', 'GE', 'Genova');
INSERT INTO `zen_zones` VALUES ('229', '105', 'GO', 'Gorizia');
INSERT INTO `zen_zones` VALUES ('230', '105', 'GR', 'Grosseto');
INSERT INTO `zen_zones` VALUES ('231', '105', 'IM', 'Imperia');
INSERT INTO `zen_zones` VALUES ('232', '105', 'IS', 'Isernia');
INSERT INTO `zen_zones` VALUES ('233', '105', 'AQ', 'Aquila');
INSERT INTO `zen_zones` VALUES ('234', '105', 'SP', 'La Spezia');
INSERT INTO `zen_zones` VALUES ('235', '105', 'LT', 'Latina');
INSERT INTO `zen_zones` VALUES ('236', '105', 'LE', 'Lecce');
INSERT INTO `zen_zones` VALUES ('237', '105', 'LC', 'Lecco');
INSERT INTO `zen_zones` VALUES ('238', '105', 'LI', 'Livorno');
INSERT INTO `zen_zones` VALUES ('239', '105', 'LO', 'Lodi');
INSERT INTO `zen_zones` VALUES ('240', '105', 'LU', 'Lucca');
INSERT INTO `zen_zones` VALUES ('241', '105', 'MC', 'Macerata');
INSERT INTO `zen_zones` VALUES ('242', '105', 'MN', 'Mantova');
INSERT INTO `zen_zones` VALUES ('243', '105', 'MS', 'Massa Carrara');
INSERT INTO `zen_zones` VALUES ('244', '105', 'MT', 'Matera');
INSERT INTO `zen_zones` VALUES ('245', '105', 'VS', 'Medio Campidano');
INSERT INTO `zen_zones` VALUES ('246', '105', 'ME', 'Messina');
INSERT INTO `zen_zones` VALUES ('247', '105', 'MI', 'Milano');
INSERT INTO `zen_zones` VALUES ('248', '105', 'MO', 'Modena');
INSERT INTO `zen_zones` VALUES ('249', '105', 'MB', 'Monza e Brianza');
INSERT INTO `zen_zones` VALUES ('250', '105', 'NA', 'Napoli');
INSERT INTO `zen_zones` VALUES ('251', '105', 'NO', 'Novara');
INSERT INTO `zen_zones` VALUES ('252', '105', 'NU', 'Nuoro');
INSERT INTO `zen_zones` VALUES ('253', '105', 'OG', 'Ogliastra');
INSERT INTO `zen_zones` VALUES ('254', '105', 'OT', 'Olbia-Tempio');
INSERT INTO `zen_zones` VALUES ('255', '105', 'OR', 'Oristano');
INSERT INTO `zen_zones` VALUES ('256', '105', 'PD', 'Padova');
INSERT INTO `zen_zones` VALUES ('257', '105', 'PA', 'Palermo');
INSERT INTO `zen_zones` VALUES ('258', '105', 'PR', 'Parma');
INSERT INTO `zen_zones` VALUES ('259', '105', 'PG', 'Perugia');
INSERT INTO `zen_zones` VALUES ('260', '105', 'PV', 'Pavia');
INSERT INTO `zen_zones` VALUES ('261', '105', 'PU', 'Pesaro Urbino');
INSERT INTO `zen_zones` VALUES ('262', '105', 'PE', 'Pescara');
INSERT INTO `zen_zones` VALUES ('263', '105', 'PC', 'Piacenza');
INSERT INTO `zen_zones` VALUES ('264', '105', 'PI', 'Pisa');
INSERT INTO `zen_zones` VALUES ('265', '105', 'PT', 'Pistoia');
INSERT INTO `zen_zones` VALUES ('266', '105', 'PN', 'Pordenone');
INSERT INTO `zen_zones` VALUES ('267', '105', 'PZ', 'Potenza');
INSERT INTO `zen_zones` VALUES ('268', '105', 'PO', 'Prato');
INSERT INTO `zen_zones` VALUES ('269', '105', 'RG', 'Ragusa');
INSERT INTO `zen_zones` VALUES ('270', '105', 'RA', 'Ravenna');
INSERT INTO `zen_zones` VALUES ('271', '105', 'RC', 'Reggio Calabria');
INSERT INTO `zen_zones` VALUES ('272', '105', 'RE', 'Reggio Emilia');
INSERT INTO `zen_zones` VALUES ('273', '105', 'RI', 'Rieti');
INSERT INTO `zen_zones` VALUES ('274', '105', 'RN', 'Rimini');
INSERT INTO `zen_zones` VALUES ('275', '105', 'RM', 'Roma');
INSERT INTO `zen_zones` VALUES ('276', '105', 'RO', 'Rovigo');
INSERT INTO `zen_zones` VALUES ('277', '105', 'SA', 'Salerno');
INSERT INTO `zen_zones` VALUES ('278', '105', 'SS', 'Sassari');
INSERT INTO `zen_zones` VALUES ('279', '105', 'SV', 'Savona');
INSERT INTO `zen_zones` VALUES ('280', '105', 'SI', 'Siena');
INSERT INTO `zen_zones` VALUES ('281', '105', 'SR', 'Siracusa');
INSERT INTO `zen_zones` VALUES ('282', '105', 'SO', 'Sondrio');
INSERT INTO `zen_zones` VALUES ('283', '105', 'TA', 'Taranto');
INSERT INTO `zen_zones` VALUES ('284', '105', 'TE', 'Teramo');
INSERT INTO `zen_zones` VALUES ('285', '105', 'TR', 'Terni');
INSERT INTO `zen_zones` VALUES ('286', '105', 'TO', 'Torino');
INSERT INTO `zen_zones` VALUES ('287', '105', 'TP', 'Trapani');
INSERT INTO `zen_zones` VALUES ('288', '105', 'TN', 'Trento');
INSERT INTO `zen_zones` VALUES ('289', '105', 'TV', 'Treviso');
INSERT INTO `zen_zones` VALUES ('290', '105', 'TS', 'Trieste');
INSERT INTO `zen_zones` VALUES ('291', '105', 'UD', 'Udine');
INSERT INTO `zen_zones` VALUES ('292', '105', 'VA', 'Varese');
INSERT INTO `zen_zones` VALUES ('293', '105', 'VE', 'Venezia');
INSERT INTO `zen_zones` VALUES ('294', '105', 'VB', 'Verbania');
INSERT INTO `zen_zones` VALUES ('295', '105', 'VC', 'Vercelli');
INSERT INTO `zen_zones` VALUES ('296', '105', 'VR', 'Verona');
INSERT INTO `zen_zones` VALUES ('297', '105', 'VV', 'Vibo Valentia');
INSERT INTO `zen_zones` VALUES ('298', '105', 'VI', 'Vicenza');
INSERT INTO `zen_zones` VALUES ('299', '105', 'VT', 'Viterbo');

-- ----------------------------
-- Table structure for `zen_zones_to_geo_zones`
-- ----------------------------
DROP TABLE IF EXISTS `zen_zones_to_geo_zones`;
CREATE TABLE `zen_zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zen_zones_to_geo_zones
-- ----------------------------
INSERT INTO `zen_zones_to_geo_zones` VALUES ('1', '223', '18', '1', null, '2013-05-20 08:49:15');
