Return-Path: <linux-gpio+bounces-26881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC3BC383B
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 08:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B79318892F2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 06:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CD12EB875;
	Wed,  8 Oct 2025 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bGNIizbK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED212222D0;
	Wed,  8 Oct 2025 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759906173; cv=fail; b=L3DlH39BSVWN+S+GsdN4VC2VFhfRS1/5vu4/tl5BOqEpQx9HL9hkzflEkuev1nFclPVDdAhxqFQEvl2Zypis55N6VFkFHjh0aIIC6DcT3j80f8Q2h8c9UHdEZxnuSp/GuLr33WmTJ7Slv1ZHaPYYhexFWuHDrd8O5wGoODoPwOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759906173; c=relaxed/simple;
	bh=B5XiMeQSJVNt/kJeKbcO4y3OazfZwOuEFjjT1CjXcSE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AgbdM9EUIR3ZgjqI8tFVR9VLim7fXmHXaf/Wkhy6RpAp3Uc4c7q6ppHq19jlK0CZek8+fvLBOKR0KJPfZk9FZNeiWgmz0n5DINItprJHsXtP0OSW+q1MCw8B3RI2oa9KLMkbQ58wdskfNXrWO6fdSf//GMSxxP5KN4TyNxlZcfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bGNIizbK; arc=fail smtp.client-ip=40.107.200.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfiXRCNJ+UeA/XBQkflU41s0o2crAWitH7mxyBAY1e+W4wUShoZcmSFp9endQqJzRIzq0Lf7a6uyfR9umP9X4JLY6fOcFgYtAOy9LurPYvvvXEKXhJifGZKFrbEUj4QNn0yVKegYP6IYvmQIqd8pY7drtYvhqOpD49ZwQhzxV/7bbnH3zSKacR5ReVPkKZb0QTRhub6nOj5O7KZEsDWzwjcXFzcNMLkP9V2ggl6eiGyl+rf3jd2SUE7WmYDqGJkBrchs+2vZt28iTrjprfe6QxDTFE7Jun7harVwT49shhDaIID98+TfE9BSOy1kYmmRgV36gcX95XOoVs3usvpXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij3PpZhjEQ94Q1zwgeQZRYQaT2HCAZV9cnWtkw0AX30=;
 b=nbNfU4RVoo2QCKR3XF+g6EZ4PPHOddt1bfcrVdhOVYSPvkUFv4xRRWriY2ivJvvgnfkKs30pzcE301HZwwcf1FBLvZqqD/35OfKCU5XKbtSFEyxA6kjrlxehNL1oSzn44Z71facoLgWiYbZsy+UaiA0Xwg9GA/pyj3lk8P4Bdto6Wot+WZHNQvEVGAST7o277r8TaYPofJIzvUe3d5NWKavupoyuc4pqNZy4REfFu9LSqv8f9Q1yw6UMgdrWlDi8BbPnP3j2/fsHj1qGfgnkTSLcKYspk+avFVF73r4y3jln1wpPXJR944sYZTCOXQDcFOTY9ntRLKBxdslSawa77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij3PpZhjEQ94Q1zwgeQZRYQaT2HCAZV9cnWtkw0AX30=;
 b=bGNIizbKspDy+q976TYvpaSZNa5Wl3DcsvihZ3ngP1qJxLzj6phhVLaruGdS4ho6xNrytSTm6sk2MHjpJFw4vwG6xzH8HSveCN6xqhipnafA2drIMUeE8tD9yf3S5oVCqgAAPKVeipOxaghL89VxKxDmiRcCZ3RljNJPZgkTi3bxwMLsm0hCnHnLO3jC6WzWRzNyyIC+g8a2nGyPcLOeUBhF6Wh9nZW587nYXJkV8pTh1zUIXoVDpE5vPHMvjGwbEINrI+7NBJz9nz4sPcJ/S/j4ZG72nLXLfRsAB1RIqWtMIfNHbgd6j690ao5mIUjCRJ6soE+K1iBx7W7g7zfa5w==
Received: from BY3PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:39a::33)
 by IA0PR12MB8646.namprd12.prod.outlook.com (2603:10b6:208:489::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Wed, 8 Oct
 2025 06:49:22 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::7e) by BY3PR03CA0028.outlook.office365.com
 (2603:10b6:a03:39a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.19 via Frontend Transport; Wed,
 8 Oct 2025 06:49:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Wed, 8 Oct 2025 06:49:21 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 7 Oct
 2025 23:49:12 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 7 Oct 2025 23:49:12 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 23:49:08 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Prathamesh Shete <pshete@nvidia.com>, Nathan Hartman
	<nhartman@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v2] gpio: tegra186: Add support for Tegra410
Date: Wed, 8 Oct 2025 12:19:05 +0530
Message-ID: <20251008064905.702582-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|IA0PR12MB8646:EE_
X-MS-Office365-Filtering-Correlation-Id: cd52fe53-5913-484c-b0a3-08de0636cfae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O6vncUFXjQ6SszAikPZwKH0pEFNitLpJ38gS30REMo5kpPaUbaxKUT/u7Oq0?=
 =?us-ascii?Q?6Di65rgylpOa+z/hEwrrD0DGOG/xoyZgNWJtp4TMOEOU7AAhafTDWUGmLP00?=
 =?us-ascii?Q?e7ayHM7EFcIOJjeBq3CbV9jLhAvop36i5PKDbjcO1/AFkPfka8rBH/ui2Gau?=
 =?us-ascii?Q?ayPqgIxBJdMIhtDKL29//KuVNk2RkgBN5fG/w7dW9x3oFq7PdN+y/WlkF780?=
 =?us-ascii?Q?uTZpT8UZxBF5mUksazCij2+pDkEB3Xmi9bkjKzvaYxKR+ARw86pXMmSAWp4B?=
 =?us-ascii?Q?q6B/CzmvjtobbM2KTElV2kRHKZxSIRL1d1g0y8MRP1xGi3zxCYEOU7MlAj60?=
 =?us-ascii?Q?rWbCR9CquyfEA86GH7ZwegEObc4zcKOecCAZhGTsrHFA7Vw5BMOt/AOPGZLC?=
 =?us-ascii?Q?eUoiUdKCznKoZTmUjXmzv/bJa7omarxzAFBq98VOA7Y9a+sxHsqK3qctiMlW?=
 =?us-ascii?Q?h88Y1WGcun0rtxg49XBKZCj21KWABkQpjR8Tq3YV9ZBrCM+0vKEdSvA0SN6y?=
 =?us-ascii?Q?QiKe6HP5SGUobKYqOO6tOkv6ue7LWSt8omgMSfgmWtboK+pPkleamDEkjxdb?=
 =?us-ascii?Q?SUwfT2fRqIlpI8xEFJCxoiCnp83yerv2YFWkp0k4K6/gImg87i78bK3uJ5PA?=
 =?us-ascii?Q?tRAESpzPYjatNvpMFQESXSGFebx0t+1uZJCHfmuaoVYxbTKog/LedWieBIvj?=
 =?us-ascii?Q?R3/ZEk9aihbs4/veix+GU9DTdTrtbMDKHYRSN8IT2Q2J3KEPgvqtTn0X8fz1?=
 =?us-ascii?Q?oPngN7rERB5O3fKfyYqJ2WoMjTLDSnBrWth31yS2/7tZvPTXH73SfqiQF8KS?=
 =?us-ascii?Q?9hHmAKKXMaYV4wnWSfcA8HeY2HjDoLy/bIzqxSaskQ8NyGEWUbYrD14gbCPx?=
 =?us-ascii?Q?77qcmJingSim2bYb0B9gfwjkosL91UPAF5rJVZAaicB/2GkPZqrpM/tv7C8f?=
 =?us-ascii?Q?R4+uVyN4EZ4nOX6GPdjzzsLABChJA0fLRLN7NNxKnd6zHdeyJkzvkBHYijYQ?=
 =?us-ascii?Q?xNrgLg74OwdC8Jivkw378ns03vsU/HWhx0227pb/5ykSjZeI4yLcVcT6jcQ0?=
 =?us-ascii?Q?DY9xgsqZUbk5ZVDai25wI2i9BDwAf8uuaaR4Jk+isnSTWINIk+p1duHkYmcw?=
 =?us-ascii?Q?jtmcsvMh9EHgr8LKYOJcS0phbVBqjAaaWxJrGuo4u8zKan9vjRhvfHykK7Vu?=
 =?us-ascii?Q?CsC5azNNCbs92FIu9d9H0zCd8L7wOsqmFx1s940czYgaIzulc25tZ8HcWtMn?=
 =?us-ascii?Q?5sRFR+fGKPKPVulmVjir3kkLWJLtj5N/+Ada3GwTChhVtv2upKNSNMo9C/j2?=
 =?us-ascii?Q?2KWy0jY6vmHwrkkdurk/WYp25+lzOixk0af73ZJD6J/91IFx4LyrBxA/BQL6?=
 =?us-ascii?Q?MsG/k1bNqvEm+wZcxGgU+hZm4suv8QxDBAFMDbDMZU4ULB+SQzE8ZeyWZXql?=
 =?us-ascii?Q?eYafpTGusZFCX8jFSe0o03KsoTy4qOnLJVQYruGn1/7tMZsWyoaH5QzZ3Mia?=
 =?us-ascii?Q?tajSjC6RHNTTYpOq3HzjJ0JFRFEFwg2uS44b8oRFRokj878fGvKMofrWWV5E?=
 =?us-ascii?Q?NRYn/imscGGevuTJ99+PvRhInOCRng4czcNqNCba?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 06:49:21.5210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd52fe53-5913-484c-b0a3-08de0636cfae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8646

From: Prathamesh Shete <pshete@nvidia.com>

Extend the existing Tegra186 GPIO controller driver with support for
the GPIO controller found on Tegra410. Tegra410 supports two GPIO
controllers referred to as 'COMPUTE' and 'SYSTEM'.

Co-developed-by: Nathan Hartman <nhartman@nvidia.com>
Signed-off-by: Nathan Hartman <nhartman@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v1 -> v2:
        * Move Tegra410 GPIO Ports definition to gpio-tegra186.c
        * Rename Tegra410 Main GPIO as System GPIO.
        * Add Compute GPIOs.
        * Update ACPI IDs.
	* Set instance ID as 0 for SYSTEM and COMPUTE GPIOs.
	* Added Nathan as co-author for adding compute GPIO support
	  and renaming MAIN GPIOs as SYSTEM GPIOs.
---
 drivers/gpio/gpio-tegra186.c | 90 +++++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 4d3db6e06eeb..0485a7b98347 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2022 NVIDIA Corporation
+ * Copyright (c) 2016-2025 NVIDIA Corporation
  *
  * Author: Thierry Reding <treding@nvidia.com>
  *	   Dipen Patel <dpatel@nvidia.com>
@@ -69,6 +69,36 @@
 
 #define TEGRA186_GPIO_INTERRUPT_STATUS(x) (0x100 + (x) * 4)
 
+/* Tegra410 GPIOs implemented by the COMPUTE GPIO controller */
+#define TEGRA410_COMPUTE_GPIO_PORT_A 0
+#define TEGRA410_COMPUTE_GPIO_PORT_B 1
+#define TEGRA410_COMPUTE_GPIO_PORT_C 2
+#define TEGRA410_COMPUTE_GPIO_PORT_D 3
+#define TEGRA410_COMPUTE_GPIO_PORT_E 4
+
+#define TEGRA410_COMPUTE_GPIO(port, offset) \
+	((TEGRA410_COMPUTE_GPIO_PORT_##port * 8) + (offset))
+
+/* Tegra410 GPIOs implemented by the SYSTEM GPIO controller */
+#define TEGRA410_SYSTEM_GPIO_PORT_A 0
+#define TEGRA410_SYSTEM_GPIO_PORT_B 1
+#define TEGRA410_SYSTEM_GPIO_PORT_C 2
+#define TEGRA410_SYSTEM_GPIO_PORT_D 3
+#define TEGRA410_SYSTEM_GPIO_PORT_E 4
+#define TEGRA410_SYSTEM_GPIO_PORT_I 5
+#define TEGRA410_SYSTEM_GPIO_PORT_J 6
+#define TEGRA410_SYSTEM_GPIO_PORT_K 7
+#define TEGRA410_SYSTEM_GPIO_PORT_L 8
+#define TEGRA410_SYSTEM_GPIO_PORT_M 9
+#define TEGRA410_SYSTEM_GPIO_PORT_N 10
+#define TEGRA410_SYSTEM_GPIO_PORT_P 11
+#define TEGRA410_SYSTEM_GPIO_PORT_Q 12
+#define TEGRA410_SYSTEM_GPIO_PORT_R 13
+#define TEGRA410_SYSTEM_GPIO_PORT_V 14
+
+#define TEGRA410_SYSTEM_GPIO(port, offset) \
+	((TEGRA410_SYSTEM_GPIO_PORT_##port * 8) + (offset))
+
 struct tegra_gpio_port {
 	const char *name;
 	unsigned int bank;
@@ -1304,6 +1334,62 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
 	.has_vm_support = true,
 };
 
+#define TEGRA410_GPIO_PORT(_die, _name, _bank, _port, _pins)	\
+	[TEGRA410_##_die##_GPIO_PORT_##_name] = {		\
+		.name = "_" #_die "_" #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
+	}
+
+#define TEGRA410_COMPUTE_GPIO_PORT(_name, _bank, _port, _pins)	\
+	TEGRA410_GPIO_PORT(COMPUTE, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra410_compute_ports[] = {
+	TEGRA410_COMPUTE_GPIO_PORT(A, 0, 0, 3),
+	TEGRA410_COMPUTE_GPIO_PORT(B, 1, 0, 8),
+	TEGRA410_COMPUTE_GPIO_PORT(C, 1, 1, 3),
+	TEGRA410_COMPUTE_GPIO_PORT(D, 2, 0, 8),
+	TEGRA410_COMPUTE_GPIO_PORT(E, 2, 1, 8),
+};
+
+static const struct tegra_gpio_soc tegra410_compute_soc = {
+	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
+	.ports = tegra410_compute_ports,
+	.name = "tegra410-gpio-compute",
+	.num_irqs_per_bank = 8,
+	.instance = 0,
+};
+
+#define TEGRA410_SYSTEM_GPIO_PORT(_name, _bank, _port, _pins)	\
+	TEGRA410_GPIO_PORT(SYSTEM, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra410_system_ports[] = {
+	TEGRA410_SYSTEM_GPIO_PORT(A, 0, 0, 7),
+	TEGRA410_SYSTEM_GPIO_PORT(B, 0, 1, 8),
+	TEGRA410_SYSTEM_GPIO_PORT(C, 0, 2, 8),
+	TEGRA410_SYSTEM_GPIO_PORT(D, 0, 3, 8),
+	TEGRA410_SYSTEM_GPIO_PORT(E, 0, 4, 6),
+	TEGRA410_SYSTEM_GPIO_PORT(I, 1, 0, 8),
+	TEGRA410_SYSTEM_GPIO_PORT(J, 1, 1, 7),
+	TEGRA410_SYSTEM_GPIO_PORT(K, 1, 2, 7),
+	TEGRA410_SYSTEM_GPIO_PORT(L, 1, 3, 7),
+	TEGRA410_SYSTEM_GPIO_PORT(M, 2, 0, 7),
+	TEGRA410_SYSTEM_GPIO_PORT(N, 2, 1, 6),
+	TEGRA410_SYSTEM_GPIO_PORT(P, 2, 2, 8),
+	TEGRA410_SYSTEM_GPIO_PORT(Q, 2, 3, 3),
+	TEGRA410_SYSTEM_GPIO_PORT(R, 2, 4, 2),
+	TEGRA410_SYSTEM_GPIO_PORT(V, 1, 4, 2),
+};
+
+static const struct tegra_gpio_soc tegra410_system_soc = {
+	.num_ports = ARRAY_SIZE(tegra410_system_ports),
+	.ports = tegra410_system_ports,
+	.name = "tegra410-gpio-system",
+	.num_irqs_per_bank = 8,
+	.instance = 0,
+};
+
 static const struct of_device_id tegra186_gpio_of_match[] = {
 	{
 		.compatible = "nvidia,tegra186-gpio",
@@ -1339,6 +1425,8 @@ static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
 	{ .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },
 	{ .id = "NVDA0508", .driver_data = (kernel_ulong_t)&tegra241_main_soc },
 	{ .id = "NVDA0608", .driver_data = (kernel_ulong_t)&tegra241_aon_soc },
+	{ .id = "NVDA0708", .driver_data = (kernel_ulong_t)&tegra410_compute_soc },
+	{ .id = "NVDA0808", .driver_data = (kernel_ulong_t)&tegra410_system_soc },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
-- 
2.43.0


