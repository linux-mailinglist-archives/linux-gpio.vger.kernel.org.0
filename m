Return-Path: <linux-gpio+bounces-28133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ACAC36947
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 17:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00A8B64596C
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 15:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D135D337689;
	Wed,  5 Nov 2025 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p+Qqx0KP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD81329E5F;
	Wed,  5 Nov 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357621; cv=fail; b=QDlp4QnVfYd0tva7vRH5wbPZNM1+0mbj/a+q9Qy4XWa0ZL3/T6GdOvd/2EZRosNZSgvmSSdN3Lsg32Upank9AA5+qXZ9sbHH2pEUlAKYVxlqWCz3gxgUcuw8qGvhJDRST25KeougPUd4bQWXhwAC0kYip6swhDxL3qfY9eUEV5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357621; c=relaxed/simple;
	bh=NTqOQygnukthA3KL+4SB45n4QoPqVd51Gd5bMK/9bik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rTmcHlC1//J15n4g4kilOukctZNyRY6kNQaObpQgPxR6qzBzjqGaO/J3LmlXH40lQ+nMUx6OpTereZbkd04Ku3twWaS+n0zO4BQmfeycclqCE3zQh1M0i/h+A1YlfMs4qPAn/VKNSeAsuAhDJ5/kh/QR7Fr9LxrU099esSSv4CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=p+Qqx0KP; arc=fail smtp.client-ip=52.101.61.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZ6rXMf38gpJ7jYL76gfcvxUmAdbwwM3U6W4BQjNjTJ9mdV+aQVwxHQyNMAe6KL7pRnfsoHOUeJnGZOFqxu3h0TFKzA/D1xn53rBeGHviMqV2nHHRYAuTGAhXUZmRMrbNp0E5Ob026TTxaFmu4dgfq+p97EGY0/kvBTReQX2Mk49cOUnRx5NE9sT70dJVMQgabT3yLgBfvTtHhgC8ZLV4sziroZm6WzRgj+vCos5T1SPPr/alAt3OOupdnR3Q+AmwEfVut+jEecz7vN88bu6fmQptT5VmQ+eNi30wb87re3D8B8l+j8s2VO5PIcwnAI5VPm4wXMLf2E4KGHpTxLpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RGMKkeGUerYzxjCm3t4fw9v887ybDOXxM9GwTSMsDk=;
 b=I2jXKDKNkQjwZR/ZzfSXzJ9dWaZIlk4sZBaCJWVVo+3IVc7RUgBJ4JlMpEpuGxVsIHVkDIKYQc1nvavU00Ed2aiepCoKKB9ds7oykeUkLW5DR4kUcM/YNSH3CeSXfGLe5xSjMfu2UtHJRsgi4sjsFtyOCOuQVJVfe2vUKtRZlb2/CRY9f/2cEzbtW6Q5oxAIbZeHdCZwMKSIvojoGz4IdH50nzjQ+iih48DEnxrCrXbnSJTXAvgpdbZqgSdIB8bJgGoIhg6haUapa8akjf4N+2G4uDMET2v73Or3CKKTsMJYD8wNx3FgpxaKwFhxpgyRGtELLdU3NNwIK683K43UCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=atomide.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RGMKkeGUerYzxjCm3t4fw9v887ybDOXxM9GwTSMsDk=;
 b=p+Qqx0KPcMaaf1ua69zpkXG9dwIQD31FEry3dhMlcucajZ67XL8mjG3e9NdUIZixePrVxHjIsj9GX43LHwAq6AO7u1dY4za88ikuqoaTRRIoRtKXjsBSeZowMv7najvLyB3QZFq/lvb+2hy70ytXDM293bu6HDlylZIC68N7bnY=
Received: from BN0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:408:e6::18)
 by SA1PR10MB7587.namprd10.prod.outlook.com (2603:10b6:806:376::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 15:46:55 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::3a) by BN0PR03CA0013.outlook.office365.com
 (2603:10b6:408:e6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Wed,
 5 Nov 2025 15:46:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 15:46:55 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:46:46 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:46:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 09:46:46 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5FkkP93944730;
	Wed, 5 Nov 2025 09:46:46 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Wed, 5 Nov 2025 09:46:44 -0600
Subject: [PATCH v8 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251105-am62lx-v8-3-496f353e8237@ti.com>
References: <20251105-am62lx-v8-0-496f353e8237@ti.com>
In-Reply-To: <20251105-am62lx-v8-0-496f353e8237@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>, Dhruva Gole
	<d-gole@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11139; i=bb@ti.com;
 h=from:subject:message-id; bh=kRB4n8ZB3vzlNeyqj+cyqnpPJBwcgK/grGc7PCDfZyY=;
 b=owNCWmg5MUFZJlNZVnNccgAAc/////9vzn9rOf3t02OX//8/u83m+Q6+2Ft73wve3P34/u6wA
 RtqYg0D1AyAABoAAGjQGhoAeoGjI0Bo0NDEDQaB6TQHqDRoDQGm1Gn6o2KHqeoG1DoABoaADIGQ
 DEDQzImRo000A0DJkNAPU00aG1AMmCADIaNGmJo2iA0DTTId6o2oZNBo0PUGjIBkAeo0ZDTJoNN
 PU2kDQAAAZAxAAaZDQ0aNAMmgZA0AybUCCFKJNTwQEsd9hb3iYleEMT6FtjZRVMSwlVCdxeHIU8
 +wcXJBB7y7YAegTGets4TTrmLuCxik2GznmqT9AHU2D3qF1UbYIzH17gBJmz56fCxGdIfcNfkDA
 WZiAk6qMXW6ZFJMV5WSnh2AmmDkl3wLsMndTiSsVytAcS9pPqwZtmQbNMIeDk0kPuzmw9J1OqJA
 q2AhGQ/t9amBXiAimV+5yGytE+0WLo44dxIbwiKDTmlCuDUfZeYLl8ypIjgjoBncUcKYWB86mQj
 CEhA0e4U6nuaZpoCiyaj7/yj8R89kBfjH0RjiL+wpP8MsiCJZqI9HweBoQsNo3bHIv4sy26H2N4
 OOYnKQhFRSso87/UIBiv2B07IzezaqvbXrll5Xg0efDgMpYHGHjauNtHQhJw8HpHn9d7xccEf81
 E6hXUwQ/+LuSKcKEgrOa45A
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|SA1PR10MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 15952726-ebfc-41c7-a225-08de1c828beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TElyeDFQWHdmVGZqTmFNTVE1VkdQSDF3NjZtQktvc21DNFpjZ3U0TGtZRXdY?=
 =?utf-8?B?OTBxYVQzdC8zRnFBdU9ZYVQvYnl2U2g3NzlhSzRWRTU2Vis3eWxUZCtZZ2ll?=
 =?utf-8?B?eWRWQXJ3ZWFLZTBCNWJaQjRaTFFKSXpKbWFyWVZIb2RDcWx0bUw0L243cmtr?=
 =?utf-8?B?c0s3SGI1WTM5clZMY2E5RmRuV1Q0cjhSUzhPekxxQ1I1bUMwSG4xbjVDOGtB?=
 =?utf-8?B?bWRpcFFzVmlvUDZuK2FucThpaUdIZlVnM0d0QVVkQ1RRUGpYSWduNWUzT1hp?=
 =?utf-8?B?eWZnMWpYd2E1UkRCUGhNVnJSckNMYjRWNktVYThIOHdBNndaVG01RUg3QURU?=
 =?utf-8?B?TStpWm4raDhuUmhoUFZFbGZXb2ZlSnZsRVcrTHBLSy9ENFlJNHB0MmpaSUF1?=
 =?utf-8?B?WWF2dW9aNkhSMEVZekRGWldGYk9YeWJySG1qVkJac1lackpEQ2lPeHJkTW9w?=
 =?utf-8?B?RGh4V0dpc3hEVXRrNWpQUEFnSVkwQllicWl0NTZwOTgrWEVnT1huNSs4ZmR5?=
 =?utf-8?B?R1B2R2lMcmU3T1RMY1g5eGVRckhyM0RKOUlRRHNoaXMrUVQrK1RScnBXNW5h?=
 =?utf-8?B?SVkrblppWmp4b1U4dVlrSVVvQ0dSdDBVb3ZHaFcveVBBSEdudmI0dldOWmQv?=
 =?utf-8?B?c2VHOXRYakhxVzIranhzRGtYbSs1S2oycFF4SHptSSsyV3k1cG1WRFgvZjV5?=
 =?utf-8?B?K3czTFNNdFFQdEZ3cTFtbXlHV1FLSHZQS096cTkrdGp5Nld4MlY0cGtPNDZI?=
 =?utf-8?B?bnhCT29YbVhTbVV0cW5uUU5md1p5UEtieVc0SVJxNHdTUWhSNWQ2SlhoNnlH?=
 =?utf-8?B?dUdTWTdNNUs5aTdJUHRkL2FxMDNud1lnWFJaRWNmS0lLbkUxVmNaTjBITnFT?=
 =?utf-8?B?VTdhU2xBQXNiSGhVUUxWTzBSbmMyTlR5TTdaUE0rM3pXRkRUWmhHSW5wWXY1?=
 =?utf-8?B?Um85YnpDb29BdUgzd3hGUHFHZ0oxQlV4MHlaSU84S2w0a252cWpESXFjSkxB?=
 =?utf-8?B?bmNmUHp4U1RTQ3ZzRG54ZHZkTlZhNmZ4THRCYW0xWXoxTTBBbHdKeVp6amFJ?=
 =?utf-8?B?cG41dk1YY1RNT1BoTW9DRnd0Z0tQRmNzMmxMZHdQcmsyVDFkMDNNUmJhMGpn?=
 =?utf-8?B?cDgvOGE2L1RNdDUwa1RKZTN5WmxDTDJTbDJNU2ZVcU1sckkyYnRLRUpWRGVk?=
 =?utf-8?B?QXpKaFNGSWoyQ0tibVpYMVJJWXpab3NvYWUzZTRTS2tmRU0yRlJROER4cTJt?=
 =?utf-8?B?dFppTlFqdXhUeG8yL3ZRbVEzcWZGTTBXVGRNdDR1VWEwbnVYRFVwdXc0YmNW?=
 =?utf-8?B?VmNOL1FEVHdnaitmSUp6cStzZ3lyN21GU283SlcvTVEwelZYb2VzdzlBaE9J?=
 =?utf-8?B?SUFZREdpcVorU2tVaTQxeVZ2cU9Qdk1na09ZNjQvMWVhMWJhbnJFb0VOMGh0?=
 =?utf-8?B?NzlMc0o0Mi9ZaTlyZFZRMzBVdHBFdE5vZk5pS3VIbGpibEZYbEJWbHh0cmdM?=
 =?utf-8?B?QVlNaGhLM1N6S3NCT29wZ09PZnBPYTZlZlJEeGFZY0F2blNoeHBVaTBIRTJx?=
 =?utf-8?B?YjJWMS9qMUpuY0JpSTZYMU44RU8zTDZodDlYcXNudVBKcW1MRE5vaTM5SU00?=
 =?utf-8?B?TW55L2JEN1VKMXFKejNXN2t0K2Ryc1JreVM4TC9NMDJhamV0ZkR6cHdLaHRM?=
 =?utf-8?B?OUU5YkJoYzNhVzJ0eDVWeUQya3lTWFBDRVlWRkVlZHNTQ0ZHSVF3WVNkN3Qv?=
 =?utf-8?B?c1pMZXlqZDVGQlJtOU9ueExIa0d2NWxZSXYwOTNURmRNK3dUSFVwN09vdnpo?=
 =?utf-8?B?RzY3TkVHTk5zVU1jQzJIQXNDZ3VKYWNrNlVxODFXdDREaWVHdG9Vbzg4eXhr?=
 =?utf-8?B?Y0sxdWs5dkpUaHRzVzM0QllDRytmclBCNWU2MVRGQmZzL05HeXIvZGlkblJp?=
 =?utf-8?B?U0tlUDBRbVE5YUZQUFhIOXg1b3JzOURXQjhyU2g0b1lTMDFTbkRTRjVvN1Rh?=
 =?utf-8?B?KzV5MjVDMVAyOUVCTUx0Vm1XWTNxNmsrRkFOZmpXeFBGVW9reEMrRVh2Z1ZT?=
 =?utf-8?Q?A0ged8?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:46:55.0760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15952726-ebfc-41c7-a225-08de1c828beb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7587

From: Vignesh Raghavendra <vigneshr@ti.com>

Add the initial board file for the AM62L3's Evaluation Module.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes from v1:
 - switched to non-direct links so TRM updates are automatic
 - removed current-speed property from main_uart0
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected main_uart0 pinmux

Changes from v2:
 - alphabetized phandles
 - corrected macros and node names for main_uart0 pinmux node

Changes from v3:
 - added and enabled more nodes that have been validated
 - added link to data sheet which is now public

Changes from v4:
 - Corrected Copyright year

Changes from v6:
 - moved thermal-zones{} into the k3-am62l3-evm.dts to allow other
   boards to selec whichever trip points they wish

Changes from v7:
 - enabled &i2c0 to access the eeprom on the board
---
 arch/arm64/boot/dts/ti/Makefile          |   3 +
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 362 +++++++++++++++++++++++++++++++
 2 files changed, 365 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 361248dcfff42a27f07cea6bca31461f8dc25b92..386ab1e91bcc3463e2d0618919da1ec3ce314bf2 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -37,6 +37,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
 # Boards with AM62Dx SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
 
+# Boards with AM62Lx SoCs
+dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
+
 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
new file mode 100644
index 0000000000000000000000000000000000000000..34c24b368d9e88cd94a7426cd1524f096e9c43c9
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L3 Evaluation Module
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
+ * Data Sheet: https://www.ti.com/lit/pdf/sprspa1
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/thermal/thermal.h>
+#include "k3-am62l3.dtsi"
+#include "k3-pinctrl.h"
+
+
+/ {
+	compatible = "ti,am62l3-evm", "ti,am62l3";
+	model = "Texas Instruments AM62L3 Evaluation Module";
+
+	chosen {
+		stdout-path = &uart0;
+	};
+
+	memory@80000000 {
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-all;
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usr_button_pins_default>;
+
+		usr: button-usr {
+			label = "User Key";
+			linux,code = <BTN_0>;
+			gpios = <&gpio0 90 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usr_led_pins_default>;
+
+		led-0 {
+			label = "am62-sk:green:heartbeat";
+			gpios = <&gpio0 123 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			default-state = "on";
+		};
+	};
+
+	thermal-zones {
+		wkup0-thermal {
+			polling-delay-passive = <250>;	/* milliSeconds */
+			polling-delay = <500>;		/* milliSeconds */
+			thermal-sensors = <&vtm0 0>;
+
+			trips {
+				crit0 {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
+	vmain_pd: regulator-0 {
+		/* TPS65988 PD CONTROLLER OUTPUT */
+		compatible = "regulator-fixed";
+		regulator-name = "vmain_pd";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vcc_3v3_sys: regulator-1 {
+		/* output of LM61460-Q1 */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vmain_pd>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_mmc1: regulator-2 {
+		/* TPS22918DBVR */
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_mmc1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		vin-supply = <&vcc_3v3_sys>;
+		gpio = <&exp1 3 GPIO_ACTIVE_HIGH>;
+		bootph-all;
+	};
+
+	vcc_1v8: regulator-3 {
+		/* output of TPS6282518DMQ */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&gpio0 {
+	bootph-all;
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	eeprom@51 {
+		/* AT24C512C-MAHM-T or M24512-DFMC6TG */
+		compatible = "atmel,24c512";
+		reg = <0x51>;
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins_default>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	exp1: gpio@22 {
+		compatible = "ti,tca6424";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "", "",
+				  "UART1_FET_SEL", "MMC1_SD_EN",
+				  "VPP_LDO_EN", "EXP_PS_3V3_EN",
+				  "UART1_FET_BUF_EN", "", "",
+				  "", "DSI_GPIO0", "DSI_GPIO1",
+				  "", "BT_UART_WAKE_SOC_3V3",
+				  "USB_TYPEA_OC_INDICATION", "",
+				  "", "WLAN_ALERTn", "", "",
+				  "HDMI_INTn", "TEST_GPIO2",
+				  "MCASP0_FET_EN", "MCASP0_BUF_BT_EN",
+				  "MCASP0_FET_SEL", "DSI_EDID",
+				  "PD_I2C_IRQ", "IO_EXP_TEST_LED";
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <91 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio0_ioexp_intr_pins_default>;
+		bootph-all;
+	};
+
+	exp2: gpio@23 {
+		compatible = "ti,tca6424";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "BT_EN_SOC", "VOUT0_FET_SEL0",
+				  "", "",
+				  "", "",
+				  "", "",
+				  "WL_LT_EN", "EXP_PS_5V0_EN",
+				  "TP45", "TP48",
+				  "TP46", "TP49",
+				  "TP47", "TP50",
+				  "GPIO_QSPI_NAND_RSTn", "GPIO_HDMI_RSTn",
+				  "GPIO_CPSW1_RST", "GPIO_CPSW2_RST",
+				  "", "GPIO_AUD_RSTn",
+				  "GPIO_eMMC_RSTn", "SoC_WLAN_SDIO_RST";
+		bootph-all;
+	};
+
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	typec_pd0: tps658x@3f {
+		compatible = "ti,tps6598x";
+		reg = <0x3f>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			self-powered;
+			data-role = "dual";
+			power-role = "sink";
+
+			port {
+				usb_con_hs: endpoint {
+					remote-endpoint = <&usb0_hs_ep>;
+				};
+			};
+		};
+	};
+};
+
+&pmx0 {
+	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
+		>;
+		bootph-all;
+	};
+
+	i2c0_pins_default: i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01cc, PIN_INPUT_PULLUP, 0) /* (B7) I2C0_SCL */
+			AM62LX_IOPAD(0x01d0, PIN_INPUT_PULLUP, 0) /* (A7) I2C0_SDA */
+		>;
+		bootph-all;
+	};
+
+	i2c1_pins_default: i2c1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01d4, PIN_INPUT_PULLUP, 0) /* (D7) I2C1_SCL */
+			AM62LX_IOPAD(0x01d8, PIN_INPUT_PULLUP, 0) /* (A6) I2C1_SDA */
+		>;
+		bootph-all;
+	};
+
+	i2c2_pins_default: i2c2-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01dc, PIN_INPUT_PULLUP, 0) /* (B8) I2C2_SCL */
+			AM62LX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D8) I2C2_SDA */
+		>;
+	};
+
+	mmc0_pins_default: mmc0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (D2) MMC0_CMD */
+			AM62LX_IOPAD(0x020c, PIN_OUTPUT, 0) /* (B2) MMC0_CLK */
+			AM62LX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (D3) MMC0_DAT0 */
+			AM62LX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (D4) MMC0_DAT1 */
+			AM62LX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (C1) MMC0_DAT2 */
+			AM62LX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (C2) MMC0_DAT3 */
+			AM62LX_IOPAD(0x01f8, PIN_INPUT_PULLUP, 0) /* (C4) MMC0_DAT4 */
+			AM62LX_IOPAD(0x01f4, PIN_INPUT_PULLUP, 0) /* (B3) MMC0_DAT5 */
+			AM62LX_IOPAD(0x01f0, PIN_INPUT_PULLUP, 0) /* (A3) MMC0_DAT6 */
+			AM62LX_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (B4) MMC0_DAT7 */
+		>;
+		bootph-all;
+	};
+
+	mmc1_pins_default: mmc1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0230, PIN_INPUT, 0) /* (Y3) MMC1_CMD */
+			AM62LX_IOPAD(0x0228, PIN_OUTPUT, 0) /* (Y2) MMC1_CLK */
+			AM62LX_IOPAD(0x0224, PIN_INPUT, 0) /* (AA1) MMC1_DAT0 */
+			AM62LX_IOPAD(0x0220, PIN_INPUT_PULLUP, 0) /* (Y4) MMC1_DAT1 */
+			AM62LX_IOPAD(0x021c, PIN_INPUT_PULLUP, 0) /* (AA2) MMC1_DAT2 */
+			AM62LX_IOPAD(0x0218, PIN_INPUT_PULLUP, 0) /* (AB2) MMC1_DAT3 */
+			AM62LX_IOPAD(0x0234, PIN_INPUT, 0) /* (B6) MMC1_SDCD */
+		>;
+		bootph-all;
+	};
+
+	uart0_pins_default: uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b4, PIN_INPUT, 0) /* (D13) UART0_RXD */
+			AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	usb1_default_pins: usb1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0248, PIN_INPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (A5) USB1_DRVVBUS */
+		>;
+	};
+
+	usr_button_pins_default: usr-button-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01ac, PIN_INPUT, 7) /* (E12) SPI0_D0.GPIO0_90 */
+		>;
+	};
+
+	usr_led_pins_default: usr-led-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0238, PIN_OUTPUT, 7) /* (D24) MMC1_SDWP.GPIO0_123 */
+		>;
+	};
+
+};
+
+&sdhci0 {
+	/* eMMC */
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins_default>;
+	non-removable;
+	status = "okay";
+	bootph-all;
+};
+
+&sdhci1 {
+	/* SD/MMC */
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins_default>;
+	vmmc-supply = <&vdd_mmc1>;
+	disable-wp;
+	status = "okay";
+	bootph-all;
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins_default>;
+	pinctrl-names = "default";
+	status = "okay";
+	bootph-all;
+};
+
+&usbss0 {
+	status = "okay";
+	ti,vbus-divider;
+};
+
+&usb0 {
+	usb-role-switch;
+
+	port {
+		usb0_hs_ep: endpoint {
+			remote-endpoint = <&usb_con_hs>;
+		};
+	};
+};
+
+&usbss1 {
+	status = "okay";
+	ti,vbus-divider;
+};
+
+&usb1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_default_pins>;
+};

-- 
2.50.1


