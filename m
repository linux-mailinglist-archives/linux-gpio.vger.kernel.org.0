Return-Path: <linux-gpio+bounces-26364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 338C2B889AE
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 11:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8580D5A2BD4
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 09:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A2425B2FE;
	Fri, 19 Sep 2025 09:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S8f1qbyT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012052.outbound.protection.outlook.com [40.93.195.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548AF2F3C2B;
	Fri, 19 Sep 2025 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274617; cv=fail; b=IOhacutzRNpQtWaIJIn48xzUO+HDv+YWwNqi2zOKYHWCRjTnLxU3JNq+W/BZGdwThc5xXIU8aHIyrnh4WxqCDZNtZQ6WDapiLmV7OHRZa4MYHMrEw0mIexAInl9DTyHGqQlIDz1wk3sKrEgyrTtp+jlirCgOHgvFlm1VIWwNI4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274617; c=relaxed/simple;
	bh=hkajzpKRJ5JUL71GPaw80VW1gVXBYR3LMuhEB7IZd70=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SSgtGTH1gdtQKsn6wp8jIWjazxra3Uxmwy3HhiQIW7A9f7MUSU54T/97laOmG6fZHKbdqhuazAsCqOj27cp4FrWwcohCDmTOYSjY3pS8V4eh+OyKkkGbz/br9ySkqDvaEMHSWDceSwQByC+8tOCI+yofolFs+vICY/5FPkyoFGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S8f1qbyT; arc=fail smtp.client-ip=40.93.195.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKqSPexC+4sZmt3JII8nBJMkgJ5P0tkkOBXf3zJKuLQ6IHyyAOiPr99eP1h6bAj4UiUcVbWwAalld57Ej+kHdpu1CMncf94WUtXZi9/X9QFdha3TgycJ7H5uhrOHXYsVrJJZ1ipzi6UqMFSc3MPxHcTC7jKt3ozzcs0HSejxFhTe1wiCzwci/GPESEMqL2D5i/fCyZ3ZRl7HOb2293LD+mjmVN5u1hASCkmVuNAluKFIFG/H2RKznWQmG8HyyiLw/k7n2LjVcEIsCFb9ikz3D1XBGZYXlGXWoVFl7xgILCbZ+7xovB3xuS769G6RddqRrwNsuV7yIibvY+jQmPRQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX2rMF17/fOellkUx8gQzKgmDrhLvnxbE+rtDkCHWvQ=;
 b=u7c1OPte2pLqdFx6rmiKX4nHJGpgB6JwUh6y+6Z3O6ClUUbOuCkC6Bpwmn7wQ1g2O0khv3ydmwf2f/vS21HfrgnnmyAg9I0p3eowRo5Ub85gBN5i++T8B5msz5bZ5T28p3vn+gAg5aN+UwoPSvTx0zjA6F10N+4F4iaBAFRmhv/Wfj+ydfMiz5mlZgekSISV0eM9JM6D0AoqvMASNO+fEyabdfJ9A39pZvu7aS2OyUyAwBaRiJexqsaFDhbUPidKuC1dDi6NHSIxP49pa1C3sFMx4CEiO2+XC7CfI1ClQn5kPq39njLXGBviN5RxciDlLs0CUHWgGcRayS5nNj2FXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX2rMF17/fOellkUx8gQzKgmDrhLvnxbE+rtDkCHWvQ=;
 b=S8f1qbyTF/QTu1gBnBSt3v1SOlbdG1w/HjvK+YGp9o4lIJlnDLTie70P9/6xt1Wfwp7nr8Dq9a5a7pLxgMhRyo5d11tgY5YauRyanYrlUkiWrc9n5z/vj+yyZsELhQ4vlYI2bsZWTTfbZZMZm7Jn9Ins1NWdEYrFii53DOWJjGepjXNBVVpJwU04+cy0dh/DRLuQ1pwZP2AudRouy5TeocCyfyN70LuoYCD/HpCJ4O+ftXTLpLAMHx86zl2gtqifT7/BgeaTy/4SP/wMEAheZeuZg8Jv4qRBxOKrgJbFOdmENJh/5rB8r5nY+48CehVYgicI03bYbe6QFcFV208sLQ==
Received: from BN9PR03CA0932.namprd03.prod.outlook.com (2603:10b6:408:108::7)
 by CH1PPF946CC24FA.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 09:36:52 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::82) by BN9PR03CA0932.outlook.office365.com
 (2603:10b6:408:108::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.16 via Frontend Transport; Fri,
 19 Sep 2025 09:36:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 09:36:51 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 02:36:34 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 02:36:33 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 19 Sep 2025 02:36:29 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Prathamesh Shete <pshete@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: gpio: Add Tegra410 support
Date: Fri, 19 Sep 2025 15:06:26 +0530
Message-ID: <20250919093627.605059-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|CH1PPF946CC24FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 76458936-d395-464d-f897-08ddf7601030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?umw34cdvapC2DsIKyrBf1rGahFpQa+Y7RBoxsifQQ99R+yD5EZQA9OfkxSRB?=
 =?us-ascii?Q?MzLRV6g3Hcbq6SF6TKOmaUD/N6eiNbZBR5G8ynkWUdvwoLtcwixv/cm1EN/F?=
 =?us-ascii?Q?qGVqjdsiPTIeUPLnxWPN8PhdFCMNRKy573ghEuwSz7x5yRXEH4aTUOms54R6?=
 =?us-ascii?Q?2CVb4lvaR24XPFXYnQrc+BqqE57QjnPXTcVnML6EEFrVAFd7h2H7CdAhpMH4?=
 =?us-ascii?Q?vc514lrd/4XIzsV+QuFuAYk6kCUGnCedJFTQN481eXDMQNBuuMzqbnvdzt3G?=
 =?us-ascii?Q?P4nIVjmKtXKnxLWY3ki7e+YTai2rFGnkb2zkGmtmYhE8w9Upgcg+le0hLYzm?=
 =?us-ascii?Q?cH0qvDFt3BM8p+Okoub7KYRxvbu9qNv/yNRVPGfGlajrSq6uXB5bFgYITeCh?=
 =?us-ascii?Q?GC8lfcNU/ddPvbIikiLWipDr6WYbgLOmY+lET74u0mmBd8NPOqAo3MVoFxBV?=
 =?us-ascii?Q?TasAb3zMgcoH307dmkWxpg0uC29f91RNWRGzrC99xw4poFGc43NB4pWo+ao9?=
 =?us-ascii?Q?i7DG8/+vl2b+1txZTP0DHi/siGRyn/2chb4sYZdrtq0eoAT3cYVeR0W/ZSPU?=
 =?us-ascii?Q?Ib7jYiKBaiLynZmSg9F5kW8GgPuSvx9ziXWvVNcjJ2cRigvDA7lsWQt3lv/4?=
 =?us-ascii?Q?hpidgmQmdbwfM0LmOLCtjUZHsFEjEVNMgOo6M69Ed1pGS2c1Y2nliY3gmuAG?=
 =?us-ascii?Q?oXIuUc+7o6fTF/m4TXLkferYd5HZOPFXCjVkOlqByj9nm1NlWRQzQoSg/X40?=
 =?us-ascii?Q?EPGRyBdvtLP/+xvksor/KhWEaJ2DGhSVA91umfgSTHKVbXJLeMU2riZ8f15p?=
 =?us-ascii?Q?/Nkso0j1JoGYkFzjAv+8XrUa1chSmg0MLqEQlD/DhmVbAwYiGAPFGwRZe3Uo?=
 =?us-ascii?Q?NzMHFhnrKEyXlmYCEMNGjbnFhhBzclkAa6qNqI2ulMnCj0cPbM2wy12ykTcQ?=
 =?us-ascii?Q?3V1Tt32nqVb0a0cNfcDlsYcpvz66H3BSIKYLK+fgGz79jDoIkuiRlIsZtPoQ?=
 =?us-ascii?Q?t5B2t2PvpkGWhJI4HHkmnMfBIbtC8RVnGYTgVR+N+qJwfuFrKgEEl5etZcWM?=
 =?us-ascii?Q?ijCBH42H98JPiPb2a9KedrF2pjr0sKMX8AQhxKl8dw5gbperuP0CCEEU0ML8?=
 =?us-ascii?Q?Hv1EWX2UKLZBLkMqJxOVvd1F7+k/YAYg+V212RyelC/alNWe/Si/a+FOQ+/q?=
 =?us-ascii?Q?0xf1ow6PeYemYdGWcb6S7UHnMcZe/3FtpSUY89gDIm4q0JGxRgwz0w/8Vk2e?=
 =?us-ascii?Q?i9GTd5pb39pGbAeoLeoM5JFXedQRdkJfUl7OEfinYoiEs6Fpcg7A00gvkuwi?=
 =?us-ascii?Q?WBm9ITyA+0wueuMngAg/3/6OM1t9d62RlMD+ZWn8lq8fXv9h7A4wwGErB3Fa?=
 =?us-ascii?Q?+LGrDDs5axt0wOh4lx26S6PnrcFBBmegqhKoou7OxLQ/b7QyBZi8DwhD1RaI?=
 =?us-ascii?Q?W7koFVzF+x7+Bp34pgb3tbjJuCfh6pPTm3JlfZhwZ4OJwlqGSe0UXv7KHmfE?=
 =?us-ascii?Q?EFvcmRSSvLXo8Ab+Jz+N7vjqIGQIKnuBGwey4EnyvVg1lphHHr8HKU65dA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 09:36:51.5062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76458936-d395-464d-f897-08ddf7601030
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF946CC24FA

From: Prathamesh Shete <pshete@nvidia.com>

Add the port definitions for the main GPIO controller found on
Tegra410.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 include/dt-bindings/gpio/tegra410-gpio.h | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 include/dt-bindings/gpio/tegra410-gpio.h

diff --git a/include/dt-bindings/gpio/tegra410-gpio.h b/include/dt-bindings/gpio/tegra410-gpio.h
new file mode 100644
index 000000000000..e4d042fbacb2
--- /dev/null
+++ b/include/dt-bindings/gpio/tegra410-gpio.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+/*
+ * This header provides constants for the nvidia,tegra410-gpio DT binding.
+ *
+ * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
+ * provide names for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_TEGRA410_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA410_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* GPIOs implemented by main GPIO controller */
+#define TEGRA410_MAIN_GPIO_PORT_A	0
+#define TEGRA410_MAIN_GPIO_PORT_B	1
+#define TEGRA410_MAIN_GPIO_PORT_C	2
+#define TEGRA410_MAIN_GPIO_PORT_D	3
+#define TEGRA410_MAIN_GPIO_PORT_E	4
+#define TEGRA410_MAIN_GPIO_PORT_I	5
+#define TEGRA410_MAIN_GPIO_PORT_J	6
+#define TEGRA410_MAIN_GPIO_PORT_K	7
+#define TEGRA410_MAIN_GPIO_PORT_L	8
+#define TEGRA410_MAIN_GPIO_PORT_M	9
+#define TEGRA410_MAIN_GPIO_PORT_N	10
+#define TEGRA410_MAIN_GPIO_PORT_P	11
+#define TEGRA410_MAIN_GPIO_PORT_Q	12
+#define TEGRA410_MAIN_GPIO_PORT_R	13
+
+#define TEGRA410_MAIN_GPIO(port, offset) \
+	((TEGRA410_MAIN_GPIO_PORT_##port * 8) + (offset))
+
+#endif
-- 
2.43.0


