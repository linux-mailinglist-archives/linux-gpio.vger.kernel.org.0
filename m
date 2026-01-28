Return-Path: <linux-gpio+bounces-31202-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO2SLjrPeWnezgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31202-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:56:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA49E829
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1073F303AB6E
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E569333B6FA;
	Wed, 28 Jan 2026 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JI8fsnuZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E97A33A9E5;
	Wed, 28 Jan 2026 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590315; cv=fail; b=r+vswa+rkYgUpn9TsvAisMwjBoN10hZFhczsccS9vYGwHg71V3iVgPoifYR4AF8/uDHNB6/M7/WD/1M5WlRxHh/A1pCHVveSMTKP8mYvMrhIMUzNoHAC3uVYOML/YirigShUjUnBpY99bg13FqTtbq1+wcny24kHf38tl+jveXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590315; c=relaxed/simple;
	bh=JLr/7x0ryc6Wr8MqolW2AdRckqwmrJaTov/tbHvu1F0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YWFElU288C5k/1uB3vOuQTMxtZVesoiu1gjR8QX7DelKuAp4lrpjOABLFkIMJ/K/DvtySRx83P046GEI3q4czNW87vrt2sPzLC5+OfiCkYqRrhULrmYAgmwJ10qoSvMqoY/BOK6n3qBGyQSlie7WQkp5ht15RfdjS5QFBAJcJRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JI8fsnuZ; arc=fail smtp.client-ip=52.101.48.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3GdZjFInflTYsyli1bGdkw/FqvpKSDnhQbc7ukL6PJBXmpXhxWppK/IH2h69nqsM9F7sMBALHtwRw9Idhz6c/721MFNZ3Vkdk5eomAX1OT9B5CnntLNCXK3MUEsr8wPHua28m1RgbPs8nYHxwNJ/sCLN6yGYwbvIVfo/s2EjaXieXeQtvBKvR/Wehvk1c1JHgxhTsqrL+nwKYpEulyHyPGP3t6BqNYuTeqav6Qyd27oMWMIc5tKATwPgSdS18LQjmGODvv2/e56nJkoJPusRMYsci/wxRzEXhaJPpVoduSemO4BbZvd3uDrN+/DTKt4y0RVCqIKOthPW3peAt6jYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLoyDC0VYvP4WYL9t85/9vRjKxvVsSyl423bnTtXAuE=;
 b=U3v3MrDeiMkePnDLKJM20091HNwC4JIagh96v8u/8VmTp7OfphEYRjo7biMfOTZ8suM3axAK1MXgJ7tcN2yLcI2W5Pc1E0F83TjRhlgPsQpC1j0egtFT2y4MgnIvWAif3OOB88FTYIB1ROLdgKsetpWGfno3oibUS8/Fc9bs4ejz9j5z0emcMR57Fm86vS1aYZ/ZWvsTkspUVaFNCWpXoSXQZUJ4FfL0hOBpXVpV1h+ZFbJvvqSJDAn1qlpkv63c7K11SyYWFq1PCUJRX8f1TMRupc/RyIqfF+mgeTnh0lr/yxaI5uNCKA3Dvja9qxem09gVO+R2zACm4VJcCTA47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLoyDC0VYvP4WYL9t85/9vRjKxvVsSyl423bnTtXAuE=;
 b=JI8fsnuZzvS+ptmrEroJXVUODYa04xDDodTW9+Jj/xqhE3SQp4PnPSN5wKwTOnB/a6yN358cCw/Py4rqET4mouYdkkQompZukAbK0PseaKMPsFNoBTEVDLuUqhNVKZnZZnONwCKM2Qrz4VWSxaV9wHoohWNxohipaEbm/NPxblwB15zGImxtziTGGCvlBxDL0sUXxAH2JYsb+Ps4lqvOU3UDIaL1iYaqN7q76i4yu754sqjb9qLGein6gkRyO8bPV6hynHa1EPffEUoKHP9LMriRZESOLEg4+13rLKA77gLy8Z3QATTHGsqKXGOyheuEiQnsKCqmbi1hpXQ/7nkYvQ==
Received: from SJ0PR03CA0356.namprd03.prod.outlook.com (2603:10b6:a03:39c::31)
 by DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 08:51:47 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::7f) by SJ0PR03CA0356.outlook.office365.com
 (2603:10b6:a03:39c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 08:51:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 08:51:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 00:51:25 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 00:51:25 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>, Thierry Reding <treding@nvidia.com>
Subject: [PATCH v5 2/3] gpio: tegra186: Add support for Tegra264
Date: Wed, 28 Jan 2026 08:51:13 +0000
Message-ID: <20260128085114.1137725-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260128085114.1137725-1-pshete@nvidia.com>
References: <20260128085114.1137725-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|DM6PR12MB4107:EE_
X-MS-Office365-Filtering-Correlation-Id: 992b8e63-1cd2-4e33-9d16-08de5e4a7853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cm9IZEpSMGRsWlNKNmNHRW4weklSc1pJc1JBR0VyRlRMR21VKzVGM3pKYklk?=
 =?utf-8?B?bUo5RlE5bng1dXUyc0NOT240Slg3dUk1d1Y0bmwrWmxkM3JMdGtFdndCenFR?=
 =?utf-8?B?YmEydFdtWDMvRXZvR3pwYzR6ZDI4dGFmc1hja1hCSXk3RUZ4TlpZZFFEZVdy?=
 =?utf-8?B?Sjd6M3VSSVdzYndIVk84WHdoRGxhSUlhdFVMOWVwdkh3VnYzUFpiVUQrWHNL?=
 =?utf-8?B?SnZ2Uk9tN3BLQ2s1VnVpaEQ0QUpHUlRnZEV0RE1pcmFGbC9VN0JtWmdqN0hv?=
 =?utf-8?B?UWtKZXBpSnVVQXJzZ0tnbW9Eb3ExUjcycjVZdnRnTmJPSWJnT0s4amVVZkdK?=
 =?utf-8?B?T3pqckNCRDNPdEY0UEFoZXE3d3Fhb3VITytteWdtcm5sVGptWG5HRFlRcVhS?=
 =?utf-8?B?NVg4STlFUFhLdHo2SUxMemRNZWQycWdvekpnbittNnUxNUZldU5WMSsyTXlv?=
 =?utf-8?B?Q3k4VFZWUG5hZjVjZUwwV3ZaTXROSXg4RTJWUVJ0RHJERXg1UURVSWduRG1o?=
 =?utf-8?B?aHR3NlAyNHRmcnJNdG1XcGJxaG9kbGc5dUoyLy8xVEZ6R0dsbkRLRmNNRzQx?=
 =?utf-8?B?WDZhSklPNjdGOUtGNmVvdXdHQWdyL3BZMXlCdGdwZGtLSXByeG1iSVRWREJC?=
 =?utf-8?B?TXdoVDJiWjlxQTNmdm41c01HVlYvRi9uQ2tGQzA2K09jVXAvMlM5UURROTRz?=
 =?utf-8?B?eW83SGRoUjBweVhISzZnVWZETVJQL1Y0YkxXdnE1RWdGV08wTWxyL01GSE11?=
 =?utf-8?B?eVhrQ3Vtak1uZjFmOS92ejRmTGsvQ2pwbnMrU0c3SDBsTlhyTG9Rb3I1VjY1?=
 =?utf-8?B?Qk1WQWNzbXE3eXI1Mm14anZNc2tlNWsvdVlGRm1jNlBOMkZtYkRGOGtxQzA5?=
 =?utf-8?B?SkE0VG51dGUwVEJaWHNxYmJEUVJyeVYrcUtqQThiZWZWMFN3NDE5L3Q0YmpL?=
 =?utf-8?B?MTgyTUtaUmV1TS9qUVVtNHQyTEp0RjNERnFsM2VNWVM0bXNISEdldDhwcW5v?=
 =?utf-8?B?Nk5UL1d3YTlOczlEUHJhK0FJRmF6REJ4VFhkQWJLVFM2QmxWeUtxemdqcHRN?=
 =?utf-8?B?eWR1UFhXTUVoUHc4Mk5YMndNeEp5REVpYVJmNURaeW5BSGYwcXlocUNpNTVv?=
 =?utf-8?B?alErOFlpNm9oK2JVRkdNaDc5Q2xsQ1VEb1NEUEpiN2VOMjFnMElKYlRUODBT?=
 =?utf-8?B?SmJVSTdBdi9MeFVGU29JVkFMNENCRU05bHdJWGtTa3FSeUVsNHcwRDR4R3Nl?=
 =?utf-8?B?bVVxMDBnelNxSEZqNkpGVUJmb1F2TG1mSE95VzNVcU9PZUtXc2poUG9SaTF6?=
 =?utf-8?B?OFo4VDJnYm5LOHJ3dGVVVlhaeXhHQklCMVNVeTNSSEQxaytwYjFqSnlxVVlL?=
 =?utf-8?B?SzJtdkVXNkh0cHJPSFpETEhyTGdJeG4xbWdJSVpkQ0N0YjNsNUxueExERldM?=
 =?utf-8?B?SGVMd09IWk9nSlFXeUtpQ2xOQk1DV3Z2akp2Q2gwc0RPVktJdlpNYTl1UEI1?=
 =?utf-8?B?UGdYQ2RlNFRoWFZ5bUpSUEo2R3VUanJmQnRwc3NaVGM0aXFia3V5TE56SnBU?=
 =?utf-8?B?eUJoU1NTS2FHNW9hcmhlUllhUXFVamxza0NtMGduTmI0b1JCNGdYb0xrVzQx?=
 =?utf-8?B?RUhKK0dHMy9hSHpJcGV1STJkR3dRQXJHR0xhWllYclJNK0NndjBUNXRuNnVt?=
 =?utf-8?B?SUNoR0wvUWlhRkpvbmdGOHE3bWVUZHdtT3JIWVl5eEdYcStQdGlWSFRGSzhF?=
 =?utf-8?B?Zm45TmJ2V2xFS1c3eklFdDhxNjRPU0JQKzBSVXZjZnE1Mkt6MkZOdWxsZDJM?=
 =?utf-8?B?emFkUzJZMm1HR1VwQXdYUkJRd3I2Q3hTZS9NZDk0SXNQa01yOHJneHRzL1Ny?=
 =?utf-8?B?UlFFM3B1WW8yZHFrYWI0Wlg1TElKYXg1NHE1TkZOYXZHVm84KzdST1FkTlI5?=
 =?utf-8?B?WXVvbEUwN0pMeWk2RFVIWHh2d2VVSDh6Q29TUWJTUXNOWjR4T3dTSmRFUjJF?=
 =?utf-8?B?NGV0akJPdnZCaWVzSWVuUlU3bHNrcDRPL05hRkdGZDhvaFNGK0NOVm9tYUtw?=
 =?utf-8?B?RmpiWlUvY3dYVlhnK0pwYVZNaDFScC8ycU1pZGRXNkhLcTc0clM5QTM0ajRU?=
 =?utf-8?B?cmFVZm1ubjRKM2Zlcm84b0dKOXRUdmhQUUg0WWl1MFhXS2cwVUg1MjlDMGlO?=
 =?utf-8?B?NDRwWHI2a3RBT3lxbUxMM0xud3JsVmQrRHQzMGN4MGdVL1Vzb1NTS3pCa2pq?=
 =?utf-8?Q?KI0igd+Zo1PNkAcZwF5JcSbVIVpbKg9vMI8q9QA7T0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:51:47.1099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 992b8e63-1cd2-4e33-9d16-08de5e4a7853
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31202-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4CDA49E829
X-Rspamd-Action: no action

Extend the existing Tegra186 GPIO controller driver with support for the
GPIO controller found on Tegra264.

Use the "wakeup-parent" phandle from the GPIO device tree node to
ensure the GPIO driver associates with the intended PMC device.
Relying only on compatible-based lookup can select an unexpected
PMC node, so fall back to compatible-based lookup when the phandle
is not present.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
  * Use “wakeup-parent” instead of "nvidia,pmc" and include the renamed header.
---
 drivers/gpio/gpio-tegra186.c | 90 +++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index b1498b59a921..9c874f07be75 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2025 NVIDIA Corporation
+ * Copyright (c) 2016-2026 NVIDIA Corporation
  *
  * Author: Thierry Reding <treding@nvidia.com>
  *	   Dipen Patel <dpatel@nvidia.com>
@@ -21,6 +21,7 @@
 #include <dt-bindings/gpio/tegra234-gpio.h>
 #include <dt-bindings/gpio/tegra241-gpio.h>
 #include <dt-bindings/gpio/tegra256-gpio.h>
+#include <dt-bindings/gpio/nvidia,tegra264-gpio.h>
 
 /* security registers */
 #define TEGRA186_GPIO_CTL_SCR 0x0c
@@ -1001,7 +1002,9 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	if (gpio->soc->num_irqs_per_bank > 1)
 		tegra186_gpio_init_route_mapping(gpio);
 
-	np = of_find_matching_node(NULL, tegra186_pmc_of_match);
+	np = of_parse_phandle(pdev->dev.of_node, "wakeup-parent", 0);
+	if (!np)
+		np = of_find_matching_node(NULL, tegra186_pmc_of_match);
 	if (np) {
 		if (of_device_is_available(np)) {
 			irq->parent_domain = irq_find_host(np);
@@ -1277,6 +1280,80 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
 	.has_vm_support = false,
 };
 
+#define TEGRA264_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA264_MAIN, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra264_main_ports[] = {
+	TEGRA264_MAIN_GPIO_PORT(F, 3, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(G, 3, 1, 5),
+	TEGRA264_MAIN_GPIO_PORT(H, 1, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(J, 1, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(K, 1, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(L, 1, 3, 8),
+	TEGRA264_MAIN_GPIO_PORT(M, 1, 4, 6),
+	TEGRA264_MAIN_GPIO_PORT(P, 2, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(Q, 2, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(R, 2, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(S, 2, 3, 2),
+	TEGRA264_MAIN_GPIO_PORT(T, 0, 0, 7),
+	TEGRA264_MAIN_GPIO_PORT(U, 0, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(V, 0, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(W, 0, 3, 8),
+	TEGRA264_MAIN_GPIO_PORT(X, 0, 7, 6),
+	TEGRA264_MAIN_GPIO_PORT(Y, 0, 5, 8),
+	TEGRA264_MAIN_GPIO_PORT(Z, 0, 6, 8),
+	TEGRA264_MAIN_GPIO_PORT(AL, 0, 4, 3),
+};
+
+static const struct tegra_gpio_soc tegra264_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra264_main_ports),
+	.ports = tegra264_main_ports,
+	.name = "tegra264-gpio",
+	.instance = 0,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
+#define TEGRA264_AON_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA264_AON, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra264_aon_ports[] = {
+	TEGRA264_AON_GPIO_PORT(AA, 0, 0, 8),
+	TEGRA264_AON_GPIO_PORT(BB, 0, 1, 2),
+	TEGRA264_AON_GPIO_PORT(CC, 0, 2, 8),
+	TEGRA264_AON_GPIO_PORT(DD, 0, 3, 8),
+	TEGRA264_AON_GPIO_PORT(EE, 0, 4, 4)
+};
+
+static const struct tegra_gpio_soc tegra264_aon_soc = {
+	.num_ports = ARRAY_SIZE(tegra264_aon_ports),
+	.ports = tegra264_aon_ports,
+	.name = "tegra264-gpio-aon",
+	.instance = 1,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
+#define TEGRA264_UPHY_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA264_UPHY, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra264_uphy_ports[] = {
+	TEGRA264_UPHY_GPIO_PORT(A, 0, 0, 6),
+	TEGRA264_UPHY_GPIO_PORT(B, 0, 1, 8),
+	TEGRA264_UPHY_GPIO_PORT(C, 0, 2, 3),
+	TEGRA264_UPHY_GPIO_PORT(D, 1, 0, 8),
+	TEGRA264_UPHY_GPIO_PORT(E, 1, 1, 4),
+};
+
+static const struct tegra_gpio_soc tegra264_uphy_soc = {
+	.num_ports = ARRAY_SIZE(tegra264_uphy_ports),
+	.ports = tegra264_uphy_ports,
+	.name = "tegra264-gpio-uphy",
+	.instance = 2,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
 #define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
 	TEGRA_GPIO_PORT(TEGRA256_MAIN, _name, _bank, _port, _pins)
 
@@ -1368,6 +1445,15 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 	}, {
 		.compatible = "nvidia,tegra256-gpio",
 		.data = &tegra256_main_soc
+	}, {
+		.compatible = "nvidia,tegra264-gpio",
+		.data = &tegra264_main_soc
+	}, {
+		.compatible = "nvidia,tegra264-gpio-aon",
+		.data = &tegra264_aon_soc
+	}, {
+		.compatible = "nvidia,tegra264-gpio-uphy",
+		.data = &tegra264_uphy_soc
 	}, {
 		/* sentinel */
 	}
-- 
2.17.1


