Return-Path: <linux-gpio+bounces-9628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3B2969B2C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 13:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 903A52840BE
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 11:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA91C1A42D3;
	Tue,  3 Sep 2024 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GmaFajAg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2081.outbound.protection.outlook.com [40.107.100.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393FD1A0BFE;
	Tue,  3 Sep 2024 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361664; cv=fail; b=juJtXotdTwCJAc/FoP4n6VEvrwt3e+wCaGuGdnq2YscImSQNhnRH3GZG6LXMBpiCJw5V5ABFFJYFL9f8ePhjfuZyR4eJPH1+4lyZPva4kbCPHzJtvCQOjL4f8x4Rw5Tllijnk16G8Eg8UtmUQsIo0RpEOnsnoTu/NnGNeDHuBTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361664; c=relaxed/simple;
	bh=AZmbmTGYyEkxslSIN36zVWNfSczfPcUxLeHhMgM7ROM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NnrvDdbIG7ogID+Jbd+aBluhmdH5toqgH9iWV3Bpf2EUTReEZTStggVfvP6kOgpw1thDDcm6wfUXC+F4+FJ1ki7w1BqwjqoiyjXDyz/N6MBcUl7da4qv7E809JBiK06orJKKBwD/tKgo3hMBNtwx6BOUbE9a74p2a2OA5OwzThw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GmaFajAg; arc=fail smtp.client-ip=40.107.100.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEEffpUhf03tJ8LixF/ZBViqXhfySb6JBjBLKyYn5yKz3sW8BUeKAeG583ezTH7LGoY+xChhOuXIUzZ0EM9mo30omRWIFct8vxrxjyiPM0D4qa2LDz0mUFwP22NEu8tSoYOCbqHo5f9RNgnBTKY2RZ3HWywFREZfjezv+IlrvswRCFsYE/DRulgrKGjEeoZZrZkbifn0+qSrUC3tkdQ6lZTPRSyvsBi1BXjr6qAr3GDTOlbOgHbh18JibuPV0LPDtdCoUjaLBKaQqlivo8uUy51klnaHjdLtr2j8YT9tKe7sACZEZE9THGGJ9DuvvX3l7c8IzHl9pP83jpVq6XZKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hi06G0MBKfeWgajsyOAfkXMObi0dFqrI9CNnzqdLpE=;
 b=Fo/YxReLJilwfFRiJkP5FTbaiiB5qfTvmnH2jSz+qH73EwVeSva80h8bdS1xtGEAvQ7boTu8IwZ7bGPYZluj4Q3IDO6xS4tWs7nBVsdyWO/DG2/H8LcYGoBO/aN4MKEY7KJbD/OeS4YFU5polnOKKjtV5VAUV228vunpHUJsk6C+4TLqnchN23WyiQhvPThecxHa+uQuAOPwHUjOrDSLLu0cJggYAJWMnwadXGvnbr9V4SAz2ERsPilSpczKrjxAs0HVQWdwZrMLGLMSYGIR/AQ8MLXEiWMypCvSZiFjaqHOnO4fQvFaRX1Ls1ZhWWbi10RSA9je2oqg35vl9N1uxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hi06G0MBKfeWgajsyOAfkXMObi0dFqrI9CNnzqdLpE=;
 b=GmaFajAgFWTA7YXOQ73DG/+gT4jxTe93pHs/E7FwjJhnVCV67IzeVsps16WLfZ6yfSjsTAQ9jqa9AeHDdm3RKuuP0wqDQ7KcORE1ihrjuyJzbFsWEuSuM0MB0HhbPSxk3AfCDtvOxNtaV4CLiswO2NxBaYq+K/uDaeE5eKpM2cY=
Received: from DS7P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::12) by
 IA1PR12MB7661.namprd12.prod.outlook.com (2603:10b6:208:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 11:07:38 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:8:2e:cafe::8a) by DS7P222CA0019.outlook.office365.com
 (2603:10b6:8:2e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 11:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:07:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:07:32 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:07:28 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek
	<michal.simek@amd.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>, Praveen Teja Kundanala
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v4 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Date: Tue, 3 Sep 2024 16:37:16 +0530
Message-ID: <20240903110717.2283362-3-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903110717.2283362-1-sai.krishna.potthuri@amd.com>
References: <20240903110717.2283362-1-sai.krishna.potthuri@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|IA1PR12MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec3ed2c-4256-4272-d9ed-08dccc089f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YWTMTlU5qSZZys9VC1b8dkEZ9Ote+xPKTVMDyPOGd/ouvAlf+0zu0g8PbF/R?=
 =?us-ascii?Q?wKEJMwcNtzJ19pMkt6QnWChPbvwWceuCAvv3beFFvdbh1pHauXhY29w4ty1P?=
 =?us-ascii?Q?7Nb3EY58x+BLGx9uCgMlyIjYK1vZTVWD3sAiK7p4TighiwUIoWmVwrKUTg7+?=
 =?us-ascii?Q?M7cjKJJ0dcP1lbuElxHLRkte4g5zs2Xqj4xTru1Co+UqDVWb99soUy9VXIvj?=
 =?us-ascii?Q?sYoewHKSTgHArgUS7BqoOC4+DW0Kr71mc4nevdarDnYTPvupZJAjm39D/DGA?=
 =?us-ascii?Q?Itz7dKstr/h0WZtdfkiuwLshfIugVGbQhz7MlCk20Vr0kWcww/nPnMJmE1lj?=
 =?us-ascii?Q?aKdho8jVHcQCPGW2EtcJW4jGdKkgxtD1+kkfmOM1wSqfg2dYIIEDq3dcqbIH?=
 =?us-ascii?Q?5CTcgUQiueD6ceFx+3YF4SI50zylgJl1Og9Ap2Z/P+X++GcfHyoVplMZeb0Z?=
 =?us-ascii?Q?Ak4qL5Fq7qPfdzYRQPDgE5SkA1mk8siVFrSnpxvaJJKUvwVyYU66Nbf87H0V?=
 =?us-ascii?Q?v3rzOmctNDzjfh3J1VIKe9ETph9dbc0bPTmpttVwSqCQpns0Gt4YywTpR3Wt?=
 =?us-ascii?Q?RzkNSzUx1VneS8BueNK5WmjGRVAvjWpUFIClOMqks3fgYa9EsswKI0cpMIap?=
 =?us-ascii?Q?9wkg9UzKI4oxSynEtUeWwlwlrynaFaUCY8CGKiuRIRyzoBSPjReE9qX0zr2+?=
 =?us-ascii?Q?dN63zPkGpgScq29EIrBPmhs9oRBdjaSUu+3bBOM88eIpy2q8WC0Z2ZBlv7gA?=
 =?us-ascii?Q?iqSkiZ0r/CPd5FCPfQW6jvHxrure26IjAhcGoMHnJI0JqNM8Ig8yxI/3mGPn?=
 =?us-ascii?Q?4Kd+XAAhHERGls2AinGjbN8LY8YK928QVaOHaSE2j12qNcsxczii8gU1cAcj?=
 =?us-ascii?Q?0ijcRjdKeZWqdXAoMSKO9DhKMvUcJ8khxHHansF8qZOmRsarXE8vhQIL1J6m?=
 =?us-ascii?Q?er8meWqRysSieWsBiVBB3BsuCoag3BUoJ0envqIV5sR5NOhqYebSYL0zgc1T?=
 =?us-ascii?Q?/ax6XtRxZnBr/VUxT1K2D7pUOWXJSxaPYrfaFxOILPaZi/Ue24a7HB5PtKxg?=
 =?us-ascii?Q?j+qiBnvGCHwEYtJl1TsHPhAI+/uQFMZtveATxe6rjAo8esW1qvHTolyMKIRx?=
 =?us-ascii?Q?brUJXnWPaewbU9nMav6fOpaL2DFda9h/eJ7ELc7azSdG9srMaZm0kWLhSLNK?=
 =?us-ascii?Q?fMBV4LE4ABMuqBYnaGREZ/WOaL89NJr64qO9vhwg54RqoKV8TUTwzPnl3Fae?=
 =?us-ascii?Q?y8oU9BADGednKnxCbfp3OtkdGNNY2wZqehLBhCoOSsuAUn/w9bNcwCMPr4Jv?=
 =?us-ascii?Q?KnD9YgAEdz/Cbptcrn/dkcp6cxbkN9q2Hzq84QOgJcw5uHILtV9aaS6jlauc?=
 =?us-ascii?Q?nN6mH3eh2S4mdtW/xqLRN2lL7kaUkbCcWzMyAO2LrxhlvqsHTt77hK6R/GUU?=
 =?us-ascii?Q?YQbuoQlfgG8Y9nghYm7d0WHUSzZLdw1y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:07:37.8767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec3ed2c-4256-4272-d9ed-08dccc089f0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7661

Add Pinctrl Get Attribute ID to the query ids list.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 include/linux/firmware/xlnx-zynqmp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index d7d07afc0532..3b4ce4ec5d3f 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -238,6 +238,7 @@ enum pm_query_id {
 	PM_QID_PINCTRL_GET_PIN_GROUPS = 11,
 	PM_QID_CLOCK_GET_NUM_CLOCKS = 12,
 	PM_QID_CLOCK_GET_MAX_DIVISOR = 13,
+	PM_QID_PINCTRL_GET_ATTRIBUTES = 15,
 };
 
 enum rpu_oper_mode {
-- 
2.25.1


