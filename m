Return-Path: <linux-gpio+bounces-30542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A9FD1E2C5
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 416BC309DE2D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81043939A3;
	Wed, 14 Jan 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XO36T9jN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5AE39281A;
	Wed, 14 Jan 2026 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387164; cv=fail; b=Mf+YdXxn6XhpnC22QZnsF+sa/qO5iHArhm0LkD7Cd+kv1DY4bZGmszMW6MdRCJ+W0TPsyJzFC7gTi92ccr2HBEGaFzerDEn/0vhHvpdD4L1EITCz9jlhWWhpGkHVjTavCcQFtIhvDpQ4BgRbloY4lhqn6Otu6kKWmFDajFyITbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387164; c=relaxed/simple;
	bh=9hQuVBGDZV2fTOMTfjE96TogCwc840dTBMNKIEYPc94=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vh1rE6sxDNbWeCsLyh6O6LDrfc/ZKwmhGXcv70BFM1FpLDYlUDrN84a8AgbirmVb884TJE0cqSAF1iGwM9Evso9imMJYEnt6Ew3VweGREklDGKAelJIEE6lorVq+foPSBIy88wSmkJWOfssjFVWVNMvI6RY9hfwp4SQJhHReCB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XO36T9jN; arc=fail smtp.client-ip=40.93.196.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+CNE+GQD5wPiUbHnKCeIl0i3quZh0qOe9OA3Yw5DPmqE0SNU6SQf7t7XK0d41lnDFqvES2Ajgx2IVYA17k0nNhARC2JdhnqwyPX5nnrKniCvUQ/nS6lHOfPmxWrysT8oSayLUDpBTzlBZw0FsKvvKEbVc1LWhWsq4BwBje2zWewffZ87JRozQQLkv0AD8fwZdX72yWld9yL1AyDpnpzeDs0g6c7LtXptH30cbRScfnbIXJJmr4vdIGGGcNuf9tEzMsZEGGDwsMP7IFahmzldTNGlKtROS0FaO7xQj/r+9TMXVDbPH9s3irjWLGNuNpZ5WkZLXQ5K9xumIS7SIXeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AADHFR1/oxy1ZzhAlw0W/+IrUZ0Cwo5j9mFK8vlbVhI=;
 b=Vlo4cE2h6Jlihkk1IdTIBMC0YL4LixZhVMsLq/oIK62Smvqu9xZ29BrRIUWYYKTWcHNbmuUfzXHMYoxPDwTG8MlPJShW7PJBPyM2i0IyZzSRc/LpHHjXDaxOK/R/q8AFo0MwhZ0IeXlfBW7P+2X9XAVotYPfbebt9zSpytA9f2WXGXE/jT1nXJCwKEZTuhy13fQvfgBzREgaUDnNW3ASHGrVoAlz1wVTeGJRE4WA6KMAcEUEWJEVPFNeLU98M2lHEZgYW9jE2VY5bwsFZRozlwLvPqX/ELG4YNPlnWVsEOwydNzzunGjUrREUPWz8d4NcZDr5lqXV3/SpnhpQXC3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AADHFR1/oxy1ZzhAlw0W/+IrUZ0Cwo5j9mFK8vlbVhI=;
 b=XO36T9jN9u4ZGg7PCd965ur2egBbc1+pDLKXaus/PPzaZbqYtEc+YIhKuWRSagn1MDct9hbQ0EvP8HEYe/ZaaJXtNFFqjtp6TaJ/O0O6wHRf62pLnvwxG8seo+xJ6pU3kKUxNHG8sKFPwrmxOX206lVaGKDlrSYwMHms9zgETQnI425Gs5nqyv/QrxToXccHFH/pvbFrTI0nwXY0Of6giNshtv8P2oMSWVKpEaXzhae3bltSav1p1zLSiwHBttf2McbfDeMIH/BN0V+x8/Ym0mTD/+Hj0/ZTwF0OnBbK2c7PZJZASW0bhyIgME4Uq8EUDlupqVCVbE/XONrg9d34Iw==
Received: from SJ0PR03CA0064.namprd03.prod.outlook.com (2603:10b6:a03:331::9)
 by MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 10:39:18 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::9d) by SJ0PR03CA0064.outlook.office365.com
 (2603:10b6:a03:331::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 10:39:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:39:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 02:39:04 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 02:39:03 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH 2/3] gpio: tegra186: Add support for Tegra264
Date: Wed, 14 Jan 2026 10:38:45 +0000
Message-ID: <20260114103846.687338-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260114103846.687338-1-pshete@nvidia.com>
References: <20260114103846.687338-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|MW4PR12MB5667:EE_
X-MS-Office365-Filtering-Correlation-Id: b820d34e-1020-42a9-186b-08de53592bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EwGQ6g7Dk4sdHqfUe0qJZ4tDnXtt0/gSKcxx5qNH0BZqixu7dSPsZwG2erxQ?=
 =?us-ascii?Q?NSBd6VKA1SbLCQd5VpVvuB2juMO2kno5sGZHoVIdI6nW/LbIAS6rmaEGT6z0?=
 =?us-ascii?Q?8eHMCY+cNQ51BiFxc5J0x9cOfHI3CSDyP4VdKyHjwsPDMYUPGlc1WO6dp6Tf?=
 =?us-ascii?Q?fgFx33kX0RwijwKPbubcp5xo9ROfLEOz0c+neW/tLzPHVQEW7hZ+v+LkQutX?=
 =?us-ascii?Q?JrrmibPk69xN7emCz2WI24MhzaJ1D/lx9utfwYmYXdMuX3RUw+TUIWcipZq8?=
 =?us-ascii?Q?q4yPg6Ohpj4r4j8SEuzH/qd0R+z7niCnAY3vRl8SSbYApOVjdZb1orQtubgo?=
 =?us-ascii?Q?OiMesuuDW2kbTHPOrWF0hrqanL/Bsp8xak7S5TVgkh1aMD4JnrE9jIvojIyu?=
 =?us-ascii?Q?J15KWtFx19Ns+hM1pmPCQhSN8IJIqeSNdP2N8lonDHCyR6dYVJT661QNZX00?=
 =?us-ascii?Q?fmRRwVo6m/dX9TwajdltximcACbqBa/RH8lXc220ioAe/cxeTrz5gwT362Ru?=
 =?us-ascii?Q?lKXH/WHeYCcX/ZmLNzwYKZ18XT2rffty/ztWRjixzGX2gr3mBUyThl+kJWF4?=
 =?us-ascii?Q?tsCG900RbvGg2LT7zR9e7r/DjxgaGVOtf6RrRoo74INh0VZyu2Zkeb4QukZe?=
 =?us-ascii?Q?5ICwzlVdSYal6WOHjg37wv5kwFqnzJPFVpbgwOiKTBR9uwFaf5L6nTOV/RaS?=
 =?us-ascii?Q?0tILSbsMefDSOKB1ZhsF88lV0nmzR2pxgFTQjSP8t7onPrsKuYnSb0T6aOOP?=
 =?us-ascii?Q?ul9EQMlLvBSGd9JUTojJPuppKUkBwm0qd1M9NkUIECWBsmzeTC6RUb23Ec3v?=
 =?us-ascii?Q?L3OIjKEcxb7n5k3vr4n2YEJEujl+sElS0O0gxHasnFy+Z9f009VFJyBIatRf?=
 =?us-ascii?Q?XPQdJ95x74TcRW0XAW5L6ROUG+d0/4jifiVNFELURh9IUnpjjUuBm50b+U3V?=
 =?us-ascii?Q?yUGG4u4SauMN/MfW2IK4uJ75ONeuW8y1ZfNal9KEqrLdspi7FPcrvMVr0Qeq?=
 =?us-ascii?Q?hOIlp2EmAlCXiRFL157fsrXhwP96/SdCrniwlucnHJRqTz7ncUabf816DvHW?=
 =?us-ascii?Q?arAg7625y0MdAZqQZH16JEDbExPfAnmbASPYikT6DFfbyEhSoFFkQwBLWYqG?=
 =?us-ascii?Q?MQkRe6yF4fbVQlGv0D59WWeY6NuX7QrqE8lcitFiWxRjzqDR+wsCxrACRpup?=
 =?us-ascii?Q?iIkT4a1Avrd6BIrwiQGNdF0xw0xaqo1FWdvoKPyjqh5FXMk+uR4mzQ9Dw3kE?=
 =?us-ascii?Q?ViAaiuewarrP6HS4BDFmL2hPiAfiYdhFS4AQ21P17acDSfOgK/1Rp4yettuG?=
 =?us-ascii?Q?zXl25qKIy2/i2QptM7Y8HwHOkuk4nKZ3y0BIh5CaTSIb0FeiT74pX72IEhub?=
 =?us-ascii?Q?E9WvBktd4l6bEHtGyeL5WWlL7xTWwG0SnrCUu1ut3mP9ihvB98HnATtg3MCk?=
 =?us-ascii?Q?ltLfhFU0E6H10w5udxTjMgsr4GmsI6xKF7Ng/1FIVm+H1YX7Lh/g3xXXM37D?=
 =?us-ascii?Q?vcvHW2VDdiW3cb4swlW/Bfcu7PkWCpTWXO6/lg+tOLNa5DTR+tZEc4HxpmxT?=
 =?us-ascii?Q?nZieeHH1XgVtzWQVEjzDb6Po9bTacnjjYqTGoUDLW38DJo3PhS03B0vxgkeC?=
 =?us-ascii?Q?zefEGdbrOFEvHd6QprcqcDQkiQXV/9mOlnXrWJ7q1bh963N7imbprPv+pUfl?=
 =?us-ascii?Q?RjCuFA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:39:18.4931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b820d34e-1020-42a9-186b-08de53592bd2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5667

Extend the existing Tegra186 GPIO controller driver with support for the
GPIO controller found on Tegra264.

Use the "nvidia,pmc" phandle from the GPIO device tree node to
ensure the GPIO driver associates with the intended PMC device.
Relying only on compatible-based lookup can select an unexpected
PMC node, so fall back to compatible-based lookup when the phandle
is not present.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 90 +++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index b1498b59a921..b05cfa881f6f 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2025 NVIDIA Corporation
+ * Copyright (c) 2016-2026 NVIDIA Corporation
  *
  * Author: Thierry Reding <treding@nvidia.com>
  *	   Dipen Patel <dpatel@nvidia.com>
@@ -21,6 +21,7 @@
 #include <dt-bindings/gpio/tegra234-gpio.h>
 #include <dt-bindings/gpio/tegra241-gpio.h>
 #include <dt-bindings/gpio/tegra256-gpio.h>
+#include <dt-bindings/gpio/tegra264-gpio.h>
 
 /* security registers */
 #define TEGRA186_GPIO_CTL_SCR 0x0c
@@ -1001,7 +1002,9 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	if (gpio->soc->num_irqs_per_bank > 1)
 		tegra186_gpio_init_route_mapping(gpio);
 
-	np = of_find_matching_node(NULL, tegra186_pmc_of_match);
+	np = of_parse_phandle(pdev->dev.of_node, "nvidia,pmc", 0);
+	if (!np)
+		np = of_find_matching_node(NULL, tegra186_pmc_of_match);
 	if (np) {
 		if (of_device_is_available(np)) {
 			irq->parent_domain = irq_find_host(np);
@@ -1277,6 +1280,80 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
 	.has_vm_support = false,
 };
 
+#define TEGRA264_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA264_MAIN, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra264_main_ports[] = {
+	TEGRA264_MAIN_GPIO_PORT(F, 3, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(G, 3, 1, 5),
+	TEGRA264_MAIN_GPIO_PORT(H, 1, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(J, 1, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(K, 1, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(L, 1, 3, 8),
+	TEGRA264_MAIN_GPIO_PORT(M, 1, 4, 6),
+	TEGRA264_MAIN_GPIO_PORT(P, 2, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(Q, 2, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(R, 2, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(S, 2, 3, 2),
+	TEGRA264_MAIN_GPIO_PORT(T, 0, 0, 7),
+	TEGRA264_MAIN_GPIO_PORT(U, 0, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(V, 0, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(W, 0, 3, 8),
+	TEGRA264_MAIN_GPIO_PORT(X, 0, 7, 6),
+	TEGRA264_MAIN_GPIO_PORT(Y, 0, 5, 8),
+	TEGRA264_MAIN_GPIO_PORT(Z, 0, 6, 8),
+	TEGRA264_MAIN_GPIO_PORT(AL, 0, 4, 3),
+};
+
+static const struct tegra_gpio_soc tegra264_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra264_main_ports),
+	.ports = tegra264_main_ports,
+	.name = "tegra264-gpio",
+	.instance = 0,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
+#define TEGRA264_AON_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA264_AON, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra264_aon_ports[] = {
+	TEGRA264_AON_GPIO_PORT(AA, 0, 0, 8),
+	TEGRA264_AON_GPIO_PORT(BB, 0, 1, 2),
+	TEGRA264_AON_GPIO_PORT(CC, 0, 2, 8),
+	TEGRA264_AON_GPIO_PORT(DD, 0, 3, 8),
+	TEGRA264_AON_GPIO_PORT(EE, 0, 4, 4)
+};
+
+static const struct tegra_gpio_soc tegra264_aon_soc = {
+	.num_ports = ARRAY_SIZE(tegra264_aon_ports),
+	.ports = tegra264_aon_ports,
+	.name = "tegra264-gpio-aon",
+	.instance = 1,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
+#define TEGRA264_UPHY_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA264_UPHY, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra264_uphy_ports[] = {
+	TEGRA264_UPHY_GPIO_PORT(A, 0, 0, 6),
+	TEGRA264_UPHY_GPIO_PORT(B, 0, 1, 8),
+	TEGRA264_UPHY_GPIO_PORT(C, 0, 2, 3),
+	TEGRA264_UPHY_GPIO_PORT(D, 1, 0, 8),
+	TEGRA264_UPHY_GPIO_PORT(E, 1, 1, 4),
+};
+
+static const struct tegra_gpio_soc tegra264_uphy_soc = {
+	.num_ports = ARRAY_SIZE(tegra264_uphy_ports),
+	.ports = tegra264_uphy_ports,
+	.name = "tegra264-gpio-uphy",
+	.instance = 2,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
 #define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
 	TEGRA_GPIO_PORT(TEGRA256_MAIN, _name, _bank, _port, _pins)
 
@@ -1368,6 +1445,15 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 	}, {
 		.compatible = "nvidia,tegra256-gpio",
 		.data = &tegra256_main_soc
+	}, {
+		.compatible = "nvidia,tegra264-gpio",
+		.data = &tegra264_main_soc
+	}, {
+		.compatible = "nvidia,tegra264-gpio-aon",
+		.data = &tegra264_aon_soc
+	}, {
+		.compatible = "nvidia,tegra264-gpio-uphy",
+		.data = &tegra264_uphy_soc
 	}, {
 		/* sentinel */
 	}
-- 
2.25.1


