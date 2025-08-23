Return-Path: <linux-gpio+bounces-24839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4025B32700
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 07:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E87FAA8417
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 05:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BC021CC71;
	Sat, 23 Aug 2025 05:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SfDl/FXJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5270772623;
	Sat, 23 Aug 2025 05:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755928482; cv=fail; b=nQztR/StO6fJZ3J+adh3cp6p0iTtLjzc5gFSl3SNVS0T6Ckn+OzBEaDH+De3O1M6RqBSBwMKuUO47+0bPbb8DKDKPalzy4BJppIkmNzaAgHpJBgbEgX7FQFZgkHgBxfoS79G617+cua6K1Wkmzyj0OSsO8FSnXYALACSf2RDxCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755928482; c=relaxed/simple;
	bh=rffq+vue7snYRw2eKBYXsUUIYfAYUE3GS8ZHVBbXN+c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g5bCjEfhIy6JKNxbsk2BdGPnJKMvJtRplM70WLt8RFhn+VpqNfmxUPpm39kn7gYu7ZOpw0XQ+AI/22pzRFYd9rcOl92C+vsTZmBUdKPxEyyhjH32fSB996GW8vo3O1AAs0xs9SBbAqE6Ah3gqyDgY+LdNKAjB37JWOE3g96a4XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SfDl/FXJ; arc=fail smtp.client-ip=40.107.237.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxqrtBPGomWf5mnZdc77I9vwXMyLJFfNOLCbx/OTssdG0vNg0ZeNZ4XK3X/38imgn2HMn0CHCKyaHX2+g+c8nbJACHp+dnggRt9L1tLl+Wf7CUuiHWVjmMr7SG3UzGBTxHGLFXN1bHJDqNZ58jS2u4HE/spchO0gfrBavMjk1SNZ/03fzGDfJ02rurdXj2qLoBex5mYCULG13U3saE33AZgBbxSOvsnCyfvxpEsxHf5AflNtPHe3IHu5+mqSZNohCcO3IPuqoMnqHHaZ8cOtziGNJdFPWeJCVwoLKnfsGLRHxqYLVHMMBXjoTPoOwjb3kTWeDFO32DAcx6+QjJJZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zLDAxFuR1nhX9ouCMMdeyE/NFgm67wYyEQHjlwfFdk=;
 b=uF9nQt6hc+gbgduQt2mrl0oZ5wlREPF5dJWGF2m9mZZHe5weTOPW7xSQVqdWxcByT+DcAHi2lp3U45RN3mrKBUlTvWLV+4Y9VAr50OSbzh3fnJuLxYf0oXt+9rWrvj32X+uFeBX0wcdl+3jM2qzdoljCJQ44ywrRirIfV1dZRsp3Ir5EoKpUl2fynfNWPZX6ProqMlkjKEgn//smziSHruBRThZ/vWI/BsaeOMj6KIfdnFL5OAnLiZGzGUtKvVplFHTPkp4FBsR12ik/wr75E/nx5jJZlIEUpgqLU3AKX8Ve9m3dMBT/bl2OMYV87m5tLsU4Eq+j67evkHYyCeqD6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zLDAxFuR1nhX9ouCMMdeyE/NFgm67wYyEQHjlwfFdk=;
 b=SfDl/FXJOaB5N7ppn1Nb5ITP2l4jwgygrvyU9ivONt2Ku2fsIhJ+XVmbUKfuJZ+kSx6nLVeKOMUR6hVSTRgTMnEunGLM63YDZlX7Er+eaCzOXcXMSYMf8hVW73uxPiEYDgfSoFD3uAsZP/ByaJuzESt5v2pQjnza3uZWc41mTN4qR6Ty0P6MZL5wUj8OWhHFqspMcYz26+CWfG92cPhYd7e7NjQ9V4EWg97J0w+LD9wPs9xfFS6JVfzeDalQmaADqG9oa02jF9EpQzsBn0JUOyNMqkhvFI2myPjf84Ed/FPlBVkPQWBaHn8/CqDJHr9TB3TsySEByrYLMxWzP53DGQ==
Received: from BL1PR13CA0131.namprd13.prod.outlook.com (2603:10b6:208:2bb::16)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Sat, 23 Aug
 2025 05:54:35 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::97) by BL1PR13CA0131.outlook.office365.com
 (2603:10b6:208:2bb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.9 via Frontend Transport; Sat,
 23 Aug 2025 05:54:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.0 via Frontend Transport; Sat, 23 Aug 2025 05:54:34 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 22 Aug
 2025 22:54:27 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 22 Aug
 2025 22:54:26 -0700
Received: from pshete-ubuntu.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 22 Aug 2025 22:54:22 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: gpio: Add Tegra256 support
Date: Sat, 23 Aug 2025 11:24:19 +0530
Message-ID: <20250823055420.24664-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7c46cd-2c69-491f-4ca0-08dde20989c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R4gbPyCHlPPFHCP8hm662jMz0x0UIZlWX0mXJyubA7ypgZ/uE4W+pGewMQk4?=
 =?us-ascii?Q?jR2cY/qGqdHOEcG5xhpSxZ8MpKCsvGsTZ7FFtxBFLs0VvWyM8baZITJzYkSC?=
 =?us-ascii?Q?ReBz6kM901t/6a6+tZtXL2dSwgjm6nFMc3HR/sy5U31hPOxu3rnNKcol+bpO?=
 =?us-ascii?Q?YJiWONrCJAyMCexl+f2lXwGTwgcwctqKTxqW3hjFAQT8aATWYzwn+1hShEIx?=
 =?us-ascii?Q?hltvYNNxnChv3PAN+c/jMFQ/MjvXyHdVhym+E012GF9k1M3YiceuKvLIXm2n?=
 =?us-ascii?Q?+ny6xxHcituT1ry/LOHQ2R2/11SHlsgIBuueJFpSAxfXLHKC77U2hLvBs7NH?=
 =?us-ascii?Q?KjoZWyrSU5ja9KntkEsURRz7M+04/T/ea2EgGKYiY1uannV473SEHYzcUb7q?=
 =?us-ascii?Q?IteK0qnOkJ/ZQauENWH/Cp0VBX7By0U0DXpT9gktca8dF0+6okB4G/Orp9eb?=
 =?us-ascii?Q?6UXq61T93bihdqt5a3SgzNlxB3Myw2BgvmIGMU9P89OhckB0Wi6wd2rcyw1Q?=
 =?us-ascii?Q?hHQcKCuldIvORbzxzs6o3BYO72sYPH/n/2HSRFwvB8JmhjFiMIm4eoJdtmGg?=
 =?us-ascii?Q?iUx23pPVqSUW2uzBCYkq6TYG5UBQ2JUH1XHTxDiySHYn0U+awPpcxJTQXs4k?=
 =?us-ascii?Q?lqrEmvRKfBttHwgSG8+vDehgsoi+k6dfXHxDCPQWq12RJrjsENkiHf0Ieur0?=
 =?us-ascii?Q?3PcCMpNjULaWvNYOHHqFt666NgtQ7kGuAdV+wcAR0lwXsRrngsCcoS2C4lKW?=
 =?us-ascii?Q?1tzZP0kr+b5PBS7srq6j+QoK7DiaJb6RcqqQA31mZ2lut2cG0/CDKOCcz/Th?=
 =?us-ascii?Q?cq9IN+EDB6vS55D5w5+hB6+mSCtdeSZ4w8Kq1E1yMT0KKZ1ZF5vK7tM5jyiG?=
 =?us-ascii?Q?6OzUMe05OkdWzuXhs5GLl7DKZ7zwfMRvvtWOXvKfZJ12r9ijwh9cyBTLyUO7?=
 =?us-ascii?Q?pwUKbiNmAc1kVOobkjfW0U+M8VMKzmlpq2r/Bwv8lKSLt8E6oX9t+0o9SK/R?=
 =?us-ascii?Q?LZwjcJA1vRV0OZMynPI43ZNuXxihf3kwm8WSx35UBPpsgFBnY9dS0TibaEuk?=
 =?us-ascii?Q?g5TX1Ei6YmRDY4XZJ9COK/F+ppeKO99wdUPbc9xn4Kt93YCsxIYp7C6KJX/p?=
 =?us-ascii?Q?yNgwyUdNtpayWFiVxmP6Es87OCmVuOA7JEUc8B+0NNMPBozT++K6SWelMnnH?=
 =?us-ascii?Q?+LrjAHrd09jal1Ll0umdU7lx+RGnOkrchB5K2f7UC3MBjJzU2opqceNJel6e?=
 =?us-ascii?Q?48VYjz29watJGRf0jHeBkoY3Yxpvuf/igMQNX/nT7d66wVsBf7G+j+pVZYYr?=
 =?us-ascii?Q?yVCzdu3yJngPylKkv+/QcXiv4xF5AuaEkhIj6Pf5I2KfqehKwlrMGucz95If?=
 =?us-ascii?Q?ix58r0r6aTtWjIWkuG3Rl8Xwpw8U9+OrsIo71TP8o1d7lZqfLTERA1n7/B4O?=
 =?us-ascii?Q?/Nkj2VTr+u+gewHg2OzwLzYF7v8E3y51GCQDJvLjlA2kVAqdTC6PbUcDTr6E?=
 =?us-ascii?Q?vsOXTcE0JYjuJRSGNAER0+COTq6J7ePrlLpNXeXNPgyBwwQalb9EDTFvTg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 05:54:34.8884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7c46cd-2c69-491f-4ca0-08dde20989c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366

Extend the existing Tegra186 GPIO controller device tree bindings with
support for the GPIO controller found on Tegra256. The number of pins is
slightly different, but the programming model remains the same

Add a new header, include/dt-bindings/gpio/tegra256-gpio.h,
that defines port IDs as well as the TEGRA256_MAIN_GPIO() helper,
both of which are used in conjunction to create a unique specifier
for each pin. The OS can reconstruct the port ID and pin from
these values to determine the register region for the corresponding
GPIO. However, the OS does not use the macro definitions in this file.

The symbolic names help associate these GPIO specifiers with the names
used in the technical documentation available for the chip.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   |  2 ++
 include/dt-bindings/gpio/tegra256-gpio.h      | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/gpio/tegra256-gpio.h

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index 065f5761a93f..2bd620a1099b 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -85,6 +85,7 @@ properties:
       - nvidia,tegra194-gpio-aon
       - nvidia,tegra234-gpio
       - nvidia,tegra234-gpio-aon
+      - nvidia,tegra256-gpio
 
   reg-names:
     items:
@@ -155,6 +156,7 @@ allOf:
               - nvidia,tegra186-gpio
               - nvidia,tegra194-gpio
               - nvidia,tegra234-gpio
+              - nvidia,tegra256-gpio
     then:
       properties:
         interrupts:
diff --git a/include/dt-bindings/gpio/tegra256-gpio.h b/include/dt-bindings/gpio/tegra256-gpio.h
new file mode 100644
index 000000000000..a0353a302aeb
--- /dev/null
+++ b/include/dt-bindings/gpio/tegra256-gpio.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+/*
+ * This header provides constants for the nvidia,tegra256-gpio DT binding.
+ *
+ * The first cell in Tegra's GPIO specifier is the GPIO ID.
+ * The macros below provide names for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_TEGRA256_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA256_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* GPIOs implemented by main GPIO controller */
+#define TEGRA256_MAIN_GPIO_PORT_A 0
+#define TEGRA256_MAIN_GPIO_PORT_B 1
+#define TEGRA256_MAIN_GPIO_PORT_C 2
+#define TEGRA256_MAIN_GPIO_PORT_D 3
+
+#define TEGRA256_MAIN_GPIO(port, offset) \
+		((TEGRA256_MAIN_GPIO_PORT_##port * 8) + (offset))
+
+#endif
+
-- 
2.17.1


