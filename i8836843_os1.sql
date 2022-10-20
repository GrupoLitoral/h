-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-10-2022 a las 15:43:25
-- Versión del servidor: 5.7.39-cll-lve
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `i8836843_os1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_api_key`
--

CREATE TABLE `ost_api_key` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_attachment`
--

CREATE TABLE `ost_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inline` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_attachment`
--

INSERT INTO `ost_attachment` (`id`, `object_id`, `type`, `file_id`, `name`, `inline`, `lang`) VALUES
(1, 1, 'C', 2, NULL, 0, NULL),
(2, 8, 'T', 1, NULL, 1, NULL),
(3, 9, 'T', 1, NULL, 1, NULL),
(4, 10, 'T', 1, NULL, 1, NULL),
(5, 11, 'T', 1, NULL, 1, NULL),
(6, 12, 'T', 1, NULL, 1, NULL),
(7, 13, 'T', 1, NULL, 1, NULL),
(8, 14, 'T', 1, NULL, 1, NULL),
(9, 16, 'T', 1, NULL, 1, NULL),
(10, 17, 'T', 1, NULL, 1, NULL),
(11, 18, 'T', 1, NULL, 1, NULL),
(12, 19, 'T', 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_canned_response`
--

CREATE TABLE `ost_canned_response` (
  `canned_id` int(10) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_canned_response`
--

INSERT INTO `ost_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an\nattractive alternative to higher-cost and complex customer support\nsystems - simple, lightweight, reliable, open source, web-based and easy\nto setup and use.', 'en_US', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first},\n<br>\n<br>\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in\n%{ticket.dept.name} department.', 'en_US', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_config`
--

CREATE TABLE `ost_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_config`
--

INSERT INTO `ost_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'jorge1giron18@gmail.com', '2022-07-14 16:31:07'),
(2, 'core', 'helpdesk_url', 'http://127.0.0.1:8080/os-Ticket/', '2022-07-14 16:31:07'),
(3, 'core', 'helpdesk_title', 'GL-SOPORTE', '2022-07-15 16:40:10'),
(4, 'core', 'schema_signature', 'c37e165651dc289240fee7d244990ac1', '2022-07-14 16:31:07'),
(5, 'schedule.1', 'configuration', '{\"holidays\":[4]}', '2022-07-14 16:31:07'),
(6, 'core', 'time_format', 'hh:mm a', '2022-07-14 16:31:07'),
(7, 'core', 'date_format', 'MM/dd/y', '2022-07-14 16:31:07'),
(8, 'core', 'datetime_format', 'MM/dd/y h:mm a', '2022-07-14 16:31:07'),
(9, 'core', 'daydatetime_format', 'EEE, MMM d y h:mm a', '2022-07-14 16:31:07'),
(10, 'core', 'default_priority_id', '2', '2022-07-14 16:31:07'),
(11, 'core', 'enable_daylight_saving', '', '2022-07-14 16:31:07'),
(12, 'core', 'reply_separator', '-- reply above this line --', '2022-07-14 16:31:07'),
(13, 'core', 'isonline', '1', '2022-07-14 16:31:07'),
(14, 'core', 'staff_ip_binding', '', '2022-07-14 16:31:07'),
(15, 'core', 'staff_max_logins', '4', '2022-07-14 16:31:07'),
(16, 'core', 'staff_login_timeout', '2', '2022-07-14 16:31:07'),
(17, 'core', 'staff_session_timeout', '30', '2022-07-14 16:31:07'),
(18, 'core', 'passwd_reset_period', '', '2022-07-14 16:31:07'),
(19, 'core', 'client_max_logins', '4', '2022-07-14 16:31:07'),
(20, 'core', 'client_login_timeout', '2', '2022-07-14 16:31:07'),
(21, 'core', 'client_session_timeout', '30', '2022-07-14 16:31:07'),
(22, 'core', 'max_page_size', '25', '2022-07-14 16:31:07'),
(23, 'core', 'max_open_tickets', '', '2022-07-14 16:31:07'),
(24, 'core', 'autolock_minutes', '3', '2022-07-14 16:31:07'),
(25, 'core', 'default_smtp_id', '', '2022-07-14 16:31:07'),
(26, 'core', 'use_email_priority', '', '2022-07-14 16:31:07'),
(27, 'core', 'enable_kb', '', '2022-07-14 16:31:07'),
(28, 'core', 'enable_premade', '1', '2022-07-14 16:31:07'),
(29, 'core', 'enable_captcha', '', '2022-07-14 16:31:07'),
(30, 'core', 'enable_auto_cron', '', '2022-07-14 16:31:07'),
(31, 'core', 'enable_mail_polling', '', '2022-07-14 16:31:07'),
(32, 'core', 'send_sys_errors', '1', '2022-07-14 16:31:07'),
(33, 'core', 'send_sql_errors', '1', '2022-07-14 16:31:07'),
(34, 'core', 'send_login_errors', '1', '2022-07-14 16:31:07'),
(35, 'core', 'save_email_headers', '1', '2022-07-14 16:31:07'),
(36, 'core', 'strip_quoted_reply', '1', '2022-07-14 16:31:07'),
(37, 'core', 'ticket_autoresponder', '', '2022-07-14 16:31:07'),
(38, 'core', 'message_autoresponder', '', '2022-07-14 16:31:07'),
(39, 'core', 'ticket_notice_active', '1', '2022-07-14 16:31:07'),
(40, 'core', 'ticket_alert_active', '1', '2022-07-14 16:31:07'),
(41, 'core', 'ticket_alert_admin', '1', '2022-07-14 16:31:07'),
(42, 'core', 'ticket_alert_dept_manager', '1', '2022-07-14 16:31:07'),
(43, 'core', 'ticket_alert_dept_members', '', '2022-07-14 16:31:07'),
(44, 'core', 'message_alert_active', '1', '2022-07-14 16:31:07'),
(45, 'core', 'message_alert_laststaff', '1', '2022-07-14 16:31:07'),
(46, 'core', 'message_alert_assigned', '1', '2022-07-14 16:31:07'),
(47, 'core', 'message_alert_dept_manager', '', '2022-07-14 16:31:07'),
(48, 'core', 'note_alert_active', '', '2022-07-14 16:31:07'),
(49, 'core', 'note_alert_laststaff', '1', '2022-07-14 16:31:07'),
(50, 'core', 'note_alert_assigned', '1', '2022-07-14 16:31:07'),
(51, 'core', 'note_alert_dept_manager', '', '2022-07-14 16:31:07'),
(52, 'core', 'transfer_alert_active', '', '2022-07-14 16:31:07'),
(53, 'core', 'transfer_alert_assigned', '', '2022-07-14 16:31:07'),
(54, 'core', 'transfer_alert_dept_manager', '1', '2022-07-14 16:31:07'),
(55, 'core', 'transfer_alert_dept_members', '', '2022-07-14 16:31:07'),
(56, 'core', 'overdue_alert_active', '1', '2022-07-14 16:31:07'),
(57, 'core', 'overdue_alert_assigned', '1', '2022-07-14 16:31:07'),
(58, 'core', 'overdue_alert_dept_manager', '1', '2022-07-14 16:31:07'),
(59, 'core', 'overdue_alert_dept_members', '', '2022-07-14 16:31:07'),
(60, 'core', 'assigned_alert_active', '1', '2022-07-14 16:31:07'),
(61, 'core', 'assigned_alert_staff', '1', '2022-07-14 16:31:07'),
(62, 'core', 'assigned_alert_team_lead', '', '2022-07-14 16:31:07'),
(63, 'core', 'assigned_alert_team_members', '', '2022-07-14 16:31:07'),
(64, 'core', 'auto_claim_tickets', '1', '2022-07-14 16:31:07'),
(65, 'core', 'auto_refer_closed', '1', '2022-07-14 16:31:07'),
(66, 'core', 'collaborator_ticket_visibility', '1', '2022-07-14 16:31:07'),
(67, 'core', 'require_topic_to_close', '', '2022-07-14 16:31:07'),
(68, 'core', 'show_related_tickets', '1', '2022-07-14 16:31:07'),
(69, 'core', 'show_assigned_tickets', '1', '2022-07-14 16:31:07'),
(70, 'core', 'show_answered_tickets', '', '2022-07-14 16:31:07'),
(71, 'core', 'hide_staff_name', '', '2022-07-14 16:31:07'),
(72, 'core', 'disable_agent_collabs', '', '2022-07-14 16:31:07'),
(73, 'core', 'overlimit_notice_active', '', '2022-07-14 16:31:07'),
(74, 'core', 'email_attachments', '1', '2022-07-14 16:31:07'),
(75, 'core', 'ticket_number_format', '######', '2022-07-14 16:31:07'),
(76, 'core', 'ticket_sequence_id', '', '2022-07-14 16:31:07'),
(77, 'core', 'queue_bucket_counts', '', '2022-07-14 16:31:07'),
(78, 'core', 'allow_external_images', '', '2022-07-14 16:31:07'),
(79, 'core', 'task_number_format', '#', '2022-07-14 16:31:07'),
(80, 'core', 'task_sequence_id', '2', '2022-07-14 16:31:07'),
(81, 'core', 'log_level', '2', '2022-07-14 16:31:07'),
(82, 'core', 'log_graceperiod', '12', '2022-07-14 16:31:07'),
(83, 'core', 'client_registration', 'public', '2022-07-14 16:31:07'),
(84, 'core', 'default_ticket_queue', '1', '2022-07-14 16:31:07'),
(85, 'core', 'embedded_domain_whitelist', 'youtube.com, dailymotion.com, vimeo.com, player.vimeo.com, web.microsoftstream.com', '2022-07-14 16:31:07'),
(86, 'core', 'max_file_size', '1048576', '2022-07-14 16:31:07'),
(87, 'core', 'landing_page_id', '1', '2022-07-14 16:31:07'),
(88, 'core', 'thank-you_page_id', '2', '2022-07-14 16:31:07'),
(89, 'core', 'offline_page_id', '3', '2022-07-14 16:31:07'),
(90, 'core', 'system_language', 'es_ES', '2022-07-15 16:40:10'),
(91, 'mysqlsearch', 'reindex', '0', '2022-07-15 16:40:04'),
(92, 'core', 'default_email_id', '1', '2022-07-14 16:31:07'),
(93, 'core', 'alert_email_id', '2', '2022-07-14 16:31:07'),
(94, 'core', 'default_dept_id', '1', '2022-07-14 16:31:07'),
(95, 'core', 'default_sla_id', '1', '2022-07-14 16:31:07'),
(96, 'core', 'schedule_id', '1', '2022-07-14 16:31:07'),
(97, 'core', 'default_template_id', '1', '2022-07-14 16:31:07'),
(98, 'core', 'default_timezone', 'America/Guatemala', '2022-07-14 16:31:07'),
(99, 'core', 'default_storage_bk', 'D', '2022-07-15 16:40:10'),
(100, 'core', 'force_https', '', '2022-07-15 16:40:10'),
(101, 'core', 'date_formats', '', '2022-07-15 16:40:10'),
(102, 'core', 'default_locale', '', '2022-07-15 16:40:10'),
(103, 'core', 'secondary_langs', '', '2022-07-15 16:40:10'),
(104, 'core', 'enable_avatars', '1', '2022-07-15 16:40:10'),
(105, 'core', 'enable_richtext', '1', '2022-07-15 16:40:10'),
(106, 'core', 'files_req_auth', '1', '2022-07-15 16:40:10'),
(107, 'core', 'allow_iframes', '', '2022-07-15 16:40:10'),
(108, 'core', 'acl', '', '2022-07-15 16:40:10'),
(109, 'core', 'acl_backend', '0', '2022-07-15 16:40:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_content`
--

CREATE TABLE `ost_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_content`
--

INSERT INTO `ost_content` (`id`, `isactive`, `type`, `name`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'landing', 'Landing', '<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>', 'The Landing Page refers to the content of the Customer Portal\'s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>', 'This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(3, 1, 'offline', 'Offline', '<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(4, 1, 'registration-staff', 'Welcome to osTicket', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System<br /> %{company.name}</em> </div>', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(5, 1, 'pwreset-staff', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(6, 1, 'banner-staff', 'Authentication Required', '', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br/> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(11, 1, 'registration-thanks', 'Account Confirmed!', '<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(13, 1, 'email2fa-staff', 'osTicket Two Factor Authentication', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> You have just logged into for the helpdesk at %{url}.<br /> <br /> Use the verification code below to finish logging into the helpdesk.<br /> <br /> %{otp}<br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who use Email for Two Factor Authentication', '2022-07-14 10:31:07', '2022-07-14 10:31:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_department`
--

CREATE TABLE `ost_department` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `tpl_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `manager_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(128) NOT NULL DEFAULT '/',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_department`
--

INSERT INTO `ost_department` (`id`, `pid`, `tpl_id`, `sla_id`, `schedule_id`, `email_id`, `autoresp_email_id`, `manager_id`, `flags`, `name`, `signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `path`, `updated`, `created`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 0, 4, 'Support', 'Support Department', 1, 1, 1, 1, '/1/', '2022-07-14 10:31:05', '2022-07-14 10:31:05'),
(3, NULL, 0, 0, 0, 0, 0, 0, 4, 'Maintenance', 'Maintenance Department', 1, 0, 1, 1, '/3/', '2022-07-14 10:31:05', '2022-07-14 10:31:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_draft`
--

CREATE TABLE `ost_draft` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_email`
--

CREATE TABLE `ost_email` (
  `email_id` int(11) UNSIGNED NOT NULL,
  `noautoresp` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(11) UNSIGNED NOT NULL DEFAULT '2',
  `dept_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_folder` varchar(255) DEFAULT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth_creds` int(11) DEFAULT '0',
  `smtp_userid` varchar(255) NOT NULL,
  `smtp_userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `smtp_spoofing` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `userid`, `userpass`, `mail_active`, `mail_host`, `mail_protocol`, `mail_encryption`, `mail_folder`, `mail_port`, `mail_fetchfreq`, `mail_fetchmax`, `mail_archivefolder`, `mail_delete`, `mail_errors`, `mail_lasterror`, `mail_lastfetch`, `smtp_active`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_auth_creds`, `smtp_userid`, `smtp_userpass`, `smtp_spoofing`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'jpaz@grupolitoral.com', 'Support', '', '', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(2, 0, 2, 1, 0, 'alerts@unicah.edu', 'osTicket Alerts', '', '', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(3, 0, 2, 1, 0, 'noreply@unicah.edu', '', '', '', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_email_account`
--

CREATE TABLE `ost_email_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `protocol` varchar(64) NOT NULL DEFAULT '',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `options` varchar(512) DEFAULT NULL,
  `errors` int(11) UNSIGNED DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastconnect` timestamp NULL DEFAULT NULL,
  `lasterror` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_email_template`
--

CREATE TABLE `ost_email_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `tpl_id` int(11) UNSIGNED NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_email_template`
--

INSERT INTO `ost_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or information, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(3, 1, 'message.autoresp', 'Message Confirmation', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> has been noted <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%%7Brecipient.ticket_link%7D\">online here</a></em> </div>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> %{response} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', '<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D\">login to our helpdesk</a>. <br /> <br /> Thank you,<br /> Support Ticket System', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on ticket <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(8, 1, 'ticket.alert', 'New Ticket Alert', '<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(9, 1, 'message.alert', 'New Message Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{poster.name} </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(10, 1, 'note.alert', 'New Internal Activity Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{note.poster} </td> </tr> <tr><td><strong>Title</strong>: </td> <td>%{note.title} </td> </tr> </tbody> </table> <br /> %{note.message} <br /> <br /> <hr /> To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system <br /> <br /> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} </td> </tr> <tr><td><strong>Subject</strong>: </td> <td>%{ticket.subject} </td> </tr> </tbody> </table> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', '<h3>Hi %{recipient.name},</h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(14, 1, 'task.alert', 'New Task Alert', '<h2>Hi %{recipient.name},</h2> New task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> created <br /> <br /> <table><tbody><tr><td><strong>Department</strong>: </td> <td>%{task.dept.name} </td> </tr> </tbody> </table> <br /> %{task.description} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(15, 1, 'task.activity.notice', 'Re: %{task.title} [#%{task.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a task in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on task #%{task.number}. To participate, simply reply to this email.</em> </div>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(16, 1, 'task.activity.alert', 'Task Activity [#%{task.number}] - %{activity.title}', '<h3><strong>Hi %{recipient.name},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> updated: %{activity.description} <br /> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(17, 1, 'task.assignment.alert', 'Task Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(18, 1, 'task.transfer.alert', 'Task #%{task.number} transfer - %{task.dept.name}', '<h3>Hi %{recipient.name},</h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been transferred to the %{task.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(19, 1, 'task.overdue.alert', 'Stale Task Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A task, <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tasks are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{task.dept.manager.name} <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system. You\'re receiving this notice because the task is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_email_template_group`
--

CREATE TABLE `ost_email_template_group` (
  `tpl_id` int(11) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_email_template_group`
--

INSERT INTO `ost_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'osTicket Default Template (HTML)', 'en_US', 'Default osTicket templates', '2022-07-14 10:31:07', '2022-07-14 16:31:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_event`
--

CREATE TABLE `ost_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_event`
--

INSERT INTO `ost_event` (`id`, `name`, `description`) VALUES
(1, 'created', NULL),
(2, 'closed', NULL),
(3, 'reopened', NULL),
(4, 'assigned', NULL),
(5, 'released', NULL),
(6, 'transferred', NULL),
(7, 'referred', NULL),
(8, 'overdue', NULL),
(9, 'edited', NULL),
(10, 'viewed', NULL),
(11, 'error', NULL),
(12, 'collab', NULL),
(13, 'resent', NULL),
(14, 'deleted', NULL),
(15, 'merged', NULL),
(16, 'unlinked', NULL),
(17, 'linked', NULL),
(18, 'login', NULL),
(19, 'logout', NULL),
(20, 'message', NULL),
(21, 'note', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_faq`
--

CREATE TABLE `ost_faq` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_faq_category`
--

CREATE TABLE `ost_faq_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_pid` int(10) UNSIGNED DEFAULT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_faq_topic`
--

CREATE TABLE `ost_faq_topic` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_file`
--

CREATE TABLE `ost_file` (
  `id` int(11) NOT NULL,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_file`
--

INSERT INTO `ost_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2022-07-14 10:31:07'),
(2, 'T', 'D', 'text/plain', 24, 'mXTwKMWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2022-07-14 10:31:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_file_chunk`
--

CREATE TABLE `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_file_chunk`
--

INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_filter`
--

CREATE TABLE `ost_filter` (
  `id` int(11) UNSIGNED NOT NULL,
  `execorder` int(10) UNSIGNED NOT NULL DEFAULT '99',
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `match_all_rules` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_filter`
--

INSERT INTO `ost_filter` (`id`, `execorder`, `isactive`, `flags`, `status`, `match_all_rules`, `stop_onmatch`, `target`, `email_id`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 0, 'Email', 0, 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2022-07-14 10:31:06', '2022-07-14 10:31:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_filter_action`
--

CREATE TABLE `ost_filter_action` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(24) NOT NULL,
  `configuration` text,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_filter_rule`
--

CREATE TABLE `ost_filter_rule` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_form`
--

CREATE TABLE `ost_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_form`
--

INSERT INTO `ost_form` (`id`, `pid`, `type`, `flags`, `title`, `instructions`, `name`, `notes`, `created`, `updated`) VALUES
(1, NULL, 'U', 1, 'Contact Information', NULL, '', NULL, '2022-07-14 10:31:05', '2022-07-14 10:31:05'),
(2, NULL, 'T', 1, 'Detalle de los ticket', 'Describe el problema ocurrido', '', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2022-07-14 10:31:05', '2022-07-14 10:31:05'),
(3, NULL, 'C', 1, 'Company Information', 'Details available in email templates', '', NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(4, NULL, 'O', 1, 'Organization Information', 'Details on user organization', '', NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(5, NULL, 'A', 1, 'Task Details', 'Please Describe The Issue', '', 'This form is used to create a task.', '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(6, NULL, 'L1', 0, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', '', NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_form_entry`
--

CREATE TABLE `ost_form_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `extra` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_form_entry`
--

INSERT INTO `ost_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `extra`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(2, 3, NULL, 'C', 1, NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(3, 1, 1, 'U', 1, NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(4, 2, 1, 'T', 0, '{\"disable\":[]}', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(5, 1, 2, 'U', 1, NULL, '2022-07-14 10:41:54', '2022-07-14 10:41:54'),
(6, 2, 2, 'T', 0, '{\"disable\":[]}', '2022-07-14 10:41:54', '2022-07-14 10:41:54'),
(7, 2, 3, 'T', 0, '{\"disable\":[]}', '2022-07-14 11:15:45', '2022-07-14 11:15:45'),
(8, 2, 4, 'T', 0, '{\"disable\":[]}', '2022-07-14 11:18:17', '2022-07-14 11:18:17'),
(9, 1, 3, 'U', 1, NULL, '2022-07-14 16:01:22', '2022-07-14 16:01:22'),
(10, 2, 5, 'T', 0, '{\"disable\":[]}', '2022-07-14 16:01:22', '2022-07-14 16:01:22'),
(11, 2, 6, 'T', 0, '{\"disable\":[]}', '2022-07-15 10:35:11', '2022-07-15 10:35:11'),
(12, 1, 4, 'U', 1, NULL, '2022-07-21 14:45:21', '2022-07-21 14:45:21'),
(13, 2, 7, 'T', 0, '{\"disable\":[]}', '2022-07-21 14:45:21', '2022-07-21 14:45:21'),
(14, 1, 5, 'U', 1, NULL, '2022-07-21 15:41:52', '2022-07-21 15:41:52'),
(15, 2, 8, 'T', 0, '{\"disable\":[]}', '2022-07-21 15:41:52', '2022-07-21 15:41:52'),
(16, 1, 6, 'U', 1, NULL, '2022-07-21 15:43:11', '2022-07-21 15:43:11'),
(17, 2, 9, 'T', 0, '{\"disable\":[]}', '2022-07-21 15:43:11', '2022-07-21 15:43:11'),
(18, 1, 7, 'U', 1, NULL, '2022-07-21 15:53:31', '2022-07-21 15:53:31'),
(19, 2, 10, 'T', 0, '{\"disable\":[]}', '2022-07-21 15:53:31', '2022-07-21 15:53:31'),
(20, 2, 11, 'T', 0, '{\"disable\":[]}', '2022-07-21 16:13:34', '2022-07-21 16:13:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_form_entry_values`
--

CREATE TABLE `ost_form_entry_values` (
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `value` text,
  `value_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_form_entry_values`
--

INSERT INTO `ost_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(2, 23, 'GL-SOPORTE', NULL),
(2, 24, NULL, NULL),
(2, 25, NULL, NULL),
(2, 26, NULL, NULL),
(4, 20, 'osTicket Installed!', NULL),
(5, 3, NULL, NULL),
(5, 4, NULL, NULL),
(6, 20, 'fg', NULL),
(6, 22, 'Normal', 2),
(7, 20, 'f', NULL),
(7, 22, 'Normal', 2),
(8, 20, 'f', NULL),
(8, 22, 'Normal', 2),
(9, 3, NULL, NULL),
(9, 4, NULL, NULL),
(10, 20, 'df', NULL),
(10, 22, 'Normal', 2),
(11, 20, 'fg', NULL),
(11, 22, 'Normal', 2),
(12, 4, NULL, NULL),
(13, 20, 'dsd', NULL),
(13, 22, 'Normal', 2),
(14, 4, NULL, NULL),
(15, 20, 'jk', NULL),
(15, 22, 'Low', 1),
(16, 4, NULL, NULL),
(17, 20, 'fgfg', NULL),
(17, 22, 'Normal', 2),
(18, 4, NULL, NULL),
(19, 20, 'sadsd', NULL),
(19, 22, 'Normal', 2),
(20, 20, 'sadsd', NULL),
(20, 22, 'Normal', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_form_field`
--

CREATE TABLE `ost_form_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED DEFAULT '1',
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int(11) UNSIGNED NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_form_field`
--

INSERT INTO `ost_form_field` (`id`, `form_id`, `flags`, `type`, `label`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 489395, 'text', 'Correo', 'email', '{\"size\":40,\"length\":64,\"validator\":\"email\"}', 1, NULL, '2022-07-14 10:31:05', '2022-07-14 10:31:05'),
(2, 1, 489395, 'text', 'Nombre Completo', 'name', '{\"size\":40,\"length\":64}', 2, NULL, '2022-07-14 10:31:05', '2022-07-14 10:31:05'),
(4, 1, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 4, NULL, '2022-07-14 10:31:05', '2022-07-14 10:31:05'),
(20, 2, 489265, 'text', 'Asunto', 'subject', '{\"size\":40,\"length\":50}', 1, NULL, '2022-07-14 10:31:05', '2022-07-14 10:31:05'),
(21, 2, 480547, 'thread', 'Asunto', 'message', NULL, 2, 'Details on the reason(s) for opening the ticket.', '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(22, 2, 274609, 'priority', 'Priority Level', 'priority', NULL, 3, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(23, 3, 291249, 'text', 'Company Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(24, 3, 274705, 'text', 'Website', 'website', '{\"size\":40,\"length\":64}', 2, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(25, 3, 274705, 'phone', 'Phone Number', 'phone', '{\"ext\":false}', 3, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(26, 3, 12545, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}', 4, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(27, 4, 489395, 'text', 'Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(28, 4, 13057, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}', 2, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(29, 4, 13057, 'phone', 'Phone', 'phone', NULL, 3, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(30, 4, 13057, 'text', 'Website', 'website', '{\"size\":40,\"length\":0}', 4, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(31, 4, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 5, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(32, 5, 487601, 'text', 'Title', 'title', '{\"size\":40,\"length\":50}', 1, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(33, 5, 413939, 'thread', 'Description', 'description', NULL, 2, 'Details on the reason(s) for creating the task.', '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(34, 6, 487665, 'state', 'State', 'state', '{\"prompt\":\"State of a ticket\"}', 1, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(35, 6, 471073, 'memo', 'Description', 'description', '{\"rows\":\"2\",\"cols\":\"40\",\"html\":\"\",\"length\":\"100\"}', 3, NULL, '2022-07-14 10:31:06', '2022-07-14 10:31:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_group`
--

CREATE TABLE `ost_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(120) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_help_topic`
--

CREATE TABLE `ost_help_topic` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `topic_pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sequence_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic` varchar(128) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_help_topic`
--

INSERT INTO `ost_help_topic` (`topic_id`, `topic_pid`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 1, 'Consultas Generales', NULL, '', '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(2, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 2, 'Reportar problema con aplicativos', NULL, '', '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(10, 0, 1, 0, 2, 0, 2, 3, 0, 0, 0, 0, 0, 3, 'Reportar una falla en el equipo', NULL, '', '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(12, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Solicitud de equipo', NULL, NULL, '2022-07-21 15:48:16', '2022-07-21 15:48:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_help_topic_form`
--

CREATE TABLE `ost_help_topic_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `extra` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_help_topic_form`
--

INSERT INTO `ost_help_topic_form` (`id`, `topic_id`, `form_id`, `sort`, `extra`) VALUES
(1, 1, 2, 1, '{\"disable\":[]}'),
(2, 2, 2, 1, '{\"disable\":[]}'),
(3, 10, 2, 1, '{\"disable\":[]}'),
(4, 11, 2, 1, '{\"disable\":[]}'),
(5, 12, 2, 1, '{\"disable\":[]}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_list`
--

CREATE TABLE `ost_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `configuration` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_list`
--

INSERT INTO `ost_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `configuration`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', '{\"handler\":\"TicketStatusList\"}', 'Ticket statuses', '2022-07-14 10:31:06', '2022-07-14 10:31:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_list_items`
--

CREATE TABLE `ost_list_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `properties` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_lock`
--

CREATE TABLE `ost_lock` (
  `lock_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_note`
--

CREATE TABLE `ost_note` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_organization`
--

CREATE TABLE `ost_organization` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_organization`
--

INSERT INTO `ost_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 8, '', NULL, '2022-07-14 16:31:06', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_organization__cdata`
--

CREATE TABLE `ost_organization__cdata` (
  `org_id` int(11) UNSIGNED NOT NULL,
  `name` mediumtext,
  `address` mediumtext,
  `phone` mediumtext,
  `website` mediumtext,
  `notes` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_plugin`
--

CREATE TABLE `ost_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `installed` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_queue`
--

CREATE TABLE `ost_queue` (
  `id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `columns_id` int(11) UNSIGNED DEFAULT NULL,
  `sort_id` int(11) UNSIGNED DEFAULT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(60) DEFAULT NULL,
  `config` text,
  `filter` varchar(64) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `path` varchar(80) NOT NULL DEFAULT '/',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_queue`
--

INSERT INTO `ost_queue` (`id`, `parent_id`, `columns_id`, `sort_id`, `flags`, `staff_id`, `sort`, `title`, `config`, `filter`, `root`, `path`, `created`, `updated`) VALUES
(1, 0, NULL, 1, 3, 0, 1, 'Open', '[[\"status__state\",\"includes\",{\"open\":\"Open\"}]]', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(2, 1, NULL, 4, 43, 0, 1, 'Open', '{\"criteria\":[[\"isanswered\",\"nset\",null]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(3, 1, NULL, 4, 43, 0, 2, 'Answered', '{\"criteria\":[[\"isanswered\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(4, 1, NULL, 4, 43, 0, 3, 'Overdue', '{\"criteria\":[[\"isoverdue\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(5, 0, NULL, 3, 3, 0, 3, 'My Tickets', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\",\"T\":\"One of my teams\"}],[\"status__state\",\"includes\",{\"open\":\"Open\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(6, 5, NULL, NULL, 43, 0, 1, 'Assigned to Me', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(7, 5, NULL, NULL, 43, 0, 2, 'Assigned to Teams', '{\"criteria\":[[\"assignee\",\"!includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(8, 0, NULL, 5, 3, 0, 4, 'Closed', '{\"criteria\":[[\"status__state\",\"includes\",{\"closed\":\"Closed\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(9, 8, NULL, 5, 43, 0, 1, 'Today', '{\"criteria\":[[\"closed\",\"period\",\"td\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(10, 8, NULL, 5, 43, 0, 2, 'Yesterday', '{\"criteria\":[[\"closed\",\"period\",\"yd\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(11, 8, NULL, 5, 43, 0, 3, 'This Week', '{\"criteria\":[[\"closed\",\"period\",\"tw\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(12, 8, NULL, 5, 43, 0, 4, 'This Month', '{\"criteria\":[[\"closed\",\"period\",\"tm\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(13, 8, NULL, 6, 43, 0, 5, 'This Quarter', '{\"criteria\":[[\"closed\",\"period\",\"tq\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(14, 8, NULL, 7, 43, 0, 6, 'This Year', '{\"criteria\":[[\"closed\",\"period\",\"ty\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-14 10:31:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_queue_column`
--

CREATE TABLE `ost_queue_column` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) DEFAULT NULL,
  `filter` varchar(32) DEFAULT NULL,
  `truncate` varchar(16) DEFAULT NULL,
  `annotations` text,
  `conditions` text,
  `extra` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_queue_column`
--

INSERT INTO `ost_queue_column` (`id`, `flags`, `name`, `primary`, `secondary`, `filter`, `truncate`, `annotations`, `conditions`, `extra`) VALUES
(1, 0, 'Ticket #', 'number', NULL, 'link:ticketP', 'wrap', '[{\"c\":\"TicketSourceDecoration\",\"p\":\"b\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(2, 0, 'Date Created', 'created', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(3, 0, 'Subject', 'cdata__subject', NULL, 'link:ticket', 'ellipsis', '[{\"c\":\"TicketThreadCount\",\"p\":\">\"},{\"c\":\"ThreadAttachmentCount\",\"p\":\"a\"},{\"c\":\"OverdueFlagDecoration\",\"p\":\"<\"},{\"c\":\"LockDecoration\",\"p\":\"<\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(4, 0, 'User Name', 'user__name', NULL, NULL, 'wrap', '[{\"c\":\"ThreadCollaboratorCount\",\"p\":\">\"}]', '[]', NULL),
(5, 0, 'Priority', 'cdata__priority', NULL, NULL, 'wrap', '[]', '[]', NULL),
(6, 0, 'Status', 'status__id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(7, 0, 'Close Date', 'closed', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(8, 0, 'Assignee', 'assignee', NULL, NULL, 'wrap', '[]', '[]', NULL),
(9, 0, 'Due Date', 'duedate', 'est_duedate', 'date:human', 'wrap', '[]', '[]', NULL),
(10, 0, 'Last Updated', 'lastupdate', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(11, 0, 'Department', 'dept_id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(12, 0, 'Last Message', 'thread__lastmessage', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(13, 0, 'Last Response', 'thread__lastresponse', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(14, 0, 'Team', 'team_id', NULL, NULL, 'wrap', '[]', '[]', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_queue_columns`
--

CREATE TABLE `ost_queue_columns` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `column_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `bits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `heading` varchar(64) DEFAULT NULL,
  `width` int(10) UNSIGNED NOT NULL DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_queue_columns`
--

INSERT INTO `ost_queue_columns` (`queue_id`, `column_id`, `staff_id`, `bits`, `sort`, `heading`, `width`) VALUES
(1, 1, 0, 1, 1, 'Ticket', 100),
(1, 10, 0, 1, 2, 'Last Updated', 150),
(1, 3, 0, 1, 3, 'Subject', 300),
(1, 4, 0, 1, 4, 'From', 185),
(1, 5, 0, 1, 5, 'Priority', 85),
(1, 8, 0, 1, 6, 'Assigned To', 160),
(2, 1, 0, 1, 1, 'Ticket', 100),
(2, 10, 0, 1, 2, 'Last Updated', 150),
(2, 3, 0, 1, 3, 'Subject', 300),
(2, 4, 0, 1, 4, 'From', 185),
(2, 5, 0, 1, 5, 'Priority', 85),
(2, 8, 0, 1, 6, 'Assigned To', 160),
(3, 1, 0, 1, 1, 'Ticket', 100),
(3, 10, 0, 1, 2, 'Last Updated', 150),
(3, 3, 0, 1, 3, 'Subject', 300),
(3, 4, 0, 1, 4, 'From', 185),
(3, 5, 0, 1, 5, 'Priority', 85),
(3, 8, 0, 1, 6, 'Assigned To', 160),
(4, 1, 0, 1, 1, 'Ticket', 100),
(4, 9, 0, 1, 9, 'Due Date', 150),
(4, 3, 0, 1, 3, 'Subject', 300),
(4, 4, 0, 1, 4, 'From', 185),
(4, 5, 0, 1, 5, 'Priority', 85),
(4, 8, 0, 1, 6, 'Assigned To', 160),
(5, 1, 0, 1, 1, 'Ticket', 100),
(5, 10, 0, 1, 2, 'Last Update', 150),
(5, 3, 0, 1, 3, 'Subject', 300),
(5, 4, 0, 1, 4, 'From', 185),
(5, 5, 0, 1, 5, 'Priority', 85),
(5, 11, 0, 1, 6, 'Department', 160),
(6, 1, 0, 1, 1, 'Ticket', 100),
(6, 10, 0, 1, 2, 'Last Update', 150),
(6, 3, 0, 1, 3, 'Subject', 300),
(6, 4, 0, 1, 4, 'From', 185),
(6, 5, 0, 1, 5, 'Priority', 85),
(6, 11, 0, 1, 6, 'Department', 160),
(7, 1, 0, 1, 1, 'Ticket', 100),
(7, 10, 0, 1, 2, 'Last Update', 150),
(7, 3, 0, 1, 3, 'Subject', 300),
(7, 4, 0, 1, 4, 'From', 185),
(7, 5, 0, 1, 5, 'Priority', 85),
(7, 14, 0, 1, 6, 'Team', 160),
(8, 1, 0, 1, 1, 'Ticket', 100),
(8, 7, 0, 1, 2, 'Date Closed', 150),
(8, 3, 0, 1, 3, 'Subject', 300),
(8, 4, 0, 1, 4, 'From', 185),
(8, 8, 0, 1, 6, 'Closed By', 160),
(9, 1, 0, 1, 1, 'Ticket', 100),
(9, 7, 0, 1, 2, 'Date Closed', 150),
(9, 3, 0, 1, 3, 'Subject', 300),
(9, 4, 0, 1, 4, 'From', 185),
(9, 8, 0, 1, 6, 'Closed By', 160),
(10, 1, 0, 1, 1, 'Ticket', 100),
(10, 7, 0, 1, 2, 'Date Closed', 150),
(10, 3, 0, 1, 3, 'Subject', 300),
(10, 4, 0, 1, 4, 'From', 185),
(10, 8, 0, 1, 6, 'Closed By', 160),
(11, 1, 0, 1, 1, 'Ticket', 100),
(11, 7, 0, 1, 2, 'Date Closed', 150),
(11, 3, 0, 1, 3, 'Subject', 300),
(11, 4, 0, 1, 4, 'From', 185),
(11, 8, 0, 1, 6, 'Closed By', 160),
(12, 1, 0, 1, 1, 'Ticket', 100),
(12, 7, 0, 1, 2, 'Date Closed', 150),
(12, 3, 0, 1, 3, 'Subject', 300),
(12, 4, 0, 1, 4, 'From', 185),
(12, 8, 0, 1, 6, 'Closed By', 160),
(13, 1, 0, 1, 1, 'Ticket', 100),
(13, 7, 0, 1, 2, 'Date Closed', 150),
(13, 3, 0, 1, 3, 'Subject', 300),
(13, 4, 0, 1, 4, 'From', 185),
(13, 8, 0, 1, 6, 'Closed By', 160),
(14, 1, 0, 1, 1, 'Ticket', 100),
(14, 7, 0, 1, 2, 'Date Closed', 150),
(14, 3, 0, 1, 3, 'Subject', 300),
(14, 4, 0, 1, 4, 'From', 185),
(14, 8, 0, 1, 6, 'Closed By', 160);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_queue_config`
--

CREATE TABLE `ost_queue_config` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `setting` text,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_queue_export`
--

CREATE TABLE `ost_queue_export` (
  `id` int(11) UNSIGNED NOT NULL,
  `queue_id` int(11) UNSIGNED NOT NULL,
  `path` varchar(64) NOT NULL DEFAULT '',
  `heading` varchar(64) DEFAULT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_queue_sort`
--

CREATE TABLE `ost_queue_sort` (
  `id` int(11) UNSIGNED NOT NULL,
  `root` varchar(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `columns` text,
  `updated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_queue_sort`
--

INSERT INTO `ost_queue_sort` (`id`, `root`, `name`, `columns`, `updated`) VALUES
(1, NULL, 'Priority + Most Recently Updated', '[\"-cdata__priority\",\"-lastupdate\"]', '2022-07-14 10:31:07'),
(2, NULL, 'Priority + Most Recently Created', '[\"-cdata__priority\",\"-created\"]', '2022-07-14 10:31:07'),
(3, NULL, 'Priority + Due Date', '[\"-cdata__priority\",\"-est_duedate\"]', '2022-07-14 10:31:07'),
(4, NULL, 'Due Date', '[\"-est_duedate\"]', '2022-07-14 10:31:07'),
(5, NULL, 'Closed Date', '[\"-closed\"]', '2022-07-14 10:31:07'),
(6, NULL, 'Create Date', '[\"-created\"]', '2022-07-14 10:31:07'),
(7, NULL, 'Update Date', '[\"-lastupdate\"]', '2022-07-14 10:31:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_queue_sorts`
--

CREATE TABLE `ost_queue_sorts` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `sort_id` int(11) UNSIGNED NOT NULL,
  `bits` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_queue_sorts`
--

INSERT INTO `ost_queue_sorts` (`queue_id`, `sort_id`, `bits`, `sort`) VALUES
(1, 1, 0, 0),
(1, 2, 0, 0),
(1, 3, 0, 0),
(1, 4, 0, 0),
(1, 6, 0, 0),
(1, 7, 0, 0),
(5, 1, 0, 0),
(5, 2, 0, 0),
(5, 3, 0, 0),
(5, 4, 0, 0),
(5, 6, 0, 0),
(5, 7, 0, 0),
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(7, 1, 0, 0),
(7, 2, 0, 0),
(7, 3, 0, 0),
(7, 4, 0, 0),
(7, 6, 0, 0),
(7, 7, 0, 0),
(8, 5, 0, 0),
(8, 1, 0, 0),
(8, 2, 0, 0),
(8, 3, 0, 0),
(8, 4, 0, 0),
(8, 6, 0, 0),
(8, 7, 0, 0),
(9, 5, 0, 0),
(9, 1, 0, 0),
(9, 2, 0, 0),
(9, 3, 0, 0),
(9, 4, 0, 0),
(9, 6, 0, 0),
(9, 7, 0, 0),
(10, 5, 0, 0),
(10, 1, 0, 0),
(10, 2, 0, 0),
(10, 3, 0, 0),
(10, 4, 0, 0),
(10, 6, 0, 0),
(10, 7, 0, 0),
(11, 5, 0, 0),
(11, 1, 0, 0),
(11, 2, 0, 0),
(11, 3, 0, 0),
(11, 4, 0, 0),
(11, 6, 0, 0),
(11, 7, 0, 0),
(12, 5, 0, 0),
(12, 1, 0, 0),
(12, 2, 0, 0),
(12, 3, 0, 0),
(12, 4, 0, 0),
(12, 6, 0, 0),
(12, 7, 0, 0),
(13, 5, 0, 0),
(13, 1, 0, 0),
(13, 2, 0, 0),
(13, 3, 0, 0),
(13, 4, 0, 0),
(13, 6, 0, 0),
(13, 7, 0, 0),
(14, 5, 0, 0),
(14, 1, 0, 0),
(14, 2, 0, 0),
(14, 3, 0, 0),
(14, 4, 0, 0),
(14, 6, 0, 0),
(14, 7, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_role`
--

CREATE TABLE `ost_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(64) DEFAULT NULL,
  `permissions` text,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_role`
--

INSERT INTO `ost_role` (`id`, `flags`, `name`, `permissions`, `notes`, `created`, `updated`) VALUES
(1, 1, 'All Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"thread.edit\":1,\"ticket.link\":1,\"ticket.markanswered\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.delete\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with unlimited access', '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(2, 1, 'Expanded Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.edit\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with expanded access', '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(3, 1, 'Limited Access', '{\"ticket.assign\":1,\"ticket.create\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.reply\":1,\"task.transfer\":1}', 'Role with limited access', '2022-07-14 10:31:06', '2022-07-14 10:31:06'),
(4, 1, 'View only', NULL, 'Simple role with no permissions', '2022-07-14 10:31:06', '2022-07-14 10:31:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_schedule`
--

CREATE TABLE `ost_schedule` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_schedule`
--

INSERT INTO `ost_schedule` (`id`, `flags`, `name`, `timezone`, `description`, `created`, `updated`) VALUES
(1, 1, 'Monday - Friday 8am - 5pm with U.S. Holidays', NULL, '', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(2, 1, '24/7', NULL, '', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(3, 1, '24/5', NULL, '', '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(4, 0, 'U.S. Holidays', NULL, '', '2022-07-14 10:31:07', '2022-07-14 10:31:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_schedule_entry`
--

CREATE TABLE `ost_schedule_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `repeats` varchar(16) NOT NULL DEFAULT 'never',
  `starts_on` date DEFAULT NULL,
  `starts_at` time DEFAULT NULL,
  `ends_on` date DEFAULT NULL,
  `ends_at` time DEFAULT NULL,
  `stops_on` datetime DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `week` tinyint(4) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_schedule_entry`
--

INSERT INTO `ost_schedule_entry` (`id`, `schedule_id`, `flags`, `sort`, `name`, `repeats`, `starts_on`, `starts_at`, `ends_on`, `ends_at`, `stops_on`, `day`, `week`, `month`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'Monday', 'weekly', '2019-01-07', '08:00:00', '2019-01-07', '17:00:00', NULL, 1, NULL, NULL, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(2, 1, 0, 0, 'Tuesday', 'weekly', '2019-01-08', '08:00:00', '2019-01-08', '17:00:00', NULL, 2, NULL, NULL, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(3, 1, 0, 0, 'Wednesday', 'weekly', '2019-01-09', '08:00:00', '2019-01-09', '17:00:00', NULL, 3, NULL, NULL, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(4, 1, 0, 0, 'Thursday', 'weekly', '2019-01-10', '08:00:00', '2019-01-10', '17:00:00', NULL, 4, NULL, NULL, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(5, 1, 0, 0, 'Friday', 'weekly', '2019-01-11', '08:00:00', '2019-01-11', '17:00:00', NULL, 5, NULL, NULL, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(6, 2, 0, 0, 'Daily', 'daily', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(7, 3, 0, 0, 'Weekdays', 'weekdays', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(8, 4, 0, 0, 'New Year\'s Day', 'yearly', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, 1, NULL, 1, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(9, 4, 0, 0, 'MLK Day', 'yearly', '2019-01-21', '00:00:00', '2019-01-21', '23:59:59', NULL, 1, 3, 1, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(10, 4, 0, 0, 'Memorial Day', 'yearly', '2019-05-27', '00:00:00', '2019-05-27', '23:59:59', NULL, 1, -1, 5, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(11, 4, 0, 0, 'Independence Day (4th of July)', 'yearly', '2019-07-04', '00:00:00', '2019-07-04', '23:59:59', NULL, 4, NULL, 7, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(12, 4, 0, 0, 'Labor Day', 'yearly', '2019-09-02', '00:00:00', '2019-09-02', '23:59:59', NULL, 1, 1, 9, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(13, 4, 0, 0, 'Indigenous Peoples\' Day (Whodat Columbus)', 'yearly', '2019-10-14', '00:00:00', '2019-10-14', '23:59:59', NULL, 1, 2, 10, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(14, 4, 0, 0, 'Veterans Day', 'yearly', '2019-11-11', '00:00:00', '2019-11-11', '23:59:59', NULL, 11, NULL, 11, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(15, 4, 0, 0, 'Thanksgiving Day', 'yearly', '2019-11-28', '00:00:00', '2019-11-28', '23:59:59', NULL, 4, 4, 11, '0000-00-00 00:00:00', '2022-07-14 10:31:07'),
(16, 4, 0, 0, 'Christmas Day', 'yearly', '2019-11-25', '00:00:00', '2019-11-25', '23:59:59', NULL, 25, NULL, 12, '0000-00-00 00:00:00', '2022-07-14 10:31:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_sequence`
--

CREATE TABLE `ost_sequence` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `flags` int(10) UNSIGNED DEFAULT NULL,
  `next` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `increment` int(11) DEFAULT '1',
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_session`
--

CREATE TABLE `ost_session` (
  `session_id` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ost_session`
--

INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('9n181c85o4qill69vtrub70vku', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265653030323562383239343764333839613562383034303339633338316666383337353131346164223b733a343a2274696d65223b693a313635373831393130303b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31373a22416d65726963612f47756174656d616c61223b7d, '2022-07-15 11:18:20', NULL, '0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('gbcs15bgvoel294g9v2oq67oui', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239636238333361383339663632373431336661663039633266643265396161666631616665646338223b733a343a2274696d65223b693a313635373930323933313b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31373a22416d65726963612f47756174656d616c61223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2230316535653565626465626366343630356162666537656136656362326334653a313635373930323933313a6635323837363464363234646231323962333263323166626361306362386436223b7d4b415055547c693a313635373930323939313b, '2022-07-16 10:35:31', NULL, '0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('6smq2ousip948i9p0idcj1qkbl', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265313037323562326166373862393561393237666361313064333937303232313734633732353134223b733a343a2274696d65223b693a313635373931343233373b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-07-16 13:43:58', NULL, '0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('dep86b0ph4oofu2vh42bmfc1nl', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262336365353066653334656361316231343739666465323262316365353364643132356362613864223b733a343a2274696d65223b693a313635383433393935393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f6f732d5469636b6574322f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a313b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2235333961366264393035383333393462323634346430303339663136633661623a313635383433393935393a6131343262383364613738343166663166666439363264393134346562396531223b7d4b415055547c693a313635383434303031393b, '2022-07-22 14:45:59', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('nd1b5iokln6nuh5hlstua1v108', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237326531343262623065663039386230623863666535643338326631356232646461636638353331223b733a343a2274696d65223b693a313635383434333333333b7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a313b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f6f732d5469636b6574322f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2232653336393765313038643164663863343934303062343530303937343964373a313635383434333333333a6131343262383364613738343166663166666439363264393134346562396531223b7d4b415055547c693a313635383434333339333b, '2022-07-22 15:42:13', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('el4c1c7c9kae0oidi126044mgm', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261616463343131623665653635633665376439653631393861663061623631393038653664356364223b733a343a2274696d65223b693a313635383434303337353b7d, '2022-07-22 14:52:55', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('ed3dea7c4644d0c756b96e32e3779067', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266623638393366373335623435666263663462376230633361323435326332333034616630653939223b733a343a2274696d65223b693a313635383834363930333b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-07-27 07:48:23', NULL, '0', '190.11.225.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('76280800967a87e30fea480de26bd106', 0x637372667c4e3b, '2022-07-27 07:48:19', NULL, '0', '190.11.225.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('q0svbuvn59h0snic4akh20k1rs', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262633861353663306431393633396462333136373731333630646539346664666165393233333431223b733a343a2274696d65223b693a313635383434353234323b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f6f732d5469636b6574322f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2234653163633532356562336132653238393662643536333837656166363031363a313635383434353234323a6131343262383364613738343166663166666439363264393134346562396531223b7d4b415055547c693a313635383434353330323b, '2022-07-22 16:14:02', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('f2bb6da5ab70016be5390001dc9fba8a', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235323436343834346666373766643934613862663237346664616234313832383161663934633836223b733a343a2274696d65223b693a313635383530373730363b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f6f732d5469636b6574322f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d, '2022-07-23 09:35:06', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('08beb38b41e9063559da9d4516d8c9bb', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266333839316265376263363432663033626536373462386661326432303637363962356230343138223b733a343a2274696d65223b693a313635383533303337363b7d, '2022-07-23 15:52:56', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('c9a4e58ca42b226dc5b5a67c3f3f8f52', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235313036623661353465333930616231633266323463616161623861656662663431386530653261223b733a343a2274696d65223b693a313635383834353831393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32353a222f6f732d5469636b6574322f7363702f696e6465782e706870223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2237313535666433363039373030343334386535636436303666366332623262643a313635383834353831393a6237336165353065626435653731336137323563383230343235663236356135223b7d4b415055547c693a313635383834353837393b, '2022-07-27 07:30:19', NULL, '0', '190.11.225.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('b191a6c6e2b5d28fa5f9dafc35b5742a', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232313163633964656237326630613737343566383766613936323565326330343765383534383665223b733a343a2274696d65223b693a313635383835343634303b7d, '2022-07-27 09:57:20', NULL, '0', '190.11.225.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('ac9e254d8dd7e61bd261ca048c054627', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235326130666639663862383462653737396132393562646135613235326664613165666639616661223b733a343a2274696d65223b693a313635383835373430343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31333a222f736f706f7274652f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-07-27 10:43:24', NULL, '0', '190.11.225.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('58a18f3d42b3b49f9b6332bb0d2a9a4a', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264653237636432313131303766343135616532316663363737313634303034323063343035373561223b733a343a2274696d65223b693a313635393336333238333b7d, '2022-08-02 07:14:43', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('c224606cbbf0f8c9be5c0c62abceca56', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233626437373564336261323565396239633132336337616132323365333831666332373666396465223b733a343a2274696d65223b693a313635393336333239333b7d, '2022-08-02 07:14:53', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('fafd8fd3303420a4144bcc085dcc386d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239643338613763623539333963323864623235336463636136376263343532653030613133383033223b733a343a2274696d65223b693a313635393633313639343b7d, '2022-08-05 09:48:14', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('e5c471c3bf45a2fef05d509c5db94615', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238303733306139366439613264313863393961626339393863323130623562396137376563643436223b733a343a2274696d65223b693a313635393634373430373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31363a222f6f732d5469636b6574322f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-08-05 14:10:07', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'),
('5daf12d9328f421615e06c9d8d9faeda', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261363964373862663633613063633438393232326639326266376532323730346463376433393039223b733a343a2274696d65223b693a313635393731393633333b7d, '2022-08-06 10:13:53', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_sla`
--

CREATE TABLE `ost_sla` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `grace_period` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_sla`
--

INSERT INTO `ost_sla` (`id`, `schedule_id`, `flags`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 3, 18, 'Default SLA', NULL, '2022-07-14 10:31:05', '2022-07-14 10:31:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_staff`
--

CREATE TABLE `ost_staff` (
  `staff_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `max_page_size` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `extra` text,
  `permissions` text,
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_staff`
--

INSERT INTO `ost_staff` (`staff_id`, `dept_id`, `role_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `lang`, `timezone`, `locale`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `extra`, `permissions`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 'JPAZ', 'Jorge', 'Paz', '$2a$08$ZBlQRAWWjWwSDMRekWq18Om1e3jaeRa0Yz6lF.VPh9za5k6.6ltcK', NULL, 'jorge1giron18@gmail.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '{\"browser_lang\":\"es_ES\"}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"emails.banlist\":1,\"visibility.departments\":1}', '2022-07-14 10:31:07', '2022-07-26 07:30:19', '2022-07-14 10:31:07', '2022-07-26 07:30:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_staff_dept_access`
--

CREATE TABLE `ost_staff_dept_access` (
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_staff_dept_access`
--

INSERT INTO `ost_staff_dept_access` (`staff_id`, `dept_id`, `role_id`, `flags`) VALUES
(1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_syslog`
--

CREATE TABLE `ost_syslog` (
  `log_id` int(11) UNSIGNED NOT NULL,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_syslog`
--

INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '127.0.0.1', '2022-07-14 10:31:08', '2022-07-14 10:31:08'),
(2, 'Error', 'Mailer Error', 'Unable to email via php mail function:jorge1giron18@gmail.com mail() returned failure ', '', '127.0.0.1', '2022-07-14 10:41:57', '2022-07-14 10:41:57'),
(3, 'Error', 'Mailer Error', 'Unable to email via php mail function:jorge1giron18@gmail.com mail() returned failure ', '', '127.0.0.1', '2022-07-14 11:15:47', '2022-07-14 11:15:47'),
(4, 'Error', 'Mailer Error', 'Unable to email via php mail function:jorge1giron18@gmail.com mail() returned failure ', '', '127.0.0.1', '2022-07-14 11:18:19', '2022-07-14 11:18:19'),
(5, 'Error', 'Mailer Error', 'Unable to email via php mail function:jorge1giron18@gmail.com mail() returned failure ', '', '127.0.0.1', '2022-07-14 16:01:25', '2022-07-14 16:01:25'),
(6, 'Error', 'Mailer Error', 'Unable to email via php mail function:jorge1giron18@gmail.com mail() returned failure ', '', '127.0.0.1', '2022-07-15 10:35:13', '2022-07-15 10:35:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_task`
--

CREATE TABLE `ost_task` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `object_type` char(1) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_task__cdata`
--

CREATE TABLE `ost_task__cdata` (
  `task_id` int(11) UNSIGNED NOT NULL,
  `title` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_team`
--

CREATE TABLE `ost_team` (
  `team_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_team`
--

INSERT INTO `ost_team` (`team_id`, `lead_id`, `flags`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2022-07-14 10:31:06', '2022-07-14 10:31:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_team_member`
--

CREATE TABLE `ost_team_member` (
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_thread`
--

CREATE TABLE `ost_thread` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `extra` text,
  `lastresponse` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_thread`
--

INSERT INTO `ost_thread` (`id`, `object_id`, `object_type`, `extra`, `lastresponse`, `lastmessage`, `created`) VALUES
(1, 1, 'T', NULL, NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07'),
(2, 2, 'T', NULL, NULL, '2022-07-14 10:41:54', '2022-07-14 10:41:54'),
(3, 3, 'T', NULL, NULL, '2022-07-14 11:15:45', '2022-07-14 11:15:45'),
(4, 4, 'T', NULL, NULL, '2022-07-14 11:18:17', '2022-07-14 11:18:17'),
(5, 5, 'T', NULL, NULL, '2022-07-14 16:01:22', '2022-07-14 16:01:22'),
(6, 6, 'T', NULL, NULL, '2022-07-15 10:35:11', '2022-07-15 10:35:11'),
(7, 7, 'T', NULL, NULL, '2022-07-21 14:45:21', '2022-07-21 14:45:21'),
(8, 8, 'T', NULL, NULL, '2022-07-21 15:41:52', '2022-07-21 15:41:52'),
(9, 9, 'T', NULL, NULL, '2022-07-21 15:43:11', '2022-07-21 15:43:11'),
(10, 10, 'T', NULL, NULL, '2022-07-21 15:53:31', '2022-07-21 15:53:31'),
(11, 11, 'T', NULL, NULL, '2022-07-21 16:13:34', '2022-07-21 16:13:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_thread_collaborator`
--

CREATE TABLE `ost_thread_collaborator` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_thread_entry`
--

CREATE TABLE `ost_thread_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `poster` varchar(128) NOT NULL DEFAULT '',
  `editor` int(10) UNSIGNED DEFAULT NULL,
  `editor_type` char(1) DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `extra` text,
  `recipients` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_thread_entry`
--

INSERT INTO `ost_thread_entry` (`id`, `pid`, `thread_id`, `staff_id`, `user_id`, `type`, `flags`, `poster`, `editor`, `editor_type`, `source`, `title`, `body`, `format`, `ip_address`, `extra`, `recipients`, `created`, `updated`) VALUES
(1, 0, 1, 0, 1, 'M', 65, 'osTicket Support', NULL, NULL, 'Web', 'osTicket Installed!', ' <p>Thank you for choosing osTicket. </p> <p>Please make sure you join the <a href=\"https://forum.osticket.com\">osTicket forums</a> and our <a href=\"https://osticket.com\">mailing list</a> to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. </p> <p>If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. </p> <p>If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at <a href=\"https://supportsystem.com\">https://supportsystem.com/</a> -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. </p> <p>Cheers, </p> <p>-<br /> osTicket Team https://osticket.com/ </p> <p><strong>PS.</strong> Don\'t just make customers happy, make happy customers! </p>', 'html', '127.0.0.1', NULL, NULL, '2022-07-14 10:31:07', '0000-00-00 00:00:00'),
(2, 0, 2, 0, 2, 'M', 65, 'ffg', NULL, NULL, '', NULL, '<p>fgf</p>', 'html', '127.0.0.1', NULL, NULL, '2022-07-14 10:41:54', '0000-00-00 00:00:00'),
(3, 0, 3, 0, 2, 'M', 65, 'ffg', NULL, NULL, '', NULL, '<p>f</p>', 'html', '127.0.0.1', NULL, NULL, '2022-07-14 11:15:45', '0000-00-00 00:00:00'),
(4, 0, 4, 0, 2, 'M', 65, 'ffg', NULL, NULL, '', NULL, '<p>f</p>', 'html', '127.0.0.1', NULL, NULL, '2022-07-14 11:18:17', '0000-00-00 00:00:00'),
(5, 0, 5, 0, 3, 'M', 65, 'fdf', NULL, NULL, '', NULL, '<p>df</p>', 'html', '127.0.0.1', NULL, NULL, '2022-07-14 16:01:22', '0000-00-00 00:00:00'),
(6, 0, 6, 0, 3, 'M', 65, 'fdf', NULL, NULL, '', NULL, '<p>fg</p>', 'html', '127.0.0.1', NULL, NULL, '2022-07-15 10:35:11', '0000-00-00 00:00:00'),
(7, 0, 7, 0, 4, 'M', 65, 'dsdmsd', NULL, NULL, '', NULL, '<p>sdsd</p>', 'html', '143.255.35.203', NULL, NULL, '2022-07-21 14:45:21', '0000-00-00 00:00:00'),
(8, 0, 8, 0, 5, 'M', 65, 'dsdksdsdk', NULL, NULL, '', NULL, '<p>kjk</p>', 'html', '143.255.35.203', NULL, NULL, '2022-07-21 15:41:52', '0000-00-00 00:00:00'),
(9, 0, 9, 0, 6, 'M', 65, 'fdfdf', NULL, NULL, '', NULL, '<p>fgfg</p>', 'html', '143.255.35.203', NULL, NULL, '2022-07-21 15:43:11', '0000-00-00 00:00:00'),
(10, 0, 10, 0, 7, 'M', 65, 'sdsdsd', NULL, NULL, '', NULL, '<p>sdsdfsd</p> ', 'html', '143.255.35.203', NULL, NULL, '2022-07-21 15:53:31', '0000-00-00 00:00:00'),
(11, 0, 11, 0, 7, 'M', 65, 'sdsdsd', NULL, NULL, '', NULL, '<p>sdsd</p>', 'html', '143.255.35.203', NULL, NULL, '2022-07-21 16:13:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_thread_entry_email`
--

CREATE TABLE `ost_thread_entry_email` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED DEFAULT NULL,
  `mid` varchar(255) NOT NULL,
  `headers` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_thread_entry_merge`
--

CREATE TABLE `ost_thread_entry_merge` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_thread_event`
--

CREATE TABLE `ost_thread_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_type` char(1) NOT NULL DEFAULT '',
  `event_id` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `team_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `data` varchar(1024) DEFAULT NULL COMMENT 'Encoded differences',
  `username` varchar(128) NOT NULL DEFAULT 'SYSTEM',
  `uid` int(11) UNSIGNED DEFAULT NULL,
  `uid_type` char(1) NOT NULL DEFAULT 'S',
  `annulled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_thread_event`
--

INSERT INTO `ost_thread_event` (`id`, `thread_id`, `thread_type`, `event_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `data`, `username`, `uid`, `uid_type`, `annulled`, `timestamp`) VALUES
(1, 1, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 1, 'U', 0, '2022-07-14 10:31:07'),
(2, 2, 'T', 1, 0, 0, 3, 10, NULL, 'SYSTEM', 2, 'U', 0, '2022-07-14 10:41:54'),
(3, 3, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 2, 'U', 0, '2022-07-14 11:15:45'),
(4, 4, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 2, 'U', 0, '2022-07-14 11:18:17'),
(5, 5, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 3, 'U', 0, '2022-07-14 16:01:22'),
(6, 6, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 3, 'U', 0, '2022-07-15 10:35:11'),
(7, 7, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 4, 'U', 0, '2022-07-21 14:45:21'),
(8, 1, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-21 14:46:00'),
(9, 2, 'T', 8, 0, 0, 3, 10, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-21 14:46:00'),
(10, 3, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-21 14:46:00'),
(11, 4, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-21 14:46:00'),
(12, 5, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-21 14:46:00'),
(13, 6, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-21 14:46:00'),
(14, 8, 'T', 1, 0, 0, 1, 2, NULL, 'SYSTEM', 5, 'U', 0, '2022-07-21 15:41:52'),
(15, 9, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 6, 'U', 0, '2022-07-21 15:43:11'),
(16, 10, 'T', 1, 0, 0, 1, 12, NULL, 'SYSTEM', 7, 'U', 0, '2022-07-21 15:53:31'),
(17, 11, 'T', 1, 0, 0, 3, 10, NULL, 'SYSTEM', 7, 'U', 0, '2022-07-21 16:13:34'),
(18, 7, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-26 07:30:21'),
(19, 8, 'T', 8, 0, 0, 1, 2, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-26 07:30:21'),
(20, 9, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-26 07:30:21'),
(21, 10, 'T', 8, 0, 0, 1, 12, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-26 07:30:21'),
(22, 11, 'T', 8, 0, 0, 3, 10, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-26 07:30:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_thread_referral`
--

CREATE TABLE `ost_thread_referral` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket`
--

CREATE TABLE `ost_ticket` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `ticket_pid` int(11) UNSIGNED DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `source_extra` varchar(40) DEFAULT NULL,
  `isoverdue` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `est_duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_ticket`
--

INSERT INTO `ost_ticket` (`ticket_id`, `ticket_pid`, `number`, `user_id`, `user_email_id`, `status_id`, `dept_id`, `sla_id`, `topic_id`, `staff_id`, `team_id`, `email_id`, `lock_id`, `flags`, `sort`, `ip_address`, `source`, `source_extra`, `isoverdue`, `isanswered`, `duedate`, `est_duedate`, `reopened`, `closed`, `lastupdate`, `created`, `updated`) VALUES
(1, NULL, '487540', 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '127.0.0.1', 'Web', NULL, 1, 0, NULL, '2022-07-18 10:31:07', NULL, NULL, '2022-07-14 10:31:07', '2022-07-14 10:31:07', '2022-07-21 14:46:00'),
(2, NULL, '746459', 2, 0, 1, 3, 1, 10, 0, 0, 0, 0, 0, 0, '127.0.0.1', 'Web', NULL, 1, 0, NULL, '2022-07-18 10:41:54', NULL, NULL, '2022-07-14 10:41:54', '2022-07-14 10:41:54', '2022-07-21 14:46:00'),
(3, NULL, '844580', 2, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '127.0.0.1', 'Web', NULL, 1, 0, NULL, '2022-07-18 11:15:45', NULL, NULL, '2022-07-14 11:15:45', '2022-07-14 11:15:45', '2022-07-21 14:46:00'),
(4, NULL, '641149', 2, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '127.0.0.1', 'Web', NULL, 1, 0, NULL, '2022-07-18 11:18:17', NULL, NULL, '2022-07-14 11:18:17', '2022-07-14 11:18:17', '2022-07-21 14:46:00'),
(5, NULL, '108956', 3, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '127.0.0.1', 'Web', NULL, 1, 0, NULL, '2022-07-18 16:01:22', NULL, NULL, '2022-07-14 16:01:22', '2022-07-14 16:01:22', '2022-07-21 14:46:00'),
(6, NULL, '728294', 3, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '127.0.0.1', 'Web', NULL, 1, 0, NULL, '2022-07-19 10:35:11', NULL, NULL, '2022-07-15 10:35:11', '2022-07-15 10:35:11', '2022-07-21 14:46:00'),
(7, NULL, '982931', 4, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 1, 0, NULL, '2022-07-25 14:45:21', NULL, NULL, '2022-07-21 14:45:21', '2022-07-21 14:45:21', '2022-07-26 07:30:21'),
(8, NULL, '902394', 5, 0, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 1, 0, NULL, '2022-07-25 15:41:52', NULL, NULL, '2022-07-21 15:41:52', '2022-07-21 15:41:52', '2022-07-26 07:30:21'),
(9, NULL, '617867', 6, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 1, 0, NULL, '2022-07-25 15:43:11', NULL, NULL, '2022-07-21 15:43:11', '2022-07-21 15:43:11', '2022-07-26 07:30:21'),
(10, NULL, '652722', 7, 0, 1, 1, 1, 12, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 1, 0, NULL, '2022-07-25 15:53:31', NULL, NULL, '2022-07-21 15:53:31', '2022-07-21 15:53:31', '2022-07-26 07:30:21'),
(11, NULL, '653117', 7, 0, 1, 3, 1, 10, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 1, 0, NULL, '2022-07-25 16:13:34', NULL, NULL, '2022-07-21 16:13:34', '2022-07-21 16:13:34', '2022-07-26 07:30:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket_priority`
--

CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_ticket_priority`
--

INSERT INTO `ost_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket_status`
--

CREATE TABLE `ost_ticket_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_ticket_status`
--

INSERT INTO `ost_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{\"description\":\"Open tickets.\"}', '2022-07-14 10:31:06', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}', '2022-07-14 10:31:06', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}', '2022-07-14 10:31:06', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}', '2022-07-14 10:31:06', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}', '2022-07-14 10:31:06', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket__cdata`
--

CREATE TABLE `ost_ticket__cdata` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `subject` mediumtext,
  `priority` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_ticket__cdata`
--

INSERT INTO `ost_ticket__cdata` (`ticket_id`, `subject`, `priority`) VALUES
(1, 'osTicket Installed!', NULL),
(2, 'fg', '2'),
(3, 'f', '2'),
(4, 'f', '2'),
(5, 'df', '2'),
(6, 'fg', '2'),
(7, 'dsd', '2'),
(8, 'jk', '1'),
(9, 'fgfg', '2'),
(10, 'sadsd', '2'),
(11, 'sadsd', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_translation`
--

CREATE TABLE `ost_translation` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_hash` char(16) CHARACTER SET ascii DEFAULT NULL,
  `type` enum('phrase','article','override') DEFAULT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `revision` int(11) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `source_text` text,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_user`
--

CREATE TABLE `ost_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_user`
--

INSERT INTO `ost_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(1, 1, 1, 0, 'osTicket Support', '2022-07-14 10:31:07', '2022-07-14 10:31:08'),
(2, 0, 2, 0, 'ffg', '2022-07-14 10:41:54', '2022-07-14 10:41:54'),
(3, 0, 3, 0, 'fdf', '2022-07-14 16:01:22', '2022-07-14 16:01:22'),
(4, 0, 4, 0, 'dsdmsd', '2022-07-21 14:45:21', '2022-07-21 14:45:21'),
(5, 0, 5, 0, 'dsdksdsdk', '2022-07-21 15:41:52', '2022-07-21 15:41:52'),
(6, 0, 6, 0, 'fdfdf', '2022-07-21 15:43:11', '2022-07-21 15:43:11'),
(7, 0, 7, 0, 'sdsdsd', '2022-07-21 15:53:31', '2022-07-21 15:53:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_user_account`
--

CREATE TABLE `ost_user_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `timezone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `extra` text,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_user_email`
--

CREATE TABLE `ost_user_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_user_email`
--

INSERT INTO `ost_user_email` (`id`, `user_id`, `flags`, `address`) VALUES
(1, 1, 0, 'support@osticket.com'),
(2, 2, 0, 'jfg@fgfh.com'),
(3, 3, 0, 'j@gfdf.com'),
(4, 4, 0, 'jfs@gmail.com'),
(5, 5, 0, 'jfp@gmail.com'),
(6, 6, 0, 'hfgf@gmail.com'),
(7, 7, 0, 'jpaz@grupo.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_user__cdata`
--

CREATE TABLE `ost_user__cdata` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `email` mediumtext,
  `name` mediumtext,
  `phone` mediumtext,
  `notes` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_user__cdata`
--

INSERT INTO `ost_user__cdata` (`user_id`, `email`, `name`, `phone`, `notes`) VALUES
(2, NULL, NULL, '', ''),
(3, NULL, NULL, '', ''),
(4, NULL, NULL, NULL, ''),
(5, NULL, NULL, NULL, ''),
(6, NULL, NULL, NULL, ''),
(7, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost__search`
--

CREATE TABLE `ost__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `title` text,
  `content` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost__search`
--

INSERT INTO `ost__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('U', 2, 'ffg', ' jfg@fgfh.com\njfg@fgfh.com'),
('T', 2, '746459 fg', 'fg'),
('H', 2, '', 'fgf'),
('T', 3, '844580 f', 'f'),
('H', 3, '', 'f'),
('T', 4, '641149 f', 'f'),
('H', 4, '', 'f'),
('U', 3, 'fdf', ' j@gfdf.com\nj@gfdf.com'),
('T', 5, '108956 df', 'df'),
('H', 5, '', 'df'),
('T', 6, '728294 fg', 'fg'),
('H', 6, '', 'fg'),
('H', 1, 'osTicket Installed!', 'Thank you for choosing osTicket. Please make sure you join the osTicket forums and our mailing list to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at https://supportsystem.com/ -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. Cheers, - osTicket Team https://osticket.com/ PS. Don\'t just make customers happy, make happy customers!'),
('T', 1, '487540 osTicket Installed!', 'osTicket Installed!'),
('U', 1, 'osTicket Support', 'support@osticket.com'),
('O', 1, 'osTicket', ''),
('U', 4, 'dsdmsd', ' jfs@gmail.com\njfs@gmail.com'),
('T', 7, '982931 dsd', 'dsd'),
('H', 7, '', 'sdsd'),
('U', 5, 'dsdksdsdk', ' jfp@gmail.com\njfp@gmail.com'),
('T', 8, '902394 jk', 'jk'),
('H', 8, '', 'kjk'),
('U', 6, 'fdfdf', ' hfgf@gmail.com\nhfgf@gmail.com'),
('T', 9, '617867 fgfg', 'fgfg'),
('H', 9, '', 'fgfg'),
('U', 7, 'sdsdsd', ' jpaz@grupo.com\njpaz@grupo.com'),
('T', 10, '652722 sadsd', 'sadsd'),
('H', 10, '', 'sdsdfsd'),
('T', 11, '653117 sadsd', 'sadsd'),
('H', 11, '', 'sdsd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_api_key`
--

CREATE TABLE `os_api_key` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_attachment`
--

CREATE TABLE `os_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inline` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_attachment`
--

INSERT INTO `os_attachment` (`id`, `object_id`, `type`, `file_id`, `name`, `inline`, `lang`) VALUES
(1, 1, 'C', 2, NULL, 0, NULL),
(2, 8, 'T', 1, NULL, 1, NULL),
(3, 9, 'T', 1, NULL, 1, NULL),
(4, 10, 'T', 1, NULL, 1, NULL),
(5, 11, 'T', 1, NULL, 1, NULL),
(6, 12, 'T', 1, NULL, 1, NULL),
(7, 13, 'T', 1, NULL, 1, NULL),
(8, 14, 'T', 1, NULL, 1, NULL),
(9, 16, 'T', 1, NULL, 1, NULL),
(10, 17, 'T', 1, NULL, 1, NULL),
(11, 18, 'T', 1, NULL, 1, NULL),
(12, 19, 'T', 1, NULL, 1, NULL),
(14, 11, 'H', 3, NULL, 1, NULL),
(17, 12, 'H', 4, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_canned_response`
--

CREATE TABLE `os_canned_response` (
  `canned_id` int(10) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_canned_response`
--

INSERT INTO `os_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an\nattractive alternative to higher-cost and complex customer support\nsystems - simple, lightweight, reliable, open source, web-based and easy\nto setup and use.', 'en_US', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first},\n<br>\n<br>\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in\n%{ticket.dept.name} department.', 'en_US', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_config`
--

CREATE TABLE `os_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_config`
--

INSERT INTO `os_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'informacion@grupolitoral.com', '2022-08-08 16:36:35'),
(2, 'core', 'helpdesk_url', 'http://grupolitoralticketit.digital/soporte/', '2022-07-20 21:18:30'),
(3, 'core', 'helpdesk_title', 'IT Soporte', '2022-08-05 20:24:54'),
(4, 'core', 'schema_signature', 'c37e165651dc289240fee7d244990ac1', '2022-07-20 21:18:30'),
(5, 'schedule.1', 'configuration', '{\"holidays\":[4]}', '2022-07-20 21:18:30'),
(6, 'core', 'time_format', 'hh:mm a', '2022-07-20 21:18:30'),
(7, 'core', 'date_format', 'MM/dd/y', '2022-07-20 21:18:30'),
(8, 'core', 'datetime_format', 'MM/dd/y h:mm a', '2022-07-20 21:18:30'),
(9, 'core', 'daydatetime_format', 'EEE, MMM d y h:mm a', '2022-07-20 21:18:30'),
(10, 'core', 'default_priority_id', '2', '2022-07-20 21:18:30'),
(11, 'core', 'enable_daylight_saving', '', '2022-07-20 21:18:30'),
(12, 'core', 'reply_separator', '-- reply above this line --', '2022-07-20 21:18:30'),
(13, 'core', 'isonline', '1', '2022-07-20 21:18:30'),
(14, 'core', 'staff_ip_binding', '', '2022-07-20 21:18:30'),
(15, 'core', 'staff_max_logins', '4', '2022-07-20 21:18:30'),
(16, 'core', 'staff_login_timeout', '2', '2022-07-20 21:18:30'),
(17, 'core', 'staff_session_timeout', '30', '2022-07-20 21:18:30'),
(18, 'core', 'passwd_reset_period', '', '2022-07-20 21:18:30'),
(19, 'core', 'client_max_logins', '4', '2022-07-20 21:18:30'),
(20, 'core', 'client_login_timeout', '2', '2022-07-20 21:18:30'),
(21, 'core', 'client_session_timeout', '30', '2022-07-20 21:18:30'),
(22, 'core', 'max_page_size', '25', '2022-07-20 21:18:30'),
(23, 'core', 'max_open_tickets', '20', '2022-08-10 22:43:48'),
(24, 'core', 'autolock_minutes', '3', '2022-07-20 21:18:30'),
(25, 'core', 'default_smtp_id', '0', '2022-08-08 16:02:37'),
(26, 'core', 'use_email_priority', '', '2022-07-20 21:18:30'),
(27, 'core', 'enable_kb', '', '2022-07-20 21:18:30'),
(28, 'core', 'enable_premade', '1', '2022-07-20 21:18:30'),
(29, 'core', 'enable_captcha', '', '2022-07-20 21:18:30'),
(30, 'core', 'enable_auto_cron', '', '2022-07-20 21:18:30'),
(31, 'core', 'enable_mail_polling', '', '2022-07-20 21:18:30'),
(32, 'core', 'send_sys_errors', '0', '2022-08-10 22:43:48'),
(33, 'core', 'send_sql_errors', '1', '2022-07-20 21:18:30'),
(34, 'core', 'send_login_errors', '1', '2022-07-20 21:18:30'),
(35, 'core', 'save_email_headers', '1', '2022-07-20 21:18:30'),
(36, 'core', 'strip_quoted_reply', '1', '2022-07-20 21:18:30'),
(37, 'core', 'ticket_autoresponder', '1', '2022-08-10 22:46:11'),
(38, 'core', 'message_autoresponder', '', '2022-07-20 21:18:30'),
(39, 'core', 'ticket_notice_active', '1', '2022-07-20 21:18:30'),
(40, 'core', 'ticket_alert_active', '1', '2022-07-20 21:18:30'),
(41, 'core', 'ticket_alert_admin', '1', '2022-07-20 21:18:30'),
(42, 'core', 'ticket_alert_dept_manager', '1', '2022-07-20 21:18:30'),
(43, 'core', 'ticket_alert_dept_members', '', '2022-07-20 21:18:30'),
(44, 'core', 'message_alert_active', '1', '2022-07-20 21:18:30'),
(45, 'core', 'message_alert_laststaff', '1', '2022-07-20 21:18:30'),
(46, 'core', 'message_alert_assigned', '1', '2022-07-20 21:18:30'),
(47, 'core', 'message_alert_dept_manager', '', '2022-07-20 21:18:30'),
(48, 'core', 'note_alert_active', '1', '2022-08-10 22:46:11'),
(49, 'core', 'note_alert_laststaff', '1', '2022-07-20 21:18:30'),
(50, 'core', 'note_alert_assigned', '1', '2022-07-20 21:18:30'),
(51, 'core', 'note_alert_dept_manager', '', '2022-07-20 21:18:30'),
(52, 'core', 'transfer_alert_active', '0', '2022-08-10 22:43:48'),
(53, 'core', 'transfer_alert_assigned', '', '2022-07-20 21:18:30'),
(54, 'core', 'transfer_alert_dept_manager', '1', '2022-07-20 21:18:30'),
(55, 'core', 'transfer_alert_dept_members', '', '2022-07-20 21:18:30'),
(56, 'core', 'overdue_alert_active', '1', '2022-07-20 21:18:30'),
(57, 'core', 'overdue_alert_assigned', '1', '2022-07-20 21:18:30'),
(58, 'core', 'overdue_alert_dept_manager', '1', '2022-07-20 21:18:30'),
(59, 'core', 'overdue_alert_dept_members', '', '2022-07-20 21:18:30'),
(60, 'core', 'assigned_alert_active', '1', '2022-07-20 21:18:30'),
(61, 'core', 'assigned_alert_staff', '1', '2022-07-20 21:18:30'),
(62, 'core', 'assigned_alert_team_lead', '', '2022-07-20 21:18:30'),
(63, 'core', 'assigned_alert_team_members', '', '2022-07-20 21:18:30'),
(64, 'core', 'auto_claim_tickets', '1', '2022-07-20 21:18:30'),
(65, 'core', 'auto_refer_closed', '1', '2022-07-20 21:18:30'),
(66, 'core', 'collaborator_ticket_visibility', '1', '2022-07-20 21:18:30'),
(67, 'core', 'require_topic_to_close', '', '2022-07-20 21:18:30'),
(68, 'core', 'show_related_tickets', '0', '2022-08-10 22:43:48'),
(69, 'core', 'show_assigned_tickets', '1', '2022-07-20 21:18:30'),
(70, 'core', 'show_answered_tickets', '', '2022-07-20 21:18:30'),
(71, 'core', 'hide_staff_name', '', '2022-07-20 21:18:30'),
(72, 'core', 'disable_agent_collabs', '', '2022-07-20 21:18:30'),
(73, 'core', 'overlimit_notice_active', '', '2022-07-20 21:18:30'),
(74, 'core', 'email_attachments', '1', '2022-07-20 21:18:30'),
(75, 'core', 'ticket_number_format', '#', '2022-08-10 22:43:48'),
(76, 'core', 'ticket_sequence_id', '1', '2022-08-10 22:43:48'),
(77, 'core', 'queue_bucket_counts', '', '2022-07-20 21:18:30'),
(78, 'core', 'allow_external_images', '1', '2022-08-10 22:43:48'),
(79, 'core', 'task_number_format', '#', '2022-07-20 21:18:30'),
(80, 'core', 'task_sequence_id', '1', '2022-08-10 22:47:01'),
(81, 'core', 'log_level', '2', '2022-07-20 21:18:30'),
(82, 'core', 'log_graceperiod', '12', '2022-07-20 21:18:30'),
(83, 'core', 'client_registration', 'public', '2022-07-20 21:18:30'),
(84, 'core', 'default_ticket_queue', '1', '2022-07-20 21:18:30'),
(85, 'core', 'embedded_domain_whitelist', 'youtube.com, dailymotion.com, vimeo.com, player.vimeo.com, web.microsoftstream.com', '2022-07-20 21:18:30'),
(86, 'core', 'max_file_size', '33554432', '2022-08-10 22:38:55'),
(87, 'core', 'landing_page_id', '1', '2022-07-20 21:18:30'),
(88, 'core', 'thank-you_page_id', '2', '2022-07-20 21:18:30'),
(89, 'core', 'offline_page_id', '3', '2022-07-20 21:18:30'),
(90, 'core', 'system_language', 'es_ES', '2022-08-05 16:35:19'),
(91, 'mysqlsearch', 'reindex', '0', '2022-07-20 22:47:24'),
(92, 'core', 'default_email_id', '1', '2022-07-20 21:18:30'),
(93, 'core', 'alert_email_id', '0', '2022-08-08 16:48:28'),
(94, 'core', 'default_dept_id', '1', '2022-07-20 21:18:30'),
(95, 'core', 'default_sla_id', '1', '2022-07-20 21:18:30'),
(96, 'core', 'schedule_id', '1', '2022-07-20 21:18:30'),
(97, 'core', 'default_template_id', '1', '2022-07-20 21:18:30'),
(98, 'core', 'default_timezone', 'America/Guatemala', '2022-08-08 17:06:49'),
(99, 'core', 'default_storage_bk', 'D', '2022-07-21 16:51:31'),
(100, 'core', 'force_https', '', '2022-07-21 16:51:31'),
(101, 'core', 'date_formats', '24', '2022-08-08 17:06:49'),
(102, 'core', 'default_locale', '', '2022-07-21 16:51:31'),
(103, 'core', 'secondary_langs', '', '2022-07-21 16:51:31'),
(104, 'core', 'enable_avatars', '1', '2022-07-21 16:51:31'),
(105, 'core', 'enable_richtext', '1', '2022-07-21 16:51:31'),
(106, 'core', 'files_req_auth', '0', '2022-08-10 22:38:55'),
(107, 'core', 'allow_iframes', '', '2022-07-21 16:51:31'),
(108, 'core', 'acl', '', '2022-07-21 16:51:31'),
(109, 'core', 'acl_backend', '0', '2022-07-21 16:51:38'),
(110, 'core', 'verify_email_addrs', '1', '2022-08-08 16:02:37'),
(111, 'core', 'accept_unregistered_email', '1', '2022-08-08 16:02:37'),
(112, 'core', 'add_email_collabs', '1', '2022-08-08 16:02:37'),
(113, 'core', 'message_autoresponder_collabs', '1', '2022-08-10 22:43:48'),
(114, 'core', 'ticket_alert_acct_manager', '', '2022-08-10 22:43:48'),
(115, 'core', 'message_alert_acct_manager', '', '2022-08-10 22:43:48'),
(116, 'core', 'default_help_topic', '0', '2022-08-10 22:43:48'),
(117, 'core', 'default_ticket_status_id', '1', '2022-08-10 22:43:48'),
(118, 'core', 'allow_client_updates', '', '2022-08-10 22:43:48'),
(119, 'core', 'ticket_lock', '2', '2022-08-10 22:43:48'),
(120, 'core', 'default_task_priority_id', '1', '2022-08-10 22:47:01'),
(121, 'core', 'default_task_sla_id', '', '2022-08-10 22:47:01'),
(122, 'core', 'task_alert_active', '1', '2022-08-10 22:47:51'),
(123, 'core', 'task_alert_admin', '1', '2022-08-10 22:47:51'),
(124, 'core', 'task_alert_dept_manager', '', '2022-08-10 22:47:01'),
(125, 'core', 'task_alert_dept_members', '', '2022-08-10 22:47:01'),
(126, 'core', 'task_activity_alert_active', '0', '2022-08-10 22:47:01'),
(127, 'core', 'task_activity_alert_laststaff', '', '2022-08-10 22:47:01'),
(128, 'core', 'task_activity_alert_assigned', '', '2022-08-10 22:47:01'),
(129, 'core', 'task_activity_alert_dept_manager', '', '2022-08-10 22:47:01'),
(130, 'core', 'task_assignment_alert_active', '0', '2022-08-10 22:47:01'),
(131, 'core', 'task_assignment_alert_staff', '', '2022-08-10 22:47:01'),
(132, 'core', 'task_assignment_alert_team_lead', '', '2022-08-10 22:47:01'),
(133, 'core', 'task_assignment_alert_team_members', '', '2022-08-10 22:47:01'),
(134, 'core', 'task_transfer_alert_active', '0', '2022-08-10 22:47:01'),
(135, 'core', 'task_transfer_alert_assigned', '', '2022-08-10 22:47:01'),
(136, 'core', 'task_transfer_alert_dept_manager', '', '2022-08-10 22:47:01'),
(137, 'core', 'task_transfer_alert_dept_members', '', '2022-08-10 22:47:01'),
(138, 'core', 'task_overdue_alert_active', '0', '2022-08-10 22:47:01'),
(139, 'core', 'task_overdue_alert_assigned', '', '2022-08-10 22:47:01'),
(140, 'core', 'task_overdue_alert_dept_manager', '', '2022-08-10 22:47:01'),
(141, 'core', 'task_overdue_alert_dept_members', '', '2022-08-10 22:47:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_content`
--

CREATE TABLE `os_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_content`
--

INSERT INTO `os_content` (`id`, `isactive`, `type`, `name`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'landing', 'Landing', '<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>', 'The Landing Page refers to the content of the Customer Portal\'s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\r\n<br>\r\n<br>\r\nGracias por contactarnos\r\n<br>\r\n<br>\r\nSe ha creado una solicitud de ticket de soporte.\r\n<br>\r\nDepartamento de IT GL se contactara con usted.\r\n</p>\r\n<br>\r\n<br>\r\nEquipo Soporte Grupo Litoral\r\n</div>', 'This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(3, 1, 'offline', 'Offline', '<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(4, 1, 'registration-staff', 'Welcome to osTicket', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System<br /> %{company.name}</em> </div>', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(5, 1, 'pwreset-staff', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(6, 1, 'banner-staff', 'Authentication Required', '', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br/> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(11, 1, 'registration-thanks', 'Account Confirmed!', '<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(13, 1, 'email2fa-staff', 'osTicket Two Factor Authentication', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> You have just logged into for the helpdesk at %{url}.<br /> <br /> Use the verification code below to finish logging into the helpdesk.<br /> <br /> %{otp}<br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who use Email for Two Factor Authentication', '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_department`
--

CREATE TABLE `os_department` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `tpl_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `manager_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(128) NOT NULL DEFAULT '/',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_department`
--

INSERT INTO `os_department` (`id`, `pid`, `tpl_id`, `sla_id`, `schedule_id`, `email_id`, `autoresp_email_id`, `manager_id`, `flags`, `name`, `signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `path`, `updated`, `created`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 0, 4, 'Support', 'Support Department', 1, 1, 1, 1, '/1/', '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(3, NULL, 0, 0, 0, 0, 0, 0, 4, 'Maintenance', 'Maintenance Department', 1, 0, 1, 1, '/3/', '2022-07-20 14:18:29', '2022-07-20 14:18:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_draft`
--

CREATE TABLE `os_draft` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_draft`
--

INSERT INTO `os_draft` (`id`, `staff_id`, `namespace`, `body`, `extra`, `created`, `updated`) VALUES
(12, 1, 'ticket.response.11', '<p>dwwewew</p>\n<p><br></p><blockquote> <p><br></p></blockquote>\n<p><br></p>', NULL, '2022-08-11 16:35:15', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_email`
--

CREATE TABLE `os_email` (
  `email_id` int(11) UNSIGNED NOT NULL,
  `noautoresp` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(11) UNSIGNED NOT NULL DEFAULT '2',
  `dept_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_folder` varchar(255) DEFAULT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth_creds` int(11) DEFAULT '0',
  `smtp_userid` varchar(255) NOT NULL,
  `smtp_userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `smtp_spoofing` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_email`
--

INSERT INTO `os_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `userid`, `userpass`, `mail_active`, `mail_host`, `mail_protocol`, `mail_encryption`, `mail_folder`, `mail_port`, `mail_fetchfreq`, `mail_fetchmax`, `mail_archivefolder`, `mail_delete`, `mail_errors`, `mail_lasterror`, `mail_lastfetch`, `smtp_active`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_auth_creds`, `smtp_userid`, `smtp_userpass`, `smtp_spoofing`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'jpaz@grupolitoral.com', 'Support', 'jpaz@grupolitoral.com', '', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2022-07-20 14:18:30', '2022-08-08 09:41:15'),
(2, 0, 2, 1, 0, 'alerts@gmail.com', 'osTicket Alerts', 'alerts@gmail.com', '$2$JDEkiK/PQiWgDAqHsfRLSyG3YV5EtCrcctJmuRChe3s+ubU=', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2022-07-20 14:18:30', '2022-08-08 09:40:53'),
(3, 0, 2, 1, 0, 'noreply@installatron.com', '', '', '', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_email_account`
--

CREATE TABLE `os_email_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `protocol` varchar(64) NOT NULL DEFAULT '',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `options` varchar(512) DEFAULT NULL,
  `errors` int(11) UNSIGNED DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastconnect` timestamp NULL DEFAULT NULL,
  `lasterror` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_email_template`
--

CREATE TABLE `os_email_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `tpl_id` int(11) UNSIGNED NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_email_template`
--

INSERT INTO `os_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or information, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(3, 1, 'message.autoresp', 'Message Confirmation', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> has been noted <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%%7Brecipient.ticket_link%7D\">online here</a></em> </div>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> %{response} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', '<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D\">login to our helpdesk</a>. <br /> <br /> Thank you,<br /> Support Ticket System', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on ticket <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(8, 1, 'ticket.alert', 'New Ticket Alert', '<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(9, 1, 'message.alert', 'New Message Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{poster.name} </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(10, 1, 'note.alert', 'New Internal Activity Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{note.poster} </td> </tr> <tr><td><strong>Title</strong>: </td> <td>%{note.title} </td> </tr> </tbody> </table> <br /> %{note.message} <br /> <br /> <hr /> To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system <br /> <br /> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} </td> </tr> <tr><td><strong>Subject</strong>: </td> <td>%{ticket.subject} </td> </tr> </tbody> </table> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', '<h3>Hi %{recipient.name},</h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(14, 1, 'task.alert', 'New Task Alert', '<h2>Hi %{recipient.name},</h2> New task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> created <br /> <br /> <table><tbody><tr><td><strong>Department</strong>: </td> <td>%{task.dept.name} </td> </tr> </tbody> </table> <br /> %{task.description} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(15, 1, 'task.activity.notice', 'Re: %{task.title} [#%{task.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a task in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on task #%{task.number}. To participate, simply reply to this email.</em> </div>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(16, 1, 'task.activity.alert', 'Task Activity [#%{task.number}] - %{activity.title}', '<h3><strong>Hi %{recipient.name},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> updated: %{activity.description} <br /> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(17, 1, 'task.assignment.alert', 'Task Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(18, 1, 'task.transfer.alert', 'Task #%{task.number} transfer - %{task.dept.name}', '<h3>Hi %{recipient.name},</h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been transferred to the %{task.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(19, 1, 'task.overdue.alert', 'Stale Task Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A task, <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tasks are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{task.dept.manager.name} <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system. You\'re receiving this notice because the task is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_email_template_group`
--

CREATE TABLE `os_email_template_group` (
  `tpl_id` int(11) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_email_template_group`
--

INSERT INTO `os_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'osTicket Default Template (HTML)', 'en_US', 'Default osTicket templates', '2022-07-20 14:18:30', '2022-07-20 21:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_event`
--

CREATE TABLE `os_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_event`
--

INSERT INTO `os_event` (`id`, `name`, `description`) VALUES
(1, 'created', NULL),
(2, 'closed', NULL),
(3, 'reopened', NULL),
(4, 'assigned', NULL),
(5, 'released', NULL),
(6, 'transferred', NULL),
(7, 'referred', NULL),
(8, 'overdue', NULL),
(9, 'edited', NULL),
(10, 'viewed', NULL),
(11, 'error', NULL),
(12, 'collab', NULL),
(13, 'resent', NULL),
(14, 'deleted', NULL),
(15, 'merged', NULL),
(16, 'unlinked', NULL),
(17, 'linked', NULL),
(18, 'login', NULL),
(19, 'logout', NULL),
(20, 'message', NULL),
(21, 'note', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_faq`
--

CREATE TABLE `os_faq` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_faq_category`
--

CREATE TABLE `os_faq_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_pid` int(10) UNSIGNED DEFAULT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_faq_topic`
--

CREATE TABLE `os_faq_topic` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_file`
--

CREATE TABLE `os_file` (
  `id` int(11) NOT NULL,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_file`
--

INSERT INTO `os_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2022-07-20 14:18:30'),
(2, 'T', 'D', 'text/plain', 24, 'qIfT2MWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2022-07-20 14:18:30'),
(3, 'T', 'D', 'image/jpeg', 37035, 'bNojnrq6FGG_kO6VDrcKIn8WLFQxQRNQ', 'rq6FGG_kO6VDrcKIlKnsmRsSVttT35IH', 'fondo.jpg', NULL, '2022-08-11 09:24:58'),
(4, 'T', 'D', 'image/png', 54674, 'IEbHtFf65cqomkt-u8TmCoISOtBEbvUY', 'Ff65cqomkt-u8TmCYdcVf0IeVDT1c6qE', 'ost-logo.png', NULL, '2022-08-11 09:31:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_file_chunk`
--

CREATE TABLE `os_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_file_chunk`
--

INSERT INTO `os_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21);
INSERT INTO `os_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(3, 0, 0xffd8ffe000104a46494600010100000100010000ffdb0084000f0f0f0f100f11131311181917191823201d1d20233526282628263550323a32323a3250475646414656477f645858647f937b757b93b29f9fb2e0d4e0ffffff010f0f0f0f100f11131311181917191823201d1d20233526282628263550323a32323a3250475646414656477f645858647f937b757b93b29f9fb2e0d4e0ffffffffc200110802aa040003012200021101031101ffc4001b00000203010101000000000000000000000001020304050607ffda0008010100000000e84afb6c9b70a53025394e526c63726c060015830180263013130403400c88c5390000200001000001112492518c791a2eb252215260a7394e526363726c060085018c0183103100c10260260d046c900002000010000009092494631e6dd6ce45748da27394a526d8c949b001092018306988634000034009800a42730000400000200001084946318c71ced914c018a764dca4c6d92936249086000c6000031a04da681a645a6c10294c0000100000080400084a35a8acb3994406c72b26dc9b631c86249363006863690da71902920189886806218873000001000020400002128c528e69c73c46c94ec9b72628c0d0454db6801b00189b4c0c98a729dda980d0310d0c010d0e60000008010024922c0010a314a34559936c9d964d8a15564e76e8ac574810301800c60979ef39cbd3374eaecfa0df262602180002682c000010008492063698d0088c528f3b212949cacb0842b80e5769993822e902180369898c399e3b9f0af2d9a2b76f5fd575d8009826002602b00040021240d8c0103040250147cf926e76ceccb43727272b3432e8a8db60000360260cc5e172e7cb6d71b89d77d9ecbd2000000000022c1002120631a000010c04094525c74a2ecb2d31424db6dcad8d3d29119cc180360026197c47295138ca101d9273f7ddb6800006800113692018c00010000218080514950462a223257264631a23727ddb08da0c180c00191f9ee0a215905209ce507d3fa6000000000012711800000008000430040a292ac4118c23933d708d6357597e8d16d9291201a600c00c3f39965b32450e4d909bb3e87db000010c04c44da18080000010002180084925588128432e2c30d16df7dd39489ced6360c01a1801e77c7a866aa70009838dfe8bdd8002609880689b4a40020000010008600208a4a0204a10a9d50b6536129372b018c01830008fcfb2d596a9564822e0592b75fd36c6240c111260256355da00080000100026000851140108842b06c6c1b90ec6031a60c01a33fcee8ae8942a80c4dab2f2efa0f5813132bcf44f5d889256350b00000040002004c00049251102231a863060e432c69b1b1b12060723c7184cae1144a55a76da5beb7d50204e35e2e7f57593422d924c0000010000804c00022928880495486c1836129c890db0692000f3bc4eb71f999eaa2d8bd3aa55678b25dcf780240a59b9bbaeba5058766991190000000200100980004523049ca4db55a4c18db072b24c1849ca104024b8193b9c6e472aa57dfa346abade571a3137fd14931b02ae7e3bfad30c7aaf9aaad62000000400084c0002285c609df2b6c70ac01b9363912949b9d8c8c3266a297d511cdcfd6c9caa306e9dd249ac1c2a52ea7abeacc6d811e69ccedeb855976e9990980800004000208c909249288b00a5a5ced9420c6200760efbe4c610e4f273d32bb5760157cfe953546b8c6108452a3898e1777177fac31811e5cf9fbf7d5473fa3d399190020000162e6e9d292492000000a84f4b95d38d6802565939dd82cd1390269723994556d967604470ecaea50856555c04e34f9edbaadedf5db002196695b1cd8efed4c8c80040067e471f954e6b3dcef001092492492627a895f6c71ad56cdcec9aaecc4b53b013ae7cbe1e5aa32c5ecef4460a355705055c211276cbceebe7ddebba0c0114cde7270cf23a371190020ab93c6e3e08bb7a5cd8fa2f5b18c546318c546318c610abb9389712bae58eaea5c22531196ada39008e57944e1673bd9eb4462a34d7022ab82841cace690d1e9ef1b519574592815536dd64ed69810e5f1b8fca81775f6eceaf1fcdd1afd6e0aea863a2aa61542b8c651943ec35d5294a76deb2d1d3b890a40f351bc84a40479de4ebb25ad772c446312aaab8b8c6acfc9cef7f49678f5faf2522343816bc9649bd41311cde3f1f93496747a7d3e874b1a970b83cfd1e87c3c5090030061f5ea71d55d37efeacb3e6e8dee60015d5a55529b8b30f2d8416fb1118d2a3557075d5cae5593d1ab6bcf8b77a8903552458ab09cf48b2f1f8bc7a4b7a3d7e9ebdd9a32a556b071f917fa5f08d56c40d0001f5f966ccb32e87567465dfa1cc002bab4aa4b644639f8f9334345bd5b90a10f3d5e89c5e3e4e0af7efd575e66e053edfae57649c6119d561559562e3f1f016dfd4edf4b550514a9cafb05c7e371e7eafc1d4204020007f60b33668f3e5d2eadb464dda5cc055d9562e89546db111cfc9c995ed5bb4244651f3be67a7d1d7c7c979aadb09c33e5f2ded3add78a9ceb114955278ac3669d1d3d3a55f9f060e777bd0ce5218f97c2e42f5be1738030102623ebf7519d73d747a77558f66a60322578b7ca31b26354f1a16861d1d28045ba79583ada39392f65b545c2bcdc8ddd7ed74604e043811e8e1db462f2fdce855669679ccf4a8fa6f4829b039fe7f9157aff11990000086887d874568892bafab1ead6e4c00860e84843055796cedbc9bfbb108c859f1eb7caca5b28d55b827c5c7eb68f5449a943cb59d5e475a59fcedfdfd7b5e0ab8399530ed7a42bb24063f3dc9cbebfc76348939cecb276593b2c9fb2b393955f65dd2d55e2d3b1b90011e7f4240002f37041857a588424eac83bf998b369d11aaaaea5af9183d3e6dddcbe049f021d4b359cde05bec546797271b29cfafb9ea1d658ca6bf39ceafd2e78db64e6d8249203b36f063b3a6f3e9d70c57ed631811c1b6d000179ec55c4ae5e92215ca1c0bba345d9f363ab610af1d16abb8ddfa0dfde909d34dd7eaaf9fe7e1ed929d18b91923873f7fbce9d72915c7cdf3b6f43a0849249249203b36f9baba1d5967d1ba18eddb272000e7f400000e1e294acb2ebab165860e76bd575f970f38e9d74d7cdab573bd171ba7546fd7a5cb45d6d37ea860e264f71283ae8e262c986528f6bd1de0cafcde0bf6f55092492494403b36f94e0753d4599f674a38e7ba4e400183730000e764a6981774e8e4d31a69cfd6a3af0e7f233eab216d78214efdf8b4d51be2ee775d2bfa97c797c8c9ed9b9575f0b0f370dc2ebfa9b4023e730e6ec765212492494441dab7ca793d5ed74e6ddd55925b66e40018f6000018304acc54ca1ce37d14618759c4bf9f565849acb9a3eb39a3846cb6bbc773aefef5d839183d85cc951c5e75708c23bfd24e602f37838fe87bc92124924a280ed5be77c8eaf55ab3ecec990db63900065be600015548e3e2ceeaa75df939d5f435e4b3a7cde5ab8793955f77afc4d514a56556ca765759b7d1d5c7e37b3be2edcb832cf8b18475fa7b801799c9c5edfa44909251494520ee5b930bd76b9ef33437584c0033dec0002ba71f373d5546345fb7263ab7592e4f6a5912865e151d5ef65a25244e759658f0e8957ea6ee172bd86ba2c9d38f059c48d755feba1a805e633713afe9d24a2945249207dcb2c973f9eaed9d479ebdb693000a6730000ab899214d2a950b36d5923b24b2e3f49868ab1722aba1ea71cc9a0cd5e8d161cbda55eb7479ee3f4f5e0218f975c614c56afa6e9011e632f1fabe944084a2928a03b764e7c7e64a3d3edce8a375c4c00211b40003938f065beb586459a2a2bd6677cde9f1678b26b32d7afa7a08e39ad34dba5d19edaeeeef4bcf7154f9b38599db8d305677dece82a3abc5cbcde8fa74928d75550a69a6aa69aa7f499db2e467d38eeef5b463e86824c008d770001879d9f0e0d938e08596cecc986bea46ea783c6f41c9bb5a9e58f758c2e5597ac93cb64fa7dee170ae798808d15e3a68ad47b3ed35434f9dc1867eae108793c94c134376db934fd5676cb93cadd92df497539b5e8730002ab4002be3e5cf4f2f65cf2e2badba66779ec9bc7e5b6966dbace3edd23b243216278659f566ed77fccf33422318273b31d0f9ce5b7deec0f3dc9cd4fb14a3e1e9caecb2531db1c76fd6276cb9b8fa54d7d6be9cfa74b98002858001cac54657c8bf4cd73257dcd4e1542728f0f93b7a1be51e374e3294a4285b14f972b336be9f6b99e7758a0946d8e8cdc3b77d78b4fd075070787466f6aa31f1d4e08d9314063bfeb12ba5879bd6a73f5b4d5974ea7300054de0064e4e78679f263ba56f3f3edb5d560ab1ba3cc9dcd73a39fadc9b6eab5556518eb85b7cfb5abce661e7dfcfc7337e02fc55d96fd1f6e78f2fce539fdaa50f23cf72b745cb5d9203db4ae963f39d8aa1dcd55e4d1adcc00167d2010e2e6af3258b36bbaca799bef7836840038b8ba3a74e12e60dd574689cb0c2bbea3a1b6cf2f973bea7a1f1f766aad2dbb2def37d2fa10e573bcd3a3de595d1933d5455454ace4d69d9f607711a662b2f32dfadd800064d601c7c30972af8439f6eb9be569d6628ee511065f3fd09f470ea404912ca58732aea63d175b75de7395d38f1bd772fb14f9894e7d93a7cce77bee8aab93f3f2dfa0e1f11496b6a3aaad7d0cbc02dfb015e66ac14ddeeed8e6c0031ec03379ea9dfc89b9f356cb2cc35f41e48ad4248879bd576aa75a10d5b969b670e4f4a36c72741ebe2f2f5cb0678faef334746aabb74f739d8fd5772a39df35347bef3de54b66e44b7e2dfa698dfabda579e560da9c6c959b65360018b688e37271e8b2be569d5828d77ceac3d19535d1a2c4910e564d5a56a1095d4e3b2c9658da731f4f2ae8e3e36556542db5dddde0eee961a69f5be8e9a23f3057fbb7e5ce85b12c9f9dc9d6eea44bd2534cad24d385e4f6ce52000a2f0c7cacdca5a4c58fab464d3a5cf0e96428b66a292a78f2d3aed115e88612d91cbbaad1aa8c89dd6f054f344977f910f4b0e7ebd780ea74a1547c642cf6fd14ab18e3e2b176fd1c5077a9a656393086bba56ce4c22c2ab83839ccbc8badaf9dbadc53d729570929d4afaeb69430639f6d0abb4c954a7655c9e9689e2aac6efa3cff4f957665195b676b4d9a74e2c15c9c36f9ba6cf67dc8aac04b8dcded6a8c47dea6a7631b16cb2aba65925190e2599b8b591cbc9b2cc33ea608eb9ab2bae16b8ca78db153c5d5d84532b29caa5659ceaf5688c6c712fabcc46eaebd6517e5ebdf7f3b0f5f876e296cea73b3cfd6fa18914250f3fdb928c51deaaa7272901b1a53b74300844b78d8622ab06191476b1e7d372259ebb52b6cc945b38c399b3746a8da65ae13b9f2b7e1ecd72221655e72be81cbbf45151d976534eee1e9e75e6a58a7eabd2a51425c7bb7462a28edc28aa14be95b3726575d30ebec9847951e9f9c12873308cb3a74659e8719d79ec22a442a9b8d1b9d39f54639aa2dba8f3fb7afb2090272e362539c266aafa544f1abf1537bc9aa5ccb3d37a989112cfc8ed908c523bd1c15ca0a765c49a811b7ab745a853375853e4f9d3594d1db8e557ce2ca23212233a63657b218358abcd157cf95097a022088aa335b28414cb61bf1df92a31e3e9dd4d37f22cf47ead0911e0f5ec2b8c50bd68c0600000000000438de673bb31e4f4b6d15d9294275462c5124eaab45bcdd3223564a6ebce2ebe86aa232b6425566be6081cefc786555fa397b9e1be5c4b3bfebc1230e4eb28d355891eb1b600000000000088e7f3197152aaece98562b02b514ca624e6ace768538994834abc7e888a1b918aecfa6626413d79799dae5513e815e4af4f02cee7b4422ae1775ae4f203d107ad24000000000000112af35cabf167cbd4db38575dd69084622a649852593226175912aa7d24652215aab3eec5aae80379eedab9ba4f385f4eddfcdd9e6adebfb9110e0f57414f9df519f83ab79eb1b6000000000000250e7f97967e5c3a3d271a617db18d50508c6d63ad5e3845612118d54e8eeb61464aebb7a7ced77d4e102b9f57771b95766cf9f4c3ad8fa1e5a7d4f7a11e2ecda962cdd7a3260ea2f58c6300000000000023479ac9570abdfd923546db085718221274a7a6525594e192b15397774264a9a2aa632df4df642c8f28d3ab6742dbf1f9dc375d9acdb2f252e87d09ae44fa4259fcf7aaa3916eb3d54801800000030000157c4e2c3cee5e8f6ec2a8d9371ae118c4b235a358d570c943b65567e7f7f44e68ae35579354ef9ab3d9e89a28c7931e1e7602dc77f7abf1f2dbf45963e7f6849478186f87a04bd4cc018026000030000218fc6dbe7b26bebe8b2b84a76c288250250143702ab3e656c967c33ecdf28c9c2b2acb4edeae7b0eae0c39b2c532cbb16ab73ed5bbc63d7f477c0eecd222a3929d444f50e40300000006980002a7cbf139f96def13224e75e584c8917354ee059e8a2c92af2e4eaec8cb5918555e7a29e9eb1db562486250bb0d7d3ea7a8ab8be0a3abe8b82fdc0928c6bae444f4c4d80c000001a1800028727c5e5a23dc76b49ceac2ae613b28951a66abcb545b54e5afb2f41a08c2b863a2bd1b6f95956755c545423234efd7aab3c257abdde4ee824928c395d0697a68593018000030000001473f87e5555f5d5b7c62594e29da8aee33e9cf74e14d1009d5464b37f4b951dfa114d796b89d2b9abf02924323cfef59cddf19ebf1f5dddef53789094639230d497a5857a98300000600000011afccf9055f6a50b1927573af070baa84e33215d71251aa8cbb3a3cff0045ba11ab166851528f5656d91a270ae34c8c8fbbc61eed7b7c755a3d7774109251873374a27a38e5dd306003013000000050c5f38843b138a73910c3625176d24e358a0a1255c28cdd39fa69c2a545196985097a4c17463182962dd5615b3a45d463d7b3cc67d1ec3b621222942a9113d14725fac1800c0000000004aaf15c335d889323542764529505753904149555e65dfec351aa14e6a28b2883db61368be1c8d39e9d797d3f9beae0d9adf12897abf42210928ac96ca2bd14719d098c0060000000000abe3782bedb2511b6f25b262af2453df4e7112aa146eece922531ae9a234e3b168276baa1ab9946fb8b265dc8b704bd1c39fcf5eabd3a12124a3e7fa9a62bd02c90b7a00c01800000000028e7f9e5555a394a4423264a54679f6ba13ab8fceac756fea5f54484615d55c1519633c7b35daefceb9dd1b67ceab676b2707a196bb36c39167a5f582121251a8925de592be6fa598c01800000000011afcf794cd649b6dcaa912705d1eb94d363871f36fdf28c156ab54c15712ac36f5f9fc796adfd2d19ca2a8736ed7dbd9e4ab50d1934635e93d8a1212492425db3257c1e97a2060300000000001431f81c329c8721d6ecd3d5befcaa9cb66f54d50728a2318575c229461939fddf6d5727cde1ab4766ad7b1aa282fec79d7a6fe673b5f0ecf41ed90848492128f68cb5f23ccfd4640c06000000c40011a7c4f05ca43901abad9a7d4a7351aad555509cf3c64a754610e8f2ea2144346ad9b7a2fcd510c90cf6f55ecd0ebcb9f2e198fad9bcecfbdeec42128559b2e5cb928fa93cd5e3c7d9ea0306000000310002af87e1e2324db96c72ecacb5f4b3c2b8dce10aab26eba5e8f5b93c4d57752fa6fb33bbe145f4d4c84b6dab9d47473f1b98f47d0fccf8e976be811e5e4cd9f3469a6c7aa3547ea0f3d59573bd7c818c00000062000219bc0f3949c864a5bfa79e13e966a32edd79f3d11ba54466a9ae8eae3a27d7efc3c53796dd3969b33e0b20f5dd2a8d3d2d567370d165be6cebfd13caf9c412eac059555a6efa44a8aaa7c4f41d40630000180200005579be1d75d6a4e2ecf438f26dd74d34efb7351467d3be58335eb1d59b47574e2afbf7f8f9edcf96cbacbb2602fdb7f36ae7c6de85ba393dbb8e6f95b37fd1bc5f10729daf659af4e9d13ebce9aa2cb7a0c60c0001800800021979c308d755705cedd52aefbcaeae6f3afd9d8d3cfc3973ece96fc7576a9c9653c9b7d13aa3177d39ce5c73d52b33eacd9f3cfadbe78fc83e87d1abe1df7df7592125150ead95d29ca5aee1830000060080008d5ceac6c44618a34667babcee9ab0d7abadb73d38e9ec6ed1672faf8b771bb31f257fab8cd3446ab2481284797e539d91eae8ebf3a6bfa3682294022a30aeacde9ec8529b94f731830000006080014316449008ab163cfd49f369a633d1a37cb2ae7eee9e8b2729f074ede07763e0aefa111b124abbe00967e7e6979cc93c105654fa1f42b230518554d19b367a9dbf419c2906deeb418c0000060200023465889249558e909553b2c94de68c2de776745b39162e4f367dac1e2b57d0c62409067e6d13dfa9793c5dfb399cac55bec76a9a29a6b53d3a345f75b64b6591a926e576e060c000062602000ab342492706249249251aa9af45b4e9b6c9b0e767e8a5c0e6f4bd24804c843173a5bf4ca443954ecbaf966e6e08db7e8beeb6c9ce4d824ad55a8837d2b460c000000000008e7a92946487192055d34895b28165939b62f157fa71c6bcf96882b95b1c99f46dd329ce04a97a2d6d80c6d80c124a34dc56aa04b674c60c000001820001559843149242aa883aecbc8cad90e52051f10fd7d926288370c3c8b3afa6e621b554273624dcc00402445472e82b55454607a2b183000006000200219ea2509351219f2aaefaafb6cb6d900c008f8fcfec6739836067f3dd2e8ca4d0c020abb06d04c680421454561d440a210844eb7558300000180080015199c5b84abcd4d3c5cb9baf7efeb5ec600025cfe76ed965934a6063e5f5ec6d82004a120600e4020492518c79db9d6b356922cea6aba4c6300018002000ab0c1b214d16f0fa5e2f3df3a8f53d7badb2c9011ab1d17ee252604dae651d87cfbb40080000004390842128c54618763aeaa126e7a3468b98db6d8c60c0010011c795c634d9e4bd5613976df6d7576655407467cf0ea6adb783928a9125cad1d1154ad60080402620251402128a8c23cbb2512765fa34da3621084939c9b6318080166e6e8c871fb9cbd91bec49bb2726d846acf96b84ade85f5572552b345a0e40020068060843714024928c547916b77efd5260e40084255c1ca53726d8c04053ccb6859f464d5b263631210201255d16ceb8556b9593b6b839cd8c000608904409404212128c63ffc4001801010101010100000000000000000000000001020304ffda00080102100000008591145000000000000151228a00000000002502a2250a0008a0000040501020680020280002028032105680049426800000002c892b3ad00042a25a290000002c25000092d813600400000a800002674b02d2b3b480020a2000000c637a98cde977d19933d718d0002288ccbab00826ea4c657398ed797b1ca6b7ae58d80108032baa49539f6874b7949c8992ef97a85d76e77380032208d2b44e7d231747b63cb97286427b254ebab8e50054800c70ebd74209cf69b92d98c45d6337b7688ef31330596549a8039f97bf5dacc46f9cddcb0eb65e532b95edbd6e19e5baac962e650064dac822a73cbae8c61945e9d6f7679e5ad0b8972b8040d6b8f9fd96c8581cb1aeb5ad796e12de9d1adeb9e36b0b98465100dde7e4f75b200135aabcf824d3b944e842c4865920375c7adb2005b6aabcf8ccdf5d1654d58975132659203a75e5344801bb629670c6f74b65935be490506600df5e38ea4802f49a93496f33792c5c9ae5b1265d3299688b35d7970eda4803a59a6740c75bce5b0ca2694f3cbde49968835d339d4b3206f56359aa39eb782c44889599797a0ce6d8a35eaa6384c82ef52cd4954ce7a48b12c4c899d73e7ea266935993bfad1cfcec8376d8b659498d5962c48c866e6ccef5923598efec91c78a42ba25a6a4a466ab3444c9630c6f559208eddf9c891934b6adceae5512cb26b36e64962dc633bdd99403aa8011366f2d48a895259a1ce5d2b1c318ebd379103bc00067771d12a25b9109b49996d5e3cef69ace48b9d4ee10009d3975b9b729484b1a8cdcb58cdb3cdd1de648a8eba0400ceb1d759b7280cd4b533737598b7cddb3b4900e9b008089d3525cd82419de2688d2179ad49058ddd8020635bd497360cc5cb1c26bbee4d93331b9d70c80dcea002199d3449524849cb955d76ab73cf389e8ba9320378ed40084ceb550638f2bdb5c799575d365e59e98ebcd77320378df40010cad271e590b0b577bd47376919b8eb3214d635d4004266aa7972b1496f5e7bd6b50a2578bd3a9505b9d6e80086059e6cd8d5cadba63a6b44549abace604379d6e80084c41cb26f59e7776ae77bb409854ca94b9d6ad0010e7044a4ce8ac6af4d52098cda5204bb6800433cc4500b70bad2b211000b2eb3ad808072c94452adccb55010002c58dea82018cc63775216c4a04a200006968aa104e698dd58a5489a0808a00ffc400190101010101010100000000000000000000000102030405ffda0008010310000000028000000008000000500000000080028400a000000000800a080500000294c90288140800d1000005b02e600a8000001435200069228c80000000140000ba99a170000000002800035ace56c5cc1378500000014200a3a74e79bd379e53185b6f3b691400036990051336ba764d6ace19f4f866d2635a1005140d2660aa459836d7a29ab338f578704cf1eab4140a55328829487336be9d152ce9e0430c6fa004a0037e8c799168596c24bd7aea4e7d759e3c56396eb4041a6680d7b71e39174936caddcc66bd1ba8b3cf873b57a73c8ab29a40054916950b7579e6bb75d58939719c1be966611ab346e428ace3b76f365692875dce39b1ebd6a3338f34e79ebbe72526acb5b81430f57a7e761692804875f454ce780179e5a335749b9428c3b76f2e16801088f4f63971cd8b098aa85d1a9428c70efbe65a25112c81e9df2e704b2a72e9684a59680cf9fbfa3845a019b9a9294ceac0b2f3de497775cb55522a59c3b77e599aa0333599bc82e26ea50a9913beaf9f4b50171cb7d799aa0492b3a883531bb0a281aed37e3ab41171e3966fd5aa0665972b02dc685965147576cf92ad8a9a38f8355d7d5689644a92cb0b6005286bbb29ca52a538f82dbdfd2a25c8866d81a8016823a5df185283979fa6f55548824b2690a02c5ab824e9ae9cb2b4a0e600052674cda8502e4bd33884df7de39a5162b9800163585cda451466d6b3244ebda72cdb4594e60002e778962d02866ba6233d3526faeb5e3501710000ab8952d0a04ade2e73ad32f5f088a05ce40005b813528b5166ee3594ca93b4ceb2a05cc8000566528340ebdd38f24c9ae84df2a009708a005b9cd50b45bd7a999e7924d74d6a6330a026b121400d322c6fbf69e7cf6e8491c3113af4e3ac74df3c2809ace00142d82fa7a5095266e73c66e5d712d9ac5a026a730050688d7b2812b3c3ae396336a0b1d70b160599800a168bedb110670d4c72c2d152675aa0259980050d07a7a2f1c6fb6396659be589958abb25a4059940028d5869a926b7824db3cb2146ea02859190014ba148148a9988d41a1420566cc800a6a80042a20280a2054ace6140a5b5acb34b25025580000a6508414534b64164b2a90028800fffc400431000020201020403050507030402010403010200031104120510213113415120223261711430404281062333526272911543a1505382b124c1d13444639293a2e1ffda0008010100013f00cc0331560100f619a139f680820100fc39fc4679e3d9cf21ede390ff00a51862ae62ac02010736684e7da02080403f09999999999fc1e667f038f697fe94618ab144100e6cf0fb4040201041f80ccccdd333333f86c7e007b38e462ffd1cf230c3008040391388cfed8100e607df666e9ba67f1b8f6b131ece796263db5ffa3987962620100e44e233e7d9ccc40201cc0fb9ccdd374dd374cc3f880c1bb7b47ee73ec63eed7fe8e7d9039338119f3ed0100807b59137886c10db16cc982661337413131f87ce064cbf5da4d3ff0016f453e84cb389e99fb5985f36c1c43c5f875585f1598e33d14c4e31a4704aa5f8f5f0ccff0057e1b8cfda93e9e72bd769edfe1b6e80e7c88f607dc67ef87e2333226e9b8cc99d7307dc9f69ec023393ec67901008073c810b810dc21be1b8cdcc605260ae2ae0c1da1e420fc00f6ddd514bbb0551dc9e825fc7ea04ad2bd3f9dbcfe826ab8a5f6b317b0b7a03e510dad925ce0f9c5644f321a2da1989dec3033f58d6ee3ef9623d73d62b57b86e407a8f51d256a1ac6d8c2b5f219cff00cf79459a94271c4eb1ff009161facd3ddae418d525657cac4ec66f0064e40f5f283acc7b7898fbe1f83c89ba6e9933acc19b66d981c8c1f727d9b2dc42e58c066666679010099027880437086f86e2617633acc40220807311b908bece3dbc7dd6bf88ae9028550f631c004e166b75ba9d559ef3eef3c76558c431c9049cf40238abb30ebe6042e768080803e50d87b0885a0dd8eb0b37d47a41628237644dc848c1066938a6a748368395f9ce1bc4f4facc85c5568ef5e7fe47b1898fc18fbdccccdd33326759b4cdb36898f6cc1f727d9249f63314402013b096d844dcc6759898f650c0d3333163735fba1f77acd6d5a44f7882e7e04cf79acbedbeedcddc93819cc2589209eb2cb369210f5f33194f9d907ba0fbe4c30275ce48997ede53def3990063199ee1c63a7ca2ef4edd47a195d9860e848653d31dd670ae342f229d4e059e4fe4df84cf31f71999999933acc19b66d981f7a60fbe344f04cf09a146814c0228e47b4b064cc7b7981960b046b7105f96c4af24469e5c97f0239666ab522943ef00719c9e800f53351ac0ed601ef1272d61f3cf611d8f91eb338181e63bc015ce48e83b4200c67a9f94254f7524ce98873e444eb883a75115f270148f94c2f7220ca8041caffc8870483e7ebeb15a706e23f6ca8d561fdf563fc8fc0e3d91072333333acc4c4c4c7e0cc1f747d8da26d10a086a13c313c39b66211d259ec6442ea278a21b635c7d60b8c17343667b99494df2a6f74423331d263ac1f81c72242824ce23ae7d5eb1d7ba06e83ca36dc80a3007acb3e2ea3f4877be157f533a0380730b63b124cce7e2eb36053df33266ec0eb067baceb9ce06440e7f3758083dbf5118752207da01f4ef387ea8693574d84fba0e33f2301c8cfe03333cf1c87230098fc4183f0847232c86c510df3c786df9c2e602d09cf9c0a4f653169b0f9620d2b1eed174ab16803ca20db031e407b58fbee24eb5e86f2c4818f2ee675285c0f8bb438451e659bafe918127273d637ba84fe90861d3244c28ee4cc9f2e4bd0c0d83d0f4808cf43d26dc75539873eb371067c62264fd47fc889dca67a7713816b0ea3482b7f8eac0faafdde7ee3333c872307e24c1f747ee8c22309626636989ed2da6c43d4c55895b9ecb069dcf78ba41e7174ca3ca0a408104007a4c4c19b62883f0bc77562bd95743d3309b2c2540c22f73ea4c6f400f6c460008f61000538803130e330f2398327cb90784c0711bbe47713bfbc3d605c853380ea055abac37671b0fdf679e3d91c8c1f89307e10f26e5812ca55bcb3174ea3ca0ac09b440262620100e58e420fc258c2baddf19da33388b9b3516333066ce0cc80428f840c9309dcd9503a7a4b5c80140efde25658e730f9e21c7964e7ce04c0ce60e44f2c0033910c10768a304983aa1ebef03d44a2c28ca477c823ea25560b2aadc766507fcfb59f6b2217115b3ed11179376887f143ee8fdd9108e5898804c4c41cf107b020fc26b1c57a5b5cf9012ec5ae589f324996306185fcc7ac0e115bc81ff00d4c606e6ee7b0815997af41e4a2304af04f53e9e53c42c7b43bccda4cc01307d666660e433883b03e7146226718f433835fe3682af54250fb38f65dc2c7be0b8b4462c628c72301e59e4bc9bb451ff00443f784423efc7b5898989898f67131ec71966fb3845ee65952755cf9627d94e0601ce3f4025948dfd7a81da78449ea7031931edcb6d41910d5d32c727d04c81e70963e5086814c099869685083da6392f483a4eb9e913a133f672dc36a283e81d7ee333319774d4fb884cd3dc5c911060830768391e5b84cc5e460ffa21fbc2211f73898f60413131313131f7fc76c702b09dc7fce669aa1630edf3869c8004d4691bb819f49782a9b17bf62654a950276ee696b16c75ebdcc5ab71ee67858f39b47acd9e82569db70e9152b1d8931b44cc064627d82ecf696699ab38336e04ef3b1301c3022705b8d7aea0fa9dbfa34dc26e9999999999e625e8194894d0a8c489bc088e0c133099d65a5d5c75959c88bc8c07affd205d3c682d105826f9be6791847dde26201310098f6c2b1f29b1a787f384621989d2644cccccccce3817654dd77755138455b95a3d2a14903b0ed351a72e41271f49a8a92ac855393dcf99fa435313dbca78716a262e9481932bd11f307b45d0b79811349ea22500765020a84da3135a999ea203dbeb1bb199f784d25845d4f910e31fe61dd93003ed639b83198a9225b6389a3bcb67301cfb1702c462543a45e460f8bfe9189833ac4ce660e2010413108f671313136cc4e9322098e4390563e502319e1982a10563d215988cea3bc375607711f5099ef1b5958fcd1b5e9e50eb8f90956a5ddc08bdbd8e2749bb4ae17e25ea27084dba6cf9b1c98464625b52ae5bc80874819b2fd5bffccbf47eefbab0f0e62c07941c3d5401fe67d9867388b528f29b042a2639626a972312e1ef93eb3b6611de76eb28d3b8f09f1825830cc1c45972f6baa8cf6c4aac5b6b575ecc3ee5bb474cd91ea5c42e2ab25166e506084c7b30278c09953861073c75fc566644c8f59b97d66f5f59e227acf153d678c9eb3c64f59e3a437a4f1d678eb3c7598989889de63a4104598844c4db3130274999999e788887d0c73812a5de33057d6059b44db08c41cccd5bb03d23d969f38c5cf7261062a13057294c388bf0fb0e3208f51343d1597d0c12cec6328336886b19cc2a2110886184cccccb13783d66a2a218f48561044aeb2f80075ccad7601b989c0ee66a94594d768f2383383b96d295fe56fb96ed2d7c58216c89669dec6942b56a229c88c7065a4159f093346d9107e0c9025fc474947c768cc6e3fa60d801a53c569bfe033ed0de93c779e3593c5b3d678967acdefeb32feb32deb3def598330662626262626262604c0f617bcf28208b31088cd881b3ec6d260adbd20a58c144142cf0c08146d1350bde69bf863903ec0e598c3226a44658c21113026e5896aee110e57d83294f0efb97c9bdf8234ed0984c27a4c987eb0c38879819874d5b9c912fd0d6c876ae0c75da4e7ca68ebf70b4b9d142a96efd7f49a628e1abcf47189c1971459ebbbee0c6ea235018e4c15010aa886572d5cc292ea9c769a0c8c883f016eab4f48cd96aacbff68743564212e65ffb4d7b74aaa0b2de29aebbe2b8cbab2555f24e7bcc95312e7a9c3a19c3af1aaa15bce6c9b26c9b26d9b6604c4e9322644dc26e9be6f9be6f9be6ff00617bc1db9089310897832aed1509829105426cc4004004c422364443941351dccd37c108807b5d9b96b7ddc98f708d6e7ce179e2b40ee659a8b12d4ebf984d336eac7d3d833602c0f9e08e4d9861e661cfa4c184433aceb160e5adac0b4e04d1560e98e4e32d3515d82f7de268776f1f59c393652e7f9ac27dbc43da1680c31bbcc180e23d9d22b1dd2c2089a75c3180c1f7765f4d433658abf532fe3fc3a9ece5cfca5ffb5361e94d007cccbb8c710bfbde40f411999fab3127e66604fa0894dcc4610c2a423aba91d01962e098832713806a40bedaa1710b89bc4f121b21b21b26f85e1785e1b07ac36afacf193f984f1ebfe710ea6afe710eb28ffb8b0ebb4e3fdc10f11d28ff007445af33c19e07ce0a4e7bc0866c3029880f2225e257dc4ac0c73220101e7880626a04d31e847cf9e667d86e5c4c7eeb31bbc1f4e47eb13189aac0753f39a239a97e9ec1e4dd18f26fa420c23e70e27c8430c226046c0859440ebe4440f15b335f5e54b4d28c69980f279ab4f16ca0038250832bd31d3ec0a324ca53c3ad13d073c7306663300267260e4c4033223e4f69e1398b4c1488b585820f6decaeb1977551f33897f1ce1d4ffbdbcfa2cbff006a7ca8a3f5697f1be237f7bb68f458f65961cbbb37d4f2009ec098b45cdd90ca780ebeda05de1e10ca78176de657c22aaaeec5844d3549d904e2883c641eaa632fbaf2afe289c39fc1e232cd6222966ed0f19d37f343c6e8878e55e90f1b18e892ce3eebdab87f682f3dab11b8eeafd043c6b5a7cc43c5b5a7f3c3c4b5a7fdd30ebb567bdcd0eab527bdcd0dd71ff75a78967f3b4f11c8c64c0c739c986c63c97b4b6d0906a527da13d67da2bf582f4f582d53e715c410cb8449576e604c721cbaf2be69464b7d662118e43d8682710eb498f9ccf7a0aac6ec0c1a3b98f689a17c7531b84d76105cca2a15a003ca1e6793f972622130f2c7ce362130996ea11077976b18b1ebd27da6c6ec726259613e9287627a98865c032194802965c7966034970f9eb80268ff007cfd47ba98304cccccccc633383374624c58395bdc4523137085d44470c6098f6490a32c401ea4e25fc5f87d1f15e09f45eb2ffda8ac74a68cfcd8cbf8ff0011bbb59b07a2cb2eb6d397b198fccf2009ec09829b89c6c328e0fa9b4fbcacbf5e917802842774a386699506522d152290100e934ec5f4b8c63dd8047dc5862640ee6715e9650c3d63a7bf689574b9651d38889ac5ce99fe9189c99d7d660facc9c633313136cdb36cda2604c098981ecacbebdc235589b63a913de06564cabb889da1970e917bcabb731edea40c0c4d0e03584f23da6603043073d5a6e43174f5fa435563c84535afa437d43cc43abae7dafd04a5cba830f3304bed5ac8116d571d0c27309999bbae216e90b47b00ee66a75e1320186ebaf3d3ac14a0f8dc40f429c6f896567a2a195ae4e62665a7086039f171df69965c9a619b3a74c81e66709e245fb8c293da2b0600839079666e8218463d813775960cc5530af582b0445500c1cbb753da5dc4745403bef5fa0eb2ff00da7d2a6455533cbff6935d667662b12dd5ea6f39b2d66fa999832dd949828bce00ace4fa0cca3836aad3efa94faf494f01a57e3399570ed357dab8281ba928a010e3fc4d58fde2f6ed3f2b0f51137606eef0903b99e2d48301bf413c727e0ad8c6fb53f62120d2e7abbb34e2ea16aab1e4c238c5edf38062efa345e9afae6a3ad0ff00db2cf89a05c88cb8fc02471d2583a403ac7023e256655e52bec2196f68bde55f719e5a8c6062688e2d71ebccf780c53cb10f499979ca996338ce23b3fac7dc7ccc5424c15c549a7e8a21efccc03acba95b90a996d5acd2b36d562257c49d7e35cc6d7d27f341a843820cb5fb1137ee5966ab6fbb2ebecb3e12712c4fe6f332daec1f033953347a5cabbba919c6d12ad1d618332c15288aa044968c8c4a3e36cf9ace38b60d456483b3600270cbc2b6d9a5d4ec033f09ef33e9c8f4315ba41d632e66d8c26263a43d0f2ed19fac160c47d55151cbdaa25dc7f4750c206732ff00da4d4b74a91525fc47577e77dcc63313d4930027b0262e9af7ec92ae1daab379f08e17ab13e4257c2eb1dc4d2e8b4ea80f86a4c00200c157dc20cd564d95b123aa7973b35342746b947eb0f10a98fb81ec3f211b51a9285d690aa3cc9816f7009b700fa0834cbe64b7d4c5ad17b2898e5b944e31d74e0fce5bfc65fed12ce979fee84e359519675a5bfb65dd1dbeb03749ba66666666666664cc99d6759d675983313113bc6ed1c7498eb2c1eecb09ccaa572aec21967683bca7b0e63d8279032c391118a5b9116c1e9098792f33312e1d258232931ebb3ca5755916a308db34cd958dece636e28c171923a67b4bb86bd859eeb8b139ec30165ba4d625a57613f31da7836205158f2eb99a7aded003748f46c189a8a70499e17410d23a10222807a8898c74527eb023b778131c84b89db2b277ab630a26bb65970a6cf82ea8107d1bd662cd2ea0ab0c32360cd1d82ca84d16a76b782e7a7e53c8ae66dc45e47962644765cc2e009e32fac6393982cc4d559fbfb94b7e769bd7d625563f6595f0fbac380464f69a6e1f951633861bb6e2269507945a80f280afda2f0cee15e9032a3a67d0c03a0cc4d4e9ea53e25c8bf532de33c3d723c42ff45967ed0a7fb5a7ff002659c775ef9da513e8259acd5dd9df7b9fd6702ad2da6edc3243c5ac0f2962fee6c110815a7f689bbd14cf7fe4260f9b4da2604e2c33a56977f16af9a09a818bdbeb2c38d45260eb57e93503173fd66262626262607b47d8cc1d62f784748ca71da6c39ed1d091da5953e7e132b4607e132b0655d8431fb183bca7d8eb3af3c727ed0ff1045edc888149307b377c265a46626d3315ccd62788826a2d59a16cac3edda809facbb4ddf00ff98d43eeebd04d355b50132d5c8ccd4a020caebe98311479c352622a0530b0c7485a6e81b32e7e9b67e518f3c4e2a98a34d683f09da7f59c5177d7a6d48fccbb1feab3835d94da65bd1b3343abf1936b1f7d66633406679d8d85265daf7572a0417d8f8c9993b3f48a4c43902599eb2bd1e983f8a6a52c4e4e7af5ccd5e98d56da07e5b184a2b04095285653e86542ba058aef5f56c8f5105e8dd115dffb445a75b67c3a7da3d5ccb349a94c7896f7fe48ba4adba365bea659a650c7023530d3b72408d560920435f72a2700eda81f4e4e3f74ff00489bbc0af6804ed83a81ecf125ce95e5bf169cff0044d60c5ed2efe2d2657d691f49ac18d459f5e5d675e58330662626262626263d8c1cc5ee2666e13709b967bb0059d257db93f69f9a55cc7b6e3a198fdeac51d2626d130073c72c4b57a19a9b1c5840105968f29bef33f7e7ce6cb4f9cbd5d46774e136ee0d0fb4238f773e91f18842ee27bcad81e92c1eecd4fa4533301ccc42b18720d884ee68cde9d0f7335abe2f0db7d42ee100f1f835ff00d04389c3ad7a6e40064131c8600895d8d4d81d4f5065372dd507587ac10b407938ca99ab4c5f2bec2107c3e9e92af1b71f74f7952b15ed0d0c4cb6bf0ce3d41338821f12efee266956fb4d495b019c0ce2270607f8da9b1fe43a4af87692bc6da549f56eb2b50a3cbf41885b0ca369398eed6e9ea76c64939c7ea22f712e5fde3ff718cb027eeecea3191182566c4dfe59e8a4e710840480cdef2e7b4e09b45b705cf541c8fc0ff4888b6699034000000f675c33a77977c347c966bc62efd04d4e41a8cd39cd29f49afe9a9b26664f2c19b5bd0cf0ac3f90c1a7b8f6ada0d1ea4ffb4d070fd59ff68c1c2f567f241c23567f2c1c1753f28381dde6e20e06de7641c0d7cec8381d5e6e60e0ba7f53046ed2c6604f58d659e4c62f8ee7a39828d4ff00dc3055a81f9cc4f147769476e4dda1f8a5507206647b4e7a46e962fd621e9f72fda5e83c43362cc209959bd66a8e54ce11d19c43d87b58975e94819eac7b2c0438041e8604c4076984eeae5cb931c6042e44adf3c9a184466c1c42f86c63309c293e666a084d258bfd189c32bdfc3b58bea8c256b81a771ea0180e51631c19a3d4b544e3aa9ee256eae32a730463880c061ed35e84b8204ad0803225672b168527312b0046004d68eb59f5044d7afbf61f90ff00913847f128e44850c7d312b2a7a88541209f297a2a5202f60e7fe49317b8facd48c5f6ff00718c222e52df733819cfa4bc01ab5058a9657c2794ac293a6c13d41033ff00dce0947d9af35e73ee372fcadf494e7ecdd3be4cacb041bc8dd322679596157ad7f98cd50fdc3fd25df055f49c407be87fa44e2541aaad33fa89a15dfa6ace7ca5dc1b4f7585d89838268c7941c23443f241c3b463fda1068f4c3b5420d3d03b56b3c2a876413627f28981e9f74237697be2c6117acd3819800c42047c03283d39346f8a55de0edcf0660cc4da66393096f7113b098fb87ed355d1cc6730b34cb4ebeb2d191386295b5a790f60c065b68ad0b4777666773ef37fc09a673b88cf4c6603912de82519fb3e4f9932c11ebdc0811eaca99412720ced091331d8004996363b19e2127bc4dacea0796099c46fc51b7d44e1d5f85c39f3e6866954d94d8be6af9114e5047ea62120caae6add18195ea2a7f3c18f00e598f5068698ab812a6ebc8f79afed57d4cd6aee1d7cd5670c6da6a3e879670621faf9c3d8cd40fdcb7f7031573933543f7f67d618b8c580eef87ca6a73f68a36b00092086eedf48b6051496b81cbe3ebf29c22eaedd51d9f943298755a74b591ed19007494eaf4da87b12a24950731dca694907b5b032c0739e6f5876527f2cb941ad87ca5a334a7cb33880e959f559c6d54f0ed2b0f94e1673a3aff0621ed35676dcd12d1eb34eea4f78b8c72b269f918ff14afbc1db90fb8b875fd601803eeb59531b1809f65b4c1a37f3683443cda0d15706969fe595d35a1e8046edec59a8a54e37027e50eb6b5eea65dabf1371c7411ec2668faef3f29a5bbdf6a5beab2d1999094aafa4b1fa47bc21c932ce20b9c2824cd39f7b27ce02088d0e44b0e44b5c927103e3a9ed11bc342cdf11ea63336ab5095fce6acf83a160268d3636df5887dc023180c0c361cf975946a6bb5015398351b07c58fa99fea6a9dec48bc574c7b93fa089c434a7f330faa99f6ad3376b445b508e8418ce4b600950f39ba19aff00e1237a3cd50cad647fdbff00d19a2e807f741d841de0cefef09c32fcf225ff00c17fd2543dd9ad18d43fd0432cbeeaadad6b4256ce8ede821b35369a1df4e372da7ff11eb1abf717ddac62df3f4f5faca7537e89eeb2a348c598ebdb07d7e7353abbdecd5d86fad5b72fe83e7381dae788df59b723c3c84f4940056c1e8fed58328df48dfc123d18cd78fdd547ea271460fc1f4df2c4e0e73a34fc1887e19c51cada63eacabe26835b9795dd959e24b2deb34ad9821967c52bef17b721dfee2f1d5a27c2bf4fbad490b636636a2b1e70eb6b11b887a219f6fb0f659f6bb8ca2db59fa99e52db6ba50bd8e157d4c7e28f61dba6abff0037ed1abb6ceb7dcd61f4ecb3a2f40008e4cb9b600a3cbbfd602499a418569a92d5ba5abdd4e607560ade4466358a44b8b9c80c25adb8ec9e1107b4adb6c6bc8c620b9b3de0b332d65c187048e9320bf6181da6a2e389c2b4d83e230ea67146f7294f568abb595a67a4683bc43820c7a2a66cedefe63a45d351fc99fa9260441d9547e93244473eb374044aef287d44a9d2d5ca7ea205844e2b6bd7a4257bef51198b69ea6ee4ab7fee690fc5fdc6567289f34132779fa45eff00098c3aa9f9c61baa71fd2228c0026bbf8e7fb443358c896691d8b8c5a300763f584e9d6a38a9cecd4e3e7bbd7e91ca11786a1885b81e809dc7d44b52b3f691e03b02558ff51f94b52c2da9d9403b954a93f9cfce702f1c7121b91429a7f5cca4e0ddf269bbe4664ff2cf7fd04c37acda7d63afb86632968f46335633a643fd5355a82fc352bf433819ce93f0627e59c5d3f79fa4d4ae184d0063689421d83acd92d4ebde68e0ed0cb3bc48bdb90eff007178ead2a39ad3e9f75acac3d8713ec60c4d120ee23692bc768f42830a0115d29f7dc8512ce25638dba7afa7f3b4b14bb6fb9cd8ff003ec3e8256dd6210c258b830772de9dbeb2d3926567acd2b7bccbfd20cb577cd25dd5ea6f525659615b31b4985401d635159b036f12e7a17a6731ae07a2564cf0ddfe33fa08280a27551d0c23b67acb5c2fbabdcf785f025359becc9ec0cd3d7b2b1358c2dd411e48312bf83133d61e421eabf48ad01e4a60333379dd2ad4bd376e07b0c4a7569774c61b19c4335f48bb4b6231c0388fa7f069aebce71bb0669805771dfde941fdd53fd8201fbc2675040f2e919bde00180616cfa72e20b8b87f6c2211c8c30ce1471aeaa51fc6d40fa4470e5f1f94e0fb2ff0983e3bc7ce6a3ae97e8d2d39a089c00e74e7f0620f867155eab354bd44d180ac0ca2e1b60b44bac9a36c9117b432def12276e43ee2f1863283fba5fba75f78cc4f38f80a49976a6bc90b973f28d65ade613e9d4c2a99c9193eadd4ccc7301c1953f68f8619967ba02cb860e627712b7297a9f2c62138707ca3a15248ee0cd3ea52c70ae30fe5f3848c4bc20f2063bd4832147f88ac5bb0804393364bec15ae617ee6006c60a268e800ae04bac14d0cde8253924b37763930606674dc619882084157c40792f2b6cd89f332a39225797b598fa9c08d71ab63a9c3299538b6b471d98666abf816fd26adf34d07fa88941fdf59f59a6eba6a4fa084e1960c336429fae26cc1ce4c0075fa198cfe7c7e999aca55ed5dc6c3d3cb004fb2d470365bd4819c99f60d3fa31ffc8c65d965c9e4b6903e980618619c38e35b47f74aba6aaf1fd2260027d96ec613ff00c9b84b0674f70f432cfe134fd9f6fddb8fc066644dc3d792f69a9d1a5f8dd1b82e99fbac5e11a54ecb17454af61069ebf4874d51f295d48846045865b1257dbeeb5030dfa4d27f047d4fdd3fc46332ae4b1004b35958f83de32d7b2e39b1891e83b476c7699cc781a398656621c89708fd44a57164658a4b01eb2cc1066a2b38ca9c11d419a3bc6af4e1bb38e8c3e71b4f91d659a65112a510a08d812db954124e0097de6c73e909334d46c001ee7bca2bd804e26f935523cce4fd0451b441d66dea4c33100e568c807d229e4395efbad23c97a4afdd5cfa094f45c996be44e1d9fb2a4d40cd168fe832ceb4fd1c7fc88a71a869a1eba6afafac6280e49582eac641b13bf964c17d4c7a1cfe93c55f4314b8276e3e79389abb76b0cdb50e9d3260d556082faad3fcc0611b88e81464eaaaff00fb46baabafd43d6e190b8c11f41095fe610b27f308d7543bd8268b514fdb34f8719de2274d6b8f5ae6753f6c6cff0007674fafb27b1977bbac79dd6f5f947f81a7ecf9e9672ccc89b84dc26f137cddf29b9bd265fd27bf30feb36b7f34d9f39b07a99b166c5f49b57d392ccf2d56a4d43e18789b0fc9071473f9226bddbf2caae6723313b432d8b2bfbad4779a26554627c8fdd5a42e589c0025d635cc4f651d840d967f910258fb7a46ea2032ced15a13c97a4afe1ccb042b157060136f9c632d5c89a3b5b4dac03385b3a7eb3c40c25b609e264c36e25da8c0ce65d73da703244145c7f218950a4f88f82476106aaf47dc1bf43da68752ba9a830e87b112c3e2eaee6f253b47e931009986621655ee408daca876cb7d20d5d8e701401133139671d6544d8e49f5961c578f53885f098846e7ad7e7342c3c1dbe92d39471fd265ac0504ff005a4362ade496c0c4ab89e946c1e21623c95498fc6b42830c2ecfa78663f1cd267dda6f307ed15683dcd1b9fab810fed35de5a341f5797f1cbf518dfa4d3b63b677197eb9ae705a9a4606005ac620d4d98e9b07d10086eb7f9bfe046badf3730d8de6c66f3ea66e1342e1759a63ff00f2ac271ae1f343ece6161eb35bd3587e93fdd7f98960f8c4fd9cac39bfe50a813689b44c0f49813a7de6792f3e21f0c5ab74f02754334cd9c44ed0cb7b4532bfbad4a81b66958057fafdd6aaef15b6afc23fe639c095b7bd77f70963e6c80e4423ac619584ed6998390bb0302b240f9c37d64e0e57eb0ed61d083154e601811ce042dd710f5135157a77f289aba5b466eb1b6ed1ef1f989feaf4587a8658fab088871d1bb4b35a4f61058d6d801f38bd0748cc63658c2b89c2f5069d415f2612a521727b9393f530433793d21d4de2c358a4644235567760a3e506894f5762d0508ab80045a829ed3cf1146072d436da6c3f2c4d3260476cd807a085b734a71bd9cf61d04d1dbda779abe9a7b3e457ff00718648c9ebb62d63ce6b345457bb62e300195203b863b19e188570654155ce4e0153d63a038c0ea2787eef6869631b4c42ee2de788691e666d407136a8eb2b64add1c632a418ff00b4b735cb6f8483023fed3eabcaa41387717d5ebb53e09c20d84e669afd458d70b2d2363604d4d5ad36029a865af1fae669f4fab7b72daa76507a88281f39c47a6a57e933fbd13503163cfd993fbed4087b9e79991eb0ba8f310dd58eee236b34e3bd821d7e97fee087896947fb821e2da41f9e3719d346e3757929878d8f2ae371ab3c921e31a83d80878aeacfe69a7d76a6cb9159fa13c960e5c447b8651b7130b2f0a26948e92bec2196768b9c995761f75a80005026971b9f3f73abb481b01fac2401376f260e97de3fa418cdfbd886198e92e183018bc904b2b0659a7f35c83f2965daca3e1c38f9ca78a6b2eb45428cb4b6c29e1e7cc758a3ce096ae44e20b62d6403ee1605872d26353a76ac8f983e8c23828c54f70669d704b9fa08371ed1aa6c13053d25e31347517bd4fa75e59998a232071f4ec62139daddf9912b1939e7ab39089ead1061617c963eb101c7ccc6700ad63cbbcd1b60c4390a7d409ad23c1d48f30338ff00c8452598f43d8440370dc5b6fca5997c6e76f41d63a046040c8336e46428857066d9b66def0d78623e72d4fdd7d1c471b54b633882947d42ab38ad4b60b1c90a0f99c43575206580246446420e0ac70a02e063a75cfacde07964fa99fb3ae7fd5a8cf982269d4aeab53b40f23d65e8c6960bdf1d269eb64670c313138a8c5e8667de533563f787e62704b4d5ab7c79886c630bbc2ef19acc1eb353aed52d8cbe218dabd41ef6b437587bb985cfa99b8cccccc9f49ef7a19b5cfe589a7bac380b2fd1dba700bf2d21c6a2bfaf25ef072e25fc269a66720405a6a77e26873d332aec2196768a255cc7b777c134bd1dbee2d715a1632c624e49ea65cdeecadb12c18d49f46a4c63fbc95b644cf2b9276316031239c34ef2cab71c62514d7496da065bb99a81960227682112fa43ab291d0896d26b7653dc4e1b79a9d90f669ae51e3b91d8cad3a00225663d58ad9a6ce9352befcd1d5b2b2de6dec01c8807bcea0723d628da213cac3baffa09736cacca867ac2c2a42edfa4a096258f999a79a23be9f9a99ab05755c47d4abfff00ea629e58c89884422113102962001924e04bb7567df6607a75c74f9c650d45b8f22bff00b96d5fb9b3e90edf118b670369389a8b684aab149c025f2e7bb75e9812cbf2bb5130339f524c4d16aec1b85442ff00337ba3fe61d114197b57f4eb383054e29a52bfcf2b18d7dc3d521131cb8b8f7eb309c626afba9f94e1671acf60f6335a31a87fac4ad59492d8843e4c41eb140ccc08bb4ccd63f34f16a1e706a2a1d845e21b3e149a8d7d9a90030ed00c8941c5c9f5e4208271019a9a686b0504f084b295225558532aec393f683bcaf98f6ecf80cd27f18ff6fdc6a6ededd3b0ed1dba89675101c18e336547fa5c4b7a34a9a66031c644b46d32b398224bbb0311b23979cb1726083915cce25463160fa19d55830ee23fef8838f212aab188aa25abfb97fa46184847897607ac20280a3cb901310737708b9832628c08cd042654e6cb98fce6a5b2ea9e9d4c0c9557bdfe11d87a99a8b8da50118f3c4a130327b094b6268ac0b6edf27135fa6cebb5762b0dad4b865f3ddb621c1efd3ca2e313d6130b0ce330f22669eabafb952952cfdc63e52e4b4d8eb627bfdbaf4c63d60c78777f683fe0cb5d7c2707d25b69727128d135837b9d89eb8c93f412b35d1d2aad6bfeb7f79ccb751953ef1df9e8ce41e91bde272f9389c314a6ae839c6db14bb43d3887d50c20e660facc1f59c606055f58c7b4d51e893879dbad59e5cccd6a6ed5b0ce27d9ab00e6d1194ee383d200479c5e9e7374520f48e81674f4991e93333064f606555d85d4846efc84104d68cd4d3416e1409be596604aeccb4a4f41c9fb41de57cc7b6ff0994645c3dbd55bb5768ee7bc76969c11f485b2234539db9f23ff00b978c3194b407a4530f69a85951eb045970f765430bbbfc723319847b17d42cad94f9886b20953dc1c40d653d8644ab1d0c11fad4ff4971c567e9348b9667f49dcc0398e600b4eef21da0119a773caf7db5b1f94d328552c6543c567b9ce2b061b7c56f19c62b5f817d669e96b09b6ce80cb2f51d07695decf802576145a5fcd7066af0d7b91d9d011faae20d2d7fe94bab167be2d08522ea68ede22e636b281f9ff00c0966b341f63255eefb4e7a0c6131349abd0ad577da74d75d61eceaf8082353afe1a74d66ab46ae1ce110b672719ecb2dd6d973d965755080927c356edf4067daef6f351fa4a788ebb4f68b2ab8a3018c80259afd5dccf6bde77939ec3aca755bf72ff0035466aae27dd594508aa2db8f4f21eb2cd4964dc72079790c408d7b9da0be3c874c465b15378af0b9c6ef9cd3d3639007c4dd7af603f98cf1ab17d155592a96a9cff0031cf79674d6d27d54c3e53f7bbcff2eeff00883c6f1173db27338d7f0d0fce39ed3507f769f59a56ff00e6570761ccce248df686c033c3b4f6469f67bcf6ada0d1ea8ffb462f0ed5b7fb662706d5b790117816a7cdc4fb0b789e0b98bc0e91f15d0709d0af7b27d8f85a776133c22bfe59f6ee1a9d904ff56d30f86be420e5ab19ada693c45246d3de06b3d0cb12e6eca65145c1b244a410393769f9a570725f6cf632a38b94fb56582b42c659616249309eb351f0a981b22189d5c0f53356b973f58a7111b3c8197ae441d1a21c88b2df860b0d4fd7aa9ef0608c83907d823999aea76da1c766eff59628359fa4a9b0ab9f495da0b951e51ce6a7fa19aa63e08fa09a64db48feaeb31ed5a4b115af73dcfa08a028007611db13398396adbdd03d4c619ad6b071bbb9f411b17e1146294e9fdd050b90f6f403e1496def61db58e92bd313d58caeb0a3a085bf742699cbedc9ecc04b405aae18f2220bd1c5282a0a55026479e0e73f531811d4c28a28f158b6f66c20dbeee077399c238afd92bd7d2da7177da53007f54a691a5b383dfa3d4b6b6f298f09ece814a75fecc4e2955956bb52b6d22b6de4ecee06670ba28bcb26aac7aeac36c754ddfbc965657bf639c1c63221128b0ad99fe9220c1058f7cc63e2ba567b74cfd25cc6fb8201d17002897d57696fdaeac871d8ca0b3d2d4ed2c19d481ea44b988dda6a482edd6d7f2fa7d04564a9bf73d48eefff00e239cd9a36f503fe443db93eaadf10aa918c99c51ec7d19673d4186eca88ee1e91f23293b75359f9ca937229ccf0d633509dd846d5e957f38966b7419c9da4c3c4b42bd9446e2fa75ed5c3c717ca98dc72df2a846e35ab3d8010f14d6bfe78b7dacfbddb2632dd6233f8e7e998d6d99c163371999b8c43c84066f02330220451e42749b97d66f4f5896acf10424110fc52b8392fdc2ff153ebed6aafdcd81d8769ba665a37564457c3626613820cd58f78cc758ad880e44531c6565ab86949c88b2cec630cca9cd4707e1ffd4e9edeaaaf16a65f3f288e7aa995918134f9fb45a7cb03119bdc7fa4bcee455f5c4dbb405f418f699b68f53e42226d1d7a93dcc638119b260821979df72ac25afbcd687a0e84c0a94a8e9dbb08fbee6ebda25614769d00c9e8229060518c13290a9dbd732fdaad787ce03be71f594a6724f94e0fa2a35faef0b5371aeb0a4f7c648f204cd56875cf41b954d9a4a09a92c1db6a983a1cce1b7e9eeab86d7a444a35e2fd86ddbdd7d5a71fa2fa388d8b75de2b9c12f381259a21a1beaa8df6ea56efdce429503f38335f4e91b43acd4df6f87ae1a96cd19e8b93db6c46c9c4a919ed2aa32498877baf4ee408842d9631ecb99c04325e5ce017ac9c9f4c89c76bf12fac76c6f04fd1a70ad0554d2755a9501403806715d20a055722d74557124d43b8134f4335ca9b36804617d58f6cc620d7a360723ddebcfc0ab39d82719ad468acc09be2be0c5fe221f9cd31cd15fd2714d6fd929c8ee659acbad6259ccf19fd66f26070300cdc4cc0981110bb845ee659a57a0e1e364769a21bdf0659c3b4ed728c1f9ce27a1a69a835639d6ac4f6e59c46bb10bbb19fbc3e730fe6c60427cccf0a1ae229118b0f394b92237c52b83b725fb83d2c5feef675566c4c7999759d607cccc56cacd52f87664447c88c7225fd554faa88460ccf5887a413b897aca0e0e22c7ed088cb912ab0a1da7e1f63333c9bb4d62f85a827c9bac46f714c4719e9371d8df432a1bdaacf90c9f68900127b088a58ef61f41e827696bc10411ce04cb1676519763859a7d3a69abf563dcc76dc6575e07412dbeaa4649c995d8fa87c9f844076f5305b286ddba6ac63537e14362c2769f38414441d89624fe8669788696a7a6bd5e945b4546c6d83bb3bf9b665dc509d36ab4ba777ab4d65994a3683804e48dd1ed37254b62a0f0d3629518247ce2d8f58211c8ea0f4f94766724b3127d4cd0eb3446bd00d0ecd2eb1378bddfaa6c0324b4d76a9f557d963b8725d897c60be4f794fc7386aff00f3d7d33ffb9e19a752808fcd060bbe7b02cc7f49a1b056da72c71b74ee0cd4df65cf6ea71d598ec1e40c3c434cba74677461a7445149eecf8eed12ad45e97ebf5201d89bd6b3ff001981daaaadbdce5c0c7d6cb26958bf0bd03fc8722e41c1c09bf1e938b02da2b7e9310779d996684e74d5fd27ed186fdd9f2989b4c1519621c02045edc8759496aae57dbd8cd56a46a1c10216134432c489636bd98ed58da3d75c31637483833f9b45e1158f89e268b4d5fe61cac3075e4211cb3c8432911fbc4ef17b725fb8b3a3febc8c03d67412fb3c4666f2f2970ef12cc1c18ad981f066a105b59c7712bb0a360cdd913e2a10fcb12c13ce5679032e5cc1eebc431e110f698eb10e3e9ccf2cc69c42adf4961dd7aca4935a67b6226d530302a7e9347d6bddf2007b4a3c439fca3b7ccfaf2b5f13bc51cf52fb50cd1d784f148ea7e196301d6c70a0c67a285dc7afd65dc46cb0ed412ad16a2e3badf717e7de0f0e85c2c7b89305a6682cdcee3e535d95d55c41c1f7587f811d98b90ddc16cfd49ccb07ef1a62672a4fe9cb0443345c2f5fc4371d3505c2f76ec253591bb23b19a7622f70a7de2b95faa9ccd5d02f45b90752d9fa3464da2d27a33315c7a0962aef401c0dc0649ecb35612ad3d35d43764ab21fa8c6669e9a8957b08d81f6d60ffb8fe67e826a48b75414ab126c1ef9e9902711b715d150ee736bfd5a70c7ddc134e7d098a7a299a8a05c47bc46011fe63e8d5f1ef9e95849c417ff008760fe98ddcc1de1fcb3871ce9526b74a9aaa8a347e0d7ab1c089c26fddd445e1b8c749fe9f9fca21e12addc88383d03bb45e1ba548747a403e19a90a2d6083a464cce1ca73d26cbfd544f06d3ded9f67cf7b1a7d96af3c9834d40fc9cad8bdb92fb4dda523a4b3e289de2f6e4bf70e80b1f635b778756d07abf4fd203d258b997a10722556e7a4cc0fb4e66a6a19dcbd8cf11abefda699c59a76c7934b44f3959e40c3d44b570732939025a704726108eb139661e6630c8851aa253c81e90031081de6997669eb07be327f5f6706c38fca3b9f5f97276c08c4b18208213354c5dd5079997ea8696b545eaf8c0134f45f638b6ece4f6cf796689b50fbacb309e4ab2ba68d38fdda007d7ce5974662d36981657955b07932e3ffb9af205a847634246c0b1803919ef1ab2d6aaa7bccfd9477cfa4d6699f4569a2dc78c305954821723b1f9c19db83c89ccad6b675163154270c40c90270bd7b2b5d49e2234486bc6f4af22c2223840416cf597135dc8ebd3b112977639ab0c76e1ea6ece26a34a9602c11881ff00f917ebea20a589f71d5ff5c1ff00063b6a195d456ca0e0279e00189470bbb59617add6ba6902b40c0e4cf03547540b60ad6580198fc3458c1ee6c74c4a2d7d3e9becd52e6bce7b6257c409acadc3046082bf2878de075a493f28ff00b408abfc3c1f9994f181af5baad806125830edf53c8f6138512da44c4daf3637ac35f4ef367ce6c13c359b17d26d5f48e3dd381359b85cf0312670b6cbe3dbb62f6e439098e6d2a1360814402620e67a082d03ca0b56788a2075f584c07a4cf2d559e2dacde43a2ccc3d65a999756d5b6e595da184cccf743d8f6f9184fbed5b779c39761bd3c88065a230c188603d208a658b912ae8713507dd1f588d91c8883a41da383dc4c8233ccc6ed354a42ee1e50584cac97b157cc987d866c9d8bfa9f483006076109963e4e39082096b6019496b7559519c4ae840e48c359e6e7b08ac0360753e66336d12cb0982b260aa6c8125756fdc8300b21c67b67b89afad90501b1914e0fe84c6c6e3818875b5d5c34d5e066ef1b7557ff2799c4505d8b312493924f99319405eb07bdd846057b8c40795685db13578cd78fe5c4a7537250d529015f6b1e9d720791835fa84c1702c5f5f311b57a4b9c0b28cb1f55805283234c147ab1db34daea12c082c41bbc81ccbb57556f629df904e7021e2557644627ea04fb7deff00c3a907cc9ccc6bedfceaa21e17a8b3abead67fa56953f89a92d3454e929b5856a7257b9978c5b60fea3cbf2ce06d9d2f23c88f6b89d14ec2c4759a5e162d50c4cd3e8eba074861f66c8bc94c3019999e4657da13d278b8316e5f59e32facf1d445b95bb030359e4408c1d863741537f341463bb43534f0b1dcc65c451d66d1354e2aa5883d4f41c8c30896a06065886a6c8ed16ccc660cb897a1b577aff113bfcc4e1ba9cddb4f72a44b04b045887a72ce0cee263066a0e540959e93333c94c223e54e57bc570e323f5e663a86041f38e0a3153dc4e1e9baf2dfc821e76585708bd5dbb7cbe662a04503e7d4fa9e5636072cc104ec26b2cdaa66814952a83bfc4d2eb8578aeb9a74c2ee32c62c62d702cc4300948c58b38a77a3e6af2c043374e99960c853f2958c0ea25cdd0ca0e0c4b4d36a59b11f1dd1c65587a1868d23e96db56d2972b13e0ed2ca57e4d1b4f6d6c15d769c03dc1e87e91708b89612c655d513fb04aec297052aac8cbd5586474966a75097b69415a80b157dc18e8c7bcd4adaf50c75676c92c7c8414dd5e093f30419c34d970d533b163851933193e79193d21d3f89435cafd76e4afd0e0cdcdea629b188019bfcc2670abecfb4ad65b2a44d58c6a6d1fd4790f84ce007f72791e47d9660a0932d76d5ea420f84195a04400733ec09645e798262620061539113a0866c07ca1a962a0f48117d04000eded1b515b073999cc5f8872d7dbbad083b27fee67918636312d5dd190a9c888c23a9077af7112a0baba6f41ddb0e3eb0cb04ec6567918a61960c888791315a020c27a47ea63290db97a189607cf911dc73335a9821e70d4c505f1f1b7fc08795b68a9738cb1e8a3d4ca6b2b9673976ee61f284e04739309e4b1631c08ea351784ce00ea65ae9a5a76a8c4d2a1b5cbb42084c0810098e789895fc6bf59c5465683f36135271eefeb8f48bf00f982251aaaaf3453ae771556acab62005c67b67d5443c36e22cbd035ba44b0abdc9fc83bb60cafa138398668788eaf87bd8da77037aed60464199f3f38cf938cc0371942feeebfed96e56ea889ab1e2555ea53e3a0aeff9d79ca9990fd4761d25df907ca70e016bd663f2aa18f51f8ab25d71d4e3183e9344e0044206d67284ff0078c47af63943f10382257595cf99966542b3740dda70b6035b599c4063576fd792fc267ecf9f71c723edf10d476a93b99a2d28a9327b987db0d1ccdeabdcc3a9ac79c3adac7988dc46bf5117882923acaf55591dc417d7fcc20babf513c7abd441a8afd67da2bf5875558fcc21d7d03f388dc4f4e3f38878c6987e79feb558ecc6696cbafac3972a0f613638ff0075a6d61f9c99823cf93103ae44d5713a34fdce4fa09a4e20b7b642912cbd6ba99e3316624f733333331dc20c932ed722c3af63d920d667e2ae6fa6cec706177afb8e92b65660579582111203cbb1e4fdb9030f2c9137930c3de5a872194e184aecddd0f461e509e5a850e8565682aaabaff9540865b62d4859a528cee6eb3e23d87a084ccf68c63999e4b04bdf6a989e25da90149cb37fc4d4586ebc81db334b585510cc72c4c4c7253ef0face2401a118f65b3a9f960cc5d45f55c114935b0da7d1a3d37363dc03b0e93ecd69fcb0556561863703dc64896df7dec1d8ee7c6096020adbce7827d4cf007a45675d39d3854d85b3f00ddfe60a0e4657105616ba7fb4ff00ee5e316527ebff00a8a96e95985959fddafef13d6b6ee20d32d57b539247c48d938287b4b9056f56ec907b759c3496ab887cea334f4da1ad7daa7c3ef9241c1f4859fa8b36056e9903b7a197a9b08bba6e7f76cf9583ff00cca2b0410183903a80466595e4aa331200f76682a54d5538fe69c5976eb6ce49d8cfd9e3d6c1c8fb5a9b4555933474b5f69b9e631c8c3ecf80f1b4ee7b4b7866a6ced68589c15c7c56931b822b77630f00a8fe730701c76b8cff00436ffbed1382e3bdcf3fd1d3feebc1c22bff00b8f3fd26afe77ff33fd26afe77ff0030f08a8fe77ff33fd174ff0038782698f918381693d0c5e0da55fc9294352045ec26f7f59b9ff9a6fb3f9a6e6f58514f710e9a92726b060a957e1502357bc60cfb327a4fb327a4fb3a7a4b34aa44e20b7ada54f6829ebd6786b0d72d46595ead93dd71b96008dfbca5fea203902308c22c06086031bb4c72cfb19e5dc4b2bcfc88ec625993b5fa37fc18620dd728f2ce4c263baa29663803bc40da8716b8c28f81799f28c7a43d61204580cce04d5d99f77d654a34d4bb91efb74fa09a4a8b36e3e710050042c26e13a7b06763388d8d6b0a57e0af0d67d4f611724e4924e3ce0136c290d42785024d92ada8c4b0f2226c1e22ed23193d33998fddd7f2dc2711aaea850590ae4823e60ce1f836d5b3b9d1daae0ff3e0c4c1d883fdbcb57fd8ddd7f4335e0f8751f47227096206affb1e2ffa82d56dc370aece8e71002490e49188800051c02080ae3e5e5fa8941fb3f888ee366dc86f223d65f5a5ebbea3939ff99a45cea2a2324ee138d8c6b3eab3313ce7ecf9c3d9330fb27a09ab76d45e2a5ede729ac56800e46187d9c4c4c4c4c4c4c7e20ce25a7f11091de3d6d18b298b68f3876b096e9c7710abd477032a7dd556deaa0f271040603cbb187b7b5984ccc56e90c745718220729d1fb7937ff9940f8dbf48480092702163ab707b52a7a7f519983913da39e8635a310d9989d62912c6e92ddef68c2b743e865d5f89565b21907f913449fba0e44678d61819a07681e679b10a0b1380064c4427417dcc3dfb5859fa67a4ae01313136cdb31088bd0c0e99c769fed8fef335a494ac924e1d62dda94b5bc17d8ca7e2faf48c97d58764036fbc307fc88e2dd4f854563738391f31ea669aa7d2ddaba89c908467eab05ae348ba75c26506c663ee3e7cb3e46269750ace96d5603b33dbd21a1cd4c4e9ad7b49e9d3195225b5e2adbd14af40188ce657a8d3e9c1cf896391d531b4023e729d46aac61e1a78299c915ae33f56338e0fdfd67d53957de70138bdc7b7acbc5559f59a0a0f5b1bb9e663d889f130106a296380e277f6327f1c65cbb94cb902d8c23d40c7a7136b8ec6788fd8896b65668bded353fdb0c308821314e630cc5f4309c93c8fb0f9cccc0c6079911c0da6529b2955fd65d61d4d9e1a1fdd0f88face80003b09999858c24f48ce087c807de5118a649f093fc4f171d917fc4f19e78d67ac36bfac3659fce65ac5991324e48806d5551e4215130a3b0ccde7f926ff00e8337af98819664432e3e33ad00fbbdecfa7a4241fb5003a9ab27ff1c443d60f68c060eae0cef5fd1fff00a9ac18d393e862b61ed4f3c068f5b59580ab9391894ea9f4745e95559b8b6d0fe8268598bda598b13dc9f3c89a3d59a01475df53774312ad05c334ea2eac671b03910e8f45d9f51637d6e8f5e810a05546c0ce3ab1c1f3c99631467b695c03dc100feb111f529e23392508ce4f407c8fd0ce363a699bd53957de70438d59f6acb056a493006d65f9fc80c4508a00e7afd70a06d5f8a2e9b5dacf78e403eb2ce15abac641ccd2ebeda2c155dda0218023fe82634e2b532e1d625c7ce74712ef7018ac184b8f49a0b76692b81c34c430b6233189d072cf2cc26749985a67a9facc661136180111b24aa8ee4cd55ed631a29ebe4c47fe844d3bd48a3a01f50660c098131311bb451936fd4461313b08213099a61e26b6bf91cff8989b605027499c4388767a4ca096dc11090327b01ea6560a03d72c4e58fa995d072f6a9056ca18119ea1a279413c3b3c3f1361d99dbbb1d33e9ec2eddcbb89032338f49a8f07c6b3c02c6addee16ef89995f795d6d62b85193b84d5e89db4b60c82dd3027fa76a4ea1f09d19301b3812cd6784df65d2307bc8c3d9f96b97deb515ac54a308433f9b91e66577fd9ddbdcce7ca1215fd7d256d62a3b2746160658745e258594b39eac483e710f8a81c775273f23e625088e84111eb7d2dc40f85c6271b19a34c7927713841c6b57d9660a3266a6e7d55be1276f3334d42d28073b9f656cde8268a83acd5bdafd541980a00025ccca84a8c99c4b4be2522edb861386586cd30cf97fd0984d5d41eb31ea009111489ab5f722b625dd5670c20e9c67c99a6d03b7268679c5e6619984c39987f59b0e7a9821ed37c0c239cabe1b1d3b89a6f0d1b0abeeed233f518cccfbac339c91dbb601cc0230e9c8c7f867c2eff3118f239987119cc67383385ae6e76f459980ccccf2b5c2c6b26f315f7b67c97207ff006666694eea80fa89502718804f12cf0fc3de766eddb7cb3075840d84f9e664424faff8133dfccc2ac4830305eec07eb387dcade20565200198ceb8ceedd358fa901cd48813612ee49c9946af4d453840c5cf563b63de9ac65b42955361520fa19a6ad6cd41571ef8ca9fa889844d2db8f818861ea14c35dd639650002c7020b2eaa90b48f7c6e5661e61a685ecaee28dd9fd7f98456151dc33b719fd0cb05af6b17e8dbc749c697ff8741822f713869c6b6bf6090064cd56a5ad7f0ab9a4d2ad2bf3f635c71a779c14a9a5fd730c79aac1a1c7ca7071fb9b3ebff4232c5c833575edb396a466b3332d7e938637ee9c7a3c1c8c683bc5e6dc8c3cb309ef1613cb2620dfbd7fa6220518e6ddb9d8d33976fa46300cc004685419a82aa303b99c397652cdfcc603983a4c93320778d76235aadd1843583f0b4b118617b130000003b4ccd13e13e8651e78f4304107466ce71d258a3693b7271d25c151863b6d531f5171b1d518e33d001051afb0fbb55edf4530707e2ae3a692f95fece7137ef5a27f7bcabf6675a1958ea69ac8f4c989c02e2e1ede25613fd28043fb37a2639b2fd4d9f578bc03842fff00b507eac6717e1fa5a748be05095fbc7e112a00715a9bcae40ffa9130a12c556dde1d99ff00c5fa19a5d832b91f0f426142549295b1cf4da63a2fe6a6c5fa75966a130029049ee0f4c7aff99a6d39c35f6f538f73338b00dc394fcf903d44d11c6b2afac1d873d76a8ff0d3b99a2d20ad7737563ecea13c4a5d7d44e19a8fb36a5e97e8099dc644613895e2ba8a7999c3aaf0b4c3d4f31f8f3184e235fbbba771912deb518e704c72670b6e968f98315a03986372583934279984cef3cb979c32938b57e79133cb30ccc66e91da03966fa43d4c51c98c7b302312ee22015a220f2114f49d4c1d2152d3c24f48d4d3e6b3c0afcb3fe6040598e4e3b08f5a7d0c75759a17c9c7f54d37c58f9110721ddc7aac6c1507d408ba6d2f461457d403f0c5444f85157e8009b8fa998cf943d3bf48fa9d327c7a8a97eae259c6385d5df595fe9d63fed1f0a4ed63b7d123fed5e887c145c65dfb4235cada7fb304cf507764e44a98b6ab87dbfc8b621ffc65160dc1bc9b2187c8f78cc687e83729ec7d4197557865098c32ef0160baf53d1dbe844af58dd45857201ce444bc5fa70fea26bd73c31be47909a638d4547e6227545fa72d5ea053599a2d39b1cdafdccc63dae27c3cb9f16aef34fc5b53a71b2c1b809671d67184abacd2e96ed55a2ebfb7909800003fe8666a6b0e8447dda7b994f6ccb71e131f9471de58270c3efda3e420262bccc6e40c06623433333c8980cdd37ccf58629c5887d1843d09e66131cc6310746fa40bc898e65ad3495eebc13d94660198a216021b600e7bf499c424c2d804c0db7a4b48232216c89559e0d83e6d34c5bc639fe72047a11345a7bc13b9dd95bd3a418c8c9c0cf7972549a975aecf1102f46c633081b713fd66eaaba878087dcef93e5d25ff00b43afde56a4a80f5db98fc6b8dbf6b4afd1008757c5accefd55bfabc35deff001da7f56261d3af4cd8278550fce614abf9499b5476aa54c52c43b40f7a3e6bab50077adf70fa30db0b00cb627457ff0086134a3c7d5a52d929674fa362250c8e5ebdfbd14a9e9929e52be1c6fb022eaf7163db69530f02be8b417cba6c3961dc19a57288d5367a37723135387e1f78e4256716d67e625273527d23b04524c39d66a3fa54c4408a00f6ccb749a7b3ab208ba4d25672156295c7bbec8fc798e322714ad54ee225b7e5362f68dd658bd270d38bdffb660180620866390993098ef881e679182753021846393f484e4e4798cf326334630f5389d074f9433319a58f3bb4d2a05af3e6c66f44ee727d23dc477f88f612baac7eac7022a2a7610c30c3d7a470639c42638cc5c2ba303dc069f68b5aa5a4b7eed5890bf3820f8c7d0c3d8cb4feea9ffc84deed9c600130e7bbcd84f7633c21e84cf087f289b2607acc2fac3b25a458c71daea71fa88705082bd18e225cf5904310ebd723ff006253c475699b15f73b81bc38e8713865e359adad9a8542177748d8eb0a56d512c80e7d44d5535ae92f08b8c88792f4286694e74f59f94e2179e95af73345a715563d7ee0c740d3c048142f6f67383ff403388d02ca9a3aed247a46ef1c0c4d174d49fed30389ba03cf30199961c88edd629cfb1980418c4761165b2a39aab3f2c7f899998cd19bac631667afe8616998cd1ccabde78a553033d6257ef923ab7fea15ab4e86cb0fd4f732bd5e9acf86e1320f620f230c24609f410b012c3098652e72013f480f58a606c5b5f4c83907fc4bad540be59231f319c47b14d49df21cf94535a839f3875152f9ac3aa4f239fa09e3b9ec8e66fbc8fe163ea67efcf9a09b5ff35c3f410aa79dac66ca7f958c5b00ac6063c3b3a0f918dbc59ee303b49600cff4e2b569eeb19d86dcd814619620d10dab5ec6f4032e6517250fbab08ad8c75188daeb4771833fd4efc6d6452235eb751700083b63773c87c2b28b826851b3f96692a6bee36b40303ee0c660a0932ce2415ba54c57d65762da81d7b1f65e23647e3ccb577291388d5e15e7d0c73184d2f4d52fcc1850f94c3888c7ce6619980ccc7edd23673104cccf2c181a35981012c66e01639cca4feeb1e8c61685a3342613074117b9fa4388c6318ed34c3b994d06e391d3063db5e9d71e72fbdeec89570bb5fab0c44e1aebdac23e9051a941d2e0df2613c4b17f895e3e63a89b830ca9ccb1b087e6ca2318e7918a7044cf58a63e7284770d0d4ce72500cf5cf9f499fdc7d2cffea38a8b1cd618c000f86a513367c8421cfe69b09fcc67843d278407e5136623050092c2504b0bcfae0cd069fc574b4fc02bebf512ed6d06c6f16bb1a9007c1e79f332da3477dab670ebb16ffdb395334fc4f576dbe05d555730ef8c64cb6fd55476fd8169ad9b1924b40d9c89a61d2d1eab2c501dc7cccda201ee09a4b2cbd129f2128a856800fbad664524c1e0369b236e313429b693e99f65fb4a5ba91f8f3089c6f4d9af781da6e13bca463575c10ccc07905102885418c9804e633176e917b43cb3093107496c59d4c612b38461f310b426130f20333b6613098e634d1565f2a25ba9af4a82bac64cac6ab5966157ea669787a5001f89fcd8c0a409b883da161e6234b6a19caf43ea25858d603019162f5f5863f23077112ab6c0c52b6608b96c0ec3d4c530e4046c1c6e1838e90b40735583d194c5505c927a4c57ea4c2f58ff00fe986fafc889e3e7b2b1fa2c3ac19da031303dcfe4aa3fa8c35da7fdea7fccd40b6b501ac46ddfca732ad3da2bcede84673b84d2d85385161dcb32c6d3decafd8e4f52ad28434537ed04dad84e9dc2f7316a6baace0a3d7d9cf494ea752cbb2ebd5c1fca71ba555977cfa4a10abb0f2225e317583fa8f2ac656707a13c10ff0076c01041ed3ec3407c87207a6626d0b85f65fb4070d98a723f1e66aea1654c26a286aae74f4302c1d35354561899108079660699e571f762af33333398a7a4b3a98b1488ed11b21ff49984f233337604eb8c9ee71098639e55bfd9a8c2ff0011c64fc84d2e89f54f9270be6d29a6aa10256b810b42d3764c6319bcc477ccbbaa7fe422b64953dc7fcc71c8c5f884e19aaa34ff006a173102ca368c0ce4c4ec25ba9b9b4f5d2cf9aeb3955f4ccdd9623ca070e5c6cc0500027ce151ea40f91c4da87f293f53362ff22cea3b604b1adbedf02b24fae3ce57a0b14636e26a53eccaacc01c9c7433ed69fc90e1c1b9861721562b5654600ef34c85b847d2d7cce1f7a0d3946d4784e6c2c323a60c636546f77aea35bded82ddc79461a67666b4d8a98c27bbee01174cc751e226d7407a10413885d90f43349a8df6053de6b0635568fea8a3267659c0db3a5fbb2278290281dbd96ed0f73287f2fc798e320ce3546cb059ca94dd6b3f920ff930644dd374dd330185889e262337887a9388cc17a28899e588567844f6300db911cf581801059de3d92a3ee39fea026667913c80c9eb1db7127e70c631cc542c7004a3446c5acbf4014450b5a855ec21681a3bf710b62168d18cb0ee2a3f532c07b8ee22916ae4778c3061957c73d2031fe1314824e3d22f630f50601d22d1e6edb443aad25470886c612bbacaef7b57a1666cfcb31afb4fc57c76adbe2b37621db872a87a0ef89a8534f854aa1635a0cff7375312ddb62e5768cf59a2644d2d15377b7c569a93669edb2b6f855ba4b9f7e9e9e855addc5fd7dc1894717d555b6b00381d002255afd2eaac01f4bb6df2223156ee269ab02f420ce2231acb7eb1060666721a7003fb861f79a8d5d3a7f8ccaec5b503a9c83ecb768dde2b6d606230600fe3cce2ba716d0d1cecce7ca64554a0cfbcc72d15f2206132b303909de045f38c5147413196cc0667992616c024c2f930bc00c15963803313876a991715e3b9eb2dd25f4fc6871ea3d9f2e4c610cc70269f85dd6f561b57e72ad0534f964cdb8fcd0f5998489e64e6130b46687ac03a58df2023472d59ca9c4aad37236ef89619a1d49d35b738ad1f3514c3f6f7fa66024276271d33118cc161d0ccba0eab16d50c4312b2cd52afc241328729578f71183f0acd46aedbd8e4e17d26f3e44cd2e8f52f9b7684a8f7b1ced1055c369ea5acd41fe9f7120e205485d3d3453f44c9ff002d29e25aeb2c651aa7f741639031813ed275003dfa3aef5233e227eede0e1ba6d4a78ba4b86319647eae26bb4a6dfb3225c8be154060fa99768b503b9571ea0e659a9722a168c1ace411d9beb2d4ad6d7d9d464e250c2abeb76ed99b1ac19ac6e07d250596f40723ace269ff00cd78ed8e92b39dd3f678fbb60fbce29a2beeb1590644d1d469a110fb27b47efcb4b765990fe3ccb93721135fa52baf54f26399ad3fbc4fa4533266e30319ba6e81a1684930f4826666033a4b30722604ae86b180452c651c32b03371c9f412baa9abe040235b198309a8d1ab3129d0c7a6cafe252390ef18f48a0b60019329e17759d5fdc129d251a7036ae4fa985a33130375c4266442c6130b75866618bd4953d98627712e1d26917196f58fd3312e2849c67312f571b77b019c919e91173d8832e2c9a4241c1172ff00e8c2e7c143d0938cc14d3756bb9076f28fc30120a30c646419af4b599405210089a6b2d60880b31ec045a28d11da116fd4ff009aeb86b7bd83ea2e2e7fe07d0445d1d67246ef5dc7335565766a94d6005da07a094df4d5f68f1149de00c0f31e90ea9ad4425b00018500ed5f90138469b4e47da40cbe48fa4e3f484d972823ae0e269eeb03fc0eea7f596ae2a25172437507d0cb2ba1705815040208f9c7d2b14f110ef4f5128d5db4e3c26da441c4acb5c35aab907bace216ad96ef1e621cb18836cfd9e3efd83ef1d4b763114af73cb131c8c7efcaebfecda8adfcb38311832823f1c611389694171663a89ae18b907f44101e7999e79c084c0d330722d12bb2c6c2a1334fc3467371c7c8444aeb18ad4010c2f886c102923305393932da4152a7a896e81ba9acfe862e9eece361ccab86f4cdcdfa0895d748fdda010b999279667630c26130b11333ce1e407511b01ecf4dd2f718c4a4611401387684de2f7b3214a3560fcda6a780eb69c9af172faaf78c8c8c5594823c88c18b63af6306a830c388b6d5656aa08c8958f757041e9e52bebbc11f918fea04d0d976a3dd2a338fd25da8ac6faf4b803b59728ea7e4913496322942aa3f963d2d59f7c3cda4f61352192cc7991e529d1bae1df19f204667809ff6abfd32b38395416d7d86430ea4ce2b587d2d9ea3044fdef6dc60b1a9b416ced3d08f510f8575d6a3bf439dadf3f2cca0dfa56f16b395fcc3b83f59c468a8ad7a8a7a258332acb626a2af09b0fe90d9e83110e5a70138bd87dee3d932cefcb8c03e1319fb3faffb4e97631f7d3f1e66a2b0c867141b75207a2f2cc060f633330c022a3b765262692f6fc98956928ad46e019bd4c5aaa63eea2ff89eea0c08cd9337e047b446b59ba282653a7b0b6eb3a4e821b008d66e84e26e220781e1e598613099eb18e2122199866216c11f59aab552db147ac2ace726709b284d621b5f68507071e70225ab921187932c7d22f75761357a4bac5c1aaab47cfbcbb876d3f0958fa675f2ccd84195df757d9b3345a9bb52c57aa8504bb7905f998d72383a5d26528cfbefe7645a820000e804afa2897dcb4256cdd98910574dcbb80c7d259a2cb061b588ed9ef0d76838d8678371fc928aefa6c0dd17d7266a1d1aac161d4435d6bfee43a5aee5237ce1fa27d31756647469aad2204df5a04607aed1de6a3166888dbb4d7676c63a345e989c630574e7d57927c53821c6aff00481e7cecefcb8a2e6969c1f56fa3e20b9cec7e8623065047e38c7190671ca36dcaf8e7980cdc2647213333d6696a175bef7c2bd4c7bd506d450046d41f5947897b7c87733a228558cd1ec0b13c4bcfb83a45d322f573b8c1b57b002168cf0b899ccd84c35f48700ccc0d9189d6632213330c2651c26ed452cecdb323dc07ce5b5594b9aec52ac3b8e6c63da074cc096da4606045d102d9c662e86bf3ac44d122f6402535bd441424417e4618446afcfacd451adaecb1d49d858903e212b6d35e765a3c2b3d7f2997f0bbabec37089a22d92ff00ba45f89dbb4bb51e301a7d3829a75efeadf368e7b2a1215655abbaaf9894712a5b01c60cd55be3222aa1c06241ce7334d8150c4ccce6305ed9db99655abee9686973dc42ef42bb477888aec4b39daa32d2db99d8e0ed5f20253abbe9076d871e861d5ea18f5b5a1776f89899a7e077ea2b0ece1019c6e86a1294639c724ee270838d627dc6442e83bb08da9a17bd8b1f896913bd823f1ad20ec731f8f27e5acc7e397b7c35c7e2bad6e99c4b351ac232ce60e5677e5a840fd0cff4eab6e70333875dbabf0c9ea9f8f338b69bc5a5a1520f3cf3079033a4d3b85dcbeb2c2651a67bdb27a20ee6294ad42a0c085e5968594d0fa83b9ba24012b5daa30047624cdd1ec022576dbd8607ac1a5ad7e262615ad7b09bc086c263087a41de6621964c9e5a47a2bd421b5411e59f58ac1c020e6710d3517d04da76141d1e131ac0251a5b75562a03b7313815a9e693ec0d57c422dfa75ee0c4d5e9064e724794b35c294f10ba95f4c41c6f4fe93fd6b4bfcb29e27a6b720289feb3a1ce311f57c1ae397a813135fc31142ab900761997b707d4802d7240f2dd168e058c2b91f469f61e0efdac6ff31b8570b0706f710f07e18ddb5462f07d227c1ae61134889db560cf02bf3bd61a107fbcb35c1bc0254e40cf51387bb1a8e6cdf320f43d44b7454d88ea32bbbbe25dc1f50bd6b60e2595dd51c588cb2b19eb2a2a6eac13d370cc2321157b4fda65e95f253d44e1a71abae0ec23baa0cb1c096f18d2d6719cc6e3d48eca6371f3e55c7e3ba93d9446e31ae6f310eaf5b60c9b488ff69642fe2b1116ab5fb9733ec6fe6a44a74961270043a2751925656a81d802338e92f2a0a938dc0cb2c4da4839cc1db959caee862925657a93a4d7a1638473b4c53900fe38cb93721135d57837b887901ec608e439696ab2e3d7e01dcc660a36a74026fc4b2e0a269b4ad61165bdbc846600604668ef88f71ce0779a7d29f8edfd042e00c08e477cc2d19a64c44263d508c40dd60e8630c8846042d1de70ce26693e1dafeef913357c4355aad46eaee00213b504b0ade32ea68b3cc81946ff00f12ad0a6faf69dfe64cd3bd296a2a7bcdbb13dd96a2324b0916381ea669821b8ef0089721f04f8632c0cab486d65671d73da3e8373b6580c1c604fb1e98ef1b09f700fd67d8ab1eeedfa47d31a18a303907acd2e9e93639b012b8ce26a34bb1c9dc55265a56cc197a91d6359635872e4c05c98349ade9fba611741ab3eb3ec578eecf0d4dff78c29a8db8171c7a666837d3bc3f689a8ad8e037581e0398fada9b723804fa189a54b98e06d065dc2750a735b0695f16e27a3011d4903d6710d59d6e856d2b839e43bcd09c6a2a3f38bf089c6b58fbfc25333cb33311806112c72bd36e2338ae964ef994eb8d680112dd7b38c45b9d727746d531f382cdc6569bfb8261d296ec862f61cace4eb98aa009c4f44f70ca1c1072270bb9ecd320b3e35183f8e3184e29c35b5043230061e0faaf26acc3c2b5a3f203f468787eb17bd0d0e97523bd2ff00e20a6c1dd187e9366391c40332aa9acb15079c148440b9c012d3b1b198eecec15064ca34c95fbf61cb436c2f1ec55f38a96de7dd181eb29d3574f5eedeb1de168cd1ac86c0c70257516c131401d23567199674260f8a6633aaaf585f26358a075318d8e7dc4329d13bfc6c71e8257469a81d7020a56ff85768fe6f39abd15f423595382a07ae184a33a5d4d7900e2bce338ef2bd769dbe26287faa359532362d53d3d6364b37d669aa47760d2aa48b1c23604d423f8058f6f13ae20bc8c621d49328d46fc291d14e49853c54badde77af50bea255a7b1d56c18c11352b601820626d4fe59e16f1eea4d3682b049bac02563422cdb9007acbb51528f76f248ed1b5d783d2c9fea3abdd85b04756c927ce6481dcc5b5d477cca2af140771b63eb551c293883588a331c1b2d240ce4ca9422899842b8c3006711aab4d1b045c0cf254cf5ccd31c5b51f98951cd6bf49c6ea6af53b8f63374c9330d056c67827d0c14de46155a2e8b5ac7a5660e15ab71db117815e7bbc4e0407c4f1782e9844e19a54ec820d352bd904d8a3b0110e5472b391e5807b894808d9101fc71972e44c4c4c7328a7ba8ff10e9e83dea4ff0011b45a43de958741a4fe4c7d0c5d255436f4ce63d9d23f897bed5edeb29aaba17a753e6658e4981e1b19ced4193134a07bd61c99e305e8278998cc633851d4cbf58a3217a98d758cdd4c47c4aef7fe69a752d8631dc09761bac2bb72659ab44e80f582cb6d3eea132bd15cff001be3e4253c3aa5ebb727d4c5d2a7a4d76a2ad2285500d87b09a4aea23c5b433b1f97412a5a6c5ca19aed36fd358013346956aeb0ae036060e467b46e0d51f82d74878211d46adbff00ea23564319a7acad80facaf40b9de49c911f8752ea549382730f07d2fa43c1b4d3fd1aa5395622270a15b12b61ea312ad2595546b578fc399ce5d8187849dddc6259c36f0b8aca896702d6b9cb5a27fa16b02e0308780f10f2710f01e2329e09ae46c9511f856b7f921e17aecff0e55c32eac6f7427e5352f7f4528544d5565d1091149ad7a994eb515b0c253adacf6316c46ec796bc13a37e59329386acfce69ce694fa4d5692ad5215b161fd9eaf3d1ce22703a57b9838469bcc45e1ba55ec820d250bd90415563b289b54794c73cccc2616951f7072b39e39d4d91f8e31c4b170dcc63ce7b93dcf5985fe69b3e621430a1f49769777a88b48412ce8658dd25343d833e5055e10ce0436663b7582c004b35181d27db70bb5aa471f3961adce56b2b050c4cab496587004a345555d58e4c2c00c085c98c7a4d4a33d4517b99470c1dcca74617ca250045ac08167fa4d6faa7bac62d93da0408a140c097562abaab13a6e6c30840208328a7ecdc40a83ee30266613d0cbec45b9c6e1de691d1aea4023bf3b5456b907262f500c3cc9c4b2d5a97731c08877a823b1f6c910903bcd65fa6d8ca40265ae70467a665b96130602c3b195eaed4f3957113d8cbf568fa6619ee39d5f97eb349ffe9ebfa73266e85a6e3374dd0b42f0b886c10da3d636a1077611f5d4af7712be8a393f3cf347dac203f8e612f5f671cfaccb4b19b6f785c9975b8e99806ff88e04a2e010011ecca9cc6b003de35e3ca1773d819e1d8d174cc62e94fa45d34a9422e009b06098721a05272636a573dfacd3d65c062225404558040262289a8d6eaaad53a6c3807a0c77105ad7bad8ea52b4ebd7cccdea46e0c312cb4dbc41990f4a9667a085a6bfaeaedface1393aea7901360f58a0084e7966112ed3adebb5a2aaa201e83d9240ee659a8ad7ce3f11ac1217a98d66af51f0a9512be1e739b0e4cd7d45352ea0182973d3699670bbd46e5eb1ea743874226d983013b48e426990b3a0f9ca0eda907ca6f85e1710d90d90dc3d61d4a0eec236b691f9c46e2548f38dc557c94c7e2b69f85236bb58fd86216d759e660d26a9fb93178658dde21e9c9fdacca9b2bf8e31c42a33da6d1e93609e189e1cf0ccd866d85635798da1c9243911b86a1392499f605834047c2e44fb1391d5e7fa626724930682b1e5069107941a641e5050be90543d27871b28df286cc08abbbacda00334fa145627193995a0022880403983182f7204e2962574e3f9bb4b03b579afc556c7c20749c3b457229f10637365a19a8d55149c3b60cd538b351632f6267086035f50fb9cccf2c812cd4d558eac259c4c138ad4985b5b7fc844e1d63f5b1c995686aafca7babd0084e6713bacaf5242a6621d558c3dd022290ab98fa6aad186412fe095b75afa4b785ea2af2c88d432f7044349f48b54d12555b077610f12d3afe78dc5a81e71b8c279298dc5ec3d921e23ab6ec90ea35ef366b9fbb18ba1d537726270cb0f78bc2a2f0b58bc36b1e50686b1f960d2a0fcb0503d2782221e9c9b9199f6297c1c7e3d8461323d8db311b7e7a4ebe936fa885566c061a84f0e786678666c336cc43885a173186e82924c4a0c2888222c558040262639f10d62540283ef4aec4d7220f3533a0180264cc13388e9af7d40295e571070dbf7872989454e9a84628a26f5f51378f51370f59b84ddcdc810b43628ee65dc42aafce36b35179c20c089a26739b18995e9eb4ec20c09be6498401374bfdfb88f0b3f39b550fc100381d22ac0b3c307b896e829b3bacb7838fcb1f845907077f531782c5e0c91784d43ca2f0ca87e58ba0a87e5834683f28834ca3ca0a07a41509e189b04d826d9b66262567a4cc6e466666666606c1953ee507f1c4471310b0981cb073de623123b08330e20c72c4c01c8c2ea23599858f3084f61053eb0ec49bd9be11052c7ab1cc08205804c4c4c4c72e2d611ac7fa4e0ae7c471cf10ac6ae3d71d1fc898c9779334d9a9fe7681757ff0071a56355d72e62fdb73d5ce237daff002bc2dadc7532dd7ea2aee4182ed66aba05c095f0f7eec7acae974e806605b87e583c43e58812cf31363fa422ef498b7f960473e50d0fb89cc5d3f5c9829ce20a409b26d98989b419e1afa4f0c4f0c4d826d9b66d98989898989898f62a3d391e46133333374dd3496f5da7f1c630873998132211998021cf9401bcf9e6161010612046b808d6b34ea60c138cc770aeab8ef021262d407785d567ef1fb0c08b40ee7ac0989b66d9b66263d82271bca6acfcc4e0af9ba0104c4c4db3c313c15f49e027a4f013d20a50794f097d21ac4b7f75e71f5d758e6bad774a7865969df6f79568b608ba651056abe53689b57d2607a4c4db36885446ac4c158bcf131313104c4c4c4c4c7de5272391e461e44c26168969570654e1d011f8e611842c20c72233e700e649e4cca23de0768d7127bc063ea6baf1932cdc6b3b7b913495d8adb9cc6dbbb315c01d064c0963f7e822d2a26d98989898f6cce3e336d644e068c2f6cac0730402639e2626262625d6d75292c65de2eb9f08084cf79a6d02520604008f2996f483331313131ec9e4065b2263db1f80d39e47918c66e85a130c13416f4287f1c638980264099cc00085b132c66711ad0235e4c2498f912fe22a8c55464c6e237bf9e235d633ab16ec62717200cac1c5ab69a77aefea5c4aeb403a4c7de19abd6252303ab1ec253a47bd8dd70ebe425542a1242e22ac0201c8f21ec6ab56942f7eb2ba2ed63efb7a2f9095d0958000870209999f6333226799226098063ee07df13099a6c8f60c799e59e4223b230612bd72903708ba9a9bf340e0f6333333333f88612ccab4dd3709ba663590b930d958382dd63282a0cd66aad470a87ce5c0f80bea44d5d6cb71e906e886346ce60bada88d8c44e19c5952ac5cdd60e2da43f9c41c474a7f38835ba73d9c417d47b3081d4f633239e442ca3ce3ea694eee259c4e91d132c7e50d9add4f455d8b29d0256773fbcdea66d004da26263d91c89026a75ca9ee27569a7d1bdafe2ddd4f908aa146072d4d854e2516865c72c73c4c4c4c4c4db303ee87b3999999999f60f23283019985808d6466cf3c4db169b1bb298ba2b4f7c089a103e268ba7ad7b08171cb2664cdd374dd33333333f8232e5e5b21c084c5bab2fb73d65dee292225963de5b27e28bd68583474ada6d6ea66a2e046046a8d8d92b2bd251e6b068b4a7ca7fa6e95876878369dbb183802971973895f0ad2aa81b043c2b487f208783697d27fa355e44cff0048c76b1c7eb0f0fd4a7c17b474e2a9d995a1d5f14afbd51f8a6bc7e495711d65ad866db2ba8dbf15ed1387e9bbb36efa995e9e8afe1513a7973c72cc2d03cde26e10388cf81d25df6bb9b6a9dabeb34da14aba9eadeb060736ad5bb88b52a9e931f739fbb1c8fdd98618a7103b4f10c2c4cdb9ef0245a2c6ecb1744e7b9c45d120ee73168a97b288001cb130262626262626262759933c4220b607137099999999fbc32c19067557227946cef8d9d8d34aae2f627f9a5a3726257a244249f586cc28551051659de2e8d0794fb327a4fb227a4fb22c1a5834cc3ce0471006132664cdc66e9ba6e8421ee23514b77511f41a76fca2370c4fcacc21d16a13e1b9a6dd7a767060d4eb53ba662f12b3386accab53bfca178d699e299e2030bc3634dce6287f580c189ba6f9b84c8e59999999f6bc87b5898fc1e211160e6825407a083f02dcc4107dfbcb7f890768dde1ec65606e3d3ce59d847ef2903d20fc2b01e90819ec22818e4634f38208208391e420fc08e67d93f78619ffc4003111000202000503030302050500000000000001021110122021310330414051612232711352043342506062707281a1ffda0008010201013f00ff0062afd0597fd95b2cbd37e8e8aff2978d1958957a65fdddff00803169bd0b45328bdc4aca1fa7b2fd2b2c4599872330a5be308dd9911486d23389d9e684531af54bb0dd198dcdca421236d12d2f15867978744259a098dd0f045c48bb2768dc5dcb2cb2cb2cb2cb2f42d0f613bc64ad1ba78318b9299919fa6eb16ad765bfa7085c611c52c14531248946d8ba6c9c72bee576a9148a2b44b829ac5f034c4f07c11fba27d2668a3f56287ce2f97a68ac3c1156d22b612c13397856c5b5c2272921b6fb8fee28a28a2b4f51b5123d46c8cac5d9782dd1c0b93333332de89277634f14915f23c6114b716345096c66a33bb24ef456b584beeed4d5c5914f721c0b43337c0d885c199890b0a24e8ccccd2171a2e86ac684363c60f6c6b6122a8ccccc8bdef0a10d594ca7821f18ac25cf6f6f62d2f0665d8f7114b168733399d9176b44d79c1f1a51d3f3827be14318d0a16354a8ad2dd0b54bc16596596596cb65bc208ebbcacce478d6b54a2dbd919242e9b22a96290d26a892cada3c68487b23a6a962a4d0ba88cd17e49559647924785a5ee56c2d968f2785da42e4fe252746544785dea7824c515a3a91b5785158a56caa5ada2289f22e162b0a287e7479ee532694923f484a9775615a5613865768b1e144556b63204c5f6ac51b62f43e47db4951274cccbbc9615ada4c9f4da6656b923032a58d0b43e705b344f813d8b68b65b37c579c6c7d9a2b05c134acd8f1dc4b43163be324492714c8ad8ca56f82d48f04a5685851450d60e518f2d223252e2d8f9c18f8d3586e2c63c1d54511fb7b8960c5879d4d5ac15767c60c42c3323322c6d1393e23c91e8c53b7bbf9253726a087831f1a6cb2cb2dfb6117b12dcca24e8aed4562c583d6c4c7c6b62c298b91696e933a5059949f85b1d46ef2c7965282765da8bf8c5e14514b5256c504655ec65289d57656878218b5485d87bbc2c6c5c8b97a5ab935fb952fc89e45c705b836def264e2dca3193b6f93c2c3c60b1d8bc2cbc21f70b47538ecc51426358317696b5e4adb479d328e633751567e9e74b892e4552926ba73dbdcfab35a846f8b6cfa93b9752287d7e947faa52fc4484f3c6e9afcebbd10fb968b4751e2f45095bd0994317658b8d4cf643d0feec3c8f0f24e4e2d7b32179487f37abf946f9da7ec9aeec5d31f592e159fad3fda39b65968b58d1453c16c5978a1e87da78bdd8868ac5fdc514514244e2a49a674db71a7cad990fe6f5ab9d86a5b3e5a13b57eb6fbbceaf7c6f096c3f02d1e091d4728b7915c995d559dc5dc965b1ff12d2a7069ff00c484a5d54f6927cfedb3a71cb7c6fd8dbd1321c0d60b85da62d5e562f0af24bc0b459d5cf4b255fbb1472a6eee4d6ec8ce39daf74b0e37397afc61e305e813a63e308f0bd0adde8784bc0843b7c3a32fcb322291f4af620beb92f64bff001b27d27379a33a147ad1ff0057fd8b85a1e8ac57a0627b611e1769e2f162e30bc3ce0c421a32fcb32a32af6291183cd36b9d85ee9fe50e4ec52bac1fa96446478c1f61e96f17348fd5889a7c3172f15833729fb95f2ca45a8cff00363db732af252b43edc5fa28f1a5697a913ea0dde09b44257ce2847383d91727e521dae67675134fa76ffacdd72c5c94a87c8fb49d3f40c447b4da5cb134f439243ea7b694c4ef04b06d1989c9455b747eaca5f674dbfcec39f5332b82fa7c264bad194ba6aded2b6ab7429c65c3b362c7c8f8edc5daefbc13ec4a515cb25d56f8d8bb1369ec2ea27c8e715e47d46f82f5222310de139d6d1de447a74ee5bbf71521c639dca9b6c493575bd14df290d492b8909e68a6b07dbe9bfa9af7f40c5a5ba56c7d67e10db7cbedd35824258264a496ec4d3e1929bbcb0e7cbf08e9c144b2accac4e856d94c6e1d24dca556cb4d26b8687aa99456313957df7aa4b32a251cafb485c8e4b28b742577845fc19be11997b1f4fed42c8952823e9f62e3ec5c7e4b8fc965228fe2fa13eb28e57c1d38b8f4a09f290c46d8366e6e56888bd03c6cb1ca931e9a286b0ab3289614433653722994ca6531dfb14cd968427b9b3258d96596cdf4c7d0bd5249332db28ca28944a9218909635842ab088fb0e865963d5451452c6382f40f4ba65148a2b06ac5143d356ce04c8eab45bc5bc7628d8db0b2f5470bf40f5d617d843e714ccc663333316de37e856317df635aa995da68ad37e9588bc54997de6b4276f04cbf82d1b7b1f49f4fb94bdcac2f5dfa8a2b5df69e8492ed5b2c6fe30b148bf4ff00ffc400301100020200050303030402020300000000000102110310202131123041405161133250224271810423337091a1b1ffda0008010301013f00ff00a6a8afc2d7a8acacbfce2d7cfe2934377e8af43fcbac9e75f9b43c9e4914f43d54ab35e9ebd347c0d0d156280a0749282ace6ea8ea65b12b3a4e076d58f2bfc26d95e4d96cdf3c3ceb431a1223850dad598b0e8c4947d98966cdc92a17035b7768a28a28a28ad4f5f81723d1e33bce0e9f61a22bf50b8319a962c9e8636d0db6c8b4912c48d119752bf4d6597a5685ce97e4dca674bd117693d2d9d597ee252e98dea7938a7e48c622dbb6c5c76a09362c18b44f0925e961255426b36df82ddf16c59e24dc9d7843c967262568e9425a2fb0c8f1da87dc26a8c46ba75564f2a1e84ace945447a293a67021ac96735be7d5b8d9768e94c485c17b9d4362745965e4b9d0c8f1dbb7ee6eca7d8f61e842c36ff71f4be59f491254eb4613f192d58ab8c99e4b134d0b272a2eddea4b2f3a18b6bca8a28a28a28a5949d1829491d087ce4b4bd5192a3ae27d4449dbd09b4ec84ba9588b1e4d8b76623b79b8a63c3674c908ad89211e5e6f25979d0f81f3db6933fc68a5165227f73c9697dec2953a2ca63b15a18dd2ec26d1264783cbcde5659eda3c772d18588a3c9f5a24ddb6f5beebcb0e77b32de4f61c894af5aca4847eecde747b685c771b7d4413923e9c8a69f61697d94da218c9adcfa8bc1399d4df69ee991dd8d6e6ccdb4bf1a1762cb2f297dc60b68ea63e7b0bb0b5a22da93449ee5f65e4a34d8f2b2cb13c926f8438c973b11e32479ec6e5aca7c98594b9ef21f6164f25d94486533a59d2ce9126422defe3dd8f166b68b497ba425d11b97dcc5923ce9aca8ace6886c7d41c9365aed3cd0f25d86bb0b3b25c6a8c549a4fc9397292d978f84412e9eb92daff004af7624e4eef77e4f32fe7badd2258927e4ea7ee7516ecc3beaefb10f52ee225c33c2d29ff00ad34bed95bfe082eb9d7869ee34a51526aa2b6488cbf44a7fd23cbd7be8aca7f6b1e8c2fb8aed34279bf570c470762c384bf560e2a837cc5f06229d54b170ff848e9828a529cdae76548ac36aa383263c29be30e8945c1d3d75a27f6b1966e533093bd77a5ac90fb2b5ac967e19156b2f02c998693462ed892fe49ff00c5862e3fba2df726ad0b01be45810f7161c63c15a2cb2cb5adfa36265e7f6c12f2f765965965907d24d548c5da183ece25c57c2679afcac15f3c2e46db6dbf2c7a3c91e0553826ff006ba66274d60df1d2ff00fa7d34fcedfc9b45d3686efd5b13c9f69773ab6485e74d3215e482bbb5b25746345a507d56a9d7f17948aa5fdebf3e957393e7d0bd1049bb7c256c7bb6c5e72646972aceaf8475b3721d4e696fbec4ff00561c7e2eff00b303fc95850e89e1a953252ff171155387f4355b7cf6dfa043c9f3e85e85b61bf96b363133abe11d6cea97b8a4d34ef864a6a32af0db26ba5fbaf052a24ed7ac793e7d128b67d390d35ca25b421fdbcde48d8b5ec5fc22d93fd4a3f09589f56d66f689aa7b70576dfa0594bd0c217bb12ac9a4cc55b42bc2cd8ce328aea748ff004af1297fe8ff005cb6586d7cdd89c65d549a547e96e945ff00e4b8b4bdec949b7dc7e8a5da49be10d35ce8516f82385efa5ad97c8d564f2499d261a575ee8fa35bb9521612e974eecfa749d34ed1d128dba23c9d2fbad53f4087d88c252e111c24b9124892525b92c26b81424df02c24b9124b53fb57c325934565083931ce31da1bbf71b6f96d8a4d25b8e4fab723271771747d483da705f2d6ccc48744aaed3dd3eecf8bf40b524db490bfc65e59d318ec85da524dd64d926d46abce54430fadd2924fe49465075254c8c2dadb9e11892dba22ff009656e5d32d1b336cadca97b2ecde87e9a2dc649919b9a2b25a90c7ba2387272d8dfaab82736aa952627648af9657cb2e4eae52139789b29fb952f729fb94c68b65909243ddbee31fa05a52b684a8e4acecea2f2ba1cd0e6249eedec2c4936a37b714f72528b7fae2efdd31a87edbfec91b1b162aded968b36ce86b28eadb53f4f86e4e3c8e4a2b71b639244a77c1642e4ca436ac93df3b72daf8cb137a979f39485d848595096ab2cbd0fd12d29b5c0db675bae4ea65e51938bb2589262d29a486efc52192d55a177dfa25e858b368a28a144aca8af42f392f40bf22d2efad0d52ce8df2dcdf2bfc0d97e95b6fbf5ea3ffd9);
INSERT INTO `os_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(4, 0, 0x89504e470d0a1a0a0000000d494844520000018500000116080600000089d18ba5000000017352474200aece1ce90000200049444154785eecbd099465595926fa9df9dc29e2c698736565d6004551284389800c0a3ec416456911445bdf6a7ba1202a62f3eca7ed6a5fb7b6ed5bfaeca7dd6a2fa612ec626e1f2893cc5013500335e73c0f111973dce1ccfbadefdfe744dc8ccaaabc9919191991790edc8ac88813e7ecf3ef7dfe6fffd3f71b288f5202a5044a0994122825904bc02825514aa0944029815202a5040a0994a050ae855202a5044a099412589240090ae5622825504aa0944029811214ca35504aa09440298152024f9540692994aba2944029815202a5044a4ba15c03a5044a0994122825505a0ae51a2825504aa094402981679040e93e2a974729815202a5044a0994eea3720d94122825504aa09440e93e2ad74029815202a5044a0994eea3720d94122825504aa094403f1228630afd48a93ca7944029815202d788044a50b84626ba7ccc5202a5044a09f423811214fa9152794e29815202a504ae110994a0708d4cf47a7acc77fea74faacfdf7b185da302c34a601821b810957291290fa611f25feb69c8cb6331b24b1a5b9666302d135996617733c237eef8bda577d07ccb47e4a1cb97727d4efde51c1527deb581e0436fbee2d37fc5077039055d5e7b7d4ae017feafcfa8af7eaf8d8e358ad48c012380612450ca46061f262218eb15144050b8b88340a09482655b489314bb2b1378f88e5f7f0a285cdcd5cbbfba1a2490dd5982c2d5308fe5335ca0047eee4f3faefee9de165a18071001560730624099003c00e925edc62f703817783af7741763c51880c5e73300c706d20c3757ce60effb4a50b8c009b8aa4f2f41e1aa9edef2e19e4e023ffbc71f535f78a48d05630c4096bb8f127e07180ea02e7e377ef9a5de1f20d0d2593ab3b005f8834cc1324d5886899df669ecfb60090a977fce36ce1d4a50d83873558e741525f0e63ffaa4fadce30b98574dd9749b2a828914996120336d0617f467831ec40053292803fa933f8760439ac18609c734b1cd99c0bebf7b67e93edaa0f37c39865d82c2e5906a79cd752f8112144a5058f78bf40a0db004852b24f8f2b6575602252894a0706557e0fabd7b090aeb776eca915d460994a05082c2655c5e1bfad225286ce8e92b077fb1122841a104858b5d3b57fbdf95a070b5cf70f97ce79440090a252894afc6b925508242b932ae490994a05082c235b9f0fb78e81214fa105279cad5278112144a50b8fa56f5ea3c51090aab23c7f22a1b4c02252894a0b0c196ec9a0db7048535137579a3f5248112144a50584feb713d8da50485f5341be558d64c02252894a0b0668b6d83dda804850d3661e570574702252894a0b03a2be9eabb4a090a57df9c964fd487044a502841a18f65724d9e5282c23539ede54397a0508242f9169c5b022528942be39a9440090a25285c930bbf8f872e41a10f2195a75c7d122841a10485ab6f55afce1395a0b03a722cafb2c124508242090a1b6cc9aed9704b5058335197375a4f122841a10485f5b41ed7d3584a50584fb3518e65cd24508242090a6bb6d836d88d4a50d86013560e777524508242090aabb392aebeab94a070f5cd69f9447d48a004851214fa5826d7e42925285c93d35e3e74090a2528946fc1b925508242b932ae490994a05082c235b9f0fb78e81214fa105279cad5278112144a50b8fa56f5ea3c51090aab23c7f22a1b4c026ffa8f1f579f7b62118baa09c080a922984891190632d30694d29f0d7a18004ca5a00ce84ffe1cfc39d20c364a50d8a0537bd9875d82c26517717983f5288112144a50588feb723d8ca90485f5300be518d65c02252894a0b0e68b6e83dcb004850d3251e530575702252894a0b0ba2beaeab95a090a57cf5c964f72011278d37ffca4fad223d398379ac84c938e76d0f3ae0c03302c4065654ce102e4599e7af548a00485ab672ecb27b90009bce54f3eabbe7adf41b4cc4184b683d82218487816500489a404850b906779ead523811214ae9eb92c9fe40224f0da3ff807f5c01393e81a0d04a68984388015a0b094b37301175e27a796d947eb642236e0304a50b84293766056a9d92eb0102ab4a2048bdd109d20c4426711511a23c95244698218092295223132242a41a252a44ac14e87a094059565504c3d540aa6b8417a0f034a76bd3d8761c0b6edcbfad4491c3fe5fab6e35cd67b6659862ca50b68f9b06c1ba671f6f35bc91c4cc3c55df7eec5fea36d74321f9969203374d2a6a1989e6a2235533a932eeb982fe7c54b50b89cd2bdbaaf5d82c21acfef17ef7f58ed393681e9c84060d7d1b5aa082c1fb1e92281090f062cc380324d282a2b0b08e210cac8c4d56d984abc1c49b702284b462faaeb6940c1c824337df93000cbd27f77b98e244ece010a971788b2340381a1f7302d1386b884968fbad5866bb9f8cad71ec2be0373e846060c9bf2486140c1cc080a1662ebda048581b77c44b52ed7c228afbbae25c0edd32de3261ef9af6f5aa134d67ed8577c006bfdc8df5be8aa274f4ce3c099059c6aa798cf1c647e03092c9899096446a1a2f8adb600540603090ca59517e0e5ee0efac2f513ac5480dcfc9a2b36bbacc7ca1844bd8cc7cadd396f75b9ef69c078caf3d37a5a79d85607b6e9e1eb5f7b08870ece20530e94ca60129209acca84915988ec6b13142ee3b258b54bbff16d1f51ff6b61d52eb76617b29a16e2bffed96b4edf5d8c80af59213dd855eaf87c8a470f9fc691c93944b010982e9cea002cdb4710a550868d2c052c51f0192c958af24aace4bcee0ded42b89829b97aff26b33328c3c3bd773d8afd7b2680d4040c8242b6040ab4c0ae554b61a3ccbcf9968f6cb895bd1edc321b657eaf5950e89da007ce28b5f7f0293c32358d335106583e2c7f10ed902e231786b27260e06e36436c77c5a574bea314eed9124a6c1b99e1e39ebb1ec1c13da7a0520b86c8911618630ab67c52333e2fe89e4ff657f2f7171b53b89263be907b97a07021d2da78e7967aab67ce1e9b4dd4bec9693c71e804a6ba40ea36d18583d470b897155791a1320984220f8e3eed94ab25cfd2c65b159769c4994dcfa98f7bef7a18fbf79c46969a12a70132288105f21ed9801195a07099e660352e5b82c26a4871fd5ea30485a7999b7fd837abee7bf218164c0f81e521366da439c19999399ae9ac3c2e4802b699920a0ef71014f69e125060829632986b44c0a05c19140f8b10fe055d7fbd9c5c5a0aeb652696c751ba8ffa9f9352b33d83acf6c54a3d7e6c1afb266670646a1e81e1c2f4eb58883c984e45aa6fd34c21cb52d8a629ae25fac7694d302f29594a533ddb05cbcadd3c09530c0ec62cae85c332a8fa1ddc73f743d8bff738b2d48232997dc4b4544a409c48b0c533a78552886649443daca3fdcbecfcae3ec1f8956fc339e7e5fc032841a1ff9959ab334b50e85fd22528f421ab3d41a60e9e59c49e1353d87f6c0249f33ab4220565dab05c1fa932a466414081c168f48202358b768e18059db2ec8a090cccdbd134cbd7c26119160c018507b06fdf3164295d45daea126bc1d0d95d56463792ceecd2d25b56d8172e29faf1fa048595935082c2399765e93ebabadfd612142e607e9f4c943a3e99e2cb0fef432b5688a9feed0a12d3919456893bf41cda1e58068425fba0c7f5c46f5796335cc09036d4a9fd808286809e5a8ebe76efcf24864b58e23d71a115b6de33cabdb414d6dfb22c2d85fee7e412de98fe6f72b59db937556acf91161e3f7804938b21ba6605b153436432f6c0c0b4566a76c69238ed04a195c0982a056eb1ee41be5712a710ee9f6be0e81b148a02bf73edd47b7fd697d9702ebfd053856d66677b8fceba4d3e3dcb0ead67be71090aeb6f3197a0d0ff9cac5b6d74d7644bd9b68baae7a0ea0237382bca63fb7fc6cb76e6fe8e52f7ef398683675a9808814e5e211d99aed80726a2253f7951cc466090422de89a075a0af15328322edb90afe885fb068595f2380710f45d072256d94a0a92738002419a0ddf7a42062bbfd7f0bee4d07a5a5996a0704597d9396f5e8242ff73b2ee40e150acd417bef9001e5fa0f6b4402c700cc0510ac38d3a067c0f63434d6c1a6da0d9009ee55e79b0783256ea9e27cee0fe7d27105855a84a0321d99f9d0c619cc0b45cd8b687284a605b262cb11a74ec817c3fd90a8ea0fea76f639d792e5020879441cb8ac5e42a86ae16b4a5429a1fa98ccea8adf5b34a3486bf13d0e5f225f794fe1d15b68ed22c1ffa773c53ffbce0542aae519c2955df3c97a090f359692f9f015276245104a75241929ebf86a20485f5b72e4b50e87f4ed61528ec0995fafc3d8fe1d4628833de6671c3e84a62252e17334b61a69a12c1310d38568a817a8491c1416c1e1ac258a38ea6073ca7726580e2cb934a3d716412874e4f21342c2c5a80e578886123810dc37291a4a4ccd04570ba92973bd4f3ef64fb9fd2f57be6b941c1d651170683736ea9c295b3642014ca7a596be728402e2a0d1e9a668492d5fd9db562d74a9da0609a3c87725650998686a58427394d03908010e724a73849d3148eed804483aca680659e97aaaf0485f5b7064b50e87f4ed61528bcef8163eabb874e23a934b1683725705bbc607c158d2c03ddef42bf2f2f7502036d645104338d51350c544d03e38d3a6edabe059b872b186e00bbd7d8f5f4d513a1bafff1bd38d40901cb4368b8f2b12a0308129d99a4738fe842a22ebc864181602985813afb88ea9a29bac2406be85dba6159481555720e13c5aa5d22e12b38a88a8591c71196f606f9cfc5eac8963fbd7b07896330eaaf196f6d020d8d872c431c45a8fa15445184c4b44a5028692efad7b01bf0cc75030affb4ff8cfaca13c730e33411380d58e7c82294e06cae3f0b97414afe9c2c858514ae0938460a2b8d803800b21803b52a360d35b07dbc89eda31e3655815d2bd9eb2ed3c47d6adfa27ae8f1bd682b17815541d77091da3e525146b418f82976b3976910ebe8b2e7b41460c3346d9957ba8fb2348669d9c864828998f92e40a50069c73d17701d98b60dbfe2c3b66c58b62594e4fcdef55c51ea64a3b54cbaa68801895c8f6cae0929d1e31849a2bf8aa2e7f78b1da8280648011e2500d966f5a0e0da8e066f1808b4d3ef19a55a5a0aeb68d1e543292d85fee7645d80c2fef9407de41bf763c21ec2b433849659c148b4202e96a2d04befada94a190c2c5c05642b1dc98122419a85502a84656630ad0c869120cb62586184812cc3806b60bc02ec1aa961e7700ddfb765f8b23fffc38b4a3d7cb083870f9d44e4d6d151464f6099cfa7905d196f57ffab6495ce7cba407396ea5a02d331e138364ccf86e339f06b5538151f706df88d1ae058b05c17966bc3b42cc474278aeb48d374d392a0a297f8c11281edd9750a59a6605b965820fc9e94df646a75c3140e59c769197443449d2ee27617f3d3b3b8fd052fc4bd77dd852488a480b1048592106f955e89757999cbae14fb79ea3ffca76fab4967080becc4a55c69c9585551ee21ee493d113a041d2ed48705647eb117c88b9496a063e9df1293a0db807d11c4291523e92e62d0b771f3ceadb8e9ba516caa03cfbd8c16c4be45a5ee79fc101e393e85457700496d088b9989a01b63d0a94a503d4842719558b609954530152b2198d6caf6940e14b981f2ec9722338680c28f80a661c04b74eaebf90e55d402884c975bdae82232fdd745daaca679d2a15a06c6e5d7f2d590732436824c76e309b9a114e0f89e8c878a5b8c3ed342d4cdd0680ce1ab5ffb060eef3f08982ee057e03506d01c1dc340b3098fc15c8f0cb5dca4f78c8dcfb8b298b89fd52b995efa10dba3a720aef77abe3104230a61b92d04668c2076719de763ac338d7ff32f9f83f7de791fbe379762e2f822c25600b4da404af244070e2f14e96c329b92c832181ee3478934659265c58a77d3409a6a3718ad9a9dfe19ec7bdfdbfb798af34de79afebe2c5e5b5371aff9cdaef882fce2c139f599870f62ce1b4268d56018fa2533b3a28358a1e17a777c455118f9f7d955acf79c9eef0b3209a90930c46dc342312a3e969a19690033eaa06e03cdaa8f1b187f186b60fb9671ecba4c594d774f67eabefdc7f1d8f149c45e1d6ebd89203444bf18b623d5d1a4cdb04c421e150dcbe252dde94d14b92e86d37c41baf08d6a4f2b38030e7de2e701052d3dfd372be924089c85b2d469b4fa7ee23c29c021478d1c26b41b4cc02093e644a4ae601f366956c41d391b13650a865941a71b62ffa14308a2047eb50eaf5683b21c648685442930b09b795a71163d19f8f562f15abb7296aba20b60d016e73258b8aa0acb3011a28dd048e102684c1fc72fbff205f8be9baaf8b3bfbf1b476a3be144168c5421ee04589c9943676e010b67a69175433ea4c4224c028324cf59020c3c0802bc5dcacd093729b68d9dde19ec7d7f090a6ba1f54af751ff52bea2a070b0a3d4c7bff9188ea41e16ec2a62c3819591fba62825edb512748076f935d68ade2025c21263699143bee23c366f51544ea60003958169705797c151296c66341184c205f8568666bd821de343b87ed328768cd8d8c5377d158fbd89520726ba7874df011c9a6921a88e00a68d98aca1b60f832e8a44a7578a52967a86e567d3833997e6e779e71f6a0126bdb22c1e2fcfdfd196c2593d2196caf0f22c9fe20c86cbe902a30b5e137cb0db84419a6cb0735d8c4e1822e4d72443374e50a9561127197528a2249567372c5b76d33a0395f51d7d983b7dccc91228f40040afb5901b3d30931886e523b1ab303285a1ee493cdb9bc53bfee5cbf19dbdd3b8f3de83385eb911952cd099708a9cae24ed3091042116a7e7303b3585f6dc02d00d34e32b33cd4c0da62a61cccb92b806e7d3b16cecf0cfe0c90f94a0d0c7345ef2292528f42fc2f36b90feaf75c167de79ff4975dfd139cc7b83081c577cc31e5f1895e93cffa56c934221f216cb1168edbe38cb39a0c7b00412fa5c2323591db9fc692d101c0c093092c4aee679b0b214713780e139d2761351002b6e8b0bab6e4478cece2db875f736dc36d887c6bd4029fcf3c95975f7d1299c3c3d05383528b386887d0658efa03cbda3e72edda0af7cd97ad2ae1ceedf3568e40e244454ace799550105e67de64721aee29acb00a1dd451a820a3715ad13fdbda480d20aa06560d1f602a23841270ad1ea760508e234956e0916c755f1d18e42b8ae8756ab8d5a630051144391fb287f024eb96be8b6a7f964caf7e7eae4d68fa8979ea91714f23fecb5142cb383287360395be0cc2fe056e308def1c617215421feea1fbe81c3d66eb46a37216d9f8463643a2e91bbcf5492c0b5e838321074bae82c2c62e6f069c4b333623dc8a28a1338960b234941d1bb9685edfe141eff60090afdcce3a59e538242ff12bc62a0f0bd19a53ef9ad3d98b487b168bb484cba8c12b8490c274d11db6ebeebed010421365bde41163e6efdb8e77221e5a040ffb754abea4231968dd1772fbccd7480e7bee0d0b4c5ddc1713083a9028ea50b2f0be1a4119a750fdb376fc2addb1b78fe90bb6ab27b3453eac8c9393c7ee00426e66344660d815145685691c2d3f51a4617746ee4e55bdac72f0cab79cd834ae5fb48dc35cf3c34826d666ab786b880f238c1923c97387f72c52f6e2a5a59cb8040702d76dc8b698af9284110468812e6f31be24be7380aeb8116406cf2670a9ee7a1ddeec0f72b5029eb06f478391606a355a22d85e5fa834b048515ef43ef16a3f895723b08620323ce560c4e9ec4afbc68102f79fe66fcf93f7e11f7779a38a1b6c1b106611aeca29ce8823a09666b271a63059649f0b3c4d2f042a0bbd8c2e9e327119c99d631078620e20c56aae09936b657a6f0d807dfb16aeba8ffd7fed2ce2c630a9726bff5fed7576c41fefedf7f533d31e761ca1a84dda8c1b4152a1650b72cb8868dd4a15b48172531c344f2d8254db1d8e16a1010ff6d9e7268c80e938fb4fcdacb9fca5e35c98b8f6cedef96ed27c9fcb5cb829755a6a3d3102538591498d1afaf195075d19982d79dc08eb161dc72c3f5d8b9c5c46dd6ea5910ffb47f563d78f0044eb533749dbaa4b2a6960fd7a2220af34456a670daa2986825d09dc156a1fc5e57475f3828882ca990f3ea61f67ae63d5809a25d42994851e203a68138cdd00ebb68b53b6867e46fb27bb2c23478e8e0f71225a0eeb0c6f9904231cd1a2b805404afcfaa3a5e3df7d14a69701dd9b62301e12c49249d3570d85529c1a6d0c26bc61b78dbabb7e0a35fff0e3e7d7411c76abbd155350cc75d24d2ff61f98a4f374a27b390c529eaae8fceec1c4e1d3a86f6a90998b0608489b8927630a6f0c1775eb177f0629553090a172bb98df1775764417efe8909f5eb7ff83f70346a22b206008726762cad191dc3860547b258f8b2baae2bb9e7a487705c1b8d4603a3a323181e1e42ad5645adc2be062c55c810c71152eef25975cac0275d17ec756071774ae5c60c19064499832eda0959a609134cd9e1153ca6792056c3001477c5857b03402d6ec15631ac2c44c355d83ce0e00537eec0f6216755389a0e28a51e3f11e1be3d07716cae0db3d2906797944b65a21b3398eb4a85b4f8cca5323acfacca96291d9e6e094a10572c85dc12c89b09f0390518a8fc3366121950ae2bb50271a6d08d23f9d035441751cc6242c74166d9a073ab80e9220da0b76f04c722bef89ca64250a1a81e5eb25874f097d6c4ea4042e1803afb2b83be611048f097350d74259a76170d23c24d551feffa895bb0fff153b8f3ae8770b8ba030b8d6d48e30863d10c62b392bbf4ce0e54f7ca9acf6d703da54a3e9e61a16ad9989b98c2a94347d13e3d299b8f9dee348e7ce037afc83b7829eaa904854b91defaffdb2bb220ffcf0f7d53fdf527bf8596bf03b1db00d085a9ba3aa09a39c8940797de1d66b388e260360a95bc7679d06a28065e21615ead8a8181410c0cd4e1573c341a750c0e0ea2d1a809b0d09220d135ff2ecbe89a603193e6b0611688d812a9ae9fe6ffb432d389965494dc7dcbf73930f8d23b814ea8186616c2cdbab0a316c66a0e768e0de1a61ddbf0d231fb9265fb44aad4c1890e1e3b7008a7675b089881e454a1bc063a291355b93bd7194905283050bf92ffe75ccb90d5c3dae9a65d6ac5f38a378d5760a739cbc27c9a20882274ba013a618048d2304d0103bada48db2196168bcc722750010a3ae2a11d431a14525d8d9e5b0a42475158754b28708ed4d3557a8f8af8824af58643732a29388e03bf7d0c370cd9f8e5d7bf00474e46f8d497eec68c3d86963782c59881e104752b461ceb75d0f3584f0130fe9e0d966c01860c46424b8eacb940c5723079f2344e1e3f8eb1d6019c7eef6f5df23a5925f1f47d991214fa16d5863cf18a2cc857fdf6fbd52327534ca703805f83a9dab0d18552266255e55e1c0817b51b486fe8e56ba5e20bed00ad81a2e8c83299c698886222b926cfe5bf59e55aafd7c4a2186c0e636c6c0ca3234d783e2f15c3b298e69908c119dd23b2435edaa1ea1c1ccdc95338a37a449538b2a3755944656608bb2d0c543da86e0759b78b8a65a2e95bb8fda621ecdc3282db56818be99b135df5f091091c3871061dc347e60f22321cb0969bfa54574733b34553839cffd05a5882c6e46c65173966ca588ea48f2eb6db980f23ccaa1449421b8b00ea004cb364ed8162d09eee3a2bcfc629dc7afaee5a7116490045cc80058505286809f3cac5217d75c4add4df139cff19cf3e434624aec2dccda8145ccb4118857869a38d5f7add7385edf67f7cee1b386eee4037a9c14f135410c2f04c4c1b163c16cc3d83195330ad66e44b8a5867428e2e0d0ecc4652712ad66d1c46a81c7b000ffedecf5c9e87bd50e15cc0f925285c80b036e0a96bbe20bf7438553fffaeff0235b81b53a10765b9403c038b34d3a481301a80d180997524f75d5b0bda62101e9ca2784bab34a1a096b43f710551d1330d50d25572e5447546d64d07a691a2e21bd8bca9892d9b47303c3288e1e1265cdf451c278854d293bb2f7be83c1ea1e309a2ea14d3285dd8ae2f39f951962ca5528a3a4e48dc07f84682c1ec246a16b06da881e7eedc8a976da95fb2bcef5d50eaa1bd53d873721a81e1216290ded099551c1f83cd1ad29677ee7a5d9e9da6abeb1bf2c03b01c130d10a63b4ba0116bb81d44dc4b685aeebc89544758bc59417958975213f849da592daab6fa949e7b420cf1e8358059c1bb1c4742d42010a4bb511b42868ed9cd77fa433a0720798ccb78e62144f5a8093b62cc5fac9019319c6591462b0eaa33d3b831baebf0ebff18a01988b19fecb9d1fc5e4d65bb11f3b504705c3ed3368a28505643855db827ad216102c8ea509cd83f3c5fde95a23915ec1f42acf9366928a4ab0200dc7d6c583f8fabf79e525af89b5d63b2528acb5c4d7f67e6bbe207fe62fbea93ef5ad4751a9d41184096cc717ffb576352c7f1818eeef38aff6c82fb3ac2e444592a299d647b58af1f14dd8b26533c647aba8d7c89fc38238025122716706b0f93d41475a0ad36d23d54979005c149ca6acd0ca4d2b2816921959023bcb50353334cc04b76c1fc32d5b87f182e6a5652fed9b69a9078f4d63ef6c82c31d0b0b4e135dbb86a1ee19f8321e132983e8ac0190c0ba0e171b468acc5298b29514ca055186c520413b5288328203ad0f169369e56e31fed27368d75af1a17b4d83822de7e57321dbe502967ae687ca9ed765819bd2d6871c02eaace2d680435f8ba6b296645c30e85d00b24897994c86858ed7809526e2bef3540497c024d4d6042f02257b402748e8f6312a885005940d3f8dd14c1730d23d851fdc5ec5cfbdfa45f8c63cf0e16f9dc07cbb05cbf3a49e42ea26045034dd0a41c84e998aca18545ecc278f9a135ff400834526d6bc17b70eb8176e274df9cdc7db1e1fc337fed50facf93bd8df7bf5f46795a070a9125cdf7fbfe60b72c7bffa6fea64e44bf647122b98ace2d53c08f232e799f792a9b25a054ce79a02fa94b98b930a5a92a0f1d39e863d58c5f5d75f875dbbaec796ad9b34382095b804dd530cf89a8c29e4bbdd3823e7520a83d41479b5b4768cd025e309970e29bf997b5f51319cb803376e6153ddc10b9e73335eb3bd764973b02f566adfa90ef69f9ec1b1c93944760ddd840ade40669337a82a351f3103b81603c6b406dae840a1dded220822098a5a4c0116579476fb1499432cf65b0ebf173647be27cfaba99777f5cbd184c2b25afe0bedc227ca163c4552a94cea07baa7a4e6c2947a06b2e16a1e3c7d2e7f198481fc9bbfe72e9be84c5003e785c905f99c30dd35939a145d011e262182a8835ab50a83647b71070d2b851bcee3f6675f8737be642bf61c9cc5df7ef5092cd4b6ca5c32c941fc5c7935b680982c510371a2814dbc50c29bc44c26c6a57aec22fe4c40a1a0d5286c18fd0376aa26b25d171fc7d77ef1c59734ff5742bd94a07025a4be76f75cd305f985874ea89ffef7770043d7be5ce941000020004944415423084358968338ce04183420f4bc3c9afaeef249a2c87ec9b390a87c2cd6e26631d2944169c0f75d38ae85f1f151ecd8b11d9b368da331508799902b939e2272dba4302c3ab1740e7e1197e0ce30346a4b8172ba75980ceb1a19dc2c849504e09ebce164b87eb4829bb66dc5f5230e765d02cdf7232767d4d78f2f62a29362b61da19dd9e8983edaa683850c98e90668a704305b00990a56e2c3546e8cc370132f71096d0bd05a60edc6f222594ef52d94a07845e8be125e26b1c17af2b496cf97d6a345ed01a597ff4abb7ff28ca9dcdf5f65bd42ae38995546e0e691d1c51745f24112432dce4b6a6c14a7885303496622126a72bdb9908f309db2dea485a6d9811d4e63ace1e037dff9aba80f029ffccc5d78e8d1c7a1466f42e80e8875506f3460bb8ea6ec20ee142e33288442e3c1d88b8e9788132cefa0a79f5e1fb624472c8342212f33d3cfc65a861de1517ced975eb6a6efe06abc502528ac8614d7ef35d67441fef77ffc9e7acffbbe8cb0328e8465ff9e27414cad46b42b6229b2db536b7039c45770e9685e1d6e0c8b1d2a77829a3d53ea1e4c85280e8138865df130d46c62f7755b303a3682e650532c0706b5693168f7d1723a25b3838ad4d725a5c0df67b16e1e642a298e73c239546d135b06abb879eb08768f0de0b6c6523acf053ffe77bb4a1d383187c78e9cc66327a671a29ba2ebd5d175ab881c17b161c32460310693926954c116970f33aaa41aa168578398f510671dda9690f0745ee09118bca64e8fd56e9ee21c3db30558889b25e70662fa2f3fdcfd4b3f09f21ee594d6d97c0b691423e876d1255b6914236ab797fb20d0b4cc1254b2188932c1fb2bc3050cd699e8fed83add556f2ccca48b412b442d9ec64bbfff06fcc25b7e0613b3f3f8ab3beec46327e680fa28928888e800b51a100442d1edd4aab246abf51a6af53a7cdf4356f7a1ac1c2c72d23e02848ed1f4a4a98abbaee0a65a0ebbb3708dce49a6aaee4a4fe38bbff092357d072f78319de30f4a50580d29aedf6bacd9823cd051ea2feff8323ef0b5fd68990d49058d82484c72f2de9c1d18cdfdff45d384cb24bfe56e5cf41ed185c44c11ed5622911995986e17ac24e3893f27b5332d0992bf591683d663d8bdfb3aecda7d3ddf741d92250db44ae1266d0982cb45e8eee07515397fd8658cc561ec2c477f7c2ce0932601ec24c0a09161d75003b7edde8eed9b3decbe58363800df4994fad283c770efdea338d68e600e0e23b67d2ca4755dd50d08154592a63227525c9c031b153add32cb54e57a22c4c1440091ba83542c85840ab9c8825a49bf91e38245378fd8054c073561a6166626a7d06975303f3b0b353fa71532930fa4ba4dcb8ec472b41296953d459ca16ad0fab010d15d44859ec39224eb4a1d49024f75e1ab0e5c15e3d7fef55bf193afdb8a3b3efc10feeee3ff1fccc12d988e5da91ccfd3d604786c32bcd202123792b6a496ea2ac894375047737414c363a3a8d6ab39ed470e005267a1abb7352dfa326f151d5a769ac165ac2455b8c559c0a77ef6856bf60eaed66b5482c26a49727d5e67cd16e4938152bff81b7f85c7e77c04562d0781de8ad77308e8327a8fce351d86cabb803dc54a39db6d92b168ccb1a1e240d25b6df66d883bd8b26918c3cd1a46479b186b78b8752846a55283edf17c07ca76d0896274841f2845278c10309e591b42d73690b88e14e1d50d1b6e10c24922d4eb0e86c687706b13d855cdf0bce6c045cdd9f732a5f64e4478f8d0311c9e9ac36373063a498a94ee21bf86d4f1d0552622d34524e9a626c3cda82581ecbe19b02e6a35c4c9476b87cab7c06f49f3ec615525c8485cc0826d1912986dda0e3c583872e8380eec3d8cb4cb8636e9d2f69a168b0e242f4f7c2f2f538ecf7a074e6d6db370d1404a7792649d914222c250d546d69d471a2c62a812e1c75ffd22bcee5ffc180e1c6be1239ffa3cf61c9e44481213c3171a114d78cdda6d9d7db664db9c4bd28e814cea6548d264c3705da1091f1c6aa239328c6abd0ec777b168a488558c9460cf0d826743a531ec38811547186f0ee3fbea11fef247765dd47c5e2975f2c77ffe05f5fbdf9dcd2dfa357e412fe1a14beea3fe85b7660bf2cbc795fa95f7fc054ea54388a42a34dff8ad1c41f1efb3f570ff4f7409678ab7b78f1c79ab368478711ef403d41ceefa1665371a2c4c62ace9e3d667df80d7befc07f0bfdd3a869b872b4f91f1be4ca9d916303135876373211e3e1360d25058f0aa588c0c58a90d3706cc284637e9a29575e174e7b1d9b3b06bcb186ede36861bc7abb8be09dc7a1156c4a38952f74d66387cf2340e9c388dd30b1dccc52602a786c46f20712a88e886c912d45522fefa4802e77487d1aa1307bf14a309d32ce182b50be4ff915e019610bef1e33b2e7ccf81e7b8f0e83254161ef8cec378fc81c7e1fa03bc85c85c87b67546183d39bd8726fed33d942523899940a4e0c84cc066ebcc048e0ae01911ecb48b607106cd9a8757bfeae5f8a97ff112547de0fdfff333f8dcb71e455ad98420ab2353be509c986cba23cd9c12647941df332d21f21b154b8434d8192d265675e7d96c6ead86dae00006368f6260740899ad901809e22c826b1970b304cd4a059b9a43d8114de0cf5f7bf39abd8397f06a9c3d1fbff091dc47aa930036c20394a0d0ffecafd97cfeed5d93ea3d7f7a0782ca1644cccad17bc26546d39523b922a090c7349e22bfb307a76203b5661d69770e0d2b42327f1263d5046ffde91fc5eb5f733b5e30dc3f17d21ea5d49ddf99c73fef7912a7dd0a3a661546e2a242c64e66e53819928a01d7f6608609e2d61cfc2cc0b8a7b0a562e0962dc3b8edfacdd839eae1f91711a47e422975645ae1d0d43cee7b621f8ecd2c622e4c61d51ab02b35c95c629a6a64b888483f92577ab38684bd1e6831b8590adf3451f17c547d0fbee30820d0ee92f842ee7e7152168b7978e0bb0fe3e187f6c2343cd01e296214cc38a3cb25a2cf3e5735b9374ba7d52ec52a74ad038be85c33c3801dc38a1790b46730d4f0f1d36ff829bcee276ec1a949e0b39fbf1b5ff9fa3710d122a88c6286444d765d9a1651bbd30d4670cb8c4c5c3d6781d1b98c572a7f49a2cad36b592c499a0c47d38148de99694a7cc46e54501b1dc0a6eb36a3deac228ebb18add7b0b939081504b8c16ee18f7ef4c6357b07fb570bcf7ce6c0bbbea8c25647f7af0eb93900cc24435a6469add68d56f13a2528f42fcc355b90bff3e1efaafffeb16f20a96e91be0967d362e73cd0bde3be02a070ee8aa93caf301f1b0546051d75163056b7d13d73086ff89117e157def4a378e575fd8341efa3fefb6f4ea87fdebf0f6706596bd0401258a8650e7c1888ac080b4600f6a2760d1f2e9938a988d31076dc851b775131128c0fd4b06d7c14b78c55b06b6c003b866c3cef0289fa0e2aa54e7780e3d32d1c3c7602fb266770a00b84a9258572a94d723e2f4f0525f58342d5b3d1703dd4d82b99a9ad9c4a06e9c98b44b23e16b7d1ad24b9f99c540bf7dcfd20f6ed3d06d769204974071c9d9b443a920ca9bd82d48f7f16c7d2a399d411a294550a2f0da44661c00af0e2db6ec04b5ef43c3cf7b6eb71664ee1335ffe26ee7be8314c2e0299338c3062bf044be83b184361aca717029ec9409497a4389980a50b2a72eaa8bcee80a7302ec567b66c788981d048909a31e02a0c5db7092fbafdfb3154abc00cbba83936c68309fce7d73f77cddec1fed5c2339ff9ac0f1f536918a333358b2c8cd1edb4d19a981670c82252c83cdde66ab54670e1d72941a17f99add9827ceb9f7d497dea5b0710f94df1572f173af5be7145ac90ab6b850fe1699ea97773b7f430f90bbce4895ad9c6b1e75a67ed0df3b7bfe011d2b933a4bf106acc3cd532838f08beeac28b66f1f6b7fe04defafae760f725746afb83afec575fde3385d3b501c4352664bab02313669222764284d271d481a5345f0f993da9741d721089475cf764cb921895e00caa08305e73f19ced9bf1dc1d9b71dd60155b1b067609ddec851df729a5f69e8af1e8fe2338727a06f30103b175540706e17b2c3c4c91268c03b0a29c1955161ce6ed4bf28fae00d76e1f20490d789501dc77ef8378fce17d300c5fb3bd728b601014a85425c89217bf3198cd4f0cc74861b39d2a5b941a4afe7debae4d78c5cb5e8c1f7ed976382670f060820f7de493b8ff91bd48dc06945b4757d511a70c242b200d6059ec856048711c03c2c2fbf4746239a7cbbc874f457ecfb5ca78b86ec3c97a1752a654624b5c47a1d1417da48a57bcfaa5a80f5474cd0a5752186397dbc17f78ed0d173c27173683ab7ff6ce8f1d55996c4e9841c667663f09070ba7cea03b3d8fac13219c5d441cb28deceadfff62ae588242ff525bb305f9aadffe84face4985363920fae9174935d7c782b2961907b41b62a917c0b2674abffc5a28bd3bc2a71a234c2d612572081b91ce16323cf19aebfe05196c1561d09e453d9dc6afbce115f8fd37bffc9265f81b1ffab4fa9f9f6d41edb81ee94886c1d111d4fd51a9e46d5bb3e84aca256b0a721a71c554525de0a51357b5a04401331450b4f154895814759561d432b1b5ca94d76db865471d377ac0ad03170e12875a896aa716ce2c06985ee8607a7611678204f32984382f8813846407151a105b5754db2e4ccb461439f0bd017cfbbe07f0e8f7f648557b1227c8a42e846e99186912c34e87a0588790b451b5130c574d0cd7815b766fc6f39f7b239e73f32e6cdeec031e70f7fdfbf0f96f3e88079f3c8dc9451399330483d9448c7490dd8f95f1dcadafd6d1bbd328ae49d2bbbc18920cbd6cd5e93b8308c2595cb76b04af78d50b615a212c5b17ea19f060db55740e7c0777feda0f5ff2fa59ad47ebf73abb3e7658e98655ba33a0debee9fa0b162076165bb0a20cc942578022985d4016e7d655bf3759e5f34a50e85fa06bb6205ff8ab77a8c7e76b08fbac54d6d5b57d1c3da6c2d375103babfde2b99e78e94577994d0a4785c2c5c4451f1b6c409f57ac4afa68846a78106ffdf197e1ddbff42adc70091642f174fff68ecfa8f77e62120b8323489d79a0e2a352db842de39be18d19c8fcbab06e4a8a6491199553459c452d41e70c2b6e796102afc184cd0c661ca0619b70e2184610c0c9128cd512d42b2eb68d36b173d308360d56b179a08e410778d645c426f67752d50d02b43a5db48310f3ad8e645a852c384b98f24aff730d40150f3ef028f63e79089e574346ebc173e07a967cadd46cd4c716b069d328c6c73661787004c3cd116cdd5405cb4566a712ec7d721f1e7d620fee79e210a6160204ca47ea35119a15046c78603a3049fbcd3a0c4911ee6b25f5b1d8784a5e0771b6f309b66d218943714b492f8a18b8e1a61db8fdc5b7c2b243381e891b636429abb27d9c999cc3635ffe180e7ef0ff58b377b0cf073cef6904058a54f7cc38fbd0d4e77a554a6b5d667a7742b426a6d03d358368be237d26d6fa2841a17f89afc982dcdf56eac7defed7389a6d421a2779d1d3330c92c13b71313df3213bfd5eaba3701bad741fadb0109ef6aa8a2e1a56a332d726960e6db1c95d7a414f1d0960dc589bc0fbfef43df8c1910bdf699febdebffbbecfa8f77ff20c16068710d8f300d94803475a389a4d60e4ba5d18dab2598ae74cdb945a87288d848641eabe241f9e5766c72f7aef2d6416905aec9b408f13536623a939a8d836aa150fb1d181114730e32e9ca80b9f0471a6811dcd11ec1adf84b146134d0fd8396a6270c05f15f03bdf7cf6fe9e3d256617807d07a7b1efe0297cf7812770f4c4342626e7912a0b965743685711240aa65f83722b08d9034202c174333124ceef99d374feb5d4efd80c5514e9e5002d4cb119d2a0834ab3816ebb05dbb1f1032f7821befff9cf46ab3d8b6addc6fcc2b4b898eab5214c9f59c45ddffa362af30770f08edf599377b0dfe7ebe7bc9d1f3fa2dfb07360ad2404e455e0faab019bf4e44c3b483284537308a6e6b170720a718bbdacd7e62841a17f39afc982fcde9c52af7dc75fe0b4bb1308a3f383424e9670bec7382b9ed5b340cfb2188abd75ef93f6b8987aef21f9ea020aac386651962515bd125390ee055d385980fff4bfbf0cef7eed6dab26bb7ff7be7f541ff8d414160786d03666a568cb4eaad2b23134e6e4cef03d38030d0c8f8d608014e0f5aa505727cc83cfdb5c521e5e22a15ec4260ba8d8254d8770e9dfe76f1ce9a846b798e60cf2548a86090c98c0e67a1d9544c14b156c2a5b1503594732892a8e8946c541d531e09b19861bbe581a55cf913ed79eebc2b64914a7e3afc4b5dd2b2c8e434a492c767121c5dc428838b6716a621add30c6dce21ca6a6cf606e7111c74e9a98985ac0fc625bb29f02229e5b011c1f4192218849ddcd6ca7aad05ad0a283c57459cea68e4b30f660498a2bab0f8addfdf956d4f97f6f2a4f2b434d7b2ad6184181cf1b465d8c8f8fe0877ee8a518693610274c1008e51c368a62dbd1762bc2bdf73c8093c727b1bbd6c29ef76ebcce6b3b3f9683c239c45584980bd7ac888ae7e5ff21cd07b72dccd88ae65a98df7b1cdde985be5cc5e79f9da73fa30485fea5b76a8aed996e79f794523ff9eeff1753ee0e9d45220c983d5b0ddd995d5fa2e024d25ccdfa674ba3d4fd0dcea2642ec0a087a172c9cdbef21efc4b12bc153fcf57aeb485a4da97cc16e6ad6bea0766e1938d531cf759071e3a685614bef2576fc3add5d5b11278dff77cf0b3ea039f38837673041dcc48a5b31d56749a9fb580d4ad6960ca3999acc13a064787d1dc340aa7e6c3f46d5d29cd80332d031388d8618e9c4cec7d6dd36c005c067559b01646704da0e6b918acf96878b65407230ce1658ca9b05f364766c2703ddd36338be5fe4cdf74094271176914b24c4064c539657d02abbcf96fba6e58a54d1f7bc11214c70692c4c2430f3d89471f3d00852a0cdb4718a752e5cd945056923bce364d39c14c1fde8bcf43cb8888cd2992408a01840cfaea2649f211f23cae2d06a709059aa9544063c5d15b20d7efeb22141d99ab8bade96794e03829df53e9ec77cb739e85e73fff79e8765bb0ad549af72471acabf743ae7b1b0f3df4381e7de051d49ba3184d8ee1f087dfbd26ef60bfcfd8cf79cf040acb3d31f262f0154f579818a43791e40dc6c6e20c538f1dc2e2892989955d8ea30485fea5ba260bf29e45a57eeb6fbe8893de4ee95d40de1ce6380bcb24c38b5124192aa44d16c6527e6d7590269a002d0c42a1a160f051d84c9344949bd0abba75ddcbb9d8bce5d7d03d8635ed32afc96b158734bc17dfafe6de91869c86818eb4ebcce91b320d0a0c947a151749670635ab8d1f7ae1b3f1d977bf6655e5f6db7ff739f5be8f4fa2d31c414c4b81e1baa802273590da8b484cee4e75a691f86ba59a8b268d0177a489a1f111d49b8318181cc054380bb362236685af6de532cde0b32a394c0468aedbb41983c2ed6f80adb06567cd6234e125a285a0fb26d372227d8580a828fe1e7ceef11d282208dd28729e26d4937ecc79fc48fe6d3020e941291777dff3000eec3f250564e42c6273a565e0cf292564b23465c8d2d78246a4b8b7988abacfb644d885004fb7559500a82406d192e853d1aca455c93b3715f581c29195ea1a043e9fe91892cdb473d756dc7efbf74bd57210b6313850479605e8764334ea4db45b01eaf526eebeeb3b78ec913db02d5f9a136db54ee3c01dbfb1aa6ba9ff57ffe2cf7c2650b890ab2e6dde046c19835058387002b3074f2109563139802be8ce376f38395f882c57f3dc3511d4bda152bf7fe7fd385ddb85208d743e3a9925f3975068ac9728d8b4fea988cb3667a0ec79599902c9863889004306373210c7b1b0ae466128e469dd8e0614eed20440243f3e3f0aeb405851b5d5a095191089f2a026c9241946b1c089740fae89ac73067e3c8db7ffd21bf17fbff1965595db6f7ee873ea7d9f38832e03cd020a16407af114c8ec45640485cc5ca263d6c090677171241660542bd2656e60f738ecba27cf437a05a552541c1b569c60d3c010862a3598618461a6b60a8713799748114131b1b2575b08ba290ddb67b3a04c68e5749f024342d7ba4d6991a49bc735346a14a0a065b91c8ad4f7e0b5efb9fb011c3870122af3812457ec85df492298a19e2ca93866df027677b3e5ab543f2b5a4029429f6e070e8e1766b61a8181e791dc506657c673ae4ae57e2c05f607e7dae206a668e444b7a2c410d21863e3c3b8edb66763f3965138ae81280ee01118823658f9ecd83e6209fd54f0c0fd8fe2c927f689a15cf1ab62d06cb727b0ff8e77acea5a5a4de5f074d75a2d5038eb9d142b9e5625fb7364e89c9cc6f49ea30817baabf2482528f42fc6355990f72aa5def5debb71b2763d9850ce1d646fa44abfa0f96ebf30f5e92ae9018582b7be68e72884cbdc3d2764d9ccbd0762d6b3d2d4908036ad0cbed4ec7445c008bb81306f46dd40621b626df0deb438f2ddac2640235050d3b9b00c06c83af0d27978e104fef077de865f7ff9e65595dbbbfeeef3eafd1f9f44b7398228070523aa484f5f5a0a99f465306527257da6738e2076a2930454a196cef3e73d0b835bc6b179db2654eb3efc9a87aa6b61a85185c57e02512cc16609628b79a5eb030a0653cd524b9b842f28ab7dd9d33ae7a862d39ebc7fb59e3fedb6e96586d54baf0017d1ec4b114913034056c13d77df8f83fb090a9e14e5c9dccbbc1508bda00185ca9d8a9ea0c0cae78c668dfe5946ea88cadcd228f47d59589633ee2e51b1b3e7c1f9b35d9e8e2d44b3e8eae9e6f7163a18685471eb736fc1cd37df201b1c5a0d8c1fd88e89240951ad56c07877ab15a2e20fe2e187f6e0fe7b1e845319c8c18b750d06aeaf9cc19ef7ffdaaaaea5fe5ffd8b3f73d541211f4ad1474f6f1053bdfee7da38f3d86174a6b8262efe2841a17fd9adc982bc3b53ea3d1ffe0e8e57762295ee5f79a7aa7c9c45b392de61934c8c2e1da1b41637900172cdf41e5c3c8ee9693714dd51cc17cfad8a258a66c9e537c53552d4301044f851498a300810b43be2a25a989941120450410cd54998360fc3f6a4f7c1a0d586b978147ff9c7ff0e6f7edea535c659393dfff6831a143acd51748b40b3808281c45e905a09f1bfe645609ada5aab645dab40459e893fde731be84421e002239b87f19ce73d1be39b9a30c95e94c5a87b8eb83f4247d34bd0ff2e5de8d83d8db2969d3877e4b40a5851ad95adecf8975a5ee63d130a596b03412bce3c1d511ae9e4ab4bdc5d325616b5d9b8f7eefb7160ff0920f3a0680968120b198b666865c31ffd80d2b0487e56f8ae72385226dc44d79514ee255a4f053369912e2960b3829da7d74a2de6e2e94041dabcb220cdb2d06c36f1032fbc115bb68c0ad0b43b2d349b0348b30861d481e358f2f38435169903d7a9e16b5fbd0787f71e43a3b90561c0dfd1d2d0fdbdb73ba7b0ef83a5a5b0f27d585a0f39d0db9ce24e84338f1e46ebf4745e19dfbf92e3992528f42faf3501856f474abdeba3dfc6feda36b8490647e8988b2040fef2e72f7e614130f54fd31ff4163fe7c3edf9523c80d63bfa5fd2194b36a8f9d59676a0bafa543b43f4d293af454c827c367c69bb31d22043900273ed0eccb48b463287ecf8e3f88bdf7d27de7883b3aa72fbbdf77e49fdf93f1d4158db862c6dc3643b4af111311b2a42c62dd3523a8756a032fadc92d23111fdfc566269c2384b214aba4c37c2e8d8206ebce97aecd8be45d25193384262a79a169c1c4686d2a029ae1b5a4f9aa48eed3c33a7b2b4dbd7c0c0b1148ea3c25ed07efda2ef7261ece9f618da05c8588d850a6ccbc3dddfba17870e1d4312f1be040a9ea3af4b70b7c452d10f2cfdb9d94294b11e4b8f91d7b50d0b5e4a6a0d1316b39ef83b7181a59a8e5de8ca731764aa3bbb0918f46c44583b412b2ba5a5683a60ad1b371eba65a8ae0ba9d507b075eb76ecdab50b63e363b0e86a93bee0bc0f5b7f92d681b4e316a2288169b9420d3e3f1be29e7bbf8b89c91918ac75a13bcbb4743323c29e63628b3a8e831ffeed555d4bfdbffa177fe6e5b214ce35a265e19074d180192bcc3c790c0b472790d1d2eff32841a14f41f5e6f5f4ff27177ee62391526ffbc8bdd833b405d5c080277a6799675eef0eb5eb60c9fb2fa97fb9925f722eadcc8da682281686e628d27fd2cb57a4dd1bba62f6990fa6703240e9a52ce1b710980e62df4596b431aadaa89e3e807ff773afc31bc6572ff38823fa0f7ffdcfea0fbfb11f867f23ac4e006585482c0ac987c5d8bad3ce77d23d9c40e2472f8070f9d5b1d2625f4cf952a1ea9e1049d0865df3f1ec673f4b3e0335ca8e0555ec3dad7b5167b4ce24638854d7a4823091a6ba4f420f2ae50a7bd96a23d78d140f8b35c00ca8dc0747ffbb505a6b778995d480c4c257bff6551c397c440311ad3ddb46c5f7853683fd2a062b162abe8746bd8e81461d1eb3a4061a92f6eab90ee8ebf73c0bb58a25b9ff92e1645aba810fbfcf1391643c24526595775e504b70d0b90a04cd44dc8b6118e94e75618a4eb78be9d9394c4e4dc3afd7b179eb76d41bac4e8e248bcb367de9d79d64019411c3b053a9ca765d5651bb0200c78f9ec6bd773d80d6cc1c50d32e23d3f58486841de3480debbb16b6e1040e7ce8eaca3e3adf3b76f1bfcfe3533963aed56150fa24668e9d421a9dbf9f7b090afd4b7e4d762964e27cc79ddfc1e3d55118dcdd913325576852782b9e019dbd520c287024bbbec7f02fdc06fa5c5153cc412f74e333309ad10dc334cbf31d31dd544ac14d9909612264bb50cf4112b6308c2e46164ee36d3ff64afce28ed505853ffedb2faadffbe22350de6ed8dd10202878d4d215546213b1d3919a04bdf55db28d964161e9d9571669e95d3653491d665031c81fc7c2ff3f54f771ddceedd8b9f33a0c0e36a4831c03a492af93692b82d414d9120795f6112dc3f672ac40bbb6b4d5c1d159cc3412eb4303045d25a4ceaec242a35ac3dcecacdca3e255a47732f9925cd784c72c540b60f6a6642b15ae31868f25f5953a3591ddbd6ea14c8b90d684de64f0ffecdfac5d418585a2d789864f435c6274e1d03ab06c476a2b08685d05b4226091e0d0ee60b1d385e5b85291cda0baedba6245487c22b756e4de42fd93c1b32be876223cf2f0e338729856109957d991cf84697b304c07899822298c2c85e738d8661cc3810f5fbbd947e77b1fcffdfb6557241b15c5736d1cfdd5671bf62f7f4265e45a7a9aa30485fea57d7e4dd9ffb59ef64cb26ffee6c71fc063561d1da302b2ee6b306090380f181328f254482afdc86d698a02799b0b1f76fecfdcb54032b328af2d28f6ccc58e76b9d099ddc32cd82cf13dcf91e44dea49f1cc207644a5e832c81ba31acd63b83b8db7bce2c5f88d1bd83e66f58e3ffdc017d4ef7eee2164f64ed4e845310274e9a6c8aaa8451662bb2be05b9977ec0000200049444154c7e75d3ef23ec74bd1052d012aa23c58a07ded222b5a497477d05544fa079d5d45c54c6a89b1b1118ce57da8e923e76e3d8e23e93697f7a45f9a87bc2b713e0c0d0c045216c5f99e877ab5829a4f0a6de94103c792720319869fa4b0b2284f0766509645665aa917f529325a47b852b54b4cff5240477a19e471255a0619b3c3561c8c2fd12ad142e07518947674c577ee8ea47b887511dcfd33a6d40942cc8429dab1929ecf266b1f2c0b09cd0a76cc63a6560e3809349585229d4866c3b5aa9241b5ffc9bdd8b7770fe66666440e190198ad42496268571044296cb2cca6daed47ab672b8ee2c0df6fc098c2278ee6debd25bb7ef55e863eaea4b9ccf42b682bf61f01ba9333983f7802e1740b4afa749f7d94a0d08760f3535655b93dd36ddffaf16fabc712070b764da8b397b35cf2fcf222cf5cf2ce155cc5ae664b8e74b9b40e1be44a22f7acebdd73b1088a14c8c2c2d0e7162994e7130ba93544f9e41c43ccd14f5929cb7ec0711b43691b2fbd7927feeb8b8757556e7ff0e17f567f72f721446a0b8cc53654d6922c2da455f8a18dc4eeb253680fef4e8fb5b0c24a605d45a110974081a777b515c0ca68ba60c216b365d87a94e0a03b89a54988cd5bb762c7f66dd8be63bb74908b92c51e40d0b320fe7f39f457f69c6657b19c5316b6a9e9b2d957a156f13150ab8a0b68986caf09d336e94ad1c55dcc062b120a84e9db30d04aa978b525c08fd439498056d7b1482d0bfdf3666529dbacb03da59e45b084f10916bed950b62769cc7413d165444ba0d5e948fab2cea6326054aa480cbacbc8d3a4243ee0576b0218a6e5c0af54107443248ca8b39adaa94be6ecc4f1097cfbee7b10b6e7e19831b66f1bc36fbdf32d989d03eebafb5e7cfbbb0f636ab605c7adc1302b48324b2a9b5dd7c716e304f6fdfdc6b314767dfc98bc602c98ccc346e77bb556f5f792ccd0db218f519c24434559689d3c83e9432710ceb4728591afd4b24ea1ef395855e5f64c777df7a7bfa3ee397e0671631c91c15ec0163293fd750d185e459ab7f0fb28653f648506fdb32c40b2a8144cd9a9c90e8141cbdc3520f55bb1f687d3b7cc0ff54a9a37422988d0e4fc3e48d132690ba33b80c95e55cc7f031edd0c510795b885dd630d7cfa75abdb42f1cfee3da8fedb239330bd9d30e717d05a9cc46c6701ddd90cf662862499d3993f0c6272879c29cddd2fc55a79509581de3481e154b5d34d9adb17a9aa0c3ee78156ba3f985a99cfbc56f0da8727910049df54f0b9dbafbad8bc654082ac2323c3b203a76ce942d185e70cfe32c8cb1d35afab6994792fdd5781960021599feb984ac0827529bc009bf2f03e2c2024a11c630b7425b1756951a02c2d3ef32c2b3d643d4eba74a24cd355f3c371f1aba420335610c53a5e40059f99f27bba8cb8b60804928c209b0c6d7dc5996ec549f793a41f1816ba61846a955dda806e378065bb629d54fd060eed3b8c471efc1ee2561b69d8421acce067def01afcc82b6f874a4980e7e7c16de0e8f159ec3f784c8af68e9e38834a65008e5fc578761a4f7ef83d6bf60ef6ad15ce73e22d779e20f138623627b24899a2bbe1f5f18aadce10ce0284627fa2609b269cc4801d24983b3189e963c711d3279859c8ee7cd38693f3ea08ebc2afb26682faf4c169f5e499051c9a5c402bced08d13b4d3140b718c8e32109a16122a0bd7d541b9c8479aea1798fb9158767ddc3eda7a97c8459866a84a6649f1c963d39666582d76139a90eb6c935227269d6dfe328d50c7a8239df142578c7224d3c54c22d84907be15e14f7ef8b9f8f1cd3adf67358efffcd009f5bebdb3688583686619ea7e8a888c47591dcdc843375b407b76168b53b3989e9e964a59f18f93002e6f686f598e28e8342600d0af9e676049baaa3e579783e8c06c260562f9f3cb9314b2e8fd4ae28caeb86c7cdfc3f5bbaec7f6eddbd06c0ea256ab49c60f77ed74a9282b1585aa6875a84c838e6432b157332b7f0d901c53c6c65fd185257582cbe9b5a2a3737718cf21081571050dd6cb562267335a51dc2851979e708ff8fcb9f9285a888a32a135a265c3ec23c9d8223d875800cc7222da31d06e0b00074124df7b9e8f4e37c489e3b378e4a147d09a9b47c5b19076e7b17bc7287eee677e14d7ef68220ea651adb988330771c40d8b0dcb62d5b68d6ea8f0d81307f095afdf259c4fdbbd0e1ebee30f566d1dadc65aece71a95dffcac1ad934068f95dbae09a751d11c5bc20e90278df473a18b38a7109606747d81deb7583610d41b412cc47bf3472691ceb7303a62e1c4fff3c60d27eb8b10d125ffc91511121930c98f4887c6420adcf7f051cc060126e6e731b5b880561863aa23a55302026c78cf443eb7de4062d8b2f80810542016037a8acdd1b92835bbaaa21f386f9e42eb82d94ed57e980e52e6c72ba456844cd20dd952d22329121cba446c66ab2ce27523067ef5d5cfc26d17d11ff95c33f6a78f9c547ff3e869287b336add365cb38dfa500dc3954d188c5cc44617761aa36258703d0f4137c2fcfc1cf6eed987f985052c2eb6d06eb5d16db5d11818d360aab8fb76c5ba5858ec8a72324dfedb11c0480dcec04a9f70ef2bc7dfb1694ecee19370e71d696bc436313a3a8a6ddbb762c78e1d18196bc2ad310ec122c10069468ae84480c075793fadcc3b61a65336f38634d2aa53a835962b098a5ecca25c72f7844e21ce9311723540c02fc28a45c1a2d0a3f4d4a914b29674d4a2d04e004989f5693bba1e829645957d96f34c240d140eeab5069238c5d4d40c1e79f8511c3878102a049a0303e8b666a1e20e7ef60d3f86d7bde6b920e2459d2934073c2c2ccec3f007e03a8e54d6ab94195d0eba41824aad29db93479f3888c7bff5057cfa8fde7e45dec14bd11cc6cfdfa924e5d736501b1e8457abc06e5431383e0ac3731016ad4d2f83e9b05258bd6e24bdb7d1d98692d59655e1050b48f6de8f3d7ff4b31b4ece97324797f2b7eb4a50fb09160c1ac519a6c30c8bdd080b9d0073dd10f3dd0427a667311f2698eb04c294192b13ec7cc02e50f4a5b3b17c6a5948f9bd6922915d222b8119683e3b334757519fad148d94bd1380d80a915a644a3560a6a4d3e64e8fa013c370330c4ceec36fffe46bf0c39b81ddab000c7ff1edbdea6f1e9b803247b1a362a259cf607940dd1cc00029b4dd1815c7804745663ba8f815787e053e7bcf9345340066a66731313981bdfb8e60667601533373586c8558ec4470fd01647041f718d34ce9d06157301d2dec5d02672f07c90663dd002d0016651110c8b4eadaa248499361329d9455d4cd3a366d1ec7d8f8389ac303f02b1e2c87c1e0044114884560935c8fa9ae74f9488cc090f69ae297ee59c5cbf1f4bcd25c1ab9e8b95a8e33b1b8cec9bbbae5395139281475279a134b776fd3d41dbd57c8ef4a6b843509215d5b4c77f5c4553439318d13274ee2d489d3585c5844429f75c547da9983ef2afce0edcfc3ab5efe226c19ab4045011c15b124445a90b2d0ad4dae29290864203e7f5e02335bb9929cd0f790ce9cc65bbe7fcbba7a07fb5126c65b3eaa0d2eb1c4f4c7f17db154eba34318dcb1094ea30a6eab94cd2af8f3bb6f8bd0d885e088589c32106df1e943d39e900872280d71fba8811fda51c5bfbe79d38693733f737139ced97082da172b35dd02665b0a73518a43ed481abbcc2cb630dbeea21d6708958140289715a2344560ba086de969d9ab7a24fed07b9859454021b103b116980d65a59e800273f149379dda091ae1249eeba478fb4b5e80d76ca597fcd28e8f7eef90fae8a91003c3bbb1d94a50f7bb703c037e56c550e4005e2cfd1d98e2c95d3e3b8a69dfb92eb4a22263ee3e81cb1b7430b7084ccfb43031358f93a767f0e4fe63989e0f3033d746c80e58a683500ab97a5ea4a7a866d66ce8cc30c912a2bf56d8f3e8b78f745c40f840a4781a484251fe142ae9351a430d0c8d0e6384647d037571372915c271086cba5da7ded9e52d3bf3ac22015f16eb71743929aeb61a78de7242818e345497f8b3f4d368052f382dffe7f813c978e25138aa684d08cf8e6549b611339092d8c599330b3871ec0466a667303fb708db61403c13ae220699a9f49e7773133ffccadbb163fb08aa6e2a858d3ee94622dec7860d1751ac10556d89af9055d661ad0883e419abce99c9e0c0723c78c11c7eead6d14b5e3f97b6fa2ee2af7ffe4e6af91e679fde5cc87f7366db5ab381a12d9be00f3590ba165075749f857368fdb3ecd3fc1ffd80832409083b420a23a15b591750fa74772653f8b9dd43f8e9e76c455071f0ebff6b1fee7ef373369eac2f627a2ef54fae5a21ed8b94ea74215926134180934117ed4e170bcc3ce9320d31166b83b4cddd886ea104995193de054916234e2371c35864092d9c1712dfc8308c4578ad59dc3c58c52ffdf86b70ebf6e625c9f15b0b4aed990a605a3e54d885cda0adec302da9af905a83b3183cf5ed844aa23736c234785188548ce25d153033188701db65663876ec04f6ee3b88479f388e63274f63a11bc1ae34e4133248e754a53b5814449253efd42b52d92b602479fa4230a515829deff26931e4b4def2f3c21ac8776efc37ad0d927bd7ea158c8f8f62cb96cd181919c2c0605d524d193f58a69f603aa70e201714269a836879b9eb67ef713ce5bf2c525245e94bd88731165b40936e231227b65b2dcccccee2d4a953989898c4626b1169668bdf9f1c539a96cd901ed8591a0845c84b5ef242bcf295df879d4380916816734b805a560c7cc7144b2196eb7761fba3bad7827090d39d16c376756f0e4993cd0c3411e1c76f1eb9a4b573a90ae0a2fefead1fd6902e05943a66d56bed496c2787615a44d54dc3a88e0cc2acfb70872ab24675365d7e88d5b19c33277b85bc90951bb3a73b128b9ddd48110ff8695300bae2b7f0221f78fd2dc3b86deb0066da013e79701e9f78a28dfdbff0ac8d27eb8b9aa04bfba3524800e8b6a28381d645a2297ea4eab5a8825de97acf821455db801d07f8beb14be741facc89442d2e2eca0e9a2991dced3e95c573a593a5ff8967ea67a7d3913fa07234e8668387e9f910474e4de2c9834771e0d8294c4c2f62713142121b706d5f8ab7549ef925cd6ad20c0995b3a4bd9a308a807ec2c6491c37c798bbe9963a202d8f3b333535b9e638d295ceec5bcce23692c8d19ae0f806ebbe1495317595ffa65c18f495c0b358025ae11720a583e81ab008eeb46482201442c480f5075da6a386e8b43be8065d9d8aca20780fb716c1b3605b15865549c84ae03a5c101d6cdf3e8a6d5b4771d3e6716c191bc6e6f12134aae25697278e820564492095ca2ccaa3d194aa448081a5341c2f5338755e96256d48078d706382c2cf7f44f3c548705ed3b1f4e8f7a5efa51649762f526402afd9805bf350191b84bf69500a59c8ad451b4ff8c8f2530508cee2bbca890e739795587db49a4d0b566a2132630cc48b785eddc30fddd0c02bc66a186afaf8daf179fcc38313d89b7958cc4c1c79d3ee52dff5a1364a21f521a4cb75ca63938b6ab293e074a8a781ee0c215f5b6550a0ab894a55bb7f80288ad189b41fd8abf9649b068b414f4e8638797c02c78e9ec4d1c3c770ead43416da54b6061ccf83e5fa3018f4cf20e99a29778879f1a0e624d2d6c932eb6d0108f93213af5151e7c044e14c57144bed01cb98f31847d8d5da6489af82d68e760b0941a27c653ca5a8a1ca2d989c2557571a6b2e257938a98ba12eb644c685454239cbae545c69b9052480a029bab330805bb16119312c8b5955115a13a7506dd4b0697418d75fb70d37df701d76eed88ccde34d0c36080e40bbb580bacf1a0b021729dc75bf10c7f1a4552a95282d8541a38bd73d6b68e3bd836ff9e432284845e0ca47282aef35b58c8003ad03c94d06bcaa0fbf51813fd680bf790046dd971ee47407e95e1e2c6aa5bb50a74adb2a446cb8c230508b32c45606f6f0e0fa1b8e026c6e04f8b19b06f0faed3b51a918989809f08f07e7f0d9e38b984e2a8885af4ae1c89b563795fc72e9852b7ddd8db720afb4c42ee0fe873acbce1df1a72aa013246849f1541711e9bd0d1bb15359cac811370995d5ca862fe7f0f9f73b14878a5c388eb43b86875faf204e5289b930738b3b651669b1418d63d942d3d0e9a4989acd70e8f051ec3b7010474e9cc2cc425b02a5a6ebc371ab4211c1f03303fa54d24b0506627115cbab702668b23a4d4541e54eeea5dc7a602a6b5e5f22164ae1a5caab9075fd00fdf23a4140f7bfc9dd5879fc808a9df10f3d0e51f7da72112b43d35fd0a2d0d722dd05cfcdeb34586b21ae900214840c4a78930cb62e35487a47da0e5e0788c20ee2b023b517be63607c7c1837eeba0ecf7ed64dd87dfd38ea7600db329026b104eb5983c1ae628cd11074384682c2ffcfde7780d7555d59af5b5f556feebddb181b30c598de099850c28021244c2665fe24a4939000490849263d93323319123281106a42805002980e36a6d858eeb65c25cb56d7ebb79effdbe7dca762c9d6932c3f4bf2bd7c42b274df2dfbec73d6d96ded8b660d6e2164ae3a7138e749d73de28102016e67c246d6ba159cbad9ff53cd8f183be169f28a0c08244301040a74844aa3088c2e815a1ce58d9d2c9e594860203e464923c44716e3e13513213888ea36a6156a38ab3c88134787515c1444635b062b77b4e0f5fd0636a7a9956e90d73489ec35093bae9de0af77390cbc2fa41c84d4df53d6ec6f63e4ab6f27421dee1f159384f62b82ad5330b5d14245df2d0aaef29dadc85ce90908749581bb8fc852102e18cfb523016933c5efc549e93c6a72c150eaf977f933ea70a408ef78496eb5f604d0124f615f532b76d6d5a3aebe112d6ded684bb94864bc05990ae378da6bb6c2a893afc9953bad095180270090be444c417459e305d61d8750d1ce2aeaac2cbcd086c77e9a4511aad2ced25970f65501215d62213c2755c8d80b4af3e2486aabc93f2840815b3c3c902f48f588b6823088d70caa0acfac52e87d5ccac2323c0a7213e16000e5c5112c9a331af3e6ccc2b87115bc668351705ee6d1049e8d440058040317cd1c7e5931d20df777901cf3da21721f791b00d19a955c6784a6c234103b7e090aa386399435269a34510d09f140a9aa846061105a6904a1d1e5902b4a79ef251a798d14cf911042064e308d19ba84e38a749c3ab11c0b8bc2d034095bda5378aeae1e6fd5c4d0e28e41bb26f1cc445ec3240b58a063d7b513fdf52e87c5cc17520e42cae594d57571d69e3610332c6e0a43d56177498315c04087e7b2e03f93f8450575dfc7c041a1b76b0b92383161f99579da277df776ce0454bc66830a0529b343e595c10605be69d1d779e74bc4e2c0ee7d19ec6d4ca1a9a909fbf6358802bb5406866972f2395a306877ae0575fefb4030c2594a1dc305ef78ef2ddd223f88a4d4b9c8f42d973ecee0bee91c8a542898cf7de459da15d15ba293db5f5cc3a5ded15c7602c0848b8ac6afa30f1dcf388a32138e65605455092e3a6f09ce3a6302e2ed040829c812018c8352c9c62553c70cbb3938f6e37f652da9042c456c16342a36e5817a1a4a4a1227372565ec89f6b1328fdf50d69b00447e2e773b5271a268dbca5d7801157a810ebd2882c28a08c295e5a848b7225aa0e1e48965985c11c2dc020d532221d4dbc0c6a6245ea96bc2a6fd16f618326c62b04500ae4cdd1da95b9fd810640f1f14729b4dc34e21737bad237fd6e6b8c9e2f18c60d5ccd8a2a88eea23282e4019265cb29d0ad9f953a7c8857383b28cf20d0a9d01610e061d0f277cf5946dc48bf8e0c0d58869952c1a8d5390500d496b2285f6440a864db41140c60ec266118f6a44b886041329b54e75904ea7914ea5114f25914a9ba8abdd87b6d614ef3120a0282bab2c819f583006e7a097cb0514449fe96caaa5e8fd9cadb0ee7c1246f1090f50052870a8e8423e28e8d7a31cd8289e9084ae58288c4a5874d22c9c74c20c4c1c5f06d38c239a69c735b3270dd68b0e8eb8fab8ca8a9abd2c6d2bd8b33f86879f5e85c68401ada0049bb6ed831b88222d85201b71480842961dd83cc0aec2250b5812752ecc51a1132d09531190529028694376a19a2eaa8a15441413a72c9e814953aa30734229c61684a16b2a52b68dcd4d09d43427f06ebb85fdad32da59108e4569cc4c7476e59a43f7d5a174a5bb61926f29e4a821c34a21737ca72376dab696182382b4baa4898c4dee0e0a5c92df924834a8925a8001b946a83fb24847ecbabe754243f621691de2ee843e8fc1b514b2cb1dcff4f0328568cfc65d5c641d50905466c8b826d24606896406edf124d2860d460ca2948e282bb06c4ad2d5c124aaa413dc54bcaa94c0465679b15d96ca9a76954421fde61babb0a3a68e7727eb46cd4d3b6ebe301f4801dea770fa38a1a7dc7b7ce00010ef094ad9a9427ef42c8e758d5d78c0e60189643850a97e8189b4554db1904937a3a23c844527cec129271f8fb915412c9d78f8d96b872b9dfe7cfe99f777b292321563cacb115055ec6d6a83168aa0bd31895757adc5f4b9f3f0ceea75d8b3ab1655e3266365f57a4c983c05bbea9b505c14402a994645a480131c969787110904308ee2098a8c79532b20bb0ce3aa8a11cba4b9b5fdc6aa75d00385d89db2b0c6b2d02015a0dd24df12b5975560a80ca6ec22c09b34f57c13610f8bc3b714721b691f140e21a72dcd19d696ce70da8d24158b51ca2a512404833cc02ad1ae91511097e8a1c97c16ee04d18b80b87904fb68073078ae9ace5b663ba8e53258830c0a64b6f3058cb285c48edde68ca22a4fcd8d1b061269038dad319ec649ef4b8168f205732a695e8fa0f0022fdb1114189cb282fcc49449426e732ff04cc1599e6e0b201429c46bafacc0c67535bc1d27e480879ab453176e988eb4d65cc43258e7645368b381d36c7fd16ed7cfe6e5f7b2f81cb02071a658af5adbe5541716affccea4db91696f406955292e5a30060f7ef5ca613707475dff6b366fe6789c76dc44ecdfbb1327ce9f8929134621d6d08453174e45edfe368cad8c825a83a8cc468cf45ed439f2c24b8d3a0bda0aa21115bbf736a2a2a40cef6fdd0d2d14c49a75db50df9cc1ee66071b76ede7857eb1b48560451542532723545902aa53e334f734bfe40ceff54d594b7d1d3e28f425a103f6b0b99d3eb2cf5adb9060494341ca3091b629f428c322b709b983a8b702674d7511464274d1a286f2c427e4153cf1e6328244823b5f8c6c07324f6c9d140dd9cda6c878a145b9ef6330418181c9a2629b522429fce94045da019a13693425921c142c629764946144c163020eaf6a95338c52b7359e610e99aec503b522bd535821e2793dd8e34147cba10e6511ac5cb11a9bd6ef80a244e03ae2ba1d79ef1c3a06db52e85bba1d855882dba38b3ba823d9be836151c4600e351ee44b3738adaf2c69c2c7ee8aec2c95a83d1406cb36303dd28a75fff7f9be57b31c1e3f9fa728cb1ee664299aa4f0a648929346381842ba752ff49084f9d3c6a266532dce3ae304d4d46c41d998722e874c2c81e28228f6ee6f47715119b6ef6d422024615f730a4a404373926c551906c5ed9590a03d976d1eab508966251040b03084d2c96311ad2a87452e23d9a150456f46420f91f8a0909b960c3b85ccedb5fa3e6b438cb1588ab881d2489b9620d493891f482cd0d9b69e6203980d12f332e22e740be26f5d8f2e67e6a0a807ba1f0ef1dc5ddc1bd967ea78ae0e778604621420323a5101ac700a6d9eddd3e5d214f3884b215e7c4616407bd2406b3c85c6b63807074e6b4e1604bf6e67f6460f974ac7ab77a6251e6aaf211852354e21bd6deb1eb80e0524358fb934db32556400e5fde8bad3ec8363a187a7a99787151b836ce6993881d222c9ac54892a5c96315ed987cdc3b0f39ab4ec51afac83fb03799c5db5d270883557a51ed5945c40f51db4f910cd918858905a84f0fe372440ceeaabc1726280ab7a5d51029cf198cb89bb1245a038cbc1253c9d12d4b08e4869318ac75541a92ae05d0979e328ca603b84e2f8a090dbac1af1a0b0b535ce52a68ba4e1c2b02c644c8b535b502f07fec5f3d8555e1cc517c21cccd0dc44db9fb37288291c62a1ea16c4765cee9fe54ca8deae9d53457b855ea28fa58a365747736b3b5ada6248a60d646c175a30c269a6052078132c87ded6b9be69161456bcf53eb66eeb020ad9c02dbf97070a39840172bd6fbecfe3617c4e16d7bd190c9f6c343e20d6dde10c0a54a790b50a45611adf1ef18409cf82621a0704eaa12ebb44b1ae40d6482789b25dd058283cafc0dbbc9043d2ebe541c4963c3bce2b50ecccd2f3a85d382f96844849214a265642af2c8115a22cb96cfa6bc7aeaedbd0fba090db4c18f6a0b0bec5645400655a162c97983cc5e24fbe7f6ab9485f7c71f4ba7a71873f5ff828a82a9cff54b82576285d499c7313e0e09cd53728f41ca8aedde53a9f82bba2b8df9f1a5ad28e4c2cf244994d3d29e2c9046289241ae2c45e2a0a026455e772e0141f3c1f8af896c41d89706cb00e1f14463628648142c002255e90265125387114119d3df7a275141f76eab4c87ae3d95e94b2ea6d4844b1612fc9199e4252f12379680bc655a274da78a028045316bdddb3f5365dad7c1f14729bc9430614b635a598a3059074a8845d8193a2e62e825952b45864300db3e3dfd449cb66122c3dc45590b25eb28b19b94538299cb763a6002663c477239c21443120ba6b79b40cdcaf2fea2e8f8e40fa5e780ff460f38220b16c8b5d5af65f720016f553a048b7aa734f7fca72d09e4ca32516e7ee329368abd56897863b8c575753a61037d8b380e0ede87253a5becff24161e480426f8b750f0df02acd6913c61b2a31a232e928cf39e074d18a55588ab99a89a2e31b77510555148eab42785215a40851e08b0818c51bc455fd94d4be6768e7f0e47aee113defa5ea5d2cc91498aa0e25481cf5d4f337db42d25bf8bad364f2c5cb20defa8ee5d17379701e1519322dfad92c056676d448f13d763696d841b74c90d0f1cb23faae3d2f9e1b28747e2edbfab03b20f0bf6b51a40c87a78d52f8775f4b1b9a6271645c09264d4c5e414c0e8c00a779e06cac59b9f2c92808a6b3703398de341f1446062880fa29f4ebf016fc9c52af0f811b07b9a768d9ca380b6d745c050a278e060a02b055e252a23a1ce1cadbf991e15513d22f110fe2c9476763dccb0bacdd97627b5a134852af612dc89908f8a682939f79ae8c1e3b081aeccec22fb137100ad8b55780500c71419186498b6ad60f4a0a25c2b094c9d01bdffb20cafb2097ea1b14b27c6d823ac033ab3d3711af09f0b2830c2780a461a1b9bd9d1799514f095bd161937b48121de9b8719fa5b3f09e88572870379b6893e9edd97a729d1d86307c50380014d4fdd87cfff0cb3e92ae7fc423101134ed62779f830e1f86eef4f5511e2af3284d3344ee2b0000200049444154d482202a664c44645c25d2e425f09a1fedf4692efa12a35823733a2b4f27bdbb2fcd7634b4400e4539a542b6a97a161c7a9aacc44dd3952827eb64f12c062f6d90d3f27a9cef5960c8be7cd7f8adad5077b57e6e820645367d4f285e03410049ed49bd3e09164ffea06e5e2aaf2e4e2492686a4ba32d9e8261d99034bda30b9de30102651ed1a16451b72371346b7588fcbe2c280ca686f8a0303240415ef608df7a77eddc97a54df1b82e0665560ce4222274284126775245090a268f014ac2dc9db4fb233e215e2e321d52a0400fbcb23ec9f6b6b4c3d28831b18fc7e30b78d652f0cee58b7f574effac65901547f745dfb341f81f29103698ee925c06409cd33728d0f65d904d53004f035375ee224a66184f276d8d25d01e4f809312f11e081ea3924c29a622809ccd2aa27f295d0bebbaf448cec62844b5c1e01e3e288c1450a07e0ad97096e843919d37470d1c3c65edecf64d194a2e4ac68ec2e819936144346cbd7eec60abf4e04e902172b52129a437ea5a597d4a502e08c64bc1bc78603b6491079e95a4b012b245459d1d9be8f7594e1de13f129feb04872c6916cf8f3e2aa8d0372810990405d4888cce7225a41d19ad890c9ae369b4250cd81438a72c22de745ee194d4966d43a1ae6b641df0d7f52c295e646774616bc8badcc4395d535c0f9df9dd3f2df64161648042d5671e64ad71c6ab93b3aca734df3a491f3d8a6c0e1c5de65effd4656067f3bedcdee155a753619c7defd54372ad1bd84b1ed94f0d5941fd635303b38958cde310e5be70ca28e20b7fa77b8337eee04736f8da151cb20ba1d725ca3b935329770505ef67c515cc98837b1cda1dd519d4f5621c1e63a8573b2ceaa3250544f702e2e4971534b5c650d7d08c24351ca16a644983ac0578aa2d5150539731baabae695c56444bd1d52b26222e5d9ada74145965dd6f225ba3ab15351832f14161f883c2737bd2ec85f7b7e3832d75686a77b0675f02ed096225a5502f4d434ef1d8a12ed94cb6fcc71dbc3457afd777201a42fa774b077b720fc6b41872d718d2427a7f5713db9b4821ad0791510230a1716e1dc566a0deee8ae4c291335d842a96bb6eeb3a6f3e2fba3ff57de44aaf7060056fef571621b8de6edc6919f056242e270de00d68a8d1bc46b9dd8e45bde0e1048b61eb1a9a6ca03905b4b5c7904ea5780a6e6f83c727e7101d551f14ba83c2586d3fb6de37bc02cdcfef89b3b614ef9987daa6387634b4a3a6b6051bb736a2aea19df7cde6c0e051a1749d190220bc5e167d4fc6c338a37373c3630c7cae38701ebc7e88ce8cc378d523f0d1212fa4d5fb636c774b0ca61a8229697079b3766ad747cb69f740f3a162c4396142ce9c3bfd01859ebc2cdd1915a83e42862b0778dd055575ca2ef12a39bcfd655a0aa2aecd406d5b1c49cbe6351b7428d986390728850f0a476096f4f39234a972a9681e8ea0f0f41e83379052484769be2801b4264cec6e88a1a6b615d55bf763cbcefd9ee5902d84ec62399005eab97572aa75e8a7ecb35e83aedf69aba8bb2e8c87af1bf2ebdd805e77903f9437216ddddfcea657150de87e1b5a0db67b5f0b52ae0c8bf873349d573dda44cd400d60ba0445b9add08100e2074a33cd2dd574302d05b15be100c01b917705874e4f3df1c450f729133a2c89a8a6556844b9e1d8686c6dc7eea624da2d098c0acb3ce97176ea6c36920f0a833c250eff722319149ed99d66add41c89a73553a73e51d742b4f1698ba1b631833dfb9358bd6937d66cdc0d8782d01d55f2d45590ac08b1a9e2e0e0a5b2e6b669ebefd8880943b35a610cd643ff32a0f5a7bf771deee7e74d489ffbe13decdc0f5f83ab660fbc51f9ca1dadac256d224d8d60341536b194ba416f0c3c45f36a113a2ad5bca0b29b135dc3208282e4d1687481acaeb513d99d8c889a58b0e4101c3d00c30112c454dad484d658128e5600837acdbac4cb9fbd029f86bdea9e6f291cfd29399241e19fbb92ac35435414d960b2c787ebda1c2028338ee260b58d69d4b6643830acdd548b78cae4adfac82eee7031f15492ce94f2dcecef018c2f772101ec411f1472915ede4061d147ef60281e835fdffa719c3a3e34e0fb56d727595d2c86047361536b4446a9ab9499d46591ecda868f6723e45aa93c78a040fed32ce36a872543ee21be9e776653513b4257b2906201c45910758dadbcef310fa8ab1ad28e0a4b0942a3c6f1aed9c100c0493dba665a7440a31f53c845f18fe439231914feba3dcd9214d3233767674525b7dc1d623075494f897052f4e9d8d766a2b63985eacd7558bbb9164d6d499e1041a566c2154c491f9d31b623060c34e03e28e4a4f6035e9c73ba7a97934efbdc6f584d8b84d15223be78f335b8f9fc7903bef78e34637bdbdad09c34907674de4b98522f89cb88faba7008a078162fb894b9e9482e9abe8f410605625fa57b130810b52f99db901050154ef56b5b16d9b590c201acddbe0ffbd312620610088545cf5ada47491a6c4987ca4ca859ee9843bc886f29f43dca47fa8c910c0a3f79b799b51b0e2aa23a4ac3010e0ec2429089dc8857cc3b9caadde14913bc66886968a4b8c3de38b6ee6ac0daadb5a8dd1f1334eddcfd24b20a39abec416de01c462dbba21ccc17e583420e421cfcfaa483de74d1e7ef619b5b02085acd280bd8f8c47557e0ea0ba763b2d695d028a767ee386953c2627be369249229589ce48d0ab7287787fac24a1c18080a883191ea80fb3e061714a87680f734231a0ad7e11388ba073033c39bad949796205a1e465d0a78fab57791508b6111519d4c4d59447e37a5a3523532159b8982b3431f3e28f425a123fff7910c0a77ac6862757103aa6b232403634b0b50515400b278c99a25124bb220442a35cd2717aa63707e2d4aa6684f58a8d9dd80d51b7661e3ae5634b439dc8924d258996051e5c8d065be9225d1678b568fb78583d041d0c107859c947fc0bbf59caedee5a4136eb9976d6e2ee02d17352709cd68c6cd579c854f5e7d32a647070e0c748b1d699b35b7c5d0dc9e40d2702007c2b039273b7d09c23cc6b9dafb3a060f14b27d0bc842915d1b1a01826b41752c54961460e1d8ced8caab31c6fef1fa5ac4e512a410e07d1eb2413cb216c834f7ba27f7f50222a897b751edf371ba9de0a7a40eff94d4db57b4b05d3122ab742193f5ebba3cd65555124551584540b651aca9a215290591650912759ce3adbbc9554a1b35aac477f06e750dde5bbb037b9a6cb4240910445bd86ef1c00edb41544e1fdc9620b780e786f29a34090a1ce209f326840f0a394dd8bc2d1f27dcf247b6b1b91869e89060a0444a4069adc1158b67e2968f2dc5fc71d14179968d2d266b896710371ca42ceaa5208351364f4ecdbc061714b84a3a360212436150457140c5c9a37a366a5f9166ecef2fad470b2b80a146442f649bdc4564f390b59035adfbb6767c50c849ef8fe84923d952b8f32d0205dbcbe6e39dba79a73c9e4a2db9880409002c44541d95c58588e81a4fb10e119d3d51ae704bc2800a1396a4f16e876fbdb3154fbfb40a8d496a811be135106267c3b55f642af1301c972c208b1e0d9dc6bff77b9ea2de49bfc141810389e069f203cdb9a9fda02cc4b9dceac4cfdfcbd6b7142243044301158a1947a164404dedc3dcb105b8f5d3cb70e9fcf2417d9ef58d19964ca691701cdea7c1721c1e73205239ca84e066ab576443bb89ae045fd977eaf581a8b3070f1653db41b15ba209413ff3043c4982220185ba8e80aea2301ac2dc22eda0efb6a29db1bfbf528d36b5104929c88374aa44057ad4b3567422a31d562e69b59d15a4b98c4a7ecf91a9e29ada7152e7b5ad7bc0a83f337135f17120c0f33aaf7117407e9f6d30ef369241e18eb79a392888f468d14f9b2fd68ce208d4a3c4e1ebb0eb52e5a581a2401085a12014d8288e0450120ec1366d4435859f4bbdac19f5626612de5db71dcfbfbe013beb133011844bdddb78305a3898785d43d6a9c0efef01074d0eced422d26345aa2b25a1885ee9fc778a0bfbcf7ef15a2e7a3ea88bf0a16e78d267ffc0d6b587912193924f78dabacb146a42c08aa188b5e1b3cb2ec5b7ae1a7800baaf175edf9a60f1641a29c3463263c3a43681d4798d0082c95054a5b3b780d7cb8128a90f1452c634b9e291d9acd177525adb444897110d07501809634e71ee96cf9b8d8c3df9fa5ab4070b9154022250c75ca804389cf088dc60040a7d7324f52583a3f977855b891a56bcf59e68c7695333a44e501034e83c97cc0785a3395087b8f71d2b1ad9ae18f526110daab284281d0dae3c0601dafbd94459ad30a80eb9981c9e562d2b324a031148b6814858476961048e9d4644a526813a4facd8b2ab012fbe5a8d4d350db0a041a24e89b4f152e87e2252673b543c477f1385821499a0bf33d7811ed0e13a16a2d1282499a1b8b800e1b08eb5df5c92b7f56e880e5f4e8f95372165418128b189c193163adaadd3a0069d14cab40ca4781d4e993b015ffbec4771cad8c38b33e4f4f6006a528ca54c1b8661f21696b41b2113978ac37806502f5da0f46080571493154099449a22617290cc87811d8f6d4db037aab721152945022a245585e4581e2850c18f0f0a0393ecd1f9d448b614ee5cd1c276528a5c8729d7e9eb7708e37955bed8c553a09902c7d48b99166ea29a1039751ec7986b41921d84f520ac4c0ad1a08a503000236322102cc0f6ba38d66ddc0ac36690940062ad2d282a8aa0bdbd1d45452548240d141745611a69149794c0340d545496f3aaffa292085455821ed0a0c83a2059b8efa2ca01cfd1a3a34947e7ae79135216142c97a82a2825932c059507a254a27533da50a81860a9668c2f8fe02bcbcec08d172dc8dbf31d1df18bbbfe74e56eb6bd298ea45e8414592ce43e6294ad4496820f0a47736c0672ef910c0a5f79611f6b72c935e3f0c0ae70e974ad11229760566a0202781b2bb22040456f54c426e210d9b8818803d0ff1c4ee84bbc5eb2433b7f1d8e2bf30e8254dba049165cdb854a16016ddeb8b56243a63ee48e23dab0cb145826024c7a2efa1d6521ca7ca3f7c025a38e89f564203adbf53379135216141c578543e9a23c434014b190328448cfcc04a23a836c27118eedc005679f8cab969e874b6616e4ed390f57a0fdfd3c592a3f5fbe06965e88b81404b4206ccba41c24683c2d952a4035ee73ef5ae4d3dffb0c85f37df7d1f0cf3ecaead105f76e611595457c374ebe7c5e6fc057772f2594fbf729e626e27659dc601424a683e308e782ef062a3c3c40e7f3ba228acfd17ac10381824fcab3dc79089ad1a29fcd20713b7a7289533c17240f28905b49c1fd17978dd8756430e777de84d4692988dd433750a0c217cac1a7e22c6643975d84ed0cdc4c2b268e8ee092b38fc7cdd72cc6ecc3a869184ca10de6b55eda9d60f7afd901162c445a0a885a0bdb84466ca9e4cee251175d64610cfb9802b1dc06f0c61babb0bda60e8e1f5318762ca97cb9bdee6156565680684100e5e505183f61340a0a225c47796204f72899a26893e72789ac3eee1de03bf86c6ccc8b1ff588da6597a5aea56c64599065d2d99eb7731e66ad15ba6e67832d6e90780dac681edd7f5145ded6bbc15c23f27dadbc09290b0a86d7f18bc2b37c97c00791e876e9d53db38fef1022909d14827212726a2fc617015ffbe4b5f8f8e219797be6233d181b5b5df6d47b1bb0c90ec39403fc8b0e5ee446350d8c5aeba8bca2996423e83a86ef2133158a1cc4ebafadc48e9dfb605b94ade2079a87db88528f66b11767080414488a83b2b2424c9d3a09e565c5bcf63218a6324db1dbeff02e9119c03394b284f207b89eba0a82bb9328c943008dc82beaebe8793dee4a9229b945c1fd178dcee5227ddd64c4ff3d6f42eacc3ef214a5a3cb19b7ef84ef315b26c0bb709700560670d328d02c049d3648f17a9c3e6f0aae3c6f316e3a6f76de9efd4868c176c6d89bd5f558b56d2fe29151b01180e5d162688c00c1e2f401548467c93a2f04229fec703e245785aa04f1da6b2bb17347bd00050e842225d5cf3e1a1ea32b2d7b84911ba75beb4bdeb0c4463412c4e8b1553c205c5018c6a8d1955eacc0e25943e411a5946d99c69bdc413d66315d47b0b08a2f2fe5b583e8f25032f22c0b99dc569df509924c160670ff857e3bce5c342c6f0b6b272888959f760fd43cbea3c318058438f3a2184c2a2890551dae65532c1a8a4305312e906e868e044e3c6e3ace3bed785c72fa74cc2dcc4fa6522e02cde59c6d0e636f6d6dc1fb35bb9151a2c8a00044806193df140c1a33a1309a442e4c598529eb1d15ceb95c7fa89e23b94aa7a540a0602b907d50c8db1c1c34bd58f6b0882c7b2d72859fdfa32215ce61a88a8450588763999830791c2a4797704af8929212844261b8b601aa67cb2e061dcda8785081e2031430a60d64967e9e321529c04cd94ddd37471ca03886889a049e1e4b4e07a288a1a0b50c98a68d872ff74121171dc89b42768002a7baa6188228ce522858e49987ae4c4c8ba2ad5f71d0422663c36141aa64e0296964446ab2094dc9c036da81f81e9c5c91c6cd37fc0b3e7efe49797b975c047ba8731e5cbb8badae6b410be559078a611b44eaa7718e23221213e477069f1c0408861ce05603c96a581f8e02550ee0b5d7dec6ce9dc2529015d207df521856e37ae3c35ea3f303d9ebc492dc71f060332dcad433dc46717194eb77381ac184f1e3a0c80ce18886d2b262d8b68970380cc796b8fb8982d7f41902878e1ee35e109a2c12020cca5b1415d580ac48706cb21054506d9161b8482553c81829d4eed98b64d2c4ceffb870d8ac1147531ff226a4d3bef23bf67ea304c3f2e208dcfcf4c8e2f8c04b90a8504c2697020d779a17b3e881301435084d0f221c092314d2110a6a884683280acb28d753082a0a427031a9aa0c33c78fc2d963d5bcbd577f06ef830c63cbdfdd8a3ded69b4d932dc4008908390284dd7339305351829bc28ef279014dcaa425ec3f920ee23f2edbef9c62aecdcbe178e4dccb604f6449e96f50f78ef388c5f953b3d3cd748573606ae940e45896468b28ce1d8798debdff50f8b4cd31cc78833a0f200b1d758079440015ee7436e245961a8aa2ae36d66cbcb2b110e17c0b2531835ba14f1440a458585bcf738b11128b202db3210086948c41208a84124d219288a8ce6c6365e6f94ce64d0de9682693a481b19c1c06a4bb01ff23bafe5b27ee46df1bcf5c9356c8f5401d7255e939e8fc67b03705f2305a28826459884fcdf04145eef00515c462970b45911bd086892c99683806323c84c940480a9630b31b63282aab23066932d7b148f356d8cadd9b90febea1a915123a2831ca59a4a32ef399d47b2daa32805e14b26b85ff1e63bd84634178c82cc947c2b480b851bd9ab78cf71c139aa2f74909b8f745090af7f883b8c7aef127ea81111fd44446d83a84de8882852353b25a110812553a0aab4f8a7110c05609a1622512a52cb40d3343896a0d7705c1b9cd685c9301d060d54e54c543636249b8217615eff4c341a5454c71ebcfaa8ae034351577b7ba6bc09e98e7f6e64b572252cabe76ca7de025d0f3a43d77b32d8190651f00a4b82be13c190a5b8702d17415983ce1814dba0902ddc4c0b64378ea2021da30ba2985c5e89b1632b71dc6132b2e63ab03519c6f6b5021bb6efc4f6866624e5001ca2b160c437af0bf6569e2c31fc03c8b9ca84a83b742dc8692e366edc01d70d00dc52c88282973dd2351331d78b0fa1f38e0550c88a7b60e090dd07890236f11fd52f50dd81e0bd2260200b92fe9935228963ccd56dd0da4f416b4a61e7cb0033015541440742b289099346239936b0bbae1d7183a8e769e321037fb9266febdd1052c77e3f4ade84f49d17b7b09d4e092f5c3b18176947b089935a75513bd1a80c32efe6242828a84291f8554c55864a4e48f245328068e788224281014532a1aa2e34020adb80a6289c96a2381a4669348a825010c5d1084a0a1544c3c054517d93f3b18331663a80e502ad712096b2d0d216474b6b1b5ae369346614de5bd95175113096149e4d24c964db08523d6a444276c3b170103f5461b4106fad588d351f6c01636140a2d4c56c15ac7099f9dc47435b1bc85238f009c52ffaefe0a4d5a02be91d65a0f0ca066643d56458b68d80aa819916c2111d292b839282289c543b264c180d98694c1a3f0ae515c5088664cc99351ab02404431a36ed69c25f9f5e8d2dbbe3dc5a701fb8b65ff37b688fc2917bbabc09e9bbcbb7b25dac0c964d5cec07f70d74aecb826c4b54278aefe457e4c5303c0421b2950c89da027a0dc139791c9def82b8b378b0ca350102040a524ba2e90d818664db505c22b403745986aec8884465681aa0aa1a344de5dddcc88c2530a2fb3aaec3835956da00155c9a8e8b8ce520e330644c977fe74d0a69f127f3562ff2f8e3454f0410f91e655511b997b729a667245e9663e190cd244a8a4bf1d68a3578effdcd604493ecc5144432bb0f0ac3410f7a0385ee967effc181e6179f651210090570d29c51886816c68e2e454b7b1b268e1f8b547b1bc64f9a84f6b638664daf449ae20d010d4e36f9c90b6c2b1e015f4a02aa6bdaf0d76756a3aec580f1c00d795bef86c3381eec19f32624b214763825c47e925b1196c7a7ee6d40c4f31f8825c4bde235d2a000a67043703410fce93cf7bd3351821662cae2a1fc262a0c2350a0b458fa3dfdce962d3854e8d2c711b4a9cf013d8e6058a5ac21fae26cabde33f09eb5d078ee6df609b2fed38e7bf2c6230c0ecff11ef947443250142dc4eb6fadc1dbef6e842b15c085978dd6419ded55a50e63911c4beea343696d7f5d4bd9b8216da9a68c0ee0b2731760fef4b150146f13a7046053909a67bf52361e35f0a1a0b568e6c36b13085528f5594a03920d5b8aa039e5e2e1a7dfc61bb75d90b7f56e38cfe6bc0949804231cf3bc8ad32b7ef47e3dd9f607a052ec20ce5cb3b59113c8e25966e5b96450d008f6f79194f147ff0be3883235fa0734ba850f83d69a9a77b517690683de87553f0ee2b2ec69f84ef60448f66de6f81bb8d049b243da3357082d561a57b0548a1bca40c2fbff61e56bcb3098e5c2840c16bdb98f52bf3e6a93e280cd9b1edcb52e8cdb5d45750baabe796dae792fb371ac8e0c4e326e09cc5c7614279042a51683bd40f9abe2c284ec0e342623c1945f02c89a6543c56c1eb16c85b2061736d1bbe77eec4be1795212bf5fc3d58de84d4090a84f239cc78be733cf479628117052ee2f02aa33dd245d1da8fc20d326cde1e307b860001be38730b44a8ace2129b63dfddd76cc5f62c91ce7b8a8451915acbad59effadc3dc4cbfd0530648d02de27c14b4375fabe65fe34e208dea9c04d60e2d83178eec5957873d566d872111c46c166d1cb5702b91649b6d45ce5083ec811beb46f29f42ee0bee20e5960e0f4db7cde5808ea0ca7cc9f88a5e7cc42593448953d60d9a63a7cc6659b63792b00790ff894a6ac23c1a926b9265c25881ba68d5c62cdc154e9fc8302cf36c861c677345c39d4eb927520aa8005807407926c19bee8739cbd4e77a356fc5a3c8fec1270f42d12e271eb2587aa3b3b0b07856cdf58b21604977c96673eebee122ea5615e9496a346163aed983d6d1a9e78e635bcfaf646d832251e505aaa0f0a398a70489cd65f4ba1b7873e54d54d361545cc0b07aae3a02ceae08a8b1660c9a2c920160bd9ebc37c3081f08da7d7c6566cca245c37bda8efc93d24247c741f226f42eab014787bbdbe0e1a504a513b347810f3a18d500769160d3e3971b29688d8b18945b7abcbeac00e66591c30a9a23a07578eea68bc239a0037af6a93a8833df2afecde854110d971de79a21726d39602d06406f3d0b7c2631c3a552f1f0347a1dd8205f366e3d1275ec5ab2b08148a617705054eed415e63ca481abe876f29e43e76ddc18176521e6f11effb4cacaa34876528ae8d71550a2e3e73364e983516053c655dc40cbb1fc265dc7d0b28367ecb6614f6bdf4e4fee823f6ccbc096960eea3bee5ce7399bbecf6c5273c43b59bbe1c6499e92281be1d56e2eadd936ab34671f6b65defd3e5e21dcc90593b49d8081e534bdf2f3a84cf10417de116e4f465d9cc2ac2439e2d268af40adbd663e9c567e1ae5f3d85959b5a90704354a2caad28e12f120d8588c6a0af0dc1101687a0711bc115cd8361291c387e9df67bb656c5634fe6fe56d22105aa6b42753338e784d1587aee22941406bd3ecc9ce8e8902a4157b97e86ef3eca65de1c1d5018e66c9fb908f6583a87bbc5bc1d5b47aa6d16183868d37f0aaa12eb71f98567e2ce5f3c89b736b7232147bdec31eaa54112a36a77b2ae44207fb81e3e280c7ce4ba3b7769cf203a22706bdecb362ad22d9cb2602c2e3963012a8b7428bc8a598048cf0d62e7b35ce783424e03e383424e62f24f3ab404bada58945595cdbcca020271df00b3d80e5c7cce49f8fa8f9fc09b9bda91548ae05263257215724bc10785e1a06947c252e8cd72c816c3f1458a328b78e912c5105da86e02b32615e3ea4b4ec2943185446ee0b974b3591b3d53cb7d50c84dbb7c50c84d4efe5987948088a7885c2e8fc79e2714c8a2f0cf653c95f08cd2169c7dca747cf9fb4fe1e5ea2624d512d188858af77c5018363a960f50e82a8cceb883483315d4fa32428a8bb953cb70d505c7637c559847e938c711af90ef99bce183426e2ae683426e72f2cf3a8404b28cae22a2c06bc6392b26f15329444de2b8706d1b974fb270edbcb1d2553f788a3dbfba1109a548b4e8a6180205ea79453a15fc8994dfe17af8eea32333729de02052c8554585ec38288fda5876c529583073146f4e4581695e11d46d759370dd8c68ded6bb232381fc5c356f42ea1668f6630af919dd3cdd8588ee489144111f55750b6b4191e88b815926c2c1003eb1a818271648d295dffb1b7ba1ba1529ad8c4a8b3a4081d7883095eff27c50c8d3e00de036f9b6147a732df10a056255e6243736e64f2bc2754b17a1aa2844dd57c0884ec6a3e8a662360288eba7fba090cb70fba0908b94fc730e2901cab4a183526c0914e85f3c9a408d505c1301c9812ab9f8dc991331272c49577fef31f67c751b125a85a028904c803990dd2c285001926f290c55b53bdaa090950bd710ae6c323496414930858f7de43ccc9f368137a45278019c20d6f1b38f72d7261f147297957fe6412490add2ce5a0a3c644c9a6567a0381904651bc5611d3f386732d7b76bbff7287b6e6d1b627a9557c741a06043760948545ecfe183c2d055b7a1020add2444bd3a9883f9538b71ed658b30b622e2b5b425324d510ff42f33fce2b55cb4ca07855ca4e49f73480908fa10c144451c5074a844816c2511962dc8661cc7cd9c824fcd1293f2babb1f65cf7c90050582104a412550a00c121f1486baba0d4950f08446fc6253c628f8b765676154894e2c5abc95a2be400000200049444154b32111605e3ba3386febdd501fc3433d5fde84e4c71486b39a1cfad945898228c6136464b24811b493280d32386d75f8d0b9a7e182125161c441616d3b627a250f30f3ae296429f0cc568a29f896c250d696a10c0a59b98d2ed1f1b10f1f8fb953caa0328a51a93ecd458e4ae583428e82f24f3bb80444fa9fe3d19153d82f04130150003a6cb76072a805d79e3d1753b56087fbe8d98d71c451229aae3393f7a5264071a96112c5288631239e9f7d347466cbe2e3c7e143a78ec5e4b125b86eba6f29e432323e28e42225ff9c3e2440dc52bcbd10f7dfda52080e5311941994f63d386f6609ae9f3fae43d728a6e083828cb1da7e6cbdeff3799b8383a5c6c3c15238f05d972d3b1e7fbe7cf6b093f5608d597fae933721f9eea3fe0ccbf03a97e8cb29a240697fd4b7c2a6169b2e10818d48623f6e3c632e4ea9a41e77e2f041418626fba0904f2d5f72e914bcf6d193f3b6dee5f3dd06fb5e7913920f0a833d7443e77a94d941013e5b96602a22d8acb80e226612b30a147cf5cc29ddf4cc07051f14f2adbd3e28e42e711f147297957fe64124a0ba22139c00c120d653b808c34238d982f3a68fc3d5b3cb7b80c2731be388f93105df7d94a759e58342ee82f641217759f9671e4402bce7340043519091019599287493a862497cfcbc133055ebce6bcceb14362510738a38e5b11f681e5eaa351c630a3e28e4ae633e28e42e2bffcc83810205985d06832a9a551521a4114aeec3b933c7e023b3c7f4d0311f147cf751be27930f0ab94bdc0785dc65e59f793009b8c467cfe02a21de502764b661146bc547ce380ec717770698bb069a7d4bc10f34e77342f9a090bbb47d50c85d56fe99079300059a550d0ed3e09a364add384e9f5c84ebe795f6aa5fbea5e05b0af99e4c3e28e42ef1fc81c20b5bd80eb7088c75edca9a253da3f257d198b2b3b1c6f02544cb5dfc43fc4c26a8b029ddb4f34b8c4b76ac280fd592a9604d424092a0a5639856005c76c2441c57dc7b8fc47fb9fb314681e6763fa6e0079af334057c50c85dd0790385efbeb08d6d7723a282b5833a3bdb1d897e43f4b6b408f12ebfbcc2d53f8eae0418514e7022622a4cb33c82311a17a2a1a07ecac488aa20a90461c9128a9c184a53fb70feec31b864f6a883ead675dfff2b7b76430cedacd8af68f68bd7f2a2e43e28e42ee6bc81c29d2fd67050a0ce4894be2848d43a5be671fb8178cf3d6ba1ebdf727f1dffcc4195005ff435cf4ab038380812625acba96f820006833184432aa4b6bd98571ec095a74ec6e403328eba3e970f0abefb6850f534878bf9a0908390bc53f2060ab72faf613bb8a5a0647bbc7b8f201ab4d0915d7004497ade1e2d77691d6367f25ecb3cd994b74e874b2e3efa15b53c243654466dd364e83020a79a302a24e182853370761527ce3ee8e183820f0af99e4a3e28e42ef1bcadbc772cdfca76ba41b82cc05934293f5d1c447e26ac06ee44e25dbc6801e27d1afde3284a809ae710a91d5970b64495ca1e0b2a1f211932597d0c88daad28b69a70eadc19b8727a499f3ae583820f0af9566b1f147297789f1338f74b1dfaccbb966f60bbdd002c26c8d21c6e0c506377158cd3243850c8779d0505de7c7bb0eeee5f672012a0b150990d4792614b2a6c99c09c623e80e4d2df00c9b15162eec749a38358bc7016a6eabd0797bbdedf07051f1406a28f87f3191f1472975ede96ddbb9f59c95a03456888035ab8184cd690b11d40d2b8d1c02d0502068f5ccda5f618797bbadc05762c9dd9090a0a2c4985c341812a905dc04c23ac008a6d626a308dcb4e9884d9a585398d980f0a5950d887adf7dd9293cc8692def915cd43693406ff59f2a6907f59b581adad6f422a5089b4abc391544207189c3a9fdc10e49010a040df1d683e280cfe78f7eb8ae43e22b23b47225050e0cad4799941b6d228d218e44433caa3015c7ac2542c2a0be4ac4b3e28f8a0d02f451c84937d4b217721e63c9173bfe4c1cffce7ae46f6f2ba5aa46502030519a6c15682605e63158a2990b540df29b3c5b7140643ea03bf067542535cc0a63a04498c87c26c8425138174332a351b679c380f6755e50e08f4343e28f8a03070ad1cd8277d50c85d6e7905057aacf719636f6c4860f3ce3ab04001d24c85e5666b137c50c87de88efc991448965d995b0a3c9e404d0d9989909bc068ddc239f3a7e2cc2e7d12727d221f147c50c8555706eb3c1f14729764de4121fb68ab128caddfb61f5bf63421e1aa70828548300929c7851e0e41b64c483c6629c375191c0a6cca32b722b2d6046d5d5d7243891c26f19d574677fe4c3f899a8863e310fd920f7d5036515a0e72379dca2cfe4516006f94e31511522e9825e9b0a430ff9bec2451a85a089a3154ea0ece593013a755440624d6ebbeff18fbe7ea56b42ba3449699640330791d84a86c17633aac8f836555939b9432b95c17d3430dd8fac7ff3720191e4dd9f83185a329fd237fefa3ae901f3433b662fd766c6d4e20a94781a25234c4e3882a0a8f35580e83a4e8080443300ce2e1f4e20e3c202d8aa8b2a090ed1fcffbbf7b00d1090a47fd558ffc68e6088094f49b56431c5c3566f02f8551711a1389c192c2633e961240cad51170d3280f9840cb6e4c2dd170f6fc1938b1acefd4d383bdf04d77ff852d7faf09296d0c523c56414f64426506072a4b0af094d791764832156e52ac5e82ed3898156945f5ef3f37ec14337afd432c35cc06e7aa2ba6e2b1eb160d3b591f0d310f1921adc930f6ee96667c50b303a6a2400994c07639b9026fefc87dda3255d0d2238b5a06b21a54977699e2e85efcd629ceeceef7680838dff7ccdd2aca56950b2e2afe1fed60b9a540d5ca124f150ec80c21d941ba692716cf9b842573c7609630e1067c7cfadbffc55e5cb50b49b918068da944a9c83654e6f2c0b62953fce2b06e31e0673b921f24de2f3a64992c0507d34b19defed37786d58bc696ff83fd7079024f34002521207024053608d78e25817d053a7ef38905f8f0fcee1d0007e1f223f212434e2157c71db6adb60eebeb3288a52cd8b20e5b0b236103b616e4f9f2e4e3a6422aca540a3962cfc277605dc8f6c4e2e851324812cfb53f168e5c4081e41474d3bc6d26657939127da9648375a12474117033284837221a004e9c3b1573264630431e81abf5b1a018fe3bfa12c85102430e14b2cf5dc318dbb02d86b55b6ad09276a01496a3dd9660c8019832590ea28e4175ad0e50a06c19010e9ddf39799b24be8e85231750209968cc140164e8b0254a11a6745340732de8cce001e5a89dc4ec28c3f1f3666151e5a1a92b8e05d9faefe84be05890c0900585aec25fd568b2cd758dd8b0732f12540d1d88c25583305ca26dd679d08e8aaaa8c18be0d893214bb4eb95b90b04b0214b1ebb2767d5209789a0eb1e69476fa040817adadf67bfab9a064b064cd7854bfc455459ce18740202c90012cd185312c28209a371f9d481c70e469a6cfdf7f125702c4860582d8b5b4dc636d7b661477d131a6349b4651c24f562ee3c92142a7653e0f09883e6312911284890251bb26cf35e0e826ae9d802057a6ff2635328803aa4519033a313684a3c4c4f8e23cd3110b4932896339833be0cf3a68cc3c2b06f1d1c0b8b80ff8ebe04ba4a60588142d707af8e396c6f6b02ab7735a13d9e44cab4e0c83aa00621e961c4330eaf7f500341c88a04c773338df4e1efcd522030304d8b8382a6a9a02c989493414855a0330b9a95846ec571fc94b158386d1ce687fcb8c148d713fffd7c091c4c02c31614babed0ba2463fb9a63d8d3d082fad6249a53362c25c4a9190c872a723540d53b9859456220d90b23efe80d141cc7854a60408e34db866b5b2851d290ed14ca0232e64f1983d9e32b30d3078391a710fe1bf912e8a7044604281cf8ce9b938c35c733684fa691b11c4ea9415f23358ed0edfd7b29d423f791a228701cd1cd2ea4ab18a359a82a2bc4b4027944ea403fe7817fba2f015f029e04fc05c157055f02be047c09f812e890800f0abe32f812f025e04bc097800f0abe0ef812f025e04bc097404f09f89682af15be047c09f812f025e05b0abe0ef812f025e04bc097806f29f83ae04bc097802f015f02879080ef3ef2d5c397802f015f02be047cf791af03be047c09f812f025e0bb8f8e880eacded5c8b6d4111f5306f19626181683a26b185d598205d3c7e1a409e5be457644247fec5d7447da646b1adad19c34e0a40d144483983eba148b0a43be8e1d7bea7044ded857a40188b5ba25c1feb6bc1a6b37efc0fb1beb11dbbf0f4aa8009515a3307dde0cdec5cc48c4f0f6da1d90cc18169f3c073fbde5124c2d2af2e53d0079fb1f0136244df6c70f6af1da8e7ab4b90cd4088f361e6ec680aa0770cdc231b86dfe785fbf7c65396c09f84a94a308df8b67d8037f7b1bafbebb05f56d1662b118e64f28c1d5579c8ee32757e0fca9553d64b9bd25c11e5fb10577def3324a2241dc7ff74770cee44a5fe639cadc3f0dd86a3beccf6f6ec48bfb6cd4b152143a69cc09a571e3491331a9228a57f7b4e197efb5406619dc79ea68dc30c5d72f5f6f0e4f02fe02d587fc1e7f6f1b7be0f975786bed1eb4a60d8c290de2b485d371cd79b3f0e139137392dfd71e5bc9fefb913538f7b8323c79c74772facce10dabffe9912081371ae3ec7fdede8eb52d4053b404212b8d73cb257c61f144cc0b053af4e88c47d6b2ed4a212e0836e3ff3e74a2af5f2361f08fe23bf80a7410e13ff4ce0e76d73daf625b7d0cc1400825453ace5f5886afde7036669744fb25b7273635b265b73f82e27000fff88fabb0704c69bf3e7f14f5c3bff55192c0f3f5edecdbcbd7a04e9f021b415458315c39c9c6774e9fd9437796fc6d2bab41314e37d6e3b1ebcff675eb288dd948b9adaf40078ce43dcbd7b2ff7ae415ec682f41ca094071f6e1a317cdc62d579f8a79e5050392d75fdeddc16efee90b8838493cf9a31bb0c437f147cafc3922eff1c7f575ec97d5b568974623238511402b3e333580db4e9cd043ff5e694db36f3ebd1d7b035598cfb6e3c96b4f1e908e665f64654b8a3dbe661b82aa8c99632ab16c9aef8eea6d90ff67750ddb91743121a861f1acd15818edb4dc8e8852e4f1a287a540797cce237eab87deddcafefb6f6bb0626b0caa5e08d568c0d90b2af1c5ab4ec1b9737a4ec6fe3cd04d3f7b823df05e1a13026d78f647d76356a51f70ee8ffc8ea5737ffec12e76ff072d482a65c8a8128a326db8665200df3e6b46af73f5eef776b13f6c48c3d18a7055790cbf3cbfa72591abfceed952cfee7baf0e7b9452de8fafd0dc873383263e71e67c2cac2cf4d70a00d54d49f693953bb1b2c5424a2f80ca5c4cb01b71f389e370f361ae13b98ed3913eef981fe8eaba16f6b387dfc0a3afee46265a01d9b5508a14be72fd49b875e909872d9f5736ec62577ffb31b46b9371e1741bcf7cf7dac3bee691560afffa474702ff5dbd97fd727d03dab43108b912985b87f3aa82b8f7ec59bdeaccd68cc5963dfe01f6496588da0c5f3a4ec7a78e1f3720fdfaeff777b13fafdd83fac80424b428e0265161c771b266e2dc2a0d1f5d3c7740d73d3a923c3277fd2065b2ef3cbb0e1fa40b918c94406219284e0ae3ddbd383fa8e0ee2b968c08198d889718a80a7cfbe137d89f9e5c8306230216288092aec325278dc1dd9fbc08332b066767b4f82b0fb277ea15c899267cff5f17e1ab972d3aa6653ed0b11ae99ffbf1da3decfeea66a4954a3890119052385e6fc3772f9e8d59a1de6b107ebe612ffbcdba38242980094e1cbf5d3a1373c27abff5eb9eadfbd96f56ed474a8dc09003705c8629e66e7c66c90cdc30b9a2dfd71b8963b52a9e6177be508d1a33888c12065c206a2671c918171f3b7d0e8e0ff65fee43554ec7e480bfb4ad9efdf48f2fe1d5f52998a15160520a6394fdf8eaf5a7e1964b0767d1de9148b12fffe4713c5fcd60068b5025efc48bfff931cc2a1b1cb019aa0ae53f57ff25f0a7357bd8afd7d5616764148a320a428e81318156fce4e27938bea0774058dd9a64b73cbb1abbd5510899195c5ca5e09717cceef77c7eb4b68dfdec952d68d42621433dbc9d34ca9d767cf5b451b86eaa0f08d9d1fcd40b6bd9738d01a84a219864226836e1dcf125f8ed5953fa2df3fe6b487e3f31e25ea82ff1fdeae9f7d8f7ef5b8356a914aa6d42d24d4c2d4ae0ffbe79354e183f7841b5abef7a8cfd737306a61245c0aec7cf3f713a3e79defc634ede7d8dc7b1fef77fd4b7b2ef3e5f83b660052c5985a92430cd89e37b67cdc45995074f6cf8c26b9bd8137b54e87214a3b47afcecd2795814d6faa55feb3216fbda939bb0c5294452d5204916c6a45bf1855347e1a6e9a3fa75ad913c8e5f7f732bfbfb9e0c3252014c298cb09bc482700bfeba7464a6ff1e3303bfb925c16efbed3ff0e2da3852521124d9866a35e1863327e1f75f583a60393cf976355b7aca711d9f7f794f33fbd64f9ec2ea5a0d5658856a34e3b205c578ec5bcb067c8f913ce18ee5775bbeaf8dddfec21aec0b8c83c334143a2e524e1dbe7bfa0c7cf410196affbb753ffbf17bbb9052c6a3c04ae27373347c7e416e353359796f346cf6e3a7dfc63bf122b4074b214b260ad32db8764631ee386de4ed7e07aa670fef6c623f7e733b5ad5d1301983a35b582825f0eb4be6606ab07f203cd067c8f7e78e8985eaa9d53bd8f7ee7d196bf745e0e811c82c8e626b1f6ebd7131be72c5290392c1a68666f68b3ffc151fb9f44c9c7ffc2c697d438c3df4ca26fce7a39b61490cb61a856aa5b178aa8bffbaf54acc2ced5f6d43be15c1bf5f7e25b0b13dcdbeba7c03d6b82104ad2298810c0a8c767c7656293ebb70d24175f2add624fbd2f28dd82d1721644838be3086c73fd4ff8488ff5853cbee5bdd04cbb350986be0f28a14be70e6744cd79501cd89fc4af0c8dfedcda618fbead31fa0411f0d438e22cc3288bab5f8ced9c761e998919b4138e207ff172fae653ffcfd72a4e4721876149a92c2d860337ef8ff2ec5358ba60df8fd2ffdf22f58f184c9b8ee43a7e09d5535f8d3b3ef637fa2106eb0148cac10d68c85e52efe78fbb598555532e0fb1c79d5f7ef70342470cd93d56c4d5c45460f41776404dc18961499b8e7100bfcaaa4c97ef85c35de334741d1329892d9879f5c79024e88e44e86b72365b2d7f7c7f19faf6d4453680c4c2904cd61509983cb6769085b19802960cc816958506586b4e94055015751a03a0c8a240112100a28d065098aa2a04495a0eb2a4ac30114853584150541594281aa62f20082df47634cbade738769b3db9657e3bd5829981b802d5b28b01a70eba2d1f8e8cc31237a3e8fe897fbf7ff7991ddf7cc56980515604c4680a53029dc86dfddf12f583269e041b4dfbc58cdbefedbd5601a838624322c0a1039190bc26569a84e1297cd0be1af77de38a2e57bb427ee70bdffd75edcc81e6d51602811444d19ae9cc44991763c7cd9a17dd4cb5edcc2d6ed53100b14a138b30bbf386f1acec971c7faa7f575ecd51df5a86bb5512f45d01428800b8d039206c0d06da8e93648b603260710642e82761a85aa0d4d751051344483802e0741b16f45d551105201c785acc870532930e6c2320c18f124d2ae0b5301544541c474c1c21a66c8c0e4f1a331b9b208b3470f7cfee563dcbff6e64ef6e4ce04d24a193430c86e33ae1aabe04767cd19f1737a44bee08ea4c16efde5e3786e750269bd028083a0db86851324fce8960f63f1b8c3dbb9df79ff72f6e3bf37c20e0621c9068010981d876265501948e373d79e88af5f71da88946d3e26e448bec77fadad63bfad6e424a2b026311e82c8d4a653f7e70ce4c9c597ef0ccb42fbeb48e3d5dcf60e88588a653f8c62925b869666730f881ea5dac3663e1f2996330a730dc4df77ebd7a3bfbfdfa16346ac50831064b9160ca1a34d344010c8c0f02938b144c8f86505a1c4655404291aa221254a10774e80115d3b4c37329d524932c114f03b60dd7b2b170f2c0ea29f2a11b8fec6a613f7863371af452b808206ab5615189853bcf9f8dd98729877c3cffe1de63c42d5ceb9b12ecb33f7c04ab6b6d24e52a480c08b0069c353380dfdc7e03260f82bff49dfdedec53b73f842d6d36df55a992862addc0f92756e1f3379c8739e57efce0701573247efeef75edecee97b6a33e528e90a1c092533cb6f5d30b8ec3055507f7517fe3d58dec91bd3a2445428035e38bc78dc1a7e68ced98bbdf7b73137b60673b0cbd0cd39d246e3f6f0aceace8cc5cba77533dfbc99a56b4042aa019194076c154091599669c352188cf9d3613d31579c4ad0503d1a1776219f695c7dfc3de6019926a180153c1246737be7de11c9c738c30118c284558d39464fffebdbf60dd3e70b34f7225a86603969e54861f7e6929a68406b7c0e4f7cbd730cbb2316bea049c337df0d25907a2ccfe6786b604aa5316fbc213eb502b157337634c3311b2ea71ebdc31f8ecfc83d3a8dcfafc07ecc90607b140152aac3a7ce5f8b1b8696e27203c5bd7cabefcfa36b406c6413301860ce698bbf0db6b4fc7f4406776cc1d6fef600f6c4e435142c850915ac0c0ccf85efce1aae33123121c51ebc0e168c2a79f5fcf5e690d23ad008aeba22495c097cf1c8b1ba71c3b8db2468c326c688ab38f7fef71acad0720039612816ab4e343f343f8db9dd78f98f73c1c85f73fdb29811da6c31af7b7e0e4f1f9f16ddffcf41af64aac18aeec00d0a13aadb8666c103f3a08a711512adcfbe206bc188ba035a8626ab2055f3d633cae382055f5f2075e616bd572584a292a53cd9859095c3ea50c37cee81e0cbde9d975ecd558189a1b00640b25761bbe7ed10c5c53deddd5742cebc8ef3ea861bfda60212507c1241541238e8b46dbf8cff33b53ce8f05f98c88c57263438c7dfa478fe1dd1a1b66a812700dc848e1c2b911fce34e9f6be85850e4febce3bddbf6b377d76c41097371e39259983dba6783a4fe5cafaf73bfbb6a17fbcbc60ccc500819c541d034b0246ce2fe2b7a2f667c637f9cfdfacd1aac4b8561493ac6879bf0ad7366e3dce248b7f9baa235c53ef6d25638761411cbc0451380cf2c9e81a9aadaedbcff58bd9bfd616306095d07633a8aad667c7a4a005f3ab57792bdbede6724fefdada4c96e7b622d6aa53224b400343781e395387e75f9024c1d0497f37092d9b007851d29835df7d57bb0b13980148a01554700492c9eace377b72dc594c8e0ba8c3637b4b0bdad19d4efdd8bbd3186dae604eada01abad1649f2d77a47612884b2ca628c2a29c1b4f1e598366d1c1657759fd4c3495146cab37efdf50dece99a181656a8f8f6850b0f3b80da975c1edc54cbee5eb91f2d91d1906142858231e97afc6ae93c2c2aeeb94bffd3e67dece7efef40ab1c82eeca38bb44c157ce9d89d97af7859eeefbe8ae26f6b577db1049c771e3ec52dc7662cf02b6575a92ec1b4f6d457db00c96ec4272642c09b7e1e1a5c7d6eeb7af71baf2f1b7d95aa312962ac166128a33f5f8c199d3f0e189c78edb282ba3610f0a57dcf5307b715d3bd25a3124e89cb5706e691bfe7cd747317780fd0f4838ff5cbb936dd9dd800d3bf7a3b12d81fa36176d090bed7103b124b9a764d82c005909008e03473621c1850c158ea273c22cc9b1212b4059208348663746559660e2d80a9cb56002ce5f72222617e50e12dbdad26c5a71eef9e87d4d02fafbf6f6349b5294fb35a92a3cdf45781b63692643c2ccc2c3f77bffadae95ddf9f226c4f53138bfc4c21f2e18789d4a2ef27dbd39c1bef5dc56ecd2c27cf719712c541929dcb9643c2e9fd8bdd1d2078934fbc33b7bb0bc3e81981e44a513c74d73c7e0b219a33055efbd72767bda6077fc731d165506f1c55e584c37a54d76fb8b1bf15eba980382ebea189bd98f9f5e3c0d670d800a7b7bc6649624c164c07147a09a77bb61b329819ee0978bacb7da16939904d3720055c6ec83c8acb76bfde7fabdec7fd734a23d50014772114d27f0afd335dc76cad461bf3ee622bb03cf19d62f7df3cf9f608fac6c86a11403b28c208b6342348d477fb00c73fb9901f4e2c63decf535bbf0ea0735d8556ba021e6c04200aeaa019a065956c05c956a7640294d059285a0964151d0c1a4aa10e64c2e45f998d1689680071f5a8b265381c528879be1c2e3caf1cd9b4e876a9968696ac69a0f36625b8b856d7569c4126db8f35397e0ca137b5fa01e787b337be0a17f62c3de04fe75e9c9b8f386f37b1db3dbfefc1a7be995b771c1398b70f70d7d77dffad5b36bd88ffff802b762befe898b71c99cd187d48507576e65dffef5e3d0831abe79f37958b6a477d7c7fb7b5ad8df5e7e0fafacde85b29230eef8c4c538696c6e9de66a9adad9ca1dcd58be720bd66ddb87a6e61638b683b00e4c2f072e5872023e7fd57903d6d9cf3efd0e5b9e28450251cc931af1dcb5f3067cadbe265b75ca60b73fbd06abed518062038a8eb244136e9a57862f756996b3cd76d9aa3dadb87fd56e6cb28308b8129694327cf6e409585871f04dc3b684c1a6f5d1d8e53befee647fda94060b05e130209236f1d905117cfeb8dcd2416b9219b6a2d5c49ada666cd91f43229d846c1888c82ec647145c38a10a4b4f3a3809dfab8d7176efb3eba095eab8f1e49938bbb2f7ac3cca8e7a6e631d92e9142e3971063ed725d5f65072de9034d8e6c6045edbd9840dad26e2290bbaec408585221d3867ee647c6ed6a1f5faa5b634fbc63f37a29195c15524689683b94a2d7ebef4144c1de4c494be7466a8fcfd884d8a23fd82df79e42df6c3fb56c18d4e0093142abf4189b51b7fb86b1996cec9ade2f003ea81fbe8cb7866452d1a3341585201206960cc06d35d5afd213984017168991694871816cc1c8d7316cdc1c90ba6e0f4b1c5dde4f764f56e76f31d0fa23d3415601a5cc586ec3268ac114b266ab8efbb1f474862d815b770e5adf7638f5105d8120a12d5f8cd37afc1b2d33b79f36be236fbe45df761d5b61432c131d0240705e66e7ce58625f8fa95dda939bef8bb67d8ef9eaf851da8806eecc5650b4bf0f0ed07e75afad21f5e60fffbdc56987205548da182d5e2f19ffc1b4e1cd37b9efc7dafae679ff9e57258e17190e4144acd7d78f88737e1ac2e41cff58d31f6adff7d0ecbdfa985a115c1d10aa02a69cc0db7e2a11ffe1b661c82e6637d7382fde88f2fe31f2bf6c1d27538ae05d56ec7672e3f01575f703c4ec91154fad2b96b9e5acbdecd4460b0284acdddf8e8bc2a7c63c1e135503ad83dbff1da16f670bd8a8caca2c00482b071d954053f38b5d3c5f37a5b86fdf8e51a6ccea870a4208a927bf0e93366e0d3330e9ec9b63e6db22f3ffd2e1a33062e9d340a772fe97d517e736f8c7df1e53da8d30a11461acc94b0a8c4c0431fea1b0857c733ec9e555bf1fafe341cb502861143a9ce70f9c4429c336f2c46e90aa6f7e2ceea2a8b17eb5bd96cd83f1b00002000494441549dcf6ec28ea2718064634a6a177e72c949585cd6090cef3626d84fde588fea0c595245502d1995a95a7ce3ec89f8f0d4832fe66b1206fbcbca5d78a13681f69004269740311dc8662326444298591584150ca3bea606e75515e38be72d38e83af7b167de63cfa4cb11b23484e40c8a8c247e74e9149c5396bb15df97de0db7bf0f4b5078e0dd2dec969fbd85b8228ac654b90c727a0f7e75cbe9f8c439b93117def1e0cbec4fffdc887d091d8e562cc68d49905c170a4b8139094c298f60f684022c39613216ce1c85c9e5450775f9fce2d935ec67ffb7122d6e290c45822429909042999ac1450bca216762f8f28d17c25243b8eedb0f615732005709816c0f662a38a16417defadd97f978504bd03bfeb4063143e1e98b8e1c00631634a70117cf09e1f1bb6eea18b7affde50df6bf4f6c405a2a810b0701d94220b10bbffbe695f8c8a93d1ba3fcfb6f9e670fbc56838c1681832814b808666a71d1dc423c7ad7bff6d087a7d6ed615ffcf133a8774b61da1264ca95cfb460fea80cdefcede7f9f9df7a70259765bcbd19c74d1d05b5a81c2b3e88c3d133d032166e5c52827bbe7c658f6bbf5bdbc2ee79ea3dfce38d7aec3754a801092588e35397ccc4776f3c4baa6ecfb0275e781b8d0d6df87f375e8099071465f577b2fdb2ba96dd5b9d46ab560a8db542b69b70ebc2f1f8d4ecce14cffe5eb3b7f3ff6bfd1ef69bd5f5680d4e80cc1864a471a29ac00f2e9c8d39114d7ab9a18d3db5a50dafec03dad21954ca319c3da51857cd9d80930fe126ab6e4fb2bb5ede80ea34edfc43201fe57513247c6fc9f41eb2fdf0dfdf611fa4cb214b0198aa81c97623fee3fc39587c080bfaadb6147bb27a375edd65a0512984ade82837f6e3baf9a5f8d094518804753cf0f64604033abeb4a8e73db3b278bd29cebef3f2266c762ac0e430222c05c94c634969027ff890a0a6ffefea5decf79b9bd062e990e402aa1986ad306866033e39318cdb4eefa9bb6fb524d9e3d5f578b536893684e1c84198ceff6fefbce3a32aba37febd775b7637d9344802a1f708486f2a458aa288282a604154445e05dbab208a22161045a508286201444501a54b1110a4a3f4167a420aa427dbcbbdf3fbdc455f8804a5447f80bbffee2d679e993b6766ce39cfe3a46a988f9bab84d3a66a595ac79eaecf38e8f6888f176c62748fb625ce735f1fce166f6d2cc0ae37a3081d46bf8b476ac14bffd263a32b36a670a0c82dba3e339d146f38011181101e2c8a9b5edac4f3d4f9b19d8e9afdb3787dfacff8ad09a884230b1304bce8b053c1a6a361f508badc508b87db9e5f306ec4373f8977666ec16bae4c4031827012217269512382379fe846d38aa78f4fbabe3a53ac4af6e096238354c5b25a44b76b2278a8635d92ea5563f437ebf8fcfbbd88982aa83e17b22c8213805129a4439d3016bcd1eb7f03fcf3357bc57fc72fc71e56115419592da09cc1ce7f6e6f4cf3a4043ad42b7e26da77ca5af1f5b2fd04f436901d08e2b1895c9eee5a81360dabd32ea978a0727d6ab6e835e83372f5897885b68b7260563cf46c55915e9deae0153a464cdfc8afbb4fd0a08a8e9eb734a1c72d4db8f3856fd8734c87cfa4ed94c26916738cf5139f2af6614e5eb55bbcf5e92ab23db1f8f55aaa643ef562edbcf55c0fdad73855a97bef9b33c4ecad766c8600dd5b5761cac0aee75cc42cdd7e401c4e49e7896e379ef31aeddc7ef0829dec95cb078ff5242111ef4ba767523cddea55a4fa5fac7ecfc761accad2e208fb39694a20209b9015855ac6a3bc7473533c852e16efcfe6a7e31a53af8918c94dbd1878e8fa6b687d1ef1a23ecb768a8db93aec867014594fb82387446f06236e6a4aebcaa7536b3fd29cd2f63cec863884aa04a9dbff533f9ee71a9c7b57f451f20931635b2a998a2d383eccbe02ae8df431f4fada34883d15777a7245b2587dd28f1b1f3dab46d1b75945aaea8bc73b0eb93d62d0927dec76451126097c4245c82ab796f3d1bd7234e6a848a6ed38c18fa97e249d8acf68c4296bdf608032be5c5a970f6362094a731f26678a599b0f71528a21df148e510488114eda9635f160934a343a476c6cec8a1de2990e0dce1a135a91da13f3b693612c073a3d06a152dfe4e2bd4e55a9f52f3d36ba629dc26dc36789953b5402616e54391a5495a6650bd838fee1f3def5dcf1fa2cb1608f842c9bd1498588bca334aa93c8807b5ad1fbfa0bd3b8ed397a9158bc3e0397d9061890142f56df7106dd7f032fdf7d5d319b1e9fb4444c5d968ad75ae6d4b1945248cf26918c18d0057b613efd47cc626b8a8a6aad804e51f01bb59c760b481e6eac1260f95bf7ffef79cbf7a5887b067d8ecb561da18b44f57a8916c79834a83b3d9a9f1d201b387995f8646916aac91b5c61097498dce98c7eac2d033b9ffdd124db7da2d7e0c9eccdb7a0600b06d0e540068f77b986177ab765eafccd8c99b91397d7c5533d9a31e2feeb83b6cd5cbf473c3e762d1e7d345e2dd7dbe7e3ce46f0e54ba79d59d7d7668be5bb4f229bcae2175148cec3f46a13cff4ff76ff5ffba62cff553c3d69333e4b791076c2dc99dc7b7343a6fca753314c97ee3e26264d9d87c5a8f2f5c867ff720ccc4bcb17afff74188f259abc800dbd2461f51551d39c45efe6b5e851e1fce21f253988dd0e8f18387b3dc7cd55f00b3342722049324d2a58504e1ce378910ea73e16833b9f1beb44d1a35e79da449f5f9dc00b6bf78939a97a642982a23081c97f9276161d0fdf5083766738946d0eafe83d7f1b5e2901b76cc6200aa8afcf61ecedcda8663c3b13ef80db2f3e58b195e5d966f223cba0538c84fbec74af2a1875dd690aed19bb32c4881d05e459e288f178b07ab3b8eb9a285e6c71fa9a23aa106396ed6551910197f66ebf8a51cda277ed389e68548e5d4501c62ddbcade8001a7a902e13e3f1ebd1fbf6c45f61771578c9b0f6e6e54ac0fb738bd62caca9dac2b30e1345b839a13fa80a0a6ae88675a55e6b63f703fed2df48a1ff6a770539d4ad48f0c93262fd920fa773e9b7266f0bac3627e9a8c4ba747af7d8bee1c2674a8c42d1563ff720c9dcfe2e04abee68a0260f2ca5de2e971db11461bc29887a49d0d2b397cfb76775a5739ff5c734d86f3ad99c782c1e9b635fcf4bffb3aeefe93ed70491dbc33bb48bc306611cb0f05900cf1081ce8858b682593d14fdec20337143fbb9db66ebf786ec22af2a5b8601c412f726857339c4f5eeeceaaed29bcf7d94ac2f43e2a5f5393f91b7382d5d87ed9824ef1d3a4bc97cf5fbaf37f12a107f29ce2fe61dfb027c7805f0a4792fd185d194c78aa230fdd78f699f173537e109f2e3d8c538a079d1321c998037a9ebab32223ee6b5de218e8fdfe7c316b5d1abeb07864e1c3a814715ba30406f76dcff84f16327f7d1a756b56e0c53e37705b838ac16724e714885b9efd94747f5cf01d8a16fc773af8fc8556f468554fda9496239e19bd846dc704017338e8dd98bc59f4ebd698b10fb42966c7f27d19e2ee613fe0d492088417bd4e45f6e551adac8d72e5ca61c5c5c91339445a14eeebd29c076f3c7ffae885e979e2e3d5bb48160914996283ab44bd6427c25b44039b911b2a45d2a06a2c2d6ce79f9975c0af8a312b77f243be1f9f290ab34f8f4fefc324c9089f8fb0802036cc4fd79a09dc583e9ca667d050fcd50432f5e00931665316f9461b060cc1a2aad6090a836ea879563074e09a7d62716a00451f1b1c17f1ee14dee8d2989b4a38365a6ff788b1cb7771c06921d71c81a418897665d0f79a589e6a517cd7382b35473cbff6789005d8af1d89291256c54735ab9f9ae1321e9f8b140f641685e33086113078d1ab82aee524fa37afc681a3598cdf78800a71110422e3d894ee22a06a0b1e3f16b79d0e950c4cbab1787c6471468118f7f32152b4988339027412119e2c6ead18c1838d2ad220a27846dab28c7cf1ceda631c524d54170e5e6d5f87385d803a658a3bfac5e9b962e8ca34b2c3a2b104d4a0da5ce70a82f7da5dfd64777f35d6b4ffaf18a77038df216e7f6e3a470b63f09af448ba0086fc2cde7da22d036e3d7ba5fb678ddf95992fee7dfe435a35abcba0be9da91561ba201c7ed8775c3cf3f67c52dda66075aa5fb2a217012a588a9838b80b3727150f746f49cf13dd9efd9c5ce208e8cc84c92ad5c30bf8f8a53bd87c2887cfa67e47eb1675b9af6f577a3f3f97e3b97a64e1c52f4bd48d76b363529f62f6f57e6fae98fbf3493c6189480681de9741ff9bab31e691e2ab680d8311dfae15a3bf3d88c31013941d95140b46259fd6358c2c1d5572307ae8b4e5e283ef76138828871f0b7a7f364d2ba80c7dae3b6f8f59c88e94427ab5abc1a4276e2d66d7a0a9abc5d84529a8067350d41c59cf75893abe7dad1bd9455efabcf62dfb72b451a7fdaf65ec3b78a843793ee87f4b89f8d77878ba38ea356be17ea22d3255cba85058486494859a89d1b46d56859e2d4a16b5ffabc1af65ae7cbaed086bd30af179cdb84c46ec4603b2aa43e77152562fa81a2e48b299291769a24ad90822ad26823d2e49b884c0ad08b2f31da4147ad997e3616da69f5c5b0446bf4caccf83d3288817f9748ab150b74a591a558ea65609abf53fb3754dae430c59b08d0c6b0201a147d57b6828bb18d9be2e0dff107f58949a2f46ac4e25c710894bdbdb896c7a55b232ea8c0486dfdfb5a3c0215e5af82bbb4ce5504478308e66f3e6735fedb2bcd4e26c3d87d5f92ef1dfc50729d447a0a82ae57482048b4cb8af104517a0c05c96cd4e7d70a711e3f3e191559a193218dab9314b0f6430f7d703f46c5483f2951318b56437b9868ae804f8e4225a1b7dbcd8a916f5cea0db9879283b286e63d7c72369bad15abc8c027a560be7d512ec9bb33f53bcfecb415c5239bc0623564f3e77d7b0f0c6756717e8f59cf78bd8e08fc6ab5331fb252a482e3ee9529b3a9692e781153b0f880ed7fe7b0afd2e6832fcab0fedeffcbfeff8c562c6cfb9e865098f5e8f5ec8b48acfe3a731fff947db3071f976f1e2873fe2b5d640132691025e5422a861cbe1bb777b931479763efded6f2e104b92d55341718f114b20950f46dccdceed0799f8f56a168c7d8c66d51319366d2563979cc0a4eaf087c562f3ed67ea4b5de9dae8f416fdfd85bf8a973fdf8acf581655d678f03d74ae25983ffcec09fed5f91bc5e8a91bf086c5079d97964a6b704b548fb53367dc03d42941bef1e9298bc547cb8fa21a23115a7c4455a86875f2ccc00e8c1db7189f339f77fe7b0ff75f57fc986dceb663e2bed75712b08683ea074c183c997cf16267ea552bc7cd0326902325e2171a3ba803d99bc3431d6bf1f1c0ce25f6df8c4d4744ff31cbf049e1c1e9e081e656a63f5bdc0995c678fbd5e115abf7a43177ef313289c663b11130aa9854033a9f8c4e1890840fbf620f9e7b0b59731c7efc16099357a0e5c6ab52041e839980ce1f54500b0f386910a5f048e344bac49f5b52f37cec7f70f12eb1de6e40abd1d7ab5622e5343eead28096e1678fb35bbfdb22f6fbe2907402a7de4733358f0577b53c0bdf9d2e9f78fefbdd9c2092029d09af298c48571a7d6a4630b484a347cdce6947b2c43b9ac389ac42a4b7907babc06bad4e1d531e0e28e2c9455bd9e78ec0adb361147ee2d57c5eeb5c9bd59b767220dbcef377b6a19645cfcb6b0fb13a5521cf6c26d203e529e2bddb6ad3d4767a427ef397c3e2cb1d45e4c75442e77362d3b84add293cdab22603eb9c9d593865578618bf3985c2f0184c6a041ea301bd6317cf5f5389017fd04c19bb3b5d7cb82b0fa1da705a24acf62c0635af40bf3a67cb8f1ef17ac598e93fd2e3b696b42ef7ef3956fa4727d4f3f908ce754d95de13c47145633d15c1b4d1b2721eb3dfe9cef5e52f8d06fb426cea3761a198b5260baf6c44487e02523492e2a17a441e9f0ebb87eb2b9dcda333569bc4a76ec0a38f45a71718bd793cfb504bd2f6a790995dc4b827bb522bb18c949c952f6eecff01d9e64a086143e7b633eca17a0cbde35436d5b6f41cf1de172b59b8310b87391aa13306836d152d2ebe7cb33bcdfe20e4336ec1063171d941d2f30d7815494bacc2a8a8185d397cf6f24ddc55c20afb3f93168a2f57a4e23326a04a6684ea42228f4e9daab377e576ca98028c1af2001dffc0ab73b0c82bee1a3c830305560292165834a353dd74a903ef3fd79dff8e5fc182ed79e8740aaaa49d87ebe9d0209a792fdf56e2f8db989a25ee7e611a596a7954c94a98c862da4b377357830b939cbc90bedd6b778a346780033976f6671492e9f290e3d791e797712a7e8c7a13ba80844e08842c51162faac948ba64c42d8ce8858a22c9c428769a98dc3cdfb921d75c62c072e4e64362e6de024eda2aa2533dc478f279bc7e19063438bbce60e0fa236251ba1783df865b1fc0ea4be7e596d579a0c6d9c7aa7d976c156b728df87466fc062b611e279da3f299d4a56989fdb1b6c0255e5cb8970c533c0e4947d940211fb44be4c6845329cc63b61d13d376d9c90f8bc1272b583cb93cd63881a3e927f14b7a9e6e5a856ba3c2a5dd052ed1ff87dd9c94e37119bcc47a0a79b649051ea97d2afd7475a14b7cb621995d5902873192428315831a20dc9fc980269578b2f6d96d19b9e998989d5cc8094b5964010154623d590ca85f96271a9e3ad6fcfdf763ae53bcb06c7b70f7e116919814276d628bf8eca6b36b6eb6397d62d682f5b46e50955bfe90807121e3ea4abcf68a700af78cfc5a2cd8ae05a4c2001d66bf9d476e2ec7f8c76efe47ecdf76225f0c9db88a95fb0a500d5108c9046a2606398c0a16c18c5177d2bc8433dbe42297e8f2df391c758721297e74aa976b93a2a9132711c84ce3eb3707fccffe191b9345bfb7171208ab8e2ee0a196ed0473df7f8c80a2f2e32f0798bef06752f3a2c956ca207021c91ecc9e6c3e197a073d1a572d86c3c4856bc5aca59b31d568cc9a8dc7f1c94664a1600be433e481960cfa83e0f851bb5bbc3c79257337a4e1339747280a88229024622d3624e7095ad60a67eeeba703dd670ef63b867d2316eef721f4bfb5533650dde6e487777bf0d5e25f7975e6cee059348483e2a4b2299defdeed4b83f8e2751ebf3ff3d657be156b0fbb7149e1187c0acd2a14b2664cbf7fa4afcf6c57b2d72f9c9e000e8fffd4393a5ab1ac8cd9a447af4aa4aa0a6f6c4a27d52b61522c10f0514339c998aed7d2e012d367d716b8c54bf37772d09c104c5db6f85ddc1ce3e4a34e67a76afe67e57eb1e884005d2c8a66a494c76d56171fdf72769ce5fd8d47c5a7071d1458cdc109dba8d52fe872f8feee73a772df3bef57b1ce5d16451786c55d408744c1471d4eed147f3a5924862e3f429a3e9e802c63508ab8b18a09bda39004a78337ee381de41db325598c3fe445c871c8228b5be24c0cbdb126f94e2f4b8e65f3f58e3c0ae438bc928cd7a40655e0b4e3a95e75cbf072a3e213fc7ea757ccd87d8239c99e6000da27fb09f79990a41ceeae64e2ad3fec64b578c37b9b5239e4b2a19804926226d691c6bb5d6ad02ea1f8c252cb4cfa68d9165ad549e4d17aff3ebdea7ffc43bb50cf79f04481a8d7770a81e8ca415528241d71523aabc6f7a3f605562d5fe8bbb5ebe71ccc12835eff9a0c6762901705833f1804d6197c940b9c64faf09eb4a9557cc0fefe9e0e2fce126b8ef8115a09844e10136e41cb12b51664b1f0adc78a61fff9babd62e0a8ef08d81a23297686ffb719be6399cc98bd929af1125d7af560d0079bf0118d103ef46a16f7b62dcfe7038ba7e1bef6e54fe29bf92b78f2c5be0c19b508b7144e40b6a20b386955268f35138b67e81c76b8c58011b3d9976f25334741d1c9a0f322ab6ead8202c9a1f0e86db598f89f92533d477cbf49bc3d7d172e632c42afb5554f94238529cfb7e59a660db8f5b129a4fb8dc1d45f49b211a39c60e65bb772e33984e9fb8d9b2bbe589d8ddf108dcee4a5ac9ac38f63fb92f40ff4f5858e8ffb67ff2c762a65b0eb6ca8aa8f2a4a2e23ba35a4b5e5e2a81a7e7fff615588b717ef61a53d8c42b31593cf4342d1093ebcbb21cdcec834daef0d88b716ee62953f806a88c6e20b27dfe8a78aeb3853ba353e2be6307a779af8664b162723e39008200704e53c39bcd1a9161dcb95ace7f0d492dd62719e84c368c5ea97a9e2cf62d4ad49342b73aab8eba1c5fbc4fac2681c5a2280ea22c12251592ea44678046fb72b5ecb3079d33e31ea9013839c8850d3e8d3a23a223b8755bb9251122a73381083d967c02b79701b05d1ee42ee88d3f14ec7e2c913dbbd01317ae176f6da4de49a2241963068f132a04d9883cffeb0e8597bd2295efa6127a9e109a801adeec74f58c0c53d890aa3da1677b29a06f6906f56f058fb263c50ab74eb572e747cfd7f5d7fd93b856133d78ad1df1c4331cbc10947082783bad6e4adfb6ef8db6d1ff6a55618b60b9fde8c439650540b926240929d585d797c3cb4333d9a975cc4337bd321d1e7eda5f84db1412950edd42b4ae7e4a65a5ebe1a5e721ce4c177678b056bd3718485630bd8a954c6c2803b1bd1f1fafaf419b9902d07b3f11a6290541d49d10ebe7ba72735356dc4df7e7dc7cc13870f1fe1fd210ff2e2a4f9ac3e120eda79b8ce4205398b396f75a7e91954d1bfa4e78b17dffb162532913da90a8576277eed74ce18852cdc84f9d279e1bea60ced5e3cb5f6f7f74d59b15d0c9eb81ab75481805142969c089787b7fa36e5899b937871e67a3e5c9c89a21882cedc247278b45355c63f7653897df7cefc8d62d497bf6097b400ba8cd97584a1f7b76470f7cb4bc5eea8d72786fe9ccab69301ec061b42325225708457dad4a07329545f7f7ee0a418fb73264eb396c963c2e6f733a48985476a9d3ef75e9feb14e356fc42446225d6e780d3ab43a7e8095040ef4a3a46fc21b5fae5b587c4bc1437853acd39cb2812843b0be9df308a673549c2127ea3b7a7882f76b9c8335a50743ae2f28f32a47d1deead7eea98f4d33d99e2fdcdf9382cb178f4dee022a2a6eaa453053dc35a951c98edbf6497589927f0ea55a21d3924c5dab8b541357e4e73b0ec840f1d0674013b0139924661858cea58875a67683c7f79245b7cb5712f89e513d86a3751e8d01808143cb28e446f0ae36fbb961667544d4f3b9029be5db18d13e5ae25d3a7c3ead77616120dfc398cbb4dd392385d67313f255b7cb8760ff736adce83b54b5ee8fd7f4dd4ffe47bfff689f5521bd3eab999624b5a184293bd940536770ecbc7f7a26985bf8fbdf097b41cf1fa67eb59b63985a42a16121ad7e5c7e5bb11ba88a0a8b9d99bc53b8fb7e6f10e2517b71d717ac4c3af7ec92f693201ac2842c2203cb4afad67c2e0ee54fd936ca777bf5f27728bdc54af1ecfa3379c7afe579b0f8801ef6fc6ad33a0a85e0cc2cfe8471a33e0a65339ddfbb30ac5b0298b48399ecb87af3e405e7e21bd862fc4ae2b8b12d09457023cdda51aef3d7cbab27365f27131f89d6fa85fa72a470236366e3d792a8d541f3c7f2052cde6e99e4d79f5ceb30395da3b17ec3a2e9e19b5802c351cb7640bbe234cc9e6eed63599fa6447e9605681e8f4f818d28cb511b211bdeaa34eb4871d93ceae9ad69ef7c5cf7bc493ef2ec7654e0cf24d457a33e873536ddeef77f15c47973af6ce75ffab1b8f886f0efaf08669351c9aa0bb83979a2570bfb6a5bbc4df61af5f3cb5f420bbbc36f4c2891f23f54d3e16773b1dd89f773c577cfef36e922a94214f6f6569aa17b72e9a089f93784321136e4da2d16fbc48073c5ef1d58a83acb1fb39aa2f838a1f55d116577a9a92ca3bb737a496e5eca0f56787b2c5a40d1a5b6b3cee3033567f0e7daa1978f98c455097995bc56ea90c9256a486c0a47ae81ea3f2de4de74eeddcebf18a797b8e07174935cbd8a85d3e86e4e305bcbd318d34631c61aa3fb8e28f538a187b6b755a9dc1243b7ce361b17a7f069d1a54a25051f9f290a2a94c23734ae7fa8dfa113c7046e6df875b8e8905c94769d1a026df1c7452e48f0a3e5fc5c980da169e6b7c7ae2fff260a698be711f7734acc1e3f5ff1eea934b1c1affd8ed973c88ff4e4b67ed3a2a1e7cf93b7ca6caa0f723f9dd74ac6d65c99b3dff36bbbfdd912e06bcf9255e5f182d6a5b78ea85fbe8376032d9fa0ac1a64678d3b9bd5922d307df734e1bdef97ead78f9b30da8e19591441866b988382993a5139ea07af48573aadcf0d444b129c3863044228b1c5a968735ef9f9a5c7f2e7089a79e9b485a3e6cfcfc09ac61613cf5ee5c16ed72e091cce8640389723a47bf18f83f7b27fdb4473c3f7a250fde18437cedbabc3d79233a8b159f4e1381f1a0cb3dc4fb833a33b043f142a2dffb7ae3b12c71eb9313f1465c83479690fc46c2543b77343632e3c5537d33eb9743e281e10b098457442f07d0b9521937a43bfd5a9e5d58b7746fbae83dfc1bf20cd511fe0026259bbb5a96e58b4177fd6dfd7cb1e376e29643e2dd43f9c195ac2c4713eb4de3d516e5e9560a0e41b3e9fdad47c4877b1db8ac91f8251d15bc057c704325ae4f3c15d4fdf4689ef8e0c73d3cd0b02ccd6b57e1bff3f7902bc7e2b0683506853c9514cec0dfcedff7b83ce28da5dbc97208dab4a8c5f40d2750cd56900d44ba0b79a36322b797706cb424db215e5cb49f9c880ac1ec2b6bd161bad60c6754ebd393fdf8f507c5a4141779a638a2b4988aeaa595ed041f772dcecb753e38b79efbab3812306114d1c1cb8d9e429e681ac5d3bf4df05bf3ddc100f1099785116d13a954299627166c235d89429224bcaa8eeed6934cbcf5148586f67b76c92fe2c051370fdf7c0d4b0e9d604d9e829b58cc424735399b315daa93147eaa70f0c31d19e2c375dbe87b63a3ffbdf37cecbe5aafb9ec3eba33811e3263ad78fffb64146358b0f3cd9e42be7abd2b5deb9d1fcbe38574daa17ca718f5c5cf2cdc9c82cf63e73ff7b6a277fb063c326c1abb4f86e191e383341837d4841fdff87325b746033f13bbf3c3410ec3e87352c592c78c91f7d3a85cc981d53fb3f3c7dd29a2db9059786d1583699e9a88f8b457dad0edda6ad294cdc962e4e49f291f6565c6905ba95a36525abd3f5ddc326836bef072c8928a51d6f1ca5d5578e1ce531fcc0bd35688af17fec27d1debd0a14b1b1e7bfd7b521de1e8243faa148ed993c19b8f5fc7d325500368f7cffbf5a878e983451c76db08186ce8543ba22887c7ee68cc84474fef44342ea841d3f6806cc5e8cb2331c2cdc1cf4f07d67f6ff39a432745bf11df70d89b18e4bfb1b8d279f4b63a8c79b46436d80be9d3d2be76ec917c316df3318af491483e6790fcb45ff3723c5fa7f476ad9dbe5c270e4bf1a78801097057828e0f6e389575f5cac6036279722e0f37ad48ffba15a491eb0e89a9692a8a6ac565f0512590cef4ce8da81965957e38691753561fc48483273b376749f249bedaef2660d0a8615c34b329ccee72768dc7c27c703dff0000150449444154b402316af50132e4187c7a13b6a22c1e6c12c790333279b615b9c5c0f99b38664940524c189500758d4e86754aa2d905d6fcaccb738ac77edc874b44a157548acc32edcd76beee7c6a41326adb31317b5f0a514633c35ad5a14da24d9ab03f438cddaea2c38747a712e77132a173155a948d9436e61489711b53c82cc86570fb0658ad613c37670bf9d64434fe5453c0cec0c6b13c99742ae3e9e9d507c5e694749e6e568b5e7fa82f2aedf173a53cefb2760a5d86cf164bf7eb90a542b42150c9267164f203a56ef3ac6d47c4ab1fafe2588e93eab166863ed691360d2af1d50fbff2daa75b701be3d00ba860c8e4eb113d69f627d5d39faed92b9e9ab01a9f5c1155ef26d297c27b4fdfc6c32514109dcf2079e1cb9fc5d8efb351c354247f801a910e3e1c7627f356ec60cab7abb9a1716dde7bba2bd7fca61d316af12e3174fa81606e3d0688d63958f17e2f4ee614f1f6a74bd99d924fbf6e2d19d0bd390fbc328335292614ad71da99bfd7c1a35daa33fee19283ca5a55f6f08f56725cd1ced14f05af63a4021eb9a51623fb148f138c98b942bc3a2f0da4480cfe7cc63dd99cc7da140fea7db369bf78e29d45b80de509a846e20c293cdbeb7a9ebb88d5e6f9607929d74c3f7c52bcb9ee100e6b058c8a9f08773efd9b2430b05ee99d3dcf3a96235ed87012bf36712b3ee29d2778e396baa83a3d5337ec253fdf4ef766b51950f7d43b6f9fb3556c964e558fc7b8ed3c9a64a65352397e3a92c3d7bf1ca6a6cdc6cbed6b51cb1626bdb6fea0989e0a7e8399085701435ac6d1fb0fbae25f1fcb15e3d7a671429f808e222a05b2e8dba432f727155f844dd89d21c6ef51704a3ef4b29f58bf83111d6a71cb4568344c3f942d466d28c46d34835488acf879b75d652c0266fc9ac1aedc5cae291fce8badeb50df7c2a7e76cb9cdd625fa00c3ae1c667b0725f99221ebbbe2a1b8ee6f2c9e6bd445bcc0c695b8f163156e9d33d69e2dd1d6eecfa48ccfe22ca48458cec5a17bfc3c3671b5248b3bbe9dfa202bdebfc3b83ca257d13a53ec15eca87f7c77b9b0cf858ecc8d10aaf9c18747aea2478d9f67eef52b5f9a1714bc557cb7623db6cb4ae19cef2d74fed02d61f3b29ee7c7e2a79b2c62da4273c90c98c57ba70db9f88ac6bf7b5feef54b13143a3f28ec62c65715f878a7cf4e8d995c6e78b53c757be12ab8f6869a8f9c1e3b31bea95e7c081dd284e2f4d92125834b238e7d36dafcd16cb0e1951039a0a9c4ac528419716159835771d7a9d89d707dfce5d4daa3277dd0106bcf7134ab80ded1457e3626a5bd5c78a517da467467f2ec60e2afedc273e5c283e9fb703b54c0d543512a3e4202a90ca9827dad2a3edd9e98c2367ad1623661fc7abb3116f2c207dea696657aded1fffb8533c3b7611fe98bac89e3ceac7f899f2c6fd342c7b7e5c40e78b5f695cb7302d573cbd62278ab5261a097698f718435a57e7a14aa55b23d36fe12eb1d8530655f26155dc344fb4505de763e9ae9328063f236f69cccdf1a78e9136e43844ff455bc98ba88c5f824aaa9d47aeabccb24dfbd8e39068116be295f675a965d205af7f67c301312e4d172cfc6ce8ce67c2ddf5493a4366f2fb8327c5c8f599e49be2f149769ae88b18d2a91e2d4a606dbd7bce66b145540f1696459045cf7a71bcf417dfc5b9fa61dacee362f40e2785611184290e12251ff52adb58b72f136f40e69e6be378ed8c0ae6bd456ed17bf66ed2a2e3823b059d1ffad48d62ff81a3ec2e08a37aa48337bbb4a0d16fed7e76c95631d75e3118f3b0fab2685f3b8670c5cbd2bdc708486519d7b93237255c5a8161698cb1cbe919a53ac19676c36a3c32591cf36813a2843ee0a157ab30a63d7b9a34ed52de3769e9363171f6068e1568ab691fc3fbb5e3d13378d7fb8e9f27666ccad50e3450fd7e7ab729cb27e7a8be3dd38ef8bb46883c636d2df4454543268bc73f44ada892d3fdcec7fedb5ffb4a2c3d22e30fe883d41026d587ce9dc213bd9af2f6bd67afe81f1ffbadf86c9d9d80211a093f7ad988a93085a4aa110c7fbc2b9d93e2a4cd29d9e29e17669121a28385589a625dac92c2f4e17773d33515a5693f6e14df2cdbcab50deb9295ed64d5d66cd29c6160d208ff343aec1cbab7a9c673f7b4a2e13908c496ee3a2aba0e5d88b055a776441abb3f3c9582bbed649e18fbe54ae66ec9c71f30926075f158b7260cb9b3f9653916171ecf11a3571f265bd315908d94f1e530a0691c0f9650597b3efdf967d7f499bb45acf544e3232c5824a7d3b9109e5c9a444732e4fa2a3489391d8f4a767bc5f3f3b7b38f32b8b47a0355c5a21661f2d9e95aa73c0f35a94c35c32987a0fdbe3f9c25866c3c86c35891c6720e0bee3a95c4b0b9d02566ec48634ea6c0e2f3922807e8d2309e6ed5e3a85582badac1428fe8377f0bfb4d495854371dc373f9f8b673eb15fc1526bfe4bbc4c0053bc83457455244d0f9993c4eaae97d3cdcaa12f7fec1f1eeb33b459f6f369317510b348153d913d43bb12a4e7a548ed66a76b826ec7475f4f8eda962fc9e008e3033063cc8428facb869ac2fe2990e1a3bede5b708f92bccfeeeff2fcb0f516bf4e102bb68f9c4d7e413174cabd4050a79fef66a8ce87d69d9288b93d3c52773b6b0ead714845ecff535c319f670475a543fbd7d5c732853dc357c0e76ca13106e1a97f1b2795cc959337feca0bbde9c25166d7707c9f1260fe9c4fdcd2e4dd2effb6d4744ff376791276b423b2eaa45283cf3687bfab52a99f367c3810cf1c0f02f480f9c9af0a3757047cb720cbae77aaaff56a4f3e0fb0bc477ebf3f16839deaa0b9392cf8bf735e2e5330a8d3e5cb4597cb4602bc77214fc7204065521c6eaa3c53509746b579b7bcf8373e8e98f178bcf561e452749dcd7be0e6eb7c29a5f0f9059e4a7725c385d5a54e5e15b1a53b75ce9aeb84beba3f92e35470cde9082a4c6837010254ef05cab247a55bbf42ca3926cfc213557bcf6f35eb245025ea399729ce0eef266ee69519b6a86b36b1fe6a5e689f13f1d24035bb086a69c64e7c1c689f4ab5db2c8d4f00d87c4fc438120095d9b9a16841260674a1e056e99d8b266da26dae858239e567f4104d877e10eb1bc288a58c5c1f0b60974ab746914106377a58ba95bb22832856392bd744eb4706fe3449a9f43596edcce743175db49f20d91e8541ff5c27cdc5f3f811e25543c1f74fbc4c865fbd86cd728ba4d1855851b2b1879aa793c754bc8ba2aadb173253fe7b2750a3b8e678a8e83e653401caade8fde93cbd07bea33ace7c5d5271c2d7489573ffb81053f1fc26eac86cd9fc7f07ecd79eab780d6999dd876d034b13e5501391c7dd131be7ee34eee687c6e519133efdd91e3123d9f1c836cd0b170e23354fb0393e3c50c96359976f1fdc20dd4aa5c86c76ffa6b36d07d791e317cd27744dac279a86b4baeab7a5ac96bfad614f1d8c845f84d6591025a425f1ed79573f0e3d8e27a07bfdbb92e354f14e5e7116eb5d2bac69f4b1b96d4b68f57ef15d3e7ae25f57836b136330dead7e2e6ebafe1dee69777a5e8d729b962e8ba43a8c644c2bc1ea2e574c6b76f42b3f89225252fa65f4bba6741468158b63b83f8083d5dea55a6d15f046e57e5bbc4bc2d07b01975dcd722893ae63f2f9c9bb9ffa458b2f72847ed2eca18256a2496a3438d72dcf4070aea3f6bcf8fd9763174d16e2a4648cc2e815be962b0f8727f9a587f2c8bcecdebd035e6af57ef738e648b8ddbf651ab7e6dda558ea5e65f683bbfbfe998389c9dc94d0debd0adc2e5b908b918dcfe8e7b2e5ba7a0ed146e78f25bb20391085987ac14d2ef86324c1a58325fceb9c0d97eb2507c347b3d4b36a793e535a0f73bb8a9710243fadc48d312b8f3571dc81477bd3297425d14668f9b3e9d13997881741abb4ee48a94f493dcd6e4f2a3e26df1f824b1354f13d9d18e27acc4a9997cf5560f6e3843a4e5ef186857d2333fde9d2a3edb9b4b8e880dd22ad74dd0d1b35e0256543c4e1f277d7eb20bbdf83c018adc3eb43a6e5f50f74e10a9975005188512ac60375bcd18cd662a190566a38138b39108a3816a2590115e49186d2c740b676e011daa5df842e14a6ae7bfd1d6cbd629689dd1e8894fc49e425bb0fa525316ab1b95cbdcb17da9761e0a598b77a788992b9259b621037b00549da04e1985e7efbd9efbcfa16babbdb3cbb0996259b28c4e17a09ab990bd9f3e7e596374218376e482ede28dcfb7e037c722549570cf499eef519757ee6d77d5b4f142f0f8e3b5bb9c3ef1d5ce637c7fa808bf212148bca857dc4444f9d13bf2c90be850841ec9a7c363b20603f95ae196a42728abaa514aab5addbd244051103e7f905555a79557a94a509a335cafa38cc18eaa83b21161c4d9ac24c54552cdac27cea0a3e105e82c5c4a5b43f7861038170297f564f0e4f8efc4e4955928e13141611aabeaa25d929171cfde4ed5a8b38bc0d61ccd129bf71c61e2576b39e1d6a393a3c02413290a79e0d67abcddfbdc528d1a40ebf6a78876cf7f0f9175307b927977405b1e6b7ff141b4cb69d86d3b9e2d3a0e984241782d645946287e6a5af3d9f7c93f4b3d7e3961f2bb2ddbed5e919ce360e6f623ec7309544324fe801559d207f7000149e0d1eb829a1946cd03085f103fede391f160f0a9180c1eb484c9085993fad6a3d7e9f1093d713a17da818e968fe61602af5b20cc91e4abe0723b911409377614a1a26d31caa3a76ed5049a542e4bfdd8709a9f41297d396217b2e9ea43e0b2760a9b8f658a7b86ce255d2d0392b6da32a173179268b353313182c4381b5e7f8093d985a4e71490efb560574da01555f9ec548cf0f060e7faf46c5b975ae79143dd77cc5c317d6d21b264e3e62437f3df285984e64a1c06033e5c2ca6fd948ecf1487eaf712e13dce9c51f7d1bed6bf73fbbf2ac7217e3992c1a60c1747ed1ef28d1654111da4bf56340e66a131a10a249d82deeb0cea4a98859b048b81c4483d8da3cc94b598898d3052d66a22ca2453ed0c1eaaf31d23c9768f28f206c872f839e1f2925ae8e078a1870cbb9702a78732063f49090934ab1147dd7236ea9ec72ef97cdf1dba2e844049085cd64e413378f2cadde2c5b1737085d744d18721840e1411fc48517da7da6430a14342f5f9b04a1e6a2648746e55937b6faccb35bf71beff55f71fb0bbc56dcfcd20d56923dc9dceccd7eea6e355c281b2fa48b6e8f9d237644b6540e321f265f1d0f5094c7ee68ecbbeffffaadf2ee4ff232e8fd874ec242b52f2f925cb43a146c56ed4e83d34ed5f29a8d5ab570348b8b0f80384e3a3629491aa9161348836502d3e9a1bfec1e39d4d052e71202397d4bc7cf69d7004631af513cbd0a26a399a255c7c9af3856016baf6df87c0153129acdc77540c7eff07f6e7e9f09a2ca8840509d8b48a465968ac8a3e2c6170f3b551dc734b53ba5d7be1622cafcd5c25467c7b0861347077431b5f0f299d7a88cb6148dd3eec73b1245987aab721eb1c241aed2c1edd87a4f3148dbf1cda7029361cf12be2c763397cf76b06473d46dc96b020eba7907c289a408e62c01cf0a3931c58d402ea471869572d818655e2697c8eb4c84bb1e762ef3de4768b5587b349dfb187b8f8b23cd1b164519c8b7d7ee8be10021a02578453f8bdab96eecf10fb0fa77124e504b21a20223a9aaa15e2a85121960ad1e1548db9f874c11b077f21d6a646101938ccf2b10fd2a8c2d92a6a57e29059969223ee1ffc05f9ba4454adc8c99dca6b0f36e7853b4aa6c3be12dbf867366f717ac4a495bbd860b751608cc6a80824e1059d121cfc3a4560501c24997d74aa538ea6e5a3697e0514341dcc2b1079f90e5a542f7d1eb0ab6d0c84da7361085c514ee1c29a76fe57efcdb68b76cf7c45911a43afa656a63e57fa5ac0e76f4de95e79f3f0afc4ba7d2e3cfa188c8a9bfa090a9bc616a79c28dd375e3e4ffba5d025de5c7188230e1d76930d1d7e2d6c8c229b31a96ec2858f265637b7d5af42a3c4986215c0974f2b42968410f86711083905e0a3b5c9e2f9711b08d3fb5938e65e5a265cfc8ee39fedbe3f7fdbac1d87c583c3e7e3b39447960d94f51e65ece0dbe9d1f4fc0af12ea7b65c8c2deffe9a223e4c16f88dda697c11b2aad12aea312a2e6a4a2e1e69579beee71973ba98f787ee092170252210720a408f77e688b9bf7ab9a749045f0eee7ad560d263fc4231777d368a1c8e5175d132c1cdaab1ff9e14d4511b93c59463e0d49b30ab5ef47e3d167f017d1ac6d12d2981eaa6d3aa5b57e2c71bb23984c0df81c05533015e0a38751e9e208ee6c38c176fe29e1625cb085ecaf3ff3feedd723c4fdc3ef85bb284468c27132367f1c9a0cedcdee8d2b898fe3fda72b1ef5c9c9a275e5b71941c4b1c4248549572e9dfb2023d2a5f1a57cfc5da13ba2f84c09580c0bfde296c3e9829da3eff2595ca5a49fee4eaa95e7ef2a3c562f2d26c029688a0487ba7ea8225afff7d8a7597eb609fb4feb0f820c5834186612de3b9bb72e909e25cae6d0ed91542e05210f8d73b8579bf1c123d5ff996a7ee6fcd3b0fb4be6af0b8e6d109e2a0331abd1c46c091cde4216d79a455d255d3be0b19f41f6c4d15bfec3fc8b4fb2e8d61f742de19ba3684c0958ac0bf729238b3b3bedeb05f3cfac61c3e1df900bd1a5e787dc3e5d8f1f376a48a3e23e7e13094c7a4faa91b53c4ccb71fa29ad5f8afefefcbb1bf42368510b89c10f8d74f129396fe2a5e9ab89c751f3d46ddf23157051e4f4e592226af72a2482a7ad5c5d887eaf1f8cd67aba35d4e0331644b0881100297070257c5247829502ed99d221e1e3c99ccc523af0a2c8ee4158ae67d275014561f240fe1812cd64ce84dbdb8102dc2a58c93d0bd2104fe2d085c1513e1a576d6ba1dc9e2fa06b5af0a2c96efcf105d077d89dfa6c91bba695bd9cf8ab7cf4f35ee52710cdd1f422084c0958fc05531115ef9dd507a2d98ba7e9fe8ffee5a546b3c787298f09fc6f43f437bbaf4de147a520881100257230221a77095f5eaf8e53bc5731f6e4398c3b1a9792c7df76e9a2586e407afb26e0e352784c0df8640c829fc6dd0feff3c78eada64d17ff41ab0d8a8116167cfc78f86faf8ffa72b426f0d21704522109a30aec86e3bb7d13b33f345fb019fe035c4523f298af5c3af1e0af0abacab42cd092170592210720a9765b75c9a513f24678a216f7d81dda3f0eed35de8deeada503f5f1aa4a1bb4308fc6b10084d165769571fca738ac2ac6ca222c3a95e2e44ed70957673a85921044a1d819053287548430f0c2110422084c0958b40c8295cb97d17b23c844008811002a58e40c829943aa4a107861008211042e0ca4520e414aedcbe0b591e422084400881524720e4144a1dd2d00343088410082170e52210720a576edf852c0f211042208440a92310720aa50e69e881210442088410b872110839852bb7ef4296871008211042a0d411083985528734f4c01002210442085cb908849cc295db7721cb43088410082150ea08849c42a9431a7a60088110022104ae5c04fe0fdceead204eb0e1220000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_filter`
--

CREATE TABLE `os_filter` (
  `id` int(11) UNSIGNED NOT NULL,
  `execorder` int(10) UNSIGNED NOT NULL DEFAULT '99',
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `match_all_rules` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_filter`
--

INSERT INTO `os_filter` (`id`, `execorder`, `isactive`, `flags`, `status`, `match_all_rules`, `stop_onmatch`, `target`, `email_id`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 0, 'Email', 0, 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_filter_action`
--

CREATE TABLE `os_filter_action` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(24) NOT NULL,
  `configuration` text,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_filter_rule`
--

CREATE TABLE `os_filter_rule` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_form`
--

CREATE TABLE `os_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_form`
--

INSERT INTO `os_form` (`id`, `pid`, `type`, `flags`, `title`, `instructions`, `name`, `notes`, `created`, `updated`) VALUES
(1, NULL, 'U', 1, 'Información de usuario', NULL, '', NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(2, NULL, 'T', 1, 'Detalle del ticket', 'Por favor, describe tu problema', '', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(3, NULL, 'C', 1, 'Company Information', 'Details available in email templates', '', NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(4, NULL, 'O', 1, 'Organization Information', 'Details on user organization', '', NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(5, NULL, 'A', 1, 'Task Details', 'Por favor, describe tu problema\r\n', 'Por favor, describe tu problema\r\n', 'This form is used to create a task.', '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(6, NULL, 'L1', 0, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', '', NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_form_entry`
--

CREATE TABLE `os_form_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `extra` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_form_entry`
--

INSERT INTO `os_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `extra`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(2, 3, NULL, 'C', 1, NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(3, 1, 1, 'U', 1, NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(5, 1, 2, 'U', 1, NULL, '2022-07-20 15:02:06', '2022-07-20 15:02:06'),
(7, 1, 3, 'U', 1, NULL, '2022-08-05 10:21:24', '2022-08-05 10:21:24'),
(8, 2, 3, 'T', 0, '{\"disable\":[]}', '2022-08-05 10:21:24', '2022-08-05 10:21:24'),
(9, 1, 4, 'U', 1, NULL, '2022-08-08 10:04:12', '2022-08-08 10:04:12'),
(10, 2, 4, 'T', 0, '{\"disable\":[]}', '2022-08-08 10:04:12', '2022-08-08 10:04:12'),
(11, 1, 5, 'U', 1, NULL, '2022-08-08 10:06:00', '2022-08-08 10:06:00'),
(12, 2, 5, 'T', 0, '{\"disable\":[]}', '2022-08-08 10:06:00', '2022-08-08 10:06:00'),
(13, 1, 6, 'U', 1, NULL, '2022-08-10 15:28:49', '2022-08-10 15:28:49'),
(14, 2, 6, 'T', 0, '{\"disable\":[]}', '2022-08-10 15:28:49', '2022-08-10 15:28:49'),
(15, 1, 7, 'U', 1, NULL, '2022-08-10 15:54:01', '2022-08-10 15:54:01'),
(16, 2, 7, 'T', 0, '{\"disable\":[]}', '2022-08-10 15:55:35', '2022-08-10 15:55:35'),
(17, 1, 8, 'U', 1, NULL, '2022-08-10 16:25:19', '2022-08-10 16:25:19'),
(18, 2, 8, 'T', 0, '{\"disable\":[]}', '2022-08-10 16:25:19', '2022-08-10 16:25:19'),
(19, 1, 9, 'U', 1, NULL, '2022-08-11 09:13:33', '2022-08-11 09:13:33'),
(20, 2, 9, 'T', 0, '{\"disable\":[]}', '2022-08-11 09:13:33', '2022-08-11 09:13:33'),
(21, 2, 10, 'T', 0, '{\"disable\":[]}', '2022-08-11 09:25:10', '2022-08-11 09:25:10'),
(22, 1, 10, 'U', 1, NULL, '2022-08-11 09:31:25', '2022-08-11 09:31:25'),
(23, 2, 11, 'T', 0, '{\"disable\":[]}', '2022-08-11 09:31:25', '2022-08-11 09:31:25'),
(24, 1, 11, 'U', 1, NULL, '2022-08-11 10:01:56', '2022-08-11 10:01:56'),
(25, 2, 12, 'T', 0, '{\"disable\":[]}', '2022-08-11 10:01:56', '2022-08-11 10:01:56'),
(26, 1, 12, 'U', 1, NULL, '2022-08-11 10:03:10', '2022-08-11 10:03:10'),
(27, 2, 13, 'T', 0, '{\"disable\":[]}', '2022-08-11 10:03:10', '2022-08-11 10:03:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_form_entry_values`
--

CREATE TABLE `os_form_entry_values` (
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `value` text,
  `value_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_form_entry_values`
--

INSERT INTO `os_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(2, 23, 'My site', NULL),
(2, 24, NULL, NULL),
(2, 25, NULL, NULL),
(2, 26, NULL, NULL),
(5, 3, NULL, NULL),
(5, 4, NULL, NULL),
(7, 4, NULL, NULL),
(8, 20, 'TEST', NULL),
(8, 22, 'Normal', 2),
(9, 4, NULL, NULL),
(10, 20, 'df', NULL),
(10, 22, 'Low', 1),
(11, 4, NULL, NULL),
(12, 20, 'dfd', NULL),
(12, 22, 'Normal', 2),
(13, 4, NULL, NULL),
(14, 20, 'Falla en sistema SIPLAN', NULL),
(14, 22, 'Low', 1),
(15, 4, NULL, NULL),
(16, 20, 'sdsd', NULL),
(16, 22, 'Normal', 2),
(17, 4, NULL, NULL),
(18, 20, 'dfd', NULL),
(18, 22, 'Normal', 2),
(19, 4, NULL, NULL),
(20, 20, 'dfdfd', NULL),
(20, 22, 'Normal', 2),
(21, 20, 'fgf', NULL),
(21, 22, 'Normal', 2),
(22, 4, NULL, NULL),
(23, 20, 'fgfggf', NULL),
(23, 22, 'Normal', 2),
(24, 4, NULL, NULL),
(25, 20, 'wew', NULL),
(25, 22, 'Normal', 2),
(26, 4, NULL, NULL),
(27, 20, 'fdf', NULL),
(27, 22, 'Normal', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_form_field`
--

CREATE TABLE `os_form_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED DEFAULT '1',
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int(11) UNSIGNED NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_form_field`
--

INSERT INTO `os_form_field` (`id`, `form_id`, `flags`, `type`, `label`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 489395, 'text', 'Correo', 'email', '{\"size\":40,\"length\":64,\"validator\":\"email\"}', 1, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(2, 1, 489395, 'text', 'Nombre completo', 'name', '{\"size\":40,\"length\":64}', 2, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(4, 1, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 4, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(20, 2, 489265, 'text', 'Titulo', 'subject', '{\"size\":40,\"length\":50}', 1, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(21, 2, 480547, 'thread', 'Issue Details', 'message', '{\"attachments\":true,\"size\":16777216,\"mimetypes\":{\"video\":\"Video Files\"},\"extensions\":\".png,.jpg\",\"max\":\"2\"}', 2, '<p>Detalle la razón de la creación del ticket</p>', '2022-07-20 14:18:29', '2022-08-10 16:24:22'),
(22, 2, 274609, 'priority', 'Priority Level', 'priority', NULL, 3, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(23, 3, 291249, 'text', 'Company Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(24, 3, 274705, 'text', 'Website', 'website', '{\"size\":40,\"length\":64}', 2, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(25, 3, 274705, 'phone', 'Phone Number', 'phone', '{\"ext\":false}', 3, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(26, 3, 12545, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}', 4, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(27, 4, 489395, 'text', 'Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(28, 4, 13057, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}', 2, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(29, 4, 13057, 'phone', 'Phone', 'phone', NULL, 3, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(30, 4, 13057, 'text', 'Website', 'website', '{\"size\":40,\"length\":0}', 4, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(31, 4, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 5, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(32, 5, 487601, 'text', 'Title', 'title', '{\"size\":40,\"length\":50}', 1, NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(33, 5, 413939, 'thread', 'Description', 'description', NULL, 2, 'Details on the reason(s) for creating the task.', '2022-07-20 14:18:29', '2022-07-20 14:18:29'),
(34, 6, 487665, 'state', 'State', 'state', '{\"prompt\":\"State of a ticket\"}', 1, NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(35, 6, 471073, 'memo', 'Description', 'description', '{\"rows\":\"2\",\"cols\":\"40\",\"html\":\"\",\"length\":\"100\"}', 3, NULL, '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_group`
--

CREATE TABLE `os_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(120) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_help_topic`
--

CREATE TABLE `os_help_topic` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `topic_pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sequence_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic` varchar(128) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_help_topic`
--

INSERT INTO `os_help_topic` (`topic_id`, `topic_pid`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 1, 'Consultas Generales', NULL, 'Preguntas generales', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(2, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 4, 'Reportar problema con aplicativo', NULL, 'Reportar errores de los aplicativos usados', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(5, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 3, 'Solicitud de equipo', NULL, 'Describe la solicitud del equipo, como y para que será la utilización', '2022-08-11 09:09:53', '2022-08-11 09:12:24'),
(6, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'Problemas con la computadora', NULL, 'Errores de equipo, falla del mismo', '2022-08-11 09:11:34', '2022-08-11 09:11:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_help_topic_form`
--

CREATE TABLE `os_help_topic_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_help_topic_form`
--

INSERT INTO `os_help_topic_form` (`id`, `topic_id`, `form_id`, `sort`, `extra`) VALUES
(1, 1, 2, 1, '{\"disable\":[]}'),
(2, 2, 2, 1, '{\"disable\":[]}'),
(3, 10, 2, 1, '{\"disable\":[]}'),
(4, 11, 2, 1, '{\"disable\":[]}'),
(5, 5, 2, 1, '{\"disable\":[]}'),
(6, 6, 2, 1, '{\"disable\":[]}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_list`
--

CREATE TABLE `os_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `configuration` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_list`
--

INSERT INTO `os_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `configuration`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', '{\"handler\":\"TicketStatusList\"}', 'Ticket statuses', '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_list_items`
--

CREATE TABLE `os_list_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `properties` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_lock`
--

CREATE TABLE `os_lock` (
  `lock_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_note`
--

CREATE TABLE `os_note` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_organization`
--

CREATE TABLE `os_organization` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_organization`
--

INSERT INTO `os_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 8, '', NULL, '2022-07-20 21:18:30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_organization__cdata`
--

CREATE TABLE `os_organization__cdata` (
  `org_id` int(11) UNSIGNED NOT NULL,
  `name` mediumtext,
  `address` mediumtext,
  `phone` mediumtext,
  `website` mediumtext,
  `notes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_plugin`
--

CREATE TABLE `os_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `installed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_queue`
--

CREATE TABLE `os_queue` (
  `id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `columns_id` int(11) UNSIGNED DEFAULT NULL,
  `sort_id` int(11) UNSIGNED DEFAULT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(60) DEFAULT NULL,
  `config` text,
  `filter` varchar(64) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `path` varchar(80) NOT NULL DEFAULT '/',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_queue`
--

INSERT INTO `os_queue` (`id`, `parent_id`, `columns_id`, `sort_id`, `flags`, `staff_id`, `sort`, `title`, `config`, `filter`, `root`, `path`, `created`, `updated`) VALUES
(1, 0, NULL, 1, 3, 0, 1, 'Open', '[[\"status__state\",\"includes\",{\"open\":\"Open\"}]]', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(2, 1, NULL, 4, 43, 0, 1, 'Open', '{\"criteria\":[[\"isanswered\",\"nset\",null]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(3, 1, NULL, 4, 43, 0, 2, 'Answered', '{\"criteria\":[[\"isanswered\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(4, 1, NULL, 4, 43, 0, 3, 'Overdue', '{\"criteria\":[[\"isoverdue\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(5, 0, NULL, 3, 3, 0, 3, 'My Tickets', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\",\"T\":\"One of my teams\"}],[\"status__state\",\"includes\",{\"open\":\"Open\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(6, 5, NULL, NULL, 43, 0, 1, 'Assigned to Me', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(7, 5, NULL, NULL, 43, 0, 2, 'Assigned to Teams', '{\"criteria\":[[\"assignee\",\"!includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(8, 0, NULL, 5, 3, 0, 4, 'Closed', '{\"criteria\":[[\"status__state\",\"includes\",{\"closed\":\"Closed\"}]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(9, 8, NULL, 5, 43, 0, 1, 'Today', '{\"criteria\":[[\"closed\",\"period\",\"td\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(10, 8, NULL, 5, 43, 0, 2, 'Yesterday', '{\"criteria\":[[\"closed\",\"period\",\"yd\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(11, 8, NULL, 5, 43, 0, 3, 'This Week', '{\"criteria\":[[\"closed\",\"period\",\"tw\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(12, 8, NULL, 5, 43, 0, 4, 'This Month', '{\"criteria\":[[\"closed\",\"period\",\"tm\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(13, 8, NULL, 6, 43, 0, 5, 'This Quarter', '{\"criteria\":[[\"closed\",\"period\",\"tq\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(14, 8, NULL, 7, 43, 0, 6, 'This Year', '{\"criteria\":[[\"closed\",\"period\",\"ty\"]],\"conditions\":[]}', NULL, 'T', '/', '2022-07-20 14:18:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_queue_column`
--

CREATE TABLE `os_queue_column` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) DEFAULT NULL,
  `filter` varchar(32) DEFAULT NULL,
  `truncate` varchar(16) DEFAULT NULL,
  `annotations` text,
  `conditions` text,
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_queue_column`
--

INSERT INTO `os_queue_column` (`id`, `flags`, `name`, `primary`, `secondary`, `filter`, `truncate`, `annotations`, `conditions`, `extra`) VALUES
(1, 0, 'Ticket #', 'number', NULL, 'link:ticketP', 'wrap', '[{\"c\":\"TicketSourceDecoration\",\"p\":\"b\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(2, 0, 'Date Created', 'created', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(3, 0, 'Subject', 'cdata__subject', NULL, 'link:ticket', 'ellipsis', '[{\"c\":\"TicketThreadCount\",\"p\":\">\"},{\"c\":\"ThreadAttachmentCount\",\"p\":\"a\"},{\"c\":\"OverdueFlagDecoration\",\"p\":\"<\"},{\"c\":\"LockDecoration\",\"p\":\"<\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(4, 0, 'User Name', 'user__name', NULL, NULL, 'wrap', '[{\"c\":\"ThreadCollaboratorCount\",\"p\":\">\"}]', '[]', NULL),
(5, 0, 'Priority', 'cdata__priority', NULL, NULL, 'wrap', '[]', '[]', NULL),
(6, 0, 'Status', 'status__id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(7, 0, 'Close Date', 'closed', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(8, 0, 'Assignee', 'assignee', NULL, NULL, 'wrap', '[]', '[]', NULL),
(9, 0, 'Due Date', 'duedate', 'est_duedate', 'date:human', 'wrap', '[]', '[]', NULL),
(10, 0, 'Last Updated', 'lastupdate', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(11, 0, 'Department', 'dept_id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(12, 0, 'Last Message', 'thread__lastmessage', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(13, 0, 'Last Response', 'thread__lastresponse', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(14, 0, 'Team', 'team_id', NULL, NULL, 'wrap', '[]', '[]', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_queue_columns`
--

CREATE TABLE `os_queue_columns` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `column_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `bits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `heading` varchar(64) DEFAULT NULL,
  `width` int(10) UNSIGNED NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_queue_columns`
--

INSERT INTO `os_queue_columns` (`queue_id`, `column_id`, `staff_id`, `bits`, `sort`, `heading`, `width`) VALUES
(1, 1, 0, 1, 1, 'Ticket', 100),
(1, 3, 0, 1, 3, 'Subject', 300),
(1, 4, 0, 1, 4, 'From', 185),
(1, 5, 0, 1, 5, 'Priority', 85),
(1, 8, 0, 1, 6, 'Assigned To', 160),
(1, 10, 0, 1, 2, 'Last Updated', 150),
(2, 1, 0, 1, 1, 'Ticket', 100),
(2, 3, 0, 1, 3, 'Subject', 300),
(2, 4, 0, 1, 4, 'From', 185),
(2, 5, 0, 1, 5, 'Priority', 85),
(2, 8, 0, 1, 6, 'Assigned To', 160),
(2, 10, 0, 1, 2, 'Last Updated', 150),
(3, 1, 0, 1, 1, 'Ticket', 100),
(3, 3, 0, 1, 3, 'Subject', 300),
(3, 4, 0, 1, 4, 'From', 185),
(3, 5, 0, 1, 5, 'Priority', 85),
(3, 8, 0, 1, 6, 'Assigned To', 160),
(3, 10, 0, 1, 2, 'Last Updated', 150),
(4, 1, 0, 1, 1, 'Ticket', 100),
(4, 3, 0, 1, 3, 'Subject', 300),
(4, 4, 0, 1, 4, 'From', 185),
(4, 5, 0, 1, 5, 'Priority', 85),
(4, 8, 0, 1, 6, 'Assigned To', 160),
(4, 9, 0, 1, 9, 'Due Date', 150),
(5, 1, 0, 1, 1, 'Ticket', 100),
(5, 3, 0, 1, 3, 'Subject', 300),
(5, 4, 0, 1, 4, 'From', 185),
(5, 5, 0, 1, 5, 'Priority', 85),
(5, 10, 0, 1, 2, 'Last Update', 150),
(5, 11, 0, 1, 6, 'Department', 160),
(6, 1, 0, 1, 1, 'Ticket', 100),
(6, 3, 0, 1, 3, 'Subject', 300),
(6, 4, 0, 1, 4, 'From', 185),
(6, 5, 0, 1, 5, 'Priority', 85),
(6, 10, 0, 1, 2, 'Last Update', 150),
(6, 11, 0, 1, 6, 'Department', 160),
(7, 1, 0, 1, 1, 'Ticket', 100),
(7, 3, 0, 1, 3, 'Subject', 300),
(7, 4, 0, 1, 4, 'From', 185),
(7, 5, 0, 1, 5, 'Priority', 85),
(7, 10, 0, 1, 2, 'Last Update', 150),
(7, 14, 0, 1, 6, 'Team', 160),
(8, 1, 0, 1, 1, 'Ticket', 100),
(8, 3, 0, 1, 3, 'Subject', 300),
(8, 4, 0, 1, 4, 'From', 185),
(8, 7, 0, 1, 2, 'Date Closed', 150),
(8, 8, 0, 1, 6, 'Closed By', 160),
(9, 1, 0, 1, 1, 'Ticket', 100),
(9, 3, 0, 1, 3, 'Subject', 300),
(9, 4, 0, 1, 4, 'From', 185),
(9, 7, 0, 1, 2, 'Date Closed', 150),
(9, 8, 0, 1, 6, 'Closed By', 160),
(10, 1, 0, 1, 1, 'Ticket', 100),
(10, 3, 0, 1, 3, 'Subject', 300),
(10, 4, 0, 1, 4, 'From', 185),
(10, 7, 0, 1, 2, 'Date Closed', 150),
(10, 8, 0, 1, 6, 'Closed By', 160),
(11, 1, 0, 1, 1, 'Ticket', 100),
(11, 3, 0, 1, 3, 'Subject', 300),
(11, 4, 0, 1, 4, 'From', 185),
(11, 7, 0, 1, 2, 'Date Closed', 150),
(11, 8, 0, 1, 6, 'Closed By', 160),
(12, 1, 0, 1, 1, 'Ticket', 100),
(12, 3, 0, 1, 3, 'Subject', 300),
(12, 4, 0, 1, 4, 'From', 185),
(12, 7, 0, 1, 2, 'Date Closed', 150),
(12, 8, 0, 1, 6, 'Closed By', 160),
(13, 1, 0, 1, 1, 'Ticket', 100),
(13, 3, 0, 1, 3, 'Subject', 300),
(13, 4, 0, 1, 4, 'From', 185),
(13, 7, 0, 1, 2, 'Date Closed', 150),
(13, 8, 0, 1, 6, 'Closed By', 160),
(14, 1, 0, 1, 1, 'Ticket', 100),
(14, 3, 0, 1, 3, 'Subject', 300),
(14, 4, 0, 1, 4, 'From', 185),
(14, 7, 0, 1, 2, 'Date Closed', 150),
(14, 8, 0, 1, 6, 'Closed By', 160);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_queue_config`
--

CREATE TABLE `os_queue_config` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `setting` text,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_queue_export`
--

CREATE TABLE `os_queue_export` (
  `id` int(11) UNSIGNED NOT NULL,
  `queue_id` int(11) UNSIGNED NOT NULL,
  `path` varchar(64) NOT NULL DEFAULT '',
  `heading` varchar(64) DEFAULT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_queue_sort`
--

CREATE TABLE `os_queue_sort` (
  `id` int(11) UNSIGNED NOT NULL,
  `root` varchar(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `columns` text,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_queue_sort`
--

INSERT INTO `os_queue_sort` (`id`, `root`, `name`, `columns`, `updated`) VALUES
(1, NULL, 'Priority + Most Recently Updated', '[\"-cdata__priority\",\"-lastupdate\"]', '2022-07-20 14:18:30'),
(2, NULL, 'Priority + Most Recently Created', '[\"-cdata__priority\",\"-created\"]', '2022-07-20 14:18:30'),
(3, NULL, 'Priority + Due Date', '[\"-cdata__priority\",\"-est_duedate\"]', '2022-07-20 14:18:30'),
(4, NULL, 'Due Date', '[\"-est_duedate\"]', '2022-07-20 14:18:30'),
(5, NULL, 'Closed Date', '[\"-closed\"]', '2022-07-20 14:18:30'),
(6, NULL, 'Create Date', '[\"-created\"]', '2022-07-20 14:18:30'),
(7, NULL, 'Update Date', '[\"-lastupdate\"]', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_queue_sorts`
--

CREATE TABLE `os_queue_sorts` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `sort_id` int(11) UNSIGNED NOT NULL,
  `bits` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_queue_sorts`
--

INSERT INTO `os_queue_sorts` (`queue_id`, `sort_id`, `bits`, `sort`) VALUES
(1, 1, 0, 0),
(1, 2, 0, 0),
(1, 3, 0, 0),
(1, 4, 0, 0),
(1, 6, 0, 0),
(1, 7, 0, 0),
(5, 1, 0, 0),
(5, 2, 0, 0),
(5, 3, 0, 0),
(5, 4, 0, 0),
(5, 6, 0, 0),
(5, 7, 0, 0),
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(7, 1, 0, 0),
(7, 2, 0, 0),
(7, 3, 0, 0),
(7, 4, 0, 0),
(7, 6, 0, 0),
(7, 7, 0, 0),
(8, 1, 0, 0),
(8, 2, 0, 0),
(8, 3, 0, 0),
(8, 4, 0, 0),
(8, 5, 0, 0),
(8, 6, 0, 0),
(8, 7, 0, 0),
(9, 1, 0, 0),
(9, 2, 0, 0),
(9, 3, 0, 0),
(9, 4, 0, 0),
(9, 5, 0, 0),
(9, 6, 0, 0),
(9, 7, 0, 0),
(10, 1, 0, 0),
(10, 2, 0, 0),
(10, 3, 0, 0),
(10, 4, 0, 0),
(10, 5, 0, 0),
(10, 6, 0, 0),
(10, 7, 0, 0),
(11, 1, 0, 0),
(11, 2, 0, 0),
(11, 3, 0, 0),
(11, 4, 0, 0),
(11, 5, 0, 0),
(11, 6, 0, 0),
(11, 7, 0, 0),
(12, 1, 0, 0),
(12, 2, 0, 0),
(12, 3, 0, 0),
(12, 4, 0, 0),
(12, 5, 0, 0),
(12, 6, 0, 0),
(12, 7, 0, 0),
(13, 1, 0, 0),
(13, 2, 0, 0),
(13, 3, 0, 0),
(13, 4, 0, 0),
(13, 5, 0, 0),
(13, 6, 0, 0),
(13, 7, 0, 0),
(14, 1, 0, 0),
(14, 2, 0, 0),
(14, 3, 0, 0),
(14, 4, 0, 0),
(14, 5, 0, 0),
(14, 6, 0, 0),
(14, 7, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_role`
--

CREATE TABLE `os_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(64) DEFAULT NULL,
  `permissions` text,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_role`
--

INSERT INTO `os_role` (`id`, `flags`, `name`, `permissions`, `notes`, `created`, `updated`) VALUES
(1, 1, 'All Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"thread.edit\":1,\"ticket.link\":1,\"ticket.markanswered\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.delete\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with unlimited access', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(2, 1, 'Expanded Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.edit\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with expanded access', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(3, 1, 'Limited Access', '{\"ticket.assign\":1,\"ticket.create\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.reply\":1,\"task.transfer\":1}', 'Role with limited access', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(4, 1, 'View only', NULL, 'Simple role with no permissions', '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_schedule`
--

CREATE TABLE `os_schedule` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_schedule`
--

INSERT INTO `os_schedule` (`id`, `flags`, `name`, `timezone`, `description`, `created`, `updated`) VALUES
(1, 1, 'Monday - Friday 8am - 5pm with U.S. Holidays', NULL, '', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(2, 1, '24/7', NULL, '', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(3, 1, '24/5', NULL, '', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(4, 0, 'U.S. Holidays', NULL, '', '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_schedule_entry`
--

CREATE TABLE `os_schedule_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `repeats` varchar(16) NOT NULL DEFAULT 'never',
  `starts_on` date DEFAULT NULL,
  `starts_at` time DEFAULT NULL,
  `ends_on` date DEFAULT NULL,
  `ends_at` time DEFAULT NULL,
  `stops_on` datetime DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `week` tinyint(4) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_schedule_entry`
--

INSERT INTO `os_schedule_entry` (`id`, `schedule_id`, `flags`, `sort`, `name`, `repeats`, `starts_on`, `starts_at`, `ends_on`, `ends_at`, `stops_on`, `day`, `week`, `month`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'Monday', 'weekly', '2019-01-07', '08:00:00', '2019-01-07', '17:00:00', NULL, 1, NULL, NULL, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(2, 1, 0, 0, 'Tuesday', 'weekly', '2019-01-08', '08:00:00', '2019-01-08', '17:00:00', NULL, 2, NULL, NULL, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(3, 1, 0, 0, 'Wednesday', 'weekly', '2019-01-09', '08:00:00', '2019-01-09', '17:00:00', NULL, 3, NULL, NULL, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(4, 1, 0, 0, 'Thursday', 'weekly', '2019-01-10', '08:00:00', '2019-01-10', '17:00:00', NULL, 4, NULL, NULL, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(5, 1, 0, 0, 'Friday', 'weekly', '2019-01-11', '08:00:00', '2019-01-11', '17:00:00', NULL, 5, NULL, NULL, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(6, 2, 0, 0, 'Daily', 'daily', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(7, 3, 0, 0, 'Weekdays', 'weekdays', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(8, 4, 0, 0, 'New Year\'s Day', 'yearly', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, 1, NULL, 1, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(9, 4, 0, 0, 'MLK Day', 'yearly', '2019-01-21', '00:00:00', '2019-01-21', '23:59:59', NULL, 1, 3, 1, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(10, 4, 0, 0, 'Memorial Day', 'yearly', '2019-05-27', '00:00:00', '2019-05-27', '23:59:59', NULL, 1, -1, 5, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(11, 4, 0, 0, 'Independence Day (4th of July)', 'yearly', '2019-07-04', '00:00:00', '2019-07-04', '23:59:59', NULL, 4, NULL, 7, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(12, 4, 0, 0, 'Labor Day', 'yearly', '2019-09-02', '00:00:00', '2019-09-02', '23:59:59', NULL, 1, 1, 9, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(13, 4, 0, 0, 'Indigenous Peoples\' Day (Whodat Columbus)', 'yearly', '2019-10-14', '00:00:00', '2019-10-14', '23:59:59', NULL, 1, 2, 10, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(14, 4, 0, 0, 'Veterans Day', 'yearly', '2019-11-11', '00:00:00', '2019-11-11', '23:59:59', NULL, 11, NULL, 11, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(15, 4, 0, 0, 'Thanksgiving Day', 'yearly', '2019-11-28', '00:00:00', '2019-11-28', '23:59:59', NULL, 4, 4, 11, '0000-00-00 00:00:00', '2022-07-20 14:18:30'),
(16, 4, 0, 0, 'Christmas Day', 'yearly', '2019-11-25', '00:00:00', '2019-11-25', '23:59:59', NULL, 25, NULL, 12, '0000-00-00 00:00:00', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_sequence`
--

CREATE TABLE `os_sequence` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `flags` int(10) UNSIGNED DEFAULT NULL,
  `next` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `increment` int(11) DEFAULT '1',
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_sequence`
--

INSERT INTO `os_sequence` (`id`, `name`, `flags`, `next`, `increment`, `padding`, `updated`) VALUES
(1, 'Numeric', NULL, 8, 1, '0', '2022-08-11 10:03:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_session`
--

CREATE TABLE `os_session` (
  `session_id` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `os_session`
--

INSERT INTO `os_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('0470183169101bedf8c28e6fc5b809b7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236643266366133343534396139333332396165633062313164616662386365346230386533623564223b733a343a2274696d65223b693a313636303232373436313b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-08-12 07:17:41', NULL, '0', '181.210.15.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36'),
('0644398b723ca98b7158071e340d8005', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235313161626163313234343931306639343337346233383639383738643937383661333035306235223b733a343a2274696d65223b693a313636303137303936343b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2231393463653764303835353865323862393161626631633239363433656330323a313636303137303936343a6131343262383364613738343166663166666439363264393134346562396531223b7d4b415055547c693a313636303137313032343b, '2022-08-11 15:36:04', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('095c706919b84b2d2ebfafe82e62d7b6', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235363965316638323739656265613663386265393635633739343332386665313734666362376638223b733a343a2274696d65223b693a313636303233393034393b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33323a222f6f732d5469636b65742f7363702f656d61696c73657474696e67732e706870223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31313a226c6f63616c3a61646d696e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236633561396164333532633231343361646662646561616134346539386338393a313636303233393034393a6131343262383364613738343166663166666439363264393134346562396531223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e3044366753374154304c6f744f5262706376774f41766d7a3645444365423033223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a31303b733a323a227132223b643a31303b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a323b733a323a227135223b643a323b733a333a22713131223b643a313b733a323a227138223b643a313b733a333a22713132223b643a313b733a333a22713133223b643a313b733a333a22713134223b643a313b7d733a343a2274696d65223b693a313636303233393034393b7d7d6c61737463726f6e63616c6c7c693a313636303233393034393b, '2022-08-12 10:30:49', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('165cf7884ad8ba04b03e257ca6e6d4f5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235363965316638323739656265613663386265393635633739343332386665313734666362376638223b733a343a2274696d65223b693a313636303233393034393b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33323a222f6f732d5469636b65742f7363702f656d61696c73657474696e67732e706870223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236633561396164333532633231343361646662646561616134346539386338393a313636303233393034393a6131343262383364613738343166663166666439363264393134346562396531223b7d4b415055547c693a313636303233393130393b, '2022-08-12 10:30:49', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('221d82860b488409484e788e61850d4b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235353038356164303862353432313635323639336634396364313932383738366437333734666463223b733a343a2274696d65223b693a313636303137333831303b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2261656536356662303337643430333836343365393332393062336565303266393a313636303137333831303a6131343262383364613738343166663166666439363264393134346562396531223b7d4b415055547c693a313636303137333837313b, '2022-08-11 16:23:31', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('264dd8cb51635507ba5b72e528963075', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237383333326630313765333665366131363335366564643732313461656434383966336133376533223b733a343a2274696d65223b693a313636353639363031343b7d, '2022-10-14 14:20:14', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36'),
('2b5b84eb459a209d14a24d329e0b877f', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231373461366164633233373364373532383637633162336436316134633931313536633038343835223b733a343a2274696d65223b693a313636303331333034383b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-08-13 07:04:08', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('3b656f84dc3f4a73f8940fc3ac49e4ec', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236643136623039616335656138333831656538303461616231303862323831363463363636373463223b733a343a2274696d65223b693a313636303134333539313b7d, '2022-08-11 07:59:51', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('68e8019187ecf8a4b86b4b46a007b948', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262383665333763623035623535623238333864356439383936646431326366623830376163636633223b733a343a2274696d65223b693a313636353538393539393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-10-13 08:46:39', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36'),
('6b63c32a5a6f2663cba69c7f160ce0dc', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237356639663264366434373639623637336464613131646135313961386230393339666633303033223b733a343a2274696d65223b693a313636303236303035323b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-08-12 16:20:52', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('760d849728d375a4aee69b09cbf829e3', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238653961353264613831663165353263356433376237333535393137313861396630646230363836223b733a343a2274696d65223b693a313636303233353531363b7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a313b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2263316231666565653438616533643436383535653063666532383334366333633a313636303233353531363a6131343262383364613738343166663166666439363264393134346562396531223b7d4b415055547c693a313636303233353537363b, '2022-08-12 09:31:56', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('8c37fb623ef8c13c64cd8e3720460e4c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233313465323764643833653464623561373537626435633764613166643261393536626635383532223b733a343a2274696d65223b693a313636303137303637363b7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a323b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236343839656632613866383539323665363963353239663338373036616338623a313636303137303637363a6131343262383364613738343166663166666439363264393134346562396531223b7d4b415055547c693a313636303137303733363b, '2022-08-11 15:31:16', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('8d8c56fc507a6f7f99a6ffb1ea709ed3', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233356562613637646537303937666630636331663230393235373139303131356463376165633761223b733a343a2274696d65223b693a313636363330343235373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32343a222f6f732d5469636b65742f7363702f696e6465782e706870223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-10-21 15:17:37', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36'),
('a87793dbd377f3aeb3a151e2ec462364', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265333130373766323036343065656563333637623633643731343065343564373831353262306235223b733a343a2274696d65223b693a313636313831353333343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-08-30 16:22:14', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('ac2b485f013368b3869b49f918a534bc', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231386531663931323765653131313930656432373239343030656530303961363536646635323533223b733a343a2274696d65223b693a313636303233373331363b7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31313a226c6f63616c3a61646d696e223b733a333a22326661223b4e3b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2231663562393561393563666261313630646638653930653232643561623836663a313636303233373137303a6131343262383364613738343166663166666439363264393134346562396531223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30372d32302031343a31383a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e3044366753374154304c6f744f5262706376774f41766d7a3645444365423033223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a383b733a323a227132223b643a383b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a323b733a323a227135223b643a323b733a333a22713131223b643a313b733a323a227138223b643a313b733a333a22713132223b643a313b733a333a22713133223b643a313b733a333a22713134223b643a313b7d733a343a2274696d65223b693a313636303233363631303b7d7d6c61737463726f6e63616c6c7c693a313636303233363631303b, '2022-08-12 10:01:56', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('add576da89a29d7d824ae0ce7c697b5d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238643563383933356538303961383931623833656364373961326266326335623462373431306433223b733a343a2274696d65223b693a313636303137303538333b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2022-08-11 15:29:43', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('bde79e68245dc4906614b605ccf148b5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235323736316138623334646231343966393166643832373564666663663165323766666462393535223b733a343a2274696d65223b693a313636303137343634383b7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31313a226c6f63616c3a61646d696e223b733a333a22326661223b4e3b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2265663761666463633361393361623966333561393439636431336462366162633a313636303137343634383a6131343262383364613738343166663166666439363264393134346562396531223b7d3a3a513a547c693a323b736f72747c613a323a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032322d30372d32302031343a31383a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d693a323b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a313a7b733a31313a226573745f64756564617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a343b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a383a224475652044617465223b733a373a22636f6c756d6e73223b733a31363a225b222d6573745f64756564617465225d223b733a373a2275706461746564223b733a31393a22323032322d30372d32302031343a31383a3330223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e3044366753374154304c6f744f5262706376774f41766d7a3645444365423033223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a353b733a323a227132223b643a353b733a323a227136223b643a323b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a323b733a323a227135223b643a323b733a333a22713131223b643a313b733a323a227138223b643a313b733a333a22713132223b643a313b733a333a22713133223b643a313b733a333a22713134223b643a313b7d733a343a2274696d65223b693a313636303137343632363b7d7d6c61737463726f6e63616c6c7c693a313636303137343532313b, '2022-08-11 16:37:28', NULL, '1', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('c070cefb2e6a0b332107bbd8252e6fde', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232323531313034663935363663393036333037343661326537623031616265313737383137306663223b733a343a2274696d65223b693a313636303137303435343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2263366464396663366563393364666132643534633935656163373066366436643a313636303137303435343a6131343262383364613738343166663166666439363264393134346562396531223b7d4b415055547c693a313636303137303531343b, '2022-08-11 15:27:34', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('c3b40eeedbb5415c8afc50b350732b7e', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264323830616662663962336361613737316262343538353262656430393761323734363236313630223b733a343a2274696d65223b693a313636303233333438353b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a313a7b733a373a22737472696b6573223b693a313b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2231306133333462333463383130663265346139633336323533373638323533333a313636303233333438353a6131343262383364613738343166663166666439363264393134346562396531223b7d3a666f726d2d646174617c613a323a7b733a31343a226132623239613631313162333133223b733a303a22223b733a31343a223832383930626536646134613635223b733a303a22223b7d4b415055547c693a313636303233333534353b, '2022-08-12 08:58:05', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('fb562cc6325b2890c9585a61a43698c6', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235323736316138623334646231343966393166643832373564666663663165323766666462393535223b733a343a2274696d65223b693a313636303137333933363b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31343a22416d65726963612f44656e766572223b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f732d5469636b65742f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2233323234333434386364396562396239636138666331383834653662343530663a313636303137333933363a6131343262383364613738343166663166666439363264393134346562396531223b7d4b415055547c693a313636303137333939363b, '2022-08-11 16:25:36', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'),
('fdec6d30f5b362cb5e6ac861c69839f8', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238303333663464396638393964313865336433663839626664346238393335666464316538396439223b733a343a2274696d65223b693a313636303137303430393b7d, '2022-08-11 15:26:49', NULL, '0', '143.255.35.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.81 Safari/537.36 Edg/104.0.1293.47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_sla`
--

CREATE TABLE `os_sla` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `grace_period` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_sla`
--

INSERT INTO `os_sla` (`id`, `schedule_id`, `flags`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 3, 18, 'Default SLA', NULL, '2022-07-20 14:18:29', '2022-07-20 14:18:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_staff`
--

CREATE TABLE `os_staff` (
  `staff_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `max_page_size` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `extra` text,
  `permissions` text,
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_staff`
--

INSERT INTO `os_staff` (`staff_id`, `dept_id`, `role_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `lang`, `timezone`, `locale`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `extra`, `permissions`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 'admin', 'Site', 'Owner', '$2a$08$MdePZTSchVcWkD79BuToXO4IHQjni8PYTEL/zgE2OruNVpu.ZHxe2', NULL, 'informacion@grupolitoral.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '{\"browser_lang\":\"es_ES\",\"def_assn_role\":true}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"emails.banlist\":1,\"visibility.departments\":1}', '2022-07-20 14:18:30', '2022-08-11 10:30:49', '2022-07-20 14:18:30', '2022-08-11 10:30:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_staff_dept_access`
--

CREATE TABLE `os_staff_dept_access` (
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_staff_dept_access`
--

INSERT INTO `os_staff_dept_access` (`staff_id`, `dept_id`, `role_id`, `flags`) VALUES
(1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_syslog`
--

CREATE TABLE `os_syslog` (
  `log_id` int(11) UNSIGNED NOT NULL,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_syslog`
--

INSERT INTO `os_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '173.201.252.164', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(2, 'Warning', 'Intento de inicio de sesión de un agente (admin)', 'Nombre de usuario: admin IP: 143.255.35.203 Hora: Aug 5, 2022, 9:59 pm UTC Intentos: 3', '', '143.255.35.203', '2022-08-05 14:59:15', '2022-08-05 14:59:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_task`
--

CREATE TABLE `os_task` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `object_type` char(1) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_task__cdata`
--

CREATE TABLE `os_task__cdata` (
  `task_id` int(11) UNSIGNED NOT NULL,
  `title` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_team`
--

CREATE TABLE `os_team` (
  `team_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_team`
--

INSERT INTO `os_team` (`team_id`, `lead_id`, `flags`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2022-07-20 14:18:30', '2022-07-20 14:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_team_member`
--

CREATE TABLE `os_team_member` (
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_thread`
--

CREATE TABLE `os_thread` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `extra` text,
  `lastresponse` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_thread`
--

INSERT INTO `os_thread` (`id`, `object_id`, `object_type`, `extra`, `lastresponse`, `lastmessage`, `created`) VALUES
(3, 3, 'T', NULL, NULL, '2022-08-05 10:21:25', '2022-08-05 10:21:24'),
(4, 4, 'T', NULL, NULL, '2022-08-08 10:04:13', '2022-08-08 10:04:12'),
(5, 5, 'T', NULL, NULL, '2022-08-08 10:06:01', '2022-08-08 10:06:00'),
(6, 6, 'T', NULL, NULL, '2022-08-10 15:28:49', '2022-08-10 15:28:49'),
(7, 7, 'T', NULL, NULL, '2022-08-10 15:55:35', '2022-08-10 15:55:35'),
(8, 8, 'T', NULL, NULL, '2022-08-10 16:25:19', '2022-08-10 16:25:19'),
(9, 9, 'T', NULL, NULL, '2022-08-11 09:13:33', '2022-08-11 09:13:33'),
(10, 10, 'T', NULL, NULL, '2022-08-11 09:25:10', '2022-08-11 09:25:10'),
(11, 11, 'T', NULL, NULL, '2022-08-11 09:31:26', '2022-08-11 09:31:25'),
(12, 12, 'T', NULL, NULL, '2022-08-11 10:01:56', '2022-08-11 10:01:56'),
(13, 13, 'T', NULL, NULL, '2022-08-11 10:03:10', '2022-08-11 10:03:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_thread_collaborator`
--

CREATE TABLE `os_thread_collaborator` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_thread_entry`
--

CREATE TABLE `os_thread_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `poster` varchar(128) NOT NULL DEFAULT '',
  `editor` int(10) UNSIGNED DEFAULT NULL,
  `editor_type` char(1) DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `extra` text,
  `recipients` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_thread_entry`
--

INSERT INTO `os_thread_entry` (`id`, `pid`, `thread_id`, `staff_id`, `user_id`, `type`, `flags`, `poster`, `editor`, `editor_type`, `source`, `title`, `body`, `format`, `ip_address`, `extra`, `recipients`, `created`, `updated`) VALUES
(3, 0, 3, 0, 3, 'M', 65, 'Jorge', NULL, NULL, '', NULL, '<p>Test1</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-05 10:21:25', '0000-00-00 00:00:00'),
(4, 0, 4, 0, 4, 'M', 65, 'sdfdf', NULL, NULL, '', NULL, '<p>df</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-08 10:04:12', '0000-00-00 00:00:00'),
(5, 0, 5, 0, 5, 'M', 65, 'dfdf', NULL, NULL, '', NULL, '<p>dfdf</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-08 10:06:01', '0000-00-00 00:00:00'),
(6, 0, 5, 1, 0, 'N', 64, 'Site Owner', NULL, NULL, '', 'Estado Modificado', '<p>listo</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-08 10:10:02', '0000-00-00 00:00:00'),
(7, 0, 6, 0, 6, 'M', 65, 'Omar Mejia', NULL, NULL, '', NULL, '<p>sistema de siplan no me abre</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-10 15:28:49', '0000-00-00 00:00:00'),
(8, 0, 7, 0, 7, 'M', 65, 'jdfss', NULL, NULL, '', NULL, '<p>sdsd</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-10 15:55:35', '0000-00-00 00:00:00'),
(9, 0, 8, 0, 8, 'M', 65, 'dsd', NULL, NULL, '', NULL, '<p>dfdf</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-10 16:25:19', '0000-00-00 00:00:00'),
(10, 0, 9, 0, 9, 'M', 65, 'dfvvs', NULL, NULL, '', NULL, '<p>wwe</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-11 09:13:33', '0000-00-00 00:00:00'),
(11, 0, 10, 0, 9, 'M', 65, 'dfvvs', NULL, NULL, '', NULL, '<figure><img src=\"cid:bnojnrq6fgg_ko6vdrckin8wlfqxqrnq\" data-image=\"bNojnrq6FGG_kO6VDrcKIn8WLFQxQRNQ\" alt=\"image\" /></figure>', 'html', '143.255.35.203', NULL, NULL, '2022-08-11 09:25:10', '0000-00-00 00:00:00'),
(12, 0, 11, 0, 10, 'M', 65, 'sdsdsds', NULL, NULL, '', NULL, '<figure><img src=\"cid:iebhtff65cqomkt-u8tmcoisotbebvuy\" data-image=\"IEbHtFf65cqomkt-u8TmCoISOtBEbvUY\" alt=\"image\" /></figure> <p>serdsefwew</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-11 09:31:26', '0000-00-00 00:00:00'),
(13, 0, 12, 0, 11, 'M', 65, 'jorge', NULL, NULL, '', NULL, '<p>wewewe</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-11 10:01:56', '0000-00-00 00:00:00'),
(14, 0, 13, 0, 12, 'M', 65, 'jorge', NULL, NULL, '', NULL, '<p>dfdf</p>', 'html', '143.255.35.203', NULL, NULL, '2022-08-11 10:03:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_thread_entry_email`
--

CREATE TABLE `os_thread_entry_email` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED DEFAULT NULL,
  `mid` varchar(255) NOT NULL,
  `headers` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_thread_entry_merge`
--

CREATE TABLE `os_thread_entry_merge` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_thread_event`
--

CREATE TABLE `os_thread_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_type` char(1) NOT NULL DEFAULT '',
  `event_id` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `team_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `data` varchar(1024) DEFAULT NULL COMMENT 'Encoded differences',
  `username` varchar(128) NOT NULL DEFAULT 'SYSTEM',
  `uid` int(11) UNSIGNED DEFAULT NULL,
  `uid_type` char(1) NOT NULL DEFAULT 'S',
  `annulled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_thread_event`
--

INSERT INTO `os_thread_event` (`id`, `thread_id`, `thread_type`, `event_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `data`, `username`, `uid`, `uid_type`, `annulled`, `timestamp`) VALUES
(1, 0, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 1, 'U', 0, '2022-07-20 14:18:30'),
(2, 0, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 2, 'U', 0, '2022-07-20 15:02:06'),
(3, 0, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-22 14:51:32'),
(4, 0, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2022-07-22 14:51:32'),
(5, 3, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 3, 'U', 0, '2022-08-05 10:21:24'),
(6, 4, 'T', 1, 0, 0, 1, 2, NULL, 'SYSTEM', 4, 'U', 0, '2022-08-08 10:04:12'),
(7, 5, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 5, 'U', 0, '2022-08-08 10:06:01'),
(8, 5, 'T', 2, 1, 0, 1, 1, '{\"status\":[2,\"Resolved\"]}', 'admin', 1, 'S', 0, '2022-08-08 10:10:02'),
(9, 1, 'T', 14, 1, 0, 1, 1, NULL, 'admin', 1, 'S', 0, '2022-08-08 10:10:24'),
(10, 2, 'T', 14, 1, 0, 1, 1, NULL, 'admin', 1, 'S', 0, '2022-08-08 10:10:24'),
(11, 3, 'T', 4, 1, 0, 1, 1, '{\"claim\":true}', 'admin', 1, 'S', 0, '2022-08-08 10:10:44'),
(12, 4, 'T', 4, 1, 0, 1, 2, '{\"claim\":true}', 'admin', 1, 'S', 0, '2022-08-08 10:11:01'),
(13, 3, 'T', 8, 1, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2022-08-09 16:04:43'),
(14, 4, 'T', 8, 1, 0, 1, 2, NULL, 'SYSTEM', NULL, 'S', 0, '2022-08-10 15:27:35'),
(15, 6, 'T', 1, 0, 0, 1, 2, NULL, 'SYSTEM', 6, 'U', 0, '2022-08-10 15:28:49'),
(16, 7, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 7, 'U', 0, '2022-08-10 15:55:35'),
(17, 8, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 8, 'U', 0, '2022-08-10 16:25:19'),
(18, 9, 'T', 1, 0, 0, 1, 5, NULL, 'SYSTEM', 9, 'U', 0, '2022-08-11 09:13:33'),
(19, 10, 'T', 1, 0, 0, 1, 5, NULL, 'SYSTEM', 9, 'U', 0, '2022-08-11 09:25:10'),
(20, 11, 'T', 1, 0, 0, 1, 5, NULL, 'SYSTEM', 10, 'U', 0, '2022-08-11 09:31:26'),
(21, 11, 'T', 6, 1, 0, 3, 5, '{\"dept\":\"Maintenance\"}', 'admin', 1, 'S', 0, '2022-08-11 09:32:28'),
(22, 12, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 11, 'U', 0, '2022-08-11 10:01:56'),
(23, 13, 'T', 1, 0, 0, 1, 5, NULL, 'SYSTEM', 12, 'U', 0, '2022-08-11 10:03:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_thread_referral`
--

CREATE TABLE `os_thread_referral` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_thread_referral`
--

INSERT INTO `os_thread_referral` (`id`, `thread_id`, `object_id`, `object_type`, `created`) VALUES
(1, 5, 1, 'S', '2022-08-08 10:10:02'),
(2, 11, 1, 'D', '2022-08-11 09:32:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_ticket`
--

CREATE TABLE `os_ticket` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `ticket_pid` int(11) UNSIGNED DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `source_extra` varchar(40) DEFAULT NULL,
  `isoverdue` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `est_duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_ticket`
--

INSERT INTO `os_ticket` (`ticket_id`, `ticket_pid`, `number`, `user_id`, `user_email_id`, `status_id`, `dept_id`, `sla_id`, `topic_id`, `staff_id`, `team_id`, `email_id`, `lock_id`, `flags`, `sort`, `ip_address`, `source`, `source_extra`, `isoverdue`, `isanswered`, `duedate`, `est_duedate`, `reopened`, `closed`, `lastupdate`, `created`, `updated`) VALUES
(3, NULL, '391057', 3, 0, 1, 1, 1, 1, 1, 0, 0, 10, 0, 0, '143.255.35.203', 'Web', NULL, 1, 0, NULL, '2022-08-09 10:21:24', NULL, NULL, '2022-08-05 10:21:25', '2022-08-05 10:21:24', '2022-08-09 16:04:43'),
(4, NULL, '197684', 4, 0, 1, 1, 1, 2, 1, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 1, 0, NULL, '2022-08-10 10:04:12', NULL, NULL, '2022-08-08 10:04:13', '2022-08-08 10:04:12', '2022-08-10 15:27:35'),
(5, NULL, '566657', 5, 0, 2, 1, 1, 1, 1, 0, 0, 9, 0, 0, '143.255.35.203', 'Web', NULL, 0, 0, NULL, '2022-08-10 10:06:00', NULL, '2022-08-08 10:10:02', '2022-08-08 10:10:02', '2022-08-08 10:06:00', '2022-08-08 10:10:02'),
(6, NULL, '996388', 6, 0, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 0, 0, NULL, '2022-08-12 15:28:49', NULL, NULL, '2022-08-10 15:28:49', '2022-08-10 15:28:49', '2022-08-10 15:28:49'),
(7, NULL, '1', 7, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 0, 0, NULL, '2022-08-12 15:55:35', NULL, NULL, '2022-08-10 15:55:35', '2022-08-10 15:55:35', '2022-08-10 15:55:35'),
(8, NULL, '2', 8, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 0, 0, NULL, '2022-08-12 16:25:19', NULL, NULL, '2022-08-10 16:25:19', '2022-08-10 16:25:19', '2022-08-10 16:25:19'),
(9, NULL, '3', 9, 0, 1, 1, 1, 5, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 0, 0, NULL, '2022-08-15 09:13:33', NULL, NULL, '2022-08-11 09:13:33', '2022-08-11 09:13:33', '2022-08-11 09:13:33'),
(10, NULL, '4', 9, 0, 1, 1, 1, 5, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 0, 0, NULL, '2022-08-15 09:25:10', NULL, NULL, '2022-08-11 09:25:10', '2022-08-11 09:25:10', '2022-08-11 09:25:10'),
(11, NULL, '5', 10, 0, 1, 3, 1, 5, 0, 0, 0, 13, 0, 0, '143.255.35.203', 'Web', NULL, 0, 0, NULL, '2022-08-15 09:31:25', NULL, NULL, '2022-08-11 09:31:26', '2022-08-11 09:31:25', '2022-08-11 09:36:23'),
(12, NULL, '6', 11, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 0, 0, NULL, '2022-08-15 10:01:56', NULL, NULL, '2022-08-11 10:01:56', '2022-08-11 10:01:56', '2022-08-11 10:01:56'),
(13, NULL, '7', 12, 0, 1, 1, 1, 5, 0, 0, 0, 0, 0, 0, '143.255.35.203', 'Web', NULL, 0, 0, NULL, '2022-08-15 10:03:10', NULL, NULL, '2022-08-11 10:03:10', '2022-08-11 10:03:10', '2022-08-11 10:03:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_ticket_priority`
--

CREATE TABLE `os_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_ticket_priority`
--

INSERT INTO `os_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_ticket_status`
--

CREATE TABLE `os_ticket_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_ticket_status`
--

INSERT INTO `os_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{\"description\":\"Open tickets.\"}', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}', '2022-07-20 14:18:30', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}', '2022-07-20 14:18:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_ticket__cdata`
--

CREATE TABLE `os_ticket__cdata` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `subject` mediumtext,
  `priority` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_ticket__cdata`
--

INSERT INTO `os_ticket__cdata` (`ticket_id`, `subject`, `priority`) VALUES
(3, 'TEST', '2'),
(4, 'df', '1'),
(5, 'dfd', '2'),
(6, 'Falla en sistema SIPLAN', '1'),
(7, 'sdsd', '2'),
(8, 'dfd', '2'),
(9, 'dfdfd', '2'),
(10, 'fgf', '2'),
(11, 'fgfggf', '2'),
(12, 'wew', '2'),
(13, 'fdf', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_translation`
--

CREATE TABLE `os_translation` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_hash` char(16) CHARACTER SET ascii DEFAULT NULL,
  `type` enum('phrase','article','override') DEFAULT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `revision` int(11) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `source_text` text,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_user`
--

CREATE TABLE `os_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_user`
--

INSERT INTO `os_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(1, 1, 1, 0, 'osTicket Support', '2022-07-20 14:18:30', '2022-07-20 14:18:30'),
(2, 0, 2, 0, 'hjhj', '2022-07-20 15:02:06', '2022-07-20 15:02:06'),
(3, 0, 3, 0, 'Jorge', '2022-08-05 10:21:24', '2022-08-05 10:21:24'),
(4, 0, 4, 0, 'sdfdf', '2022-08-08 10:04:12', '2022-08-08 10:04:12'),
(5, 0, 5, 0, 'dfdf', '2022-08-08 10:06:00', '2022-08-08 10:06:00'),
(6, 0, 6, 0, 'Omar Mejia', '2022-08-10 15:28:49', '2022-08-10 15:28:49'),
(7, 0, 7, 0, 'jdfss', '2022-08-10 15:54:01', '2022-08-10 15:54:01'),
(8, 0, 8, 0, 'dsd', '2022-08-10 16:25:19', '2022-08-10 16:25:19'),
(9, 0, 9, 0, 'dfvvs', '2022-08-11 09:13:33', '2022-08-11 09:13:33'),
(10, 0, 10, 0, 'sdsdsds', '2022-08-11 09:31:25', '2022-08-11 09:31:25'),
(11, 0, 11, 0, 'jorge', '2022-08-11 10:01:56', '2022-08-11 10:01:56'),
(12, 0, 12, 0, 'jorge', '2022-08-11 10:03:10', '2022-08-11 10:03:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_user_account`
--

CREATE TABLE `os_user_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `timezone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `extra` text,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_user_email`
--

CREATE TABLE `os_user_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_user_email`
--

INSERT INTO `os_user_email` (`id`, `user_id`, `flags`, `address`) VALUES
(1, 1, 0, 'support@osticket.com'),
(2, 2, 0, 'hgjh@gmail.com'),
(3, 3, 0, 'jorge1giron18@gmail.com'),
(4, 4, 0, 'jpaz@gmail.com'),
(5, 5, 0, 'gfg@gmail.com'),
(6, 6, 0, 'omejia@grupolitoral.com'),
(7, 7, 0, 'jorge@gmail.com'),
(8, 8, 0, 'j@gfgfg.com'),
(9, 9, 0, 'jdos@gmail.com'),
(10, 10, 0, 'sd@gmail.com'),
(11, 11, 0, 'jpaz@grupolitoral.com'),
(12, 12, 0, 'informacion@grupolitoral.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os_user__cdata`
--

CREATE TABLE `os_user__cdata` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `email` mediumtext,
  `name` mediumtext,
  `phone` mediumtext,
  `notes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os_user__cdata`
--

INSERT INTO `os_user__cdata` (`user_id`, `email`, `name`, `phone`, `notes`) VALUES
(2, NULL, NULL, '', ''),
(3, NULL, NULL, NULL, ''),
(4, NULL, NULL, NULL, ''),
(5, NULL, NULL, NULL, ''),
(6, NULL, NULL, NULL, ''),
(7, NULL, NULL, NULL, ''),
(8, NULL, NULL, NULL, ''),
(9, NULL, NULL, NULL, ''),
(10, NULL, NULL, NULL, ''),
(11, NULL, NULL, NULL, ''),
(12, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os__search`
--

CREATE TABLE `os__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `title` text,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os__search`
--

INSERT INTO `os__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('H', 3, '', 'Test1'),
('H', 4, '', 'df'),
('H', 5, '', 'dfdf'),
('H', 6, 'Estado Modificado', 'listo'),
('H', 7, '', 'sistema de siplan no me abre'),
('H', 8, '', 'sdsd'),
('H', 9, '', 'dfdf'),
('H', 10, '', 'wwe'),
('H', 12, '', 'serdsefwew'),
('H', 13, '', 'wewewe'),
('H', 14, '', 'dfdf'),
('O', 1, 'osTicket', ''),
('T', 3, '391057 TEST', 'TEST'),
('T', 4, '197684 df', 'df'),
('T', 5, '566657 dfd', 'dfd'),
('T', 6, '996388 Falla en sistema SIPLAN', 'Falla en sistema SIPLAN'),
('T', 7, '1 sdsd', 'sdsd'),
('T', 8, '2 dfd', 'dfd'),
('T', 9, '3 dfdfd', 'dfdfd'),
('T', 10, '4 fgf', 'fgf'),
('T', 11, '5 fgfggf', 'fgfggf'),
('T', 12, '6 wew', 'wew'),
('T', 13, '7 fdf', 'fdf'),
('U', 1, 'osTicket Support', 'support@osticket.com'),
('U', 2, 'hjhj', ' hgjh@gmail.com\nhgjh@gmail.com'),
('U', 3, 'Jorge', ' jorge1giron18@gmail.com\njorge1giron18@gmail.com'),
('U', 4, 'sdfdf', ' jpaz@gmail.com\njpaz@gmail.com'),
('U', 5, 'dfdf', ' gfg@gmail.com\ngfg@gmail.com'),
('U', 6, 'Omar Mejia', ' omejia@grupolitoral.com\nomejia@grupolitoral.com'),
('U', 7, 'jdfss', ' jorge@gmail.com\njorge@gmail.com'),
('U', 8, 'dsd', ' j@gfgfg.com\nj@gfgfg.com'),
('U', 9, 'dfvvs', ' jdos@gmail.com\njdos@gmail.com'),
('U', 10, 'sdsdsds', ' sd@gmail.com\nsd@gmail.com'),
('U', 11, 'jorge', ' jpaz@grupolitoral.com\njpaz@grupolitoral.com'),
('U', 12, 'jorge', ' informacion@grupolitoral.com\ninformacion@grupolitoral.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ost_api_key`
--
ALTER TABLE `ost_api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apikey` (`apikey`),
  ADD KEY `ipaddr` (`ipaddr`);

--
-- Indices de la tabla `ost_attachment`
--
ALTER TABLE `ost_attachment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file-type` (`object_id`,`file_id`,`type`),
  ADD UNIQUE KEY `file_object` (`file_id`,`object_id`);

--
-- Indices de la tabla `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
  ADD PRIMARY KEY (`canned_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `active` (`isenabled`);

--
-- Indices de la tabla `ost_config`
--
ALTER TABLE `ost_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namespace` (`namespace`,`key`);

--
-- Indices de la tabla `ost_content`
--
ALTER TABLE `ost_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `ost_department`
--
ALTER TABLE `ost_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`pid`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `autoresp_email_id` (`autoresp_email_id`),
  ADD KEY `tpl_id` (`tpl_id`),
  ADD KEY `flags` (`flags`);

--
-- Indices de la tabla `ost_draft`
--
ALTER TABLE `ost_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `namespace` (`namespace`);

--
-- Indices de la tabla `ost_email`
--
ALTER TABLE `ost_email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indices de la tabla `ost_email_account`
--
ALTER TABLE `ost_email_account`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ost_email_template`
--
ALTER TABLE `ost_email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`);

--
-- Indices de la tabla `ost_email_template_group`
--
ALTER TABLE `ost_email_template_group`
  ADD PRIMARY KEY (`tpl_id`);

--
-- Indices de la tabla `ost_event`
--
ALTER TABLE `ost_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `ost_faq`
--
ALTER TABLE `ost_faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD UNIQUE KEY `question` (`question`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `ispublished` (`ispublished`);

--
-- Indices de la tabla `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indices de la tabla `ost_faq_topic`
--
ALTER TABLE `ost_faq_topic`
  ADD PRIMARY KEY (`faq_id`,`topic_id`);

--
-- Indices de la tabla `ost_file`
--
ALTER TABLE `ost_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ft` (`ft`),
  ADD KEY `key` (`key`),
  ADD KEY `signature` (`signature`),
  ADD KEY `type` (`type`),
  ADD KEY `created` (`created`),
  ADD KEY `size` (`size`);

--
-- Indices de la tabla `ost_file_chunk`
--
ALTER TABLE `ost_file_chunk`
  ADD PRIMARY KEY (`file_id`,`chunk_id`);

--
-- Indices de la tabla `ost_filter`
--
ALTER TABLE `ost_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `email_id` (`email_id`);

--
-- Indices de la tabla `ost_filter_action`
--
ALTER TABLE `ost_filter_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indices de la tabla `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indices de la tabla `ost_form`
--
ALTER TABLE `ost_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `ost_form_entry`
--
ALTER TABLE `ost_form_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_lookup` (`object_type`,`object_id`);

--
-- Indices de la tabla `ost_form_entry_values`
--
ALTER TABLE `ost_form_entry_values`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Indices de la tabla `ost_form_field`
--
ALTER TABLE `ost_form_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `sort` (`sort`);

--
-- Indices de la tabla `ost_group`
--
ALTER TABLE `ost_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic` (`topic`,`topic_pid`),
  ADD KEY `topic_pid` (`topic_pid`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`,`team_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indices de la tabla `ost_help_topic_form`
--
ALTER TABLE `ost_help_topic_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic-form` (`topic_id`,`form_id`);

--
-- Indices de la tabla `ost_list`
--
ALTER TABLE `ost_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `ost_list_items`
--
ALTER TABLE `ost_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_item_lookup` (`list_id`);

--
-- Indices de la tabla `ost_lock`
--
ALTER TABLE `ost_lock`
  ADD PRIMARY KEY (`lock_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indices de la tabla `ost_note`
--
ALTER TABLE `ost_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ext_id` (`ext_id`);

--
-- Indices de la tabla `ost_organization`
--
ALTER TABLE `ost_organization`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ost_organization__cdata`
--
ALTER TABLE `ost_organization__cdata`
  ADD PRIMARY KEY (`org_id`);

--
-- Indices de la tabla `ost_plugin`
--
ALTER TABLE `ost_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ost_queue`
--
ALTER TABLE `ost_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indices de la tabla `ost_queue_column`
--
ALTER TABLE `ost_queue_column`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ost_queue_columns`
--
ALTER TABLE `ost_queue_columns`
  ADD PRIMARY KEY (`queue_id`,`column_id`,`staff_id`);

--
-- Indices de la tabla `ost_queue_config`
--
ALTER TABLE `ost_queue_config`
  ADD PRIMARY KEY (`queue_id`,`staff_id`);

--
-- Indices de la tabla `ost_queue_export`
--
ALTER TABLE `ost_queue_export`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`);

--
-- Indices de la tabla `ost_queue_sort`
--
ALTER TABLE `ost_queue_sort`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ost_queue_sorts`
--
ALTER TABLE `ost_queue_sorts`
  ADD PRIMARY KEY (`queue_id`,`sort_id`);

--
-- Indices de la tabla `ost_role`
--
ALTER TABLE `ost_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `ost_schedule`
--
ALTER TABLE `ost_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ost_schedule_entry`
--
ALTER TABLE `ost_schedule_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `repeats` (`repeats`);

--
-- Indices de la tabla `ost_sequence`
--
ALTER TABLE `ost_sequence`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ost_session`
--
ALTER TABLE `ost_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `updated` (`session_updated`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `ost_sla`
--
ALTER TABLE `ost_sla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `ost_staff`
--
ALTER TABLE `ost_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `issuperuser` (`isadmin`),
  ADD KEY `isactive` (`isactive`),
  ADD KEY `onvacation` (`onvacation`);

--
-- Indices de la tabla `ost_staff_dept_access`
--
ALTER TABLE `ost_staff_dept_access`
  ADD PRIMARY KEY (`staff_id`,`dept_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indices de la tabla `ost_syslog`
--
ALTER TABLE `ost_syslog`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_type` (`log_type`);

--
-- Indices de la tabla `ost_task`
--
ALTER TABLE `ost_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `created` (`created`),
  ADD KEY `object` (`object_id`,`object_type`),
  ADD KEY `flags` (`flags`);

--
-- Indices de la tabla `ost_task__cdata`
--
ALTER TABLE `ost_task__cdata`
  ADD PRIMARY KEY (`task_id`);

--
-- Indices de la tabla `ost_team`
--
ALTER TABLE `ost_team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indices de la tabla `ost_team_member`
--
ALTER TABLE `ost_team_member`
  ADD PRIMARY KEY (`team_id`,`staff_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indices de la tabla `ost_thread`
--
ALTER TABLE `ost_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `object_type` (`object_type`);

--
-- Indices de la tabla `ost_thread_collaborator`
--
ALTER TABLE `ost_thread_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collab` (`thread_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `ost_thread_entry`
--
ALTER TABLE `ost_thread_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `ost_thread_entry_email`
--
ALTER TABLE `ost_thread_entry_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `email_id` (`email_id`);

--
-- Indices de la tabla `ost_thread_entry_merge`
--
ALTER TABLE `ost_thread_entry_merge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`);

--
-- Indices de la tabla `ost_thread_event`
--
ALTER TABLE `ost_thread_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_state` (`thread_id`,`event_id`,`timestamp`),
  ADD KEY `ticket_stats` (`timestamp`,`event_id`);

--
-- Indices de la tabla `ost_thread_referral`
--
ALTER TABLE `ost_thread_referral`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`object_id`,`object_type`,`thread_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indices de la tabla `ost_ticket`
--
ALTER TABLE `ost_ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created` (`created`),
  ADD KEY `closed` (`closed`),
  ADD KEY `duedate` (`duedate`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `ticket_pid` (`ticket_pid`);

--
-- Indices de la tabla `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
  ADD PRIMARY KEY (`priority_id`),
  ADD UNIQUE KEY `priority` (`priority`),
  ADD KEY `priority_urgency` (`priority_urgency`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indices de la tabla `ost_ticket_status`
--
ALTER TABLE `ost_ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Indices de la tabla `ost_ticket__cdata`
--
ALTER TABLE `ost_ticket__cdata`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indices de la tabla `ost_translation`
--
ALTER TABLE `ost_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`lang`),
  ADD KEY `object_hash` (`object_hash`);

--
-- Indices de la tabla `ost_user`
--
ALTER TABLE `ost_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `default_email_id` (`default_email_id`),
  ADD KEY `name` (`name`);

--
-- Indices de la tabla `ost_user_account`
--
ALTER TABLE `ost_user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `ost_user_email`
--
ALTER TABLE `ost_user_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `user_email_lookup` (`user_id`);

--
-- Indices de la tabla `ost_user__cdata`
--
ALTER TABLE `ost_user__cdata`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `ost__search`
--
ALTER TABLE `ost__search`
  ADD PRIMARY KEY (`object_type`,`object_id`);
ALTER TABLE `ost__search` ADD FULLTEXT KEY `search` (`title`,`content`);

--
-- Indices de la tabla `os_api_key`
--
ALTER TABLE `os_api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apikey` (`apikey`),
  ADD KEY `ipaddr` (`ipaddr`);

--
-- Indices de la tabla `os_attachment`
--
ALTER TABLE `os_attachment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file-type` (`object_id`,`file_id`,`type`),
  ADD UNIQUE KEY `file_object` (`file_id`,`object_id`);

--
-- Indices de la tabla `os_canned_response`
--
ALTER TABLE `os_canned_response`
  ADD PRIMARY KEY (`canned_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `active` (`isenabled`);

--
-- Indices de la tabla `os_config`
--
ALTER TABLE `os_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namespace` (`namespace`,`key`);

--
-- Indices de la tabla `os_content`
--
ALTER TABLE `os_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `os_department`
--
ALTER TABLE `os_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`pid`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `autoresp_email_id` (`autoresp_email_id`),
  ADD KEY `tpl_id` (`tpl_id`),
  ADD KEY `flags` (`flags`);

--
-- Indices de la tabla `os_draft`
--
ALTER TABLE `os_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `namespace` (`namespace`);

--
-- Indices de la tabla `os_email`
--
ALTER TABLE `os_email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indices de la tabla `os_email_account`
--
ALTER TABLE `os_email_account`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `os_email_template`
--
ALTER TABLE `os_email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`);

--
-- Indices de la tabla `os_email_template_group`
--
ALTER TABLE `os_email_template_group`
  ADD PRIMARY KEY (`tpl_id`);

--
-- Indices de la tabla `os_event`
--
ALTER TABLE `os_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `os_faq`
--
ALTER TABLE `os_faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD UNIQUE KEY `question` (`question`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `ispublished` (`ispublished`);

--
-- Indices de la tabla `os_faq_category`
--
ALTER TABLE `os_faq_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indices de la tabla `os_faq_topic`
--
ALTER TABLE `os_faq_topic`
  ADD PRIMARY KEY (`faq_id`,`topic_id`);

--
-- Indices de la tabla `os_file`
--
ALTER TABLE `os_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ft` (`ft`),
  ADD KEY `key` (`key`),
  ADD KEY `signature` (`signature`),
  ADD KEY `type` (`type`),
  ADD KEY `created` (`created`),
  ADD KEY `size` (`size`);

--
-- Indices de la tabla `os_file_chunk`
--
ALTER TABLE `os_file_chunk`
  ADD PRIMARY KEY (`file_id`,`chunk_id`);

--
-- Indices de la tabla `os_filter`
--
ALTER TABLE `os_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `email_id` (`email_id`);

--
-- Indices de la tabla `os_filter_action`
--
ALTER TABLE `os_filter_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indices de la tabla `os_filter_rule`
--
ALTER TABLE `os_filter_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indices de la tabla `os_form`
--
ALTER TABLE `os_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `os_form_entry`
--
ALTER TABLE `os_form_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_lookup` (`object_type`,`object_id`);

--
-- Indices de la tabla `os_form_entry_values`
--
ALTER TABLE `os_form_entry_values`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Indices de la tabla `os_form_field`
--
ALTER TABLE `os_form_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `sort` (`sort`);

--
-- Indices de la tabla `os_group`
--
ALTER TABLE `os_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `os_help_topic`
--
ALTER TABLE `os_help_topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic` (`topic`,`topic_pid`),
  ADD KEY `topic_pid` (`topic_pid`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`,`team_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indices de la tabla `os_help_topic_form`
--
ALTER TABLE `os_help_topic_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic-form` (`topic_id`,`form_id`);

--
-- Indices de la tabla `os_list`
--
ALTER TABLE `os_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `os_list_items`
--
ALTER TABLE `os_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_item_lookup` (`list_id`);

--
-- Indices de la tabla `os_lock`
--
ALTER TABLE `os_lock`
  ADD PRIMARY KEY (`lock_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indices de la tabla `os_note`
--
ALTER TABLE `os_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ext_id` (`ext_id`);

--
-- Indices de la tabla `os_organization`
--
ALTER TABLE `os_organization`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `os_organization__cdata`
--
ALTER TABLE `os_organization__cdata`
  ADD PRIMARY KEY (`org_id`);

--
-- Indices de la tabla `os_plugin`
--
ALTER TABLE `os_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `os_queue`
--
ALTER TABLE `os_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indices de la tabla `os_queue_column`
--
ALTER TABLE `os_queue_column`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `os_queue_columns`
--
ALTER TABLE `os_queue_columns`
  ADD PRIMARY KEY (`queue_id`,`column_id`,`staff_id`);

--
-- Indices de la tabla `os_queue_config`
--
ALTER TABLE `os_queue_config`
  ADD PRIMARY KEY (`queue_id`,`staff_id`);

--
-- Indices de la tabla `os_queue_export`
--
ALTER TABLE `os_queue_export`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`);

--
-- Indices de la tabla `os_queue_sort`
--
ALTER TABLE `os_queue_sort`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `os_queue_sorts`
--
ALTER TABLE `os_queue_sorts`
  ADD PRIMARY KEY (`queue_id`,`sort_id`);

--
-- Indices de la tabla `os_role`
--
ALTER TABLE `os_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `os_schedule`
--
ALTER TABLE `os_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `os_schedule_entry`
--
ALTER TABLE `os_schedule_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `repeats` (`repeats`);

--
-- Indices de la tabla `os_sequence`
--
ALTER TABLE `os_sequence`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `os_session`
--
ALTER TABLE `os_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `updated` (`session_updated`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `os_sla`
--
ALTER TABLE `os_sla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `os_staff`
--
ALTER TABLE `os_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `issuperuser` (`isadmin`),
  ADD KEY `isactive` (`isactive`),
  ADD KEY `onvacation` (`onvacation`);

--
-- Indices de la tabla `os_staff_dept_access`
--
ALTER TABLE `os_staff_dept_access`
  ADD PRIMARY KEY (`staff_id`,`dept_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indices de la tabla `os_syslog`
--
ALTER TABLE `os_syslog`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_type` (`log_type`);

--
-- Indices de la tabla `os_task`
--
ALTER TABLE `os_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `created` (`created`),
  ADD KEY `object` (`object_id`,`object_type`),
  ADD KEY `flags` (`flags`);

--
-- Indices de la tabla `os_task__cdata`
--
ALTER TABLE `os_task__cdata`
  ADD PRIMARY KEY (`task_id`);

--
-- Indices de la tabla `os_team`
--
ALTER TABLE `os_team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indices de la tabla `os_team_member`
--
ALTER TABLE `os_team_member`
  ADD PRIMARY KEY (`team_id`,`staff_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indices de la tabla `os_thread`
--
ALTER TABLE `os_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `object_type` (`object_type`);

--
-- Indices de la tabla `os_thread_collaborator`
--
ALTER TABLE `os_thread_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collab` (`thread_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `os_thread_entry`
--
ALTER TABLE `os_thread_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `os_thread_entry_email`
--
ALTER TABLE `os_thread_entry_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `email_id` (`email_id`);

--
-- Indices de la tabla `os_thread_entry_merge`
--
ALTER TABLE `os_thread_entry_merge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`);

--
-- Indices de la tabla `os_thread_event`
--
ALTER TABLE `os_thread_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_state` (`thread_id`,`event_id`,`timestamp`),
  ADD KEY `ticket_stats` (`timestamp`,`event_id`);

--
-- Indices de la tabla `os_thread_referral`
--
ALTER TABLE `os_thread_referral`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`object_id`,`object_type`,`thread_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indices de la tabla `os_ticket`
--
ALTER TABLE `os_ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created` (`created`),
  ADD KEY `closed` (`closed`),
  ADD KEY `duedate` (`duedate`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `ticket_pid` (`ticket_pid`);

--
-- Indices de la tabla `os_ticket_priority`
--
ALTER TABLE `os_ticket_priority`
  ADD PRIMARY KEY (`priority_id`),
  ADD UNIQUE KEY `priority` (`priority`),
  ADD KEY `priority_urgency` (`priority_urgency`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indices de la tabla `os_ticket_status`
--
ALTER TABLE `os_ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Indices de la tabla `os_ticket__cdata`
--
ALTER TABLE `os_ticket__cdata`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indices de la tabla `os_translation`
--
ALTER TABLE `os_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`lang`),
  ADD KEY `object_hash` (`object_hash`);

--
-- Indices de la tabla `os_user`
--
ALTER TABLE `os_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `default_email_id` (`default_email_id`),
  ADD KEY `name` (`name`);

--
-- Indices de la tabla `os_user_account`
--
ALTER TABLE `os_user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `os_user_email`
--
ALTER TABLE `os_user_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `user_email_lookup` (`user_id`);

--
-- Indices de la tabla `os_user__cdata`
--
ALTER TABLE `os_user__cdata`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `os__search`
--
ALTER TABLE `os__search`
  ADD PRIMARY KEY (`object_type`,`object_id`);
ALTER TABLE `os__search` ADD FULLTEXT KEY `search` (`title`,`content`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ost_api_key`
--
ALTER TABLE `ost_api_key`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_attachment`
--
ALTER TABLE `ost_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
  MODIFY `canned_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ost_config`
--
ALTER TABLE `ost_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `ost_content`
--
ALTER TABLE `ost_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ost_department`
--
ALTER TABLE `ost_department`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ost_draft`
--
ALTER TABLE `ost_draft`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ost_email`
--
ALTER TABLE `ost_email`
  MODIFY `email_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ost_email_account`
--
ALTER TABLE `ost_email_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_email_template`
--
ALTER TABLE `ost_email_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `ost_email_template_group`
--
ALTER TABLE `ost_email_template_group`
  MODIFY `tpl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ost_event`
--
ALTER TABLE `ost_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `ost_faq`
--
ALTER TABLE `ost_faq`
  MODIFY `faq_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_file`
--
ALTER TABLE `ost_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ost_filter`
--
ALTER TABLE `ost_filter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ost_filter_action`
--
ALTER TABLE `ost_filter_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_form`
--
ALTER TABLE `ost_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ost_form_entry`
--
ALTER TABLE `ost_form_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ost_form_field`
--
ALTER TABLE `ost_form_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `ost_group`
--
ALTER TABLE `ost_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ost_help_topic_form`
--
ALTER TABLE `ost_help_topic_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ost_list`
--
ALTER TABLE `ost_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ost_list_items`
--
ALTER TABLE `ost_list_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_lock`
--
ALTER TABLE `ost_lock`
  MODIFY `lock_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_note`
--
ALTER TABLE `ost_note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_organization`
--
ALTER TABLE `ost_organization`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ost_plugin`
--
ALTER TABLE `ost_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_queue`
--
ALTER TABLE `ost_queue`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `ost_queue_column`
--
ALTER TABLE `ost_queue_column`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `ost_queue_export`
--
ALTER TABLE `ost_queue_export`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_queue_sort`
--
ALTER TABLE `ost_queue_sort`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ost_role`
--
ALTER TABLE `ost_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ost_schedule`
--
ALTER TABLE `ost_schedule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ost_schedule_entry`
--
ALTER TABLE `ost_schedule_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ost_sequence`
--
ALTER TABLE `ost_sequence`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_sla`
--
ALTER TABLE `ost_sla`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ost_staff`
--
ALTER TABLE `ost_staff`
  MODIFY `staff_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ost_syslog`
--
ALTER TABLE `ost_syslog`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ost_task`
--
ALTER TABLE `ost_task`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_team`
--
ALTER TABLE `ost_team`
  MODIFY `team_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ost_thread`
--
ALTER TABLE `ost_thread`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ost_thread_collaborator`
--
ALTER TABLE `ost_thread_collaborator`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_thread_entry`
--
ALTER TABLE `ost_thread_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ost_thread_entry_email`
--
ALTER TABLE `ost_thread_entry_email`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_thread_entry_merge`
--
ALTER TABLE `ost_thread_entry_merge`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_thread_event`
--
ALTER TABLE `ost_thread_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `ost_thread_referral`
--
ALTER TABLE `ost_thread_referral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_ticket`
--
ALTER TABLE `ost_ticket`
  MODIFY `ticket_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
  MODIFY `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ost_ticket_status`
--
ALTER TABLE `ost_ticket_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ost_translation`
--
ALTER TABLE `ost_translation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_user`
--
ALTER TABLE `ost_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ost_user_account`
--
ALTER TABLE `ost_user_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ost_user_email`
--
ALTER TABLE `ost_user_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `os_api_key`
--
ALTER TABLE `os_api_key`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_attachment`
--
ALTER TABLE `os_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `os_canned_response`
--
ALTER TABLE `os_canned_response`
  MODIFY `canned_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `os_config`
--
ALTER TABLE `os_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT de la tabla `os_content`
--
ALTER TABLE `os_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `os_department`
--
ALTER TABLE `os_department`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `os_draft`
--
ALTER TABLE `os_draft`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `os_email`
--
ALTER TABLE `os_email`
  MODIFY `email_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `os_email_account`
--
ALTER TABLE `os_email_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_email_template`
--
ALTER TABLE `os_email_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `os_email_template_group`
--
ALTER TABLE `os_email_template_group`
  MODIFY `tpl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `os_event`
--
ALTER TABLE `os_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `os_faq`
--
ALTER TABLE `os_faq`
  MODIFY `faq_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_faq_category`
--
ALTER TABLE `os_faq_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_file`
--
ALTER TABLE `os_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `os_filter`
--
ALTER TABLE `os_filter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `os_filter_action`
--
ALTER TABLE `os_filter_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_filter_rule`
--
ALTER TABLE `os_filter_rule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_form`
--
ALTER TABLE `os_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `os_form_entry`
--
ALTER TABLE `os_form_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `os_form_field`
--
ALTER TABLE `os_form_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `os_group`
--
ALTER TABLE `os_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_help_topic`
--
ALTER TABLE `os_help_topic`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `os_help_topic_form`
--
ALTER TABLE `os_help_topic_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `os_list`
--
ALTER TABLE `os_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `os_list_items`
--
ALTER TABLE `os_list_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_lock`
--
ALTER TABLE `os_lock`
  MODIFY `lock_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_note`
--
ALTER TABLE `os_note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_organization`
--
ALTER TABLE `os_organization`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `os_plugin`
--
ALTER TABLE `os_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_queue`
--
ALTER TABLE `os_queue`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `os_queue_column`
--
ALTER TABLE `os_queue_column`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `os_queue_export`
--
ALTER TABLE `os_queue_export`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_queue_sort`
--
ALTER TABLE `os_queue_sort`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `os_role`
--
ALTER TABLE `os_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `os_schedule`
--
ALTER TABLE `os_schedule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `os_schedule_entry`
--
ALTER TABLE `os_schedule_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `os_sequence`
--
ALTER TABLE `os_sequence`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `os_sla`
--
ALTER TABLE `os_sla`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `os_staff`
--
ALTER TABLE `os_staff`
  MODIFY `staff_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `os_syslog`
--
ALTER TABLE `os_syslog`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `os_task`
--
ALTER TABLE `os_task`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_team`
--
ALTER TABLE `os_team`
  MODIFY `team_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `os_thread`
--
ALTER TABLE `os_thread`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `os_thread_collaborator`
--
ALTER TABLE `os_thread_collaborator`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_thread_entry`
--
ALTER TABLE `os_thread_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `os_thread_entry_email`
--
ALTER TABLE `os_thread_entry_email`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_thread_entry_merge`
--
ALTER TABLE `os_thread_entry_merge`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_thread_event`
--
ALTER TABLE `os_thread_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `os_thread_referral`
--
ALTER TABLE `os_thread_referral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `os_ticket`
--
ALTER TABLE `os_ticket`
  MODIFY `ticket_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `os_ticket_priority`
--
ALTER TABLE `os_ticket_priority`
  MODIFY `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `os_ticket_status`
--
ALTER TABLE `os_ticket_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `os_translation`
--
ALTER TABLE `os_translation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_user`
--
ALTER TABLE `os_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `os_user_account`
--
ALTER TABLE `os_user_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `os_user_email`
--
ALTER TABLE `os_user_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
