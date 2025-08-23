Return-Path: <linux-gpio+bounces-24840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D88B32703
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 07:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8C4D7B5526
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 05:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21260221FC8;
	Sat, 23 Aug 2025 05:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ENcZj6zL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2044.outbound.protection.outlook.com [40.107.95.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A0872623;
	Sat, 23 Aug 2025 05:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755928488; cv=fail; b=Vh97lJhrUed7rWq8plRN4VF9pGHjmoqFFHgOtza7zBsC+OI5GO/GeE+nFoq1H7tpiAgaVpXq9kZmKSbTGU9vgTrlaKzYRMdI6C62HK2we/ITCG+nltHHAWKmqTQLXcFoUj7V9zsOjIPuJPFrymyRemCBI3gZ34CZ2j2KoQx07Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755928488; c=relaxed/simple;
	bh=jwcFhOrJOtjR4H5S7sm3AwHwiPYiA0VhNNDjqXRp2yw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r8+MSJrv6Zju5PgHZVrrjB2WLnL03vkR7rBerWp9JIwn1W2yrYh4MLPWJfrAQioq9ia486m3tRQ/zoQtUr2LmKE5GOZySQKAEKCgU6iktfbf5cpi8RmoxgN2AwjpuhV4WuVbn7Zvra1S86tSH2TgQk0i3/7ZN262pOXfWa7ELFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ENcZj6zL; arc=fail smtp.client-ip=40.107.95.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDZXXHr6oPK0LyM2NHzS/f3q92rg8DJS+LicNuRzcfjLWbVp3n701djlMru94C8ZNNBjDGjyTlRUKhCkCI+3N8YwiBbpsAFzs9HfAhsULP4uKcisBAYZPGpwLcq21BiWZ2SHphsVse6R0vzk8NFyKJcuvZx5lQ/0jdExQgfVaqE3eUkxO76eNrGlZghKL8R3N5OQa3wFmvjuvcdVe6qP2QvAjScSK6RrmZQ5L7s//moGUt/QRzV9NEXuMnRvCRF1M7vEJ7lpvIW2wiu1dMkxci7iC2JnkAeIZBOZHb2dcyTHgxlPZGC/+mhoys1e/47xnGmoZlIYkssyoXsQIbiMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRFtEDDDr5LFBv37grq+a9Y5PB3aj2HWMCkeDWrff78=;
 b=LcWpfdoXGFmQ6JBD4+V4ZLOyGN1fkxRwphOjL2br+ycSdDZJ5wqD8gTEeV2WffDgYuv4C0NQRbt5lyyFPG8HaNRSP3DYMWp/D67e+t+KcRD5Q3Uqz23E2PNGU0H4+TfpBn2XRlHKzhNwiwMf1qwMlMKwozOLtuiOLk/K1aZlQmGdVKG3vLQeybtDCWO3QZ+ZfFDtX1ytNdd907GfdHldDbGS1E/idPE/1SGgajok+FmuYOAf8KtodiMvMy5SlBAh8/TUQVq/WcN3Lp1HPBec695j5WzegJWdLCZHtCqMDe5d1Ual7+G8jXRObPp9Vdkk1dT50njX8aLJyYXnPjhOYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRFtEDDDr5LFBv37grq+a9Y5PB3aj2HWMCkeDWrff78=;
 b=ENcZj6zL3VNWEkvTXDDBVMcNlYakxsNCfFjI2DqDO2ulNs6p2n/g4u+2NzZfNWZYljNbSJotA6C91IYjVoZjDncFI5i7NZj8tOQsSkohDrVTr7CCQdInQO/TL7i6vs9duXAaVigcT1iVoAdB5bQKtCYnceZa7RHk1ZEX/Y+JGacm2tDDhgBuU9qIXoYhmCvyW6AL5loHPyOH2S8p7/1cT9bkDISXUYNEXAAahavlCEYGFdwL+covYH0yEU3/xXvHm8ZsfwQB3b5pOZFYOXX4niOz57Rz6TYYpxUWLjjx+CwAj90jn8wJA8gCisOer3hOnnOiBAVlNREkCZdhv2jTUg==
Received: from BL1PR13CA0132.namprd13.prod.outlook.com (2603:10b6:208:2bb::17)
 by CH2PR12MB9517.namprd12.prod.outlook.com (2603:10b6:610:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Sat, 23 Aug
 2025 05:54:43 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::e0) by BL1PR13CA0132.outlook.office365.com
 (2603:10b6:208:2bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.10 via Frontend Transport; Sat,
 23 Aug 2025 05:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.0 via Frontend Transport; Sat, 23 Aug 2025 05:54:42 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 22 Aug
 2025 22:54:31 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 22 Aug
 2025 22:54:31 -0700
Received: from pshete-ubuntu.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 22 Aug 2025 22:54:27 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH 2/2] gpio: tegra186: Add support for Tegra256
Date: Sat, 23 Aug 2025 11:24:20 +0530
Message-ID: <20250823055420.24664-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250823055420.24664-1-pshete@nvidia.com>
References: <20250823055420.24664-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|CH2PR12MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2b57cb-32c0-4a8f-3fa3-08dde2098e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SyJuloNRdDrNz0JPUoBFquMRIy8k0sYuOiah3NRvfkdu19HJNxpQgA3PVKO5?=
 =?us-ascii?Q?wmTTO9aubRSB1eJfz5fTU0XE8GpTarOFIcmdUOFUfmQqAXR37IxWvKv4rm8Z?=
 =?us-ascii?Q?DRtsIZi/Efst+B0Pp549rCjWQkwTBxlP+pMabPTsF1gtdM4XYfkILhw9bigt?=
 =?us-ascii?Q?3eHnxpgKHiqRRGBXH+N4le4fKV+Fj3M3FJRv0zKafmAbIsnIMC1pmY+LfHlV?=
 =?us-ascii?Q?fMdqF+HS3ERjiWNymlFsxHJL81lIS5Tu/GYYvhRIajkOQEwmQbIP9Lis/TtG?=
 =?us-ascii?Q?skapPCfme4r2R4VkRICv569WajGInXrR/qPNq1dXfE1sIYsL6yLTe1Ula1J3?=
 =?us-ascii?Q?bYMqOTnIYSLZqMvj2iXeXMUCF0WG1OUHc/0zzrubzQfsss7wYZ63lPiO8WWy?=
 =?us-ascii?Q?xBi6HztngqmfXmPUxWoAiapkh/4VEEpDz6t5fCTUJHylPqMKSip8i796HalF?=
 =?us-ascii?Q?v2OadPwsv5lTyRPNvlum/G5G0WJapJQCmatNHmC4G9S+OA5GcmvEaLGl+mFB?=
 =?us-ascii?Q?PfmToDAl55enw3z9GZVPV5qYS2IlR6DSNxs5fxu1hW9hPDxcOVUAcly4lwt/?=
 =?us-ascii?Q?Ezj8Bh4Y2sCI9Ctzq30KDHRLB6J6TQ59YNV815jviIgaW6sJenaXAOBZlZ7+?=
 =?us-ascii?Q?iH6Oyg7MpHetHn7C0kXazH05TjSC6pz5mrJoJ4q3UuzYAolCdhCzxR3ecoTC?=
 =?us-ascii?Q?pvBCqaQ+6VZZ/lvHTiibJ/gVBW5HQGz3pbmaVy+4cV8bh9KCdG6Io6bGXh+O?=
 =?us-ascii?Q?4Gkv/dAn+8spd3mNNjaVtwXNSnp7UTRKwvGFfoWIT+TUEPVwVzebyKHjFN/a?=
 =?us-ascii?Q?D/1Vn5oDRzEOh0dJrYmPtL7Ds+tIhmXy3oOV2Ef7l4o5JJf4E1Srx3+/ZyCy?=
 =?us-ascii?Q?F6kcoKkGn/HiTh/P9qzTuOPt5DUIFLgAM956+Q7fmeE37V3xlU4dJKj4UC5s?=
 =?us-ascii?Q?MM4k2Hq0QFodx11HU8mFgves4XBkCqWSuKuuLdQZ74e+yT92Jjsecm7XOri8?=
 =?us-ascii?Q?HWM/jcUjtC7AEVOkOGr2u0kT4rPu7U6zYXLU51Um4Y9NtWAtZapq7Z83Z8zJ?=
 =?us-ascii?Q?UMnqd2cLuUTD2y8xTzveJz2KTU7oqvbmskbAyBeGf8e1P6mIjB3vlbvzeMnH?=
 =?us-ascii?Q?BLnxkgpvz9tWtKi9hZBVJ72g3boxu94y+dnKvWacjtzU5aO5o2fWnjLQ5sSu?=
 =?us-ascii?Q?OX0QC3+lft7tNUW8Cici/sSCfhlTNT9shsunyhQWYit3v4G5eS0bPSMIKS+5?=
 =?us-ascii?Q?OUSEHckC3lRvuLsD7Yyf5Ue3/z0wWinB0JfxImnOKq18M6+DjbHVktwN+tO0?=
 =?us-ascii?Q?zKubGNOUpwefsuZaeEdSPGPspxxl4JnfqUYLr0SzJcbDG0YZ/YxlKOGd6lgL?=
 =?us-ascii?Q?0bfCU9EUjjJFQ1dXymZAXBs/qUINnGLOfMQTQ+oLEpUu5lz4JxsIYa9pFw/n?=
 =?us-ascii?Q?CwMH9ieG2szMO6W+cKsOmgMesZPqcxtQ6iJgw7tLca4pCWUtJd86tjK3+6TO?=
 =?us-ascii?Q?3chDUFTrR/XO0M1CWd07um/5+WOwFwKoNHjZepnXVKRa/KmvOqp5xdzLFA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 05:54:42.6668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2b57cb-32c0-4a8f-3fa3-08dde2098e6b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9517

Extend the existing Tegra186 GPIO controller driver with support for the
GPIO controller found on Tegra256. While the programming model remains
the same, the number of pins has slightly changed.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d27bfac6c9f5..c9f1441a7b30 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -20,6 +20,7 @@
 #include <dt-bindings/gpio/tegra194-gpio.h>
 #include <dt-bindings/gpio/tegra234-gpio.h>
 #include <dt-bindings/gpio/tegra241-gpio.h>
+#include <dt-bindings/gpio/tegra256-gpio.h>
 
 /* security registers */
 #define TEGRA186_GPIO_CTL_SCR 0x0c
@@ -1274,6 +1275,30 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
 	.has_vm_support = false,
 };
 
+#define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA256_MAIN_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
+	}
+
+static const struct tegra_gpio_port tegra256_main_ports[] = {
+	TEGRA256_MAIN_GPIO_PORT(A, 0, 0, 8),
+	TEGRA256_MAIN_GPIO_PORT(B, 0, 1, 8),
+	TEGRA256_MAIN_GPIO_PORT(C, 0, 2, 8),
+	TEGRA256_MAIN_GPIO_PORT(D, 0, 3, 8),
+};
+
+static const struct tegra_gpio_soc tegra256_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra256_main_ports),
+	.ports = tegra256_main_ports,
+	.name = "tegra256-gpio-main",
+	.instance = 1,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
 static const struct of_device_id tegra186_gpio_of_match[] = {
 	{
 		.compatible = "nvidia,tegra186-gpio",
@@ -1293,6 +1318,9 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 	}, {
 		.compatible = "nvidia,tegra234-gpio-aon",
 		.data = &tegra234_aon_soc
+	}, {
+		.compatible = "nvidia,tegra256-gpio",
+		.data = &tegra256_main_soc
 	}, {
 		/* sentinel */
 	}
-- 
2.17.1


