Return-Path: <linux-gpio+bounces-36845-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKJfBxvFBWrDbAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36845-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:50:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B47F8541ED4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C45E63058FEA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 12:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8103AC0C5;
	Thu, 14 May 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i5z7uG4t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011038.outbound.protection.outlook.com [40.93.194.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7002D7DCE;
	Thu, 14 May 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762960; cv=fail; b=QbmYaQkRiZ4+tDIUS1kDs7FBEWaNHUsI2oc7DOtBreYNJmmMD1srkwqGwNDCipQrdEDwMbTqcCh0BiOkssE2AdVcaPwoM+ywqhJNoEwbvG/yq9ShJETOrO83iVfdKrSkNy7TVEdXS5MtJWRE50q0HaD4bY9uOolOpD+fSOi5lMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762960; c=relaxed/simple;
	bh=rnr70fwDeprpStO+e6XLl7uiO6Qz3n9mFb5hn9rLJKA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZftXeA9P4nknp0w+Clt9mwudzNNm3S4NFhCU9Btvv/UNT0oy9Ca7xfKtpbNQTJALnh698qbz2rkkhxWhdqu3R0xVJ0oNzSXixjBFiKGdQkX3QtJEvcIAsoZfroItCuo2dQMpDElDmTdi1BsZY5fVNCV3M5hp5oGNFh43jIsAGFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i5z7uG4t; arc=fail smtp.client-ip=40.93.194.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZzzEStgr3kMPF2BC8fQlYj9CRV0kQQGRGG8kPsxjtqYoM3kzpIG5hnEFo9rkTSp6jVXN7ZbPVKpMCZtG4hGMTTvQClDcWJ/qoxLOMheIWcA1ztwFuH6nOLXbTNrUUwBO41YrESTeJivKUIXgoYl5rRV0GQyo/kUhnG7ZNhTP2C8nF8OfhqVAE8Yov1VvvlBPqzA6YNHLtvlIA+dlP6mQH5x+oGUGPJSfPFzwn0N3oAs04n8tU9xSoYlr9M9i4F7owy2EioMHRP03cz7RG5sictNZ6Q4EePtOmsACrp3+xXjo4fnMZOlWsnOdkop7uO9O0XJRZWRlikUdbYNMFrotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkTCrPhVvWRA4FhvHEfiT7asJVox4U7sbdaXvcPssTU=;
 b=N6kxDA6qsJ7gBZcudFWT8+0Z89BvlAezQHvbQOo8ar3ht7Hy015xir1stmHaG/LBVFuavFAqHsWKypQ6s8GndtbNhZKeWmF4w+uaPv97DLY4QHZIdRTTdsXpk1ISUp54+SL9ZGBtvhUNfdb0WCiuUBJerfNXTkRxEiUNiTyVU/PVQhFCQGGz5lJzDdkgr1NDyuXc+nZ1tV3Pa1d0/SvpLkGLW5Yf8x+IAu/BvO7Pzj4bG+XY8aY8jHCA9dpw7GmRhHwqUdttHE+Ugm6B0MHpLnvqrs4LsALrP+qZnQyO7O6QH0oZuJ052/oTLMHOMhzCacDEh3owQDW6XYxRB/7dYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkTCrPhVvWRA4FhvHEfiT7asJVox4U7sbdaXvcPssTU=;
 b=i5z7uG4ttefE68gnDz7Z0BWKBaY6F4QLJYC52Z7Zack8HuQ7FKHZU+yhQ5HB+iZkbPBsgZj9Rf5Gwh6QZByMFlrntZnrLuSISGovjVefjIyDSKBJiqbpUTepx5VihVFRG9dAvUM8PiPxW9vX0WZRTjSWEO65XXidTC/ShMv2TrXTlNKAIjQmKulZP5SEo1dU9DtJulALGCBaYHkpXNV5l+4+qnom51gHBVbppSgiReaxMd8jFhm4j4TBEHZOqdi2nFeDMThqW5S1gB0rMKj6QAMTkP90O02dhOabQNvxEkA7nGzXZ4OdsatgTAMHzy1io5Chvafh8qKFvqfugl0RfA==
Received: from BY3PR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:217::29)
 by DS7PR12MB5742.namprd12.prod.outlook.com (2603:10b6:8:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 12:49:12 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::1e) by BY3PR04CA0024.outlook.office365.com
 (2603:10b6:a03:217::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 12:49:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 12:49:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 14 May
 2026 05:48:53 -0700
Received: from build-pshete-focal-20260330.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 14 May 2026 05:48:52 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] gpio: tegra186: Add support for Tegra238
Date: Thu, 14 May 2026 12:48:35 +0000
Message-ID: <20260514124835.108532-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514124835.108532-1-pshete@nvidia.com>
References: <20260514124835.108532-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|DS7PR12MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: f60c20bf-f0ba-4baf-c299-08deb1b73130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|1800799024|82310400026|376014|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AI2MaPUoycnVgprgfvw9EKuTD3Pd60F0mM94cJD8Vom4domdlPI+0VIlpXmaNMKM4SJ8WZo35oy3A6v6rHJnBzxstemukPlMPE7CIbwfU7yUcgn9sMhWNfAZPXR2TzfYkiP/vmA9sfIdK7xHv6Klgp+CacWNHz96oRXIu/qRwsLt79GoCBJ1H0/heWs01KpREMM7yIEx2p1pTUis0lLnORLcc7HWqzsjKsz2ZRfLfz2th70Od/wsC+Mlh7Eij3PieNrOMll9GdkyQ90hTnBYl5xMHgSgZK0gFf3KhG8pWE7GlSRtHSeRpNDZn7D/8GvbbaR8SBY2qs8Vmmm0o2tSx57ZbidorscT8OAsAkvut0vkYwIKUlNNxE6uKkuqEJIAi8DEjIZ2xlvyZcDZA8nUQu2vynG3cYO+34Ju44vFCmxx3sugga1KouErvYsouy/Flk+KTFS0Tbsve5sXH/8xkrYkBYCQNlnH4sWR6rTXcVidhdeHJltZuxOKYDGznO3Z5YsaUg8r/cFLwdVBNoThfKnn4TJkLxjtzyHm2zrha66Ya5gcmvIXr6YPELKvVp1E+8qKmmVgS0M4pmssp3kAsq3Q7JSqJI8PSyswu4R/ssoNStkQ32Ct/cq/I1gUHjSmbSPk5juyFo2u3eDtOmTXfyK4S89wVcqyU7fuRJh5ynPAoByszZHOOlaPSGuc4HtWd8cczSxV0dWR23gK8278XIlh8uLmJpBKFS1Ni0Gr0ds=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(22082099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LV4RTsvNoK6ccXlho1o5UM7QSMEvwesyEIJ8gttXKvbDQYONT8yUjbB/fFDk829xRh7BGsQ7Owh2toVHJyqGIJslLd3/w3gsFFwhoNXQsyduu1Y3I9bc1cJwOyAblofAigbrUNQIdKRxzell610StTxUJP9luljf2GplNsjvUCnW6mfuczYNiAF9xqDWxjAop/rudIM2XXrrv/5/8eQeKTpx3pxmInmHbffXZtj4cpXAWr1s9Sp8PuC2eIgxOtgKyvDArOSWvSaaN38bpalt0Bk7SFkJoU0Jl4HiLdRv/do8G0ubNmsj6/AO5SxTwm9PSfN0Mqb2magKw9mNmc5NJXe8aZUikyaSgj483zg0AvCTpJqRJL6rH+ZqH7BZlqhOFSqgtZhSHZwxX2uYHjcemDKTNjq6K5NyBMgZ7tn4m7ST54ahYrWoUusxULzdUS7+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 12:49:09.5167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f60c20bf-f0ba-4baf-c299-08deb1b73130
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5742
X-Rspamd-Queue-Id: B47F8541ED4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36845-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Extend the existing Tegra186 GPIO controller driver with support for the
GPIO controller found on Tegra238.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index aa7c3e44234f..f56617c298c0 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -19,6 +19,7 @@
 #include <dt-bindings/gpio/tegra186-gpio.h>
 #include <dt-bindings/gpio/tegra194-gpio.h>
 #include <dt-bindings/gpio/tegra234-gpio.h>
+#include <dt-bindings/gpio/nvidia,tegra238-gpio.h>
 #include <dt-bindings/gpio/tegra241-gpio.h>
 #include <dt-bindings/gpio/tegra256-gpio.h>
 #include <dt-bindings/gpio/nvidia,tegra264-gpio.h>
@@ -1239,6 +1240,67 @@ static const struct tegra_gpio_soc tegra234_aon_soc = {
 	.has_vm_support = false,
 };
 
+#define TEGRA238_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA238_MAIN, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra238_main_ports[] = {
+	TEGRA238_MAIN_GPIO_PORT(A, 0, 0, 8),
+	TEGRA238_MAIN_GPIO_PORT(B, 0, 1, 5),
+	TEGRA238_MAIN_GPIO_PORT(C, 0, 2, 8),
+	TEGRA238_MAIN_GPIO_PORT(D, 0, 3, 8),
+	TEGRA238_MAIN_GPIO_PORT(E, 0, 4, 4),
+	TEGRA238_MAIN_GPIO_PORT(F, 0, 5, 8),
+	TEGRA238_MAIN_GPIO_PORT(G, 0, 6, 8),
+	TEGRA238_MAIN_GPIO_PORT(H, 0, 7, 6),
+	TEGRA238_MAIN_GPIO_PORT(J, 1, 0, 8),
+	TEGRA238_MAIN_GPIO_PORT(K, 1, 1, 4),
+	TEGRA238_MAIN_GPIO_PORT(L, 1, 2, 8),
+	TEGRA238_MAIN_GPIO_PORT(M, 1, 3, 8),
+	TEGRA238_MAIN_GPIO_PORT(N, 1, 4, 3),
+	TEGRA238_MAIN_GPIO_PORT(P, 1, 5, 8),
+	TEGRA238_MAIN_GPIO_PORT(Q, 1, 6, 3),
+	TEGRA238_MAIN_GPIO_PORT(R, 2, 0, 8),
+	TEGRA238_MAIN_GPIO_PORT(S, 2, 1, 8),
+	TEGRA238_MAIN_GPIO_PORT(T, 2, 2, 8),
+	TEGRA238_MAIN_GPIO_PORT(U, 2, 3, 6),
+	TEGRA238_MAIN_GPIO_PORT(V, 2, 4, 2),
+	TEGRA238_MAIN_GPIO_PORT(W, 3, 0, 8),
+	TEGRA238_MAIN_GPIO_PORT(X, 3, 1, 2)
+};
+
+static const struct tegra_gpio_soc tegra238_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra238_main_ports),
+	.ports = tegra238_main_ports,
+	.name = "tegra238-gpio",
+	.instance = 0,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
+#define TEGRA238_AON_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA238_AON, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra238_aon_ports[] = {
+	TEGRA238_AON_GPIO_PORT(AA, 0, 0, 8),
+	TEGRA238_AON_GPIO_PORT(BB, 0, 1, 1),
+	TEGRA238_AON_GPIO_PORT(CC, 0, 2, 8),
+	TEGRA238_AON_GPIO_PORT(DD, 0, 3, 8),
+	TEGRA238_AON_GPIO_PORT(EE, 0, 4, 6),
+	TEGRA238_AON_GPIO_PORT(FF, 0, 5, 8),
+	TEGRA238_AON_GPIO_PORT(GG, 0, 6, 8),
+	TEGRA238_AON_GPIO_PORT(HH, 0, 7, 4)
+};
+
+static const struct tegra_gpio_soc tegra238_aon_soc = {
+	.num_ports = ARRAY_SIZE(tegra238_aon_ports),
+	.ports = tegra238_aon_ports,
+	.name = "tegra238-gpio-aon",
+	.instance = 1,
+	.num_irqs_per_bank = 8,
+	.has_gte = true,
+	.has_vm_support = false,
+};
+
 #define TEGRA241_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
 	TEGRA_GPIO_PORT(TEGRA241_MAIN, _name, _bank, _port, _pins)
 
@@ -1447,6 +1509,12 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 	}, {
 		.compatible = "nvidia,tegra234-gpio-aon",
 		.data = &tegra234_aon_soc
+	}, {
+		.compatible = "nvidia,tegra238-gpio",
+		.data = &tegra238_main_soc
+	}, {
+		.compatible = "nvidia,tegra238-gpio-aon",
+		.data = &tegra238_aon_soc
 	}, {
 		.compatible = "nvidia,tegra256-gpio",
 		.data = &tegra256_main_soc
-- 
2.25.1


