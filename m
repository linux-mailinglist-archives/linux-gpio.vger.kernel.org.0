Return-Path: <linux-gpio+bounces-16835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E7A49FA0
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 18:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28E023A199A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 16:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA3A1F0989;
	Fri, 28 Feb 2025 16:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RIljHGd/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3E51F0980;
	Fri, 28 Feb 2025 16:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740761897; cv=fail; b=YixSh+RxEuYeOG+iho6+U46TREWrc/3YPu/7CUMcDbOegbOoRQAOeJYtzTVWBWixrqj3rI13lbF5LzkcZ23V+Wm8moMuzSFgn4C9L70iFJg2kGp+JMo5cj0Tpwe1smx+CZ54CjzG44FzNlKIGHLHSeuTx6K3OhVgNzyfUVKMWUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740761897; c=relaxed/simple;
	bh=aqhfX/2RjGupdFUy9xwfL+AY4WQW9qglu/hkGbOOIDs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RTnCYZk9hLKo1fVztEb49aurlQZlugT3Dc9bVDP0aE3xZnIXyM8bgwMubaHtc++0rw54tVWXyEa/N27lN11K80L+R0Q0Z8DsJpW20pQfey81EY+MVwxNrmq9lkK/it2fvKW6yU1zcy/hiNk/8T/mzYtKfmmEXkXw0Wg4wpNU4r8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RIljHGd/; arc=fail smtp.client-ip=40.107.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjvuwY1O3fFBY9EX5xcHQSjgEQx/DjEtI8rPzoK0sUozPnZLGnTy4X8Kobq0f98F6QixudHkVrKjh8zK8jTFsIRXAzqX92ICf7bqvpR8AiWDHvBNKdztJ8+PaY/r/V5D3w7dyqJv9nJnqytVastMky2/v4wOfgqVfSnqVGSNczqpgonFsH1m0nFNRAAKggxYbFrFxuTf71yPpP/BWacYcnsd0R0Oz6/QM82pXAZEprmAy13b655qZOCQtsRy9WbhBjeTObduuLPy2GeWWbj1yNSuzTAutluxcQJ/401rLrVT8TJz+nH1bkRljwTWuxCmwlGDijkFq+tLIrqr0awvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1NDQ5NXZDPaGttPdIwJRgrrWf+LwsaRoJtfCf6ckv0=;
 b=VgxP3kfMcqe3zn6Naeh3JDEEFmsjtTlGCRWGrZ3kJhzhGzst7VmRlDCtOFCsTmYJaAMPJ9veMt/cB0QPXjNNEJDUOduJUAgXeQci6YPXltFS8wLwvlGpwManZoyVXA30CNc6JaE5sNchddXZJNZbGLG+DqXW5RiE7G10q2Dq1A1RdGF1VZzGo/gQO8XtfrT5ASsdjNpI2njcLHAFYD2A6EKjCqbGk6Rz+b+D9yvstPQqbOAwDGICpTIaaPkSwve8e6zA9B1+uT+JKkkURAIr/BRYu0w077oieWSfr3Ls8bCZsH9X68OS1DkrGz2CVCj/iorJ/HXvuod5TAECHTiTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1NDQ5NXZDPaGttPdIwJRgrrWf+LwsaRoJtfCf6ckv0=;
 b=RIljHGd/7JcQK1NO5NP4W8rKWIaqbH8a2jmUKuIG1PDMoxfbbvIeXtOqiVxvUnLXn88HCsNSHS4MWSEP5aprugsa2IaPOLprpVKsrI/HKEuxdkzKaVqu7YAaBFuBKBXyCpD+vPMVuQC3dCBUt/5ZP6vG4OZ3jRKPOrfyXJA9Z+s=
Received: from BN0PR04CA0027.namprd04.prod.outlook.com (2603:10b6:408:ee::32)
 by SJ0PR12MB7033.namprd12.prod.outlook.com (2603:10b6:a03:448::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 16:58:08 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::35) by BN0PR04CA0027.outlook.office365.com
 (2603:10b6:408:ee::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Fri,
 28 Feb 2025 16:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 16:58:08 +0000
Received: from maple-stxh-09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Feb
 2025 10:58:08 -0600
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: [PATCH] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
Date: Fri, 28 Feb 2025 11:57:47 -0500
Message-ID: <20250228165749.3476210-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SJ0PR12MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 759feed6-cfa5-4b86-51f2-08dd581913d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EgYS/Z/1CfU8j/E+vyPcuqUrAN2GXS5SCHmkDUUKnJYEycp9MIK8RHHCVsJT?=
 =?us-ascii?Q?82iGjViYI35/wfnXZasTVYegDo0hL2BYXHnHZ6P7BzeG2uj/u5yKTjcPws4K?=
 =?us-ascii?Q?XBEhmAX2EOpV3peZe8ExuvXfpyDn7AiOib1SK8BCiCH1DZrYL++fvNhh6yNd?=
 =?us-ascii?Q?K6iSWjSI7A4JbGPs886X5iVxFavFPlvIt9sHs1gDvnI0/MeoW7EHc/baJZf1?=
 =?us-ascii?Q?T4c62eo90X2Lx69vKfaLCHlZratfESiPcHAtl5famJNM+Xm9JhMw3/pDf/57?=
 =?us-ascii?Q?FKl8G4gdwta0lUFurmWY0wpqnnK4vneFeCn7NNzdHzQfGS9GJS5eALjID+16?=
 =?us-ascii?Q?6rguB2qS+q4rPkSInCdn8yc0FD/pn10FEJ7Tdq9osvBlX3L0/1EHxPEIFtsz?=
 =?us-ascii?Q?zPUZnGspxbc+rmy9AK21pyrrdN3th2djkQSttOC3AVI7L0ltpjuJMea6PZN1?=
 =?us-ascii?Q?ubDHDt36XE0i8rlPnRhNj5FZB8eYTApJessJDtKYzoOt8uFJsO3rkHczwDXy?=
 =?us-ascii?Q?ONeZal+eOxRTfUFOfzcra7XKgkxd+NKy8wVCChCyugDHH8BGBJ/Fg+Tpy6gE?=
 =?us-ascii?Q?T4n+l+FDW5WTbFpTQsyQxUpscJ2IcgmB3FAp51ZPvycasDuCchAfssWbC5MJ?=
 =?us-ascii?Q?uonuQUvx/crrj+zmEMDL/XZKLfNZzoEqKnxy2S3DmmHTjiD7NpvBrJpCdk4P?=
 =?us-ascii?Q?UM/IemvzLF4DGAdSrgh2gOr0j+F8D6bpeOlFdGuPA3jjjXVE+NXP4OQ0ff+B?=
 =?us-ascii?Q?ilUIMy5Hg03+MExpiAxBCAE5UmzSRU3Tq9n0D/Jyjb0LLZEHhe0jNUS3sjJm?=
 =?us-ascii?Q?s5Gg1TyL40hUu3aYpBs6MEgZvjsn3/lPFdK28YVEsdk9jCM6DD5PKNc5KOn9?=
 =?us-ascii?Q?JJRtF5yV5lBi+1zbZAOy4KDJqceEuXGuos0aAqcaLh+JVrfQ/8lWwEkguNnn?=
 =?us-ascii?Q?kgWxuBYwwRmyYOb8ggRU8lyfgE7pxjEmPG1hORQzbfdHAzVD/YlYBycERQ8H?=
 =?us-ascii?Q?iQRWr0Wt85Iq5XhwFiNZWiTzMPZi/Q7SMXV68w/cIPDg+smhV4tUApiX2oEH?=
 =?us-ascii?Q?5LW9JgrItwse0DLpwWeoCjnpX8d4YQThHYMOjUkqIrbEPQ/MpdqXpHaNzEgv?=
 =?us-ascii?Q?vljF64vcRZlSVJepqnUbCFhuB4/DVZ8tjtz3r6iGEPg/H+27SxTLZk70PzSk?=
 =?us-ascii?Q?72oVRHwfPnPdpNk4bWKZajRPbIvPiVGm8RdtxfDmNDM4wv4iVdksrNJgMHDp?=
 =?us-ascii?Q?o9eJkBOEmc4xaot8me3OZR0SD2quxlvUXzsyeMkkBTDKX3QRPSG6eeDCLk/X?=
 =?us-ascii?Q?yxodSGEY6yyQXCdA9zda+5owOq0NzthoOoHgmloq5WO6hcJfmbuRUB8uaAUT?=
 =?us-ascii?Q?bJnkTNulm/4JsN0xqWzpWZ2vNS6PtTtUzU6nCAMvuSkgykwuFMBDAY2cW3Qz?=
 =?us-ascii?Q?V19XjdgVxRMXH4OLzoSmgTHSxKqHnzovlojXjpgSWU/gTXtdb8BPnXjfqnb8?=
 =?us-ascii?Q?WYoTh6NJqjds0nQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 16:58:08.6314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 759feed6-cfa5-4b86-51f2-08dd581913d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7033

Add pinctrl driver support for AMD SoC with isp41 hw ip block.

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/pinctrl/Kconfig          |  13 ++
 drivers/pinctrl/Makefile         |   1 +
 drivers/pinctrl/pinctrl-amdisp.c | 290 +++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-amdisp.h | 118 +++++++++++++
 4 files changed, 422 insertions(+)
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
index 000000000000..659406586cb2
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-amdisp.c
@@ -0,0 +1,290 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/interrupt.h>
+
+#include "core.h"
+#include "pinctrl-utils.h"
+#include "pinctrl-amd.h"
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
+#ifdef CONFIG_GPIOLIB
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
+static int amdisp_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
+				  unsigned long config)
+{
+	/* Nothing to do, amdisp gpio has no other config */
+	return 0;
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
+	gc->owner		= THIS_MODULE;
+	gc->parent		= &pdev->dev;
+	gc->names		= amdisp_range_pins_name;
+	gc->request		= gpiochip_generic_request;
+	gc->free		= gpiochip_generic_free;
+	gc->get_direction	= amdisp_gpio_get_direction;
+	gc->direction_input	= amdisp_gpio_direction_input;
+	gc->direction_output	= amdisp_gpio_direction_output;
+	gc->get			= amdisp_gpio_get;
+	gc->set			= amdisp_gpio_set;
+	gc->set_config		= amdisp_gpio_set_config;
+	gc->base		= -1;
+	gc->ngpio		= ARRAY_SIZE(amdisp_range_pins);
+#if defined(CONFIG_OF_GPIO)
+	gc->of_node		= pdev->dev.of_node;
+	gc->of_gpio_n_cells	= 2;
+#endif
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
+	dev_info(&pdev->dev, "register amdisp gpio controller\n");
+	return 0;
+}
+#endif
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
+#ifdef CONFIG_GPIOLIB
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR(res))
+		return PTR_ERR(res);
+
+	pctrl->gpiobase = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pctrl->gpiobase))
+		return PTR_ERR(pctrl->gpiobase);
+#endif
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
+#ifdef CONFIG_GPIOLIB
+	ret = amdisp_gpiochip_add(pdev, pctrl);
+	if (ret)
+		return ret;
+#endif
+	dev_info(&pdev->dev, "amdisp pinctrl init successful\n");
+	return 0;
+}
+
+static struct platform_driver amdisp_pinctrl_driver = {
+	.driver = {
+		.name = DRV_NAME,
+	},
+	.probe = amdisp_pinctrl_probe,
+};
+
+static int __init amdisp_pinctrl_init(void)
+{
+	return platform_driver_register(&amdisp_pinctrl_driver);
+}
+arch_initcall(amdisp_pinctrl_init);
+
+static void __exit amdisp_pinctrl_exit(void)
+{
+	platform_driver_unregister(&amdisp_pinctrl_driver);
+}
+module_exit(amdisp_pinctrl_exit);
+
+MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
+MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
+MODULE_DESCRIPTION("AMDISP pinctrl driver");
+MODULE_LICENSE("GPL and additional rights");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/drivers/pinctrl/pinctrl-amdisp.h b/drivers/pinctrl/pinctrl-amdisp.h
new file mode 100644
index 000000000000..8a541e024300
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-amdisp.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ */
+
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf-generic.h>
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


