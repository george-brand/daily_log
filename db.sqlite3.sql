BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "daily_logs_topic" (
	"id"	integer NOT NULL,
	"text"	varchar(200) NOT NULL,
	"date_added"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "daily_logs_entry" (
	"id"	integer NOT NULL,
	"text"	text NOT NULL,
	"date_added"	datetime NOT NULL,
	"topic_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("topic_id") REFERENCES "daily_logs_topic"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2021-10-11 20:20:14.039898');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2021-10-11 20:20:14.062013');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2021-10-11 20:20:14.093260');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2021-10-11 20:20:14.108914');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2021-10-11 20:20:14.124536');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2021-10-11 20:20:14.140124');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2021-10-11 20:20:14.161933');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2021-10-11 20:20:14.177561');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2021-10-11 20:20:14.193180');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2021-10-11 20:20:14.208813');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2021-10-11 20:20:14.224456');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2021-10-11 20:20:14.240044');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2021-10-11 20:20:14.262229');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2021-10-11 20:20:14.277887');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2021-10-11 20:20:14.293478');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2021-10-11 20:20:14.293478');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2021-10-11 20:20:14.309130');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2021-10-11 20:20:14.324749');
INSERT INTO "django_migrations" VALUES (19,'daily_logs','0001_initial','2021-10-11 20:49:05.682404');
INSERT INTO "django_migrations" VALUES (20,'daily_logs','0002_entry','2021-10-11 22:09:01.761718');
INSERT INTO "django_admin_log" VALUES (1,'2021-10-11 21:53:51.568517','1','Topic object (1)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2021-10-11 21:55:12.935322','2','Topic object (2)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2021-10-15 00:36:20.620973','3','Topic object (3)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2021-10-15 00:38:03.395672','3','Topic object (3)','',7,1,3);
INSERT INTO "django_admin_log" VALUES (5,'2021-10-15 00:38:03.395672','2','Topic object (2)','',7,1,3);
INSERT INTO "django_admin_log" VALUES (6,'2021-10-15 00:38:03.411266','1','Topic object (1)','',7,1,3);
INSERT INTO "django_admin_log" VALUES (7,'2021-10-15 00:38:18.086990','4','Topic object (4)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2021-10-15 00:42:48.989837','4','Topic object (4)','[]',7,1,2);
INSERT INTO "django_admin_log" VALUES (9,'2021-10-15 00:46:53.358653','4','Topic object (4)','',7,1,3);
INSERT INTO "django_admin_log" VALUES (10,'2021-10-15 00:46:58.772301','5','Topic object (5)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (11,'2021-10-15 00:49:54.846737','5','Topic object (5)','',7,1,3);
INSERT INTO "django_admin_log" VALUES (12,'2021-10-15 00:50:23.514413','6','Topic object (6)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (13,'2021-10-15 01:00:59.787022','6','Topic object (6)','',7,1,3);
INSERT INTO "django_admin_log" VALUES (14,'2021-10-15 01:01:22.152643','7','Topic object (7)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (15,'2021-10-15 01:01:35.975712','7','Topic object (7)','[]',7,1,2);
INSERT INTO "django_admin_log" VALUES (16,'2021-10-19 00:08:40.852042','8','Topic object (8)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (17,'2021-10-19 00:48:27.497714','1','Entry object (1)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (18,'2021-10-19 01:04:07.989444','1','Test entry....','',8,1,3);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'daily_logs','topic');
INSERT INTO "django_content_type" VALUES (8,'daily_logs','entry');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_topic','Can add topic');
INSERT INTO "auth_permission" VALUES (26,7,'change_topic','Can change topic');
INSERT INTO "auth_permission" VALUES (27,7,'delete_topic','Can delete topic');
INSERT INTO "auth_permission" VALUES (28,7,'view_topic','Can view topic');
INSERT INTO "auth_permission" VALUES (29,8,'add_entry','Can add entry');
INSERT INTO "auth_permission" VALUES (30,8,'change_entry','Can change entry');
INSERT INTO "auth_permission" VALUES (31,8,'delete_entry','Can delete entry');
INSERT INTO "auth_permission" VALUES (32,8,'view_entry','Can view entry');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$260000$cB5olaKaPcUjdczNQLxtQ3$mdd06obSe5LuRVvfWukQR2ArknPFA8oL7XU7Pw6JDSk=','2021-10-22 13:05:57.672361',1,'dl_admin','','',1,1,'2021-10-11 21:45:44.995160','');
INSERT INTO "django_session" VALUES ('f39zf3y5o85gci0ntnmgy2tiw6gjvmxl','.eJxVjEEOwiAQRe_C2hCGlgFcuu8ZyMCgVA0kpV0Z765NutDtf-_9lwi0rSVsPS9hZnEWIE6_W6T0yHUHfKd6azK1ui5zlLsiD9rl1Dg_L4f7d1Col29tFQ4GDYNGM6ohgkOOyiqbjGUAQvDWGYgqZ8eGkscxaYfeI47qqqN4fwCe2jZZ:1ma3CB:gUqJ5CmuupRNWhxRYevZAYG4RzFQgedegSbylNr2YxI','2021-10-25 21:50:55.257161');
INSERT INTO "django_session" VALUES ('5fjid2aep2t0tyjwgszfw26yl1s5xe9p','.eJxVjEEOwiAQRe_C2hCGlgFcuu8ZyMCgVA0kpV0Z765NutDtf-_9lwi0rSVsPS9hZnEWIE6_W6T0yHUHfKd6azK1ui5zlLsiD9rl1Dg_L4f7d1Col29tFQ4GDYNGM6ohgkOOyiqbjGUAQvDWGYgqZ8eGkscxaYfeI47qqqN4fwCe2jZZ:1mccZE:yswUiUtmbUEtgySlGcPkq6nQb0fNwMC7e1ljEgg4_gE','2021-11-02 00:01:20.454243');
INSERT INTO "django_session" VALUES ('5ebbxyc0wdqvju2s7k8vu2uvnta91vjh','.eJxVjEEOwiAQRe_C2hCGlgFcuu8ZyMCgVA0kpV0Z765NutDtf-_9lwi0rSVsPS9hZnEWIE6_W6T0yHUHfKd6azK1ui5zlLsiD9rl1Dg_L4f7d1Col29tFQ4GDYNGM6ohgkOOyiqbjGUAQvDWGYgqZ8eGkscxaYfeI47qqqN4fwCe2jZZ:1mduFB:h2Fl9qBx7pKXxoTN0iC9PqcI40Il1IhiViKHh-cch-M','2021-11-05 13:05:57.688357');
INSERT INTO "daily_logs_topic" VALUES (1,'Exercise','2021-10-15 01:01:22.151679');
INSERT INTO "daily_logs_topic" VALUES (2,'Web Development','2021-10-19 00:08:40.849069');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "daily_logs_entry_topic_id_dd7bc57c" ON "daily_logs_entry" (
	"topic_id"
);
COMMIT;
