USE [nbenkul_KioskChulaiPad]
GO
/****** Object:  Table [dbo].[kiosk_building]    Script Date: 3/5/2561 1:10:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_building](
	[building_code] [nvarchar](5) NOT NULL,
	[building_name] [nvarchar](50) NOT NULL,
	[active_flag] [char](1) NULL,
	[crtd_dttm] [datetime] NULL,
	[crtd_by] [nvarchar](20) NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](20) NULL,
 CONSTRAINT [PK_KIOSK_BRANCH] PRIMARY KEY CLUSTERED 
(
	[building_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_com]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_com](
	[com_code] [nvarchar](12) NOT NULL,
	[locat_code] [nvarchar](15) NULL,
	[computer_code] [int] NOT NULL,
	[com_name] [nvarchar](50) NULL,
	[kiosk_asset_no] [nvarchar](50) NULL,
	[building_code] [nvarchar](5) NULL,
	[slip_qty] [int] NULL,
	[slip_alert_qty] [int] NULL,
	[slip_print_qty] [int] NULL,
	[a4_qty] [int] NULL,
	[a4_alert_qty] [int] NULL,
	[a4_print_qty] [int] NULL,
	[active_flag] [char](1) NOT NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](20) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](20) NULL,
	[kiosk_group_code] [nvarchar](20) NULL,
 CONSTRAINT [PK_KIOSK_COM] PRIMARY KEY CLUSTERED 
(
	[com_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_computer]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_computer](
	[computer_code] [int] IDENTITY(1,1) NOT NULL,
	[com_name] [nvarchar](50) NOT NULL,
	[com_asset_no] [nvarchar](50) NULL,
	[com_mac_addr] [nvarchar](50) NULL,
	[com_serial_no] [nvarchar](50) NULL,
	[active_flag] [char](1) NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](20) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](20) NULL,
	[kiosk_group_code] [nvarchar](20) NULL,
 CONSTRAINT [PK_kiosk_computer_1] PRIMARY KEY CLUSTERED 
(
	[computer_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_control]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kiosk_control](
	[locat_code] [nvarchar](15) NOT NULL,
	[year] [nvarchar](2) NOT NULL,
	[sequence] [nvarchar](8) NOT NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](20) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](20) NULL,
 CONSTRAINT [PK_kiosk_control_1] PRIMARY KEY CLUSTERED 
(
	[locat_code] ASC,
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kiosk_locat]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_locat](
	[locat_code] [nvarchar](15) NOT NULL,
	[locat_type_code] [int] NOT NULL,
	[locat_name] [nvarchar](50) NOT NULL,
	[locat_name_en] [nvarchar](50) NULL,
	[building_code] [nvarchar](5) NOT NULL,
	[floor] [nvarchar](2) NOT NULL,
	[zone] [nvarchar](2) NULL,
	[kiosk_group_code] [nvarchar](20) NULL,
	[active_flag] [char](1) NOT NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](20) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](20) NULL,
 CONSTRAINT [PK_KIOSK_LOCAT] PRIMARY KEY CLUSTERED 
(
	[locat_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_map_qexpress]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_map_qexpress](
	[map_qexpress_seq] [int] IDENTITY(1,1) NOT NULL,
	[slip_no_qexpress] [nvarchar](25) NULL,
	[queue_no_qexpress] [nvarchar](5) NULL,
	[slip_no_q] [nvarchar](25) NULL,
	[queue_no_q] [nvarchar](5) NULL,
	[trans_dtm] [datetime] NULL,
	[active_flag] [char](1) NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](20) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](20) NULL,
 CONSTRAINT [PK_kiosk_map_qexpress] PRIMARY KEY CLUSTERED 
(
	[map_qexpress_seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_q_log]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_q_log](
	[q_log_seq] [int] IDENTITY(1,1) NOT NULL,
	[q_trans_dtm] [datetime] NOT NULL,
	[queue_no] [nvarchar](5) NOT NULL,
	[flag_queue] [char](1) NOT NULL,
	[q_action] [char](1) NULL,
	[action_by] [nvarchar](50) NULL,
	[channel_no] [int] NULL,
	[slip_seq] [int] NULL,
	[com_code] [nvarchar](12) NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](50) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](50) NULL,
 CONSTRAINT [PK_kiosk_q_log] PRIMARY KEY CLUSTERED 
(
	[q_log_seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_transdetail_appoint]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_transdetail_appoint](
	[transdetail_appoint_seq] [int] IDENTITY(1,1) NOT NULL,
	[slip_seq] [int] NOT NULL,
	[appoint_date] [datetime] NULL,
	[appoint_time_start] [time](7) NULL,
	[appoint_time_end] [time](7) NULL,
	[appoint_clinic_code] [nvarchar](50) NULL,
	[appoint_clinic_name] [nvarchar](100) NULL,
	[appoint_clinic_location] [nvarchar](500) NULL,
	[appoint_doctor_code] [nvarchar](50) NULL,
	[appoint_doctor_name] [nvarchar](100) NULL,
	[make_appoint_date] [datetime] NULL,
	[make_appoint_time] [time](7) NULL,
	[appoint_status_code] [nvarchar](20) NULL,
	[appoint_status_name] [nvarchar](100) NULL,
	[appoint_right_group_code] [nvarchar](50) NULL,
	[appoint_right_group_name] [nvarchar](100) NULL,
	[appoint_right_code] [nvarchar](50) NULL,
	[appoint_right_name] [nvarchar](100) NULL,
	[appoint_contact_type] [nvarchar](10) NULL,
	[appoint_right_cont_code] [nvarchar](50) NULL,
	[appoint_right_cont_name] [nvarchar](100) NULL,
	[appoint_right_start_date] [datetime] NULL,
	[appoint_right_e_date] [datetime] NULL,
	[appoint_right_ref_no] [nvarchar](50) NULL,
	[flag_first_clinic_contact] [char](1) NULL,
	[flag_expire] [char](1) NULL,
	[flag_pay] [char](1) NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](50) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](50) NULL,
 CONSTRAINT [PK_kiosk_transdetail_appoint] PRIMARY KEY CLUSTERED 
(
	[transdetail_appoint_seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_transdetail_clinic_choose]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_transdetail_clinic_choose](
	[transdetail_clinic_choose_seq] [int] IDENTITY(1,1) NOT NULL,
	[slip_seq] [int] NOT NULL,
	[clinic_seq] [int] NOT NULL,
	[clinic_code] [nvarchar](50) NOT NULL,
	[clinic_name] [nvarchar](100) NOT NULL,
	[clinic_location] [nvarchar](500) NULL,
	[clinic_desc] [nvarchar](1000) NOT NULL,
	[clinic_type] [char](1) NOT NULL,
	[flag_clinic_open] [char](1) NOT NULL,
	[flag_clinic_quota_full] [char](1) NOT NULL,
	[flag_is_quota_full] [char](1) NOT NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](50) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](50) NULL,
 CONSTRAINT [PK_kiosk_transdetail_clinic_choose] PRIMARY KEY CLUSTERED 
(
	[transdetail_clinic_choose_seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_transdetail_MissAppoint]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_transdetail_MissAppoint](
	[transdetail_missappoint_seq] [int] IDENTITY(1,1) NOT NULL,
	[slip_seq] [int] NOT NULL,
	[missappoint_date] [datetime] NULL,
	[missappoint_time_start] [time](7) NULL,
	[missappoint_time_end] [time](7) NULL,
	[missappoint_clinic_code] [nvarchar](50) NULL,
	[missappoint_clinic_name] [nvarchar](100) NULL,
	[missappoint_clinic_location] [nvarchar](500) NULL,
	[missappoint_doctor_code] [nvarchar](50) NULL,
	[missappoint_doctor_name] [nvarchar](100) NULL,
	[make_appoint_date] [datetime] NULL,
	[make_appoint_time] [time](7) NULL,
	[missappoint_status_code] [nvarchar](20) NULL,
	[missappoint_status_name] [nvarchar](100) NULL,
	[missappoint_right_group_code] [nvarchar](50) NULL,
	[missappoint_right_group_name] [nvarchar](100) NULL,
	[missappoint_right_code] [nvarchar](50) NULL,
	[missappoint_right_name] [nvarchar](100) NULL,
	[missappoint_contact_type] [nvarchar](10) NULL,
	[missappoint_right_cont_code] [nvarchar](50) NULL,
	[missappoint_right_cont_name] [nvarchar](100) NULL,
	[missappoint_right_start_date] [datetime] NULL,
	[missappoint_right_e_date] [datetime] NULL,
	[missappoint_right_ref_no] [nvarchar](50) NULL,
	[flag_first_clinic_contact] [char](1) NULL,
	[flag_expire] [char](1) NULL,
	[flag_pay] [char](1) NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](50) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_transdetail_right]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kiosk_transdetail_right](
	[transdetail_right_seq] [int] IDENTITY(1,1) NOT NULL,
	[slip_seq] [int] NOT NULL,
	[right_group_code] [nvarchar](50) NULL,
	[right_group_name] [nvarchar](100) NULL,
	[right_code] [nvarchar](50) NULL,
	[right_name] [nvarchar](100) NULL,
	[contact_type] [nvarchar](10) NULL,
	[right_cont_code] [nvarchar](50) NULL,
	[right_cont_name] [nvarchar](100) NULL,
	[right_start_date] [datetime] NULL,
	[right_e_date] [datetime] NULL,
	[right_last_date] [datetime] NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](50) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](50) NULL,
	[right_type_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_kiosk_transdetail_right] PRIMARY KEY CLUSTERED 
(
	[transdetail_right_seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kiosk_transhead]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_transhead](
	[slip_seq] [int] IDENTITY(1,1) NOT NULL,
	[slip_no] [nvarchar](25) NOT NULL,
	[slip_type] [char](1) NOT NULL,
	[slip_type_detail] [char](3) NULL,
	[slip_type_flag] [char](1) NULL,
	[slip_dtm] [datetime] NOT NULL,
	[register_date] [datetime] NULL,
	[register_time] [time](7) NULL,
	[out_time] [time](7) NULL,
	[client_log_seq] [int] NULL,
	[building_code] [nvarchar](5) NOT NULL,
	[floor] [nvarchar](2) NOT NULL,
	[zone] [nvarchar](2) NULL,
	[locat_code] [nvarchar](9) NOT NULL,
	[locat_name] [nvarchar](50) NOT NULL,
	[com_code] [nvarchar](12) NOT NULL,
	[computer_code] [int] NOT NULL,
	[kiosk_group_code] [nvarchar](20) NOT NULL,
	[time_type] [char](1) NOT NULL,
	[idcard_no] [nvarchar](20) NULL,
	[hn_no] [nvarchar](20) NULL,
	[pateint_name] [nvarchar](100) NULL,
	[pateint_dob] [datetime] NULL,
	[patient_file_location_type] [nvarchar](10) NULL,
	[patient_file_location_status] [nvarchar](20) NULL,
	[patient_file_location_code] [nvarchar](10) NULL,
	[patient_file_location_name] [nvarchar](100) NULL,
	[patient_file_asof] [datetime] NULL,
	[queue_no] [nvarchar](5) NULL,
	[flag_queue] [char](1) NULL,
	[queue_status] [char](1) NULL,
	[waiting_qno] [int] NULL,
	[time_gen_waiting_qno] [time](7) NULL,
	[pateint_flag] [char](1) NULL,
	[pateint_service_flag] [char](1) NULL,
	[flag_change_right] [char](1) NULL,
	[flag_choose_right] [char](2) NULL,
	[flag_lab_xray] [char](1) NULL,
	[flag_remark_right] [char](1) NULL,
	[flag_remark_right_group2] [char](1) NULL,
	[flag_general_pateint] [char](1) NULL,
	[flag_nosend_approve] [char](1) NULL,
	[flag_have_right_approved] [char](1) NULL,
	[flag_dct_ins_treatment_order] [char](1) NULL,
	[q_channel_group_id] [int] NULL,
	[q_period_no] [int] NULL,
	[flag_print_q_report] [char](1) NULL,
	[print_q_report_last_dttm] [datetime] NULL,
	[print_result] [nvarchar](max) NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](50) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](50) NULL,
 CONSTRAINT [PK_kiosk_transhead_1] PRIMARY KEY CLUSTERED 
(
	[slip_seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_user]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_user](
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[name] [nvarchar](50) NULL,
	[surname] [nvarchar](50) NULL,
	[email_addr] [nvarchar](max) NULL,
	[mobilephone_no] [nvarchar](12) NULL,
	[user_group_code] [int] NOT NULL,
	[active_flag] [char](1) NOT NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](20) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](20) NULL,
 CONSTRAINT [PK_kiosk_user_1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kiosk_user_group]    Script Date: 3/5/2561 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kiosk_user_group](
	[user_group_code] [int] IDENTITY(1,1) NOT NULL,
	[user_group_name] [nvarchar](50) NOT NULL,
	[user_group_desc] [nvarchar](255) NULL,
	[building_code] [nvarchar](5) NULL,
	[location_floor] [nvarchar](2) NULL,
	[active_flag] [char](1) NOT NULL,
	[crtd_dttm] [datetime] NOT NULL,
	[crtd_by] [nvarchar](20) NOT NULL,
	[last_chg_dttm] [datetime] NULL,
	[last_chg_by] [nvarchar](20) NULL,
 CONSTRAINT [PK_KIOSK_USER_GROUP] PRIMARY KEY CLUSTERED 
(
	[user_group_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[kiosk_building] ([building_code], [building_name], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'01', N'ภปร.', N'Y', CAST(N'2014-08-14 12:22:26.840' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_building] ([building_code], [building_name], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'27', N'ว่องวานิช', N'Y', CAST(N'2017-12-19 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_building] ([building_code], [building_name], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'58', N'ส.ธ.', N'Y', CAST(N'2016-02-15 19:22:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_building] ([building_code], [building_name], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'67', N'ภูมิสิริมังคลานุสรณ์', N'Y', CAST(N'2017-01-06 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'10102001001', N'10102001', 24, N'KIPR0201', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'10105001001', N'10105001', 1025, N'KIPR0501', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2017-10-04 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'1010G001001', N'1010G001', 7, N'KIPR0G01', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2014-07-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'1')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'1010G001002', N'1010G001', 1, N'KIPR0G02', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2014-04-21 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'1')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'1010G001003', N'1010G001', 8, N'KIPR0G03', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2014-07-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'1')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'1010G001004', N'1010G001', 19, N'KIPR0G07', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'2')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'1010GO001001', N'1010GO001', 17, N'KIPR0G04', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2015-02-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'2')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'1010GO001002', N'1010GO001', 18, N'KIPR0G05', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2015-02-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'2')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'10114001001', N'10114001', 2034, N'KIPR1401', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2018-02-12 11:13:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'10116001001', N'10116001', 2029, N'KIPR1601', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2018-01-16 16:31:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'10117001001', N'10117001', 2032, N'KIPR1701', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2018-01-19 13:45:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'12701001001', N'12701001', 1027, N'KIWN0101', NULL, N'27', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2017-12-19 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'9')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'1580G001001', N'1580G001', 20, N'KISR0101', NULL, N'58', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2016-01-21 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'6')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'16701C001001', N'16701C001', 1024, N'KIBH0101', NULL, N'67', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2017-01-06 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'2010G001001', N'2010G001', 16, N'KIPR0G06', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2015-02-12 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'3')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'40105001001', N'40105001', 1026, N'PR05O212', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2017-10-10 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'4010G001004', N'4010G001', 9, N'LPA-Lenovo1-PC', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2014-08-04 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'5')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'4010G001005', N'4010G001', 11, N'LPA-PC', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2014-08-05 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'5')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'4010G001006', N'4010G001', 12, N'PR0GO148', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2014-08-14 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'5')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'4010G001007', N'4010G001', 13, N'PR0GO141', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2014-08-14 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'5')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'4010G001008', N'4010G001', 14, N'PR0GO149', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2014-08-14 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'5')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'4010G001009', N'4010G001', 15, N'PR0MD230', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2014-09-01 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'5')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'40116001001', N'40116001', 2033, N'PR16082', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2018-01-19 14:03:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'40117001001', N'40117001', 2027, N'PR17088', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2018-01-10 11:57:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'40117001002', N'40117001', 2028, N'PR17091', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2018-01-10 11:58:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'40117001006', N'40117001', 2034, N'PR17085', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2018-01-10 12:02:00.000' AS DateTime), N'admin', NULL, NULL, N'8')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'55809001001', N'55809001', 21, N'JS01A114', NULL, N'58', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'7')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'55809001002', N'55809001', 22, N'SR09A194', NULL, N'58', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'7')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'55809001003', N'55809001', 23, N'JS01A133', NULL, N'58', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'7')
INSERT [dbo].[kiosk_com] ([com_code], [locat_code], [computer_code], [com_name], [kiosk_asset_no], [building_code], [slip_qty], [slip_alert_qty], [slip_print_qty], [a4_qty], [a4_alert_qty], [a4_print_qty], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (N'6010G001001', N'6010G001', 2035, N'IPAD001', NULL, N'01', 0, 0, 0, 0, 0, 0, N'Y', CAST(N'2018-03-20 00:00:00.000' AS DateTime), N'admin', NULL, NULL, N'10')
SET IDENTITY_INSERT [dbo].[kiosk_computer] ON 

INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (1, N'KIPR0G02', NULL, NULL, NULL, N'Y', CAST(N'2014-04-21 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (6, N'KIOSK-PC', NULL, NULL, NULL, N'Y', CAST(N'2014-01-01 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (7, N'KIPR0G01', NULL, NULL, NULL, N'Y', CAST(N'2014-07-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (8, N'KIPR0G03', NULL, NULL, NULL, N'Y', CAST(N'2014-07-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (9, N'LPA-Lenovo1-PC', NULL, NULL, NULL, N'Y', CAST(N'2014-08-04 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (11, N'LPA-PC', NULL, NULL, NULL, N'Y', CAST(N'2014-08-05 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (12, N'PR0GO148', NULL, NULL, NULL, N'Y', CAST(N'2014-08-14 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (13, N'PR0GO141', NULL, NULL, NULL, N'Y', CAST(N'2014-08-14 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (14, N'PR0GO149', NULL, NULL, NULL, N'Y', CAST(N'2014-08-14 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (15, N'PR0MD230', NULL, NULL, NULL, N'Y', CAST(N'2014-09-01 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (16, N'KIPR0G06', NULL, NULL, NULL, N'Y', CAST(N'2015-02-12 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (17, N'KIPR0G04', NULL, NULL, NULL, N'Y', CAST(N'2015-02-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (18, N'KIPR0G05', NULL, NULL, NULL, N'Y', CAST(N'2015-02-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (19, N'KIPR0G07', NULL, NULL, NULL, N'Y', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (20, N'KISR0101', NULL, NULL, NULL, N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (21, N'JS01A114', NULL, NULL, NULL, N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (22, N'SR09A194', NULL, NULL, NULL, N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (23, N'JS01A133', NULL, NULL, NULL, N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (24, N'KIPR0201', NULL, NULL, NULL, N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (1024, N'KIBH0101', NULL, NULL, NULL, N'Y', CAST(N'2017-01-06 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (1025, N'KIPR0501', NULL, NULL, NULL, N'Y', CAST(N'2017-10-04 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (1026, N'PR05O212', NULL, NULL, NULL, N'Y', CAST(N'2017-10-10 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (1027, N'KIWN0101', NULL, NULL, NULL, N'Y', CAST(N'2017-12-19 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (2027, N'PR17088', NULL, NULL, NULL, N'Y', CAST(N'2018-01-10 11:51:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (2028, N'PR17091', NULL, NULL, NULL, N'Y', CAST(N'2018-01-10 11:51:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (2029, N'KIPR1601', NULL, NULL, NULL, N'Y', CAST(N'2018-01-16 16:29:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (2032, N'KIPR1701', NULL, NULL, NULL, N'Y', CAST(N'2018-01-19 13:43:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (2033, N'PR16082', NULL, NULL, NULL, N'Y', CAST(N'2018-01-19 14:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (2034, N'KIPR1401', NULL, NULL, NULL, N'Y', CAST(N'2018-02-12 11:12:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[kiosk_computer] ([computer_code], [com_name], [com_asset_no], [com_mac_addr], [com_serial_no], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [kiosk_group_code]) VALUES (2035, N'IPAD001', NULL, NULL, NULL, N'Y', CAST(N'2018-03-20 00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[kiosk_computer] OFF
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10101002', N'57', N'197', CAST(N'2014-07-24 17:42:45.700' AS DateTime), N'SYSTEM', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10102001', N'59', N'1761', CAST(N'2016-12-15 19:59:05.693' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10102001', N'60', N'45569', CAST(N'2017-01-04 07:16:53.123' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10102001', N'61', N'9212', CAST(N'2018-01-03 06:27:16.460' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10102003', N'57', N'159', CAST(N'2014-07-24 12:16:07.970' AS DateTime), N'SYSTEM', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10105001', N'60', N'11491', CAST(N'2017-10-10 13:44:04.007' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10105001', N'61', N'15077', CAST(N'2018-01-03 05:58:28.347' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010G001', N'57', N'45804', CAST(N'2014-07-19 00:00:00.000' AS DateTime), N'COM1', CAST(N'2014-07-21 00:00:00.000' AS DateTime), N'COM1')
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010G001', N'58', N'260909', CAST(N'2015-01-02 06:05:00.107' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010G001', N'59', N'316956', CAST(N'2016-01-01 05:34:33.773' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010G001', N'60', N'353208', CAST(N'2017-01-02 06:32:28.793' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010G001', N'61', N'72667', CAST(N'2018-01-02 10:15:42.117' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010GO001', N'58', N'62338', CAST(N'2015-02-16 21:36:44.990' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010GO001', N'59', N'119754', CAST(N'2016-01-04 05:28:10.320' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010GO001', N'60', N'104347', CAST(N'2017-01-02 07:26:27.917' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010GO001', N'61', N'24913', CAST(N'2018-01-01 08:31:59.960' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10114001', N'61', N'136', CAST(N'2018-03-19 06:24:31.643' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10116001', N'61', N'6574', CAST(N'2018-01-19 16:10:11.290' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10117001', N'61', N'2668', CAST(N'2018-01-22 06:42:08.360' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'12701001', N'60', N'74', CAST(N'2017-12-19 20:11:24.350' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'12701001', N'61', N'353', CAST(N'2018-01-03 07:21:05.040' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1580G001', N'59', N'28129', CAST(N'2016-02-16 09:20:37.767' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1580G001', N'60', N'45996', CAST(N'2017-01-04 05:56:31.997' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1580G001', N'61', N'10259', CAST(N'2018-01-03 05:54:37.400' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'16701C001', N'60', N'20612', CAST(N'2017-01-06 19:45:48.670' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'16701C001', N'61', N'4580', CAST(N'2018-01-03 06:28:20.290' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'2010G001', N'58', N'35991', CAST(N'2015-02-12 17:48:28.500' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'2010G001', N'59', N'52066', CAST(N'2016-01-04 06:11:28.510' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'2010G001', N'60', N'58978', CAST(N'2017-01-04 05:55:10.130' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'2010G001', N'61', N'12391', CAST(N'2018-01-03 05:42:43.560' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'40105001', N'60', N'104', CAST(N'2017-10-19 10:30:05.750' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'40105001', N'61', N'116', CAST(N'2018-01-03 07:40:47.147' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'4010G001', N'57', N'2667', CAST(N'2014-08-13 17:07:13.287' AS DateTime), N'TM6493-PC', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'4010G001', N'58', N'10252', CAST(N'2015-01-04 11:20:00.903' AS DateTime), N'PR0GO148', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'4010G001', N'59', N'12799', CAST(N'2016-01-04 07:04:30.240' AS DateTime), N'PR0GO148', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'4010G001', N'60', N'12405', CAST(N'2017-01-04 06:55:58.107' AS DateTime), N'PR0GO148', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'4010G001', N'61', N'2974', CAST(N'2018-01-03 06:55:21.347' AS DateTime), N'PR0GO148', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'40116001', N'61', N'120', CAST(N'2018-01-19 16:05:50.227' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'40117001', N'61', N'377', CAST(N'2018-01-10 15:09:13.560' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'55809001', N'59', N'1971', CAST(N'2016-05-10 15:08:11.593' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'55809001', N'60', N'3044', CAST(N'2017-01-04 07:45:38.507' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_control] ([locat_code], [year], [sequence], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'55809001', N'61', N'546', CAST(N'2018-01-03 08:00:54.607' AS DateTime), N'system', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10101001', 1, N'ตึก ภปร ชั้น 1', N'Bhor Por Ror Bldg, 1st fl.', N'01', N'1', NULL, N'1', N'Y', CAST(N'2014-07-18 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10102001', 1, N'ภปร 2', N'Bhor Por Ror Bldg, 2nd fl.', N'01', N'2', NULL, N'1', N'Y', CAST(N'2014-07-18 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10105001', 1, N'ภปร 5', N'Bhor Por Ror Bldg, 5th fl.', N'01', N'5', NULL, N'8', N'Y', CAST(N'2017-10-04 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010G001', 1, N'ตึก ภปร ชั้น G', N'Bhor Por Ror Bldg, G fl.', N'01', N'G', NULL, N'1', N'Y', CAST(N'2014-04-21 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010GF001', 1, N'ตึก ภปร ชั้น G หน้าประตูซ้ายมือ
', N'Left hand side of Bhor Por Ror Bldg, G fl.', N'01', N'G', N'F', N'1', N'Y', CAST(N'2014-08-13 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010GF002', 1, N'ตึก ภปร ชั้น G หน้าประตูขวามือ
', N'Right hand side of Bhor Por Ror Bldg, G fl.', N'01', N'G', N'F', N'1', N'Y', CAST(N'2014-08-13 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010GI001', 1, N'ตึก ภปร ชั้น G ด้านในตึก  
', N'Inside Bhor Por Ror Bldg, fl.G', N'01', N'G', N'I', N'1', N'Y', CAST(N'2014-08-13 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1010GO001', 1, N'ซุ้ม SCB เก่า ข้างตึกภปร', N'Right hand side of Bhor Por Ror Bldg', N'01', N'G', N'O', N'2', N'Y', CAST(N'2015-02-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10114001', 1, N'ภปร 14', N'Bhor Por Ror Bldg, 14th fl.', N'01', N'14', NULL, N'8', N'Y', CAST(N'2018-02-12 11:10:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10116001', 1, N'ภปร 16', N'Bhor Por Ror Bldg, 16th fl.', N'01', N'16', NULL, N'8', N'Y', CAST(N'2018-01-16 16:27:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'10117001', 1, N'ภปร 17', N'Bhor Por Ror Bldg, 17th fl.', N'01', N'17', NULL, N'8', N'Y', CAST(N'2018-01-19 13:42:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'12701001', 1, N'ตึกว่องวานิช ชั้น 1', N'Wongwanich, 1st fl.', N'27', N'1', NULL, N'9', N'Y', CAST(N'2017-12-19 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'1580G001', 1, N'ตึก ส.ธ. ชั้น G', N'Sor Tor Bldg. G fl.', N'58', N'G', NULL, N'6', N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'16701C001', 1, N'โลหิตวิทยา ภูมิสิริ 1C', N'Bhumsiri Mangkhlanusorn Bldg, 1st fl. zone C', N'67', N'1', N'C', N'8', N'Y', CAST(N'2017-01-06 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'2010G001', 2, N'ตึก ภปร ชั้น G หน้าช่อง 16-19', N'Counter 16-18 Of Bhor Por Ror Bldg, G fl.', N'01', N'G', NULL, N'1', N'Y', CAST(N'2015-02-12 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'40105001', 4, N'ภปร ชั้น 5', NULL, N'01', N'5', NULL, N'8', N'Y', CAST(N'2017-10-10 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'4010G001', 4, N'เคาเตอร์พยาบาลคัดกรอง', N'Screening Nurse Counter', N'01', N'G', NULL, N'1', N'Y', CAST(N'2014-08-13 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'40116001', 4, N'ภปร 16', N'Bhor Por Ror Bldg, 16th fl.', N'01', N'16', NULL, N'8', N'Y', CAST(N'2018-01-19 13:57:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'40117001', 4, N'ภปร 17', N'Bhor Por Ror Bldg, 17th fl.', N'01', N'17', NULL, N'8', N'Y', CAST(N'2018-01-10 11:49:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'55809001', 5, N'เคาเตอร์ลงทะเบียน ฝ่ายเวชศาสตร์ฟื้นฟู ส.ธ.', N'Rehabilitation Counter', N'58', N'9', NULL, N'7', N'Y', CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_locat] ([locat_code], [locat_type_code], [locat_name], [locat_name_en], [building_code], [floor], [zone], [kiosk_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'6010G001', 6, N'พยาบาลคัดแยกอาการตรวจสอบอาการด้วย ipad', NULL, N'01', N'G', NULL, N'10', N'Y', CAST(N'2018-03-20 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[kiosk_transdetail_appoint] ON 

INSERT [dbo].[kiosk_transdetail_appoint] ([transdetail_appoint_seq], [slip_seq], [appoint_date], [appoint_time_start], [appoint_time_end], [appoint_clinic_code], [appoint_clinic_name], [appoint_clinic_location], [appoint_doctor_code], [appoint_doctor_name], [make_appoint_date], [make_appoint_time], [appoint_status_code], [appoint_status_name], [appoint_right_group_code], [appoint_right_group_name], [appoint_right_code], [appoint_right_name], [appoint_contact_type], [appoint_right_cont_code], [appoint_right_cont_name], [appoint_right_start_date], [appoint_right_e_date], [appoint_right_ref_no], [flag_first_clinic_contact], [flag_expire], [flag_pay], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (778155, 1664968, CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'13:30:00' AS Time), CAST(N'14:30:00' AS Time), N'2701101', N'คลินิกรังสีรักษา (ตึกว่องฯ 1)', N'ตึกว่องวานิช ชั้น 1', N'814', N'ผศ.นพ.ชลเกียรติ ขอประเสริฐ', CAST(N'2017-01-10 00:00:00.000' AS DateTime), CAST(N'13:22:00' AS Time), N'1', N'ลงทะเบียนตรวจรักษาแล้ว', N'20', N'ประกันสุขภาพถ้วนหน้า', N'0024', N'ประกันสุขภาพถ้วนหน้า 302', NULL, N'10690', N'โรงพยาบาลพระนารายณ์มหาราช', CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), N'575937', N'Y', NULL, NULL, CAST(N'2018-03-20 10:20:06.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transdetail_appoint] ([transdetail_appoint_seq], [slip_seq], [appoint_date], [appoint_time_start], [appoint_time_end], [appoint_clinic_code], [appoint_clinic_name], [appoint_clinic_location], [appoint_doctor_code], [appoint_doctor_name], [make_appoint_date], [make_appoint_time], [appoint_status_code], [appoint_status_name], [appoint_right_group_code], [appoint_right_group_name], [appoint_right_code], [appoint_right_name], [appoint_contact_type], [appoint_right_cont_code], [appoint_right_cont_name], [appoint_right_start_date], [appoint_right_e_date], [appoint_right_ref_no], [flag_first_clinic_contact], [flag_expire], [flag_pay], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (778156, 1664969, CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), N'2701101', N'คลินิกรังสีรักษา', N'ตึกว่องวานิช ชั้น 1', N'7863', N'พญ.เมธินี ตั้งนันทวิวัฒน์', CAST(N'2017-07-04 00:00:00.000' AS DateTime), CAST(N'14:06:00' AS Time), N'1', N'ลงทะเบียนตรวจรักษาแล้ว', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Y', NULL, N'Y', CAST(N'2018-03-20 11:54:51.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transdetail_appoint] ([transdetail_appoint_seq], [slip_seq], [appoint_date], [appoint_time_start], [appoint_time_end], [appoint_clinic_code], [appoint_clinic_name], [appoint_clinic_location], [appoint_doctor_code], [appoint_doctor_name], [make_appoint_date], [make_appoint_time], [appoint_status_code], [appoint_status_name], [appoint_right_group_code], [appoint_right_group_name], [appoint_right_code], [appoint_right_name], [appoint_contact_type], [appoint_right_cont_code], [appoint_right_cont_name], [appoint_right_start_date], [appoint_right_e_date], [appoint_right_ref_no], [flag_first_clinic_contact], [flag_expire], [flag_pay], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (778157, 1664970, CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time), N'102101', N'ผิวหนังทั่วไป', N'ตึกภปร. ชั้น 2', N'9746', N'พญ.ญาดา สุพรรณคง', CAST(N'2017-05-29 00:00:00.000' AS DateTime), CAST(N'14:32:00' AS Time), N'1', N'ลงทะเบียนตรวจรักษาแล้ว', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Y', NULL, N'Y', CAST(N'2018-03-20 12:18:34.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transdetail_appoint] ([transdetail_appoint_seq], [slip_seq], [appoint_date], [appoint_time_start], [appoint_time_end], [appoint_clinic_code], [appoint_clinic_name], [appoint_clinic_location], [appoint_doctor_code], [appoint_doctor_name], [make_appoint_date], [make_appoint_time], [appoint_status_code], [appoint_status_name], [appoint_right_group_code], [appoint_right_group_name], [appoint_right_code], [appoint_right_name], [appoint_contact_type], [appoint_right_cont_code], [appoint_right_cont_name], [appoint_right_start_date], [appoint_right_e_date], [appoint_right_ref_no], [flag_first_clinic_contact], [flag_expire], [flag_pay], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (778158, 1664970, CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'13:00:00' AS Time), CAST(N'13:15:00' AS Time), N'110102', N'ฝังเข็ม', N'ตึกภปร. ชั้น 10', N'893', N'นพ.จักรพงษ์ เสาธงทอง', CAST(N'2017-06-19 00:00:00.000' AS DateTime), CAST(N'07:52:00' AS Time), N'1', N'ลงทะเบียนตรวจรักษาแล้ว', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Y', CAST(N'2018-03-20 12:18:34.000' AS DateTime), N'KIPR0G01', NULL, NULL)
SET IDENTITY_INSERT [dbo].[kiosk_transdetail_appoint] OFF
SET IDENTITY_INSERT [dbo].[kiosk_transdetail_clinic_choose] ON 

INSERT [dbo].[kiosk_transdetail_clinic_choose] ([transdetail_clinic_choose_seq], [slip_seq], [clinic_seq], [clinic_code], [clinic_name], [clinic_location], [clinic_desc], [clinic_type], [flag_clinic_open], [flag_clinic_quota_full], [flag_is_quota_full], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (477819, 1664975, 6, N'0', N'อื่นๆ', N'-', N'คลินิกอื่นๆ  พบพยาบาลคัดแยกอาการ', N'2', N'Y', N'N', N'1', CAST(N'2018-03-20 17:46:03.907' AS DateTime), N'KIPR0G07', NULL, NULL)
INSERT [dbo].[kiosk_transdetail_clinic_choose] ([transdetail_clinic_choose_seq], [slip_seq], [clinic_seq], [clinic_code], [clinic_name], [clinic_location], [clinic_desc], [clinic_type], [flag_clinic_open], [flag_clinic_quota_full], [flag_is_quota_full], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (477820, 1664976, 1, N'010201', N'ผิวหนังทั่วไป', N'ตึก ภปร ชั้น2', N'ผิวหนังทั่วไป (อายุ 15 ปี ขึ้นไป)', N'1', N'Y', N'Y', N'1', CAST(N'2018-03-20 18:33:18.990' AS DateTime), N'KIPR0G07', NULL, NULL)
SET IDENTITY_INSERT [dbo].[kiosk_transdetail_clinic_choose] OFF
SET IDENTITY_INSERT [dbo].[kiosk_transdetail_MissAppoint] ON 

INSERT [dbo].[kiosk_transdetail_MissAppoint] ([transdetail_missappoint_seq], [slip_seq], [missappoint_date], [missappoint_time_start], [missappoint_time_end], [missappoint_clinic_code], [missappoint_clinic_name], [missappoint_clinic_location], [missappoint_doctor_code], [missappoint_doctor_name], [make_appoint_date], [make_appoint_time], [missappoint_status_code], [missappoint_status_name], [missappoint_right_group_code], [missappoint_right_group_name], [missappoint_right_code], [missappoint_right_name], [missappoint_contact_type], [missappoint_right_cont_code], [missappoint_right_cont_name], [missappoint_right_start_date], [missappoint_right_e_date], [missappoint_right_ref_no], [flag_first_clinic_contact], [flag_expire], [flag_pay], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (5904, 1664978, CAST(N'2018-01-12 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'6701301', N'โลหิตวิทยา ภูมิสิริ 1C', N'อาคารภูมิสิริ ชั้น 1', NULL, NULL, NULL, NULL, NULL, NULL, N'30', N'ประกันสังคม', N'7002', N'ประกันสังคม 2', NULL, N'15049', N'โรงพยาบาลสิรินธร', CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), N'0612/4468', N'Y', NULL, NULL, CAST(N'2018-03-20 08:32:49.000' AS DateTime), N'KIPR0G01', NULL, NULL)
SET IDENTITY_INSERT [dbo].[kiosk_transdetail_MissAppoint] OFF
SET IDENTITY_INSERT [dbo].[kiosk_transdetail_right] ON 

INSERT [dbo].[kiosk_transdetail_right] ([transdetail_right_seq], [slip_seq], [right_group_code], [right_group_name], [right_code], [right_name], [contact_type], [right_cont_code], [right_cont_name], [right_start_date], [right_e_date], [right_last_date], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [right_type_code]) VALUES (1, 1664968, N'20', N'ประกันสุขภาพถ้วนหน้า', N'0024', N'ประกันสุขภาพถ้วนหน้า 302', N'UCS', N'10690', N'โรงพยาบาลพระนารายณ์มหาราช', CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 10:20:06.000' AS DateTime), N'KIPR0G01', NULL, NULL, N'01')
INSERT [dbo].[kiosk_transdetail_right] ([transdetail_right_seq], [slip_seq], [right_group_code], [right_group_name], [right_code], [right_name], [contact_type], [right_cont_code], [right_cont_name], [right_start_date], [right_e_date], [right_last_date], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [right_type_code]) VALUES (2, 1664969, N'20', N'ประกันสุขภาพถ้วนหน้า', N'0024', N'ประกันสุขภาพถ้วนหน้า 302', N'UCS', N'10753', N'โรงพยาบาลชุมชนบางพลี', CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 11:54:51.000' AS DateTime), N'KIPR0G01', NULL, NULL, N'01')
INSERT [dbo].[kiosk_transdetail_right] ([transdetail_right_seq], [slip_seq], [right_group_code], [right_group_name], [right_code], [right_name], [contact_type], [right_cont_code], [right_cont_name], [right_start_date], [right_e_date], [right_last_date], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [right_type_code]) VALUES (3, 1664975, N'40', N'กรมบัญชีกลาง', N'1202', N'ข้าราชการเบิกจ่ายตรง', N'OFC', N'1670', N'สวัสดิการข้าราชการเบิกจ่ายตรง', CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 17:46:03.000' AS DateTime), N'KIPR0G07', NULL, NULL, N'')
INSERT [dbo].[kiosk_transdetail_right] ([transdetail_right_seq], [slip_seq], [right_group_code], [right_group_name], [right_code], [right_name], [contact_type], [right_cont_code], [right_cont_name], [right_start_date], [right_e_date], [right_last_date], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [right_type_code]) VALUES (4, 1664978, N'30', N'ประกันสังคม', N'7002', N'ประกันสังคม 2', N'SSS', N'15049', N'โรงพยาบาลสิรินธร', CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 08:32:49.000' AS DateTime), N'KIPR0G01', NULL, NULL, N'')
INSERT [dbo].[kiosk_transdetail_right] ([transdetail_right_seq], [slip_seq], [right_group_code], [right_group_name], [right_code], [right_name], [contact_type], [right_cont_code], [right_cont_name], [right_start_date], [right_e_date], [right_last_date], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by], [right_type_code]) VALUES (5, 1664979, N'20', N'ประกันสุขภาพถ้วนหน้า', N'0024', N'ประกันสุขภาพถ้วนหน้า 302', N'UCS', N'28005', N'โรงพยาบาลเมืองพัทยา', CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 12:06:20.000' AS DateTime), N'KIPR0G01', NULL, NULL, N'01')
SET IDENTITY_INSERT [dbo].[kiosk_transdetail_right] OFF
SET IDENTITY_INSERT [dbo].[kiosk_transhead] ON 

INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664968, N'1010G0016100017246', N'Q', N'3  ', N'1', CAST(N'2018-03-20 10:20:06.093' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'10:19:50' AS Time), CAST(N'10:20:06' AS Time), 2245117, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001001', 7, N'1', N'I', N'3160101260991', N'57009531', N'นายเพ็ญ จีนเฮง', CAST(N'1951-11-16 00:00:00.000' AS DateTime), NULL, N'40', N'1025301010', N'หน่วยเวชระเบียนผู้ป่วยนอก', CAST(N'2017-07-31 03:07:00.000' AS DateTime), N'J0002', N'N', N'W', NULL, NULL, N'3', NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 10:20:06.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664969, N'1010G0016100017247', N'Q', N'5  ', N'1', CAST(N'2018-03-20 11:54:51.427' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'11:53:16' AS Time), CAST(N'11:54:51' AS Time), 2245118, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001001', 7, N'1', N'I', N'3110300057028', N'38003493', N'น.ส.ปทิดา เชาว์โชติ', CAST(N'1958-12-19 00:00:00.000' AS DateTime), NULL, N'40', N'1025301010', N'หน่วยเวชระเบียนผู้ป่วยนอก', CAST(N'2017-11-24 06:11:00.000' AS DateTime), N'J0003', N'N', N'W', NULL, NULL, N'3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 11:54:51.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664970, N'1010G0016100017248', N'Q', N'14 ', N'1', CAST(N'2018-03-20 12:18:34.040' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'12:17:38' AS Time), CAST(N'12:18:34' AS Time), 2245123, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001001', 7, N'1', N'I', N'3460500653641', N'57000012', N'นายใหม สิงค์ขันธ์', CAST(N'1961-08-01 00:00:00.000' AS DateTime), NULL, N'40', N'1025301010', N'หน่วยเวชระเบียนผู้ป่วยนอก', CAST(N'2017-12-19 05:12:00.000' AS DateTime), N'J0004', N'N', N'W', NULL, NULL, N'1', NULL, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 12:18:34.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664971, N'1010G0016100017249', N'Q', N'2  ', N'1', CAST(N'2018-03-20 15:58:53.890' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'15:58:50' AS Time), CAST(N'15:58:53' AS Time), 2245128, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001001', 7, N'1', N'I', N'3830100213119', N'52113781', N'นายชลิต ชัชเวช', CAST(N'1962-04-02 00:00:00.000' AS DateTime), NULL, N'35', N'1029905004', N'จุด Scan แฟ้ม ภปร ชั้น 7', CAST(N'2018-03-20 03:03:00.000' AS DateTime), N'A0005', N'N', N'W', NULL, NULL, N'1', NULL, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 15:58:53.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664972, N'1010G0016100017250', N'Q', N'2  ', N'1', CAST(N'2018-03-20 16:40:50.920' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'16:40:34' AS Time), CAST(N'16:40:50' AS Time), 2245131, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001001', 7, N'1', N'I', N'1100600278015', N'61010418', N'น.ส.ศุภากร ชูเผ่าพันธุ์', CAST(N'1993-09-16 00:00:00.000' AS DateTime), NULL, N'35', N'1029905003', N'จุด Scan แฟ้ม ภปร ชั้น 1', CAST(N'2018-03-20 04:03:00.000' AS DateTime), N'A0006', N'N', N'W', NULL, NULL, N'1', NULL, NULL, N'4 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 16:40:50.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664973, N'1010G0016100017251', N'Q', N'2  ', N'1', CAST(N'2018-03-20 17:12:23.453' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'17:12:12' AS Time), CAST(N'17:12:23' AS Time), 2245132, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001001', 7, N'1', N'I', N'3250200707429', N'49099786', N'น.ส.อำนวย ประสาททอง', CAST(N'1959-04-26 00:00:00.000' AS DateTime), NULL, N'35', N'1029905006', N'จุด Scan แฟ้ม ภปร ชั้น 12', CAST(N'2018-03-20 05:03:00.000' AS DateTime), N'A0007', N'N', N'W', NULL, NULL, N'1', NULL, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 17:12:23.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664974, N'1010G0016100017252', N'Q', N'2  ', N'2', CAST(N'2018-03-20 17:32:04.850' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'17:31:59' AS Time), CAST(N'17:32:04' AS Time), 2245133, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001001', 7, N'1', N'I', N'3101200986516', N'57307611', N'นายสุชาติ โพสิทธิ์วิญญู', CAST(N'1953-07-12 00:00:00.000' AS DateTime), NULL, N'35', N'1029905006', N'จุด Scan แฟ้ม ภปร ชั้น 12', CAST(N'2018-03-20 05:03:00.000' AS DateTime), N'B0001', N'N', N'W', NULL, NULL, N'1', NULL, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 17:32:04.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664975, N'1010G0016100017253', N'Q', N'17 ', N'2', CAST(N'2018-03-20 17:46:03.857' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'17:45:35' AS Time), CAST(N'17:46:03' AS Time), 2245136, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001004', 19, N'2', N'I', N'3360400610428', N'48027907', N'นายมงคล ลีลา', CAST(N'1957-12-03 00:00:00.000' AS DateTime), NULL, N'40', N'1025301010', N'หน่วยเวชระเบียนผู้ป่วยนอก', CAST(N'2017-11-24 05:11:00.000' AS DateTime), N'B0002', N'N', N'W', NULL, NULL, N'2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'N', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 17:46:03.000' AS DateTime), N'KIPR0G07', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664976, N'1010G0016100017254', N'Q', N'17 ', N'2', CAST(N'2018-03-20 18:33:18.990' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'18:32:31' AS Time), CAST(N'18:33:18' AS Time), 2245138, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001004', 19, N'2', N'I', N'3101700919842', N'54081250', N'นางพิชญ์สินี อภิธนทรัพย์', CAST(N'1950-06-10 00:00:00.000' AS DateTime), NULL, N'10', N'101101', N'อายุรกรรมทั่วไป', CAST(N'2018-03-20 06:03:00.000' AS DateTime), N'B0003', N'N', N'W', NULL, NULL, N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 18:33:18.000' AS DateTime), N'KIPR0G07', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664977, N'1010G0016100017255', N'Q', N'1  ', N'1', CAST(N'2018-03-20 08:32:10.417' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'08:32:08' AS Time), CAST(N'08:32:10' AS Time), 2245144, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001001', 7, N'1', N'I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'A0008', N'N', N'W', NULL, NULL, NULL, NULL, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 08:32:10.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664978, N'1010G0016100017256', N'Q', N'6  ', N'1', CAST(N'2018-03-20 08:32:49.123' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'08:32:30' AS Time), CAST(N'08:32:49' AS Time), 2245145, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001001', 7, N'1', N'I', N'3460100179615', N'59025816', N'นายประยง การรัตน์', CAST(N'1966-01-08 00:00:00.000' AS DateTime), NULL, N'40', N'1025301010', N'หน่วยเวชระเบียนผู้ป่วยนอก', CAST(N'2017-11-24 05:11:00.000' AS DateTime), N'A0009', N'N', N'W', NULL, NULL, N'4', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 08:32:49.000' AS DateTime), N'KIPR0G01', NULL, NULL)
INSERT [dbo].[kiosk_transhead] ([slip_seq], [slip_no], [slip_type], [slip_type_detail], [slip_type_flag], [slip_dtm], [register_date], [register_time], [out_time], [client_log_seq], [building_code], [floor], [zone], [locat_code], [locat_name], [com_code], [computer_code], [kiosk_group_code], [time_type], [idcard_no], [hn_no], [pateint_name], [pateint_dob], [patient_file_location_type], [patient_file_location_status], [patient_file_location_code], [patient_file_location_name], [patient_file_asof], [queue_no], [flag_queue], [queue_status], [waiting_qno], [time_gen_waiting_qno], [pateint_flag], [pateint_service_flag], [flag_change_right], [flag_choose_right], [flag_lab_xray], [flag_remark_right], [flag_remark_right_group2], [flag_general_pateint], [flag_nosend_approve], [flag_have_right_approved], [flag_dct_ins_treatment_order], [q_channel_group_id], [q_period_no], [flag_print_q_report], [print_q_report_last_dttm], [print_result], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1664979, N'1010G0016100017257', N'Q', N'8  ', N'1', CAST(N'2018-03-20 12:06:20.770' AS DateTime), CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'12:06:05' AS Time), CAST(N'12:06:20' AS Time), 2245147, N'01', N'G', NULL, N'1010G001', N'ตึก ภปร ชั้น G', N'1010G001001', 7, N'1', N'I', N'3209600248241', N'50119001', N'นางประเสริฐ กำจร', CAST(N'1943-06-09 00:00:00.000' AS DateTime), NULL, N'40', N'1025301010', N'หน่วยเวชระเบียนผู้ป่วยนอก', CAST(N'2017-09-06 04:09:00.000' AS DateTime), N'A0010', N'N', N'W', NULL, NULL, N'2', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-20 12:06:20.000' AS DateTime), N'KIPR0G01', NULL, NULL)
SET IDENTITY_INSERT [dbo].[kiosk_transhead] OFF
INSERT [dbo].[kiosk_user] ([username], [password], [name], [surname], [email_addr], [mobilephone_no], [user_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'admin', N'Z+VOFzYASuY=', N'admin', N'test', NULL, NULL, 1, N'Y', CAST(N'2014-04-21 11:18:05.983' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user] ([username], [password], [name], [surname], [email_addr], [mobilephone_no], [user_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'info05', N'MuuYWSZniNs=', N'information', N'-', NULL, NULL, 1, N'Y', CAST(N'2014-09-23 11:18:05.983' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user] ([username], [password], [name], [surname], [email_addr], [mobilephone_no], [user_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'ipad01', N'Z+VOFzYASuY=', N'nurse', N'nurse', NULL, NULL, 6, N'Y', CAST(N'2018-03-19 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user] ([username], [password], [name], [surname], [email_addr], [mobilephone_no], [user_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'opd', N'xy8s2Tlb+zM=', N'OPD', N'-', NULL, NULL, 4, N'Y', CAST(N'2017-10-18 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user] ([username], [password], [name], [surname], [email_addr], [mobilephone_no], [user_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'opd17', N'xy8s2Tlb+zM=', N'OPD', N'-', NULL, NULL, 5, N'Y', CAST(N'2018-01-10 13:06:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user] ([username], [password], [name], [surname], [email_addr], [mobilephone_no], [user_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'rm0101', N'Z+VOFzYASuY=', N'rm0101', N'-', NULL, NULL, 3, N'Y', CAST(N'2016-06-01 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user] ([username], [password], [name], [surname], [email_addr], [mobilephone_no], [user_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'rm0104', N'Z+VOFzYASuY=', N'rm0104', N'-', NULL, NULL, 3, N'Y', CAST(N'2016-06-01 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user] ([username], [password], [name], [surname], [email_addr], [mobilephone_no], [user_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'test_print', N'Z+VOFzYASuY=', N'test_print', N'test', N'ninna_nao_o@hotmail.com', NULL, 2, N'Y', CAST(N'2014-09-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user] ([username], [password], [name], [surname], [email_addr], [mobilephone_no], [user_group_code], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (N'test_print2', N'Z+VOFzYASuY=', N'test_print2', N'test', N'jantima.c@loxbitpa.com', NULL, 2, N'Y', CAST(N'2014-09-16 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[kiosk_user_group] ON 

INSERT [dbo].[kiosk_user_group] ([user_group_code], [user_group_name], [user_group_desc], [building_code], [location_floor], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (1, N'admin', N'admin', N'58', N'9', N'Y', CAST(N'2014-04-21 11:18:01.820' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user_group] ([user_group_code], [user_group_name], [user_group_desc], [building_code], [location_floor], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (2, N'printer_alert', N'กลุ่มผู้ที่จะถูกแจ้งเตือนเมื่อกระดาษหมด', NULL, NULL, N'Y', CAST(N'2014-09-12 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user_group] ([user_group_code], [user_group_name], [user_group_desc], [building_code], [location_floor], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (3, N'rehab_st', N'เจ้าหน้าที่เวชศาสตร์ฟื้นฟูอาคารส.ธ.', N'58', N'9', N'Y', CAST(N'2016-06-01 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user_group] ([user_group_code], [user_group_name], [user_group_desc], [building_code], [location_floor], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (4, N'visit_clinic', N'เจ้าหน้าที่ออกเลขที่ติดต่อ', N'01', N'5', N'Y', CAST(N'2017-10-18 00:00:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user_group] ([user_group_code], [user_group_name], [user_group_desc], [building_code], [location_floor], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (5, N'visit_clinic', N'เจ้าหน้าที่ออกเลขที่ติดต่อ', N'01', N'17', N'Y', CAST(N'2018-01-10 13:05:00.000' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[kiosk_user_group] ([user_group_code], [user_group_name], [user_group_desc], [building_code], [location_floor], [active_flag], [crtd_dttm], [crtd_by], [last_chg_dttm], [last_chg_by]) VALUES (6, N'nurse_ipad', N'พยาบาลคัดแยกอาการ iPad', N'01', N'G', N'Y', CAST(N'2018-01-19 10:00:00.000' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[kiosk_user_group] OFF
ALTER TABLE [dbo].[kiosk_com]  WITH CHECK ADD  CONSTRAINT [FK_kiosk_com_kiosk_locat] FOREIGN KEY([locat_code])
REFERENCES [dbo].[kiosk_locat] ([locat_code])
GO
ALTER TABLE [dbo].[kiosk_com] CHECK CONSTRAINT [FK_kiosk_com_kiosk_locat]
GO
ALTER TABLE [dbo].[kiosk_locat]  WITH CHECK ADD  CONSTRAINT [FK_KIOSK_LO_REF_20_KIOSK_BU] FOREIGN KEY([building_code])
REFERENCES [dbo].[kiosk_building] ([building_code])
GO
ALTER TABLE [dbo].[kiosk_locat] CHECK CONSTRAINT [FK_KIOSK_LO_REF_20_KIOSK_BU]
GO
ALTER TABLE [dbo].[kiosk_user]  WITH CHECK ADD  CONSTRAINT [FK_KIOSK_US_REF_12_KIOSK_US] FOREIGN KEY([user_group_code])
REFERENCES [dbo].[kiosk_user_group] ([user_group_code])
GO
ALTER TABLE [dbo].[kiosk_user] CHECK CONSTRAINT [FK_KIOSK_US_REF_12_KIOSK_US]
GO
/****** Object:  StoredProcedure [dbo].[q_expr_ins_kiosk_map_qexpress_ipad]    Script Date: 3/5/2561 1:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[q_expr_ins_kiosk_map_qexpress_ipad]
	-- Add the parameters for the stored procedure here
	@slipSeq_Express INT
	, @queue_no_Express NVARCHAR(5)
	, @slipSeq_Q INT
	, @queue_no_q NVARCHAR(5)
	, @active_flag CHAR(1)
	, @crtd_by NVARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here

	DECLARE @slip_no_qexpress NVARCHAR(25)	
	DECLARE @slip_no_q NVARCHAR(25)		

	-- select slip_no ของคิวเร่งด่วน

	SELECT @slip_no_qexpress = 	slip_no  
		  FROM [dbo].kiosk_transhead
		  WHERE slip_seq =  @slipSeq_Express
	
	-- select slip_no ของคิวปกติ

	SELECT @slip_no_q = slip_no 
		  FROM [dbo].kiosk_transhead
		  WHERE slip_seq =  @slipSeq_Q 
	
	
	INSERT INTO kiosk_map_qexpress
	(
		slip_no_qexpress
		, queue_no_qexpress
		, slip_no_q
		, queue_no_q
		, trans_dtm
		, active_flag
		, crtd_dttm
		, crtd_by
	)
	VALUES
	(
		@slip_no_qexpress
		, @queue_no_Express
		, @slip_no_q
		, @queue_no_q
		, GETDATE()
		, @active_flag
		, GETDATE()
		, @crtd_by
	)
	

END






GO
/****** Object:  StoredProcedure [dbo].[q_expr_ins_kiosk_qExpress_log_ipad]    Script Date: 3/5/2561 1:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[q_expr_ins_kiosk_qExpress_log_ipad] 
	-- Add the parameters for the stored procedure here
	
	@queue_no NVARCHAR(5)
	, @flag_queue CHAR(1)
	, @q_action char(1)
	, @crtd_by NVARCHAR(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO kiosk_q_log
	(
		q_trans_dtm
		, queue_no
		, flag_queue
		, q_action
		, crtd_dttm
		, crtd_by
	)
	VALUES
	(
		GETDATE()
		, @queue_no
		, @flag_queue
		, @q_action
		, GETDATE()
		, @crtd_by
	)
END




GO
/****** Object:  StoredProcedure [dbo].[q_expr_ins_kiosk_transdetail_right]    Script Date: 3/5/2561 1:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[q_expr_ins_kiosk_transdetail_right] 
	-- Add the parameters for the stored procedure here
	@slip_seq INT
	, @right_group_code NVARCHAR(50)
	, @right_group_name NVARCHAR(100)
	, @right_code NVARCHAR(50)
	, @right_name NVARCHAR(100)
	, @contact_type NVARCHAR(10)
	, @right_cont_code NVARCHAR(50)
	, @right_cont_name NVARCHAR(100)
	, @right_start_date DATETIME = NULL
	, @right_e_date DATETIME = NULL
	, @right_last_date DATETIME = NULL
	, @crtd_by NVARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO kiosk_transdetail_right
	(
		slip_seq
		, right_group_code
		, right_group_name
		, right_code
		, right_name
		, contact_type
		, right_cont_code
		, right_cont_name
		, right_start_date
		, right_e_date
		, right_last_date
		, crtd_dttm
		, crtd_by
	)
	VALUES
	(
		@slip_seq
		, @right_group_code
		, @right_group_name
		, @right_code
		, @right_name
		, @contact_type
		, @right_cont_code
		, @right_cont_name
		, @right_start_date
		, @right_e_date
		, @right_last_date
		, GETDATE()
		, @crtd_by
	)

END





GO
/****** Object:  StoredProcedure [dbo].[q_expr_ins_kiosk_transhead_ipad]    Script Date: 3/5/2561 1:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[q_expr_ins_kiosk_transhead_ipad] 
	-- Add the parameters for the stored procedure here
	@slip_type CHAR(1)
	, @slip_type_detail CHAR(2)
	, @slip_type_flag CHAR(1)
	, @register_date datetime
    , @register_time time(7)
    , @out_time time(7)
	, @building_code NVARCHAR(5)
	, @floor NVARCHAR(2)
	, @zone NVARCHAR(2)
	, @locat_code NVARCHAR(15)
	, @locat_name NVARCHAR(50)
	, @com_code NVARCHAR(12)
	, @computer_code INT
	, @computer_name NVARCHAR(50)
	, @kiosk_group_code NVARCHAR(20)
	, @time_type CHAR(1)
	, @idcard_no NVARCHAR(20)
	, @hn_no NVARCHAR(20)
	, @pateint_name NVARCHAR(100)
	, @pateint_dob DATETIME = NULL
	, @patient_file_location_type NVARCHAR(10)
	, @patient_file_location_code NVARCHAR(10)
	, @patient_file_location_name NVARCHAR(100)
	, @patient_file_asof DATETIME = NULL
	, @queue_no NVARCHAR(5)
	, @flag_queue CHAR(1)
	, @queue_status CHAR(1)
	, @pateint_flag CHAR(1)
	, @flag_change_right CHAR(1)
	, @flag_choose_right CHAR(1)
	, @flag_remark_right CHAR(1)
	, @print_result NVARCHAR(MAX)
	, @crtd_by NVARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE @CurrentYear INT			-- ปีปัจจุบัน
	DECLARE @MaxYearOfLocatCode INT		-- ปีที่มากที่สุดของ locat_code ไม่สนใจปี
	DECLARE @MaxSequenceOfLocatCode INT	-- ลำดับที่มากที่สุดของ locat_code ไม่สนใจปี

	DECLARE @SequenceNo INT

	SELECT @CurrentYear = DATEPART(YY, GETDATE())
	IF @CurrentYear <= 2500
		SET @CurrentYear = @CurrentYear + 543

	SET @CurrentYear = @CurrentYear % 100

	SELECT 
		@MaxYearOfLocatCode = [year] 
	  , @MaxSequenceOfLocatCode = [sequence]
	FROM 
		kiosk_control 
	WHERE 
		locat_code = @locat_code 
		AND [year] = (SELECT  MAX([year]) 
					  FROM kiosk_control 
					  WHERE locat_code = @locat_code ) 

	-- กรณีไม่พบปีที่มากที่สุดและลำดับที่มากที่สุดของ locat_code
	-- แสดงว่าเพิ่มเครื่องมาใหม่
	IF @MaxYearOfLocatCode IS NULL AND @MaxSequenceOfLocatCode IS NULL
	BEGIN
		INSERT INTO kiosk_control(locat_code, [year], sequence, crtd_dttm, crtd_by) 
		VALUES(@locat_code, @CurrentYear, 1, GETDATE(), @computer_name)

		SET @SequenceNo = 1
	END
	ELSE
	-- กรณีพบปีที่มากที่สุดและลำดับที่มากที่สุดของ locat_code
	-- แยกออกได้สองกรณี
	--		1. กรณีปีปัจจุบัน = ปีที่มากที่สุด ต้องทำการปรับปรุงแถว
	--		2. กรณีปีปัจจุบัน > ปีที่มากที่สุด ต้องทำการเพิ่มแถว
	BEGIN
		IF @MaxYearOfLocatCode = @CurrentYear
		BEGIN
			SET @MaxSequenceOfLocatCode = @MaxSequenceOfLocatCode + 1

			UPDATE kiosk_control 
			SET sequence = @MaxSequenceOfLocatCode 
			WHERE locat_code = @locat_code AND [year] = @CurrentYear

			SET @SequenceNo = @MaxSequenceOfLocatCode
		END
		ELSE IF @CurrentYear > @MaxYearOfLocatCode
		BEGIN
			INSERT INTO kiosk_control(locat_code, [year], sequence, crtd_dttm, crtd_by) 
			VALUES(@locat_code, @CurrentYear, 1, GETDATE(), @computer_name)

			SET @SequenceNo = 1
		END 
	END

	INSERT INTO kiosk_transhead
	(
		slip_no
		, slip_type
		, slip_type_detail
		, slip_type_flag
		, slip_dtm
		, register_date
		, register_time
		, out_time
		, building_code
		, [floor]
		, zone 
		, locat_code
		, locat_name
		, com_code
		, computer_code
		, kiosk_group_code
		, time_type
		, idcard_no
		, hn_no
		, pateint_name
		, pateint_dob
		, patient_file_location_type
		, patient_file_location_code
		, patient_file_location_name
		, patient_file_asof
		, queue_no
		, flag_queue
		, queue_status
		, pateint_flag
		, flag_change_right
		, flag_choose_right
		, flag_remark_right
		, print_result
		, crtd_dttm
		, crtd_by
	)
	VALUES
	(
		@locat_code + CAST(@CurrentYear AS NVARCHAR(2)) + RIGHT('00000000' + CONVERT(NVARCHAR(8), @SequenceNo), 8)
		, @slip_type
		, @slip_type_detail
		, @slip_type_flag
		, GETDATE()
		, @register_date 
		, @register_time 
		, @out_time 
		, @building_code
		, @floor
		, @zone
		, @locat_code
		, @locat_name
		, @com_code
		, @computer_code
		, @kiosk_group_code
		, @time_type
		, @idcard_no
		, @hn_no
		, @pateint_name
		, @pateint_dob
		, @patient_file_location_type
		, @patient_file_location_code
		, @patient_file_location_name
		, @patient_file_asof
		, @queue_no
		, @flag_queue
		, @queue_status
		, @pateint_flag
		, @flag_change_right
		, @flag_choose_right
		, @flag_remark_right
		, @print_result
		, GETDATE()
		, @crtd_by
	)

	SELECT @@IDENTITY
END





GO
/****** Object:  StoredProcedure [dbo].[q_expr_sel_kiosk_com_cat_ipad]    Script Date: 3/5/2561 1:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[q_expr_sel_kiosk_com_cat_ipad] 
	-- Add the parameters for the stored procedure here
	@computer_name NVARCHAR(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		C.building_code 
		, C.[floor]
		, C.zone
		, C.locat_code
		, C.locat_name
		, B.com_code
		, B.computer_code
		, B.kiosk_group_code
	FROM 
		kiosk_computer A, kiosk_com B, kiosk_locat C
	WHERE 
		A.com_name			= @computer_name 
		AND A.computer_code = B.computer_code
		AND B.locat_code	= C.locat_code
END





GO
/****** Object:  StoredProcedure [dbo].[q_expr_sel_kiosk_trans_all_ipad]    Script Date: 3/5/2561 1:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[q_expr_sel_kiosk_trans_all_ipad] 
	-- Add the parameters for the stored procedure here
	@hn_no NVARCHAR(20)			= NULL
	, @queue_no NVARCHAR(20)	= NULL
	, @cur_date NVARCHAR(10)
	, @missappoint_month_not_exceed INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	-- กรณีกรอกเฉพาะหมายเลข HN

	IF ISNULL(@hn_no, '') <> '' AND ISNULL(@queue_no,'') = ''
	BEGIN
	
		SELECT 

			-- ตารางหลักใช้เป็นตารางตั้งต้น

			kh.slip_seq
			, kh.hn_no
			, kh.queue_no
			, CONVERT(VARCHAR(8), kh.slip_dtm, 108) AS slip_dtm_time
			, CAST(kh.slip_dtm AS DATE) AS slip_dtm_date
			, kh.slip_type_flag
			, kh.flag_choose_right

			-- ตารางสิทธิ 

			, CASE WHEN (kr.slip_seq IS NULL) AND (kh.flag_general_pateint = 'Y') THEN 'ผู้ป่วยทั่วไป' 
			       WHEN kr.slip_seq IS NOT NULL THEN kr.right_name + ' ' + kr.right_cont_name 
				   END AS right_fullname 

			-- ตารางรายการนัดหมาย
			
			, ka.transdetail_appoint_seq
			, ka.appoint_date
			, ka.appoint_time_start
			, ka.appoint_time_end
			, ka.appoint_clinic_name
			, ka.appoint_clinic_location
			
			-- ตารางผิดนัดหมาย
			
			, km.transdetail_missappoint_seq
			, km.missappoint_date
			, km.missappoint_time_start
			, km.missappoint_time_end
			, km.missappoint_clinic_name 
			, km.missappoint_clinic_location
			
			-- ตารางวอล์คอินตู้เหลืองที่มีการระบุคลินิกที่ต้องการเข้าตรวจ
			
			, kc.transdetail_clinic_choose_seq
			, kc.clinic_desc
			, kc.flag_clinic_quota_full		-- โควต้าคลินิกเต็ม หรือไม่ เต็ม = 'Y' ไม่เต็ม = 'N'
		FROM
			kiosk_transhead kh 
			LEFT OUTER JOIN kiosk_transdetail_appoint ka ON kh.slip_seq = ka.slip_seq
			LEFT OUTER JOIN kiosk_transdetail_missAppoint km ON (kh.slip_seq = km.slip_seq AND DATEDIFF(MM, CAST(km.missappoint_date as DATE), @cur_date) <= @missappoint_month_not_exceed)
			LEFT OUTER JOIN kiosk_transdetail_clinic_choose kc ON kh.slip_seq = kc.slip_seq
			LEFT OUTER JOIN kiosk_transdetail_right kr ON kh.slip_seq = kr.slip_seq
		WHERE
			CAST(kh.slip_dtm AS DATE) 	= @cur_date
			AND kh.flag_queue			= 'N'
			AND kh.queue_status			= 'W'
			AND kh.slip_type			= 'Q'
			AND kh.hn_no				= @hn_no
			
	END
	
	-- กรณีกรอกเฉพาะหมายเลขคิว 

	ELSE IF ISNULL(@queue_no, '') <> '' AND ISNULL(@hn_no, '') = ''
	BEGIN

		SELECT 

			-- ตารางหลักใช้เป็นตารางตั้งต้น

			kh.slip_seq
			, kh.hn_no
			, kh.queue_no
			, CONVERT(VARCHAR(8), kh.slip_dtm, 108) AS slip_dtm_time
			, CAST(kh.slip_dtm AS DATE) AS slip_dtm_date
			, kh.slip_type_flag
			, kh.flag_choose_right

			-- ตารางสิทธิ 

			, CASE WHEN (kr.slip_seq IS NULL) AND (kh.flag_general_pateint = 'Y') THEN 'ผู้ป่วยทั่วไป' 
			       WHEN kr.slip_seq IS NOT NULL THEN kr.right_name + ' ' + kr.right_cont_name 
				   END AS right_fullname 

			-- ตารางรายการนัดหมาย
			
			, ka.transdetail_appoint_seq
			, ka.appoint_date
			, ka.appoint_time_start
			, ka.appoint_time_end
			, ka.appoint_clinic_name
			, ka.appoint_clinic_location
			
			-- ตารางผิดนัดหมาย
			
			, km.transdetail_missappoint_seq
			, km.missappoint_date
			, km.missappoint_time_start
			, km.missappoint_time_end
			, km.missappoint_clinic_name 
			, km.missappoint_clinic_location
			
			-- ตารางวอล์คอินตู้เหลืองที่มีการระบุคลินิกที่ต้องการเข้าตรวจ
			
			, kc.transdetail_clinic_choose_seq
			, kc.clinic_desc
			, kc.flag_clinic_quota_full		-- โควต้าคลินิกเต็ม หรือไม่ เต็ม = 'Y' ไม่เต็ม = 'N'
		FROM
			kiosk_transhead kh 
			LEFT OUTER JOIN kiosk_transdetail_appoint ka ON kh.slip_seq = ka.slip_seq
			LEFT OUTER JOIN kiosk_transdetail_missAppoint km ON (kh.slip_seq = km.slip_seq AND DATEDIFF(MM, CAST(km.missappoint_date as DATE), @cur_date) <= @missappoint_month_not_exceed)
			LEFT OUTER JOIN kiosk_transdetail_clinic_choose kc ON kh.slip_seq = kc.slip_seq
			LEFT OUTER JOIN kiosk_transdetail_right kr ON kh.slip_seq = kr.slip_seq
		WHERE
			CAST(kh.slip_dtm AS DATE)	= @cur_date
			AND kh.flag_queue			= 'N'
			AND kh.queue_status			= 'W'
			AND kh.slip_type			= 'Q'
			AND kh.queue_no				= @queue_no

	END

	-- ผู้ใช้กรอกมาทั้งหมายเลข HN และ หมายเลขคิว

	ELSE IF ISNULL(@hn_no, '') <> '' AND ISNULL(@queue_no, '') <> ''
	BEGIN
	
		SELECT 

			-- ตารางหลักใช้เป็นตารางตั้งต้น

			kh.slip_seq
			, kh.hn_no
			, kh.queue_no
			, CONVERT(VARCHAR(8), kh.slip_dtm, 108) AS slip_dtm_time
			, CAST(kh.slip_dtm AS DATE) AS slip_dtm_date
			, kh.slip_type_flag
			, kh.flag_choose_right

			-- ตารางสิทธิ 

			, CASE WHEN (kr.slip_seq IS NULL) AND (kh.flag_general_pateint = 'Y') THEN 'ผู้ป่วยทั่วไป' 
			       WHEN kr.slip_seq IS NOT NULL THEN kr.right_name + ' ' + kr.right_cont_name 
				   END AS right_fullname 

			-- ตารางรายการนัดหมาย
			
			, ka.transdetail_appoint_seq
			, ka.appoint_date
			, ka.appoint_time_start
			, ka.appoint_time_end
			, ka.appoint_clinic_name
			, ka.appoint_clinic_location
			
			-- ตารางผิดนัดหมาย
			
			, km.transdetail_missappoint_seq
			, km.missappoint_date
			, km.missappoint_time_start
			, km.missappoint_time_end
			, km.missappoint_clinic_name 
			, km.missappoint_clinic_location
			
			-- ตารางวอล์คอินตู้เหลืองที่มีการระบุคลินิกที่ต้องการเข้าตรวจ
			
			, kc.transdetail_clinic_choose_seq
			, kc.clinic_desc
			, kc.flag_clinic_quota_full		-- โควต้าคลินิกเต็ม หรือไม่ เต็ม = 'Y' ไม่เต็ม = 'N'
		FROM
			kiosk_transhead kh 
			LEFT OUTER JOIN kiosk_transdetail_appoint ka ON kh.slip_seq = ka.slip_seq
			LEFT OUTER JOIN kiosk_transdetail_missAppoint km ON (kh.slip_seq = km.slip_seq AND DATEDIFF(MM, CAST(km.missappoint_date as DATE), @cur_date) <= @missappoint_month_not_exceed)
			LEFT OUTER JOIN kiosk_transdetail_clinic_choose kc ON kh.slip_seq = kc.slip_seq
			LEFT OUTER JOIN kiosk_transdetail_right kr ON kh.slip_seq = kr.slip_seq
		WHERE
			CAST(kh.slip_dtm AS DATE)	= @cur_date
			AND kh.flag_queue			= 'N'
			AND kh.queue_status			= 'W'
			AND kh.slip_type			= 'Q'
			AND kh.hn_no				= @hn_no
			AND kh.queue_no				= @queue_no
			
	END

END
GO
/****** Object:  StoredProcedure [dbo].[q_expr_sel_login_ipad]    Script Date: 3/5/2561 1:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[q_expr_sel_login_ipad] 
	-- Add the parameters for the stored procedure here
	@username NVARCHAR(20)
	, @password NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @login_id int;
	Declare @result nvarchar(50);

	IF (SELECT count(*)
		FROM kiosk_user
		WHERE username = @username) = 0
		SET @result = '1';
	
	IF (SELECT count(*)
		FROM kiosk_user
		WHERE username = @username) > 0
		SET @result = '2';
	
	IF (SELECT count(*)
		FROM kiosk_user
		WHERE username = @username
		AND password = @password  AND active_flag='Y') > 0
		SET @result = '3';
		
	IF (SELECT count(*)
		FROM kiosk_user
		WHERE username = @username
		AND password = @password  AND active_flag='N') > 0
		SET @result = '4';
	
	IF @result = '1'
		BEGIN
		SET @result = 'ไม่มี Username นี้ในระบบ !';
			Select @result as result;
		END
	ELSE IF @result = '2'
		BEGIN
			SET @result = 'ระบุรหัสผ่านผิด !';
			Select @result as result;
		END
	ELSE IF @result = '3'
		BEGIN
			SELECT result = 'Success'
				   ,a.*
				   ,a.name + ' ' + a.surname AS user_fullName
				   ,b.user_group_name
				   
			FROM kiosk_user as a
			LEFT JOIN kiosk_user_group as b 
				ON a.user_group_code = b.user_group_code
			WHERE a.username = @username
				  AND a.password = @password
		END
		
		ELSE IF @result = '4'
		BEGIN
			SET @result = 'Username นี้ถูกระงับใช้งาน !';
			Select @result as result;

		END
END





GO
/****** Object:  StoredProcedure [dbo].[q_expr_upd_kiosk_transhead_queue_status_ipad]    Script Date: 3/5/2561 1:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[q_expr_upd_kiosk_transhead_queue_status_ipad] 
	-- Add the parameters for the stored procedure here
	@slip_seq INT
	, @queue_status CHAR(1)
	, @last_chg_by nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	UPDATE kiosk_transhead 
	SET queue_status = @queue_status
		, last_chg_dttm = GETDATE()
		, last_chg_by = @last_chg_by
	WHERE slip_seq = @slip_seq

END





GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'action ของคิว
"W" : Wait รอเรียกคิว
"R"  : เรียกคิว
"Y"  : มารับบริการ
"N"  : ไม่มารับบริการ (รอเรียกซ้ำ)
"A"  : วนรอเรียกคิว
"B"  : เรียกคิวซ้ำ
"C"  : ยกเลิกคิว เพื่อออกคิวเร่งด่วน
"D"  : ไม่มารับบริการ (ตัดออกจากระบบ) 
"E"  : ยกเลิกคิว โดยเจ้าหน้าที่' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_q_log', @level2type=N'COLUMN',@level2name=N'q_action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ลำดับ Slip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_q_log', @level2type=N'COLUMN',@level2name=N'slip_seq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'รหัสเครื่อง kiosk' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_q_log', @level2type=N'COLUMN',@level2name=N'com_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'รหัสรายละเอียดสิทธิที่ใช้ในการออกบัตรคิว/ใบนำทาง' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'transdetail_clinic_choose_seq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ลำดับ Slip
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'slip_seq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ลำดับข้อมูลของคลินิก
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'clinic_seq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'รหัสของคลินิก' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'clinic_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ชื่อของคลินิก' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'clinic_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ตำแหน่งที่ตั้งของคลินิก
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'clinic_location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'คำอธิบายคลินิก' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'clinic_desc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ประเภทของคลินิก
"1" : คลินิกเฉพาะ
"2" : คลินิกอื่นๆ
"3" : มีใบนัดสีเขียว
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'clinic_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flag เพื่อบอกว่าคลินิกมีการออกตรวจในวันนี้หรือไม่
"Y" : มีการออกตรวจในวันนี้
"N" : งดตรวจในวันนี้' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'flag_clinic_open'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flag เพื่อบอกว่าโควต้าของคลินิกเต็มแล้ว

""Y"" : โควต้าเต็ม' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'flag_clinic_quota_full'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flag เพื่อบอกว่าเมื่อโควต้า ของคลินิกเต็ม จะให้ไปติดต่อที่คลินิกได้เลย หรือ ให้ไปติดต่อพยาบาล
"1" : ติดต่อพยาบาล
"2" : ติดต่อที่คลินิก ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'flag_is_quota_full'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'create date: วันที่ทำการสร้าง' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'crtd_dttm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'create by: ผู้ที่ทำการสร้าง' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'crtd_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'last change date: วันที่ทำการแก้ไขล่าสุด' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'last_chg_dttm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'last change by: ผู้ที่ทำการแก้ไขล่าสุด' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transdetail_clinic_choose', @level2type=N'COLUMN',@level2name=N'last_chg_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'จำนวนคิวที่รอเรียก' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transhead', @level2type=N'COLUMN',@level2name=N'waiting_qno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'เวลาที่คำนวณจำนวนคิวที่รอเรียก' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transhead', @level2type=N'COLUMN',@level2name=N'time_gen_waiting_qno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flag เพื่อบอกว่าไม่ได้ทำการส่งข้อมูลให้อนุมัติสิทธิ 
"Y" คือ ไม่ได้ทำการส่งข้อมูลให้อนุมัติสิทธิ 
NULL คือ ส่งข้อมูลให้อนุมัติสิทธิ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transhead', @level2type=N'COLUMN',@level2name=N'flag_nosend_approve'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flag เพื่อบอกว่าแพทย์มีการบันทึกคำสั่งการรักษา (treatment order) หรือยัง
"N" = ยังไม่ได้ทำการบันทึกคำสั่งการรักษา
"Y" = มีการบันทึกคำสั่งการรักษาเรียบร้อยแล้ว
"E" = มีบางนัดที่แพทย์ยังไม่ได้บันทึกคำสั่งการรักษา' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transhead', @level2type=N'COLUMN',@level2name=N'flag_dct_ins_treatment_order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'รหัสกลุ่มช่องบริการ (รหัสหมวดคิว)
(map กับ Table q_channel_group)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transhead', @level2type=N'COLUMN',@level2name=N'q_channel_group_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'รอบของแต่ละหมวดคิว เช่น 1,2,3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transhead', @level2type=N'COLUMN',@level2name=N'q_period_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flag เพื่อบอกว่ามีการพิมพ์รายงานคิวหรือยัง
"Y" = พิมพ์รายงานคิวแล้ว
NULL = ยังไม่ได้พิมพ์รายงาน' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transhead', @level2type=N'COLUMN',@level2name=N'flag_print_q_report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'เวลาที่พิมพ์รายงานคิวล่าสุด' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_transhead', @level2type=N'COLUMN',@level2name=N'print_q_report_last_dttm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'รหัสตึก' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_user_group', @level2type=N'COLUMN',@level2name=N'building_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ชั้น' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kiosk_user_group', @level2type=N'COLUMN',@level2name=N'location_floor'
GO
