Return-Path: <linux-gpio+bounces-26365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE3B889A5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 11:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B2C87BCE08
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 09:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044013074A0;
	Fri, 19 Sep 2025 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DKh+opD2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B430748D;
	Fri, 19 Sep 2025 09:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274623; cv=fail; b=O/0vam2JBlzK/p4rZyMno7/hhZMlSIxLnpQpWW0dBaL1Ki1Du7nvgsQe2hgU4HPW1J8Z9RM3x7CUGevMwbwmi/JkEf2SwlQ9yn0By53lUeL3PFihK+v7ievwDU4co3jc6RimYXsgnGrHUadBD8k5YnZatvJ0s4A+iWbLBazJIik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274623; c=relaxed/simple;
	bh=k0QGdAquNT0rEXGD4IAm/OPQbrPCiLUWUrxAAJovTLM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UbETYmLBh4mDRcfwmzwDMi1E/jd1n/KzTR66Ynj9p1DT39mnRwfRCbJ43b8R/mKz2+rLbfE2hNhFvZUpznpStkV5bObUBwrISCSVivNps+lqmYIbcnhQzEa99/aGPtahXAM+J3nGoYlIhi5BT6LLkClTBdmWLslMDYziAsBUP3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DKh+opD2; arc=fail smtp.client-ip=40.107.200.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzJn4nqDhsHdaEBK0LSD0hCIIycRlDU8wrP5JKa1i8vz9ZIbbr6xl68Nhv2JRawpwOBTmJvr2uDzh+C8kzCAg9+pE47twd4tMiqdkdxzlfW8dqLQi2FQDzXc9c84VTFZN762j/e7JcOEzXeHY7IRc4MtWT0UeyoQDETtAVlpv9OaKOWN0vPwbPqJSJBfdXTQCSuXmmm8DzmpyDV3CM8oJT/hqYk3jfX8ScqU6ch0TYskgHoQSipJ6Xj1KojHZbapz55AUzaNsuROQzcuFa0UqgZgiPn6AOCi411I2stVemyZJzknWztI2QmLGRQk7dkrWTP9UDGjI3DDaKCt/yqsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAPy+1qRvpfiTOB8C+gmrNleRMym37wSdIw4g73Qe6I=;
 b=Ukpu/v0CQBY3/Es28q7WZEpATIBE9aCUmFMB6E0pd2M20CzWD2fLDYg7hMjQivKux4XVpwG4IHmMzvdrVJocOwI2vYw5EG8WJa4EvkNKVxHcQbjOV+sM/r/PGuZoZXusxhVUwrvexyHRWpoQUIQUW61hBW8s41zPTC6wR9nL6GUiTlHZVNDaRfguHDzJkhK3MvHS6GN1FjLeWDOqtHhqHaQbRTPddsoupQOUPx6TNdIGD8JSqOFrMhCmaobU17kx+v7ocdpsz63hAjU0VVCAWgAVwtOHDvRK0vl2W12NR4TNciT5Dl7pOR9C/JR2wRupMrP4fAGInNe/ilw9NFo2ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAPy+1qRvpfiTOB8C+gmrNleRMym37wSdIw4g73Qe6I=;
 b=DKh+opD2N082Tq+c2EmKvpGGwFj/TGdXGTyeW0VLMmegHVxxuFD0/uxCtxprYhIPOD9YBF7HMka46vt2NGIXRzQ2rmCCjFG/92zJJa+UoPFjrm+2bI0OFr9cCvz7ROl++CvSMEbaOAfrDxPjol131Jl/8msPv+tsRxZUzng6zsKt8M8TGG9zdSFnRD7pEHHK01TKRLhkDpO2crUjO/Byze85V4564O0+oSFPRfMLiuOAvWfeFrTeA0A2LF/cB8+vyJyMkMesIrDatdz94wrxg+EZyvzut5uShhkANGNVsF46j/D5nAOxQf2I5V/s85npyhtXmvrl20Zh8Lx0kKOQEw==
Received: from BN9PR03CA0947.namprd03.prod.outlook.com (2603:10b6:408:108::22)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 09:36:56 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::fb) by BN9PR03CA0947.outlook.office365.com
 (2603:10b6:408:108::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.16 via Frontend Transport; Fri,
 19 Sep 2025 09:36:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 09:36:56 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 02:36:38 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 02:36:38 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 19 Sep 2025 02:36:34 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Prathamesh Shete <pshete@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH 2/2] gpio: tegra186: Add support for Tegra410
Date: Fri, 19 Sep 2025 15:06:27 +0530
Message-ID: <20250919093627.605059-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919093627.605059-1-kkartik@nvidia.com>
References: <20250919093627.605059-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 50149255-f796-45e5-a730-08ddf76012e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?whDENlDH+l2r1QwH+2qe4LZbcyDI75MozS/ajcPPwmpapghA+nbJdYUYBBpA?=
 =?us-ascii?Q?IoZ3Ce8iuCMBjX/aNoPE4hd2FOfY+j2TdlNkg+eane6m5TWMJNJCqFFbiFX2?=
 =?us-ascii?Q?Ht3nzOGfWwNSEysBWm5FfjZFV44c/6rXtEuxp4pa8AwoqW1oQwFxXvaEjIxk?=
 =?us-ascii?Q?vaPKsnBt++Q5kWfJx4QANEz8MEcaYpEAztTbcIueV1TqyLFxd/uK78o2qU8q?=
 =?us-ascii?Q?B+CxFACFbwma/zxWSboxunnrVmF58Upxo4FnZu0HBrj81lM21QOTfTbNVFwh?=
 =?us-ascii?Q?6EQR/xMnB45Fbk1hHjQCcvjO0DmiZv4HVl1Ihx9QBZ/r1FzrSsPivSHPWHB6?=
 =?us-ascii?Q?qNX0my91jg3Ttw+P2vBrw9yeyYBfq2rGe+NFWFZqjLD1fCRwOaaYwEu74rCO?=
 =?us-ascii?Q?s34sYNjBg4Gh5BK20SMNvApmRDMhWQ/tUuiszWpmUQp9hO4r7uOaMI0cjguk?=
 =?us-ascii?Q?o3THRa5iLR47/3Z8ZLpod93Odsad+spzD+dqltF1GyeSSnG8njqpnHC7TZPy?=
 =?us-ascii?Q?E2PqVC+qMk+AXnkBW8fhgy5RqVL7ll3Q+Jydxx2wxat3fD0WcigbVjmi2lmT?=
 =?us-ascii?Q?5QBXlOx8t11bdjhuUwJSSJpLECvKjRQlmBTa6B3ahb3YLeMoLbA2BKhNCG8b?=
 =?us-ascii?Q?mqD8Z0NXbVKHULvk0MfI5LFPG3KrAmqQKgDgJKKAAXeH8RYRl0gAydgztrZK?=
 =?us-ascii?Q?oXP/wsjYAjRC6d0uxEVTfEVJJLX2X8r6XTitH5LgD/hpezlCsEuTjLxYUDvF?=
 =?us-ascii?Q?qp99hfMVF4HpJ2MDbFY8oprbAmhEYTQB2m4W+dsY+sKkAQnpTMQZ1dpYn3QI?=
 =?us-ascii?Q?9hwm7cPXaGKeAZ2ZmxjiwSbkTOOL7EjFq2+PuYUkMVLRP9wWe5UqBt4ar6jb?=
 =?us-ascii?Q?gdGRwFTwLkLZFLJGzWZ22qZKvq+KdKPFlIGpOuTQj00UPlCQ/BMh7F1symU2?=
 =?us-ascii?Q?/yyc8adGZzlcYNZ7IdeyRcaYdYFZnt/s3DKVE5Ut5LMc2nL4LE7N8j30NgoQ?=
 =?us-ascii?Q?KdrfVrxkG88EZCycS2QnchZvMtzm3lRj83rTtrJpEChSoO/BRxFYMeDgRpv9?=
 =?us-ascii?Q?yoF1oC/dZa+t7GjElQNi9RwQoCUmt6I3jFDTvwz0DT0gKaMIZd6HUg9818Z6?=
 =?us-ascii?Q?++zsHyO7HvThAqJKT8aAC4aPMJxLDO59GIlq8yc8bdJw73ZkKs4e8ZZzq1GW?=
 =?us-ascii?Q?nul0gE/y0srqKrGejbkzRVqpFSByDM7Wv+k7AVL0lYcprNBt/Kg8mcjcdWBo?=
 =?us-ascii?Q?ONkxJo8iAIBJagZdQxGUKl+/ee8NJ2bqmzSfmJVZrPQrLAJ6nuem64/ZUEuO?=
 =?us-ascii?Q?t3cA06pVLN0PvATwnjWwvcAY2XOzLR75HNIgADdOc+YMVlxY7eK/8eg5FhZ9?=
 =?us-ascii?Q?4waUUi9sahBrb0RxuE3SvvDeg590jJ3xMCbVcOlOVpjOujXdSrrDtsJU+DUK?=
 =?us-ascii?Q?UFkZ5gRAsdXPk5k0oOqhsanN3gWMc1v0cxh7K8q83FHs4L4fwc/qD9SW1j4y?=
 =?us-ascii?Q?nuD35PzpLaaijctitEZAnO8DC13bVeWQ+AZWYgnXokH/16s+JXURjVjedw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 09:36:56.0219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50149255-f796-45e5-a730-08ddf76012e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417

From: Prathamesh Shete <pshete@nvidia.com>

Extend the existing Tegra186 GPIO controller driver with support for the
GPIO controller found on Tegra410. While the programming model remains
the same, the number of pins has slightly changed.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 4d3db6e06eeb..68bc25b7d106 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -21,6 +21,7 @@
 #include <dt-bindings/gpio/tegra234-gpio.h>
 #include <dt-bindings/gpio/tegra241-gpio.h>
 #include <dt-bindings/gpio/tegra256-gpio.h>
+#include <dt-bindings/gpio/tegra410-gpio.h>
 
 /* security registers */
 #define TEGRA186_GPIO_CTL_SCR 0x0c
@@ -1304,6 +1305,40 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
 	.has_vm_support = true,
 };
 
+#define TEGRA410_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA410_MAIN_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
+	}
+
+static const struct tegra_gpio_port tegra410_main_ports[] = {
+	TEGRA410_MAIN_GPIO_PORT(A, 0, 0, 7),
+	TEGRA410_MAIN_GPIO_PORT(B, 0, 1, 8),
+	TEGRA410_MAIN_GPIO_PORT(C, 0, 2, 8),
+	TEGRA410_MAIN_GPIO_PORT(D, 0, 3, 8),
+	TEGRA410_MAIN_GPIO_PORT(E, 0, 4, 6),
+	TEGRA410_MAIN_GPIO_PORT(I, 1, 0, 8),
+	TEGRA410_MAIN_GPIO_PORT(J, 1, 1, 7),
+	TEGRA410_MAIN_GPIO_PORT(K, 1, 2, 7),
+	TEGRA410_MAIN_GPIO_PORT(L, 1, 3, 7),
+	TEGRA410_MAIN_GPIO_PORT(M, 2, 0, 7),
+	TEGRA410_MAIN_GPIO_PORT(N, 2, 1, 6),
+	TEGRA410_MAIN_GPIO_PORT(P, 2, 2, 8),
+	TEGRA410_MAIN_GPIO_PORT(Q, 2, 3, 3),
+	TEGRA410_MAIN_GPIO_PORT(R, 2, 4, 2),
+};
+
+static const struct tegra_gpio_soc tegra410_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra410_main_ports),
+	.ports = tegra410_main_ports,
+	.name = "tegra410-gpio-main",
+	.instance = 1,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = false,
+};
+
 static const struct of_device_id tegra186_gpio_of_match[] = {
 	{
 		.compatible = "nvidia,tegra186-gpio",
@@ -1339,6 +1374,7 @@ static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
 	{ .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },
 	{ .id = "NVDA0508", .driver_data = (kernel_ulong_t)&tegra241_main_soc },
 	{ .id = "NVDA0608", .driver_data = (kernel_ulong_t)&tegra241_aon_soc },
+	{ .id = "NVDA0409", .driver_data = (kernel_ulong_t)&tegra410_main_soc },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
-- 
2.43.0


