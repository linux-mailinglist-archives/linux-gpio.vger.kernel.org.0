Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA03413D91
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 00:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbhIUWcG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 18:32:06 -0400
Received: from mail-eopbgr60046.outbound.protection.outlook.com ([40.107.6.46]:63872
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229804AbhIUWcE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 18:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6qlucKH03kvd+htgt8l4eEqyUFTOqh343W6zGxV0Oo=;
 b=pXTzCUWTb8JIlnaYYCqg7VBxaV4ENmXxv3utUz3K5xDxntuc9TjZTRMze7xC6BZNSeeLzzeQc5zhbOipeszKpDnLboMcQOsj6zAvtoCL99aLy5xwrdSidlR/9Qn4JEV/P0nyXSGq4ApYOngBed8RoEKgPDXFwbHei6W7D5R9QxA=
Received: from AS8P251CA0026.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::17)
 by DB9PR08MB6443.eurprd08.prod.outlook.com (2603:10a6:10:261::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 21 Sep
 2021 22:30:33 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::b) by AS8P251CA0026.outlook.office365.com
 (2603:10a6:20b:2f2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 22:30:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 22:30:32 +0000
Received: ("Tessian outbound 16951d3c485e:v103"); Tue, 21 Sep 2021 22:30:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fecf07f94357b349
X-CR-MTA-TID: 64aa7808
Received: from 260277751038.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2D5A8EC0-784F-4C70-96B2-5D13503C4FC3.1;
        Tue, 21 Sep 2021 22:30:25 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 260277751038.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Sep 2021 22:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLlVAFXANTQ5MKZRWLAfuMlIaBCBVT+2dwEMKTFqlIlmdoGV08MVLuyzWVFi8MSdjFGFtzxkO6H3qeAlGFOxGz7lUL7d00amvFVnnZs2tL8IKvEM9ucJSm/Kyzr3Pv4Dscp5RchTssuLpRgceYxLFaxLhGGK89Cja7lv8jnjfM9gyxtIhvO+a2RCGgMLMU2To6nVQw8Se1HSHdt37iWcf2WgfnlsnooKo0W4sTfcGizLVkE6VtGRcTNhyKVBwpeA+4gqG4/G7Sl6bQqb8cOWp160GsrJ7tAyF5G5mBfHS1RXRH5G9XX/q5bmVKQKh3ZYPCG8063KC1sQdBUARBUjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=g6qlucKH03kvd+htgt8l4eEqyUFTOqh343W6zGxV0Oo=;
 b=ORUbzaYfJnjb4yuY2AzIS9F64jcv5708XQCBjejf70UHGkfwGMgOMHzeCkPANoR7v+/CTc1PedvP1ta2yH8uLrl7/4vpBbFh3PO+zaF0deMeX2mBAWjCutYmsaOkeKiE5MiUJFLbDul6iD+3T6fKUKxgl9991t4CJ+x3elIDDsVKZfYSqyFxmtPxC9P4HAmYgqSJ1LfkX6oZhkj4N7N/IvLXOjlmJWX2ahwBhov+hCxAbsxutIJDKuk76BVDq+tZOP8UYzFs/7ejmlcdKY+VJkooockaL6L+oZqvuOCdExvGSNsAGzGeZTU7NnbsYgffo6IE1WM+aKUzn4hy4+GVDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6qlucKH03kvd+htgt8l4eEqyUFTOqh343W6zGxV0Oo=;
 b=pXTzCUWTb8JIlnaYYCqg7VBxaV4ENmXxv3utUz3K5xDxntuc9TjZTRMze7xC6BZNSeeLzzeQc5zhbOipeszKpDnLboMcQOsj6zAvtoCL99aLy5xwrdSidlR/9Qn4JEV/P0nyXSGq4ApYOngBed8RoEKgPDXFwbHei6W7D5R9QxA=
Received: from PR3P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::12)
 by HE1PR0802MB2297.eurprd08.prod.outlook.com (2603:10a6:3:ce::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 22:30:21 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:54:cafe::a3) by PR3P191CA0007.outlook.office365.com
 (2603:10a6:102:54::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Tue, 21 Sep 2021 22:30:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 22:30:21 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Tue, 21 Sep
 2021 22:30:20 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Sep 2021 22:30:19 +0000
Received: from e124191.cambridge.arm.com (10.11.7.12) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 21 Sep 2021 22:30:19 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Date:   Tue, 21 Sep 2021 23:29:56 +0100
Message-ID: <20210921222956.40719-2-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921222956.40719-1-joey.gouly@arm.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ee738b2-01fe-4583-f659-08d97d4f6cb2
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2297:|DB9PR08MB6443:
X-Microsoft-Antispam-PRVS: <DB9PR08MB64435900BC1B6D220E785CD794A19@DB9PR08MB6443.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mHAK+d1/uCxmBP5/ZrOeIbwoH1M3Sz5lod2imvPj8q39hJdEcOKDQqIoqDw3v4XdMUda52gFgpJkTBFU6yVCS4RoxtDnJ5VXUbVkLsGz8nkY4lRjZGQZ5ecLXZK33fXcS46rlBEG6fLKs2/9q+ICDYBN87a1+da+FIJjsYbCHWEhA0J8CQwtf31s2ieXVYkEZYqCTMzjfy3zS1RJjHDPxA9cP1zvd/4vwQR0xpC3krUUlZQjRzBMSB7urcc021JwTVzmxjukss/ckW8cvLxerk2GiFty3XspPsRSlzpaLONsN7Z2k6IHaqimXntvtbNVBLDGzphW4K2nwTkAzFO1NX/yecJTCl9KUR5dnijTzv4ULszG3Ne/sXCZX/2Ozlxd2dm8Eu+CLy3jJ4IU0R5foog8MAdE+JL5YH+gKrf+kd4/bWwK31gtQXfM37aC73XCyyEArC+SWkw0Q15fzuQJzntjeDdhbzeaLErNFrcJ1PGigm68m440jtXYe9R1iVagzXRgIyjoGclLgI8wBFk1wyouNFFy566ci04FZ4k15t4mnEaVx+pswxWasYuEml+lkgoZDroMj7SGJVdouhwnJX6NQlf9JL3AE4lpCuiM9iGOHEf7rcKsdArHdESTkCiRcNx3KBHsFPqokvO6YpOJtTa0DQe5U3ijxxY3g/I14a11H4SrKzVeJL3vE0LY14jKgsd60n5JPp0jZ9RbffHdvJxXqoOMWhWwEREfS8bbN4s=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(336012)(7696005)(508600001)(2616005)(6916009)(70206006)(1076003)(81166007)(36860700001)(316002)(8936002)(8676002)(54906003)(6666004)(70586007)(186003)(83380400001)(2906002)(82310400003)(44832011)(26005)(5660300002)(4326008)(86362001)(356005)(30864003)(426003)(36756003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2297
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2d98758d-6433-49bc-052c-08d97d4f65b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cuRhRCz0LjkhF1fjX9hSQoA1gHfdmRou2AOwdEgJBSB8dclicEmA/ipbaJYO6Ulil1U8PVEYFw8TSRLC/CTkz0j2QRA9XbaP16Qjb1tT3xYFf4bpCPjRGp7BvlT6sKNbgb1/vWvG/WZb/WZVHz/v3XqwsgpJRhyKErFCLTe0Hoo4uDLFDUHsIOuvGu8VjNAH9gdHO7yrFCd1M+k+snzey3+MYLHDOGYzJgwfZy7AlzI+sSmbin3RtqVS2xq1DshB+XgFvzyxHGG47R9eaBDtdQBLQQkzxQpATcH0eUAk3IEnj2yNT+/0GRN4ZTYAV9KNAU+A4JfZ/FhGEM9t77svSsckAHxM+Hplh75gVOTKoJVE6Cid0lHg/cRE/Gx6vAVC7Z5h0zOxAnD7vOgNC/L1lc4MhPdtuudnBbDAEXVqn6aPysiCjD06Eqwnvzry+GHkgFmXggIyRTKsm7Pcf86duN3SsBmhuyPqxc/BZozp9fBPvW5QqiLUdauFe2uv02mRBKBtHwk4jV42+z91Jpc99X1nhOSXKf9YnM/+LGTOsSCnQRacg0GAsVVfWIzVHVOnUwQPPX6s/9sFeF6oWoK2/kSVpWTL+kSQWkeRiLXROzJ55sOECtmCAZJ1d4rsl3mS/gtwwmTVzazPbEL3smkXvHmmzmi/CuF5o4l9UKVOltc7yNOxH3BrNWS8n/F/U5YW6LVLwhxgQQBpNmHoAd0vCg==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(2616005)(508600001)(336012)(426003)(82310400003)(1076003)(70586007)(83380400001)(54906003)(30864003)(8676002)(4326008)(86362001)(5660300002)(2906002)(316002)(8936002)(7696005)(26005)(6666004)(36860700001)(6916009)(186003)(70206006)(81166007)(36756003)(47076005)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 22:30:32.8412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee738b2-01fe-4583-f659-08d97d4f6cb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6443
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Stan Skowronek <stan@corellium.com>

This driver adds support for the pinctrl / GPIO hardware found
on some Apple SoCs.

Co-authored-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Stan Skowronek <stan@corellium.com>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 MAINTAINERS                          |   1 +
 drivers/pinctrl/Kconfig              |  13 +
 drivers/pinctrl/Makefile             |   1 +
 drivers/pinctrl/pinctrl-apple-gpio.c | 652 +++++++++++++++++++++++++++
 4 files changed, 667 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-apple-gpio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ca6d6fde85cf..e83e992b8ada 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1722,6 +1722,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/irqchip/irq-apple-aic.c
+F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
 
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 31921108e456..7269614c85a1 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -31,6 +31,19 @@ config DEBUG_PINCTRL
 	help
 	  Say Y here to add some extra checks and diagnostics to PINCTRL calls.
 
+config PINCTRL_APPLE_GPIO
+	bool "Apple SoC GPIO pin controller driver"
+	depends on ARCH_APPLE
+	select PINMUX
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select OF_GPIO
+	help
+	  This is the driver for the GPIO controller found on Apple ARM SoCs,
+	  including M1.
+
 config PINCTRL_ARTPEC6
 	bool "Axis ARTPEC-6 pin controller driver"
 	depends on MACH_ARTPEC6
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 200073bcc2c1..5e63de2ffcf4 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PINMUX)		+= pinmux.o
 obj-$(CONFIG_PINCONF)		+= pinconf.o
 obj-$(CONFIG_OF)		+= devicetree.o
 obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
+obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
 obj-$(CONFIG_PINCTRL_ARTPEC6)	+= pinctrl-artpec6.o
 obj-$(CONFIG_PINCTRL_AS3722)	+= pinctrl-as3722.o
 obj-$(CONFIG_PINCTRL_AXP209)	+= pinctrl-axp209.o
diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
new file mode 100644
index 000000000000..a27d21682f3a
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -0,0 +1,652 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Apple SoC pinctrl+GPIO+external IRQ driver
+ *
+ * Copyright (C) 2021 The Asahi Linux Contributors
+ * Copyright (C) 2020 Corellium LLC
+ *
+ * Based on: pinctrl-pistachio.c
+ * Copyright (C) 2014 Imagination Technologies Ltd.
+ * Copyright (C) 2014 Google, Inc.
+ */
+
+#define USE_PINMUX_GENERIC_FN 1
+#define USE_PINCTRL_GENERIC_FN 1
+
+#include <dt-bindings/pinctrl/apple.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-utils.h"
+#include "core.h"
+#include "pinmux.h"
+
+struct apple_gpio_pincfg {
+	uint8_t irqtype;
+	uint8_t stat;
+};
+
+#define PINCFG_STAT_OUTVAL	0x01
+#define PINCFG_STAT_OUTEN	0x02
+#define PINCFG_STAT_PERIPH	0x20
+#define PINCFG_STAT_IRQEN	0x80
+
+struct apple_gpio_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctldev;
+
+	unsigned int npins;
+	struct pinctrl_pin_desc *pins;
+	struct apple_gpio_pincfg *pin_cfgs;
+	const char **pin_names;
+	unsigned *pin_nums;
+
+	void __iomem *base;
+	unsigned int nirqgrps;
+
+	struct pinctrl_desc pinctrl_desc;
+	struct gpio_chip gpio_chip;
+	struct irq_chip irq_chip;
+};
+
+#define REG_GPIO(x)		(4 * (x))
+#define  REG_GPIOx_DATA		BIT(0)
+#define  REG_GPIOx_MODE_MASK	GENMASK(3, 1)
+#define REG_GPIOx_OUT	(1 << REG_GPIOx_DATA)
+#define REG_GPIOx_IN_IRQ_HI	(2 << REG_GPIOx_DATA)
+#define REG_GPIOx_IN_IRQ_LO	(3 << REG_GPIOx_DATA)
+#define REG_GPIOx_IN_IRQ_UP	(4 << REG_GPIOx_DATA)
+#define REG_GPIOx_IN_IRQ_DN	(5 << REG_GPIOx_DATA)
+#define REG_GPIOx_IN_IRQ_ANY	(6 << REG_GPIOx_DATA)
+#define REG_GPIOx_IN_IRQ_OFF	(7 << REG_GPIOx_DATA)
+#define  REG_GPIOx_PERIPH	BIT(5)
+#define  REG_GPIOx_CFG_DONE	BIT(9)
+#define  REG_GPIOx_GRP_MASK	GENMASK(18, 16)
+#define REG_IRQ(g,x)		(0x800 + 0x40 * (g) + 4 * ((x) >> 5))
+
+static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl, unsigned pin, uint32_t clr, uint32_t set)
+{
+	void __iomem *ppin = pctl->base + pin * 4;
+	uint32_t prev, cfg;
+
+	prev = readl(ppin);
+	cfg = (prev & ~clr) | set;
+
+	if(!(prev & REG_GPIOx_CFG_DONE))
+		writel(cfg & ~REG_GPIOx_CFG_DONE, ppin);
+	writel(cfg, ppin);
+}
+
+static void apple_gpio_refresh_reg(struct apple_gpio_pinctrl *pctl, unsigned pin)
+{
+	struct apple_gpio_pincfg *pincfg = &pctl->pin_cfgs[pin];
+
+	int stat = pincfg->stat;
+	int outval = (stat & PINCFG_STAT_OUTVAL);
+
+	int clear = REG_GPIOx_MODE_MASK | REG_GPIOx_DATA;
+	int set = REG_GPIOx_CFG_DONE | outval;
+
+	if (stat & PINCFG_STAT_PERIPH) {
+		set |= REG_GPIOx_PERIPH;
+	} else {
+		clear |= REG_GPIOx_PERIPH;
+		if (stat & PINCFG_STAT_OUTEN)
+			set |= REG_GPIOx_OUT;
+		else if (stat & PINCFG_STAT_IRQEN)
+			set |= pincfg->irqtype;
+		else
+			set |= REG_GPIOx_IN_IRQ_OFF;
+	}
+
+	apple_gpio_set_reg(pctl, pin, clear, set);
+}
+
+static uint32_t apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl, unsigned pin)
+{
+	return readl(pctl->base + pin * 4);
+}
+
+static void apple_gpio_init_reg(struct apple_gpio_pinctrl *pctl, unsigned pin)
+{
+	struct apple_gpio_pincfg *pincfg = &pctl->pin_cfgs[pin];
+	uint32_t reg = apple_gpio_get_reg(pctl, pin);
+
+	pincfg->irqtype = 0;
+	if(reg & REG_GPIOx_PERIPH) {
+		pincfg->stat = PINCFG_STAT_PERIPH;
+	} else if((reg & REG_GPIOx_MODE_MASK) == REG_GPIOx_OUT) {
+		pincfg->stat = PINCFG_STAT_OUTEN | (reg & PINCFG_STAT_OUTVAL);
+	} else if((reg & REG_GPIOx_MODE_MASK) == REG_GPIOx_IN_IRQ_OFF || !(reg & REG_GPIOx_MODE_MASK)) {
+		pincfg->stat = 0;
+	} else {
+		pincfg->irqtype = reg & REG_GPIOx_MODE_MASK;
+		pincfg->stat = PINCFG_STAT_IRQEN;
+	}
+}
+
+/* Pin controller functions */
+
+#if !USE_PINCTRL_GENERIC_FN
+static int apple_gpio_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctl->npins;
+}
+
+static const char *apple_gpio_pinctrl_get_group_name(struct pinctrl_dev *pctldev, unsigned group)
+{
+	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctl->pins[group].name;
+}
+
+static int apple_gpio_pinctrl_get_group_pins(struct pinctrl_dev *pctldev, unsigned group, const unsigned **pins, unsigned *num_pins)
+{
+	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = &pctl->pin_nums[group];
+	*num_pins = 1;
+
+	return 0;
+}
+#endif
+
+#if !USE_PINMUX_GENERIC_FN
+static const char *apple_gpio_pinmux_get_function_name(struct pinctrl_dev *pctldev, unsigned func);
+static int apple_gpio_pinmux_get_functions_count(struct pinctrl_dev *pctldev);
+#endif
+
+static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
+				 struct device_node *np_config,
+				 struct pinctrl_map **map, unsigned *num_maps)
+{
+	unsigned reserved_maps;
+	struct apple_gpio_pinctrl *pctl;
+	u32 pinfunc, pin, func;
+	int num_pins, i;
+	const char* group_name;
+	const char* function_name;
+	struct device_node *node = np_config;
+	int ret = 0;
+
+	*map = NULL;
+	*num_maps = 0;
+	reserved_maps = 0;
+
+	pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	ret = of_property_count_u32_elems(node, "pinmux");
+	if (ret <= 0) {
+		dev_err(pctl->dev, "missing or empty pinmux property in node %pOFn.\n", node);
+		return -EINVAL;
+	}
+
+	num_pins = ret;
+
+	ret = pinctrl_utils_reserve_map(pctldev, map,
+			&reserved_maps, num_maps, num_pins);
+	if (ret) {
+		return ret;
+	}
+
+	for (i = 0; i < num_pins; i++) {
+		ret = of_property_read_u32_index(node, "pinmux",
+				i, &pinfunc);
+		if (ret) {
+			goto free_map;
+		}
+
+		pin = APPLE_PIN(pinfunc);
+		func = APPLE_FUNC(pinfunc);
+
+#if USE_PINMUX_GENERIC_FN
+		if (func >=pinmux_generic_get_function_count(pctldev)) {
+#else
+		if (func >= apple_gpio_pinmux_get_functions_count(pctldev)) {
+#endif
+			ret = -EINVAL;
+			goto free_map;
+		}
+
+#if USE_PINCTRL_GENERIC_FN
+		group_name = pinctrl_generic_get_group_name(pctldev, pin);
+#else
+		group_name = apple_gpio_pinctrl_get_group_name(pctldev, pin);
+#endif
+
+#if USE_PINMUX_GENERIC_FN
+		function_name = pinmux_generic_get_function_name(pctl->pctldev, func);
+#else
+		function_name = apple_gpio_pinmux_get_function_name(pctl->pctldev, func);
+#endif
+
+		ret = pinctrl_utils_add_map_mux(pctl->pctldev, map, &reserved_maps, num_maps,
+				group_name, function_name);
+		if (ret) {
+			goto free_map;
+		}
+	}
+
+free_map:
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctldev, *map, *num_maps);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinctrl_ops apple_gpio_pinctrl_ops = {
+#if USE_PINCTRL_GENERIC_FN
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+#else
+	.get_groups_count = apple_gpio_pinctrl_get_groups_count,
+	.get_group_name = apple_gpio_pinctrl_get_group_name,
+	.get_group_pins = apple_gpio_pinctrl_get_group_pins,
+#endif
+	.dt_node_to_map = apple_gpio_dt_node_to_map,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+/* Pin multiplexer functions */
+
+#if !USE_PINMUX_GENERIC_FN
+static int apple_gpio_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return 2;
+}
+
+static const char *apple_gpio_pinmux_get_function_name(struct pinctrl_dev *pctldev, unsigned func)
+{
+	return func ? "periph" : "gpio";
+}
+
+static int apple_gpio_pinmux_get_function_groups(struct pinctrl_dev *pctldev, unsigned func, const char * const **groups, unsigned * const num_groups)
+{
+	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pctl->pin_names;
+	*num_groups = pctl->npins;
+	return 0;
+}
+#endif
+
+static int apple_gpio_pinmux_enable(struct pinctrl_dev *pctldev, unsigned func, unsigned group)
+{
+	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	if(func)
+		pctl->pin_cfgs[group].stat |= PINCFG_STAT_PERIPH;
+	else
+		pctl->pin_cfgs[group].stat &= ~PINCFG_STAT_PERIPH;
+	apple_gpio_refresh_reg(pctl, group);
+
+	return 0;
+}
+
+static const struct pinmux_ops apple_gpio_pinmux_ops = {
+#if USE_PINMUX_GENERIC_FN
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+#else
+	.get_functions_count = apple_gpio_pinmux_get_functions_count,
+	.get_function_name = apple_gpio_pinmux_get_function_name,
+	.get_function_groups = apple_gpio_pinmux_get_function_groups,
+#endif
+	.set_mux = apple_gpio_pinmux_enable,
+	.strict = true,
+};
+
+/* GPIO chip functions */
+
+static int apple_gpio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	return !(pctl->pin_cfgs[offset].stat & PINCFG_STAT_OUTEN) ?
+			GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+}
+
+static int apple_gpio_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+	uint32_t reg;
+
+	reg = apple_gpio_get_reg(pctl, offset);
+	return !!(reg & REG_GPIOx_DATA);
+}
+
+static void apple_gpio_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	if(value)
+		pctl->pin_cfgs[offset].stat |= PINCFG_STAT_OUTVAL;
+	else
+		pctl->pin_cfgs[offset].stat &= ~PINCFG_STAT_OUTVAL;
+	apple_gpio_refresh_reg(pctl, offset);
+}
+
+static int apple_gpio_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	pctl->pin_cfgs[offset].stat &= ~PINCFG_STAT_OUTEN;
+	apple_gpio_refresh_reg(pctl, offset);
+	return 0;
+}
+
+static int apple_gpio_gpio_direction_output(struct gpio_chip *chip, unsigned offset, int value)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	int clear = PINCFG_STAT_PERIPH;
+	int set = PINCFG_STAT_OUTEN;
+
+	if (value)
+		set |= PINCFG_STAT_OUTVAL;
+	else
+		clear |= PINCFG_STAT_OUTVAL;
+
+	pctl->pin_cfgs[offset].stat &= ~clear;
+	pctl->pin_cfgs[offset].stat |= set;
+
+	apple_gpio_refresh_reg(pctl, offset);
+	return 0;
+}
+
+/* IRQ chip functions */
+
+static void apple_gpio_gpio_irq_ack(struct irq_data *data)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	unsigned irqgrp = FIELD_GET(REG_GPIOx_GRP_MASK, apple_gpio_get_reg(pctl, data->hwirq));
+
+	writel(1u << (data->hwirq & 31), pctl->base + REG_IRQ(irqgrp, data->hwirq));
+}
+
+static void apple_gpio_gpio_irq_mask(struct irq_data *data)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
+
+	pctl->pin_cfgs[data->hwirq].stat &= ~PINCFG_STAT_IRQEN;
+	apple_gpio_refresh_reg(pctl, data->hwirq);
+}
+
+static void apple_gpio_gpio_irq_unmask(struct irq_data *data)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
+
+	pctl->pin_cfgs[data->hwirq].stat |= PINCFG_STAT_IRQEN;
+	apple_gpio_refresh_reg(pctl, data->hwirq);
+}
+
+static unsigned int apple_gpio_gpio_irq_startup(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+	unsigned irqgrp = 0;
+
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_GRP_MASK, FIELD_PREP(REG_GPIOx_GRP_MASK, irqgrp));
+
+	apple_gpio_gpio_direction_input(chip, data->hwirq);
+	apple_gpio_gpio_irq_unmask(data);
+
+	return 0;
+}
+
+static int apple_gpio_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
+
+	switch(type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		pctl->pin_cfgs[data->hwirq].irqtype = REG_GPIOx_IN_IRQ_UP;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		pctl->pin_cfgs[data->hwirq].irqtype = REG_GPIOx_IN_IRQ_DN;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		pctl->pin_cfgs[data->hwirq].irqtype = REG_GPIOx_IN_IRQ_ANY;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		pctl->pin_cfgs[data->hwirq].irqtype = REG_GPIOx_IN_IRQ_HI;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		pctl->pin_cfgs[data->hwirq].irqtype = REG_GPIOx_IN_IRQ_LO;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	apple_gpio_refresh_reg(pctl, data->hwirq);
+
+	if(type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(data, handle_level_irq);
+	else
+		irq_set_handler_locked(data, handle_edge_irq);
+	return 0;
+}
+
+static void apple_gpio_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(gc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned irqgrp, pinh, pinl;
+	unsigned long pending;
+	unsigned int parent = irq_desc_get_irq(desc);
+
+	for (irqgrp = 0; irqgrp < pctl->nirqgrps; ++irqgrp) {
+		if (parent == gc->irq.parents[irqgrp])
+			break;
+	}
+
+	WARN_ON(irqgrp == pctl->nirqgrps);
+
+	chained_irq_enter(chip, desc);
+	for(pinh=0; pinh<pctl->npins; pinh+=32) {
+		pending = readl(pctl->base + REG_IRQ(irqgrp, pinh));
+		for_each_set_bit(pinl, &pending, 32)
+			generic_handle_irq(irq_linear_revmap(gc->irq.domain, pinh + pinl));
+	}
+	chained_irq_exit(chip, desc);
+}
+
+/* Probe & register */
+
+static int apple_gpio_gpio_register(struct apple_gpio_pinctrl *pctl)
+{
+	struct device_node *node = pctl->dev->of_node;
+	struct gpio_irq_chip *girq;
+	int i, ret = 0;
+
+	if(!of_find_property(node, "gpio-controller", NULL)) {
+		dev_err(pctl->dev, "Apple GPIO must have 'gpio-controller' property.\n");
+		return -ENODEV;
+	}
+
+	pctl->gpio_chip.label = dev_name(pctl->dev);
+	pctl->gpio_chip.request = gpiochip_generic_request;
+	pctl->gpio_chip.free = gpiochip_generic_free;
+	pctl->gpio_chip.get_direction = apple_gpio_gpio_get_direction;
+	pctl->gpio_chip.direction_input = apple_gpio_gpio_direction_input;
+	pctl->gpio_chip.direction_output = apple_gpio_gpio_direction_output;
+	pctl->gpio_chip.get = apple_gpio_gpio_get;
+	pctl->gpio_chip.set = apple_gpio_gpio_set;
+	pctl->gpio_chip.base = -1;
+	pctl->gpio_chip.ngpio = pctl->npins;
+	pctl->gpio_chip.parent = pctl->dev;
+	pctl->gpio_chip.of_node = node;
+
+	if (of_find_property(node, "interrupt-controller", NULL)) {
+		ret = platform_irq_count(to_platform_device(pctl->dev));
+		if(ret < 0)
+			return ret;
+
+		pctl->nirqgrps = ret;
+
+		pctl->irq_chip.name = dev_name(pctl->dev);
+		pctl->irq_chip.irq_startup = apple_gpio_gpio_irq_startup;
+		pctl->irq_chip.irq_ack = apple_gpio_gpio_irq_ack;
+		pctl->irq_chip.irq_mask = apple_gpio_gpio_irq_mask;
+		pctl->irq_chip.irq_unmask = apple_gpio_gpio_irq_unmask;
+		pctl->irq_chip.irq_set_type = apple_gpio_gpio_irq_set_type;
+
+		girq = &pctl->gpio_chip.irq;
+		girq->chip = &pctl->irq_chip;
+		girq->parent_handler = apple_gpio_gpio_irq_handler;
+		girq->num_parents = pctl->nirqgrps;
+
+		girq->parents = devm_kmalloc_array(pctl->dev, pctl->nirqgrps,
+			sizeof(girq->parents[0]), GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+
+		for(i = 0; i < pctl->nirqgrps; i++) {
+			ret = platform_get_irq(to_platform_device(pctl->dev), i);
+			if(ret < 0) {
+				if(ret != -EPROBE_DEFER)
+					dev_err(pctl->dev, "Failed to map IRQ %d (%d).\n", i, ret);
+				return ret;
+			}
+			girq->parents[i] = ret;
+		}
+
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_level_irq;
+	}
+
+	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
+	if(ret < 0) {
+		dev_err(pctl->dev, "Failed to add GPIO chip (%d).\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id apple_gpio_pinctrl_of_match[] = {
+	{ .compatible = "apple,t8103-pinctrl", },
+	{ },
+};
+
+static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
+{
+	struct apple_gpio_pinctrl *pctl;
+	struct of_phandle_args pinspec;
+	int res;
+	unsigned pin_base, i;
+
+	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
+	if(!pctl)
+		return -ENOMEM;
+	pctl->dev = &pdev->dev;
+	dev_set_drvdata(&pdev->dev, pctl);
+
+	if (of_parse_phandle_with_fixed_args(pdev->dev.of_node, "gpio-ranges",
+			3, 0, &pinspec)) {
+		dev_err(&pdev->dev, "gpio-ranges property not found\n");
+		return -EINVAL;
+	}
+
+	pctl->npins = pinspec.args[2];
+	pin_base = pinspec.args[1];
+
+	pctl->pins = devm_kmalloc_array(&pdev->dev, pctl->npins, sizeof(pctl->pins[0]), GFP_KERNEL);
+	if(!pctl->pins)
+		return -ENOMEM;
+	pctl->pin_names = devm_kmalloc_array(&pdev->dev, pctl->npins, sizeof(pctl->pin_names[0]), GFP_KERNEL);
+	if(!pctl->pin_names)
+		return -ENOMEM;
+	pctl->pin_nums = devm_kmalloc_array(&pdev->dev, pctl->npins, sizeof(pctl->pin_nums[0]), GFP_KERNEL);
+	if(!pctl->pin_nums)
+		return -ENOMEM;
+	pctl->pin_cfgs = devm_kmalloc_array(&pdev->dev, pctl->npins, sizeof(pctl->pin_cfgs[0]), GFP_KERNEL);
+	if(!pctl->pin_cfgs)
+		return -ENOMEM;
+
+	pctl->base = devm_platform_ioremap_resource(pdev, 0);
+	if(IS_ERR(pctl->base))
+		return PTR_ERR(pctl->base);
+
+	for(i=0; i<pctl->npins; i++) {
+		apple_gpio_init_reg(pctl, i);
+
+		pctl->pins[i].number = i + pin_base;
+		pctl->pins[i].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "PIN%u", i + pin_base);
+		pctl->pins[i].drv_data = pctl;
+		pctl->pin_names[i] = pctl->pins[i].name;
+		pctl->pin_nums[i] = i + pin_base;
+	}
+
+	pctl->pinctrl_desc.name = dev_name(pctl->dev);
+	pctl->pinctrl_desc.pins = pctl->pins;
+	pctl->pinctrl_desc.npins = pctl->npins;
+	pctl->pinctrl_desc.pctlops = &apple_gpio_pinctrl_ops;
+	pctl->pinctrl_desc.pmxops = &apple_gpio_pinmux_ops;
+
+	pctl->pctldev = devm_pinctrl_register(&pdev->dev, &pctl->pinctrl_desc, pctl);
+	if (IS_ERR(pctl->pctldev)) {
+		dev_err(&pdev->dev, "Failed to register pinctrl device.\n");
+		return PTR_ERR(pctl->pctldev);
+	}
+
+#if USE_PINCTRL_GENERIC_FN
+	for (i = 0; i < pctl->npins; i++) {
+		res = pinctrl_generic_add_group(pctl->pctldev, pctl->pins[i].name,
+						pctl->pin_nums + i, 1, pctl);
+		if (res < 0) {
+			dev_err(pctl->dev, "Failed to register group.");
+			return res;
+		}
+	}
+#endif
+
+#if USE_PINMUX_GENERIC_FN
+	res = pinmux_generic_add_function(pctl->pctldev, "gpio", pctl->pin_names, pctl->npins, pctl);
+
+	if (res < 0) {
+		dev_err(pctl->dev, "Failed to register function.");
+		return res;
+	}
+
+	res = pinmux_generic_add_function(pctl->pctldev, "periph", pctl->pin_names, pctl->npins, pctl);
+
+	if (res < 0) {
+		dev_err(pctl->dev, "Failed to register function.");
+		return res;
+	}
+#endif
+
+	return apple_gpio_gpio_register(pctl);
+}
+
+static struct platform_driver apple_gpio_pinctrl_driver = {
+	.driver = {
+		.name = "apple-gpio-pinctrl",
+		.of_match_table = apple_gpio_pinctrl_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = apple_gpio_pinctrl_probe,
+};
+
+module_platform_driver(apple_gpio_pinctrl_driver);
+
+MODULE_DESCRIPTION("Apple pinctrl/GPIO driver");
+MODULE_AUTHOR("Stan Skowronek <stan@corellium.com>");
+MODULE_AUTHOR("Joey Gouly <joey.gouly@arm.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

