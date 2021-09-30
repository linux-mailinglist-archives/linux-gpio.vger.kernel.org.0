Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB3D41E4D9
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350451AbhI3X2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:34 -0400
Received: from mail-bn8nam12on2045.outbound.protection.outlook.com ([40.107.237.45]:4929
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350104AbhI3X2X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayMKdNg9+DNGUuluVPqi0grY+6yqaMiKlyzrtZH90FNMNWKYFA0/nsJl3ssnGpDBNPneyYK+sfLGVTNrdPnB6CpxHjmnXkJqsy2bM1IBRPuTfQM+6HnNOdfuUGLB8/yM3hOr0NZFrOyN5YojTXjOYrtyzwo5xCTluYvAhL6TKPglOUPCEn/8+r+PI3gCfvbWLZu1wTt5PhmsJGTpQ3dWddA6hAvf48nLkJo0xc+x7eghwjgIuyhfvpLFNQTDmaXJ+IZmVqXga/8LMMbAN2j9DsnMJaUBFhDxzS0nSFGbkiEOdfWP/17rGNBNNgEWiIJwb7Epfts6j4oN7vdJ7uFVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AteYK1s9ok0eldoF2yPGCHTXgkG4aSvipEQINMLXN+c=;
 b=lsLOj0bESF85A9ccwwYsYLSVum2xT+Uu+arBsWlRUZSZmOdS9f900+SCV6aQDQD0pQPXAZ8+UqGG2cTdNN8I1QxCWxHml4Qb/+Ng2Y190uLiQ7L74WsF+540vrGsAN891KDDY/1OPPVviBUdbIO8mBhiy2TUOWnyzT6blf4ZBa/BckKXxxVnANVCmg9G0/Zd4untNeSGT5kcO90vkBKV50xwHy6KQrZNwgIk26enW49hTAPy9HMPq6DrBipOqilswTmffWpGtuZBDdE70qkZ/Bm6e8xShqu3hr4SKM4olxqCGfnWLdhyS+bg3oSXWrf6YRCgWFbvliA7gEiez5oxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AteYK1s9ok0eldoF2yPGCHTXgkG4aSvipEQINMLXN+c=;
 b=XUr5t86JwwJTDbkFCWY24MkNogxS6Atod6NWvCVNU3z+Yy9xR2uNnMWEygYd8m6qZQsUjL+cUl2B45nhE2WqydLNYKX9bIeLXgjxxAQdt9633ZReED6QQ7LUdHMCHZMrqSBqGSBCwIooNvx8eb4H3xeUNWaIPBs6Qc5zEswgFi/MpoHeowj4n66w0AFQ2Cwf48A2PCww+QQwTTQmO9zdqJHo3Bdz59OZvqFpN7pN/aHFZhyYi9A6ESm5mRViKLQN3r5FYEySC9Lw1VphUIJ6+nhvJaD4SpA/7qqgtprWVQ+Ul/ze0WI4hkPxa2jJ7sDUJhErvxuW4583sEbAgnGN6g==
Received: from DS7PR03CA0172.namprd03.prod.outlook.com (2603:10b6:5:3b2::27)
 by BYAPR12MB4774.namprd12.prod.outlook.com (2603:10b6:a03:10b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 23:26:37 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::7) by DS7PR03CA0172.outlook.office365.com
 (2603:10b6:5:3b2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:36 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 16:26:35 -0700
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:35 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 03/11] hte: Add tegra194 HTE kernel provider
Date:   Thu, 30 Sep 2021 16:26:09 -0700
Message-ID: <20210930232617.6396-4-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930232617.6396-1-dipenp@nvidia.com>
References: <20210930232617.6396-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a10df91a-da38-4a71-319f-08d98469bf5a
X-MS-TrafficTypeDiagnostic: BYAPR12MB4774:
X-Microsoft-Antispam-PRVS: <BYAPR12MB477471AA4F7B3D354F389F34AEAA9@BYAPR12MB4774.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kURyziHV+O39/1O+EEHDdNnJkdpFYqb3rgJLsr0MEt0g06J0pOY96Tq8swZoqT/htiJ3Y8heeFIyxT2i/DBRQ+EzmhSeUjusbwESKMFh2Pe4URrzJh7u14dzm2L4QYwQllRqli77FsQXFm0A7PJRyfnbjvdvpSHrx2dSnCuNvCOsg0iZnhJ+ZCr56Fk6JD3h4hNGdtvNRCwgyuMrujvl3yMBNT708bEt3K7bhWCGDHLp3RELija36z8OZVAmphSlGezHmckNWDCjTu6IrEOuiHkgt2TtvE/SujyWjsFfPMkIEZyL9j0XCzS9GCpFH6KWe7lCeQCWkt6iaFFAl/rRdyaO78wq3VMJXR1OzIic/M8cPZhKjHQQxPi9z44gv1rErvH1zWqJnDF/xvt99m4XKFT6wAFfkJtJPbrHsb4IdG+CUHaG9WFsVRjJiXjrzVAufheDJ6lyJYo5d6OFjkZHxt0Nazz/na1H5S4pN+b8kBwqPXGza/3H3s/RTj20FW2msk26KXlfu68PtiLeUwqn1O/5312u4sUk8XKviKTXaHrO15UBnYIS4ZhODPJrg6EfYTn+b3nibTBhNmvznzFECaYGkVZpwItr/1tjlETcgTksLcUrXz+UqFTFZU59OoHzv58U6/Nd/bl8Gb2riC1fMiIpbie3Aeo9fhWNEnpH3Vp7ovw+/73RghvZS0Ekhq0JGCETJyX6bIrf1VMHBvnzfqEZH828J7oRx//cmZ3LcUInAncc20Y9vR2Ooz29w66X2j345s66azBs/5Fdi5+f+g==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6666004)(110136005)(5660300002)(1076003)(107886003)(30864003)(47076005)(336012)(921005)(7416002)(426003)(8676002)(316002)(8936002)(4326008)(86362001)(2906002)(7636003)(70586007)(70206006)(7696005)(36860700001)(82310400003)(36756003)(356005)(26005)(508600001)(186003)(2616005)(83380400001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:36.4968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a10df91a-da38-4a71-319f-08d98469bf5a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4774
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra194 device has multiple HTE instances also known as GTE
(Generic hardware Timestamping Engine) which can timestamp subset of
SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
and exposes timestamping ability on those lines to the consumers
through HTE subsystem.

Also, with this patch, added:
- documentation about this provider and its capabilities at
Documentation/hte.
- Compilation support in Makefile and Kconfig

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 Documentation/hte/index.rst        |  22 ++
 Documentation/hte/tegra194-hte.rst |  56 +++
 Documentation/index.rst            |   1 +
 drivers/hte/Kconfig                |  12 +
 drivers/hte/Makefile               |   1 +
 drivers/hte/hte-tegra194.c         | 554 +++++++++++++++++++++++++++++
 6 files changed, 646 insertions(+)
 create mode 100644 Documentation/hte/index.rst
 create mode 100644 Documentation/hte/tegra194-hte.rst
 create mode 100644 drivers/hte/hte-tegra194.c

diff --git a/Documentation/hte/index.rst b/Documentation/hte/index.rst
new file mode 100644
index 000000000000..9f43301c05dc
--- /dev/null
+++ b/Documentation/hte/index.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+The Linux Hardware Timestamping Engine (HTE)
+============================================
+
+The HTE Subsystem
+=================
+
+.. toctree::
+   :maxdepth: 1
+
+   hte
+
+HTE Tegra Provider
+==================
+
+.. toctree::
+   :maxdepth: 1
+
+   tegra194-hte
+
diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
new file mode 100644
index 000000000000..fb229bda2408
--- /dev/null
+++ b/Documentation/hte/tegra194-hte.rst
@@ -0,0 +1,56 @@
+HTE Kernel provider driver
+==========================
+
+Description
+-----------
+The Nvidia tegra194 HTE provider driver implements two GTE
+(Generic Timestamping Engine) instances 1) GPIO GTE and 2) LIC IRQ GTE. The
+both GTEs instances get the timestamp from the system counter TSC which has
+31.25MHz clock rate, and the driver converts clock tick rate to nano seconds
+before storing it as timestamp value.
+
+GPIO GTE
+--------
+
+This GTE instance timestamps GPIO in real time, for that to happen GPIO
+needs to be configured as input and IRQ needs to ba enabled. The only always on
+(AON) gpio controller instance supports timestamping GPIOs in realtime and it
+has 39 GPIO lines. The GPIO GTE and AON GPIO controller are tightly coupled as
+it requires very specific bits to be set in GPIO config register before GPIO
+GTE can be used. The GPIO GTE functionality is accessed from the GPIOLIB
+framework for the in kernel and userspace consumers. In the later case,
+requests go through GPIOLIB CDEV framework. The below APIs are added in GPIOLIB
+framework to access HTE subsystem and GPIO GTE.
+
+.. kernel-doc:: drivers/gpio/gpiolib.c
+   :functions: gpiod_req_hw_timestamp_ns gpiod_rel_hw_timestamp_ns
+
+There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
+driver which demonstrates above APIs for the Jetson AGX platform.
+
+For userspace consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be
+specifed during IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which
+returns the timestamp in nano second.
+
+LIC IRQ GTE
+-----------
+
+This GTE instance timestamp LIC IRQ lines in real time. There are 352 IRQ
+lines which this instance can help timestamp realtime. The hte devicetree
+binding described at ``Documentation/devicetree/bindings/hte/`` gives out
+example how consumer can request IRQ line, since it is one to one mapping,
+consumers can simply specify IRQ number that they are interested in. There is
+no userspace consumer support for this GTE instance. The sample test code
+hte-tegra194-irq-test.c, located in ``drivers/hte/`` directory,
+demonstrates how to use IRQ GTE instance. The below is sample device tree
+snippet code for the test driver::
+
+ tegra_hte_irq_test {
+        compatible = "nvidia,tegra194-hte-irq-test";
+        htes = <&tegra_hte_lic 0x19>;
+        hte-names = "hte-lic";
+ };
+
+The provider source code of both IRQ and GPIO GTE instances is locate at
+``drivers/hte/hte-tegra194.c``.
+
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 1b13c2445e87..b41118577fe6 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -138,6 +138,7 @@ needed).
    misc-devices/index
    scheduler/index
    mhi/index
+   hte/index
 
 Architecture-agnostic documentation
 -----------------------------------
diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index 6fdf243d281b..bf375a5a8f8e 100644
--- a/drivers/hte/Kconfig
+++ b/drivers/hte/Kconfig
@@ -20,3 +20,15 @@ menuconfig HTE
 
 	  If unsure, say no.
 
+if HTE
+
+config HTE_TEGRA194
+	tristate "NVIDIA Tegra194 HTE Support"
+	depends on ARCH_TEGRA_194_SOC
+	help
+	  Enable this option for integrated hardware timestamping engine also
+	  known as generic timestamping engine (GTE) support on NVIDIA Tegra194
+	  systems-on-chip. The driver supports 352 LIC IRQs and 39 AON GPIOs
+	  lines for timestamping in realtime.
+
+endif
diff --git a/drivers/hte/Makefile b/drivers/hte/Makefile
index fc03bdf44427..3ae7c4029991 100644
--- a/drivers/hte/Makefile
+++ b/drivers/hte/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_HTE)		+= hte.o
+obj-$(CONFIG_HTE_TEGRA194)	+= hte-tegra194.o
 
diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
new file mode 100644
index 000000000000..16386e342a3c
--- /dev/null
+++ b/drivers/hte/hte-tegra194.c
@@ -0,0 +1,554 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 NVIDIA Corporation
+ *
+ * Author: Dipen Patel <dipenp@nvidia.com>
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/stat.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/hte.h>
+#include <linux/uaccess.h>
+
+#define HTE_SUSPEND	0
+
+/* HTE source clock TSC is 31.25MHz */
+#define HTE_TS_CLK_RATE_HZ	31250000ULL
+#define HTE_CLK_RATE_NS		32
+#define HTE_TS_NS_SHIFT	__builtin_ctz(HTE_CLK_RATE_NS)
+
+#define NV_AON_SLICE_INVALID	-1
+#define NV_LINES_IN_SLICE	32
+
+/* AON HTE line map For slice 1 */
+#define NV_AON_HTE_SLICE1_IRQ_GPIO_28	12
+#define NV_AON_HTE_SLICE1_IRQ_GPIO_29	13
+
+/* AON HTE line map For slice 2 */
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_0	0
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_1	1
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_2	2
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_3	3
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_4	4
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_5	5
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_6	6
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_7	7
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_8	8
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_9	9
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_10	10
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_11	11
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_12	12
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_13	13
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_14	14
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_15	15
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_16	16
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_17	17
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_18	18
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_19	19
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_20	20
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_21	21
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_22	22
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_23	23
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_24	24
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_25	25
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_26	26
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_27	27
+
+/* AON GPIO port AA pins */
+#define NV_AON_GPIO_PORT_AA_0		0
+#define NV_AON_GPIO_PORT_AA_1		1
+#define NV_AON_GPIO_PORT_AA_2		2
+#define NV_AON_GPIO_PORT_AA_3		3
+#define NV_AON_GPIO_PORT_AA_4		4
+#define NV_AON_GPIO_PORT_AA_5		5
+#define NV_AON_GPIO_PORT_AA_6		6
+#define NV_AON_GPIO_PORT_AA_7		7
+
+/* AON GPIO port BB pins */
+#define NV_AON_GPIO_PORT_BB_0		8
+#define NV_AON_GPIO_PORT_BB_1		9
+#define NV_AON_GPIO_PORT_BB_2		10
+#define NV_AON_GPIO_PORT_BB_3		11
+
+/* AON GPIO port CC pins */
+#define NV_AON_GPIO_PORT_CC_0		16
+#define NV_AON_GPIO_PORT_CC_1		17
+#define NV_AON_GPIO_PORT_CC_2		18
+#define NV_AON_GPIO_PORT_CC_3		19
+#define NV_AON_GPIO_PORT_CC_4		20
+#define NV_AON_GPIO_PORT_CC_5		21
+#define NV_AON_GPIO_PORT_CC_6		22
+#define NV_AON_GPIO_PORT_CC_7		23
+
+/* AON GPIO port DD pins */
+#define NV_AON_GPIO_PORT_DD_0		24
+#define NV_AON_GPIO_PORT_DD_1		25
+#define NV_AON_GPIO_PORT_DD_2		26
+
+/* AON GPIO port EE pins */
+#define NV_AON_GPIO_PORT_EE_0		32
+#define NV_AON_GPIO_PORT_EE_1		33
+#define NV_AON_GPIO_PORT_EE_2		34
+#define NV_AON_GPIO_PORT_EE_3		35
+#define NV_AON_GPIO_PORT_EE_4		36
+#define NV_AON_GPIO_PORT_EE_5		37
+#define NV_AON_GPIO_PORT_EE_6		38
+
+
+#define HTE_TECTRL		0x0
+#define HTE_TETSCH		0x4
+#define HTE_TETSCL		0x8
+#define HTE_TESRC		0xC
+#define HTE_TECCV		0x10
+#define HTE_TEPCV		0x14
+#define HTE_TECMD		0x1C
+#define HTE_TESTATUS		0x20
+#define HTE_SLICE0_TETEN	0x40
+#define HTE_SLICE1_TETEN	0x60
+
+#define HTE_SLICE_SIZE		(HTE_SLICE1_TETEN - HTE_SLICE0_TETEN)
+
+#define HTE_TECTRL_ENABLE_ENABLE	0x1
+
+#define HTE_TECTRL_OCCU_SHIFT		0x8
+#define HTE_TECTRL_INTR_SHIFT		0x1
+#define HTE_TECTRL_INTR_ENABLE		0x1
+
+#define HTE_TESRC_SLICE_SHIFT		16
+#define HTE_TESRC_SLICE_DEFAULT_MASK	0xFF
+
+#define HTE_TECMD_CMD_POP		0x1
+
+#define HTE_TESTATUS_OCCUPANCY_SHIFT	8
+#define HTE_TESTATUS_OCCUPANCY_MASK	0xFF
+
+struct hte_slices {
+	u32 r_val;
+	unsigned long flags;
+	/* to prevent lines mapped to same slice updating its register */
+	spinlock_t s_lock;
+};
+
+struct tegra_hte_line_mapped {
+	int slice;
+	u32 bit_index;
+};
+
+struct tegra_hte_line_table {
+	u32 map_sz;
+	const struct tegra_hte_line_mapped *map;
+};
+
+struct tegra_hte_soc {
+	int hte_irq;
+	u32 itr_thrshld;
+	u32 conf_rval;
+	struct hte_slices *sl;
+	const struct tegra_hte_line_table *line_map;
+	struct hte_chip *chip;
+	void __iomem *regs;
+};
+
+static const struct tegra_hte_line_mapped tegra194_aon_gpio_map[] = {
+	/* gpio, slice, bit_index */
+	[NV_AON_GPIO_PORT_AA_0]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_11},
+	[NV_AON_GPIO_PORT_AA_1]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_10},
+	[NV_AON_GPIO_PORT_AA_2]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_9},
+	[NV_AON_GPIO_PORT_AA_3]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_8},
+	[NV_AON_GPIO_PORT_AA_4]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_7},
+	[NV_AON_GPIO_PORT_AA_5]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_6},
+	[NV_AON_GPIO_PORT_AA_6]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_5},
+	[NV_AON_GPIO_PORT_AA_7]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_4},
+	[NV_AON_GPIO_PORT_BB_0]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_3},
+	[NV_AON_GPIO_PORT_BB_1]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_2},
+	[NV_AON_GPIO_PORT_BB_2] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_1},
+	[NV_AON_GPIO_PORT_BB_3] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_0},
+	[12] = {NV_AON_SLICE_INVALID, 0},
+	[13] = {NV_AON_SLICE_INVALID, 0},
+	[14] = {NV_AON_SLICE_INVALID, 0},
+	[15] = {NV_AON_SLICE_INVALID, 0},
+	[NV_AON_GPIO_PORT_CC_0] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_22},
+	[NV_AON_GPIO_PORT_CC_1] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_21},
+	[NV_AON_GPIO_PORT_CC_2] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_20},
+	[NV_AON_GPIO_PORT_CC_3] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_19},
+	[NV_AON_GPIO_PORT_CC_4] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_18},
+	[NV_AON_GPIO_PORT_CC_5] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_17},
+	[NV_AON_GPIO_PORT_CC_6] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_16},
+	[NV_AON_GPIO_PORT_CC_7] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_15},
+	[NV_AON_GPIO_PORT_DD_0] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_14},
+	[NV_AON_GPIO_PORT_DD_1] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_13},
+	[NV_AON_GPIO_PORT_DD_2] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_12},
+	[27] = {NV_AON_SLICE_INVALID, 0},
+	[28] = {NV_AON_SLICE_INVALID, 0},
+	[29] = {NV_AON_SLICE_INVALID, 0},
+	[30] = {NV_AON_SLICE_INVALID, 0},
+	[31] = {NV_AON_SLICE_INVALID, 0},
+	[NV_AON_GPIO_PORT_EE_0] = {1, NV_AON_HTE_SLICE1_IRQ_GPIO_29},
+	[NV_AON_GPIO_PORT_EE_1] = {1, NV_AON_HTE_SLICE1_IRQ_GPIO_28},
+	[NV_AON_GPIO_PORT_EE_2] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
+	[NV_AON_GPIO_PORT_EE_3] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
+	[NV_AON_GPIO_PORT_EE_4] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
+	[NV_AON_GPIO_PORT_EE_5] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
+	[NV_AON_GPIO_PORT_EE_6] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
+};
+
+static const struct tegra_hte_line_table aon_hte_map = {
+	.map_sz = ARRAY_SIZE(tegra194_aon_gpio_map),
+	.map = tegra194_aon_gpio_map,
+};
+
+static inline u32 tegra_hte_readl(struct tegra_hte_soc *hte, u32 reg)
+{
+	return readl(hte->regs + reg);
+}
+
+static inline void tegra_hte_writel(struct tegra_hte_soc *hte, u32 reg,
+				    u32 val)
+{
+	writel(val, hte->regs + reg);
+}
+
+static inline int tegra_hte_map_to_line_id(u32 eid, struct tegra_hte_soc *gs,
+					  u32 *mapped)
+{
+	const struct tegra_hte_line_mapped *m;
+
+	if (gs->line_map) {
+		m = gs->line_map->map;
+		if (eid > gs->line_map->map_sz)
+			return -EINVAL;
+		if (m[eid].slice == NV_AON_SLICE_INVALID)
+			return -EINVAL;
+
+		*mapped = (m[eid].slice << 5) + m[eid].bit_index;
+	} else {
+		*mapped = eid;
+	}
+
+	return 0;
+}
+
+static int tegra_hte_line_xlate(struct hte_chip *gc,
+				 const struct of_phandle_args *args,
+				 struct hte_ts_desc *desc, u32 *xlated_id)
+{
+	int ret = 0;
+
+	if (!gc || !desc || !xlated_id)
+		return -EINVAL;
+
+	if (args) {
+		if (gc->of_hte_n_cells < 1)
+			return -EINVAL;
+
+		if (args->args_count != gc->of_hte_n_cells)
+			return -EINVAL;
+
+		desc->con_id = args->args[0];
+	}
+
+	ret = tegra_hte_map_to_line_id(desc->con_id, gc->data,
+				       xlated_id);
+	if (ret < 0) {
+		dev_dbg(gc->dev, "con_id:%u mapping failed\n",
+			desc->con_id);
+		return ret;
+	}
+
+	if (*xlated_id > gc->nlines)
+		return -EINVAL;
+
+	dev_dbg(gc->dev, "requested id:%u, xlated id:%u\n",
+		desc->con_id, *xlated_id);
+
+	return 0;
+}
+
+static int tegra_hte_en_dis_common(struct hte_chip *chip, u32 line_id, bool en)
+{
+	u32 slice, sl_bit_shift, line_bit, val, reg;
+	struct tegra_hte_soc *gs;
+
+	sl_bit_shift = __builtin_ctz(HTE_SLICE_SIZE);
+
+	if (!chip)
+		return -EINVAL;
+
+	gs = (struct tegra_hte_soc *)chip->data;
+
+	if (line_id > chip->nlines) {
+		dev_err(chip->dev,
+			"line id: %u is not supported by this controller\n",
+			line_id);
+		return -EINVAL;
+	}
+
+	slice = line_id >> sl_bit_shift;
+	line_bit = line_id & (HTE_SLICE_SIZE - 1);
+	reg = (slice << sl_bit_shift) + HTE_SLICE0_TETEN;
+
+	spin_lock(&gs->sl[slice].s_lock);
+
+	if (test_bit(HTE_SUSPEND, &gs->sl[slice].flags)) {
+		spin_unlock(&gs->sl[slice].s_lock);
+		dev_dbg(chip->dev, "device suspended");
+		return -EBUSY;
+	}
+
+	val = tegra_hte_readl(gs, reg);
+	if (en)
+		val = val | (1 << line_bit);
+	else
+		val = val & (~(1 << line_bit));
+	tegra_hte_writel(gs, reg, val);
+
+	spin_unlock(&gs->sl[slice].s_lock);
+
+	dev_dbg(chip->dev, "line: %u, slice %u, line_bit %u, reg:0x%x\n",
+		line_id, slice, line_bit, reg);
+
+	return 0;
+}
+
+static int tegra_hte_request(struct hte_chip *chip, u32 line_id)
+{
+	return tegra_hte_en_dis_common(chip, line_id, true);
+}
+
+static int tegra_hte_release(struct hte_chip *chip, u32 line_id)
+{
+	return tegra_hte_en_dis_common(chip, line_id, false);
+}
+
+static int tegra_hte_clk_src_info(struct hte_chip *chip,
+				  struct hte_clk_info *ci)
+{
+	(void)chip;
+
+	if (!ci)
+		return -EINVAL;
+
+	ci->hz = HTE_TS_CLK_RATE_HZ;
+	ci->type = CLOCK_MONOTONIC;
+
+	return 0;
+}
+
+static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
+{
+	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
+	u64 tsc;
+	struct hte_ts_data el;
+
+	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
+		HTE_TESTATUS_OCCUPANCY_SHIFT) &
+		HTE_TESTATUS_OCCUPANCY_MASK) {
+		tsh = tegra_hte_readl(gs, HTE_TETSCH);
+		tsl = tegra_hte_readl(gs, HTE_TETSCL);
+		tsc = (((u64)tsh << 32) | tsl);
+
+		src = tegra_hte_readl(gs, HTE_TESRC);
+		slice = (src >> HTE_TESRC_SLICE_SHIFT) &
+			    HTE_TESRC_SLICE_DEFAULT_MASK;
+
+		pv = tegra_hte_readl(gs, HTE_TEPCV);
+		cv = tegra_hte_readl(gs, HTE_TECCV);
+		acv = pv ^ cv;
+		while (acv) {
+			bit_index = __builtin_ctz(acv);
+			el.dir = HTE_DIR_NOSUPP;
+			line_id = bit_index + (slice << 5);
+			el.tsc = tsc << HTE_TS_NS_SHIFT;
+			hte_push_ts_ns(gs->chip, line_id, &el);
+			acv &= ~BIT(bit_index);
+		}
+		tegra_hte_writel(gs, HTE_TECMD, HTE_TECMD_CMD_POP);
+	}
+}
+
+static irqreturn_t tegra_hte_isr(int irq, void *dev_id)
+{
+	struct tegra_hte_soc *gs = dev_id;
+	(void)irq;
+
+	tegra_hte_read_fifo(gs);
+
+	return IRQ_HANDLED;
+}
+
+static const struct of_device_id tegra_hte_of_match[] = {
+	{ .compatible = "nvidia,tegra194-gte-lic"},
+	{ .compatible = "nvidia,tegra194-gte-aon", .data = &aon_hte_map},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_hte_of_match);
+
+static const struct hte_ops g_ops = {
+	.request = tegra_hte_request,
+	.release = tegra_hte_release,
+	.enable = tegra_hte_request,
+	.disable = tegra_hte_release,
+	.get_clk_src_info = tegra_hte_clk_src_info,
+};
+
+static void tegra_gte_disable(void *data)
+{
+	struct platform_device *pdev = data;
+	struct tegra_hte_soc *gs = dev_get_drvdata(&pdev->dev);
+
+	tegra_hte_writel(gs, HTE_TECTRL, 0);
+}
+
+static int tegra_hte_probe(struct platform_device *pdev)
+{
+	int ret;
+	u32 i, slices, val = 0;
+	struct device *dev;
+	struct tegra_hte_soc *hte_dev;
+	struct hte_chip *gc;
+
+	dev = &pdev->dev;
+
+	hte_dev = devm_kzalloc(dev, sizeof(*hte_dev), GFP_KERNEL);
+	if (!hte_dev)
+		return -ENOMEM;
+
+	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, hte_dev);
+	hte_dev->line_map = of_device_get_match_data(&pdev->dev);
+
+	hte_dev->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hte_dev->regs))
+		return PTR_ERR(hte_dev->regs);
+
+	ret = of_property_read_u32(dev->of_node, "int-threshold",
+				   &hte_dev->itr_thrshld);
+	if (ret != 0)
+		hte_dev->itr_thrshld = 1;
+
+	ret = of_property_read_u32(dev->of_node, "slices", &slices);
+	if (ret != 0) {
+		dev_err(dev, "Could not read slices\n");
+		return -EINVAL;
+	}
+
+	hte_dev->sl = devm_kcalloc(dev, slices, sizeof(*hte_dev->sl),
+				   GFP_KERNEL);
+	if (!hte_dev->sl)
+		return -ENOMEM;
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to get irq\n");
+		return ret;
+	}
+	hte_dev->hte_irq = ret;
+	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr, 0,
+			       dev_name(dev), hte_dev);
+	if (ret < 0) {
+		dev_err(dev, "request irq failed.\n");
+		return ret;
+	}
+
+	gc->nlines = slices << 5;
+	gc->ops = &g_ops;
+	gc->dev = dev;
+	hte_dev->chip = gc;
+	gc->data = hte_dev;
+	gc->xlate = tegra_hte_line_xlate;
+	gc->of_hte_n_cells = 1;
+
+	ret = devm_hte_register_chip(hte_dev->chip);
+	if (ret) {
+		dev_err(gc->dev, "hte chip register failed");
+		return ret;
+	}
+
+	for (i = 0; i < slices; i++) {
+		hte_dev->sl[i].flags = 0;
+		spin_lock_init(&hte_dev->sl[i].s_lock);
+	}
+
+	val = HTE_TECTRL_ENABLE_ENABLE |
+	      (HTE_TECTRL_INTR_ENABLE << HTE_TECTRL_INTR_SHIFT) |
+	      (hte_dev->itr_thrshld << HTE_TECTRL_OCCU_SHIFT);
+	tegra_hte_writel(hte_dev, HTE_TECTRL, val);
+
+	ret = devm_add_action_or_reset(&pdev->dev, tegra_gte_disable, pdev);
+	if (ret)
+		return ret;
+
+	dev_dbg(gc->dev, "lines: %d, slices:%d", gc->nlines, slices);
+
+	return 0;
+}
+
+static int __maybe_unused tegra_hte_resume_early(struct device *dev)
+{
+	u32 i;
+	struct tegra_hte_soc *gs = dev_get_drvdata(dev);
+	u32 slices = gs->chip->nlines / NV_LINES_IN_SLICE;
+	u32 sl_bit_shift = __builtin_ctz(HTE_SLICE_SIZE);
+
+	tegra_hte_writel(gs, HTE_TECTRL, gs->conf_rval);
+
+	for (i = 0; i < slices; i++) {
+		spin_lock(&gs->sl[i].s_lock);
+		tegra_hte_writel(gs,
+				 ((i << sl_bit_shift) + HTE_SLICE0_TETEN),
+				 gs->sl[i].r_val);
+		clear_bit(HTE_SUSPEND, &gs->sl[i].flags);
+		spin_unlock(&gs->sl[i].s_lock);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused tegra_hte_suspend_late(struct device *dev)
+{
+	u32 i;
+	struct tegra_hte_soc *gs = dev_get_drvdata(dev);
+	u32 slices = gs->chip->nlines / NV_LINES_IN_SLICE;
+	u32 sl_bit_shift = __builtin_ctz(HTE_SLICE_SIZE);
+
+	gs->conf_rval = tegra_hte_readl(gs, HTE_TECTRL);
+	for (i = 0; i < slices; i++) {
+		spin_lock(&gs->sl[i].s_lock);
+		gs->sl[i].r_val = tegra_hte_readl(gs,
+				((i << sl_bit_shift) + HTE_SLICE0_TETEN));
+		set_bit(HTE_SUSPEND, &gs->sl[i].flags);
+		spin_unlock(&gs->sl[i].s_lock);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_hte_pm = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(tegra_hte_suspend_late,
+				     tegra_hte_resume_early)
+};
+
+static struct platform_driver tegra_hte_driver = {
+	.probe = tegra_hte_probe,
+	.driver = {
+		.name = "tegra_hte",
+		.pm = &tegra_hte_pm,
+		.of_match_table = tegra_hte_of_match,
+	},
+};
+
+module_platform_driver(tegra_hte_driver);
+
+MODULE_AUTHOR("Dipen Patel <dipenp@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra HTE (Hardware Timestamping Engine) driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

