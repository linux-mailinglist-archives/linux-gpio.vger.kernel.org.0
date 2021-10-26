Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE5443B8CB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 19:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236577AbhJZSBL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 14:01:11 -0400
Received: from mail-eopbgr30051.outbound.protection.outlook.com ([40.107.3.51]:57123
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233064AbhJZSBK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 14:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOzQ4b5WPh+qniVJemI/ro+eaSTV/SYSOsDtdcBhsxo=;
 b=gRaNhT3riZiWh1/nOicDEzWJKKsO4usoBzY2l+ir8koH8mDloiMMrj9SP6qzPkmUm+co6sSxtgFAPjlZ0TKxPyzoYBpC+C7ChQ1xK1Uf6AafFEg2u3OMRLFRGlkSXCUszyj43+k1Wn0Y0lJ+nSQQ+ZN58GiOWcgDZjIzjARdxzc=
Received: from AM5PR0701CA0061.eurprd07.prod.outlook.com (2603:10a6:203:2::23)
 by PA4PR08MB6269.eurprd08.prod.outlook.com (2603:10a6:102:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:58:34 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::f8) by AM5PR0701CA0061.outlook.office365.com
 (2603:10a6:203:2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.10 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:58:34 +0000
Received: ("Tessian outbound d5def7722ff7:v103"); Tue, 26 Oct 2021 17:58:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9557db2449080df4
X-CR-MTA-TID: 64aa7808
Received: from 573a5405c8d1.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id CDF7DDAE-B924-4E20-A9E0-7C47A8B9F389.1;
        Tue, 26 Oct 2021 17:58:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 573a5405c8d1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Oct 2021 17:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFbfwEqWFM36dEpFLDoG9mlwoVUM06D3r89RBY/az5nI5bJfyoVrjrN9PhuQwCam78fRO8N0zJ9Ef21CmNdbbLGlog35GqjcowjpHELWSsm2vF9Yykoumu+5/AhY+GV/xCqWgAtY06nmE4Pl/dC3x/awxzoC4AL23gWEzpkH9pmEqriJUdxRydqyKLTCpkPk7atNeXEovK6U70QfJTGZiPOa7aQc6UeH1uksVf5bM1sfJa2DJgfhrC6+oGhhUzx1XetNH7/2t04z74frKPoAd/lCmHlo3KEIJEsOGqpudT//iLgB/mnkJGk5mQESq8EozJn+JSaJeT3aE+RgLbiCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOzQ4b5WPh+qniVJemI/ro+eaSTV/SYSOsDtdcBhsxo=;
 b=M22RmCi0HiFV5vE/E4+6HzocJdbPKZCLhF3TrLEMPfMJScdMjAFngxghwxs9PfWy93hTIOIDLCDI2pS6W6VXhBzeZN0JL9WxeHxPiLrpJbD/hvMqAai6zBUB3LjQzwbw3OKgA478yDb450rmEufam+M3sI/eFq/vdWeYJ+EMWUz4HnQyX0ZXqHsFo3tRIc+Seu49pWyw6OqZPvG8Cq+HMd/ZL4AWBxxkn+7knsRgYpKW4iWharEoFh3g65WwIbgRvHOwhF08BKoy3wmtA1VoMaukHThdk7AVtb9Ss/KoIlZkEg+jjhsfZWe9qwZlIxzGlGVA0VyAgaHPdQ6jI5C3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOzQ4b5WPh+qniVJemI/ro+eaSTV/SYSOsDtdcBhsxo=;
 b=gRaNhT3riZiWh1/nOicDEzWJKKsO4usoBzY2l+ir8koH8mDloiMMrj9SP6qzPkmUm+co6sSxtgFAPjlZ0TKxPyzoYBpC+C7ChQ1xK1Uf6AafFEg2u3OMRLFRGlkSXCUszyj43+k1Wn0Y0lJ+nSQQ+ZN58GiOWcgDZjIzjARdxzc=
Received: from AS8P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::33)
 by AM8PR08MB6516.eurprd08.prod.outlook.com (2603:10a6:20b:363::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:58:25 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::fb) by AS8P251CA0012.outlook.office365.com
 (2603:10a6:20b:2f2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:58:25 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 26 Oct
 2021 17:58:22 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:22 +0000
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
Subject: [PATCH v5 4/5] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Date:   Tue, 26 Oct 2021 18:58:14 +0100
Message-ID: <20211026175815.52703-5-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211026175815.52703-1-joey.gouly@arm.com>
References: <20211026175815.52703-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1550ad5-c2c7-4b50-e8a7-08d998aa3a92
X-MS-TrafficTypeDiagnostic: AM8PR08MB6516:|PA4PR08MB6269:
X-Microsoft-Antispam-PRVS: <PA4PR08MB6269AB9F7757881FE9FBDB1094849@PA4PR08MB6269.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:813;OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mdE9CJqaiR48pWDaqB2s4SB+oRRhKC+HhAS+Epc63gnowuxnrCgCmFR86+z6Te9h+PJ4KiBIwIHGQYjfABSvMpk7waWNi8WwgAjRurcn9vA1k4jOeHOjeFA5VbugXZvhKipsYHv92V4Jj+IPOQ6rYS1Ea3asAWzQXsqeUQiYOA65q44qNwwf/kghexBuGVsvZ02hqFSrRUhJnP8RI8n8v35i8hqTCDTlskVcVeiYWyb9uCR7BFZw/EZTG4Xl2dED10d10cQnAbXmDrgVQn5UOztl0+yYcgDIebUj2fDHeKZ39eYwxg+4UTggYZ+jNvIMwCFJz5VPqY4KfmSCOVGEqQwktstDf6ncempO5Ib9QQPHoi6KQwdq/pcT1UkbZPgeXj9+nIYMRxLGCEqZsU5NDQ5BExTJYdLJZERStURm0gpWWtsbgIfa4kfhO/PnnBUURHNdZn5v4n5pCXiE9AmOVFOfq1vJjwmxlxUogGyAgstOiZaRDYXnKDfDq33zE4yyltxwqruzbVbOrPIr4y30XfcSZfmUYhfjgVknKWShPf4qEQPQz7iKRd/GaH7fWzXSoZRaN4AvBtjaTkVfePAKN8DlOnGZA5mO1UCubqLgYH0V01Z9lftta2VT8sTV4t3hMs42lV84eQJGJtf3MB31NFmZ5OklS/cS5Gdn7NjbFAkB2roiUj28gyZfk6S0JmDn9hsBqj0yGyFUdrSjDAKM7PHErGs0XAYgA+9pG3HNa8HqGl0KD8o5MDByu9iU/7iFsjP7gaUu+i2N28bErz+R6Q==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(36860700001)(82310400003)(54906003)(47076005)(1076003)(8936002)(70586007)(2906002)(7416002)(5660300002)(70206006)(26005)(186003)(336012)(4326008)(316002)(36756003)(7696005)(30864003)(508600001)(44832011)(426003)(83380400001)(6916009)(6666004)(8676002)(2616005)(81166007)(356005)(86362001)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6516
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1c9b1227-c57b-4c0c-b1fe-08d998aa351a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L3AlWkWL4KXxF4SfIs/M2fqvItLghoyyhdFGMG3QAntAPsNgtrD1Gok3OaB9aSErWokkuqaxFu6m0/+DDr3zeEzWrCS/I4QZcJuWld14Il1MH8kp/7avFs3qPnsNAnStPGnxQ/tCM+Vz0f/FCBMjb5w4nPlBjprhtt2JNec8PQsYlUGXsGwUL4ss6aPdH2q7jzONiI3Tfl0MzB9Gld7Uo65r7+/smU8yx14gBCbkf5kZhv571q0zddZDfwnto+762FJ/UWvYmkRF5WZZS/tPpDUvWlX9emG34aeR+LIMlXko8xUs9WkOnGb+qHkeQOAC4j6y0O7nCD+e5H5aoobdfa1NeaCuCINeYOc/B05kzWAw6EvaKx7K8TnWgF25iMtFnHc5cFBjclMn0Jmei+iZdHywfeMwKFzfRaJwm2ISUnZsXnaArBVRDqGDqU4S6Jwz2gv0ULOvrkMhlMf+xRYqVhWywOo3fqNpMpd3AF+FEPX+1EaRqR6/ultgZiXa0+nxqzer40QKldpO+mesD83EacicOz5ka5TBJfljS8gjFkzD8+Tr3H7SLQkdFg5ogCNevWVeP1Q90xpFTAiTQVnrZpAFEROh4AgNw2yTtixkNwt1xsAQFtUTUMDNrtUY8P4F14LVfa2NYxZwJNHwVCUSS9pl6n4s5US+KAPGlPHINjgr1rz5svquSU8GLLf9FjL6g+I2al38Mpn6RQonx5iluEIjCZfh6PB1OLBw4gXTkIA=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(47076005)(30864003)(2616005)(82310400003)(8676002)(426003)(83380400001)(81166007)(7696005)(1076003)(186003)(336012)(70586007)(70206006)(86362001)(8936002)(4326008)(6666004)(36756003)(44832011)(36860700001)(54906003)(26005)(508600001)(5660300002)(450100002)(2906002)(6916009)(316002)(107886003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 17:58:34.2752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1550ad5-c2c7-4b50-e8a7-08d998aa3a92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6269
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver adds support for the pinctrl / GPIO hardware found
on some Apple SoCs.

Co-developed-by: Stan Skowronek <stan@corellium.com>
Signed-off-by: Stan Skowronek <stan@corellium.com>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Acked-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pinctrl/Kconfig              |  16 +
 drivers/pinctrl/Makefile             |   1 +
 drivers/pinctrl/pinctrl-apple-gpio.c | 534 +++++++++++++++++++++++++++
 3 files changed, 551 insertions(+)
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
index 000000000000..0cc346bfc4c3
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -0,0 +1,534 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Apple SoC pinctrl+GPIO+external IRQ driver
+ *
+ * Copyright (C) The Asahi Linux Contributors
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
+struct apple_gpio_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctldev;
+
+	void __iomem *base;
+	struct regmap *map;
+
+	struct pinctrl_desc pinctrl_desc;
+	struct gpio_chip gpio_chip;
+	struct irq_chip irq_chip;
+	u8 irqgrps[0];
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
+	.max_register = 512 * sizeof(u32),
+	.num_reg_defaults_raw = 512,
+	.use_relaxed_mmio = true
+};
+
+// No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register.
+static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl,
+			       unsigned int pin, u32 mask, u32 value)
+{
+	regmap_update_bits(pctl->map, REG_GPIO(pin), mask, value);
+}
+
+static uint32_t apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
+				   unsigned int pin)
+{
+	unsigned int val = 0;
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
+		return ret;
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
+	if (ret < 0)
+		pinctrl_utils_free_map(pctldev, *map, *num_maps);
+
+	return ret;
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
+static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned func,
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
+	.set_mux = apple_gpio_pinmux_set,
+	.strict = true,
+};
+
+/* GPIO chip functions */
+
+static int apple_gpio_get_direction(struct gpio_chip *chip,
+					 unsigned int offset)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+	unsigned int reg = apple_gpio_get_reg(pctl, offset);
+
+	return (FIELD_GET(REG_GPIOx_MODE, reg) == REG_GPIOx_OUT) ?
+		       GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int apple_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+	unsigned int reg = apple_gpio_get_reg(pctl, offset);
+
+	/*
+	 * If this is an input GPIO, read the actual value (not the
+	 * cached regmap value)
+	 */
+	if (FIELD_GET(REG_GPIOx_MODE, reg) != REG_GPIOx_OUT)
+		reg = readl_relaxed(pctl->base + REG_GPIO(offset));
+
+	return !!(reg & REG_GPIOx_DATA);
+}
+
+static void apple_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				int value)
+{
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA,
+			   value ? REG_GPIOx_DATA : 0);
+}
+
+static int apple_gpio_direction_input(struct gpio_chip *chip,
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
+static int apple_gpio_direction_output(struct gpio_chip *chip,
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
+static void apple_gpio_irq_ack(struct irq_data *data)
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
+static void apple_gpio_irq_mask(struct irq_data *data)
+{
+	struct apple_gpio_pinctrl *pctl =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
+			   FIELD_PREP(REG_GPIOx_MODE, REG_GPIOx_IN_IRQ_OFF));
+}
+
+static void apple_gpio_irq_unmask(struct irq_data *data)
+{
+	struct apple_gpio_pinctrl *pctl =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	int irqtype = apple_gpio_irq_type(irqd_get_trigger_type(data));
+
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
+			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
+}
+
+static unsigned int apple_gpio_irq_startup(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
+
+	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_GRP,
+			   FIELD_PREP(REG_GPIOx_GRP, 0));
+
+	apple_gpio_direction_input(chip, data->hwirq);
+	apple_gpio_irq_unmask(data);
+
+	return 0;
+}
+
+static int apple_gpio_irq_set_type(struct irq_data *data,
+					unsigned int type)
+{
+	struct apple_gpio_pinctrl *pctl =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	int irqtype = apple_gpio_irq_type(type);
+
+	if (irqtype < 0)
+		return irqtype;
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
+static void apple_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	u8 *grpp = irq_desc_get_handler_data(desc);
+	struct apple_gpio_pinctrl *pctl;
+	unsigned int pinh, pinl;
+	unsigned long pending;
+	struct gpio_chip *gc;
+
+	pctl = container_of(grpp - *grpp, typeof(*pctl), irqgrps[0]);
+	gc = &pctl->gpio_chip;
+
+	chained_irq_enter(chip, desc);
+	for (pinh = 0; pinh < gc->ngpio; pinh += 32) {
+		pending = readl_relaxed(pctl->base + REG_IRQ(*grpp, pinh));
+		for_each_set_bit(pinl, &pending, 32)
+			generic_handle_domain_irq(gc->irq.domain, pinh + pinl);
+	}
+	chained_irq_exit(chip, desc);
+}
+
+static struct irq_chip apple_gpio_irqchip = {
+	.name		= "Apple-GPIO",
+	.irq_startup	= apple_gpio_irq_startup,
+	.irq_ack	= apple_gpio_irq_ack,
+	.irq_mask	= apple_gpio_irq_mask,
+	.irq_unmask	= apple_gpio_irq_unmask,
+	.irq_set_type	= apple_gpio_irq_set_type,
+};
+
+/* Probe & register */
+
+static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
+{
+	struct gpio_irq_chip *girq = &pctl->gpio_chip.irq;
+	void **irq_data = NULL;
+	int ret;
+
+	if (!of_property_read_bool(pctl->dev->of_node, "gpio-controller"))
+		return dev_err_probe(pctl->dev,	-ENODEV,
+				     "No gpio-controller property\n");
+
+	pctl->irq_chip = apple_gpio_irqchip;
+
+	pctl->gpio_chip.label = dev_name(pctl->dev);
+	pctl->gpio_chip.request = gpiochip_generic_request;
+	pctl->gpio_chip.free = gpiochip_generic_free;
+	pctl->gpio_chip.get_direction = apple_gpio_get_direction;
+	pctl->gpio_chip.direction_input = apple_gpio_direction_input;
+	pctl->gpio_chip.direction_output = apple_gpio_direction_output;
+	pctl->gpio_chip.get = apple_gpio_get;
+	pctl->gpio_chip.set = apple_gpio_set;
+	pctl->gpio_chip.base = -1;
+	pctl->gpio_chip.ngpio = pctl->pinctrl_desc.npins;
+	pctl->gpio_chip.parent = pctl->dev;
+	pctl->gpio_chip.of_node = pctl->dev->of_node;
+
+	if (girq->num_parents) {
+		int i;
+
+		girq->chip = &pctl->irq_chip;
+		girq->parent_handler = apple_gpio_irq_handler;
+
+		girq->parents = kmalloc_array(girq->num_parents,
+					      sizeof(*girq->parents),
+					      GFP_KERNEL);
+		irq_data = kmalloc_array(girq->num_parents, sizeof(*irq_data),
+					 GFP_KERNEL);
+		if (!girq->parents || !irq_data) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		for (i = 0; i < girq->num_parents; i++) {
+			ret = platform_get_irq(to_platform_device(pctl->dev),
+					       i);
+			if (ret < 0)
+				goto out;
+
+			girq->parents[i] = ret;
+			pctl->irqgrps[i] = i;
+			irq_data[i] = &pctl->irqgrps[i];
+		}
+
+		girq->parent_handler_data_array = irq_data;
+		girq->per_parent_data = true;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_level_irq;
+	}
+
+	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
+out:
+	kfree(girq->parents);
+	kfree(irq_data);
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
+	static const char* pinmux_functions[] = {
+		"gpio", "periph1", "periph2", "periph3"
+	};
+	unsigned int i, nirqs = 0;
+	int res;
+
+	if (of_property_read_bool(pdev->dev.of_node, "interrupt-controller")) {
+		res = platform_irq_count(pdev);
+		if (res > 0)
+			nirqs = res;
+	}
+
+	pctl = devm_kzalloc(&pdev->dev, struct_size(pctl, irqgrps, nirqs),
+			    GFP_KERNEL);
+	if (!pctl)
+		return -ENOMEM;
+	pctl->dev = &pdev->dev;
+	pctl->gpio_chip.irq.num_parents = nirqs;
+	dev_set_drvdata(&pdev->dev, pctl);
+
+	if (of_property_read_u32(pdev->dev.of_node, "apple,npins", &npins))
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "apple,npins property not found\n");
+
+	pins = devm_kmalloc_array(&pdev->dev, npins, sizeof(pins[0]),
+				  GFP_KERNEL);
+	pin_names = devm_kmalloc_array(&pdev->dev, npins, sizeof(pin_names[0]),
+				       GFP_KERNEL);
+	pin_nums = devm_kmalloc_array(&pdev->dev, npins, sizeof(pin_nums[0]),
+				      GFP_KERNEL);
+	if (!pins || !pin_names || !pin_nums)
+		return -ENOMEM;
+
+	pctl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pctl->base))
+		return PTR_ERR(pctl->base);
+
+	pctl->map = devm_regmap_init_mmio(&pdev->dev, pctl->base, &regmap_config);
+	if (IS_ERR(pctl->map))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pctl->map),
+				     "Failed to create regmap\n");
+
+	for (i = 0; i < npins; i++) {
+		pins[i].number = i;
+		pins[i].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "PIN%u", i);
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
+	pctl->pctldev =	devm_pinctrl_register(&pdev->dev, &pctl->pinctrl_desc, pctl);
+	if (IS_ERR(pctl->pctldev))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pctl->pctldev),
+				     "Failed to register pinctrl device.\n");
+
+	for (i = 0; i < npins; i++) {
+		res = pinctrl_generic_add_group(pctl->pctldev, pins[i].name,
+						pin_nums + i, 1, pctl);
+		if (res < 0)
+			return dev_err_probe(pctl->dev, res,
+					     "Failed to register group");
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pinmux_functions); ++i) {
+		res = pinmux_generic_add_function(pctl->pctldev, pinmux_functions[i],
+						  pin_names, npins, pctl);
+		if (res < 0)
+			return dev_err_probe(pctl->dev, res,
+					     "Failed to register function.");
+	}
+
+	return apple_gpio_register(pctl);
+}
+
+static const struct of_device_id apple_gpio_pinctrl_of_match[] = {
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

