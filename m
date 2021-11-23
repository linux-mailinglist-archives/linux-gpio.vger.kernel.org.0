Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930AC45AC5F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240139AbhKWTcv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:32:51 -0500
Received: from mail-mw2nam10on2061.outbound.protection.outlook.com ([40.107.94.61]:17568
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236136AbhKWTcb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4wwOQEZ1KrYhUdHzQUEjzn9CHrKLD/FOSviTeYbErSb+pbvt2d9ud7h1qqLMaC0kCZjDO/CTF/TdBV5bRUMZ24rvz6gWYee/hheRq7fBBX0f5HlE4dS+X9HILjK60WAetxtAfVDYtgDzbVEXCvIX2AY1iLXA6uYigPzHI8bajAlCZShg2xe212w7u3T0jR0/VQ3kA9KAWp3w5AaJIYitluZFszLgJHJLLuqQWY9aeFod6zSZ/C7JNrd2Z5cIxBotskybsF1pmsay/2fQOynDiTAToO8FaOppHgre7zh2Cm417ca5zgzu95HO2Hnj29HuGZZ+WFKTY9Fqsaxtg2iqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTPFClWycYEIbMeeTM36M5Q+5T59XkAtBVsmaWu2dH4=;
 b=TRPI5lxQFnMNlPdlVYVPO5SqetyIjEK2mnz9X0NoGUb4mqc5sns/ZGYy779Dyu3je/cncybU4aaXPLFLCs1i7gCmgXV4Q956gs1a0cNM1SdVCV9c2cxVEgsfw+zj/e9x7GGrR0lLBwfUYbvmFBYOKQAERasjx0L208irzayWBMW0RI5rOd+Sz9xeUbk2c2aSzsBBtYmYQVG9B2IYGZC0Eof7u6TxlISgQZjwfjDKnzxdNyi/tUvL4N3Dhc7yLfhtlfSEotL9DB6lz1SbyVzs2FsqqkweAawx0jJHKe263nXfdSqyimSaY2v94HuptvQsq3OOvsaQEAIcY5oqFbQ4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTPFClWycYEIbMeeTM36M5Q+5T59XkAtBVsmaWu2dH4=;
 b=n9HRosd7ygH9ixpTpkXK1sjEnpPbaw/U/18ltEgzf1BYSVMnjFC8nC9cPd+jF2+JEGQHAzQlDdZIg+K4kX0MY4i2aXCV+76N/U3AQ9QPgyU6nGkD1F7lWuFR7i2s2UD/G2KziM6yD0QHrBEcQvQJdsy+fMcFwA5sSUK44l9wD2JuIxloIKGJamKqOOnPd8p81f1vJq2iemaV4ePKSMlPrRag4hWehFuTjh4Q3jg58MClHxmxKQ9XZtjzPPiqYlOJSlXkBuPpv4ph/ZcxeNDDsMg1LaoKe8HatAlyYY/dovZY7HmAMarTOy8qVsnp97yNrCekXfRROqCzpACTf0AT2w==
Received: from CO2PR04CA0165.namprd04.prod.outlook.com (2603:10b6:104:4::19)
 by CH2PR12MB4940.namprd12.prod.outlook.com (2603:10b6:610:65::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Tue, 23 Nov
 2021 19:29:15 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:4:cafe::6a) by CO2PR04CA0165.outlook.office365.com
 (2603:10b6:104:4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:15 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:14 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:14 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 03/12] hte: Add tegra194 HTE kernel provider
Date:   Tue, 23 Nov 2021 11:30:30 -0800
Message-ID: <20211123193039.25154-4-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63c0e5a2-ee7c-40fd-f9aa-08d9aeb7892c
X-MS-TrafficTypeDiagnostic: CH2PR12MB4940:
X-Microsoft-Antispam-PRVS: <CH2PR12MB49408555BF6848908738338CAE609@CH2PR12MB4940.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwkSt4qkKzK8Op+9L3vliPyFPGyyCOUjwi99jtleo37HYrUwOjRpLB+TA4NMY0ciEj/Bx6jY5mL3WwUwsdO/Gxmg2v50ocsVLaKSD8vCE57xbmrD8fTgXz8Jde9qpc/GCjp/np4EXGbsZ3gSGRWjiOEzd3hcrLleYAdUmkqL18PEXfZOPq7V5p1fj7AFfIIVpXkVpLSdqMY/UEroDnqViW/mMMaB+5Z8xqrn3M8Z3WVMUAu/hOfpcQQNCCz0o4xJCfrbwMUDTA2WyDaPwybnrXy2B3HJAWnpJDYn65cFfYCOX/Zzh6xvk0iJY1zx5NJp3Dn2/Y71TZ295ykQSwfjBzaDSYPJP5KRgAG0BBqy1iQLWWWpreWCTdoA+4RV08ChVfC8M+CGtwr1zu3cbsD9+Y1dWTDLMYCGOLacwK/jHedybzYcImGsJdzxFmRgB8PR3NNvscAomMEA56XBbzXIqtA4lS2kpbWZ1dNfTr/K9QQsqRzWKzlvS2jLW7EAG06ekqWpxs7l0alr0tephzg+ORTxvsVNzMrh0/8w0/69GC9KjdkaVNt8x+I2m4jnhtTFtwWAhb4K2jA6OVYxkiw2JTK6JAs4AqKn4ST36dAP8D5SUUL2AWaXNeiJ7OaZBPE9+oHArOGrWwo9uH5w261ELuMT72uI6wZzUCKBWY+nijs3wmVpWVkVb2/h3WjIPDoEPDNiI4fUpTSf9rFUxDPf4zIRB+HM+FgBq3HQuE/yM8qJZHrWXHM8dEdv2q9NGkmFOvurDZuvT+gcZLxF5Wguew==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(426003)(2906002)(316002)(508600001)(2616005)(30864003)(110136005)(6666004)(47076005)(7696005)(7416002)(82310400004)(1076003)(336012)(8936002)(921005)(36860700001)(26005)(186003)(5660300002)(36756003)(86362001)(107886003)(7636003)(83380400001)(70206006)(4326008)(356005)(70586007)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:15.2220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c0e5a2-ee7c-40fd-f9aa-08d9aeb7892c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4940
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
Changes in v3:
- Addressed grammatical/spelling errors.

 Documentation/hte/index.rst        |  22 ++
 Documentation/hte/tegra194-hte.rst |  57 +++
 Documentation/index.rst            |   1 +
 drivers/hte/Kconfig                |  12 +
 drivers/hte/Makefile               |   1 +
 drivers/hte/hte-tegra194.c         | 545 +++++++++++++++++++++++++++++
 6 files changed, 638 insertions(+)
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
index 000000000000..3bebcbac5847
--- /dev/null
+++ b/Documentation/hte/tegra194-hte.rst
@@ -0,0 +1,57 @@
+HTE Kernel provider driver
+==========================
+
+Description
+-----------
+The Nvidia tegra194 HTE provider driver implements two GTE
+(Generic Timestamping Engine) instances: 1) GPIO GTE and 2) LIC
+(Legacy Interrupt Controller) IRQ GTE. Both GTEs instances get the
+timestamp from the system counter TSC which has 31.25MHz clock rate, and the
+driver converts clock tick rate to nanoseconds before storing it as timestamp
+value.
+
+GPIO GTE
+--------
+
+This GTE instance timestamps GPIO in real time. For that to happen GPIO
+needs to be configured as input and IRQ needs to be enabled. The only always on
+(AON) GPIO controller instance supports timestamping GPIOs in real time and it
+has 39 GPIO lines. The GPIO GTE and AON GPIO controller are tightly coupled as
+it requires very specific bits to be set in GPIO config register before GPIO
+GTE can be used. The GPIO GTE functionality is accessed from the GPIOLIB
+framework for the in-kernel and userspace consumers. In the latter case,
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
+one-to-one mapping, consumers can simply specify the IRQ number that they are
+interested in. There is no userspace consumer support for this GTE instance in
+the hte framework. The sample test code hte-tegra194-irq-test.c, located in
+the ``drivers/hte/`` directory, demonstrates how to use an IRQ GTE instance.
+The below is sample device tree snippet code for the test driver::
+
+ tegra_hte_irq_test {
+        compatible = "nvidia,tegra194-hte-irq-test";
+        htes = <&tegra_hte_lic 0x19>;
+        hte-names = "hte-lic";
+ };
+
+The provider source code of both IRQ and GPIO GTE instances is located at
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
index 000000000000..ffe9d0d20b94
--- /dev/null
+++ b/drivers/hte/hte-tegra194.c
@@ -0,0 +1,545 @@
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
+	ret = of_property_read_u32(dev->of_node, "nvidia,int-threshold",
+				   &hte_dev->itr_thrshld);
+	if (ret != 0)
+		hte_dev->itr_thrshld = 1;
+
+	ret = of_property_read_u32(dev->of_node, "nvidia,slices", &slices);
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

