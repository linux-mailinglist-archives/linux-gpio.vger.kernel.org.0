Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A923EFECA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 10:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240195AbhHRILr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 04:11:47 -0400
Received: from mail-co1nam11on2069.outbound.protection.outlook.com ([40.107.220.69]:39137
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240197AbhHRILo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Aug 2021 04:11:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPgRdao82eQ/6gNMeYl/oRCURafJD0aytuUTP3an7S32MPd3YaZZVle8atE6r9krWf8lt/2gPjhxdM3U5N2lzoRMMZjR76vBQ89mAf7hRpBFVNjqOwxfdOLVQBRHFOd0y7TJVaRf/We+haHfYSKYDLjNW8E8oQkZu1ulCV+2Y+W55H+878ZpTZ6waYCIv0y4da6/2OhEseCaNOG6S43aXEvPxvyA9bnPdXi1+yFOcTC1LsaR4COJ+M/GeiKosCtY8kE7SrSqOrFPlrbYIt92Rgb8ct5KKLR+a6e81cVggpFfVF1BsPMl1GlVfbCHBZT/iLFeMS29+bMqsMYr7zgZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVuTXdveSjKMNC2409fZrRZq54qzRAkioNtYyIYSfso=;
 b=Ej2fF68G2UnxCwdEnQbqfzOvyDq16AkalQPIFlPwrNOhaLyr4eWykrAUIOs51Mn5HQhYwYk6120UfawYWwNQOjLmZIOzPmjbpLR48HiUNmc+MG2InwlPtqzNK5oDHXfqCfoCRx4rTsJOGdLHGmh/glrUVLNW/qXzHa3VmhctWf4FE+nGFr9WT1Lc8XfgqLEW73AbMb9drc9Q5yEXJEEc1K1c7Dg3D2cuNJhQ1vVY1sqMEE8BChgM8s0YjLs6732mxgaHgWhIKrKlcl4NiAqEPeLw9U9MBpIk9h7Mf+370P2X7uZtQYrVhMSmLjCfgZYIOfDx3gvSLab89LTTtA6Q6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVuTXdveSjKMNC2409fZrRZq54qzRAkioNtYyIYSfso=;
 b=mY/Bj7UcSE4q+eKekNpW68w4FyQOPvM1nqnGoNmZkZQhow2tQvrL1K5XXbT7Au1XqA0Od9zBJuqZAH8NkNrcmG1lSZaqcDtm2AB90M3sY0diCAERauVE/S9tzGOs5ilqLj0ZAUuMbsU4AgR1FWC7X5LLUmk9i4H91s79ViqzTOU=
Received: from BN0PR04CA0185.namprd04.prod.outlook.com (2603:10b6:408:e9::10)
 by BYAPR02MB5655.namprd02.prod.outlook.com (2603:10b6:a03:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 08:11:07 +0000
Received: from BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::e6) by BN0PR04CA0185.outlook.office365.com
 (2603:10b6:408:e9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 08:11:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT053.mail.protection.outlook.com (10.13.2.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 08:11:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 01:10:45 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 01:10:45 -0700
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
Received: from [10.140.6.35] (port=57498 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mGGep-0008z4-RN; Wed, 18 Aug 2021 01:10:44 -0700
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
Subject: [PATCH V3 3/3] gpio: modepin: Add driver support for modepin GPIO controller
Date:   Wed, 18 Aug 2021 13:40:18 +0530
Message-ID: <20210818081018.2620544-4-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45311d35-1a0e-4148-fb3e-08d9621fbaeb
X-MS-TrafficTypeDiagnostic: BYAPR02MB5655:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5655883E6D53705653DA80B0D4FF9@BYAPR02MB5655.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFTuB/CAL/dnB8wgn2AzKdLxtJm57CJL+N5gZg0XUv3FeRUZcEtX/UYBjIKpbtSPwsMM4gI1Xq4Ste+h6/OjBrlQRuAHcsP6y90UMOGe4UUKj9opk3trXjkybYCzMGjvJKrQZKHuC+F1e8PN6JWYiToa/DHsBDrhNiPhjjg4uiMX8uhPYplC8mVS1lSSHgl8MwY+pQVkHWPltDH1YIf+iOlB2NVT+X36R1h6PUYW5wgDUXSwIf4Jmzt7sLitUpucILQrQQngkJ/D+FqGG/zKCQb81whK0WNM9KHrJ3Tm9EoGCsQgFFemwzU0ShwVDvdt1aEKdgqtIT4o5ts6vYxzi93RFxgkcy1RCGiKd5NTNZhyj3w3VqF3WTk0MJO9rnzqhDaMGRImRcXQ3zMusopheHlDaxky0+Ow05J/G2oNxG87XSFLoZxpxUhmOmBA6Lo5sel3gX7Gh8xrrh6uZf8qfDhD7bW02jiiWC8PjweqrNhTQRXlird9izVnH+V4SENdZptWucr8s9Y8HRgsx6/erb7e2HZP0F81mdf4QLVBILL/thjTgYyDbx9AUAgAaXr++Oj7B4R2jrlRCXFhsWWXyX8WQIq3dkqnxcOtsjHDoZdSzHzY9TwSEL83rPUi8e1LVbCspaHsZZWwSbywwVLn97E2dRLdxlWL4TPvFvxNzBRn8Wojcn/243tCVNiTSyMa40GPjQo1G3tberWfGKVeV1iZrXTugnuNJCEzObfcrG4pzE/vLXMOz3r4zvagMkqv5DJvFusy5PffbN5MvFk+jXiblIQnwkpKAzObXYRVrQC4H2uld6tufdumjAh8KTQlu9qxrLorZjm6Yj63KjgQb6QCoNOcgCcHGoduIB228GOwUUqUdP4wqb96bMIU3nwPSTQvIlqve2ch9Be+MF6GK+N3gmlN32zenxKIpfYkKyY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966006)(36840700001)(6666004)(2616005)(44832011)(83380400001)(82740400003)(336012)(70586007)(70206006)(186003)(426003)(26005)(921005)(82310400003)(356005)(7636003)(36756003)(107886003)(47076005)(2906002)(8676002)(9786002)(36906005)(7416002)(1076003)(5660300002)(54906003)(7696005)(110136005)(966005)(6636002)(478600001)(316002)(36860700001)(4326008)(8936002)(102446001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 08:11:06.7842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45311d35-1a0e-4148-fb3e-08d9621fbaeb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5655
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds driver support for the zynqmp modepin GPIO controller.
GPIO modepin driver set and get the value and status of the PS_MODE pin,
based on device-tree pin configuration. These four mode pins are
configurable as input/output. The mode pin has a control register, which
have lower four-bits [0:3] are configurable as input/output, next four-bits
can be used for reading the data  as input[4:7], and next setting the
output pin state output[8:11].

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
---
 drivers/gpio/Kconfig               |  12 +++
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-zynqmp-modepin.c | 153 +++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/gpio/gpio-zynqmp-modepin.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fab5710..90a3a3d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -755,6 +755,18 @@ config GPIO_ZYNQ
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
index 32a3265..978dc4595 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -183,3 +183,4 @@ obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
 obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
+obj-$(CONFIG_GPIO_ZYNQMP_MODEPIN)	+= gpio-zynqmp-modepin.o
diff --git a/drivers/gpio/gpio-zynqmp-modepin.c b/drivers/gpio/gpio-zynqmp-modepin.c
new file mode 100644
index 0000000..d52e391
--- /dev/null
+++ b/drivers/gpio/gpio-zynqmp-modepin.c
@@ -0,0 +1,153 @@
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
+	return !!(regval & BIT(pin + 8));
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

