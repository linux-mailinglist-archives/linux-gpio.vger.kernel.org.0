Return-Path: <linux-gpio+bounces-17077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3BA4F160
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 00:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6166216D5A7
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 23:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A194278140;
	Tue,  4 Mar 2025 23:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XV8MwKD0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A601F03D7;
	Tue,  4 Mar 2025 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741130483; cv=fail; b=ue45O3DvFCUMemMHM95zIISubxfgEDWg9f2oPxyby1ITvqVxX9tQ0Ff1E23ahWY4WwXgUbwDNdxn/9C+39CJ1dsz+P9x9o1OeKV+EBZvkQFC1o6VKtfLUTMjFPfemeVzh3qWq2s0m0MKnqQR2K6wEXVBCtY1LISw/8Zhyr7Pbm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741130483; c=relaxed/simple;
	bh=L6ZLD8g5+1J+C1+XoOfzhJoLpKODFkQJcTY9eVmrdBg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IYsqaPNzk+OX8+RpTRBFDTa3WBKuqBF/QXvrGpSv3qHHBaUXucR2jfz7ki9cfs/JivMupFSNYDkiK2k/3yKKu8yR03IjQDlnGrUqWyn67fgdeumGQrPelKKME/1iAQayZssGxs/adOYvC2zde8wulagIbZLztWoIqBq7yS4L33I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XV8MwKD0; arc=fail smtp.client-ip=40.107.223.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+u/rYRHhV34xIK0b54Bmr4Wnld5DYP0qTJwcSs29oAre6kOWGv3SOU167Kl61UnXQz7w1mwQ/KyJdrEAzKS0fSD3cHRR1bWUsH+ow5rrKdbFSHBQTkx5XhPAQDu1dZYdZg7HCHfSC9RHrUy5HBTGoaDkodukLfRBweCgekLJaGj0NAHuklFpzOOrsGCgC2/EdwBuFJIonmdTf0Kqkr7myZ1Tzs7gIM4Lc8Uqq4wVXqPDo5fup26pE9aAsJWuFsMX2UqA89MTon4zUbmWbhTLm/c9tg59IoC7hSsSzZDjkl+1tqQ+A5/eoGXPml7K4sEfsDYGat6m7nebUrX2R42oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO76nkdXrzczWoSSqJc9Ets6KoZfaqQPkiA4Y/8HQNY=;
 b=NbQBaSEBWhCOEQx2LYyl01M8n9jYwBeG5ekIZyDy9fanppaP0QnWYxozEAier5XoMcjjNjCKimUHBR1mRN7MkTKKnrbyQvsQAOr7Ej0sCenmrY5NhJgkh6iEoHYYYN2Bp4qNoP+i03t8gh1dXUwIc6bqu2N8cwwhROgi1CDINs43LNCm3tWRYZFUNyMfh/jBCgm2ZHAFUvzdlKOeJaw81zYQ3v79491w73SlcffC9OtO4QSLLkwicIjFGWEGrH/GbmyLY3Q0uPmYI3lHNxT1VEXPpozRW8bjJFft/ahvsjI88Mk9iD4GIknHWSrJgKo6yDnDw766j3VR4ZAgaFOH8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO76nkdXrzczWoSSqJc9Ets6KoZfaqQPkiA4Y/8HQNY=;
 b=XV8MwKD0VN3sOl9IyR5w7hYo/Ialj4CSh6sAmqmp0SkbZu83ULvB1fu4pfa3RyMWEAXTGvG/Y1sBnyMa0KnDX2x6NLG7EaVoOwta1cpWMSuED3iaTcJNA+vUfdTz633vzgfFTSZgE+dq51z+e78SvrixYz0f2BHl/DN6GKmoAZY=
Received: from BN0PR04CA0045.namprd04.prod.outlook.com (2603:10b6:408:e8::20)
 by DS0PR12MB7702.namprd12.prod.outlook.com (2603:10b6:8:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 23:21:13 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::71) by BN0PR04CA0045.outlook.office365.com
 (2603:10b6:408:e8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.29 via Frontend Transport; Tue,
 4 Mar 2025 23:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.4 via Frontend Transport; Tue, 4 Mar 2025 23:21:13 +0000
Received: from maple-stxh-09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 17:21:13 -0600
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <linus.walleij@linaro.org>, <krzk@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <dominic.antony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v2] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
Date: Tue, 4 Mar 2025 18:20:31 -0500
Message-ID: <20250304232051.2936557-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|DS0PR12MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b80158c-01b2-4838-1556-08dd5b7341b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uo5tHbSXQOaMoCjBR6OI4JprxSMbC9NHwa7k4fNu2nGrI5W3896N6zfURcaL?=
 =?us-ascii?Q?bR95xBZw/RvcNhV/xXyRc5Aaq6IOepyKKKQJ94JCi9ZFyFWKaiSmsWNdWwpa?=
 =?us-ascii?Q?dkaWm/1B49/etZrT3kVMdb3jdZxAWadjTlc4h3IHEJUKIHTbvv68caH1FoXV?=
 =?us-ascii?Q?16iGR3UB675xDs4fnGIUqKVVwG/xjGiJ7WwZECuOt1DHgteU+h3w7PTe3EHQ?=
 =?us-ascii?Q?ysK7WvwM6aHGWPufdeUUFNsa4fITiB722u4Ll9Sd7B4O3Xgzw4xvXK14dhE3?=
 =?us-ascii?Q?L2HGMYZUpfKpKuPNrXBfDCqCXDDgIj2WKelAZTiLhN0GQSc1Z9riBK2MTA51?=
 =?us-ascii?Q?1cZZc75YQiD8Ctg4FiyOVmj6f5VNzrSwQr6PlidpJtF8wtKz+EyKltjoiKlj?=
 =?us-ascii?Q?Md1/CH2wUNb1rrljXhdrxUGuAlYl4Iou70IF6hdCb8NQ/7NYeyHgXi0klH/D?=
 =?us-ascii?Q?yZw5Pq+rdI2Vf7Np7YyqUZuo8DeXv9zDd9thq4FMc/lF8yPCt89PUXJ/fa5h?=
 =?us-ascii?Q?+tTczI/nXE+f9pEjKqxUrPzdPjQlLMAM2kpgyn6eHyQwa9hX3yYQDoz8A3K+?=
 =?us-ascii?Q?KU8SSsA2ndGFIMRWgcSW+LKzX+taD9GbweLydwKpFu12TQzz7CdVoG/5HrOe?=
 =?us-ascii?Q?isJcfl7i66Y+/r6KNOx3kQUNyR/1G045uz/1tG/nVCPKZH/IsCX5QZtCPXnd?=
 =?us-ascii?Q?8D9H8DJgI5KC/hapo5qUT4TJr2O8s9HoKy4ES9CibGLyw9Jy2e3pf1Z4QXop?=
 =?us-ascii?Q?DKczeA4suJi8gQI4NQu6lsyTtMvH7MPii56pqLrFGqnBF6QSQczsypdg3+Jl?=
 =?us-ascii?Q?6O1grHm0ez8V+lZeE1YiZYYNmtzMPKJ8zndHgsZvFg2mJqIPERrVOVit8pbo?=
 =?us-ascii?Q?xwJwwnq7qx5CzuslnZNSB8sXtWEir7s/fO4vKNLtUhnxZ2bDe/GCuUs4Znaz?=
 =?us-ascii?Q?QAXEvL8VPGKXJPmo4MyFGjBdhSaQ3zhqd33ANdL2YxX5znRIS9fO805dvG7b?=
 =?us-ascii?Q?qZIhu1kkEGpdOgpPQBK9GM/oWr1Otre5a4oQ1s3hrVFH3SZP6g1Njk5CJ1z1?=
 =?us-ascii?Q?GAxu2kzIhb7fJwWwGqMm9RIXoh5xrNBhZJvx8/W857BSULvGacvPI839b/zF?=
 =?us-ascii?Q?bY0AJj55hiMEIx/YbeLl1Q5r+g4gAgh7n8UQCV5G141YRqzaQDtpVIPMpkAf?=
 =?us-ascii?Q?0RmsVdpjapQ1mrZxyD44jotHkoZgm2sQ8R8RP5CZd2BP+rjPVc4iTfHc+wmM?=
 =?us-ascii?Q?QVWGH1kQVJqQxFbM8uS60Su23HkgyYmSs/GKMlBh/cAsTAnzfAM/r0N7UYwU?=
 =?us-ascii?Q?2sZhutV3UW+S+F64ktqsapJz/mgb8qmB1topg96e88IjcwICnb5332f1Wymy?=
 =?us-ascii?Q?Q+2QovpeU5xxLMweri8MgDv88KGWHSy85to7zgp18Lqp2yBXPb9Wmu7a5VGD?=
 =?us-ascii?Q?cCTQ1sInSmCLVAnSkGLX+Hlm66O7yoVUIw5G4Ynzk8CxxsLpeOdl8VgnUss8?=
 =?us-ascii?Q?fFuVmQ8p1qxu0W4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 23:21:13.7566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b80158c-01b2-4838-1556-08dd5b7341b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7702

Add pinctrl driver support for AMD SoC with isp41 hw ip block.

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
Changelog:
 - Updated copyright header
 - Removed noisy success prints
 - Dropped ifdefs
 - Cleanup header files

 drivers/pinctrl/Kconfig          |  13 ++
 drivers/pinctrl/Makefile         |   1 +
 drivers/pinctrl/pinctrl-amdisp.c | 231 +++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-amdisp.h |  95 +++++++++++++
 4 files changed, 340 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-amdisp.c
 create mode 100644 drivers/pinctrl/pinctrl-amdisp.h

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 95a8e2b9a614..5819f18b2ddc 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -49,6 +49,19 @@ config PINCTRL_AMD
 	  Requires ACPI/FDT device enumeration code to set up a platform
 	  device.
 
+config PINCTRL_AMDISP
+	tristate "AMDISP GPIO pin control"
+	depends on HAS_IOMEM
+	select GPIOLIB
+	select PINCONF
+	select GENERIC_PINCONF
+	help
+	  The driver for memory mapped GPIO functionality on AMD platforms
+	  with ISP support. All the pins are output controlled only
+
+	  Requires AMDGPU to MFD add device for enumeration to set up as
+	  platform device.
+
 config PINCTRL_APPLE_GPIO
 	tristate "Apple SoC GPIO pin controller driver"
 	depends on ARCH_APPLE
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index fba1c56624c0..ac27e88677d1 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
 obj-$(CONFIG_OF)		+= devicetree.o
 
 obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
+obj-$(CONFIG_PINCTRL_AMDISP)	+= pinctrl-amdisp.o
 obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
 obj-$(CONFIG_PINCTRL_ARTPEC6)	+= pinctrl-artpec6.o
 obj-$(CONFIG_PINCTRL_AS3722)	+= pinctrl-as3722.o
diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
new file mode 100644
index 000000000000..ce21ed84b929
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-amdisp.c
@@ -0,0 +1,231 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AMD ISP Pinctrl Driver
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-amdisp.h"
+
+#define DRV_NAME		"amdisp-pinctrl"
+#define GPIO_CONTROL_PIN	4
+#define GPIO_OFFSET_0		0x0
+#define GPIO_OFFSET_1		0x4
+#define GPIO_OFFSET_2		0x50
+
+static const u32 gpio_offset[] = {
+	GPIO_OFFSET_0,
+	GPIO_OFFSET_1,
+	GPIO_OFFSET_2
+};
+
+struct amdisp_pinctrl_data {
+	const struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+	const struct amdisp_function *functions;
+	unsigned int nfunctions;
+	const struct amdisp_pingroup *groups;
+	unsigned int ngroups;
+};
+
+static const struct amdisp_pinctrl_data amdisp_pinctrl_data = {
+	.pins = amdisp_pins,
+	.npins = ARRAY_SIZE(amdisp_pins),
+	.functions = amdisp_functions,
+	.nfunctions = ARRAY_SIZE(amdisp_functions),
+	.groups = amdisp_groups,
+	.ngroups = ARRAY_SIZE(amdisp_groups),
+};
+
+struct amdisp_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctrl;
+	struct pinctrl_desc desc;
+	struct pinctrl_gpio_range gpio_range;
+	struct gpio_chip gc;
+	const struct amdisp_pinctrl_data *data;
+	void __iomem *gpiobase;
+	raw_spinlock_t lock;
+};
+
+static int amdisp_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct amdisp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->ngroups;
+}
+
+static const char *amdisp_get_group_name(struct pinctrl_dev *pctldev,
+					 unsigned int group)
+{
+	struct amdisp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->groups[group].name;
+}
+
+static int amdisp_get_group_pins(struct pinctrl_dev *pctldev,
+				 unsigned int group,
+				 const unsigned int **pins,
+				 unsigned int *num_pins)
+{
+	struct amdisp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = pctrl->data->groups[group].pins;
+	*num_pins = pctrl->data->groups[group].npins;
+	return 0;
+}
+
+const struct pinctrl_ops amdisp_pinctrl_ops = {
+	.get_groups_count	= amdisp_get_groups_count,
+	.get_group_name		= amdisp_get_group_name,
+	.get_group_pins		= amdisp_get_group_pins,
+};
+
+static int amdisp_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	/* amdisp gpio only has output mode */
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int amdisp_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
+{
+	return -EOPNOTSUPP;
+}
+
+static int amdisp_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
+					int value)
+{
+	/* Nothing to do, amdisp gpio only has output mode */
+	return 0;
+}
+
+static int amdisp_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	unsigned long flags;
+	u32 pin_reg;
+	struct amdisp_pinctrl *pctrl = gpiochip_get_data(gc);
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	pin_reg = readl(pctrl->gpiobase + gpio_offset[gpio]);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return !!(pin_reg & BIT(GPIO_CONTROL_PIN));
+}
+
+static void amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+{
+	unsigned long flags;
+	u32 pin_reg;
+	struct amdisp_pinctrl *pctrl = gpiochip_get_data(gc);
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	pin_reg = readl(pctrl->gpiobase + gpio_offset[gpio]);
+	if (value)
+		pin_reg |= BIT(GPIO_CONTROL_PIN);
+	else
+		pin_reg &= ~BIT(GPIO_CONTROL_PIN);
+	writel(pin_reg, pctrl->gpiobase + gpio_offset[gpio]);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
+static int amdisp_gpiochip_add(struct platform_device *pdev,
+			       struct amdisp_pinctrl *pctrl)
+{
+	struct gpio_chip *gc = &pctrl->gc;
+	struct pinctrl_gpio_range *grange = &pctrl->gpio_range;
+	int ret;
+
+	gc->label		= dev_name(pctrl->dev);
+	gc->parent		= &pdev->dev;
+	gc->names		= amdisp_range_pins_name;
+	gc->request		= gpiochip_generic_request;
+	gc->free		= gpiochip_generic_free;
+	gc->get_direction	= amdisp_gpio_get_direction;
+	gc->direction_input	= amdisp_gpio_direction_input;
+	gc->direction_output	= amdisp_gpio_direction_output;
+	gc->get			= amdisp_gpio_get;
+	gc->set			= amdisp_gpio_set;
+	gc->base		= -1;
+	gc->ngpio		= ARRAY_SIZE(amdisp_range_pins);
+
+	grange->id		= 0;
+	grange->pin_base	= 0;
+	grange->base		= 0;
+	grange->pins		= amdisp_range_pins;
+	grange->npins		= ARRAY_SIZE(amdisp_range_pins);
+	grange->name		= gc->label;
+	grange->gc		= gc;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, pctrl);
+	if (ret)
+		return ret;
+
+	pinctrl_add_gpio_range(pctrl->pctrl, grange);
+
+	return 0;
+}
+
+static int amdisp_pinctrl_probe(struct platform_device *pdev)
+{
+	struct amdisp_pinctrl *pctrl;
+	struct resource *res;
+	int ret;
+
+	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pdev->dev.init_name = DRV_NAME;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR(res))
+		return PTR_ERR(res);
+
+	pctrl->gpiobase = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pctrl->gpiobase))
+		return PTR_ERR(pctrl->gpiobase);
+
+	platform_set_drvdata(pdev, pctrl);
+
+	pctrl->dev = &pdev->dev;
+	pctrl->data = &amdisp_pinctrl_data;
+	pctrl->desc.owner = THIS_MODULE;
+	pctrl->desc.pctlops = &amdisp_pinctrl_ops;
+	pctrl->desc.pmxops = NULL;
+	pctrl->desc.name = dev_name(&pdev->dev);
+	pctrl->desc.pins = pctrl->data->pins;
+	pctrl->desc.npins = pctrl->data->npins;
+	ret = devm_pinctrl_register_and_init(&pdev->dev, &pctrl->desc,
+					     pctrl, &pctrl->pctrl);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_enable(pctrl->pctrl);
+	if (ret)
+		return ret;
+
+	ret = amdisp_gpiochip_add(pdev, pctrl);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static struct platform_driver amdisp_pinctrl_driver = {
+	.driver = {
+		.name = DRV_NAME,
+	},
+	.probe = amdisp_pinctrl_probe,
+};
+module_platform_driver(amdisp_pinctrl_driver);
+
+MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
+MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
+MODULE_DESCRIPTION("AMDISP pinctrl driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/drivers/pinctrl/pinctrl-amdisp.h b/drivers/pinctrl/pinctrl-amdisp.h
new file mode 100644
index 000000000000..9e3597a03227
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-amdisp.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AMD ISP Pinctrl Driver
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ */
+
+static const struct pinctrl_pin_desc amdisp_pins[] = {
+	PINCTRL_PIN(0, "GPIO_0"), /* sensor0 control */
+	PINCTRL_PIN(1, "GPIO_1"), /* sensor1 control */
+	PINCTRL_PIN(2, "GPIO_2"), /* sensor2 control */
+};
+
+#define AMDISP_GPIO_PINS(pin) \
+static const unsigned int gpio##pin##_pins[] = { pin }
+AMDISP_GPIO_PINS(0);
+AMDISP_GPIO_PINS(1);
+AMDISP_GPIO_PINS(2);
+
+static const unsigned int amdisp_range_pins[] = {
+	0, 1, 2
+};
+
+static const char * const amdisp_range_pins_name[] = {
+	"gpio0", "gpio1", "gpio2"
+};
+
+enum amdisp_functions {
+	mux_gpio,
+	mux_NA
+};
+
+static const char * const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2"
+};
+
+/**
+ * struct amdisp_function - a pinmux function
+ * @name:    Name of the pinmux function.
+ * @groups:  List of pingroups for this function.
+ * @ngroups: Number of entries in @groups.
+ */
+struct amdisp_function {
+	const char *name;
+	const char * const *groups;
+	unsigned int ngroups;
+};
+
+#define FUNCTION(fname)					\
+	[mux_##fname] = {				\
+		.name = #fname,				\
+		.groups = fname##_groups,		\
+		.ngroups = ARRAY_SIZE(fname##_groups),	\
+	}
+
+static const struct amdisp_function amdisp_functions[] = {
+	FUNCTION(gpio),
+};
+
+/**
+ * struct amdisp_pingroup - a pinmux group
+ * @name:  Name of the pinmux group.
+ * @pins:  List of pins for this group.
+ * @npins: Number of entries in @pins.
+ * @funcs: List of functions belongs to this group.
+ * @nfuncs: Number of entries in @funcs.
+ * @offset: Group offset in amdisp pinmux groups.
+ */
+struct amdisp_pingroup {
+	const char *name;
+	const unsigned int *pins;
+	unsigned int npins;
+	unsigned int *funcs;
+	unsigned int nfuncs;
+	unsigned int offset;
+};
+
+#define PINGROUP(id, f0)					\
+	{							\
+		.name = "gpio" #id,				\
+		.pins = gpio##id##_pins,			\
+		.npins = ARRAY_SIZE(gpio##id##_pins),		\
+		.funcs = (int[]){				\
+			mux_##f0,				\
+		},						\
+		.nfuncs = 1,					\
+		.offset = id,					\
+	}
+
+static const struct amdisp_pingroup amdisp_groups[] = {
+	PINGROUP(0, gpio),
+	PINGROUP(1, gpio),
+	PINGROUP(2, gpio),
+};
-- 
2.43.0


