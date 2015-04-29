/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : october

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-04-29 16:32:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for backend_access_log
-- ----------------------------
DROP TABLE IF EXISTS `backend_access_log`;
CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_access_log
-- ----------------------------
INSERT INTO `backend_access_log` VALUES ('1', '1', '::1', '2015-04-29 02:24:11', '2015-04-29 02:24:11');
INSERT INTO `backend_access_log` VALUES ('2', '1', '::1', '2015-04-29 02:24:13', '2015-04-29 02:24:13');
INSERT INTO `backend_access_log` VALUES ('3', '2', '::1', '2015-04-29 07:33:49', '2015-04-29 07:33:49');

-- ----------------------------
-- Table structure for backend_users
-- ----------------------------
DROP TABLE IF EXISTS `backend_users`;
CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_users
-- ----------------------------
INSERT INTO `backend_users` VALUES ('1', 'Admin', 'Person', 'admin', 'admin@domain.tld', '$2y$10$PTw9nDhmhCNAGUF.6xeCtuNS7g2gsoZ2Ei4toathJGgl7ZS3/SVfa', null, '$2y$10$m6kXQYMsqEhM4ozMu/1cwuwMNDkJDcui1MrmD2i8S.8W7tadfDrMm', null, '{\"superuser\":1}', '1', null, '2015-04-29 02:24:13', '2015-04-29 02:22:33', '2015-04-29 02:24:13');
INSERT INTO `backend_users` VALUES ('2', 'zero', '', 'zero', 'wangsong1233276@sina.com', '$2y$10$6Y.WYq6lYY66bSJpcsa/juCp0MT1KUkaYrPmmhRaU6uyAF5S5gJV6', null, '$2y$10$Kj5o7XRXUMHyw16S1sdumuAoJKXJBL0FXevrERIEoeLzJJH64Mb9G', null, '', '0', null, '2015-04-29 07:33:49', '2015-04-29 07:33:20', '2015-04-29 07:33:49');

-- ----------------------------
-- Table structure for backend_users_groups
-- ----------------------------
DROP TABLE IF EXISTS `backend_users_groups`;
CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_users_groups
-- ----------------------------
INSERT INTO `backend_users_groups` VALUES ('1', '1');
INSERT INTO `backend_users_groups` VALUES ('1', '2');
INSERT INTO `backend_users_groups` VALUES ('2', '2');

-- ----------------------------
-- Table structure for backend_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `backend_user_groups`;
CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_user_groups
-- ----------------------------
INSERT INTO `backend_user_groups` VALUES ('1', 'Admins', '', '2015-04-29 02:22:33', '2015-04-29 07:31:05', 'admins', 'Default group for administrators', '0');
INSERT INTO `backend_user_groups` VALUES ('2', '编辑部', '{\"rainlab.blog.access_categories\":\"1\",\"rainlab.blog.access_posts\":\"1\",\"rainlab.blog.access_other_posts\":\"1\",\"rainlab.pages.manage_pages\":\"1\",\"rainlab.pages.access_snippets\":\"1\",\"rainlab.pages.manage_content\":\"1\",\"rainlab.pages.manage_menus\":\"1\",\"rainlab.users.access_users\":\"1\"}', '2015-04-29 07:31:38', '2015-04-29 07:32:19', '', '', '1');

-- ----------------------------
-- Table structure for backend_user_preferences
-- ----------------------------
DROP TABLE IF EXISTS `backend_user_preferences`;
CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_user_preferences
-- ----------------------------
INSERT INTO `backend_user_preferences` VALUES ('1', '1', 'backend', 'reportwidgets', 'dashboard', '{\"report_container_dashboard_1\":{\"class\":\"System\\\\ReportWidgets\\\\Status\",\"configuration\":{\"title\":\"System status\",\"ocWidgetWidth\":\"4\",\"ocWidgetNewRow\":0},\"sortOrder\":1},\"report_container_dashboard_2\":{\"class\":\"Indikator\\\\Backend\\\\ReportWidgets\\\\Server\",\"configuration\":{\"title\":\"indikator.backend::lang.widgets.server.label\",\"host\":true,\"ip\":true,\"os\":true,\"ocWidgetWidth\":\"5\"},\"sortOrder\":2},\"report_container_dashboard_4\":{\"class\":\"Romanov\\\\ClearCacheWidget\\\\ReportWidgets\\\\ClearCache\",\"configuration\":{\"title\":\"Clear Cache\",\"nochart\":0,\"ocWidgetWidth\":\"5\",\"ocWidgetNewRow\":0},\"sortOrder\":4}}');
INSERT INTO `backend_user_preferences` VALUES ('2', '1', 'backend', 'backend', 'preferences', '{\"locale\":\"zh-cn\",\"user_id\":\"1\"}');
INSERT INTO `backend_user_preferences` VALUES ('3', '1', 'backend', 'editor', 'preferences', '{\"font_size\":\"16\",\"word_wrap\":\"fluid\",\"code_folding\":\"manual\",\"tab_size\":\"4\",\"theme\":\"twilight\",\"show_invisibles\":\"1\",\"highlight_active_line\":\"1\",\"use_hard_tabs\":\"0\",\"show_gutter\":\"1\",\"auto_closing\":\"1\",\"user_id\":\"1\"}');
INSERT INTO `backend_user_preferences` VALUES ('4', '1', 'shahiemseymor', 'ckeditor', 'preferences', '{\"form_width\":\"\",\"form_height\":\"500px\",\"toolbar\":\"full\",\"skin\":\"october\",\"language\":\"zh-cn\",\"show_cms_content_as_wysiwyg\":\"0\",\"show_cms_partial_as_wysiwyg\":\"0\",\"show_cms_layouts_as_wysiwyg\":\"0\",\"show_cms_pages_as_wysiwyg\":\"0\",\"show_rainlab_pages_as_wysiwyg\":\"0\",\"show_rainlab_blog_as_wysiwyg\":\"1\",\"user_id\":\"1\"}');

-- ----------------------------
-- Table structure for backend_user_throttle
-- ----------------------------
DROP TABLE IF EXISTS `backend_user_throttle`;
CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backend_user_throttle
-- ----------------------------
INSERT INTO `backend_user_throttle` VALUES ('1', '1', '::1', '0', null, '0', null, '0', null);
INSERT INTO `backend_user_throttle` VALUES ('2', '2', '::1', '0', null, '0', null, '0', null);

-- ----------------------------
-- Table structure for benfreke_menumanager_menus
-- ----------------------------
DROP TABLE IF EXISTS `benfreke_menumanager_menus`;
CREATE TABLE `benfreke_menumanager_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nest_left` int(10) unsigned DEFAULT NULL,
  `nest_right` int(10) unsigned DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_external` tinyint(1) NOT NULL DEFAULT '0',
  `link_target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `enabled` int(11) NOT NULL DEFAULT '1',
  `parameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `benfreke_menumanager_menus_parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of benfreke_menumanager_menus
-- ----------------------------

-- ----------------------------
-- Table structure for cms_theme_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_theme_data`;
CREATE TABLE `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cms_theme_data
-- ----------------------------

-- ----------------------------
-- Table structure for deferred_bindings
-- ----------------------------
DROP TABLE IF EXISTS `deferred_bindings`;
CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deferred_bindings
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2013_10_01_000001_Db_Deferred_Bindings', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000002_Db_System_Files', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000003_Db_System_Plugin_Versions', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000004_Db_System_Plugin_History', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000005_Db_System_Settings', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000006_Db_System_Parameters', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000007_Db_System_Add_Disabled_Flag', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000008_Db_System_Mail_Templates', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000009_Db_System_Mail_Layouts', '1');
INSERT INTO `migrations` VALUES ('2014_10_01_000010_Db_Jobs', '1');
INSERT INTO `migrations` VALUES ('2014_10_01_000011_Db_System_Event_Logs', '1');
INSERT INTO `migrations` VALUES ('2014_10_01_000012_Db_System_Request_Logs', '1');
INSERT INTO `migrations` VALUES ('2014_10_01_000013_Db_System_Sessions', '1');
INSERT INTO `migrations` VALUES ('2013_10_01_000001_Db_Backend_Users', '2');
INSERT INTO `migrations` VALUES ('2013_10_01_000002_Db_Backend_User_Groups', '2');
INSERT INTO `migrations` VALUES ('2013_10_01_000003_Db_Backend_Users_Groups', '2');
INSERT INTO `migrations` VALUES ('2013_10_01_000004_Db_Backend_User_Throttle', '2');
INSERT INTO `migrations` VALUES ('2014_01_04_000005_Db_Backend_User_Preferences', '2');
INSERT INTO `migrations` VALUES ('2014_10_01_000006_Db_Backend_Access_Log', '2');
INSERT INTO `migrations` VALUES ('2014_10_01_000007_Db_Backend_Add_Description_Field', '2');
INSERT INTO `migrations` VALUES ('2014_10_01_000001_Db_Cms_Theme_Data', '3');

-- ----------------------------
-- Table structure for mohsin_carousel_carousels
-- ----------------------------
DROP TABLE IF EXISTS `mohsin_carousel_carousels`;
CREATE TABLE `mohsin_carousel_carousels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of mohsin_carousel_carousels
-- ----------------------------

-- ----------------------------
-- Table structure for rainlab_blog_categories
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_blog_categories`;
CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_categories_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_blog_categories
-- ----------------------------
INSERT INTO `rainlab_blog_categories` VALUES ('1', 'Uncategorized', 'uncategorized', null, null, '2015-04-29 02:22:01', '2015-04-29 02:22:01');

-- ----------------------------
-- Table structure for rainlab_blog_posts
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_blog_posts`;
CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content_html` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  KEY `rainlab_blog_posts_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_blog_posts
-- ----------------------------
INSERT INTO `rainlab_blog_posts` VALUES ('1', '1', 'sa', 'asdf', 'asdfasdf', '<img src=\"aa\">\r\nTen years ago a crack commando unit was sent to prison by a military court for a crime they didn\'t commit. These men promptly escaped from a maximum security stockade to the Los Angeles underground. Today, still wanted by the government, they survive as soldiers of fortune. If you have a problem and no one else can help, and if you can find them, maybe you can hire the A-team.', '2015-04-29 00:00:00', '1', '2015-04-29 02:44:54', '2015-04-29 02:44:54', '<img src=\"aa\">\n<p>Ten years ago a crack commando unit was sent to prison by a military court for a crime they didn\'t commit. These men promptly escaped from a maximum security stockade to the Los Angeles underground. Today, still wanted by the government, they survive as soldiers of fortune. If you have a problem and no one else can help, and if you can find them, maybe you can hire the A-team.</p>');

-- ----------------------------
-- Table structure for rainlab_blog_posts_categories
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_blog_posts_categories`;
CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_blog_posts_categories
-- ----------------------------

-- ----------------------------
-- Table structure for rainlab_forum_channels
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_forum_channels`;
CREATE TABLE `rainlab_forum_channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `count_topics` int(11) NOT NULL DEFAULT '0',
  `count_posts` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_moderated` tinyint(1) NOT NULL DEFAULT '0',
  `embed_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rainlab_forum_channels_slug_unique` (`slug`),
  KEY `rainlab_forum_channels_parent_id_index` (`parent_id`),
  KEY `rainlab_forum_channels_embed_code_index` (`embed_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_forum_channels
-- ----------------------------
INSERT INTO `rainlab_forum_channels` VALUES ('1', null, 'Channel Orange', 'channel-orange', 'A root level forum channel', '1', '12', '0', '1', '2', '2015-04-29 02:22:26', '2015-04-29 06:35:01', '0', '0', null);
INSERT INTO `rainlab_forum_channels` VALUES ('2', '1', 'Autumn Leaves', 'autumn-leaves', 'Disccusion about the season of falling leaves.', '2', '9', '1', '0', '0', '2015-04-29 02:22:26', '2015-04-29 02:22:26', '0', '0', null);
INSERT INTO `rainlab_forum_channels` VALUES ('3', '2', 'September', 'september', 'The start of the fall season.', '3', '4', '2', '0', '0', '2015-04-29 02:22:26', '2015-04-29 02:22:26', '0', '0', null);
INSERT INTO `rainlab_forum_channels` VALUES ('4', '2', 'October', 'october', 'The middle of the fall season.', '5', '6', '2', '0', '0', '2015-04-29 02:22:26', '2015-04-29 02:22:26', '0', '0', null);
INSERT INTO `rainlab_forum_channels` VALUES ('5', '2', 'November', 'november', 'The end of the fall season.', '7', '8', '2', '0', '0', '2015-04-29 02:22:26', '2015-04-29 02:22:26', '0', '0', null);
INSERT INTO `rainlab_forum_channels` VALUES ('6', '1', 'Summer Breeze', 'summer-breeze', 'Disccusion about the wind at the ocean.', '10', '11', '1', '0', '0', '2015-04-29 02:22:26', '2015-04-29 02:22:26', '0', '0', null);
INSERT INTO `rainlab_forum_channels` VALUES ('7', null, 'Channel Green', 'channel-green', 'A root level forum channel', '13', '18', '0', '0', '0', '2015-04-29 02:22:26', '2015-04-29 02:22:27', '0', '0', null);
INSERT INTO `rainlab_forum_channels` VALUES ('8', '7', 'Winter Snow', 'winter-snow', 'Disccusion about the frosty snow flakes.', '14', '15', '1', '0', '0', '2015-04-29 02:22:26', '2015-04-29 02:22:27', '0', '0', null);
INSERT INTO `rainlab_forum_channels` VALUES ('9', '7', 'Spring Trees', 'spring-trees', 'Disccusion about the blooming gardens.', '16', '17', '1', '0', '0', '2015-04-29 02:22:27', '2015-04-29 02:22:27', '0', '0', null);

-- ----------------------------
-- Table structure for rainlab_forum_channel_watches
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_forum_channel_watches`;
CREATE TABLE `rainlab_forum_channel_watches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) unsigned DEFAULT NULL,
  `count_topics` int(11) NOT NULL DEFAULT '0',
  `watched_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_forum_channel_watches_channel_id_index` (`channel_id`),
  KEY `rainlab_forum_channel_watches_member_id_index` (`member_id`),
  KEY `rainlab_forum_channel_watches_count_topics_index` (`count_topics`),
  KEY `rainlab_forum_channel_watches_watched_at_index` (`watched_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_forum_channel_watches
-- ----------------------------

-- ----------------------------
-- Table structure for rainlab_forum_members
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_forum_members`;
CREATE TABLE `rainlab_forum_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count_posts` int(11) NOT NULL DEFAULT '0',
  `count_topics` int(11) NOT NULL DEFAULT '0',
  `last_active_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_moderator` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rainlab_forum_members_user_id_index` (`user_id`),
  KEY `rainlab_forum_members_count_posts_index` (`count_posts`),
  KEY `rainlab_forum_members_count_topics_index` (`count_topics`),
  KEY `rainlab_forum_members_last_active_at_index` (`last_active_at`),
  KEY `rainlab_forum_members_is_moderator_index` (`is_moderator`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_forum_members
-- ----------------------------
INSERT INTO `rainlab_forum_members` VALUES ('1', '1', 'wangsong12332761', 'wangsong12332761', '2', '0', '2015-04-29 06:35:01', '2015-04-29 02:32:55', '2015-04-29 06:35:01', '0', '0');

-- ----------------------------
-- Table structure for rainlab_forum_posts
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_forum_posts`;
CREATE TABLE `rainlab_forum_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `topic_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) unsigned DEFAULT NULL,
  `edit_user_id` int(11) DEFAULT NULL,
  `delete_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `rainlab_forum_posts_topic_id_index` (`topic_id`),
  KEY `rainlab_forum_posts_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_forum_posts
-- ----------------------------
INSERT INTO `rainlab_forum_posts` VALUES ('1', 'sa', 'zx', '<p>zx</p>', '1', '1', null, null, '2015-04-29 06:34:47', '2015-04-29 06:34:47');
INSERT INTO `rainlab_forum_posts` VALUES ('2', 'sa', '>**wangsong1233276** said:\r\n>\r\n>zx\r\n\r\nzzxx', '<blockquote>\n<p><strong>wangsong1233276</strong> said:</p>\n<p>zx</p>\n</blockquote>\n<p>zzxx</p>', '1', '1', null, null, '2015-04-29 06:35:01', '2015-04-29 06:35:33');

-- ----------------------------
-- Table structure for rainlab_forum_topics
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_forum_topics`;
CREATE TABLE `rainlab_forum_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `start_member_id` int(11) DEFAULT NULL,
  `last_post_id` int(11) DEFAULT NULL,
  `last_post_member_id` int(11) DEFAULT NULL,
  `last_post_at` datetime DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `count_posts` int(11) NOT NULL DEFAULT '0',
  `count_views` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `embed_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rainlab_forum_topics_slug_unique` (`slug`),
  KEY `sticky_post_time` (`is_sticky`,`last_post_at`),
  KEY `rainlab_forum_topics_channel_id_index` (`channel_id`),
  KEY `rainlab_forum_topics_start_member_id_index` (`start_member_id`),
  KEY `rainlab_forum_topics_last_post_at_index` (`last_post_at`),
  KEY `rainlab_forum_topics_is_private_index` (`is_private`),
  KEY `rainlab_forum_topics_is_locked_index` (`is_locked`),
  KEY `rainlab_forum_topics_count_posts_index` (`count_posts`),
  KEY `rainlab_forum_topics_count_views_index` (`count_views`),
  KEY `rainlab_forum_topics_embed_code_index` (`embed_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_forum_topics
-- ----------------------------
INSERT INTO `rainlab_forum_topics` VALUES ('1', 'sa', 'sa', '1', '0', '2', '1', '2015-04-29 06:35:01', '0', '0', '0', '2', '9', '2015-04-29 06:34:34', '2015-04-29 06:35:01', 'asdf');

-- ----------------------------
-- Table structure for rainlab_forum_topic_followers
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_forum_topic_followers`;
CREATE TABLE `rainlab_forum_topic_followers` (
  `topic_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`topic_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_forum_topic_followers
-- ----------------------------
INSERT INTO `rainlab_forum_topic_followers` VALUES ('1', '1', '2015-04-29 06:34:47', '2015-04-29 06:35:01');

-- ----------------------------
-- Table structure for rainlab_forum_topic_watches
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_forum_topic_watches`;
CREATE TABLE `rainlab_forum_topic_watches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) unsigned DEFAULT NULL,
  `count_posts` int(11) NOT NULL DEFAULT '0',
  `watched_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_forum_topic_watches_topic_id_index` (`topic_id`),
  KEY `rainlab_forum_topic_watches_member_id_index` (`member_id`),
  KEY `rainlab_forum_topic_watches_count_posts_index` (`count_posts`),
  KEY `rainlab_forum_topic_watches_watched_at_index` (`watched_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_forum_topic_watches
-- ----------------------------
INSERT INTO `rainlab_forum_topic_watches` VALUES ('1', '1', '1', '2', '2015-04-29 06:35:04');

-- ----------------------------
-- Table structure for rainlab_user_countries
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_user_countries`;
CREATE TABLE `rainlab_user_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_user_countries_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_user_countries
-- ----------------------------
INSERT INTO `rainlab_user_countries` VALUES ('1', '1', 'United States', 'US');
INSERT INTO `rainlab_user_countries` VALUES ('2', '1', 'Canada', 'CA');
INSERT INTO `rainlab_user_countries` VALUES ('3', '1', 'Australia', 'AU');
INSERT INTO `rainlab_user_countries` VALUES ('4', '0', 'France', 'FR');
INSERT INTO `rainlab_user_countries` VALUES ('5', '0', 'Germany', 'DE');
INSERT INTO `rainlab_user_countries` VALUES ('6', '0', 'Iceland', 'IS');
INSERT INTO `rainlab_user_countries` VALUES ('7', '0', 'Ireland', 'IE');
INSERT INTO `rainlab_user_countries` VALUES ('8', '0', 'Italy', 'IT');
INSERT INTO `rainlab_user_countries` VALUES ('9', '0', 'Spain', 'ES');
INSERT INTO `rainlab_user_countries` VALUES ('10', '0', 'Sweden', 'SE');
INSERT INTO `rainlab_user_countries` VALUES ('11', '0', 'Austria', 'AT');
INSERT INTO `rainlab_user_countries` VALUES ('12', '0', 'Belgium', 'BE');
INSERT INTO `rainlab_user_countries` VALUES ('13', '0', 'Finland', 'FI');
INSERT INTO `rainlab_user_countries` VALUES ('14', '0', 'Czech Republic', 'CZ');
INSERT INTO `rainlab_user_countries` VALUES ('15', '0', 'Denmark', 'DK');
INSERT INTO `rainlab_user_countries` VALUES ('16', '0', 'Norway', 'NO');
INSERT INTO `rainlab_user_countries` VALUES ('17', '0', 'United Kingdom', 'GB');
INSERT INTO `rainlab_user_countries` VALUES ('18', '0', 'Switzerland', 'CH');
INSERT INTO `rainlab_user_countries` VALUES ('19', '0', 'New Zealand', 'NZ');
INSERT INTO `rainlab_user_countries` VALUES ('20', '0', 'Russian Federation', 'RU');
INSERT INTO `rainlab_user_countries` VALUES ('21', '0', 'Portugal', 'PT');
INSERT INTO `rainlab_user_countries` VALUES ('22', '0', 'Netherlands', 'NL');
INSERT INTO `rainlab_user_countries` VALUES ('23', '0', 'Isle of Man', 'IM');
INSERT INTO `rainlab_user_countries` VALUES ('24', '0', 'Afghanistan', 'AF');
INSERT INTO `rainlab_user_countries` VALUES ('25', '0', 'Aland Islands ', 'AX');
INSERT INTO `rainlab_user_countries` VALUES ('26', '0', 'Albania', 'AL');
INSERT INTO `rainlab_user_countries` VALUES ('27', '0', 'Algeria', 'DZ');
INSERT INTO `rainlab_user_countries` VALUES ('28', '0', 'American Samoa', 'AS');
INSERT INTO `rainlab_user_countries` VALUES ('29', '0', 'Andorra', 'AD');
INSERT INTO `rainlab_user_countries` VALUES ('30', '0', 'Angola', 'AO');
INSERT INTO `rainlab_user_countries` VALUES ('31', '0', 'Anguilla', 'AI');
INSERT INTO `rainlab_user_countries` VALUES ('32', '0', 'Antarctica', 'AQ');
INSERT INTO `rainlab_user_countries` VALUES ('33', '0', 'Antigua and Barbuda', 'AG');
INSERT INTO `rainlab_user_countries` VALUES ('34', '0', 'Argentina', 'AR');
INSERT INTO `rainlab_user_countries` VALUES ('35', '0', 'Armenia', 'AM');
INSERT INTO `rainlab_user_countries` VALUES ('36', '0', 'Aruba', 'AW');
INSERT INTO `rainlab_user_countries` VALUES ('37', '0', 'Azerbaijan', 'AZ');
INSERT INTO `rainlab_user_countries` VALUES ('38', '0', 'Bahamas', 'BS');
INSERT INTO `rainlab_user_countries` VALUES ('39', '0', 'Bahrain', 'BH');
INSERT INTO `rainlab_user_countries` VALUES ('40', '0', 'Bangladesh', 'BD');
INSERT INTO `rainlab_user_countries` VALUES ('41', '0', 'Barbados', 'BB');
INSERT INTO `rainlab_user_countries` VALUES ('42', '0', 'Belarus', 'BY');
INSERT INTO `rainlab_user_countries` VALUES ('43', '0', 'Belize', 'BZ');
INSERT INTO `rainlab_user_countries` VALUES ('44', '0', 'Benin', 'BJ');
INSERT INTO `rainlab_user_countries` VALUES ('45', '0', 'Bermuda', 'BM');
INSERT INTO `rainlab_user_countries` VALUES ('46', '0', 'Bhutan', 'BT');
INSERT INTO `rainlab_user_countries` VALUES ('47', '0', 'Bolivia, Plurinational State of', 'BO');
INSERT INTO `rainlab_user_countries` VALUES ('48', '0', 'Bonaire, Sint Eustatius and Saba', 'BQ');
INSERT INTO `rainlab_user_countries` VALUES ('49', '0', 'Bosnia and Herzegovina', 'BA');
INSERT INTO `rainlab_user_countries` VALUES ('50', '0', 'Botswana', 'BW');
INSERT INTO `rainlab_user_countries` VALUES ('51', '0', 'Bouvet Island', 'BV');
INSERT INTO `rainlab_user_countries` VALUES ('52', '0', 'Brazil', 'BR');
INSERT INTO `rainlab_user_countries` VALUES ('53', '0', 'British Indian Ocean Territory', 'IO');
INSERT INTO `rainlab_user_countries` VALUES ('54', '0', 'Brunei Darussalam', 'BN');
INSERT INTO `rainlab_user_countries` VALUES ('55', '0', 'Bulgaria', 'BG');
INSERT INTO `rainlab_user_countries` VALUES ('56', '0', 'Burkina Faso', 'BF');
INSERT INTO `rainlab_user_countries` VALUES ('57', '0', 'Burundi', 'BI');
INSERT INTO `rainlab_user_countries` VALUES ('58', '0', 'Cambodia', 'KH');
INSERT INTO `rainlab_user_countries` VALUES ('59', '0', 'Cameroon', 'CM');
INSERT INTO `rainlab_user_countries` VALUES ('60', '0', 'Cape Verde', 'CV');
INSERT INTO `rainlab_user_countries` VALUES ('61', '0', 'Cayman Islands', 'KY');
INSERT INTO `rainlab_user_countries` VALUES ('62', '0', 'Central African Republic', 'CF');
INSERT INTO `rainlab_user_countries` VALUES ('63', '0', 'Chad', 'TD');
INSERT INTO `rainlab_user_countries` VALUES ('64', '0', 'Chile', 'CL');
INSERT INTO `rainlab_user_countries` VALUES ('65', '0', 'China', 'CN');
INSERT INTO `rainlab_user_countries` VALUES ('66', '0', 'Christmas Island', 'CX');
INSERT INTO `rainlab_user_countries` VALUES ('67', '0', 'Cocos (Keeling) Islands', 'CC');
INSERT INTO `rainlab_user_countries` VALUES ('68', '0', 'Colombia', 'CO');
INSERT INTO `rainlab_user_countries` VALUES ('69', '0', 'Comoros', 'KM');
INSERT INTO `rainlab_user_countries` VALUES ('70', '0', 'Congo', 'CG');
INSERT INTO `rainlab_user_countries` VALUES ('71', '0', 'Congo, the Democratic Republic of the', 'CD');
INSERT INTO `rainlab_user_countries` VALUES ('72', '0', 'Cook Islands', 'CK');
INSERT INTO `rainlab_user_countries` VALUES ('73', '0', 'Costa Rica', 'CR');
INSERT INTO `rainlab_user_countries` VALUES ('74', '0', 'Cote d\'Ivoire', 'CI');
INSERT INTO `rainlab_user_countries` VALUES ('75', '0', 'Croatia', 'HR');
INSERT INTO `rainlab_user_countries` VALUES ('76', '0', 'Cuba', 'CU');
INSERT INTO `rainlab_user_countries` VALUES ('77', '0', 'Curaçao', 'CW');
INSERT INTO `rainlab_user_countries` VALUES ('78', '0', 'Cyprus', 'CY');
INSERT INTO `rainlab_user_countries` VALUES ('79', '0', 'Djibouti', 'DJ');
INSERT INTO `rainlab_user_countries` VALUES ('80', '0', 'Dominica', 'DM');
INSERT INTO `rainlab_user_countries` VALUES ('81', '0', 'Dominican Republic', 'DO');
INSERT INTO `rainlab_user_countries` VALUES ('82', '0', 'Ecuador', 'EC');
INSERT INTO `rainlab_user_countries` VALUES ('83', '0', 'Egypt', 'EG');
INSERT INTO `rainlab_user_countries` VALUES ('84', '0', 'El Salvador', 'SV');
INSERT INTO `rainlab_user_countries` VALUES ('85', '0', 'Equatorial Guinea', 'GQ');
INSERT INTO `rainlab_user_countries` VALUES ('86', '0', 'Eritrea', 'ER');
INSERT INTO `rainlab_user_countries` VALUES ('87', '0', 'Estonia', 'EE');
INSERT INTO `rainlab_user_countries` VALUES ('88', '0', 'Ethiopia', 'ET');
INSERT INTO `rainlab_user_countries` VALUES ('89', '0', 'Falkland Islands (Malvinas)', 'FK');
INSERT INTO `rainlab_user_countries` VALUES ('90', '0', 'Faroe Islands', 'FO');
INSERT INTO `rainlab_user_countries` VALUES ('91', '0', 'Fiji', 'FJ');
INSERT INTO `rainlab_user_countries` VALUES ('92', '0', 'French Guiana', 'GF');
INSERT INTO `rainlab_user_countries` VALUES ('93', '0', 'French Polynesia', 'PF');
INSERT INTO `rainlab_user_countries` VALUES ('94', '0', 'French Southern Territories', 'TF');
INSERT INTO `rainlab_user_countries` VALUES ('95', '0', 'Gabon', 'GA');
INSERT INTO `rainlab_user_countries` VALUES ('96', '0', 'Gambia', 'GM');
INSERT INTO `rainlab_user_countries` VALUES ('97', '0', 'Georgia', 'GE');
INSERT INTO `rainlab_user_countries` VALUES ('98', '0', 'Ghana', 'GH');
INSERT INTO `rainlab_user_countries` VALUES ('99', '0', 'Gibraltar', 'GI');
INSERT INTO `rainlab_user_countries` VALUES ('100', '0', 'Greece', 'GR');
INSERT INTO `rainlab_user_countries` VALUES ('101', '0', 'Greenland', 'GL');
INSERT INTO `rainlab_user_countries` VALUES ('102', '0', 'Grenada', 'GD');
INSERT INTO `rainlab_user_countries` VALUES ('103', '0', 'Guadeloupe', 'GP');
INSERT INTO `rainlab_user_countries` VALUES ('104', '0', 'Guam', 'GU');
INSERT INTO `rainlab_user_countries` VALUES ('105', '0', 'Guatemala', 'GT');
INSERT INTO `rainlab_user_countries` VALUES ('106', '0', 'Guernsey', 'GG');
INSERT INTO `rainlab_user_countries` VALUES ('107', '0', 'Guinea', 'GN');
INSERT INTO `rainlab_user_countries` VALUES ('108', '0', 'Guinea-Bissau', 'GW');
INSERT INTO `rainlab_user_countries` VALUES ('109', '0', 'Guyana', 'GY');
INSERT INTO `rainlab_user_countries` VALUES ('110', '0', 'Haiti', 'HT');
INSERT INTO `rainlab_user_countries` VALUES ('111', '0', 'Heard Island and McDonald Islands', 'HM');
INSERT INTO `rainlab_user_countries` VALUES ('112', '0', 'Holy See (Vatican City State)', 'VA');
INSERT INTO `rainlab_user_countries` VALUES ('113', '0', 'Honduras', 'HN');
INSERT INTO `rainlab_user_countries` VALUES ('114', '0', 'Hong Kong', 'HK');
INSERT INTO `rainlab_user_countries` VALUES ('115', '0', 'Hungary', 'HU');
INSERT INTO `rainlab_user_countries` VALUES ('116', '0', 'India', 'IN');
INSERT INTO `rainlab_user_countries` VALUES ('117', '0', 'Indonesia', 'ID');
INSERT INTO `rainlab_user_countries` VALUES ('118', '0', 'Iran, Islamic Republic of', 'IR');
INSERT INTO `rainlab_user_countries` VALUES ('119', '0', 'Iraq', 'IQ');
INSERT INTO `rainlab_user_countries` VALUES ('120', '0', 'Israel', 'IL');
INSERT INTO `rainlab_user_countries` VALUES ('121', '0', 'Jamaica', 'JM');
INSERT INTO `rainlab_user_countries` VALUES ('122', '0', 'Japan', 'JP');
INSERT INTO `rainlab_user_countries` VALUES ('123', '0', 'Jersey', 'JE');
INSERT INTO `rainlab_user_countries` VALUES ('124', '0', 'Jordan', 'JO');
INSERT INTO `rainlab_user_countries` VALUES ('125', '0', 'Kazakhstan', 'KZ');
INSERT INTO `rainlab_user_countries` VALUES ('126', '0', 'Kenya', 'KE');
INSERT INTO `rainlab_user_countries` VALUES ('127', '0', 'Kiribati', 'KI');
INSERT INTO `rainlab_user_countries` VALUES ('128', '0', 'Korea, Democratic People\'s Republic of', 'KP');
INSERT INTO `rainlab_user_countries` VALUES ('129', '0', 'Korea, Republic of', 'KR');
INSERT INTO `rainlab_user_countries` VALUES ('130', '0', 'Kuwait', 'KW');
INSERT INTO `rainlab_user_countries` VALUES ('131', '0', 'Kyrgyzstan', 'KG');
INSERT INTO `rainlab_user_countries` VALUES ('132', '0', 'Lao People\'s Democratic Republic', 'LA');
INSERT INTO `rainlab_user_countries` VALUES ('133', '0', 'Latvia', 'LV');
INSERT INTO `rainlab_user_countries` VALUES ('134', '0', 'Lebanon', 'LB');
INSERT INTO `rainlab_user_countries` VALUES ('135', '0', 'Lesotho', 'LS');
INSERT INTO `rainlab_user_countries` VALUES ('136', '0', 'Liberia', 'LR');
INSERT INTO `rainlab_user_countries` VALUES ('137', '0', 'Libyan Arab Jamahiriya', 'LY');
INSERT INTO `rainlab_user_countries` VALUES ('138', '0', 'Liechtenstein', 'LI');
INSERT INTO `rainlab_user_countries` VALUES ('139', '0', 'Lithuania', 'LT');
INSERT INTO `rainlab_user_countries` VALUES ('140', '0', 'Luxembourg', 'LU');
INSERT INTO `rainlab_user_countries` VALUES ('141', '0', 'Macao', 'MO');
INSERT INTO `rainlab_user_countries` VALUES ('142', '0', 'Macedonia', 'MK');
INSERT INTO `rainlab_user_countries` VALUES ('143', '0', 'Madagascar', 'MG');
INSERT INTO `rainlab_user_countries` VALUES ('144', '0', 'Malawi', 'MW');
INSERT INTO `rainlab_user_countries` VALUES ('145', '0', 'Malaysia', 'MY');
INSERT INTO `rainlab_user_countries` VALUES ('146', '0', 'Maldives', 'MV');
INSERT INTO `rainlab_user_countries` VALUES ('147', '0', 'Mali', 'ML');
INSERT INTO `rainlab_user_countries` VALUES ('148', '0', 'Malta', 'MT');
INSERT INTO `rainlab_user_countries` VALUES ('149', '0', 'Marshall Islands', 'MH');
INSERT INTO `rainlab_user_countries` VALUES ('150', '0', 'Martinique', 'MQ');
INSERT INTO `rainlab_user_countries` VALUES ('151', '0', 'Mauritania', 'MR');
INSERT INTO `rainlab_user_countries` VALUES ('152', '0', 'Mauritius', 'MU');
INSERT INTO `rainlab_user_countries` VALUES ('153', '0', 'Mayotte', 'YT');
INSERT INTO `rainlab_user_countries` VALUES ('154', '0', 'Mexico', 'MX');
INSERT INTO `rainlab_user_countries` VALUES ('155', '0', 'Micronesia, Federated States of', 'FM');
INSERT INTO `rainlab_user_countries` VALUES ('156', '0', 'Moldova, Republic of', 'MD');
INSERT INTO `rainlab_user_countries` VALUES ('157', '0', 'Monaco', 'MC');
INSERT INTO `rainlab_user_countries` VALUES ('158', '0', 'Mongolia', 'MN');
INSERT INTO `rainlab_user_countries` VALUES ('159', '0', 'Montenegro', 'ME');
INSERT INTO `rainlab_user_countries` VALUES ('160', '0', 'Montserrat', 'MS');
INSERT INTO `rainlab_user_countries` VALUES ('161', '0', 'Morocco', 'MA');
INSERT INTO `rainlab_user_countries` VALUES ('162', '0', 'Mozambique', 'MZ');
INSERT INTO `rainlab_user_countries` VALUES ('163', '0', 'Myanmar', 'MM');
INSERT INTO `rainlab_user_countries` VALUES ('164', '0', 'Namibia', 'NA');
INSERT INTO `rainlab_user_countries` VALUES ('165', '0', 'Nauru', 'NR');
INSERT INTO `rainlab_user_countries` VALUES ('166', '0', 'Nepal', 'NP');
INSERT INTO `rainlab_user_countries` VALUES ('167', '0', 'New Caledonia', 'NC');
INSERT INTO `rainlab_user_countries` VALUES ('168', '0', 'Nicaragua', 'NI');
INSERT INTO `rainlab_user_countries` VALUES ('169', '0', 'Niger', 'NE');
INSERT INTO `rainlab_user_countries` VALUES ('170', '0', 'Nigeria', 'NG');
INSERT INTO `rainlab_user_countries` VALUES ('171', '0', 'Niue', 'NU');
INSERT INTO `rainlab_user_countries` VALUES ('172', '0', 'Norfolk Island', 'NF');
INSERT INTO `rainlab_user_countries` VALUES ('173', '0', 'Northern Mariana Islands', 'MP');
INSERT INTO `rainlab_user_countries` VALUES ('174', '0', 'Oman', 'OM');
INSERT INTO `rainlab_user_countries` VALUES ('175', '0', 'Pakistan', 'PK');
INSERT INTO `rainlab_user_countries` VALUES ('176', '0', 'Palau', 'PW');
INSERT INTO `rainlab_user_countries` VALUES ('177', '0', 'Palestinian Territory, Occupied', 'PS');
INSERT INTO `rainlab_user_countries` VALUES ('178', '0', 'Panama', 'PA');
INSERT INTO `rainlab_user_countries` VALUES ('179', '0', 'Papua New Guinea', 'PG');
INSERT INTO `rainlab_user_countries` VALUES ('180', '0', 'Paraguay', 'PY');
INSERT INTO `rainlab_user_countries` VALUES ('181', '0', 'Peru', 'PE');
INSERT INTO `rainlab_user_countries` VALUES ('182', '0', 'Philippines', 'PH');
INSERT INTO `rainlab_user_countries` VALUES ('183', '0', 'Pitcairn', 'PN');
INSERT INTO `rainlab_user_countries` VALUES ('184', '0', 'Poland', 'PL');
INSERT INTO `rainlab_user_countries` VALUES ('185', '0', 'Puerto Rico', 'PR');
INSERT INTO `rainlab_user_countries` VALUES ('186', '0', 'Qatar', 'QA');
INSERT INTO `rainlab_user_countries` VALUES ('187', '0', 'Reunion', 'RE');
INSERT INTO `rainlab_user_countries` VALUES ('188', '0', 'Romania', 'RO');
INSERT INTO `rainlab_user_countries` VALUES ('189', '0', 'Rwanda', 'RW');
INSERT INTO `rainlab_user_countries` VALUES ('190', '0', 'Saint Barthélemy', 'BL');
INSERT INTO `rainlab_user_countries` VALUES ('191', '0', 'Saint Helena', 'SH');
INSERT INTO `rainlab_user_countries` VALUES ('192', '0', 'Saint Kitts and Nevis', 'KN');
INSERT INTO `rainlab_user_countries` VALUES ('193', '0', 'Saint Lucia', 'LC');
INSERT INTO `rainlab_user_countries` VALUES ('194', '0', 'Saint Martin (French part)', 'MF');
INSERT INTO `rainlab_user_countries` VALUES ('195', '0', 'Saint Pierre and Miquelon', 'PM');
INSERT INTO `rainlab_user_countries` VALUES ('196', '0', 'Saint Vincent and the Grenadines', 'VC');
INSERT INTO `rainlab_user_countries` VALUES ('197', '0', 'Samoa', 'WS');
INSERT INTO `rainlab_user_countries` VALUES ('198', '0', 'San Marino', 'SM');
INSERT INTO `rainlab_user_countries` VALUES ('199', '0', 'Sao Tome and Principe', 'ST');
INSERT INTO `rainlab_user_countries` VALUES ('200', '0', 'Saudi Arabia', 'SA');
INSERT INTO `rainlab_user_countries` VALUES ('201', '0', 'Senegal', 'SN');
INSERT INTO `rainlab_user_countries` VALUES ('202', '0', 'Serbia', 'RS');
INSERT INTO `rainlab_user_countries` VALUES ('203', '0', 'Seychelles', 'SC');
INSERT INTO `rainlab_user_countries` VALUES ('204', '0', 'Sierra Leone', 'SL');
INSERT INTO `rainlab_user_countries` VALUES ('205', '0', 'Singapore', 'SG');
INSERT INTO `rainlab_user_countries` VALUES ('206', '0', 'Sint Maarten (Dutch part)', 'SX');
INSERT INTO `rainlab_user_countries` VALUES ('207', '0', 'Slovakia', 'SK');
INSERT INTO `rainlab_user_countries` VALUES ('208', '0', 'Slovenia', 'SI');
INSERT INTO `rainlab_user_countries` VALUES ('209', '0', 'Solomon Islands', 'SB');
INSERT INTO `rainlab_user_countries` VALUES ('210', '0', 'Somalia', 'SO');
INSERT INTO `rainlab_user_countries` VALUES ('211', '0', 'South Africa', 'ZA');
INSERT INTO `rainlab_user_countries` VALUES ('212', '0', 'South Georgia and the South Sandwich Islands', 'GS');
INSERT INTO `rainlab_user_countries` VALUES ('213', '0', 'Sri Lanka', 'LK');
INSERT INTO `rainlab_user_countries` VALUES ('214', '0', 'Sudan', 'SD');
INSERT INTO `rainlab_user_countries` VALUES ('215', '0', 'Suriname', 'SR');
INSERT INTO `rainlab_user_countries` VALUES ('216', '0', 'Svalbard and Jan Mayen', 'SJ');
INSERT INTO `rainlab_user_countries` VALUES ('217', '0', 'Swaziland', 'SZ');
INSERT INTO `rainlab_user_countries` VALUES ('218', '0', 'Syrian Arab Republic', 'SY');
INSERT INTO `rainlab_user_countries` VALUES ('219', '0', 'Taiwan, Province of China', 'TW');
INSERT INTO `rainlab_user_countries` VALUES ('220', '0', 'Tajikistan', 'TJ');
INSERT INTO `rainlab_user_countries` VALUES ('221', '0', 'Tanzania, United Republic of', 'TZ');
INSERT INTO `rainlab_user_countries` VALUES ('222', '0', 'Thailand', 'TH');
INSERT INTO `rainlab_user_countries` VALUES ('223', '0', 'Timor-Leste', 'TL');
INSERT INTO `rainlab_user_countries` VALUES ('224', '0', 'Togo', 'TG');
INSERT INTO `rainlab_user_countries` VALUES ('225', '0', 'Tokelau', 'TK');
INSERT INTO `rainlab_user_countries` VALUES ('226', '0', 'Tonga', 'TO');
INSERT INTO `rainlab_user_countries` VALUES ('227', '0', 'Trinidad and Tobago', 'TT');
INSERT INTO `rainlab_user_countries` VALUES ('228', '0', 'Tunisia', 'TN');
INSERT INTO `rainlab_user_countries` VALUES ('229', '0', 'Turkey', 'TR');
INSERT INTO `rainlab_user_countries` VALUES ('230', '0', 'Turkmenistan', 'TM');
INSERT INTO `rainlab_user_countries` VALUES ('231', '0', 'Turks and Caicos Islands', 'TC');
INSERT INTO `rainlab_user_countries` VALUES ('232', '0', 'Tuvalu', 'TV');
INSERT INTO `rainlab_user_countries` VALUES ('233', '0', 'Uganda', 'UG');
INSERT INTO `rainlab_user_countries` VALUES ('234', '0', 'Ukraine', 'UA');
INSERT INTO `rainlab_user_countries` VALUES ('235', '0', 'United Arab Emirates', 'AE');
INSERT INTO `rainlab_user_countries` VALUES ('236', '0', 'United States Minor Outlying Islands', 'UM');
INSERT INTO `rainlab_user_countries` VALUES ('237', '0', 'Uruguay', 'UY');
INSERT INTO `rainlab_user_countries` VALUES ('238', '0', 'Uzbekistan', 'UZ');
INSERT INTO `rainlab_user_countries` VALUES ('239', '0', 'Vanuatu', 'VU');
INSERT INTO `rainlab_user_countries` VALUES ('240', '0', 'Venezuela, Bolivarian Republic of', 'VE');
INSERT INTO `rainlab_user_countries` VALUES ('241', '0', 'Viet Nam', 'VN');
INSERT INTO `rainlab_user_countries` VALUES ('242', '0', 'Virgin Islands, British', 'VG');
INSERT INTO `rainlab_user_countries` VALUES ('243', '0', 'Virgin Islands, U.S.', 'VI');
INSERT INTO `rainlab_user_countries` VALUES ('244', '0', 'Wallis and Futuna', 'WF');
INSERT INTO `rainlab_user_countries` VALUES ('245', '0', 'Western Sahara', 'EH');
INSERT INTO `rainlab_user_countries` VALUES ('246', '0', 'Yemen', 'YE');
INSERT INTO `rainlab_user_countries` VALUES ('247', '0', 'Zambia', 'ZM');
INSERT INTO `rainlab_user_countries` VALUES ('248', '0', 'Zimbabwe', 'ZW');

-- ----------------------------
-- Table structure for rainlab_user_mail_blockers
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_user_mail_blockers`;
CREATE TABLE `rainlab_user_mail_blockers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `rainlab_user_mail_blockers_email_index` (`email`),
  KEY `rainlab_user_mail_blockers_template_index` (`template`),
  KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_user_mail_blockers
-- ----------------------------

-- ----------------------------
-- Table structure for rainlab_user_states
-- ----------------------------
DROP TABLE IF EXISTS `rainlab_user_states`;
CREATE TABLE `rainlab_user_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_user_states_country_id_index` (`country_id`),
  KEY `rainlab_user_states_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rainlab_user_states
-- ----------------------------
INSERT INTO `rainlab_user_states` VALUES ('1', '1', 'Alabama', 'AL');
INSERT INTO `rainlab_user_states` VALUES ('2', '1', 'Alaska', 'AK');
INSERT INTO `rainlab_user_states` VALUES ('3', '1', 'American Samoa', 'AS');
INSERT INTO `rainlab_user_states` VALUES ('4', '1', 'Arizona', 'AZ');
INSERT INTO `rainlab_user_states` VALUES ('5', '1', 'Arkansas', 'AR');
INSERT INTO `rainlab_user_states` VALUES ('6', '1', 'California', 'CA');
INSERT INTO `rainlab_user_states` VALUES ('7', '1', 'Colorado', 'CO');
INSERT INTO `rainlab_user_states` VALUES ('8', '1', 'Connecticut', 'CT');
INSERT INTO `rainlab_user_states` VALUES ('9', '1', 'Delaware', 'DE');
INSERT INTO `rainlab_user_states` VALUES ('10', '1', 'Dist. of Columbia', 'DC');
INSERT INTO `rainlab_user_states` VALUES ('11', '1', 'Florida', 'FL');
INSERT INTO `rainlab_user_states` VALUES ('12', '1', 'Georgia', 'GA');
INSERT INTO `rainlab_user_states` VALUES ('13', '1', 'Guam', 'GU');
INSERT INTO `rainlab_user_states` VALUES ('14', '1', 'Hawaii', 'HI');
INSERT INTO `rainlab_user_states` VALUES ('15', '1', 'Idaho', 'ID');
INSERT INTO `rainlab_user_states` VALUES ('16', '1', 'Illinois', 'IL');
INSERT INTO `rainlab_user_states` VALUES ('17', '1', 'Indiana', 'IN');
INSERT INTO `rainlab_user_states` VALUES ('18', '1', 'Iowa', 'IA');
INSERT INTO `rainlab_user_states` VALUES ('19', '1', 'Kansas', 'KS');
INSERT INTO `rainlab_user_states` VALUES ('20', '1', 'Kentucky', 'KY');
INSERT INTO `rainlab_user_states` VALUES ('21', '1', 'Louisiana', 'LA');
INSERT INTO `rainlab_user_states` VALUES ('22', '1', 'Maine', 'ME');
INSERT INTO `rainlab_user_states` VALUES ('23', '1', 'Maryland', 'MD');
INSERT INTO `rainlab_user_states` VALUES ('24', '1', 'Marshall Islands', 'MH');
INSERT INTO `rainlab_user_states` VALUES ('25', '1', 'Massachusetts', 'MA');
INSERT INTO `rainlab_user_states` VALUES ('26', '1', 'Michigan', 'MI');
INSERT INTO `rainlab_user_states` VALUES ('27', '1', 'Micronesia', 'FM');
INSERT INTO `rainlab_user_states` VALUES ('28', '1', 'Minnesota', 'MN');
INSERT INTO `rainlab_user_states` VALUES ('29', '1', 'Mississippi', 'MS');
INSERT INTO `rainlab_user_states` VALUES ('30', '1', 'Missouri', 'MO');
INSERT INTO `rainlab_user_states` VALUES ('31', '1', 'Montana', 'MT');
INSERT INTO `rainlab_user_states` VALUES ('32', '1', 'Nebraska', 'NE');
INSERT INTO `rainlab_user_states` VALUES ('33', '1', 'Nevada', 'NV');
INSERT INTO `rainlab_user_states` VALUES ('34', '1', 'New Hampshire', 'NH');
INSERT INTO `rainlab_user_states` VALUES ('35', '1', 'New Jersey', 'NJ');
INSERT INTO `rainlab_user_states` VALUES ('36', '1', 'New Mexico', 'NM');
INSERT INTO `rainlab_user_states` VALUES ('37', '1', 'New York', 'NY');
INSERT INTO `rainlab_user_states` VALUES ('38', '1', 'North Carolina', 'NC');
INSERT INTO `rainlab_user_states` VALUES ('39', '1', 'North Dakota', 'ND');
INSERT INTO `rainlab_user_states` VALUES ('40', '1', 'Northern Marianas', 'MP');
INSERT INTO `rainlab_user_states` VALUES ('41', '1', 'Ohio', 'OH');
INSERT INTO `rainlab_user_states` VALUES ('42', '1', 'Oklahoma', 'OK');
INSERT INTO `rainlab_user_states` VALUES ('43', '1', 'Oregon', 'OR');
INSERT INTO `rainlab_user_states` VALUES ('44', '1', 'Palau', 'PW');
INSERT INTO `rainlab_user_states` VALUES ('45', '1', 'Pennsylvania', 'PA');
INSERT INTO `rainlab_user_states` VALUES ('46', '1', 'Puerto Rico', 'PR');
INSERT INTO `rainlab_user_states` VALUES ('47', '1', 'Rhode Island', 'RI');
INSERT INTO `rainlab_user_states` VALUES ('48', '1', 'South Carolina', 'SC');
INSERT INTO `rainlab_user_states` VALUES ('49', '1', 'South Dakota', 'SD');
INSERT INTO `rainlab_user_states` VALUES ('50', '1', 'Tennessee', 'TN');
INSERT INTO `rainlab_user_states` VALUES ('51', '1', 'Texas', 'TX');
INSERT INTO `rainlab_user_states` VALUES ('52', '1', 'Utah', 'UT');
INSERT INTO `rainlab_user_states` VALUES ('53', '1', 'Vermont', 'VT');
INSERT INTO `rainlab_user_states` VALUES ('54', '1', 'Virginia', 'VA');
INSERT INTO `rainlab_user_states` VALUES ('55', '1', 'Virgin Islands', 'VI');
INSERT INTO `rainlab_user_states` VALUES ('56', '1', 'Washington', 'WA');
INSERT INTO `rainlab_user_states` VALUES ('57', '1', 'West Virginia', 'WV');
INSERT INTO `rainlab_user_states` VALUES ('58', '1', 'Wisconsin', 'WI');
INSERT INTO `rainlab_user_states` VALUES ('59', '1', 'Wyoming', 'WY');
INSERT INTO `rainlab_user_states` VALUES ('60', '2', 'Alberta', 'AB');
INSERT INTO `rainlab_user_states` VALUES ('61', '2', 'British Columbia', 'BC');
INSERT INTO `rainlab_user_states` VALUES ('62', '2', 'Manitoba', 'MB');
INSERT INTO `rainlab_user_states` VALUES ('63', '2', 'New Brunswick', 'NB');
INSERT INTO `rainlab_user_states` VALUES ('64', '2', 'Newfoundland and Labrador', 'NL');
INSERT INTO `rainlab_user_states` VALUES ('65', '2', 'Northwest Territories', 'NT');
INSERT INTO `rainlab_user_states` VALUES ('66', '2', 'Nova Scotia', 'NS');
INSERT INTO `rainlab_user_states` VALUES ('67', '2', 'Nunavut', 'NU');
INSERT INTO `rainlab_user_states` VALUES ('68', '2', 'Ontario', 'ON');
INSERT INTO `rainlab_user_states` VALUES ('69', '2', 'Prince Edward Island', 'PE');
INSERT INTO `rainlab_user_states` VALUES ('70', '2', 'Quebec', 'QC');
INSERT INTO `rainlab_user_states` VALUES ('71', '2', 'Saskatchewan', 'SK');
INSERT INTO `rainlab_user_states` VALUES ('72', '2', 'Yukon', 'YT');
INSERT INTO `rainlab_user_states` VALUES ('73', '3', 'New South Wales', 'NSW');
INSERT INTO `rainlab_user_states` VALUES ('74', '3', 'Queensland', 'QLD');
INSERT INTO `rainlab_user_states` VALUES ('75', '3', 'South Australia', 'SA');
INSERT INTO `rainlab_user_states` VALUES ('76', '3', 'Tasmania', 'TAS');
INSERT INTO `rainlab_user_states` VALUES ('77', '3', 'Victoria', 'VIC');
INSERT INTO `rainlab_user_states` VALUES ('78', '3', 'Western Australia', 'WA');
INSERT INTO `rainlab_user_states` VALUES ('79', '3', 'Northern Territory', 'NT');
INSERT INTO `rainlab_user_states` VALUES ('80', '3', 'Australian Capital Territory', 'ACT');
INSERT INTO `rainlab_user_states` VALUES ('81', '5', 'Baden-Württemberg', 'BW');
INSERT INTO `rainlab_user_states` VALUES ('82', '5', 'Bavaria', 'BY');
INSERT INTO `rainlab_user_states` VALUES ('83', '5', 'Berlin', 'BE');
INSERT INTO `rainlab_user_states` VALUES ('84', '5', 'Brandenburg', 'BB');
INSERT INTO `rainlab_user_states` VALUES ('85', '5', 'Bremen', 'HB');
INSERT INTO `rainlab_user_states` VALUES ('86', '5', 'Hamburg', 'HH');
INSERT INTO `rainlab_user_states` VALUES ('87', '5', 'Hesse', 'HE');
INSERT INTO `rainlab_user_states` VALUES ('88', '5', 'Mecklenburg-Vorpommern', 'MV');
INSERT INTO `rainlab_user_states` VALUES ('89', '5', 'Lower Saxony', 'NI');
INSERT INTO `rainlab_user_states` VALUES ('90', '5', 'North Rhine-Westphalia', 'NW');
INSERT INTO `rainlab_user_states` VALUES ('91', '5', 'Rhineland-Palatinate', 'RP');
INSERT INTO `rainlab_user_states` VALUES ('92', '5', 'Saarland', 'SL');
INSERT INTO `rainlab_user_states` VALUES ('93', '5', 'Saxony', 'SN');
INSERT INTO `rainlab_user_states` VALUES ('94', '5', 'Saxony-Anhalt', 'ST');
INSERT INTO `rainlab_user_states` VALUES ('95', '5', 'Schleswig-Holstein', 'SH');
INSERT INTO `rainlab_user_states` VALUES ('96', '5', 'Thuringia', 'TH');
INSERT INTO `rainlab_user_states` VALUES ('97', '7', 'Dublin', 'D');
INSERT INTO `rainlab_user_states` VALUES ('98', '7', 'Wicklow', 'WW');
INSERT INTO `rainlab_user_states` VALUES ('99', '7', 'Wexford', 'WX');
INSERT INTO `rainlab_user_states` VALUES ('100', '7', 'Carlow', 'CW');
INSERT INTO `rainlab_user_states` VALUES ('101', '7', 'Kildare', 'KE');
INSERT INTO `rainlab_user_states` VALUES ('102', '7', 'Meath', 'MH');
INSERT INTO `rainlab_user_states` VALUES ('103', '7', 'Louth', 'LH');
INSERT INTO `rainlab_user_states` VALUES ('104', '7', 'Monaghan', 'MN');
INSERT INTO `rainlab_user_states` VALUES ('105', '7', 'Cavan', 'CN');
INSERT INTO `rainlab_user_states` VALUES ('106', '7', 'Longford', 'LD');
INSERT INTO `rainlab_user_states` VALUES ('107', '7', 'Westmeath', 'WH');
INSERT INTO `rainlab_user_states` VALUES ('108', '7', 'Offaly', 'OY');
INSERT INTO `rainlab_user_states` VALUES ('109', '7', 'Laois', 'LS');
INSERT INTO `rainlab_user_states` VALUES ('110', '7', 'Kilkenny', 'KK');
INSERT INTO `rainlab_user_states` VALUES ('111', '7', 'Waterford', 'WD');
INSERT INTO `rainlab_user_states` VALUES ('112', '7', 'Cork', 'C');
INSERT INTO `rainlab_user_states` VALUES ('113', '7', 'Kerry', 'KY');
INSERT INTO `rainlab_user_states` VALUES ('114', '7', 'Limerick', 'LK');
INSERT INTO `rainlab_user_states` VALUES ('115', '7', 'North Tipperary', 'TN');
INSERT INTO `rainlab_user_states` VALUES ('116', '7', 'South Tipperary', 'TS');
INSERT INTO `rainlab_user_states` VALUES ('117', '7', 'Clare', 'CE');
INSERT INTO `rainlab_user_states` VALUES ('118', '7', 'Galway', 'G');
INSERT INTO `rainlab_user_states` VALUES ('119', '7', 'Mayo', 'MO');
INSERT INTO `rainlab_user_states` VALUES ('120', '7', 'Roscommon', 'RN');
INSERT INTO `rainlab_user_states` VALUES ('121', '7', 'Sligo', 'SO');
INSERT INTO `rainlab_user_states` VALUES ('122', '7', 'Leitrim', 'LM');
INSERT INTO `rainlab_user_states` VALUES ('123', '7', 'Donegal', 'DL');
INSERT INTO `rainlab_user_states` VALUES ('124', '22', 'Drenthe', 'DR');
INSERT INTO `rainlab_user_states` VALUES ('125', '22', 'Flevoland', 'FL');
INSERT INTO `rainlab_user_states` VALUES ('126', '22', 'Friesland', 'FR');
INSERT INTO `rainlab_user_states` VALUES ('127', '22', 'Gelderland', 'GE');
INSERT INTO `rainlab_user_states` VALUES ('128', '22', 'Groningen', 'GR');
INSERT INTO `rainlab_user_states` VALUES ('129', '22', 'Limburg', 'LI');
INSERT INTO `rainlab_user_states` VALUES ('130', '22', 'Noord-Brabant', 'NB');
INSERT INTO `rainlab_user_states` VALUES ('131', '22', 'Noord-Holland', 'NH');
INSERT INTO `rainlab_user_states` VALUES ('132', '22', 'Overijssel', 'OV');
INSERT INTO `rainlab_user_states` VALUES ('133', '22', 'Utrecht', 'UT');
INSERT INTO `rainlab_user_states` VALUES ('134', '22', 'Zeeland', 'ZE');
INSERT INTO `rainlab_user_states` VALUES ('135', '22', 'Zuid-Holland', 'ZH');
INSERT INTO `rainlab_user_states` VALUES ('136', '17', 'Aberdeenshire', 'ABE');
INSERT INTO `rainlab_user_states` VALUES ('137', '17', 'Anglesey', 'ALY');
INSERT INTO `rainlab_user_states` VALUES ('138', '17', 'Angus', 'ANG');
INSERT INTO `rainlab_user_states` VALUES ('139', '17', 'Argyll', 'ARG');
INSERT INTO `rainlab_user_states` VALUES ('140', '17', 'Ayrshire', 'AYR');
INSERT INTO `rainlab_user_states` VALUES ('141', '17', 'Banffshire', 'BAN');
INSERT INTO `rainlab_user_states` VALUES ('142', '17', 'Bedfordshire', 'BED');
INSERT INTO `rainlab_user_states` VALUES ('143', '17', 'Berkshire', 'BER');
INSERT INTO `rainlab_user_states` VALUES ('144', '17', 'Berwickshire', 'BWS');
INSERT INTO `rainlab_user_states` VALUES ('145', '17', 'Brecknockshire', 'BRE');
INSERT INTO `rainlab_user_states` VALUES ('146', '17', 'Buckinghamshire', 'BUC');
INSERT INTO `rainlab_user_states` VALUES ('147', '17', 'Bute', 'BUT');
INSERT INTO `rainlab_user_states` VALUES ('148', '17', 'Caernarfonshire', 'CAE');
INSERT INTO `rainlab_user_states` VALUES ('149', '17', 'Caithness', 'CAI');
INSERT INTO `rainlab_user_states` VALUES ('150', '17', 'Cambridgeshire', 'CAM');
INSERT INTO `rainlab_user_states` VALUES ('151', '17', 'Cardiganshire', 'CAR');
INSERT INTO `rainlab_user_states` VALUES ('152', '17', 'Carmarthenshire', 'CMS');
INSERT INTO `rainlab_user_states` VALUES ('153', '17', 'Cheshire', 'CHE');
INSERT INTO `rainlab_user_states` VALUES ('154', '17', 'Clackmannanshire', 'CLA');
INSERT INTO `rainlab_user_states` VALUES ('155', '17', 'Cleveland', 'CLE');
INSERT INTO `rainlab_user_states` VALUES ('156', '17', 'Cornwall', 'COR');
INSERT INTO `rainlab_user_states` VALUES ('157', '17', 'Cromartyshire', 'CRO');
INSERT INTO `rainlab_user_states` VALUES ('158', '17', 'Cumberland', 'CBR');
INSERT INTO `rainlab_user_states` VALUES ('159', '17', 'Cumbria', 'CUM');
INSERT INTO `rainlab_user_states` VALUES ('160', '17', 'Denbighshire', 'DEN');
INSERT INTO `rainlab_user_states` VALUES ('161', '17', 'Derbyshire', 'DER');
INSERT INTO `rainlab_user_states` VALUES ('162', '17', 'Devon', 'DEV');
INSERT INTO `rainlab_user_states` VALUES ('163', '17', 'Dorset', 'DOR');
INSERT INTO `rainlab_user_states` VALUES ('164', '17', 'Dumbartonshire', 'DBS');
INSERT INTO `rainlab_user_states` VALUES ('165', '17', 'Dumfriesshire', 'DUM');
INSERT INTO `rainlab_user_states` VALUES ('166', '17', 'Durham', 'DUR');
INSERT INTO `rainlab_user_states` VALUES ('167', '17', 'East Lothian', 'ELO');
INSERT INTO `rainlab_user_states` VALUES ('168', '17', 'Essex', 'ESS');
INSERT INTO `rainlab_user_states` VALUES ('169', '17', 'Flintshire', 'FLI');
INSERT INTO `rainlab_user_states` VALUES ('170', '17', 'Fife', 'FIF');
INSERT INTO `rainlab_user_states` VALUES ('171', '17', 'Glamorgan', 'GLA');
INSERT INTO `rainlab_user_states` VALUES ('172', '17', 'Gloucestershire', 'GLO');
INSERT INTO `rainlab_user_states` VALUES ('173', '17', 'Hampshire', 'HAM');
INSERT INTO `rainlab_user_states` VALUES ('174', '17', 'Herefordshire', 'HER');
INSERT INTO `rainlab_user_states` VALUES ('175', '17', 'Hertfordshire', 'HTF');
INSERT INTO `rainlab_user_states` VALUES ('176', '17', 'Huntingdonshire', 'HUN');
INSERT INTO `rainlab_user_states` VALUES ('177', '17', 'Inverness', 'INV');
INSERT INTO `rainlab_user_states` VALUES ('178', '17', 'Kent', 'KEN');
INSERT INTO `rainlab_user_states` VALUES ('179', '17', 'Kincardineshire', 'KCD');
INSERT INTO `rainlab_user_states` VALUES ('180', '17', 'Kinross-shire', 'KIN');
INSERT INTO `rainlab_user_states` VALUES ('181', '17', 'Kirkcudbrightshire', 'KIR');
INSERT INTO `rainlab_user_states` VALUES ('182', '17', 'Lanarkshire', 'LKS');
INSERT INTO `rainlab_user_states` VALUES ('183', '17', 'Lancashire', 'LAN');
INSERT INTO `rainlab_user_states` VALUES ('184', '17', 'Leicestershire', 'LEI');
INSERT INTO `rainlab_user_states` VALUES ('185', '17', 'Lincolnshire', 'LIN');
INSERT INTO `rainlab_user_states` VALUES ('186', '17', 'London', 'LON');
INSERT INTO `rainlab_user_states` VALUES ('187', '17', 'Manchester', 'MAN');
INSERT INTO `rainlab_user_states` VALUES ('188', '17', 'Merionethshire', 'MER');
INSERT INTO `rainlab_user_states` VALUES ('189', '17', 'Merseyside', 'MER');
INSERT INTO `rainlab_user_states` VALUES ('190', '17', 'Middlesex', 'MDX');
INSERT INTO `rainlab_user_states` VALUES ('191', '17', 'Midlands', 'MID');
INSERT INTO `rainlab_user_states` VALUES ('192', '17', 'Midlothian', 'MLT');
INSERT INTO `rainlab_user_states` VALUES ('193', '17', 'Monmouthshire', 'MON');
INSERT INTO `rainlab_user_states` VALUES ('194', '17', 'Montgomeryshire', 'MGY');
INSERT INTO `rainlab_user_states` VALUES ('195', '17', 'Moray', 'MOR');
INSERT INTO `rainlab_user_states` VALUES ('196', '17', 'Nairnshire', 'NAI');
INSERT INTO `rainlab_user_states` VALUES ('197', '17', 'Norfolk', 'NOR');
INSERT INTO `rainlab_user_states` VALUES ('198', '17', 'Northamptonshire', 'NMP');
INSERT INTO `rainlab_user_states` VALUES ('199', '17', 'Northumberland', 'NUM');
INSERT INTO `rainlab_user_states` VALUES ('200', '17', 'Nottinghamshire', 'NOT');
INSERT INTO `rainlab_user_states` VALUES ('201', '17', 'Orkney', 'ORK');
INSERT INTO `rainlab_user_states` VALUES ('202', '17', 'Oxfordshire', 'OXF');
INSERT INTO `rainlab_user_states` VALUES ('203', '17', 'Peebleshire', 'PEE');
INSERT INTO `rainlab_user_states` VALUES ('204', '17', 'Pembrokeshire', 'PEM');
INSERT INTO `rainlab_user_states` VALUES ('205', '17', 'Perthshire', 'PER');
INSERT INTO `rainlab_user_states` VALUES ('206', '17', 'Radnorshire', 'RAD');
INSERT INTO `rainlab_user_states` VALUES ('207', '17', 'Renfrewshire', 'REN');
INSERT INTO `rainlab_user_states` VALUES ('208', '17', 'Ross & Cromarty', 'ROS');
INSERT INTO `rainlab_user_states` VALUES ('209', '17', 'Roxburghshire', 'ROX');
INSERT INTO `rainlab_user_states` VALUES ('210', '17', 'Rutland', 'RUT');
INSERT INTO `rainlab_user_states` VALUES ('211', '17', 'Selkirkshire', 'SEL');
INSERT INTO `rainlab_user_states` VALUES ('212', '17', 'Shetland', 'SHE');
INSERT INTO `rainlab_user_states` VALUES ('213', '17', 'Shropshire', 'SHR');
INSERT INTO `rainlab_user_states` VALUES ('214', '17', 'Somerset', 'SOM');
INSERT INTO `rainlab_user_states` VALUES ('215', '17', 'Staffordshire', 'STA');
INSERT INTO `rainlab_user_states` VALUES ('216', '17', 'Stirlingshire', 'STI');
INSERT INTO `rainlab_user_states` VALUES ('217', '17', 'Suffolk', 'SUF');
INSERT INTO `rainlab_user_states` VALUES ('218', '17', 'Surrey', 'SUR');
INSERT INTO `rainlab_user_states` VALUES ('219', '17', 'Sussex', 'SUS');
INSERT INTO `rainlab_user_states` VALUES ('220', '17', 'Sutherland', 'SUT');
INSERT INTO `rainlab_user_states` VALUES ('221', '17', 'Tyne & Wear', 'TYN');
INSERT INTO `rainlab_user_states` VALUES ('222', '17', 'Warwickshire', 'WAR');
INSERT INTO `rainlab_user_states` VALUES ('223', '17', 'West Lothian', 'WLO');
INSERT INTO `rainlab_user_states` VALUES ('224', '17', 'Westmorland', 'WES');
INSERT INTO `rainlab_user_states` VALUES ('225', '17', 'Wigtownshire', 'WIG');
INSERT INTO `rainlab_user_states` VALUES ('226', '17', 'Wiltshire', 'WIL');
INSERT INTO `rainlab_user_states` VALUES ('227', '17', 'Worcestershire', 'WOR');
INSERT INTO `rainlab_user_states` VALUES ('228', '17', 'Yorkshire', 'YOR');
INSERT INTO `rainlab_user_states` VALUES ('229', '115', 'Budapest', 'BUD');
INSERT INTO `rainlab_user_states` VALUES ('230', '115', 'Baranya', 'BAR');
INSERT INTO `rainlab_user_states` VALUES ('231', '115', 'Bács-Kiskun', 'BKM');
INSERT INTO `rainlab_user_states` VALUES ('232', '115', 'Békés', 'BEK');
INSERT INTO `rainlab_user_states` VALUES ('233', '115', 'Borsod-Abaúj-Zemplén', 'BAZ');
INSERT INTO `rainlab_user_states` VALUES ('234', '115', 'Csongrád', 'CSO');
INSERT INTO `rainlab_user_states` VALUES ('235', '115', 'Fejér', 'FEJ');
INSERT INTO `rainlab_user_states` VALUES ('236', '115', 'Győr-Moson-Sopron', 'GMS');
INSERT INTO `rainlab_user_states` VALUES ('237', '115', 'Hajdú-Bihar', 'HBM');
INSERT INTO `rainlab_user_states` VALUES ('238', '115', 'Heves', 'HEV');
INSERT INTO `rainlab_user_states` VALUES ('239', '115', 'Jász-Nagykun-Szolnok', 'JNS');
INSERT INTO `rainlab_user_states` VALUES ('240', '115', 'Komárom-Esztergom', 'KEM');
INSERT INTO `rainlab_user_states` VALUES ('241', '115', 'Nógrád', 'NOG');
INSERT INTO `rainlab_user_states` VALUES ('242', '115', 'Pest', 'PES');
INSERT INTO `rainlab_user_states` VALUES ('243', '115', 'Somogy', 'SOM');
INSERT INTO `rainlab_user_states` VALUES ('244', '115', 'Szabolcs-Szatmár-Bereg', 'SSB');
INSERT INTO `rainlab_user_states` VALUES ('245', '115', 'Tolna', 'TOL');
INSERT INTO `rainlab_user_states` VALUES ('246', '115', 'Vas', 'VAS');
INSERT INTO `rainlab_user_states` VALUES ('247', '115', 'Veszprém', 'VES');
INSERT INTO `rainlab_user_states` VALUES ('248', '115', 'Zala', 'ZAL');
INSERT INTO `rainlab_user_states` VALUES ('249', '116', 'Andhra Pradesh', 'AP');
INSERT INTO `rainlab_user_states` VALUES ('250', '116', 'Arunachal Pradesh', 'AR');
INSERT INTO `rainlab_user_states` VALUES ('251', '116', 'Assam', 'AS');
INSERT INTO `rainlab_user_states` VALUES ('252', '116', 'Bihar', 'BR');
INSERT INTO `rainlab_user_states` VALUES ('253', '116', 'Chhattisgarh', 'CT');
INSERT INTO `rainlab_user_states` VALUES ('254', '116', 'Goa', 'GA');
INSERT INTO `rainlab_user_states` VALUES ('255', '116', 'Gujarat', 'GJ');
INSERT INTO `rainlab_user_states` VALUES ('256', '116', 'Haryana', 'HR');
INSERT INTO `rainlab_user_states` VALUES ('257', '116', 'Himachal Pradesh', 'HP');
INSERT INTO `rainlab_user_states` VALUES ('258', '116', 'Jammu and Kashmir', 'JK');
INSERT INTO `rainlab_user_states` VALUES ('259', '116', 'Jharkhand', 'JH');
INSERT INTO `rainlab_user_states` VALUES ('260', '116', 'Karnataka', 'KA');
INSERT INTO `rainlab_user_states` VALUES ('261', '116', 'Kerala', 'KL');
INSERT INTO `rainlab_user_states` VALUES ('262', '116', 'Madhya Pradesh', 'MP');
INSERT INTO `rainlab_user_states` VALUES ('263', '116', 'Maharashtra', 'MH');
INSERT INTO `rainlab_user_states` VALUES ('264', '116', 'Manipur', 'MN');
INSERT INTO `rainlab_user_states` VALUES ('265', '116', 'Meghalaya', 'ML');
INSERT INTO `rainlab_user_states` VALUES ('266', '116', 'Mizoram', 'MZ');
INSERT INTO `rainlab_user_states` VALUES ('267', '116', 'Nagaland', 'NL');
INSERT INTO `rainlab_user_states` VALUES ('268', '116', 'Odisha', 'OR');
INSERT INTO `rainlab_user_states` VALUES ('269', '116', 'Punjab', 'PB');
INSERT INTO `rainlab_user_states` VALUES ('270', '116', 'Rajasthan', 'RJ');
INSERT INTO `rainlab_user_states` VALUES ('271', '116', 'Sikkim', 'SK');
INSERT INTO `rainlab_user_states` VALUES ('272', '116', 'Tamil Nadu', 'TN');
INSERT INTO `rainlab_user_states` VALUES ('273', '116', 'Telangana', 'TG');
INSERT INTO `rainlab_user_states` VALUES ('274', '116', 'Tripura', 'TR');
INSERT INTO `rainlab_user_states` VALUES ('275', '116', 'Uttarakhand', 'UT');
INSERT INTO `rainlab_user_states` VALUES ('276', '116', 'Uttar Pradesh', 'UP');
INSERT INTO `rainlab_user_states` VALUES ('277', '116', 'West Bengal', 'WB');
INSERT INTO `rainlab_user_states` VALUES ('278', '116', 'Andaman and Nicobar Islands', 'AN');
INSERT INTO `rainlab_user_states` VALUES ('279', '116', 'Chandigarh', 'CH');
INSERT INTO `rainlab_user_states` VALUES ('280', '116', 'Dadra and Nagar Haveli', 'DN');
INSERT INTO `rainlab_user_states` VALUES ('281', '116', 'Daman and Diu', 'DD');
INSERT INTO `rainlab_user_states` VALUES ('282', '116', 'Delhi', 'DL');
INSERT INTO `rainlab_user_states` VALUES ('283', '116', 'Lakshadweep', 'LD');
INSERT INTO `rainlab_user_states` VALUES ('284', '116', 'Puducherry', 'PY');

-- ----------------------------
-- Table structure for romanov_flashmessage_settings
-- ----------------------------
DROP TABLE IF EXISTS `romanov_flashmessage_settings`;
CREATE TABLE `romanov_flashmessage_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci NOT NULL,
  `settingsplacement` text COLLATE utf8_unicode_ci NOT NULL,
  `settingsoffset` text COLLATE utf8_unicode_ci NOT NULL,
  `settingsanimate` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `romanov_flashmessage_settings_title_unique` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of romanov_flashmessage_settings
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------

-- ----------------------------
-- Table structure for shahiemseymor_assigned_roles
-- ----------------------------
DROP TABLE IF EXISTS `shahiemseymor_assigned_roles`;
CREATE TABLE `shahiemseymor_assigned_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shahiemseymor_assigned_roles
-- ----------------------------

-- ----------------------------
-- Table structure for shahiemseymor_permissions
-- ----------------------------
DROP TABLE IF EXISTS `shahiemseymor_permissions`;
CREATE TABLE `shahiemseymor_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shahiemseymor_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for shahiemseymor_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `shahiemseymor_permission_role`;
CREATE TABLE `shahiemseymor_permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shahiemseymor_permission_role
-- ----------------------------

-- ----------------------------
-- Table structure for shahiemseymor_roles
-- ----------------------------
DROP TABLE IF EXISTS `shahiemseymor_roles`;
CREATE TABLE `shahiemseymor_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `default_group` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shahiemseymor_roles_name_unique` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shahiemseymor_roles
-- ----------------------------

-- ----------------------------
-- Table structure for system_event_logs
-- ----------------------------
DROP TABLE IF EXISTS `system_event_logs`;
CREATE TABLE `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_event_logs
-- ----------------------------
INSERT INTO `system_event_logs` VALUES ('1', 'error', 'exception \'ErrorException\' with message \'Trying to get property of non-object\' in C:\\Users\\John\\Desktop\\october\\storage\\cms\\cache\\83\\70\\post.htm.php:6\nStack trace:\n#0 C:\\Users\\John\\Desktop\\october\\storage\\cms\\cache\\83\\70\\post.htm.php(6): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'C:\\\\Users\\\\John\\\\D...\', 6, Array)\n#1 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\Controller.php(433): Cms55407b7a74abd_12271571Class->onEnd()\n#2 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\Controller.php(350): Cms\\Classes\\Controller->execPageCycle()\n#3 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\Controller.php(208): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\CmsController.php(47): Cms\\Classes\\Controller->run(\'blog/post/aa\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'blog/post/aa\')\n#6 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(246): call_user_func_array(Array, Array)\n#7 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(162): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(107): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(108): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#15 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(204): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#16 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(701): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(703): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(670): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(628): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(214): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(55): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(61): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(40): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(42): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#40 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(115): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#41 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(84): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#42 C:\\Users\\John\\Desktop\\october\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#43 {main}', null, '2015-04-29 06:34:37', '2015-04-29 06:34:37');
INSERT INTO `system_event_logs` VALUES ('2', 'error', 'exception \'ErrorException\' with message \'Trying to get property of non-object\' in C:\\Users\\John\\Desktop\\october\\storage\\cms\\cache\\83\\70\\post.htm.php:6\nStack trace:\n#0 C:\\Users\\John\\Desktop\\october\\storage\\cms\\cache\\83\\70\\post.htm.php(6): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'C:\\\\Users\\\\John\\\\D...\', 6, Array)\n#1 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\Controller.php(433): Cms55407b7a74abd_12271571Class->onEnd()\n#2 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\Controller.php(350): Cms\\Classes\\Controller->execPageCycle()\n#3 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\Controller.php(208): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\CmsController.php(47): Cms\\Classes\\Controller->run(\'blog/post/aa\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'blog/post/aa\')\n#6 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(246): call_user_func_array(Array, Array)\n#7 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(162): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(107): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(108): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#15 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(204): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#16 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(701): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(703): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(670): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(628): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(214): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(55): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(61): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(40): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(42): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#40 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(115): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#41 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(84): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#42 C:\\Users\\John\\Desktop\\october\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#43 {main}', null, '2015-04-29 06:34:52', '2015-04-29 06:34:52');
INSERT INTO `system_event_logs` VALUES ('3', 'error', 'exception \'ErrorException\' with message \'Trying to get property of non-object\' in C:\\Users\\John\\Desktop\\october\\storage\\cms\\cache\\83\\70\\post.htm.php:6\nStack trace:\n#0 C:\\Users\\John\\Desktop\\october\\storage\\cms\\cache\\83\\70\\post.htm.php(6): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'C:\\\\Users\\\\John\\\\D...\', 6, Array)\n#1 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\Controller.php(433): Cms55407b7a74abd_12271571Class->onEnd()\n#2 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\Controller.php(350): Cms\\Classes\\Controller->execPageCycle()\n#3 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\Controller.php(208): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 C:\\Users\\John\\Desktop\\october\\modules\\cms\\classes\\CmsController.php(47): Cms\\Classes\\Controller->run(\'blog/post/aa\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'blog/post/aa\')\n#6 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(246): call_user_func_array(Array, Array)\n#7 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(162): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(107): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(108): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#15 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(204): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#16 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(701): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(703): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(670): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(628): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(214): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(55): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(61): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(40): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(42): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(125): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(101): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#40 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(115): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#41 C:\\Users\\John\\Desktop\\october\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(84): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#42 C:\\Users\\John\\Desktop\\october\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#43 {main}', null, '2015-04-29 06:35:06', '2015-04-29 06:35:06');
INSERT INTO `system_event_logs` VALUES ('4', 'error', 'exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'Maximum execution time of 30 seconds exceeded\' in C:\\Users\\John\\Desktop\\october\\vendor\\october\\rain\\src\\Network\\Http.php:302\nStack trace:\n#0 {main}', null, '2015-04-29 07:20:26', '2015-04-29 07:20:26');

-- ----------------------------
-- Table structure for system_files
-- ----------------------------
DROP TABLE IF EXISTS `system_files`;
CREATE TABLE `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_files
-- ----------------------------
INSERT INTO `system_files` VALUES ('1', '554045a07034e826058574.jpg', 'disk.jpg', '154511', 'image/png', null, null, 'featured_images', '1', 'RainLab\\Blog\\Models\\Post', '1', '1', '2015-04-29 02:44:48', '2015-04-29 02:44:55');

-- ----------------------------
-- Table structure for system_mail_layouts
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_layouts`;
CREATE TABLE `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_mail_layouts
-- ----------------------------
INSERT INTO `system_mail_layouts` VALUES ('1', 'Default', 'default', '<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ message|raw }}\n    </body>\n</html>', '{{ message|raw }}', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', '1', '2015-04-29 02:22:33', '2015-04-29 02:22:33');
INSERT INTO `system_mail_layouts` VALUES ('2', 'System', 'system', '<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ message|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>', '{{ message|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', '1', '2015-04-29 02:22:33', '2015-04-29 02:22:33');

-- ----------------------------
-- Table structure for system_mail_templates
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_templates`;
CREATE TABLE `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_mail_templates
-- ----------------------------
INSERT INTO `system_mail_templates` VALUES ('1', 'backend::mail.invite', null, 'Invitation for newly created administrators.', null, null, '2', '0', '2015-04-29 02:46:28', '2015-04-29 02:46:28');
INSERT INTO `system_mail_templates` VALUES ('2', 'backend::mail.restore', null, 'Password reset instructions for backend-end administrators.', null, null, '2', '0', '2015-04-29 02:46:28', '2015-04-29 02:46:28');
INSERT INTO `system_mail_templates` VALUES ('3', 'rainlab.forum::mail.topic_reply', null, 'Notification to followers when a post is made to a topic.', null, null, '1', '0', '2015-04-29 02:46:28', '2015-04-29 02:46:28');
INSERT INTO `system_mail_templates` VALUES ('4', 'rainlab.forum::mail.member_report', null, 'Notification to moderators when a member is reported to be a spammer.', null, null, '1', '0', '2015-04-29 02:46:28', '2015-04-29 02:46:28');
INSERT INTO `system_mail_templates` VALUES ('5', 'rainlab.user::mail.activate', null, 'Activation email sent to new users.', null, null, '1', '0', '2015-04-29 02:46:28', '2015-04-29 02:46:28');
INSERT INTO `system_mail_templates` VALUES ('6', 'rainlab.user::mail.welcome', null, 'Welcome email sent when a user is activated.', null, null, '1', '0', '2015-04-29 02:46:28', '2015-04-29 02:46:28');
INSERT INTO `system_mail_templates` VALUES ('7', 'rainlab.user::mail.restore', null, 'Password reset instructions for front-end users.', null, null, '1', '0', '2015-04-29 02:46:28', '2015-04-29 02:46:28');
INSERT INTO `system_mail_templates` VALUES ('8', 'rainlab.user::mail.new_user', null, 'Sent to administrators when a new user joins.', null, null, '2', '0', '2015-04-29 02:46:28', '2015-04-29 02:46:28');

-- ----------------------------
-- Table structure for system_parameters
-- ----------------------------
DROP TABLE IF EXISTS `system_parameters`;
CREATE TABLE `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_parameters
-- ----------------------------
INSERT INTO `system_parameters` VALUES ('1', 'system', 'update', 'count', '0');
INSERT INTO `system_parameters` VALUES ('2', 'system', 'core', 'hash', '\"c51705bf39d979200cf605bcb9156c6f\"');
INSERT INTO `system_parameters` VALUES ('3', 'system', 'core', 'build', '\"251\"');
INSERT INTO `system_parameters` VALUES ('4', 'cms', 'theme', 'active', '\"responsiv-flat\"');
INSERT INTO `system_parameters` VALUES ('5', 'system', 'update', 'retry', '1430376396');

-- ----------------------------
-- Table structure for system_plugin_history
-- ----------------------------
DROP TABLE IF EXISTS `system_plugin_history`;
CREATE TABLE `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_plugin_history
-- ----------------------------
INSERT INTO `system_plugin_history` VALUES ('1', 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2015-04-29 02:22:00');
INSERT INTO `system_plugin_history` VALUES ('2', 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2015-04-29 02:22:01');
INSERT INTO `system_plugin_history` VALUES ('3', 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2015-04-29 02:22:01');
INSERT INTO `system_plugin_history` VALUES ('4', 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2015-04-29 02:22:01');
INSERT INTO `system_plugin_history` VALUES ('5', 'RainLab.Blog', 'script', '1.0.2', 'create_posts_content_html.php', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('6', 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('7', 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('8', 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('9', 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('10', 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('11', 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('12', 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('13', 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('14', 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('15', 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate \"idParam\" component property in favour of \"slug\" property.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('16', 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('17', 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2015-04-29 02:22:02');
INSERT INTO `system_plugin_history` VALUES ('18', 'RainLab.User', 'script', '1.0.1', 'create_users_table.php', '2015-04-29 02:22:04');
INSERT INTO `system_plugin_history` VALUES ('19', 'RainLab.User', 'script', '1.0.1', 'create_throttle_table.php', '2015-04-29 02:22:05');
INSERT INTO `system_plugin_history` VALUES ('20', 'RainLab.User', 'script', '1.0.1', 'create_states_table.php', '2015-04-29 02:22:06');
INSERT INTO `system_plugin_history` VALUES ('21', 'RainLab.User', 'script', '1.0.1', 'create_countries_table.php', '2015-04-29 02:22:06');
INSERT INTO `system_plugin_history` VALUES ('22', 'RainLab.User', 'comment', '1.0.1', 'Initialize plugin.', '2015-04-29 02:22:06');
INSERT INTO `system_plugin_history` VALUES ('23', 'RainLab.User', 'script', '1.0.2', 'seed_all_tables.php', '2015-04-29 02:22:17');
INSERT INTO `system_plugin_history` VALUES ('24', 'RainLab.User', 'comment', '1.0.2', 'Add seed data for countries and states.', '2015-04-29 02:22:17');
INSERT INTO `system_plugin_history` VALUES ('25', 'RainLab.User', 'comment', '1.0.3', 'Translated hard-coded text to language strings.', '2015-04-29 02:22:17');
INSERT INTO `system_plugin_history` VALUES ('26', 'RainLab.User', 'comment', '1.0.4', 'Improvements to user-interface for Location manager.', '2015-04-29 02:22:17');
INSERT INTO `system_plugin_history` VALUES ('27', 'RainLab.User', 'script', '1.0.5', 'users_add_contact_details.php', '2015-04-29 02:22:17');
INSERT INTO `system_plugin_history` VALUES ('28', 'RainLab.User', 'comment', '1.0.5', 'Added contact details for users.', '2015-04-29 02:22:17');
INSERT INTO `system_plugin_history` VALUES ('29', 'RainLab.User', 'script', '1.0.6', 'create_mail_blockers_table.php', '2015-04-29 02:22:18');
INSERT INTO `system_plugin_history` VALUES ('30', 'RainLab.User', 'comment', '1.0.6', 'Added Mail Blocker utility so users can block specific mail templates.', '2015-04-29 02:22:18');
INSERT INTO `system_plugin_history` VALUES ('31', 'RainLab.User', 'comment', '1.0.7', 'Adds default country and state fields to Settings page.', '2015-04-29 02:22:18');
INSERT INTO `system_plugin_history` VALUES ('32', 'RainLab.User', 'comment', '1.0.8', 'Updated the Settings page.', '2015-04-29 02:22:18');
INSERT INTO `system_plugin_history` VALUES ('33', 'RainLab.User', 'comment', '1.0.9', 'Adds new welcome mail message for users and administrators.', '2015-04-29 02:22:18');
INSERT INTO `system_plugin_history` VALUES ('34', 'RainLab.User', 'comment', '1.0.10', 'Adds administrator-only activation mode.', '2015-04-29 02:22:18');
INSERT INTO `system_plugin_history` VALUES ('35', 'RainLab.User', 'script', '1.0.11', 'users_add_login_column.php', '2015-04-29 02:22:19');
INSERT INTO `system_plugin_history` VALUES ('36', 'RainLab.User', 'comment', '1.0.11', 'Users now have an optional login field that defaults to the email field.', '2015-04-29 02:22:19');
INSERT INTO `system_plugin_history` VALUES ('37', 'RainLab.User', 'script', '1.0.12', 'users_rename_login_to_username.php', '2015-04-29 02:22:20');
INSERT INTO `system_plugin_history` VALUES ('38', 'RainLab.User', 'comment', '1.0.12', 'Create a dedicated setting for choosing the login mode.', '2015-04-29 02:22:20');
INSERT INTO `system_plugin_history` VALUES ('39', 'RainLab.User', 'comment', '1.0.13', 'Minor fix to the Account sign in logic.', '2015-04-29 02:22:20');
INSERT INTO `system_plugin_history` VALUES ('40', 'RainLab.User', 'comment', '1.0.14', 'Minor improvements to the code.', '2015-04-29 02:22:20');
INSERT INTO `system_plugin_history` VALUES ('41', 'RainLab.User', 'script', '1.0.15', 'users_add_surname.php', '2015-04-29 02:22:20');
INSERT INTO `system_plugin_history` VALUES ('42', 'RainLab.User', 'comment', '1.0.15', 'Adds last name column to users table (surname).', '2015-04-29 02:22:20');
INSERT INTO `system_plugin_history` VALUES ('43', 'RainLab.User', 'comment', '1.0.16', 'Require permissions for settings page too.', '2015-04-29 02:22:20');
INSERT INTO `system_plugin_history` VALUES ('44', 'RainLab.Forum', 'script', '1.0.1', 'create_channels_table.php', '2015-04-29 02:22:21');
INSERT INTO `system_plugin_history` VALUES ('45', 'RainLab.Forum', 'script', '1.0.1', 'create_posts_table.php', '2015-04-29 02:22:22');
INSERT INTO `system_plugin_history` VALUES ('46', 'RainLab.Forum', 'script', '1.0.1', 'create_topics_table.php', '2015-04-29 02:22:24');
INSERT INTO `system_plugin_history` VALUES ('47', 'RainLab.Forum', 'script', '1.0.1', 'create_members_table.php', '2015-04-29 02:22:26');
INSERT INTO `system_plugin_history` VALUES ('48', 'RainLab.Forum', 'script', '1.0.1', 'seed_all_tables.php', '2015-04-29 02:22:27');
INSERT INTO `system_plugin_history` VALUES ('49', 'RainLab.Forum', 'comment', '1.0.1', 'First version of Forum', '2015-04-29 02:22:27');
INSERT INTO `system_plugin_history` VALUES ('50', 'RainLab.Forum', 'script', '1.0.2', 'create_topic_watches_table.php', '2015-04-29 02:22:28');
INSERT INTO `system_plugin_history` VALUES ('51', 'RainLab.Forum', 'comment', '1.0.2', 'Add unread flags to topics', '2015-04-29 02:22:28');
INSERT INTO `system_plugin_history` VALUES ('52', 'RainLab.Forum', 'script', '1.0.3', 'members_add_mod_and_ban.php', '2015-04-29 02:22:28');
INSERT INTO `system_plugin_history` VALUES ('53', 'RainLab.Forum', 'comment', '1.0.3', 'Users can now be made moderators or be banned', '2015-04-29 02:22:28');
INSERT INTO `system_plugin_history` VALUES ('54', 'RainLab.Forum', 'script', '1.0.4', 'channels_add_hidden_and_moderated.php', '2015-04-29 02:22:29');
INSERT INTO `system_plugin_history` VALUES ('55', 'RainLab.Forum', 'comment', '1.0.4', 'Channels can now be hidden or moderated', '2015-04-29 02:22:29');
INSERT INTO `system_plugin_history` VALUES ('56', 'RainLab.Forum', 'script', '1.0.5', 'add_embed_code.php', '2015-04-29 02:22:30');
INSERT INTO `system_plugin_history` VALUES ('57', 'RainLab.Forum', 'comment', '1.0.5', 'Introduced topic and channel embedding', '2015-04-29 02:22:30');
INSERT INTO `system_plugin_history` VALUES ('58', 'RainLab.Forum', 'script', '1.0.6', 'create_channel_watches_table.php', '2015-04-29 02:22:31');
INSERT INTO `system_plugin_history` VALUES ('59', 'RainLab.Forum', 'comment', '1.0.6', 'Add unread flags to channels', '2015-04-29 02:22:31');
INSERT INTO `system_plugin_history` VALUES ('60', 'RainLab.Forum', 'script', '1.0.7', 'create_topic_followers_table.php', '2015-04-29 02:22:32');
INSERT INTO `system_plugin_history` VALUES ('61', 'RainLab.Forum', 'comment', '1.0.7', 'Forum members can now follow topics', '2015-04-29 02:22:32');
INSERT INTO `system_plugin_history` VALUES ('62', 'RainLab.Forum', 'comment', '1.0.8', 'Added Channel name to the Topics component view', '2015-04-29 02:22:32');
INSERT INTO `system_plugin_history` VALUES ('63', 'RainLab.Forum', 'comment', '1.0.9', 'Updated the Settings page', '2015-04-29 02:22:32');
INSERT INTO `system_plugin_history` VALUES ('64', 'RainLab.Forum', 'comment', '1.0.10', 'Users can now report spammers who can be banned by moderators.', '2015-04-29 02:22:32');
INSERT INTO `system_plugin_history` VALUES ('65', 'RainLab.Forum', 'comment', '1.0.11', 'Users can now quote other posts.', '2015-04-29 02:22:32');
INSERT INTO `system_plugin_history` VALUES ('66', 'RainLab.Forum', 'comment', '1.0.12', 'Improve support for CDN asset hosting.', '2015-04-29 02:22:32');
INSERT INTO `system_plugin_history` VALUES ('67', 'RainLab.Forum', 'comment', '1.0.13', 'Fixes a bug where channels cannot be selected in the Embed component inspector.', '2015-04-29 02:22:32');
INSERT INTO `system_plugin_history` VALUES ('68', 'Mohsin.Carousel', 'script', '1.0.1', 'Create Carousels Table', '2015-04-29 06:57:45');
INSERT INTO `system_plugin_history` VALUES ('69', 'Mohsin.Carousel', 'script', '1.0.1', 'create_carousels_table.php', '2015-04-29 06:57:46');
INSERT INTO `system_plugin_history` VALUES ('70', 'Mohsin.Carousel', 'comment', '1.0.1', 'First version of Carousel', '2015-04-29 06:57:46');
INSERT INTO `system_plugin_history` VALUES ('71', 'Mohsin.Carousel', 'comment', '1.0.2', 'Improved HTML semantics and language support.', '2015-04-29 06:57:46');
INSERT INTO `system_plugin_history` VALUES ('72', 'Romanov.Flashmessage', 'script', '1.0.1', 'Run table migrations', '2015-04-29 07:03:22');
INSERT INTO `system_plugin_history` VALUES ('73', 'Romanov.Flashmessage', 'script', '1.0.1', 'create_settings_table.php', '2015-04-29 07:03:23');
INSERT INTO `system_plugin_history` VALUES ('74', 'Romanov.Flashmessage', 'comment', '1.0.1', 'First version of flashmessage', '2015-04-29 07:03:23');
INSERT INTO `system_plugin_history` VALUES ('75', 'Romanov.ClearCacheWidget', 'comment', '1.0.1', 'First version of ClearCacheWidget', '2015-04-29 07:03:49');
INSERT INTO `system_plugin_history` VALUES ('76', 'Romanov.ClearCacheWidget', 'comment', '1.0.2', 'Translate for brazilian portuguese', '2015-04-29 07:03:49');
INSERT INTO `system_plugin_history` VALUES ('77', 'Romanov.ClearCacheWidget', 'comment', '1.0.3', 'Some fix', '2015-04-29 07:03:49');
INSERT INTO `system_plugin_history` VALUES ('78', 'Romanov.ClearCacheWidget', 'comment', '1.0.4', 'Fix chart', '2015-04-29 07:03:49');
INSERT INTO `system_plugin_history` VALUES ('79', 'Indikator.Qedit', 'comment', '1.0.0', 'First version of Quick Edit.', '2015-04-29 07:04:06');
INSERT INTO `system_plugin_history` VALUES ('80', 'Indikator.Qedit', 'comment', '1.0.1', 'Support CMS contents.', '2015-04-29 07:04:06');
INSERT INTO `system_plugin_history` VALUES ('81', 'Indikator.Qedit', 'comment', '1.0.2', 'Fixed minor issue.', '2015-04-29 07:04:06');
INSERT INTO `system_plugin_history` VALUES ('82', 'Indikator.Qedit', 'comment', '1.0.3', 'Works with all themes.', '2015-04-29 07:04:07');
INSERT INTO `system_plugin_history` VALUES ('83', 'Indikator.Qedit', 'comment', '1.0.4', 'Fixed the blank theme issue.', '2015-04-29 07:04:07');
INSERT INTO `system_plugin_history` VALUES ('84', 'Indikator.Qedit', 'comment', '1.0.5', 'Improved the Rich editor.', '2015-04-29 07:04:07');
INSERT INTO `system_plugin_history` VALUES ('85', 'Indikator.Qedit', 'comment', '1.1.0', 'Support partials and layouts.', '2015-04-29 07:04:07');
INSERT INTO `system_plugin_history` VALUES ('86', 'Indikator.Qedit', 'comment', '1.1.1', 'Changed the size of Rich Editor.', '2015-04-29 07:04:07');
INSERT INTO `system_plugin_history` VALUES ('87', 'Indikator.Qedit', 'comment', '1.1.2', 'Minor changes.', '2015-04-29 07:04:07');
INSERT INTO `system_plugin_history` VALUES ('88', 'RainLab.Pages', 'comment', '1.0.1', 'Implemented the static pages management and the Static Page component.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('89', 'RainLab.Pages', 'comment', '1.0.2', 'Fixed the page preview URL.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('90', 'RainLab.Pages', 'comment', '1.0.3', 'Implemented menus.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('91', 'RainLab.Pages', 'comment', '1.0.4', 'Implemented the content block management and placeholder support.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('92', 'RainLab.Pages', 'comment', '1.0.5', 'Added support for the Sitemap plugin.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('93', 'RainLab.Pages', 'comment', '1.0.6', 'Minor updates to the internal API.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('94', 'RainLab.Pages', 'comment', '1.0.7', 'Added the Snippets feature.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('95', 'RainLab.Pages', 'comment', '1.0.8', 'Minor improvements to the code.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('96', 'RainLab.Pages', 'comment', '1.0.9', 'Fixes issue where Snippet tab is missing from the Partials form.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('97', 'RainLab.Pages', 'comment', '1.0.10', 'Add translations for various locales.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('98', 'RainLab.Pages', 'comment', '1.0.11', 'Fixes issue where placeholders tabs were missing from Page form.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('99', 'RainLab.Pages', 'comment', '1.0.12', 'Implement Media Manager support.', '2015-04-29 07:05:32');
INSERT INTO `system_plugin_history` VALUES ('100', 'ShahiemSeymor.Roles', 'script', '1.0.1', 'create_table.php', '2015-04-29 07:06:12');
INSERT INTO `system_plugin_history` VALUES ('101', 'ShahiemSeymor.Roles', 'comment', '1.0.1', 'First version', '2015-04-29 07:06:12');
INSERT INTO `system_plugin_history` VALUES ('102', 'ShahiemSeymor.Roles', 'comment', '1.0.2', 'Renamed New Role to New Group', '2015-04-29 07:06:12');
INSERT INTO `system_plugin_history` VALUES ('103', 'ShahiemSeymor.Roles', 'comment', '1.0.3', 'Bug fixes (Auth check) Added Delete buttons Permissions on Role List view Removed sidebar', '2015-04-29 07:06:12');
INSERT INTO `system_plugin_history` VALUES ('104', 'ShahiemSeymor.Roles', 'comment', '1.0.4', 'Bug fixed, user permission method can handle arrays (see documentation)', '2015-04-29 07:06:12');
INSERT INTO `system_plugin_history` VALUES ('105', 'ShahiemSeymor.Roles', 'script', '1.0.5', 'add_default_and_description.php', '2015-04-29 07:06:12');
INSERT INTO `system_plugin_history` VALUES ('106', 'ShahiemSeymor.Roles', 'script', '1.0.5', 'add_dates.php', '2015-04-29 07:06:12');
INSERT INTO `system_plugin_history` VALUES ('107', 'ShahiemSeymor.Roles', 'comment', '1.0.5', 'Added default group checkbox (roles) and description field', '2015-04-29 07:06:12');
INSERT INTO `system_plugin_history` VALUES ('108', 'ShahiemSeymor.Roles', 'comment', '1.0.6', 'Fixed permission bug & Assign users in default groups', '2015-04-29 07:06:13');
INSERT INTO `system_plugin_history` VALUES ('109', 'ShahiemSeymor.Roles', 'comment', '1.0.7', 'Update for RC', '2015-04-29 07:06:13');
INSERT INTO `system_plugin_history` VALUES ('110', 'ShahiemSeymor.Roles', 'comment', '1.0.8', 'Update for RC(2)', '2015-04-29 07:06:13');
INSERT INTO `system_plugin_history` VALUES ('111', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.1', 'First version', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('112', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.2', 'New skin (Thanks Flynsarmy)', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('113', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.3', 'Add setting to automatically apply to cms (Thanks Flynsarmy)', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('114', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.4', 'Added file browser (Upload care), Added setting field for public key', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('115', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.5', 'Error fixed by content and added skin.js file', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('116', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.6', 'Added filebrowser (see documentation), Added new setting option for content entries, code cleanup', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('117', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.7', 'Deleted Uploadcare plugin, changed settings page (skin, editor width and height, toolbar), added save hotkey', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('118', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.8', 'Bug fixed, added editor language support', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('119', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.9', 'Added Youtube plugin, Added ProEvents, ProBlog and Rainlab Static Pages to the settings page, CKeditor updated, code cleanup', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('120', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.10', 'Code cleanup, added thank you message, security fix elfinder', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('121', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.11', 'Update for RC', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('122', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.12', 'Update for RC(2)', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('123', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.13', 'Added component for Editable plugin. See documentation', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('124', 'ShahiemSeymor.Ckeditor', 'comment', '1.0.14', 'Elfinder is replaced for OctoberCMS Media Manger. (Only images for now)', '2015-04-29 07:14:46');
INSERT INTO `system_plugin_history` VALUES ('125', 'Indikator.Backend', 'comment', '1.0.0', 'First version of Backend Plus.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('126', 'Indikator.Backend', 'comment', '1.0.1', 'Fixed the update count issue.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('127', 'Indikator.Backend', 'comment', '1.0.2', 'Added Last logins widget.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('128', 'Indikator.Backend', 'comment', '1.0.3', 'Added RSS viewer widget.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('129', 'Indikator.Backend', 'comment', '1.0.4', 'Minor improvements and bugfix.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('130', 'Indikator.Backend', 'comment', '1.0.5', 'Added Random images widget.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('131', 'Indikator.Backend', 'comment', '1.0.6', 'Added virtual keyboard option.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('132', 'Indikator.Backend', 'script', '1.1.0', 'Improving the Random images widget with slideshow.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('133', 'Indikator.Backend', 'script', '1.1.0', 'Added Turkish translation (thanks to mahony0).', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('134', 'Indikator.Backend', 'script', '1.1.0', 'Fixed the URL path issue by virtual keyboard.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('135', 'Indikator.Backend', 'comment', '1.1.0', 'Added Lorem ipsum components (image and text).', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('136', 'Indikator.Backend', 'comment', '1.1.1', 'Hide the \"Find more themes...\" link.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('137', 'Indikator.Backend', 'comment', '1.1.2', 'Added German language.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('138', 'Indikator.Backend', 'comment', '1.1.3', 'The widgets work on localhost too.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('139', 'Indikator.Backend', 'comment', '1.1.4', 'Added Spanish language.', '2015-04-29 07:15:11');
INSERT INTO `system_plugin_history` VALUES ('140', 'BenFreke.MenuManager', 'script', '1.0.1', 'create_menus_table.php', '2015-04-29 07:16:51');
INSERT INTO `system_plugin_history` VALUES ('141', 'BenFreke.MenuManager', 'comment', '1.0.1', 'First version of MenuManager', '2015-04-29 07:16:51');
INSERT INTO `system_plugin_history` VALUES ('142', 'BenFreke.MenuManager', 'comment', '1.0.2', 'Added active state to menu; Added ability to select active menu item; Added controllable depth to component', '2015-04-29 07:16:51');
INSERT INTO `system_plugin_history` VALUES ('143', 'BenFreke.MenuManager', 'comment', '1.0.3', 'Made it possible for menu items to not link anywhere; Put a check in so the active node must be a child of the parentNode', '2015-04-29 07:16:51');
INSERT INTO `system_plugin_history` VALUES ('144', 'BenFreke.MenuManager', 'comment', '1.0.4', 'Fixed bug where re-ordering stopped working', '2015-04-29 07:16:51');
INSERT INTO `system_plugin_history` VALUES ('145', 'BenFreke.MenuManager', 'comment', '1.0.5', 'Moved link creation code into the model in preparation for external links; Brought list item class creation into the model; Fixed typo with default menu class', '2015-04-29 07:16:51');
INSERT INTO `system_plugin_history` VALUES ('146', 'BenFreke.MenuManager', 'comment', '1.0.6', 'Removed NestedSetModel, thanks @daftspunk', '2015-04-29 07:16:51');
INSERT INTO `system_plugin_history` VALUES ('147', 'BenFreke.MenuManager', 'script', '1.1.0', 'add_is_external_field.php', '2015-04-29 07:16:51');
INSERT INTO `system_plugin_history` VALUES ('148', 'BenFreke.MenuManager', 'script', '1.1.0', 'add_link_target_field.php', '2015-04-29 07:16:51');
INSERT INTO `system_plugin_history` VALUES ('149', 'BenFreke.MenuManager', 'comment', '1.1.0', 'Added ability to link to external sites. Thanks @adisos', '2015-04-29 07:16:51');
INSERT INTO `system_plugin_history` VALUES ('150', 'BenFreke.MenuManager', 'script', '1.1.1', 'add_enabled_parameters_query_fields.php', '2015-04-29 07:16:52');
INSERT INTO `system_plugin_history` VALUES ('151', 'BenFreke.MenuManager', 'comment', '1.1.1', 'Added ability to enable/disable individual menu links; Added ability for url parameters & query string; Fixed issue of \"getLinkHref()\" pulling through full page url with parameters rather than the ACTUAL page url', '2015-04-29 07:16:52');
INSERT INTO `system_plugin_history` VALUES ('152', 'BenFreke.MenuManager', 'comment', '1.1.2', 'Reformatted code for better maintainability and better practises', '2015-04-29 07:16:52');
INSERT INTO `system_plugin_history` VALUES ('153', 'BenFreke.MenuManager', 'comment', '1.1.3', 'Fixed bug that prevented multiple components displaying', '2015-04-29 07:16:52');
INSERT INTO `system_plugin_history` VALUES ('154', 'BenFreke.MenuManager', 'comment', '1.2.0', 'Fixed validation and fields bug; Added list classes', '2015-04-29 07:16:52');
INSERT INTO `system_plugin_history` VALUES ('155', 'BenFreke.MenuManager', 'comment', '1.3.0', 'Added translation ability thanks to @alxy', '2015-04-29 07:16:52');
INSERT INTO `system_plugin_history` VALUES ('156', 'BenFreke.MenuManager', 'comment', '1.3.1', 'JSON validation of parameters added; Correct active menu now being set based on parameters; PR sent by @whsol, thanks!', '2015-04-29 07:16:52');
INSERT INTO `system_plugin_history` VALUES ('157', 'BenFreke.MenuManager', 'comment', '1.3.2', 'Fix for param check that is breaking active node lookup. Thanks @alxy', '2015-04-29 07:16:52');
INSERT INTO `system_plugin_history` VALUES ('158', 'BenFreke.MenuManager', 'comment', '1.3.3', 'Fix for JSON comment having single quotes. Thanks @adisos', '2015-04-29 07:16:53');
INSERT INTO `system_plugin_history` VALUES ('159', 'BenFreke.MenuManager', 'comment', '1.3.4', 'Fix for JSON validation not firing', '2015-04-29 07:16:53');
INSERT INTO `system_plugin_history` VALUES ('160', 'BenFreke.MenuManager', 'script', '1.4.0', 'fix_menu_table.php', '2015-04-29 07:16:53');
INSERT INTO `system_plugin_history` VALUES ('161', 'BenFreke.MenuManager', 'comment', '1.4.0', 'Fix for POST operations. PR by @matissjanis, TR translations (@mahony0) and permission registration (@nnmer)', '2015-04-29 07:16:53');
INSERT INTO `system_plugin_history` VALUES ('162', 'BenFreke.MenuManager', 'comment', '1.4.1', 'Fixed bug caused by deleting needed method of Menu class. Thanks @MatissJA', '2015-04-29 07:16:53');

-- ----------------------------
-- Table structure for system_plugin_versions
-- ----------------------------
DROP TABLE IF EXISTS `system_plugin_versions`;
CREATE TABLE `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_plugin_versions
-- ----------------------------
INSERT INTO `system_plugin_versions` VALUES ('1', 'RainLab.Blog', '1.0.13', '2015-04-29 02:22:02', '0');
INSERT INTO `system_plugin_versions` VALUES ('2', 'RainLab.User', '1.0.16', '2015-04-29 02:22:20', '0');
INSERT INTO `system_plugin_versions` VALUES ('3', 'RainLab.Forum', '1.0.13', '2015-04-29 02:22:32', '0');
INSERT INTO `system_plugin_versions` VALUES ('4', 'Mohsin.Carousel', '1.0.2', '2015-04-29 06:57:46', '0');
INSERT INTO `system_plugin_versions` VALUES ('5', 'Romanov.Flashmessage', '1.0.1', '2015-04-29 07:03:23', '0');
INSERT INTO `system_plugin_versions` VALUES ('6', 'Romanov.ClearCacheWidget', '1.0.4', '2015-04-29 07:03:49', '0');
INSERT INTO `system_plugin_versions` VALUES ('7', 'Indikator.Qedit', '1.1.2', '2015-04-29 07:04:07', '0');
INSERT INTO `system_plugin_versions` VALUES ('8', 'RainLab.Pages', '1.0.12', '2015-04-29 07:05:32', '0');
INSERT INTO `system_plugin_versions` VALUES ('9', 'ShahiemSeymor.Roles', '1.0.8', '2015-04-29 07:06:13', '0');
INSERT INTO `system_plugin_versions` VALUES ('10', 'ShahiemSeymor.Ckeditor', '1.0.14', '2015-04-29 07:14:47', '0');
INSERT INTO `system_plugin_versions` VALUES ('11', 'Indikator.Backend', '1.1.4', '2015-04-29 07:15:11', '0');
INSERT INTO `system_plugin_versions` VALUES ('12', 'BenFreke.MenuManager', '1.4.1', '2015-04-29 07:16:53', '0');

-- ----------------------------
-- Table structure for system_request_logs
-- ----------------------------
DROP TABLE IF EXISTS `system_request_logs`;
CREATE TABLE `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_request_logs
-- ----------------------------
INSERT INTO `system_request_logs` VALUES ('1', '404', 'http://localhost/themes/responsiv-flat/assets/images/switch/mask.png', '[\"http:\\/\\/localhost\\/combine\\/8b22ba79bf9cc734dd546778626b6e7b-1430274102\"]', '1', '2015-04-29 02:27:29', '2015-04-29 02:27:29');
INSERT INTO `system_request_logs` VALUES ('2', '404', 'http://localhost/backend/rainlab/blog/posts/aa', '[\"http:\\/\\/localhost\\/backend\\/rainlab\\/blog\\/posts\\/create\"]', '1', '2015-04-29 02:42:38', '2015-04-29 02:42:38');
INSERT INTO `system_request_logs` VALUES ('3', '404', 'http://localhost/account', '[\"http:\\/\\/localhost\\/forum\"]', '1', '2015-04-29 06:35:59', '2015-04-29 06:35:59');
INSERT INTO `system_request_logs` VALUES ('4', '404', 'http://localhost/server.php', null, '2', '2015-04-29 06:39:26', '2015-04-29 06:39:38');
INSERT INTO `system_request_logs` VALUES ('5', '404', 'http://localhost/test.php', null, '1', '2015-04-29 07:22:33', '2015-04-29 07:22:33');
INSERT INTO `system_request_logs` VALUES ('6', '404', 'http://localhost/test', null, '2', '2015-04-29 07:22:37', '2015-04-29 07:22:42');
INSERT INTO `system_request_logs` VALUES ('7', '404', 'http://localhost/pages/test', null, '2', '2015-04-29 07:22:58', '2015-04-29 07:25:25');
INSERT INTO `system_request_logs` VALUES ('8', '404', 'http://localhost/favicon.ico', null, '1', '2015-04-29 07:41:14', '2015-04-29 07:41:14');

-- ----------------------------
-- Table structure for system_settings
-- ----------------------------
DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_settings
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primary_usergroup` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_login_unique` (`username`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`),
  KEY `users_country_id_index` (`country_id`),
  KEY `users_state_id_index` (`state_id`),
  KEY `users_login_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'zero', 'wangsong1233276@sina.com', '$2y$10$LGr6jkU4DE5eDHq9zVfij.OgKHvp0fn/PIuK/d3/y.jB9XHWpUkge', null, '$2y$10$7Fgelcyggro07Is3jHXil.zjP1ZRR6v59xXz/wD5EvSwMYOo6H6fe', null, null, '1', '2015-04-29 02:33:03', '2015-04-29 06:34:14', null, null, '2015-04-29 02:32:53', '2015-04-29 06:34:14', '', '', '', '', '', 'wangsong1233276@sina.com', 'zero', '0');

-- ----------------------------
-- Table structure for user_throttle
-- ----------------------------
DROP TABLE IF EXISTS `user_throttle`;
CREATE TABLE `user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_throttle_user_id_index` (`user_id`),
  KEY `user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_throttle
-- ----------------------------
INSERT INTO `user_throttle` VALUES ('1', '1', '::1', '0', null, '0', null, '0', null);
