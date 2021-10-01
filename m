Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9AD41F592
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 21:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354617AbhJATOf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 15:14:35 -0400
Received: from mail-eopbgr130054.outbound.protection.outlook.com ([40.107.13.54]:11591
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1353931AbhJATOe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Oct 2021 15:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4EseGjI7xtn/yK0baf59GHLfepg7UeA+A66KZ6UUQc=;
 b=PD1J8gtBf0f2ur5ERMsOAiTRcGmN929ViDk9VHXI5Bz0pNOLdniMYaZpu/v9k7TY6l97d25elgv5sI7Ui9FOOuKsa9Tk5Ogae1XH6AxpLEm2+1so6Erv0u2NFXI0DkstthLmajsMUkBFeqWLP1EDHr+diizykJZKBAMhWW8jnwQ=
Received: from DU2PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:10:234::6)
 by AS8PR08MB6455.eurprd08.prod.outlook.com (2603:10a6:20b:338::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 19:12:46 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::4b) by DU2PR04CA0031.outlook.office365.com
 (2603:10a6:10:234::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 19:12:46 +0000
Received: ("Tessian outbound 78bf72cc015a:v103"); Fri, 01 Oct 2021 19:12:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 936af47bb9866f01
X-CR-MTA-TID: 64aa7808
Received: from f856d1c6bb9d.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id B83EE0AC-0C78-4AE4-A840-376EE5AD4607.1;
        Fri, 01 Oct 2021 19:12:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f856d1c6bb9d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 Oct 2021 19:12:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OisE+4s3Yo7DQfob5OsiGvzuz9A8HuKD6jUbbrv+pLmN64HhWYhhwdSBX2R/fbmOPmgBbs9sO3co0ivVaTxhCEyCtgH1saS+NBeP8FUS9JCiHCSoQJ57W/ajsLv2lwHFLIJrwRYToLIXQrOzG8uwuTrlJdi9xAN6uuDH3jIQRK9Sc8IyDgAb2WDWZbgclwTK8XYhw6pRhgFXzqggX8y7mw2k21peDlvfb9jDVsQ6Mh0SNkeeXBN84y0rC5p5uznJ/QQHNLoXpSCH3Yyo9RMtwNBg1qrBdu+iCD2ohYNOgGrqnd05uL2mGI10x3H9Vob6fsJxmzuHWIgumacgK1DwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4EseGjI7xtn/yK0baf59GHLfepg7UeA+A66KZ6UUQc=;
 b=Aj0acZMKuw89wHx3WAeVwnvQmcQMfJ4FT2pKCdHvJw5Qk/OjCI2gCu1mx5N+OYcY8Waeb/J7kvlSAvr+OmJAjRK+cbeLXFZj1d38LfKgvRHtWaXFiua+GJ0cUHyYEFj0+qJJRbubv40cGni8wR0XITne9S6RlnlY+QNqqsES2LMv7ZMfDsO6rEipnxoAidXzHKxtDNKIcquXZAlNMshB4gEHxWJACmBZpXIOe7j1BeH7attoq6JgcJjZ/Ddbe4XAqvh6emUfofUdb8XtCzBgjnaU+k/8b1p/3B67REVOItTCUAEaLuP3874fMFQs/rrq0pl5D4lypT6NUTTbePfyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4EseGjI7xtn/yK0baf59GHLfepg7UeA+A66KZ6UUQc=;
 b=PD1J8gtBf0f2ur5ERMsOAiTRcGmN929ViDk9VHXI5Bz0pNOLdniMYaZpu/v9k7TY6l97d25elgv5sI7Ui9FOOuKsa9Tk5Ogae1XH6AxpLEm2+1so6Erv0u2NFXI0DkstthLmajsMUkBFeqWLP1EDHr+diizykJZKBAMhWW8jnwQ=
Received: from AM6PR10CA0073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::14)
 by AM6PR08MB3061.eurprd08.prod.outlook.com (2603:10a6:209:4b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 1 Oct
 2021 19:12:29 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::bc) by AM6PR10CA0073.outlook.office365.com
 (2603:10a6:209:8c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 19:12:29 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Oct
 2021 19:12:32 +0000
Received: from e124191.cambridge.arm.com (10.11.7.12) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:31 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 3/3] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Date:   Fri, 1 Oct 2021 20:12:09 +0100
Message-ID: <20211001191209.29988-4-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001191209.29988-1-joey.gouly@arm.com>
References: <20211001191209.29988-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbe2ab7e-1eaf-48e7-8382-08d9850f73fa
X-MS-TrafficTypeDiagnostic: AM6PR08MB3061:|AS8PR08MB6455:
X-Microsoft-Antispam-PRVS: <AS8PR08MB645594DE6378F3A24505DAEF94AB9@AS8PR08MB6455.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: EoeMyP2Dj1uH0zkCroqV8ePkokaecc2xmF7pl71E/Sy2MPnUm9xFVZanierJwJwfTbonPakjHuEWftj7ixlUnACoiMOJIzRpByqVty1Gvls/Hk/XOxo0naHQiyz6aaQCXSjR1dT0W5Cm2BG1cWr/DjApeK365Nl4AgMqox9ta73l+cbflorgxkr7opJgZxhVWGtVHrs3i8peYsv7PF0HbrWFI/XbKEYaqQKzjZSBSTMukr5Xi9tfWhzuk2yZIu9IzuXPQdjabfLkfd7GZ4tnBPMR8yCtTk3smjUAjp4/PXjcAvJHJAZlQP+fpc80SkfJlxqaTFXnz91I71Q6WTBq00QbUgZ0BL7WotSw6i1WxCbIb2vpq9tqgP4C6wPBxOoiRMbZUptsELiET+CV+J5tiYGnX+xiS6jI7G7Lko+QY//6q39ubnn91mM3vi9n2+SXmWaGXXQD7urxxzDlUi3B9ksKuNqRaxlUSIuJ+TCYun9HZputVW5DdKO+uxoCADr9BwjI5yp786SP5ZMKng+74TNlnI0jhsRGlgB+d6lBg9iv4qJqGvWGGxalGnFlgVpgYFW/Ng4croggABJq04oTGyjssEzrvxzK0EFSN8LfvAjszudxLg7dzKqoJAbq3YdPqVx/17dIitki4752EBbXue5R8+sKQdtTOB14tiYQpak3iw6q1zsmrAxEyZzaoPOpiXOTSjP695HUanzURnIVnioi9ZRgdHPKfuvL616p2/c=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(1076003)(36756003)(81166007)(36860700001)(356005)(4326008)(5660300002)(336012)(30864003)(86362001)(8676002)(82310400003)(6666004)(26005)(8936002)(70586007)(70206006)(83380400001)(47076005)(7696005)(54906003)(186003)(7416002)(44832011)(2906002)(316002)(508600001)(6916009)(2616005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3061
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 961aa553-b599-444e-0eb4-08d9850f69c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UUpGQKRr8NJnsY5xgil4bSJymauGBfgYIrlaDbnVjf+UcTnfu0/IEHBBsWTePrPjwQcCWq5Kl30pASVnJMb6GG0X9Xfd9du98GIt147UUKHRdEyWPIC6H8wfVxkdQJV4vwSc96dFjnTXI7mP7iA8RLpPxHknl9O15dppx/3mEmM+OzfirDxmFRfVzICJqcuLdIDnuLA4LpKEfWHK7uXdPqFjzhG6Zr1IVHtnlvJhIXguqGCMzqE/H7vFsnQZ39+EaS1zL1yYdqh0EVXiaN1qKcEJk7cP0XSfZd1qVRjuQyymlQpKLcQX5FUYDEM2DorYUf7Xim1SP+6pnVmrWraS2XRWh/xYMauq2EcUcbnXLgLJgZsBNmgIhT3J3+SEUzd9vYCf6xQ4dEq627+2NuM8ij9rPick3ba4mpDOCP6SvYtv51qGm/nr7NHEkewG1eg9lnrSqtX+zFcrIMQVYp4L84EsYMqmZFeCHc9hXeimBg3Ax1khGcnmo1WUXDok8Scc7VeNMVuZgx8bhpoa+JS1IfOMw+gupIwTvW7k/QxAg2yq6IbP8NqjGv/cIqZvRrEm+1YtjC0auU1k+mt9FCYp7aHv2fl8jF0AiduveYkUUTglJhRxWSyFOsqRozVjXQRrkgMAQJz9w+izDBFy65BcdOgzk5Y4zT8u22haUvT4v6Z8FNQ51XBVXQcirW+yoy+b5klhQJu7sOMUvTB8sbnC541I8+GkrbxxNAEuG35qEgw=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(1076003)(5660300002)(2616005)(508600001)(186003)(8676002)(30864003)(426003)(54906003)(83380400001)(336012)(6666004)(36860700001)(7696005)(86362001)(6916009)(70586007)(70206006)(8936002)(316002)(26005)(47076005)(450100002)(4326008)(2906002)(44832011)(81166007)(82310400003)(36756003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 19:12:46.6327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe2ab7e-1eaf-48e7-8382-08d9850f73fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6455
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Stan Skowronek <stan@corellium.com>

This driver adds support for the pinctrl / GPIO hardware found
on some Apple SoCs.

Co-developed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Stan Skowronek <stan@corellium.com>
---
 MAINTAINERS                          |   1 +
 drivers/pinctrl/Kconfig              |  16 +
 drivers/pinctrl/Makefile             |   1 +
 drivers/pinctrl/pinctrl-apple-gpio.c | 561 +++++++++++++++++++++++++++
 4 files changed, 579 insertions(+)
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
index 000000000000..cfec37e3627a
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -0,0 +1,561 @@
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
+struct apple_gpio_irq_data {
+	struct apple_gpio_pinctrl *pctl;
+	int irqgrp;
+};
+
+struct apple_gpio_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctldev;
+
+	// Shadow the pin values, the REG_GPIOx_DATA bit can read back stale values.
+	u32 *pin_shadow;
+
+	void __iomem *base;
+	unsigned int nirqgrps;
+
+	struct pinctrl_desc pinctrl_desc;
+	struct gpio_chip gpio_chip;
+	struct irq_chip irq_chip;
+};
+
+#define REG_GPIO(x)          (4 * (x))
+#define REG_GPIOx_DATA       BIT(0)
+#define REG_GPIOx_MODE_MASK  GENMASK(3, 1)
+#define REG_GPIOx_OUT        1
+#define REG_GPIOx_IN_IRQ_HI  2
+#define REG_GPIOx_IN_IRQ_LO  3
+#define REG_GPIOx_IN_IRQ_UP  4
+#define REG_GPIOx_IN_IRQ_DN  5
+#define REG_GPIOx_IN_IRQ_ANY 6
+#define REG_GPIOx_IN_IRQ_OFF 7
+#define REG_GPIOx_PERIPH     BIT(5)
+#define REG_GPIOx_CFG_DONE   BIT(9)
+#define REG_GPIOx_GRP_MASK   GENMASK(18, 16)
+#define REG_IRQ(g, x)        (0x800 + 0x40 * (g) + 4 * ((x) >> 5))
+
+// No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register.
+static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl,
+			       unsigned int pin, uint32_t clr, uint32_t set)
+{
+	void __iomem *ppin = pctl->base + REG_GPIO(pin);
+	uint32_t prev, cfg;
+
+	prev = pctl->pin_shadow[pin];
+	cfg = (prev & ~clr) | set;
+
+	if (!(prev & REG_GPIOx_CFG_DONE))
+		writel_relaxed(cfg & ~REG_GPIOx_CFG_DONE, ppin);
+	writel_relaxed(cfg, ppin);
+	pctl->pin_shadow[pin] = cfg;
+}
+
+static uint32_t apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
+				   unsigned int pin)
+{
+	return readl_relaxed(pctl->base + REG_GPIO(pin));
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
+	if (func)
+		apple_gpio_set_reg(pctl, group, 0,
+				   REG_GPIOx_PERIPH | REG_GPIOx_CFG_DONE);
+	else
+		apple_gpio_set_reg(pctl, group, REG_GPIOx_PERIPH,
+				   REG_GPIOx_CFG_DONE);
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
+
+	return (FIELD_GET(REG_GPIOx_MODE_MASK, pctl->pin_shadow[offset]) ==
+		REG_GPIOx_OUT) ?
+		       GPIO_LINE_DIRECTION_OUT :
+			     GPIO_LINE_DIRECTION_IN;
+}
+
+static int apple_gpio_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+	uint32_t reg;
+
+	if (FIELD_GET(REG_GPIOx_MODE_MASK, pctl->pin_shadow[offset]) ==
+	    REG_GPIOx_OUT) {
+		return pctl->pin_shadow[offset] & REG_GPIOx_DATA;
+	}
+
+	reg = apple_gpio_get_reg(pctl, offset);
+	return !!(reg & REG_GPIOx_DATA);
+}
+
+static void apple_gpio_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				int value)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA,
+			   REG_GPIOx_CFG_DONE | (value & REG_GPIOx_DATA));
+}
+
+static int apple_gpio_gpio_direction_input(struct gpio_chip *chip,
+					   unsigned int offset)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	apple_gpio_set_reg(pctl, offset, REG_GPIOx_MODE_MASK | REG_GPIOx_DATA,
+			   FIELD_PREP(REG_GPIOx_MODE_MASK,
+				      REG_GPIOx_IN_IRQ_OFF) |
+				   REG_GPIOx_CFG_DONE);
+	return 0;
+}
+
+static int apple_gpio_gpio_direction_output(struct gpio_chip *chip,
+					    unsigned int offset, int value)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	apple_gpio_set_reg(pctl, offset, REG_GPIOx_PERIPH | REG_GPIOx_DATA,
+			   FIELD_PREP(REG_GPIOx_MODE_MASK, REG_GPIOx_OUT) |
+				   (value & REG_GPIOx_DATA) |
+				   REG_GPIOx_CFG_DONE);
+	return 0;
+}
+
+/* IRQ chip functions */
+
+static void apple_gpio_gpio_irq_ack(struct irq_data *data)
+{
+	struct apple_gpio_pinctrl *pctl =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	unsigned int irqgrp = FIELD_GET(REG_GPIOx_GRP_MASK,
+					apple_gpio_get_reg(pctl, data->hwirq));
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
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE_MASK,
+			   FIELD_PREP(REG_GPIOx_MODE_MASK,
+				      REG_GPIOx_IN_IRQ_OFF) |
+				   REG_GPIOx_CFG_DONE);
+}
+
+static void apple_gpio_gpio_irq_unmask(struct irq_data *data)
+{
+	struct apple_gpio_pinctrl *pctl =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	u32 irqtype = apple_gpio_irq_type(irqd_get_trigger_type(data));
+
+	if (WARN_ON(irqtype < 0))
+		return;
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE_MASK,
+			   FIELD_PREP(REG_GPIOx_MODE_MASK, irqtype) |
+				   REG_GPIOx_CFG_DONE);
+}
+
+static unsigned int apple_gpio_gpio_irq_startup(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_GRP_MASK,
+			   FIELD_PREP(REG_GPIOx_GRP_MASK, 0));
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
+	u32 irqtype = apple_gpio_irq_type(type);
+
+	if (irqtype < 0)
+		return irqtype;
+
+	irqd_set_trigger_type(data, type);
+
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE_MASK,
+			   FIELD_PREP(REG_GPIOx_MODE_MASK, irqtype) |
+				   REG_GPIOx_CFG_DONE);
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
+	unsigned int i, reg;
+	int res;
+
+	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
+	if (!pctl)
+		return -ENOMEM;
+	pctl->dev = &pdev->dev;
+	dev_set_drvdata(&pdev->dev, pctl);
+
+	if (of_property_read_u32(pdev->dev.of_node, "apple,npins", &npins)) {
+		dev_err(&pdev->dev, "gpio-ranges property not found\n");
+		npins = 512;
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
+	pctl->pin_shadow = devm_kmalloc_array(
+		&pdev->dev, npins, sizeof(pctl->pin_shadow[0]), GFP_KERNEL);
+	if (!pctl->pin_shadow)
+		return -ENOMEM;
+
+	pctl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pctl->base))
+		return PTR_ERR(pctl->base);
+
+	for (i = 0; i < npins; i++) {
+		reg = apple_gpio_get_reg(pctl, i);
+		pctl->pin_shadow[i] = reg;
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

