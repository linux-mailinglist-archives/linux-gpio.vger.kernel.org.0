Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D924A67BB
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Feb 2022 23:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240357AbiBAWWl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Feb 2022 17:22:41 -0500
Received: from mail-bn7nam10on2046.outbound.protection.outlook.com ([40.107.92.46]:20448
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239007AbiBAWWc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Feb 2022 17:22:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJoMfMjNKZygdP9if02RAyr22tsT2NCiIzPRLIRX9ckZxNW3F95eBo3pWCwa1yxtNNBEdGF+YLbOfcJUo88yE0dpX6BfxQ/FSKa8+NSn/wy9JqciW01dPjuEw2h7f6ha4cM31BzqoStPw/i6/IeNh4NG126eYnaLXjNkmC/ZB2goer1ph1D15L6UEbGfXB5HjtMdVqasKAka7R27tOL5AOU7JQQLyLQC9SOYNp+L31EYs7wV/0ep8Ab6zRuu9sg80E1dXcrhJWi/IDCRG3XR4QgMY3bn+kFZnQnYTwUeu/LrtHTtIuE1OdGrN/jGQdtjb6dpCniDQonlMMHffAvO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEIHikKG7nPjOgQpkzy/cRKM0MZL8L2IIdSx3UDWZR0=;
 b=NvJhKZDwaz0obQP2Xv0wx10ztp29U/L/gVLCygdjIGws0JnebbQBXdfrC8GeRdG65hQrHtwzz1YLtbaD4KDpfSjysITfm3Qjs1aG+XfwupVZYIVGPxDGpQ4hCeXYtiVXQQpMbgZ9CAT1opXJZj6zr1j0nNfYdqp4mbbS26i2cjHYq9+Gy09HLdnC3sucoEwFAeCPJZGjg0T3YscwKTv7uJBTicmC+5BjX2jf9MNNLVQvtiBYAgUVMCbPCDqJABHa3XfWxx0oyBnBqGxoDnUL89yXqrRTsLZC3wvi03hWum2a+Kw67uk+B2wWKGUJGg6TM+sDevxgPpj9vpWHBQqYrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEIHikKG7nPjOgQpkzy/cRKM0MZL8L2IIdSx3UDWZR0=;
 b=TJL25kObNFS3FCscL/oHBsESGkGU5zr6r5NaQQkD+jaUR3ompncD1NiGHPtyUsp9qWSozOVPduGHgmJTx668r6BBWX9rEyK2lrf7toB7r0fWWMlGfD4fPv5cxjF3LYtKgtqjGnN/8Xa89/c/Q1Vjk+QD2HXOQ+TetutRQEkip3B22Jo7U4ZSYtXf8tRdfrS01KiqI1vrEuTGKiD6OjcyFDXI5Ylr/+VwlpBZp7WYS7qnzDiSORbYOYXIa8qxIbG8mnWTNEAsj3CqkEYG6zhaQWiI6rlzWXk/8mEBcizRExXERg2EAHK0Dj0WszpR24rZyGbslIYJE7/K+lMOhLZhOA==
Received: from DM3PR14CA0142.namprd14.prod.outlook.com (2603:10b6:0:53::26) by
 DM6PR12MB5567.namprd12.prod.outlook.com (2603:10b6:5:1ba::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.18; Tue, 1 Feb 2022 22:22:29 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::5d) by DM3PR14CA0142.outlook.office365.com
 (2603:10b6:0:53::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20 via Frontend
 Transport; Tue, 1 Feb 2022 22:22:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 22:22:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 1 Feb
 2022 22:22:27 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Tue, 1 Feb 2022
 14:22:26 -0800
Received: from dipenp.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Tue, 1 Feb 2022 14:22:26 -0800
From:   Dipen Patel <dipenp@nvidia.com>
To:     <smangipudi@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <warthog618@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [PATCH v4 03/11] hte: Add tegra194 HTE kernel provider
Date:   Tue, 1 Feb 2022 14:26:22 -0800
Message-ID: <20220201222630.21246-4-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201222630.21246-1-dipenp@nvidia.com>
References: <20220201222630.21246-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00662c28-5b6e-4f91-b376-08d9e5d1551a
X-MS-TrafficTypeDiagnostic: DM6PR12MB5567:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB556753264D057B3E5BDF75C3AE269@DM6PR12MB5567.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PZsS5VGfPu98hETfyWxGM3KcE4uZ58qnFiRBrdW18bNjAN0ExoTLqkSNBsFjIUu1c8uebF8iL7EqwKFIyi7CG79JAPtqJ5q+Gbm+oikP4FtQaX0UArHDtX7ez2ZNmUpnw8nBea7p/dUCoUXaj9LtNqcWO41t3eML4QT0Jnlz9OUGhPJN77jSTxklU3zkY75BxxoG/f4tAimYrfpJ2w3NJvr6d8Hwu2hJRLdLI38/w/4Foia2nXXHZKztQFKNyGTPsrRn61CSDKEg8A8hlO4BFnRUApgEBwjVeOQbEvn/OJo6fUfE56gXe6H16veQofgteSrjgYL1LGd8HXHral+2VA/pfrFUpH5XM5kLdxQocvL60xWygj2eSzqo8TD9z8gJ7p3Rxz5f9PXk4f+fVvfBJGeyaQ28RYV2IwubTepBKehnN807gM66yBhbmjLQFW79vLVZTIar9QLLO73MYM3t3A0HP6BG0YrofpH/UJ5l4BNn22pS2lgqbDrTHnMVtppSwu9bG8Ael6cdoGiu7zth2vquoTmrXUxaTfpmBpC6J5LHnjGVnJm2mP/iABgxr+5YeyskthbffNsVc5gl3DWYR3cVYi5IXrWifgmINSXtH9o9a7jUt3X+r5lhcZVnv4buDJLeF0GSHE3h0Dl5DAANzVRQXjyxfxcKN+XOzif7tIJRZlAwds0VejQq4H9KT1tyReKx6RdOCkAfKUTok50aPta/tMNUlf+uECxAab47Z0P8c2ePPr/QsUIV6jTXcRbCJLcTJDHcWcxyCKl/5ImfaQ==
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(426003)(186003)(1076003)(82310400004)(2906002)(336012)(30864003)(2616005)(107886003)(36860700001)(921005)(81166007)(26005)(356005)(83380400001)(70586007)(6666004)(316002)(7696005)(70206006)(47076005)(86362001)(36756003)(4326008)(508600001)(8676002)(40460700003)(8936002)(7416002)(110136005)(5660300002)(36900700001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 22:22:28.7124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00662c28-5b6e-4f91-b376-08d9e5d1551a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5567
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
 Documentation/hte/index.rst        |  22 +
 Documentation/hte/tegra194-hte.rst |  52 +++
 Documentation/index.rst            |   1 +
 drivers/hte/Kconfig                |  12 +
 drivers/hte/Makefile               |   1 +
 drivers/hte/hte-tegra194.c         | 690 +++++++++++++++++++++++++++++
 6 files changed, 778 insertions(+)
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
index 000000000000..5f8889accf00
--- /dev/null
+++ b/Documentation/hte/tegra194-hte.rst
@@ -0,0 +1,52 @@
+HTE Kernel provider driver
+==========================
+
+Description
+-----------
+The Nvidia tegra194 HTE provider driver implements two GTE
+(Generic Timestamping Engine) instances: 1) GPIO GTE and 2) LIC
+(Legacy Interrupt Controller) IRQ GTE. Both GTE instances get the
+timestamp from the system counter TSC which has 31.25MHz clock rate, and the
+driver converts clock tick rate to nanoseconds before storing it as timestamp
+value.
+
+GPIO GTE
+--------
+
+This GTE instance timestamps GPIO in real time. For that to happen GPIO
+needs to be configured as input. The always on (AON) GPIO controller instance
+supports timestamping GPIOs in real time and it has 39 GPIO lines. The GPIO GTE
+and AON GPIO controller are tightly coupled as it requires very specific bits
+to be set in GPIO config register before GPIO GTE can be used, for that GPIOLIB
+adds two optional APIs as below. The GPIO GTE code supports both kernel
+and userspace consumers. The kernel space consumers can directly talk to HTE
+subsytem while userspace consumers timestamp requests go through GPIOLIB CDEV
+framework to HTE subsystem.
+
+.. kernel-doc:: drivers/gpio/gpiolib.c
+   :functions: gpiod_enable_hw_timestamp gpiod_disable_hw_timestamp
+
+There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
+driver which demonstrates GPIO GTE functionality in kenel space and code added
+in gpiolib-cdev.c demonstrates userspace example.
+
+For userspace consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE flag must be
+specified during IOCTL calls. Refer to ``tools/gpio/gpio-event-mon.c``, which
+returns the timestamp in nanoseconds.
+
+LIC (Legacy Interrupt Controller) IRQ GTE
+-----------------------------------------
+
+This GTE instance timestamps LIC IRQ lines in real time. There are 352 IRQ
+lines which this instance can add timestamps to in real time. The hte
+devicetree binding described at ``Documentation/devicetree/bindings/hte/``
+provides an example of how a consumer can request an IRQ line. Since it is a
+one-to-one mapping with IRQ GTE provider, consumers can simply specify the IRQ
+number that they are interested in. There is no userspace consumer support for
+this GTE instance in the hte framework. The sample test code
+hte-tegra194-irq-test.c, located in the ``drivers/hte/`` directory,
+demonstrates how to use an IRQ GTE instance.
+
+The provider source code of both IRQ and GPIO GTE instances is located at
+``drivers/hte/hte-tegra194.c``.
+
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 2f99cedc95cd..2e42b439bf63 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -139,6 +139,7 @@ needed).
    scheduler/index
    mhi/index
    tty/index
+   hte/index
 
 Architecture-agnostic documentation
 -----------------------------------
diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index 1fcfe17cf28a..ebd9817651c2 100644
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
index 000000000000..3c09f761ca0c
--- /dev/null
+++ b/drivers/hte/hte-tegra194.c
@@ -0,0 +1,690 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021-2022 NVIDIA Corporation
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
+#include <linux/gpio/driver.h>
+#include <linux/gpio/consumer.h>
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
+#define NV_AON_GPIO_PORT_CC_0		12
+#define NV_AON_GPIO_PORT_CC_1		13
+#define NV_AON_GPIO_PORT_CC_2		14
+#define NV_AON_GPIO_PORT_CC_3		15
+#define NV_AON_GPIO_PORT_CC_4		16
+#define NV_AON_GPIO_PORT_CC_5		17
+#define NV_AON_GPIO_PORT_CC_6		18
+#define NV_AON_GPIO_PORT_CC_7		19
+
+/* AON GPIO port DD pins */
+#define NV_AON_GPIO_PORT_DD_0		20
+#define NV_AON_GPIO_PORT_DD_1		21
+#define NV_AON_GPIO_PORT_DD_2		22
+
+/* AON GPIO port EE pins */
+#define NV_AON_GPIO_PORT_EE_0		23
+#define NV_AON_GPIO_PORT_EE_1		24
+#define NV_AON_GPIO_PORT_EE_2		25
+#define NV_AON_GPIO_PORT_EE_3		26
+#define NV_AON_GPIO_PORT_EE_4		27
+#define NV_AON_GPIO_PORT_EE_5		28
+#define NV_AON_GPIO_PORT_EE_6		29
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
+enum tegra_hte_type {
+	HTE_TEGRA_TYPE_GPIO = 1U << 0,
+	HTE_TEGRA_TYPE_LIC = 1U << 1,
+};
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
+struct tegra_hte_line_data {
+	unsigned long flags;
+	void *data;
+};
+
+struct tegra_hte_data {
+	enum tegra_hte_type type;
+	u32 map_sz;
+	const struct tegra_hte_line_mapped *map;
+};
+
+struct tegra_hte_soc {
+	int hte_irq;
+	u32 itr_thrshld;
+	u32 conf_rval;
+	struct hte_slices *sl;
+	const struct tegra_hte_data *prov_data;
+	struct tegra_hte_line_data *line_data;
+	struct hte_chip *chip;
+	struct gpio_chip *c;
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
+	[NV_AON_GPIO_PORT_EE_0] = {1, NV_AON_HTE_SLICE1_IRQ_GPIO_29},
+	[NV_AON_GPIO_PORT_EE_1] = {1, NV_AON_HTE_SLICE1_IRQ_GPIO_28},
+	[NV_AON_GPIO_PORT_EE_2] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
+	[NV_AON_GPIO_PORT_EE_3] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
+	[NV_AON_GPIO_PORT_EE_4] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
+	[NV_AON_GPIO_PORT_EE_5] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
+	[NV_AON_GPIO_PORT_EE_6] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
+};
+
+static const struct tegra_hte_data aon_hte = {
+	.map_sz = ARRAY_SIZE(tegra194_aon_gpio_map),
+	.map = tegra194_aon_gpio_map,
+	.type = HTE_TEGRA_TYPE_GPIO,
+};
+
+static const struct tegra_hte_data lic_hte = {
+	.map_sz = 0,
+	.map = NULL,
+	.type = HTE_TEGRA_TYPE_LIC,
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
+	if (gs->prov_data && gs->prov_data->map) {
+		m = gs->prov_data->map;
+		if (eid > gs->prov_data->map_sz)
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
+				const struct of_phandle_args *args,
+				struct hte_ts_desc *desc, u32 *xlated_id)
+{
+	int ret = 0;
+	u32 line_id;
+	struct tegra_hte_soc *gs;
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
+		desc->attr.line_id = args->args[0];
+	}
+
+	gs = gc->data;
+	if (!gs)
+		return -EINVAL;
+
+	/*
+	 * GPIO consumers send base + offset as line id which is a GPIO
+	 * logical id in GPIO namespace, convert it into the hardware GPIO
+	 * number before mapping it into HTE/GTE namespace.
+	 */
+	if (gs->prov_data->type == HTE_TEGRA_TYPE_GPIO)
+		line_id = desc->attr.line_id - gs->c->base;
+	else
+		line_id = desc->attr.line_id;
+
+	ret = tegra_hte_map_to_line_id(line_id, gc->data,
+				       xlated_id);
+	if (ret < 0) {
+		dev_dbg(gc->dev, "line_id:%u mapping failed\n",
+			desc->attr.line_id);
+		return ret;
+	}
+
+	if (*xlated_id > gc->nlines)
+		return -EINVAL;
+
+	dev_dbg(gc->dev, "requested id:%u, xlated id:%u\n",
+		desc->attr.line_id, *xlated_id);
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
+	gs = chip->data;
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
+static int tegra_hte_enable(struct hte_chip *chip, u32 line_id)
+{
+	if (!chip)
+		return -EINVAL;
+
+	return tegra_hte_en_dis_common(chip, line_id, true);
+}
+
+static int tegra_hte_disable(struct hte_chip *chip, u32 line_id)
+{
+	if (!chip)
+		return -EINVAL;
+
+	return tegra_hte_en_dis_common(chip, line_id, false);
+}
+
+static int tegra_hte_request(struct hte_chip *chip, struct hte_ts_desc *desc,
+			     u32 line_id)
+{
+	int ret;
+	struct tegra_hte_soc *gs;
+	struct hte_line_attr *attr;
+
+	if (!chip || !chip->data || !desc)
+		return -EINVAL;
+
+	gs = chip->data;
+	attr = &desc->attr;
+
+	if (gs->prov_data->type == HTE_TEGRA_TYPE_GPIO) {
+		ret = gpiod_enable_hw_timestamp(attr->line_data,
+						attr->edge_flags);
+		if (ret)
+			return ret;
+
+		gs->line_data[line_id].data = attr->line_data;
+		gs->line_data[line_id].flags = attr->edge_flags;
+	}
+
+	return tegra_hte_en_dis_common(chip, line_id, true);
+}
+
+static int tegra_hte_release(struct hte_chip *chip, struct hte_ts_desc *desc,
+			     u32 line_id)
+{
+	struct tegra_hte_soc *gs;
+	struct hte_line_attr *attr;
+	int ret;
+
+	if (!chip || !chip->data || !desc)
+		return -EINVAL;
+
+	gs = chip->data;
+	attr = &desc->attr;
+
+	if (gs->prov_data->type == HTE_TEGRA_TYPE_GPIO) {
+		ret = gpiod_disable_hw_timestamp(attr->line_data,
+						 gs->line_data[line_id].flags);
+		if (ret)
+			return ret;
+
+		gs->line_data[line_id].data = NULL;
+		gs->line_data[line_id].flags = 0;
+	}
+
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
+int tegra_hte_get_level(struct tegra_hte_soc *gs, u32 line_id)
+{
+	struct gpio_desc *desc;
+
+	if (gs->prov_data->type == HTE_TEGRA_TYPE_GPIO) {
+		desc = gs->line_data[line_id].data;
+		if (desc)
+			return gpiod_get_raw_value(desc);
+	}
+
+	return -1;
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
+			line_id = bit_index + (slice << 5);
+			el.tsc = tsc << HTE_TS_NS_SHIFT;
+			el.raw_level = tegra_hte_get_level(gs, line_id);
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
+bool tegra_hte_match_from_linedata(const struct hte_chip *chip,
+				   const struct hte_ts_desc *hdesc)
+{
+	struct tegra_hte_soc *hte_dev = chip->data;
+
+	if (!hte_dev || (hte_dev->prov_data->type != HTE_TEGRA_TYPE_GPIO))
+		return false;
+
+	return hte_dev->c == gpiod_to_chip(hdesc->attr.line_data);
+}
+
+static const struct of_device_id tegra_hte_of_match[] = {
+	{ .compatible = "nvidia,tegra194-gte-lic", .data = &lic_hte},
+	{ .compatible = "nvidia,tegra194-gte-aon", .data = &aon_hte},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_hte_of_match);
+
+static const struct hte_ops g_ops = {
+	.request = tegra_hte_request,
+	.release = tegra_hte_release,
+	.enable = tegra_hte_enable,
+	.disable = tegra_hte_disable,
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
+static int tegra_get_gpiochip_from_name(struct gpio_chip *chip, void *data)
+{
+	return !strcmp(chip->label, data);
+}
+
+static int tegra_hte_probe(struct platform_device *pdev)
+{
+	int ret;
+	u32 i, slices, val = 0;
+	u32 nlines;
+	struct device *dev;
+	struct tegra_hte_soc *hte_dev;
+	struct hte_chip *gc;
+
+	dev = &pdev->dev;
+
+	ret = of_property_read_u32(dev->of_node, "nvidia,slices", &slices);
+	if (ret != 0) {
+		dev_err(dev, "Could not read slices\n");
+		return -EINVAL;
+	}
+	nlines = slices << 5;
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
+	hte_dev->prov_data = of_device_get_match_data(&pdev->dev);
+
+	hte_dev->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hte_dev->regs))
+		return PTR_ERR(hte_dev->regs);
+
+	ret = of_property_read_u32(dev->of_node, "nvidia,int-threshold",
+				   &hte_dev->itr_thrshld);
+	if (ret != 0)
+		hte_dev->itr_thrshld = 1;
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
+	gc->nlines = nlines;
+	gc->ops = &g_ops;
+	gc->dev = dev;
+	gc->data = hte_dev;
+	gc->xlate = tegra_hte_line_xlate;
+	gc->of_hte_n_cells = 1;
+
+	if (hte_dev->prov_data &&
+	    hte_dev->prov_data->type == HTE_TEGRA_TYPE_GPIO) {
+		hte_dev->line_data = devm_kcalloc(dev, nlines,
+						  sizeof(*hte_dev->line_data),
+						  GFP_KERNEL);
+		if (!hte_dev->line_data)
+			return -ENOMEM;
+
+		gc->match_from_linedata = tegra_hte_match_from_linedata;
+
+		hte_dev->c = gpiochip_find("tegra194-gpio-aon",
+					   tegra_get_gpiochip_from_name);
+		if (!hte_dev->c)
+			return dev_err_probe(dev, -EPROBE_DEFER,
+					     "wait for gpio controller\n");
+	}
+
+	hte_dev->chip = gc;
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

