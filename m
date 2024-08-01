Return-Path: <linux-gpio+bounces-8518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4192944ABB
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 14:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6EC21C20441
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 12:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F5519FA9F;
	Thu,  1 Aug 2024 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="a8BX93u7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC2F19F49C;
	Thu,  1 Aug 2024 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513649; cv=fail; b=pKSlTxEA5D0ZxiBeInSRyD5nlcTvpM3FPT1nPo16boZwHIgXiznewxbW5paiSTSD8njIRhSsKTa+6Yrq1zFqBoe7tOo8w1PcuPxiDh2VbHPWs1mtzb0fKA8+VINVqUGQUbqj0QLhAHzyhksUf+GD7kI89qJzgNzkQLtlwCHxwVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513649; c=relaxed/simple;
	bh=W7ci1t89oBAVvGl4Yvmy4ZhLj1U+yDUB2HpoMC+NX6Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0P00GRH88vHrj4l594qQ/YifpZzQ3l9Jp7t4ZBorWXYH+RBtGpVsQDUOqTYqITWYc486zjnP+W3JtaS4rTvcx2qhPE8iOQwQmbUxa9Xjbhh1/i4cgtoUYoSwVqtVl1rB2QoTgUi+cSmfK6ibDztbNfjQgpOoKAHaAok+aFxKc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=a8BX93u7; arc=fail smtp.client-ip=40.107.243.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfjsJcKJ8Z2w6QgSKVHByIh2yimU6sAMUPrRafo542HYPGfS9PfG049ltriuLbciMYhvh+Dp58bG8uluj4aWb/FtgeF1mGBeeWnA6Shvx8yaMQeiHYvw0JkQ4u99ZrSoD/nDEyVK/4XV2TOnHiR+kybMvdyd9un+Uz2SiYb0QoolqehYnO4z1ul0hhkuGYyzrqMNfeqI+hDmOvYj6NljKLMBzGSRo0TN7IQ1xpUeuJR7bElBvJv5tSejeaCrG50w/xEdCUQaAcakJiXzO+x7O9yNeWw4sqF/1C/cQO1wGCT/eibiMEU5KSa1EcI1wiu/JiUMIcBrIjZXmefAW8fXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KcGTbDUi0ccrrJBN196pNbz0bDkn2Q0RXz8zqzARdk=;
 b=aQigIFY6LodX+TQgzdjIPmAyGTK1n/XmDYF7M6kKxD1AQFmIevdYRHhc5BLxVKGpL8rmvlpXh3DEvtYaSTqKifW9TsN6OlhqHzZEqziF7A0FwVnfuhONzS6fKGiAejv17ZG5mgbtD9KIRBN86GgwwD8yrlgMWVlcy+OpoSGIlsAcsXMzqtb6Rjehw1G4jgmC/2mHUuH+0YW5izjhFZ1KTCRC/7O5b4Irx1bXO5tnkDVnNTAlZym9f6a5fC18ph62uL8uljRlSUKKtvBD0R9zBx3MMvR9WuoIpmDBd73+4dB2m5zAAW4qduHd/6oGiC8EPkrK8u+4VjT/VLRRsc0MwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KcGTbDUi0ccrrJBN196pNbz0bDkn2Q0RXz8zqzARdk=;
 b=a8BX93u71YNCAWJL/I9grJetdFuzgXsadKoIEKcEDBNWf7mOoUcoyxxFbSzt01YT9wbQYGU9oS7Vjr+NRms4Ck03HqhmojqZHRPvYhH9ujA5Dm2hLdJUSIcC8WPiml/T3Jotv6WBHiITjZPtywTf8XIUarbUclGiR9FWTBsirAI=
Received: from PH8PR21CA0011.namprd21.prod.outlook.com (2603:10b6:510:2ce::19)
 by DM4PR12MB5794.namprd12.prod.outlook.com (2603:10b6:8:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Thu, 1 Aug
 2024 12:00:44 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::b7) by PH8PR21CA0011.outlook.office365.com
 (2603:10b6:510:2ce::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.5 via Frontend
 Transport; Thu, 1 Aug 2024 12:00:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 12:00:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 07:00:42 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 1 Aug 2024 07:00:38 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek
	<michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Jay
 Buddhabhatti" <jay.buddhabhatti@amd.com>, Praveen Teja Kundanala
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v3 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Date: Thu, 1 Aug 2024 17:30:28 +0530
Message-ID: <20240801120029.1807180-3-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
References: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: sai.krishna.potthuri@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|DM4PR12MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: 22153bba-c154-4ed7-67c8-08dcb2219245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T9kjBAOFqVEgqq6TjNHQ5F9lzZnV5W38mASr82saMfq5v16X26Z9YKLkh6bI?=
 =?us-ascii?Q?WXOMss5BUa5rJ4xD6ZkBO0bEDqcsPKrSz2pqsEsR/Q+VP1hkqwCZjJPd4pJ+?=
 =?us-ascii?Q?9IZttsGfvknmPI1FophF02+PJaCfgZgpcaPDa349Deiy9CF/wmjycKTnf1V1?=
 =?us-ascii?Q?QrJsnVAiVqOnHeWZ/GAhSup8OmfFM8lHwGW/85gs/Rk01YbHkwdmpwNmi3UX?=
 =?us-ascii?Q?bY09nEnHVe8sKe3K5NNW5ehdy6kFmKmzbMUeSV/2o7lnOudaUnAUoYAU8+so?=
 =?us-ascii?Q?30deKwgqljFNkCs0fDURixWn8g8xjfelZ8r/zmt8jfN2piFqzi2Qpo0o2wRq?=
 =?us-ascii?Q?5r6zfV++0DB5909KB6SZ0EZrnd/FxI7cYBc6hDGzTq+7fheqShXs1HTj83QR?=
 =?us-ascii?Q?brw+3cZSyYbkMUKgygCjMhJNZoQtNf8HzvLZ4q7jjVnKMDaX0GRxcn0I+UEJ?=
 =?us-ascii?Q?MK9bFrkQg3JTrOO6A6oB1GWE2g2KOiCU0xuG2Y/yMnp/KBuKUmCMlabvD8Yk?=
 =?us-ascii?Q?VV0RPJ25wWoq64y0jaGfsFRm4ddigWp6MJxVSdZ8qlFtcYi4UM5xCCxAQ1CK?=
 =?us-ascii?Q?9jMXqM1zEOlzh9VzvkXV2ayiynaIK/m0Zb1iztY7dSDy4kYvAZPOC5ONt4W0?=
 =?us-ascii?Q?J2dqBfuQ/6XNj+4uvDBSSLzMTKQof2V4sTQAWd1dcTkLxF4Gr7Lxpxzqoj87?=
 =?us-ascii?Q?ME6vrkSlOygm5F52SyZzMioY7ms2z9n3+M9g2l+OsLQ6YTY61I7RjI9QZ/pP?=
 =?us-ascii?Q?JIHfSXsc7PPuGKR0YIkQixoTRlMWrkpP1n4I1c4VJG0RLOQBr6w8upaZmiFn?=
 =?us-ascii?Q?akfG7egjHAx9efL1cTjxQdkwWwMg3h8Syww2kLoMTfmOKVHP6oLVm7FXZQ2K?=
 =?us-ascii?Q?GW8M5wimnkGIO6HLTnelttLGL/BxGT+xKf8uLQZekh2SA03k39EjjZpVFkAo?=
 =?us-ascii?Q?9U6wymAi12R1e38ycyCqh3lsgPHOKYOSgjrhaqCZ7LDJb4VWXc3LtdRKNk7A?=
 =?us-ascii?Q?X0V2xNKlkv6cbZdBzWTUXl50v88215MybMWgPG9/Le0GrGIR9zRiVVtmoKFs?=
 =?us-ascii?Q?a58CgjAkKd9GVIKJvavk/xEFQPYgCGuHRh1m6UxDFC/+K+0MJ25mLn/KdkW6?=
 =?us-ascii?Q?nRYHYnBqXSiPftEalwtifxdxogXuCy2PIejxGmqx0x6YjGNhEQ9+4q7Ury7m?=
 =?us-ascii?Q?fJnjww9zWE8RPub2dyqbsAThtCAYhF7RrivQUIfzUd4rwU17MdY4U+R1wBwk?=
 =?us-ascii?Q?ZrO0Ob6Ez/zGaj3U1ZbrvNd+uoWIZ1CR2Zi+T1mUHA/DmPPTPrxJRAiGT+kd?=
 =?us-ascii?Q?AkBeLfJyCVeLH6p0/r2NUhrFG3cYXQPIRCSlhUrH/JhoDEgHEAOvT2PpdRqt?=
 =?us-ascii?Q?Rtbk7Az2kHFwz/DfdXzPtBKdwXlPhVDn0CxCfmVVtsJtO7mhtImAEHOtxaIQ?=
 =?us-ascii?Q?7Pmjn2sWihzeKLYLL4/26S0hWsyeuEEc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 12:00:43.6361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22153bba-c154-4ed7-67c8-08dcb2219245
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5794

Add Pinctrl Get Attribute ID to the query ids list.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 include/linux/firmware/xlnx-zynqmp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 1a069a56c961..9b8735548aec 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -235,6 +235,7 @@ enum pm_query_id {
 	PM_QID_PINCTRL_GET_PIN_GROUPS = 11,
 	PM_QID_CLOCK_GET_NUM_CLOCKS = 12,
 	PM_QID_CLOCK_GET_MAX_DIVISOR = 13,
+	PM_QID_PINCTRL_GET_ATTRIBUTES = 15,
 };
 
 enum rpu_oper_mode {
-- 
2.25.1


