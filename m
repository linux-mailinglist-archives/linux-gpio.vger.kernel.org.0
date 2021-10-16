Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E474302F4
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Oct 2021 16:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244388AbhJPOVV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Oct 2021 10:21:21 -0400
Received: from mail-eopbgr80053.outbound.protection.outlook.com ([40.107.8.53]:13910
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244359AbhJPOVG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 Oct 2021 10:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYR+yAWpRUOIP2TikQ4f8PEN+hsQSmBnxTQWRrMTnfA=;
 b=ELJy5oqvNZRiApEcAJ1rrCGYUASrbg7CyYWGOhRtTmx1dCpMPv/LSCVBGEcfWE7lMi5wwfp+P55jlEEi+HaBNjqfXTbHMApZ70119G/x0nz96zQXuezy+K9u1l5klIYs3NQdHRDCOjTsa81yCwJC0WunsqjhKzUKLmpF2mXCaxk=
Received: from DB6PR07CA0081.eurprd07.prod.outlook.com (2603:10a6:6:2b::19) by
 AM6PR08MB3509.eurprd08.prod.outlook.com (2603:10a6:20b:4e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Sat, 16 Oct 2021 14:18:53 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::df) by DB6PR07CA0081.outlook.office365.com
 (2603:10a6:6:2b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:53 +0000
Received: ("Tessian outbound b9598e0ead92:v103"); Sat, 16 Oct 2021 14:18:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 57e21ab1a94d14dd
X-CR-MTA-TID: 64aa7808
Received: from 032c5e199b1c.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id ACA162C3-21C3-466B-BAF9-13BD140A29DC.1;
        Sat, 16 Oct 2021 14:18:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 032c5e199b1c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 16 Oct 2021 14:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mK+NQOoSHy9M1338wrtt0M68D57fJFM7fhNuPwa8LgN4y36zi3BsYjWcgEP5xNPDPCtD6E+kdhGCer0eVu4fOE8QScTSMLzmYAVWz3zEUM6UD3b4TZlHVfUqL7ooLyqY8Fk1mI48/YXxjcqhMQxBO8kwvgBvd6582CikGir6zaRAhQ0u2pfw66vsZWM8IdbSobT7xd1yLMWJ6lFP1dg1pIAPTK/DY6EWU6ePJBXn9LtebUvndNpXMTAilDd2sw823VJ6h0gKqxJTu12dcE9tWfsjqorRVoy/a982tv0PkcYZffLC/kxLhY2JHDlr9ckUChQfWbgwlTID+KgESu7x+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYR+yAWpRUOIP2TikQ4f8PEN+hsQSmBnxTQWRrMTnfA=;
 b=mtueT76PdJnSbkkyEn1gwx33ahTXE3i2Mt10iRnQ96MM3GaXiv1anm25s8F0CYrwXDscgo/cYqBX9U/jxeOEQl7CUXMH2T5f08pe5LY6BGsOVqOhSXcggZlTG9m0z9eI1XiRcmsblpq8xj+66okXg5cz7mit4BGdG3StZ8g31vl5E2j61tr280X1tf0CZA8XUadWXKXBArACEKyhfDhW0FDD+VgNIbePqOFTXyd1BYQsf9CEranWcPxVGVjWFh2DqS6kvtgq6lcaT7A0tfBjmzb43YCURFe7ZuSK3OYkhq9MJ4V/mKoNm582+9uEJv/gltXkbaI1EqY5cfyHpUdt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYR+yAWpRUOIP2TikQ4f8PEN+hsQSmBnxTQWRrMTnfA=;
 b=ELJy5oqvNZRiApEcAJ1rrCGYUASrbg7CyYWGOhRtTmx1dCpMPv/LSCVBGEcfWE7lMi5wwfp+P55jlEEi+HaBNjqfXTbHMApZ70119G/x0nz96zQXuezy+K9u1l5klIYs3NQdHRDCOjTsa81yCwJC0WunsqjhKzUKLmpF2mXCaxk=
Received: from DB3PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:8:1::38) by
 AM6PR08MB4296.eurprd08.prod.outlook.com (2603:10a6:20b:b6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Sat, 16 Oct 2021 14:18:44 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::e2) by DB3PR06CA0025.outlook.office365.com
 (2603:10a6:8:1::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:44 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sat, 16 Oct
 2021 14:18:43 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:42 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>,
        "Stan Skowronek" <stan@corellium.com>
Subject: [PATCH v3 4/5] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Date:   Sat, 16 Oct 2021 15:18:38 +0100
Message-ID: <20211016141839.45460-5-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016141839.45460-1-joey.gouly@arm.com>
References: <20211016141839.45460-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d30aa06-ace9-4f9d-d58e-08d990afe20a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4296:|AM6PR08MB3509:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3509E99E5C50B4090111B72794BA9@AM6PR08MB3509.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:813;OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jxTReVlB9zKbaig3ZHQeYAPCW3Af3h+m3w053XY37EwKa2wfAatUDrAlsw3HRYhcU0f828umgVq6QZxyz3vX7xYPxau85lH3tsjKv1CT+T8kfwcNJd1r1OxwC/qYIFl8HeeieZglLQ+LrjVJEoHslpbMYnYubQ+Jd75mVkuQ6DeoS6NODk8WpMNvsLgPtETBjoMFo2gGKGhwLbd057oziT7F85E0YT3wgGgWV1iEircUPQWaSb8mh59gtDG0lctO8dSCN4JOciXemsGcKSZL9Qu0iVdP9C7dEfc/PHt+5P0SHpJDagPe4uqUJPvOrLSgewzMVDF2DXW0Nw1xvIWOgYmRpc3nMzDG27Wv+lxKANXPvdwZ7FNj6+vJs/RaspfeAORequYsGwgHtO8ww5zevnI/qAr3V9+reBYAIn1OzPA6tDRjJ+fnnc1mIyVh5MrlheSzElf4RitKFuLQZ0e1asShAI+G21br9id0GmTIQ/DPfrl3L7Ii19f6nWfsyCh6Wve9l7R8bfmCYozQszPtwtrVgMURzEIX603Y0VmDya2mXAumyFFreOmzeSaugrHj5SohJl9B5uPE0puaWahYRK0d115EITbtrrx1k9fNGQkGdUQ2zZXcNkT7lA138g6Bb27Qp+75iM/ac2UOJP5fRUw1LoEiU1b4wYmEtWB/9E8a0UEhlLcmlLTeHx2++X93FgyU876mkrdvNx1vQCL0tsk/TgC+/YMRlf+WEJpFfFsLLJNNsMJRDkBPFwSMh9CwIWBnl8uQ4UMA+G0W/uAQ7w==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(82310400003)(2906002)(47076005)(316002)(26005)(4326008)(426003)(36860700001)(508600001)(336012)(54906003)(5660300002)(6916009)(356005)(7696005)(1076003)(186003)(8676002)(30864003)(7416002)(81166007)(70206006)(70586007)(8936002)(44832011)(86362001)(83380400001)(6666004)(36756003)(2616005)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4296
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 07c80d75-5e3b-4cd3-77bd-08d990afdcd3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xf/E1J/ad6YVRmAv8vmGwRFEqSuzEUop5bvOOjC7PhgnXfZVQzmpkvTXHxFv40hvGZVsfQ0ld9lu99mD9EXf80bh2N6p6gxeqjm1/JQ2Cpz84eemmWIs2dW2j3FaypHrnVCeOvATvkrg9ams+yGvlRKaIphqsBqzWokuaH2HAI0y/IsrWyxmGUbmid0UZ+WQNU4k2ti7gRDZSfYb/p9XcfqgJnWaOx7KnPEuKKH5C8OK+83hJ3PmEDh3XLEqpK+nWVVn15gr42Q5YTmleo9ec/cRnnZFmiNnk9nrJfb/ud9kTECJCylX5vrGqYooeB6F8DzqikhLkAlg6IzGDVd4LzQn0ivW8bnPJ45gqmN2wv3TfQDIU9aQNL570OSk6797NkhyASbDn3jSpcAG7yzLxomD62I71Kl3UbvesWs/btJWgkuX2vlZYrpKBFjIlOM5IW1gDQJS/ADGL23cLQpVR2y8SoCtrQyjQYRfMw0ovQ6efaM6abUb4X0ouFcpTg+OUQ3EFWksmm6GX/FMBrG4AOhG6LCyVxvMcFtGZwANOVI2vVf/W5cHugKfOWfGwMUMlMsO6sHxE+HOKuIvVMQlSZfXvW1VKH59cILwhbP2qyQ6KAK6g0xL5Awp8KQhAPMc3GHDz+Ul8ELaxFu9pS83It/BXxkumv/EC56b2nX5a4E5cStXpW1UCwTnEYZgXKVtS7eAoa+7Nuux4HUzFhRxNEHDsZvHeTzciuGY6cn3s8s=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(426003)(36860700001)(86362001)(6916009)(5660300002)(2906002)(7696005)(2616005)(6666004)(82310400003)(1076003)(70586007)(186003)(44832011)(30864003)(47076005)(70206006)(107886003)(26005)(336012)(54906003)(4326008)(450100002)(36756003)(81166007)(316002)(8936002)(508600001)(8676002)(83380400001)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 14:18:53.5563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d30aa06-ace9-4f9d-d58e-08d990afe20a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3509
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver adds support for the pinctrl / GPIO hardware found
on some Apple SoCs.

Co-developed-by: Stan Skowronek <stan@corellium.com>
Signed-off-by: Stan Skowronek <stan@corellium.com>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 drivers/pinctrl/Kconfig              |  16 +
 drivers/pinctrl/Makefile             |   1 +
 drivers/pinctrl/pinctrl-apple-gpio.c | 564 +++++++++++++++++++++++++++
 3 files changed, 581 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-apple-gpio.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 31921108e456..6a961d5f8726 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -31,6 +31,22 @@ config DEBUG_PINCTRL
 	help
 	  Say Y here to add some extra checks and diagnostics to PINCTRL calls.
 
+config PINCTRL_APPLE_GPIO
+	tristate "Apple SoC GPIO pin controller driver"
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
+	  This driver can also be built as a module. If so, the module
+	  will be called pinctrl-apple-gpio.
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
index 000000000000..df93eb12069d
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -0,0 +1,564 @@
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
+#include <dt-bindings/pinctrl/apple.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "pinctrl-utils.h"
+#include "core.h"
+#include "pinmux.h"
+
+struct apple_gpio_irq_data {
+	struct apple_gpio_pinctrl *pctl;
+	int irqgrp;
+};
+
+struct apple_gpio_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctldev;
+
+	void __iomem *base;
+	struct regmap *map;
+	unsigned int nirqgrps;
+
+	struct pinctrl_desc pinctrl_desc;
+	struct gpio_chip gpio_chip;
+	struct irq_chip irq_chip;
+};
+
+#define REG_GPIO(x)          (4 * (x))
+#define REG_GPIOx_DATA       BIT(0)
+#define REG_GPIOx_MODE       GENMASK(3, 1)
+#define REG_GPIOx_OUT        1
+#define REG_GPIOx_IN_IRQ_HI  2
+#define REG_GPIOx_IN_IRQ_LO  3
+#define REG_GPIOx_IN_IRQ_UP  4
+#define REG_GPIOx_IN_IRQ_DN  5
+#define REG_GPIOx_IN_IRQ_ANY 6
+#define REG_GPIOx_IN_IRQ_OFF 7
+#define REG_GPIOx_PERIPH     GENMASK(6, 5)
+#define REG_GPIOx_PULL       GENMASK(8, 7)
+#define REG_GPIOx_PULL_OFF   0
+#define REG_GPIOx_PULL_DOWN  1
+#define REG_GPIOx_PULL_UP_STRONG 2
+#define REG_GPIOx_PULL_UP    3
+#define REG_GPIOx_INPUT_ENABLE BIT(9)
+#define REG_GPIOx_DRIVE_STRENGTH0 GENMASK(11, 10)
+#define REG_GPIOx_SCHMITT    BIT(15)
+#define REG_GPIOx_GRP        GENMASK(18, 16)
+#define REG_GPIOx_LOCK       BIT(21)
+#define REG_GPIOx_DRIVE_STRENGTH1 GENMASK(23, 22)
+#define REG_IRQ(g, x)        (0x800 + 0x40 * (g) + 4 * ((x) >> 5))
+
+struct regmap_config regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.max_register = 512 * sizeof(uint32_t),
+	.num_reg_defaults_raw = 512,
+	.use_relaxed_mmio = true
+};
+
+// No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register.
+static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl,
+			       unsigned int pin, uint32_t mask, uint32_t value)
+{
+	regmap_update_bits(pctl->map, REG_GPIO(pin), mask, value);
+}
+
+static uint32_t apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
+				   unsigned int pin)
+{
+	uint32_t val = 0;
+
+	regmap_read(pctl->map, REG_GPIO(pin), &val);
+	return val;
+}
+
+/* Pin controller functions */
+
+static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
+				     struct device_node *node,
+				     struct pinctrl_map **map,
+				     unsigned *num_maps)
+{
+	unsigned reserved_maps;
+	struct apple_gpio_pinctrl *pctl;
+	u32 pinfunc, pin, func;
+	int num_pins, i, ret;
+	const char *group_name;
+	const char *function_name;
+
+	*map = NULL;
+	*num_maps = 0;
+	reserved_maps = 0;
+
+	pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	ret = of_property_count_u32_elems(node, "pinmux");
+	if (ret <= 0) {
+		dev_err(pctl->dev,
+			"missing or empty pinmux property in node %pOFn.\n",
+			node);
+		return -EINVAL;
+	}
+
+	num_pins = ret;
+
+	ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps, num_maps,
+					num_pins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num_pins; i++) {
+		ret = of_property_read_u32_index(node, "pinmux", i, &pinfunc);
+		if (ret)
+			goto free_map;
+
+		pin = APPLE_PIN(pinfunc);
+		func = APPLE_FUNC(pinfunc);
+
+		if (func >= pinmux_generic_get_function_count(pctldev)) {
+			ret = -EINVAL;
+			goto free_map;
+		}
+
+		group_name = pinctrl_generic_get_group_name(pctldev, pin);
+		function_name =
+			pinmux_generic_get_function_name(pctl->pctldev, func);
+		ret = pinctrl_utils_add_map_mux(pctl->pctldev, map,
+						&reserved_maps, num_maps,
+						group_name, function_name);
+		if (ret)
+			goto free_map;
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
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = apple_gpio_dt_node_to_map,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+/* Pin multiplexer functions */
+
+static int apple_gpio_pinmux_enable(struct pinctrl_dev *pctldev, unsigned func,
+				    unsigned group)
+{
+	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	apple_gpio_set_reg(
+		pctl, group, REG_GPIOx_PERIPH | REG_GPIOx_INPUT_ENABLE,
+		FIELD_PREP(REG_GPIOx_PERIPH, func) | REG_GPIOx_INPUT_ENABLE);
+
+	return 0;
+}
+
+static const struct pinmux_ops apple_gpio_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = apple_gpio_pinmux_enable,
+	.strict = true,
+};
+
+/* GPIO chip functions */
+
+static int apple_gpio_gpio_get_direction(struct gpio_chip *chip,
+					 unsigned int offset)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+	unsigned int reg = apple_gpio_get_reg(pctl, offset);
+
+	return (FIELD_GET(REG_GPIOx_MODE, reg) == REG_GPIOx_OUT) ?
+		       GPIO_LINE_DIRECTION_OUT :
+			     GPIO_LINE_DIRECTION_IN;
+}
+
+static int apple_gpio_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+	unsigned int reg = apple_gpio_get_reg(pctl, offset);
+
+	// If this is an input GPIO, read the actual value (not the cached regmap value)
+	if (FIELD_GET(REG_GPIOx_MODE, reg) != REG_GPIOx_OUT)
+		reg = readl_relaxed(pctl->base + REG_GPIO(offset));
+
+	return !!(reg & REG_GPIOx_DATA);
+}
+
+static void apple_gpio_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				int value)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA,
+			   value ? REG_GPIOx_DATA : 0);
+}
+
+static int apple_gpio_gpio_direction_input(struct gpio_chip *chip,
+					   unsigned int offset)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	apple_gpio_set_reg(pctl, offset,
+			   REG_GPIOx_PERIPH | REG_GPIOx_MODE | REG_GPIOx_DATA |
+				   REG_GPIOx_INPUT_ENABLE,
+			   FIELD_PREP(REG_GPIOx_MODE, REG_GPIOx_IN_IRQ_OFF) |
+				   REG_GPIOx_INPUT_ENABLE);
+	return 0;
+}
+
+static int apple_gpio_gpio_direction_output(struct gpio_chip *chip,
+					    unsigned int offset, int value)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	apple_gpio_set_reg(pctl, offset,
+			   REG_GPIOx_PERIPH | REG_GPIOx_MODE | REG_GPIOx_DATA,
+			   FIELD_PREP(REG_GPIOx_MODE, REG_GPIOx_OUT) |
+				   (value ? REG_GPIOx_DATA : 0));
+	return 0;
+}
+
+/* IRQ chip functions */
+
+static void apple_gpio_gpio_irq_ack(struct irq_data *data)
+{
+	struct apple_gpio_pinctrl *pctl =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	unsigned int irqgrp =
+		FIELD_GET(REG_GPIOx_GRP, apple_gpio_get_reg(pctl, data->hwirq));
+
+	writel(BIT(data->hwirq & 31),
+	       pctl->base + REG_IRQ(irqgrp, data->hwirq));
+}
+
+static int apple_gpio_irq_type(unsigned int type)
+{
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		return REG_GPIOx_IN_IRQ_UP;
+	case IRQ_TYPE_EDGE_FALLING:
+		return REG_GPIOx_IN_IRQ_DN;
+	case IRQ_TYPE_EDGE_BOTH:
+		return REG_GPIOx_IN_IRQ_ANY;
+	case IRQ_TYPE_LEVEL_HIGH:
+		return REG_GPIOx_IN_IRQ_HI;
+	case IRQ_TYPE_LEVEL_LOW:
+		return REG_GPIOx_IN_IRQ_LO;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void apple_gpio_gpio_irq_mask(struct irq_data *data)
+{
+	struct apple_gpio_pinctrl *pctl =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
+			   FIELD_PREP(REG_GPIOx_MODE, REG_GPIOx_IN_IRQ_OFF));
+}
+
+static void apple_gpio_gpio_irq_unmask(struct irq_data *data)
+{
+	struct apple_gpio_pinctrl *pctl =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	int irqtype = apple_gpio_irq_type(irqd_get_trigger_type(data));
+
+	if (WARN_ON(irqtype < 0))
+		return;
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
+			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
+}
+
+static unsigned int apple_gpio_gpio_irq_startup(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_GRP,
+			   FIELD_PREP(REG_GPIOx_GRP, 0));
+
+	apple_gpio_gpio_direction_input(chip, data->hwirq);
+	apple_gpio_gpio_irq_unmask(data);
+
+	return 0;
+}
+
+static int apple_gpio_gpio_irq_set_type(struct irq_data *data,
+					unsigned int type)
+{
+	struct apple_gpio_pinctrl *pctl =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	int irqtype = apple_gpio_irq_type(type);
+
+	if (irqtype < 0)
+		return irqtype;
+
+	irqd_set_trigger_type(data, type);
+
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
+			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
+
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(data, handle_level_irq);
+	else
+		irq_set_handler_locked(data, handle_edge_irq);
+	return 0;
+}
+
+static void apple_gpio_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct apple_gpio_irq_data *data = irq_desc_get_handler_data(desc);
+	struct apple_gpio_pinctrl *pctl = data->pctl;
+	struct gpio_chip *gc = &pctl->gpio_chip;
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int irqgrp = data->irqgrp;
+	unsigned int pinh, pinl;
+	unsigned long pending;
+
+	chained_irq_enter(chip, desc);
+	for (pinh = 0; pinh < gc->ngpio; pinh += 32) {
+		pending = readl(pctl->base + REG_IRQ(irqgrp, pinh));
+		for_each_set_bit(pinl, &pending, 32)
+			generic_handle_domain_irq(gc->irq.domain, pinh + pinl);
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
+	struct apple_gpio_irq_data **irq_data;
+	int i;
+	int ret;
+
+	if (!of_find_property(node, "gpio-controller", NULL)) {
+		dev_err(pctl->dev,
+			"Apple GPIO must have 'gpio-controller' property.\n");
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
+	pctl->gpio_chip.ngpio = pctl->pinctrl_desc.npins;
+	pctl->gpio_chip.parent = pctl->dev;
+	pctl->gpio_chip.of_node = node;
+
+	if (of_property_read_bool(node, "interrupt-controller")) {
+		ret = platform_irq_count(to_platform_device(pctl->dev));
+		if (ret < 0)
+			return ret;
+
+		pctl->nirqgrps = ret;
+
+		pctl->irq_chip.name = "Apple-GPIO";
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
+		girq->parents = kmalloc_array(
+			pctl->nirqgrps, sizeof(*girq->parents), GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+
+		for (i = 0; i < pctl->nirqgrps; i++) {
+			ret = platform_get_irq(to_platform_device(pctl->dev),
+					       i);
+			if (ret < 0) {
+				return dev_err_probe(pctl->dev, ret,
+						     "Failed to map IRQ %d\n",
+						     i);
+			}
+			girq->parents[i] = ret;
+		}
+
+		irq_data = kmalloc_array(pctl->nirqgrps, sizeof(*irq_data),
+					 GFP_KERNEL);
+		if (!irq_data) {
+			kfree(girq->parents);
+			return -ENOMEM;
+		}
+		for (i = 0; i < pctl->nirqgrps; i++) {
+			irq_data[i] = devm_kzalloc(
+				pctl->dev, sizeof(*irq_data[i]), GFP_KERNEL);
+			irq_data[i]->pctl = pctl;
+			irq_data[i]->irqgrp = i;
+		}
+
+		girq->parent_handler_data_array = (void **)irq_data;
+		girq->per_parent_data = true;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_level_irq;
+	}
+
+	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
+
+	if (of_property_read_bool(node, "interrupt-controller")) {
+		kfree(girq->parents);
+		kfree(irq_data);
+	}
+
+	return ret;
+}
+
+static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
+{
+	struct apple_gpio_pinctrl *pctl;
+	struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+	const char **pin_names;
+	unsigned int *pin_nums;
+	unsigned int i;
+	int res;
+
+	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
+	if (!pctl)
+		return -ENOMEM;
+	pctl->dev = &pdev->dev;
+	dev_set_drvdata(&pdev->dev, pctl);
+
+	if (of_property_read_u32(pdev->dev.of_node, "apple,npins", &npins)) {
+		dev_err(&pdev->dev, "apple,npins property not found\n");
+		return -EINVAL;
+	}
+
+	pins = devm_kmalloc_array(&pdev->dev, npins, sizeof(pins[0]),
+				  GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+	pin_names = devm_kmalloc_array(&pdev->dev, npins, sizeof(pin_names[0]),
+				       GFP_KERNEL);
+	if (!pin_names)
+		return -ENOMEM;
+	pin_nums = devm_kmalloc_array(&pdev->dev, npins, sizeof(pin_nums[0]),
+				      GFP_KERNEL);
+	if (!pin_nums)
+		return -ENOMEM;
+
+	pctl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pctl->base))
+		return PTR_ERR(pctl->base);
+
+	pctl->map =
+		devm_regmap_init_mmio(&pdev->dev, pctl->base, &regmap_config);
+	if (IS_ERR(pctl->map)) {
+		dev_err(&pdev->dev, "Failed to create regmap\n");
+		return PTR_ERR(pctl->map);
+	}
+
+	for (i = 0; i < npins; i++) {
+		pins[i].number = i;
+		pins[i].name =
+			devm_kasprintf(&pdev->dev, GFP_KERNEL, "PIN%u", i);
+		pins[i].drv_data = pctl;
+		pin_names[i] = pins[i].name;
+		pin_nums[i] = i;
+	}
+
+	pctl->pinctrl_desc.name = dev_name(pctl->dev);
+	pctl->pinctrl_desc.pins = pins;
+	pctl->pinctrl_desc.npins = npins;
+	pctl->pinctrl_desc.pctlops = &apple_gpio_pinctrl_ops;
+	pctl->pinctrl_desc.pmxops = &apple_gpio_pinmux_ops;
+
+	pctl->pctldev =
+		devm_pinctrl_register(&pdev->dev, &pctl->pinctrl_desc, pctl);
+	if (IS_ERR(pctl->pctldev)) {
+		dev_err(&pdev->dev, "Failed to register pinctrl device.\n");
+		return PTR_ERR(pctl->pctldev);
+	}
+
+	for (i = 0; i < npins; i++) {
+		res = pinctrl_generic_add_group(pctl->pctldev, pins[i].name,
+						pin_nums + i, 1, pctl);
+		if (res < 0) {
+			dev_err(pctl->dev, "Failed to register group.");
+			return res;
+		}
+	}
+
+	res = pinmux_generic_add_function(pctl->pctldev, "gpio", pin_names,
+					  npins, pctl);
+	if (res < 0) {
+		dev_err(pctl->dev, "Failed to register function.");
+		return res;
+	}
+
+	res = pinmux_generic_add_function(pctl->pctldev, "periph", pin_names,
+					  npins, pctl);
+	if (res < 0) {
+		dev_err(pctl->dev, "Failed to register function.");
+		return res;
+	}
+
+	return apple_gpio_gpio_register(pctl);
+}
+
+static const struct of_device_id apple_gpio_pinctrl_of_match[] = {
+	{ .compatible = "apple,t8103-pinctrl", },
+	{ .compatible = "apple,pinctrl", },
+	{ }
+};
+
+static struct platform_driver apple_gpio_pinctrl_driver = {
+	.driver = {
+		.name = "apple-gpio-pinctrl",
+		.of_match_table = apple_gpio_pinctrl_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = apple_gpio_pinctrl_probe,
+};
+module_platform_driver(apple_gpio_pinctrl_driver);
+
+MODULE_DESCRIPTION("Apple pinctrl/GPIO driver");
+MODULE_AUTHOR("Stan Skowronek <stan@corellium.com>");
+MODULE_AUTHOR("Joey Gouly <joey.gouly@arm.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

