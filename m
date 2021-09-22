Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5A7414B27
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 15:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbhIVNzo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 09:55:44 -0400
Received: from mail-dm6nam12on2089.outbound.protection.outlook.com ([40.107.243.89]:7953
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233478AbhIVNzm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 09:55:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CObnv098FEoCnL3BWcMlels+hEFvDaiHxZ4PNJMzG5NaksCyzrxyFDllOLlXvyO3iH6QENNhHnRlFS+aJjvGvbOJxLTG/8/te5sHtp1yeUlVK8JemTRS1mudU/2cBjc182TGg3Wc3Wqmni1tdcIij/p2BBZcHHhRUt5ul0N88mZJIoveeMWTy2tJ4PUaXMhJSemMUcssU9kiSA5TEJqrYUgpkWyCXtCQ2KFrugOhL2RDPtzXsEuMxRO9KnyORNR31WoJPK+33RbX5Bjx0XZ9+jdClbwUuLr4/9W+elEIsOvZc52U9XnB6GL7jGCErCmt1f1X9ZZsCbb/b0xRYsN59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/okuKsIULlJME1m1Rr62/4UKBe9awl4sZj9WCxo+4U4=;
 b=BbVtYwvZRIFBuKYfqSozpI0PKx72tX1dggl/IugqGsSn61KO33GDhPV+5b0p1IjqcX+06X74EtVPJzyJRfUopy5b4s32LM2enu3ABpMzCtOvKJei3ETxNihDehylj18inAVaTCgzoRtCsDqfRGn1tLTQ5AsEme1nE8ByoN71OYJGwNZEjsEt4W1bhDO60gS6aeSqfgYRWQdsxOkpxZYf76LRXsL3E1k/xQljBl0vC6IH3kTv+wFn1OQaFjIROo53ZvjRE/g+TWd3aGO6aQKpzuGkSwg6T7qvTs0WBC4n4XRN7jfFYsBDhPDmy2QSAnGjxQhgb5RbeNaOrrYgOYdq7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/okuKsIULlJME1m1Rr62/4UKBe9awl4sZj9WCxo+4U4=;
 b=RrChpsrgNRc7ZJz/56STwAcM6fKV2mTVnDmc4JSlqLZxKe8uGKNifhsY3p8Me7CtnhD5xJZ4nUIul6KjL/pGeuXXma64J06NwhLvWUutDjmdm8Fz/5ZqSeQuAKGGFhS7cuJ2fPzkOYhUZpzUrFSO8EhYUtsMwmk6gB4HY5R/4wk=
Received: from BN6PR19CA0083.namprd19.prod.outlook.com (2603:10b6:404:133::21)
 by BL0PR02MB4803.namprd02.prod.outlook.com (2603:10b6:208:5d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Wed, 22 Sep
 2021 13:54:10 +0000
Received: from BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::1b) by BN6PR19CA0083.outlook.office365.com
 (2603:10b6:404:133::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 13:54:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT015.mail.protection.outlook.com (10.13.2.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Wed, 22 Sep 2021 13:54:10 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 22 Sep 2021 06:53:48 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 22 Sep 2021 06:53:48 -0700
Envelope-to: git@xilinx.com,
 arnd@arndb.de,
 zou_wei@huawei.com,
 gregkh@linuxfoundation.org,
 linus.walleij@linaro.org,
 iwamatsu@nigauri.org,
 bgolaszewski@baylibre.com,
 robh+dt@kernel.org,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.35] (port=53850 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mT2gz-0000im-S8; Wed, 22 Sep 2021 06:53:46 -0700
From:   Piyush Mehta <piyush.mehta@xilinx.com>
To:     <arnd@arndb.de>, <zou_wei@huawei.com>,
        <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
        <michal.simek@xilinx.com>, <wendy.liang@xilinx.com>,
        <iwamatsu@nigauri.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <rajan.vaja@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <git@xilinx.com>, <sgoud@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Piyush Mehta <piyush.mehta@xilinx.com>
Subject: [PATCH V4 3/3] gpio: modepin: Add driver support for modepin GPIO controller
Date:   Wed, 22 Sep 2021 19:23:19 +0530
Message-ID: <20210922135319.3128153-4-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922135319.3128153-1-piyush.mehta@xilinx.com>
References: <20210922135319.3128153-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 308e8684-1cbe-4f89-df97-08d97dd0741c
X-MS-TrafficTypeDiagnostic: BL0PR02MB4803:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4803B0AA2F304D72E00C49B0D4A29@BL0PR02MB4803.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hvnrhwhH4fGLjE+mVdDUe++Zr/4F8Zk+kcW7pXQMJZbAwu7DtA5l1nkt1acIcNC/CztsvPg4he3QgoXmaDriQHujqt2hOSU4PIHmJGfJH/Q6+dgIiVOmk7rAztxUV8TsDqzYUXW408bTvQuZZBNOwzJ2aMcP59sut0p6PD0zDJCJLFOL/GDWeCtVLHo7GlbyJv5e17CXtpTZldlKBQskAgji/FHiSfpWISsBDOpImACRsAe4icYi8sHnbBxWXqDblzud3KQuLnNty9qxHgRDkAODjaeYRw0kqH0Rv158HpzrirMMK92X16Jx1TPiZOmi9ezWoKFk0dO+3ntgYAjeM/dTmBGumtP4N7y/RjVLHkMfmPy8fmtPmlK58lN9sOUrN+1JM3i3TBjiduxqHYwcE+w/VxZVr6SuGuf65ZXF9SipQaRl3K0CKGtZeZgjOlM0Bz95EMxf4sJWiN3mvgYepuEqaTUCsifeWFrFV56NsIp5S57P+st3smo1zKHih6eOWt6XO1caxJ7OwRdHz2hB2KpfJnmEhJlv7YmjjeSHGUi83WgbBuPaXJFhNLqlQ0BXW2becGHQaoighE3V8cG7a2sS/qWPwIfKFVJG5kmTNDLRJMOjmtK1NIg0Du2DawoAndnjG53nmCB0fN42gB9NT2ZnNc8zN9L9kuSPxRXEa78b09Jj2nA6m+YRP3S/hLja+XSwo+LHemJBPDx1wNFDuaQ4gEAuDyck/ufabLumj2MmHyMWufbBDMpEBDKfAgQspWO0A/TIQk+Yzmsffhbc05+uNUCsFXLgN3Ta8KPNZm0hOkYt/JHzsW4i5oS3oDBuyv4cJntvjQQRqyZUjTASMt+DfCwdLC7knEnmY4Tx8cW/wqkWORee0pMDZJofdMvVRYPHrO4j0w+EVdfkdLdmctWzsBmaL7Mt6sN7aUsLl6o=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(7416002)(1076003)(9786002)(7696005)(8936002)(54906003)(107886003)(336012)(6666004)(2906002)(36860700001)(5660300002)(7636003)(8676002)(26005)(70586007)(47076005)(316002)(6636002)(186003)(110136005)(82310400003)(966005)(4326008)(83380400001)(36906005)(921005)(2616005)(36756003)(44832011)(426003)(508600001)(356005)(70206006)(102446001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:54:10.2955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 308e8684-1cbe-4f89-df97-08d97dd0741c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4803
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds driver support for the zynqmp modepin GPIO controller.
GPIO modepin driver set and get the value and status of the PS_MODE pin,
based on device-tree pin configuration. These four mode pins are
configurable as input/output. The mode pin has a control register, which
have lower four-bits [0:3] are configurable as input/output, next four-bits
can be used for reading the data  as input[4:7], and next setting the
output pin state output[8:11]. By default value of mode pin register is 0.

Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
Acked-by: Michal Simek <michal.simek@xilinx.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Modepin driver- Addressed review comments:
  - Update APIs
  - Removed unwanted variables
  - Handle return path for probe function

Review Comments:
https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#m276c8a5c52f8dc1ed1cd91a2d660f78d498e4ae5

Changes in v3:
- Addressed Linus and Arnd review comments:
  - Update probe function return value
  - Remove unnecessary print and header file
  - Update error message for set value method

Review Comments:
https://lore.kernel.org/linux-arm-kernel/20210805174219.3000667-4-piyush.mehta@xilinx.com/T/#m70acd39653033e32458633e21a2e6d21afdd16e6

Changes in v4:
- Added input pin read status in modepin_gpio_get_value.
- Updated modepin control bit for out configuration on set_value.

Review Comments:
https://lore.kernel.org/linux-arm-kernel/554508f5-8cb5-3840-9f61-f6cd6e5745d2@xilinx.com/T/#u
https://lore.kernel.org/linux-arm-kernel/554508f5-8cb5-3840-9f61-f6cd6e5745d2@xilinx.com/T/#m60039005ebee312260d344c7d4383acb43c50f0f
---
 drivers/gpio/Kconfig               |  12 +++
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-zynqmp-modepin.c | 162 +++++++++++++++++++++++++++++++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 drivers/gpio/gpio-zynqmp-modepin.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fae5141..37a6f77 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -763,6 +763,18 @@ config GPIO_ZYNQ
 	help
 	  Say yes here to support Xilinx Zynq GPIO controller.
 
+config GPIO_ZYNQMP_MODEPIN
+	tristate "ZynqMP ps-mode pin gpio configuration driver"
+	depends on ZYNQMP_FIRMWARE
+	default ZYNQMP_FIRMWARE
+	help
+	  Say yes here to support the ZynqMP ps-mode pin gpio configuration
+	  driver.
+
+	  This ps-mode pin gpio driver is based on GPIO framework, PS_MODE
+	  is 4-bits boot mode pins. It sets and gets the status of
+	  the ps-mode pin. Every pin can be configured as input/output.
+
 config GPIO_LOONGSON1
 	tristate "Loongson1 GPIO support"
 	depends on MACH_LOONGSON32
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index fbcda63..71ee9fc2 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -184,3 +184,4 @@ obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
 obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
+obj-$(CONFIG_GPIO_ZYNQMP_MODEPIN)	+= gpio-zynqmp-modepin.o
diff --git a/drivers/gpio/gpio-zynqmp-modepin.c b/drivers/gpio/gpio-zynqmp-modepin.c
new file mode 100644
index 0000000..a0d6938
--- /dev/null
+++ b/drivers/gpio/gpio-zynqmp-modepin.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the ps-mode pin configuration.
+ *
+ * Copyright (c) 2021 Xilinx, Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+
+/* 4-bit boot mode pins */
+#define MODE_PINS			4
+
+/**
+ * modepin_gpio_get_value - Get the state of the specified pin of GPIO device
+ * @chip:	gpio_chip instance to be worked on
+ * @pin:	gpio pin number within the device
+ *
+ * This function reads the state of the specified pin of the GPIO device.
+ *
+ * Return: 0 if the pin is low, 1 if pin is high, -EINVAL wrong pin configured
+ *         or error value.
+ */
+static int modepin_gpio_get_value(struct gpio_chip *chip, unsigned int pin)
+{
+	u32 regval = 0;
+	int ret;
+
+	ret = zynqmp_pm_bootmode_read(&regval);
+	if (ret)
+		return ret;
+
+	/* When [0:3] corresponding bit is set, then read output bit [8:11],
+	 * if the bit is clear then read input bit [4:7] for status or value.
+	 */
+	if (regval & BIT(pin))
+		return !!(regval & BIT(pin + 8));
+	else
+		return !!(regval & BIT(pin + 4));
+}
+
+/**
+ * modepin_gpio_set_value - Modify the state of the pin with specified value
+ * @chip:	gpio_chip instance to be worked on
+ * @pin:	gpio pin number within the device
+ * @state:	value used to modify the state of the specified pin
+ *
+ * This function reads the state of the specified pin of the GPIO device, mask
+ * with the capture state of GPIO pin, and update pin of GPIO device.
+ *
+ * Return:	None.
+ */
+static void modepin_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
+				   int state)
+{
+	u32 bootpin_val = 0;
+	int ret;
+
+	zynqmp_pm_bootmode_read(&bootpin_val);
+
+	/* Configure pin as an output by set bit [0:3] */
+	bootpin_val |= BIT(pin);
+
+	if (state)
+		bootpin_val |= BIT(pin + 8);
+	else
+		bootpin_val &= ~BIT(pin + 8);
+
+	/* Configure bootpin value */
+	ret = zynqmp_pm_bootmode_write(bootpin_val);
+	if (ret)
+		pr_err("modepin: set value error %d for pin %d\n", ret, pin);
+}
+
+/**
+ * modepin_gpio_dir_in - Set the direction of the specified GPIO pin as input
+ * @chip:	gpio_chip instance to be worked on
+ * @pin:	gpio pin number within the device
+ *
+ * Return: 0 always
+ */
+static int modepin_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
+{
+	return 0;
+}
+
+/**
+ * modepin_gpio_dir_out - Set the direction of the specified GPIO pin as output
+ * @chip:	gpio_chip instance to be worked on
+ * @pin:	gpio pin number within the device
+ * @state:	value to be written to specified pin
+ *
+ * Return: 0 always
+ */
+static int modepin_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,
+				int state)
+{
+	return 0;
+}
+
+/**
+ * modepin_gpio_probe - Initialization method for modepin_gpio
+ * @pdev:		platform device instance
+ *
+ * Return: 0 on success, negative error otherwise.
+ */
+static int modepin_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_chip *chip;
+	int status;
+
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, chip);
+
+	/* configure the gpio chip */
+	chip->base = -1;
+	chip->ngpio = MODE_PINS;
+	chip->owner = THIS_MODULE;
+	chip->parent = &pdev->dev;
+	chip->get = modepin_gpio_get_value;
+	chip->set = modepin_gpio_set_value;
+	chip->direction_input = modepin_gpio_dir_in;
+	chip->direction_output = modepin_gpio_dir_out;
+	chip->label = dev_name(&pdev->dev);
+
+	/* modepin gpio registration */
+	status = devm_gpiochip_add_data(&pdev->dev, chip, chip);
+	if (status)
+		return dev_err_probe(&pdev->dev, status,
+			      "Failed to add GPIO chip\n");
+
+	return status;
+}
+
+static const struct of_device_id modepin_platform_id[] = {
+	{ .compatible = "xlnx,zynqmp-gpio-modepin", },
+	{ }
+};
+
+static struct platform_driver modepin_platform_driver = {
+	.driver = {
+		.name = "modepin-gpio",
+		.of_match_table = modepin_platform_id,
+	},
+	.probe = modepin_gpio_probe,
+};
+
+module_platform_driver(modepin_platform_driver);
+
+MODULE_AUTHOR("Piyush Mehta <piyush.mehta@xilinx.com>");
+MODULE_DESCRIPTION("ZynqMP Boot PS_MODE Configuration");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

