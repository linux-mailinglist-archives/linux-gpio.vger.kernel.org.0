Return-Path: <linux-gpio+bounces-8445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 374239408FF
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 08:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A9CAB24FF7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 06:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F0B19048D;
	Tue, 30 Jul 2024 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TjuY7mM4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA2C18F2FF;
	Tue, 30 Jul 2024 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722322577; cv=fail; b=b60kM1qwJo4Ai8l5lLEsTSRQO7HgECoQX4A1as+VgnBIZoIKvc82zItIB38p0CdafM1rnDaOdhleZRsj4XD9taZqot6zBEBXpB5aV+yQ6oxhK+RB5UVjw5ccKMHQS0l37luUHJpULGGZOJ6KFfkQ+31yNdWsoMhyJ9Wf1T8ntG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722322577; c=relaxed/simple;
	bh=W7ci1t89oBAVvGl4Yvmy4ZhLj1U+yDUB2HpoMC+NX6Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a2d+IyNoJ8WorHPbfsC0uzsSxAwDNcy9Bjffd9XbYZZL9Pcxa0F5tANvMGd7n4qkZxTACNWqGyocZJZDehe439R0Ylol89QU92aKQyuiZL+HSWd1itCYd8qdaz+gJ18nhycIOFhDXkxKG4zqZICUUfmWczs+HpmZBHgVeRiGj28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TjuY7mM4; arc=fail smtp.client-ip=40.107.102.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJwSbGVY4xE14D9SoEKIsnK8NBlEDiyiC8e5I6xYhPCkikHis+k1xmoNOWKz3eHddK1dV1a0bnF2nBF9mWdvZ1mLEMAKiyxLMsCdAUeCfkXc3MUa+ynF6J0PvE6HAbHyvDq6EiJiQ8RW+mZCQ6Jh5fj0xfP6k7wAKJ5GXGa01Tij6kOt8gTHzpoBJfEPl8+fuPebfZdBc0s3fjhZTApuW2+KHiBRYZPpNqqvz4S7CEGWVZO8lUA/z4YajcoYZy5Hq+MrYaJX0i9CEZiF5udoxcRws+2Y3YIndvnRKg4gnBdWvEK+HI1y7UdyDrwuurNzZY+Idh3GFaGtYM47Tv/sMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KcGTbDUi0ccrrJBN196pNbz0bDkn2Q0RXz8zqzARdk=;
 b=DKxcNtljeCe2KWDlv3yBWBfSHK6DIj0GidMR6OkzkOkmekUiuQivZ0nV6DYuTup132r5TEcBH3x3FLzOV9oTZ6d95LNYWbVQyuDwrrWWGVnTVLclIbyfGw80jCIFvX4JnplsJopsd52QoT5VSjEh7eWZUg91yJLeabI80b46oON2ZzraFDwohpPpGUkYS5qAfXbEk1Jc6bOqf9Z/DexREeav1ZIZj14o4d0qhUo0GuOG6mPwOLWH5lB6GIpXKIEpiNERN8tU5ncmUm6LRnClR2oLoQDPtdHjyiltLR1oBqemDGMxbXOCA2pyXCGv7ChEat55PHxcMfiKAkogmda7nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KcGTbDUi0ccrrJBN196pNbz0bDkn2Q0RXz8zqzARdk=;
 b=TjuY7mM4b3nHTumAlmUuhcxOKQOOtwhNSO7WBCN0lNJN2sU9bQ8KghCsno0m/m/FO2hSPYEt+bZJrG/MgITu9DWLF38hetT/0cZb3l+IQ3tuBVogT4MGaO43Hf7MED6maYCbIrkE7DR4Pc99nxTUxTRp/1q0uKkkyG0oT/u6Q0M=
Received: from MW3PR05CA0022.namprd05.prod.outlook.com (2603:10b6:303:2b::27)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 06:56:13 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::9e) by MW3PR05CA0022.outlook.office365.com
 (2603:10b6:303:2b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19 via Frontend
 Transport; Tue, 30 Jul 2024 06:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 06:56:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 01:56:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 01:56:02 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 30 Jul 2024 01:55:58 -0500
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
Subject: [PATCH v2 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Date: Tue, 30 Jul 2024 12:25:47 +0530
Message-ID: <20240730065548.1371518-3-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240730065548.1371518-1-sai.krishna.potthuri@amd.com>
References: <20240730065548.1371518-1-sai.krishna.potthuri@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: sai.krishna.potthuri@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa76ef2-6c50-4410-11cc-08dcb064b2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v5pRQ78qiwyqD3j02ff/E7iLovkov4JgQy8l5ze1vE3iofiG5Xjd5yIPbq3u?=
 =?us-ascii?Q?L/whpBgWWngC0aZJ3oAgRHTKbwFWU8uqJbSuuLpnXPd9GpxjuNYAxa+KJlFN?=
 =?us-ascii?Q?HcmtELSgyHs/CiVyb7lUeazoJAlVVf64o0IxQp2gPnXeXpVx9tYygD0en9Ls?=
 =?us-ascii?Q?K66PNnDRm3OHrIm4S1n1882Pm6ErAbGFw5uJ2G/HIDNrjFEl1dYRy2SVbBIY?=
 =?us-ascii?Q?NlOBbPQOXYchxeIzPxLLlhuMf/qNuvebcunWx5//diX1jqRtZRDk7yRmPMGK?=
 =?us-ascii?Q?gfWRuiijv9XNKdwXuwP4ka7S/Q8Rb0tYZuiEaVmUHoGMQYaLW5XxZL5t15V0?=
 =?us-ascii?Q?Hy37ZFYRMtNdCJf3gWLrdd8MbSN5jQ/BRURXvBzUqT7K6CgmshNFpgyCeB2C?=
 =?us-ascii?Q?rJUjZUg6+F8iwUX02MOO6QS8r3VxFUusZ448VN+st4S8DXxtEEFtMZR/H9/9?=
 =?us-ascii?Q?Vi3piujONL4FPusIOEZrYcg+ff3dzARXB3acDP5mNR+bIs3xVruyEGJ55MKH?=
 =?us-ascii?Q?PVmAPuJRYIVXp6bhOTO6PDONYGrh4deeVPIqAQgCuSpie/jXP9nGiONEx5yL?=
 =?us-ascii?Q?pGR1zlENJUDgoTvtKsFPfQf/9c9KHT8Xocc6fEb18TYVNP3+l9owkQwnV5Lq?=
 =?us-ascii?Q?R/xN9Trji8XK3MX0eA/DjC4PKctuw1VhwJYFnh7nlQW4D97RYkzwRvlFDx/j?=
 =?us-ascii?Q?CHiAjJoAsEamPjPJ3tCckLOqsYRKPhMKY4H/hohSb6TIMADtw4gMI76Ily6q?=
 =?us-ascii?Q?vIlqs1bQgxZxsmvWrvMtMGn4vNKbpcGkXxJAbNA51n8VPD18UQ9yHlX+JD9C?=
 =?us-ascii?Q?gGU9sOJg90Lle7yYAF0H1JHAfeAnR5XzcGJAWXr/oWB7k+BLFOfSEmZEqzKJ?=
 =?us-ascii?Q?d9pgr5geiLSrJGszHA7bNM/bxsUTSM5LPq6Mi4a1NS6i0kWXsuZDBRDWc9uK?=
 =?us-ascii?Q?P9R4Xf8Wz7iBZqh6u2KXQwsvaNkm6u/QRwa/43dcA2JQXmFicZueekxKBfFr?=
 =?us-ascii?Q?ZV7Ibn+reVEAVLqMgajdMAzeU6GQt5Vr6luVQJeAV2GxORUPr1dMhIFlSWVJ?=
 =?us-ascii?Q?f0OmqKeNqo5OouyHpLbPABA1dvKtWUG0RBMI+bGeM/TAi+GlyRMUm/HJnd0A?=
 =?us-ascii?Q?mQSKDBOMwmUr7sXYP0H2QyoZLEb/SYE4DATz+xhvg6mTmyc77+QFu5QAN6Vl?=
 =?us-ascii?Q?oLHIOUxzCCjyWRs6Mv9umcd9230c5vU95/38vm0dGfd+ap+JKh6aJehBBKhI?=
 =?us-ascii?Q?VlZyBklC+CpzIRzFCeeNaSDt+ENvikmTAZjK8JtL+J0R+FshzCawaR5XuDcs?=
 =?us-ascii?Q?KGxRIrFhLaMdGKKpuZ5kzb5ZSt+gzRARh8C1HdtHx/HijBLail/4WRBNpSbJ?=
 =?us-ascii?Q?jLxFwZ5ex79fP/oOXQTFj1JiIDv9wFgVvPMuKRSUTvgb0hTLUFWnI7isWSEU?=
 =?us-ascii?Q?3GkbcCdgXpopZKNYc+1DM4/EJixihItw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 06:56:12.3869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa76ef2-6c50-4410-11cc-08dcb064b2f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180

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


