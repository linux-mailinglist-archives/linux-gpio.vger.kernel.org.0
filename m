Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B9E3E1AA6
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 19:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240545AbhHERng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 13:43:36 -0400
Received: from mail-bn8nam11on2076.outbound.protection.outlook.com ([40.107.236.76]:60896
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240462AbhHERn0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Aug 2021 13:43:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR+Nlx1P2QMk+TCFLYd3+YYOmHPP7OzLuuLCpVwoRg93TLyIACLGRjrslb5HgtqD7DIsV7SoWEae/qs1IHYdNZJ15mcWndxOqhhI1qU+FgJKPPYB1DuTvawsoW7Tcb56jVA0buzvpkqTifmmQnwJ9Co63dh5Q4/sLZG9bsRITp+YiCwv+K+Yd8XHCLY9YeyvYmHHkDYhOMyKyl27y2XH7V39QBCCIXNL8Oz/ngW71JEw8+kX1q3kvYevChSmf5eIPrNzqZyrgRA14ruDhTqg5Ld5HZtMCMNWJIbUK5gLbeehFJ5cWXl5gsxTs0pKlBOay68bWR5nFcueZBcx4iAHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTSmP1iyzxWX3TDNtt21WLWicMTWRRsuFrtKLVorEYk=;
 b=FBGqTQSznsBHf1/8muv0qNLOyQYg9UBGW83S9wX3HYsv9KVCgyS8ZK37BLGTjecq3fn2z788cgmCBUmKzz4/XeXXsdlRPJmN+HoIn2DwMSbAiZCkraSSxrQDvORhq/KwEzZMBh3EUlsFKusdvfyxsOnqDyuWOkKOuXFm4wRwKUXprWy0L3rItDaKyR/e5hsuzPuqQNUE6yzP/qn15HxODIFWFKgLDiPQUPaOt2YhpVrpdjopROgSUrUXaT5d0UzHOjhUpm5H7I2FfZ+DKScZqsq6nqaOgidihPJMsf21dQtYOKqBHgR9prHHgMzKF0W2j98ziB/GtS20PKyp3CHhkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTSmP1iyzxWX3TDNtt21WLWicMTWRRsuFrtKLVorEYk=;
 b=ImHi9n7igqgL/SexcZOl6osflpn6uSfOPQI8SUPquEhuEizq859phpN459T3fHxLoD3z6B44WtKxoWmHHPd3+LIHwMFnyT0S2+mDfJNmCydeEHUDkXIHaPK/D7pzMHNkUo6W3uxx1DozZj1GSDQDTtHEeIuSSTT34bp6tyw7BuU=
Received: from SN4PR0201CA0003.namprd02.prod.outlook.com
 (2603:10b6:803:2b::13) by SN1PR02MB3758.namprd02.prod.outlook.com
 (2603:10b6:802:2c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 17:43:07 +0000
Received: from SN1NAM02FT0033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2b:cafe::2e) by SN4PR0201CA0003.outlook.office365.com
 (2603:10b6:803:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Thu, 5 Aug 2021 17:43:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0033.mail.protection.outlook.com (10.97.5.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 17:43:07 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 10:42:59 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 10:42:59 -0700
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
Received: from [10.140.6.35] (port=51088 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mBhOU-0005Bw-58; Thu, 05 Aug 2021 10:42:58 -0700
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
Subject: [PATCH V2 3/3] gpio: modepin: Add driver support for modepin GPIO controller
Date:   Thu, 5 Aug 2021 23:12:19 +0530
Message-ID: <20210805174219.3000667-4-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 860dd078-e01c-4d23-5f68-08d958387c1b
X-MS-TrafficTypeDiagnostic: SN1PR02MB3758:
X-Microsoft-Antispam-PRVS: <SN1PR02MB3758F25990BCFDC9B43E4009D4F29@SN1PR02MB3758.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dzYRZL6P0s8nk4z/SESdOlwa31S2seBGEvlNZwIKq5CCl/XRhxAmVsz+LFzJC5G6jLH93IL5XwQ187Po184k3kdWnoRcg31gyB/ejGZUA4lpj3TsunKzyfbpTpyteQLFkYBa6jfBH37vZ0ssOBLi6+lAAChMNML00k+rVP0HaHAw29pD5z7LHCaU+UNnmm2nbqjNcL8XXPLsgfIukZ5H3KlM4BpCeYpAbqYVsC92MpM3oj+7sM0opprQrIhF3jKlXIKPRO7HBVJQjwRgKwN9QavQobuzz6ONhp+RsS4HEDdxvyLFeWrooIO8hv3tCM17dZqf01Ml4Ya7JLFVavhTTnq1XPCK0cdQMai1SLNP72Tsw5G3ybQXsxzfPzOwdCwAU4/e7kuvUPjkDdKdjAjLUDTmW4HlideQwb5R6Sntb3g0uQEIqPUzPCIYVvdQT3Qngd3pSHtB3m+l/+4ZGxsi//MB395snx0k0Jc+7p4ulavC6WQRV62sJWg9A1ZI1r73b0N4aovw4unVHH24+s9LFv5/dVALY0ptP63PLIJJvL4iP0huOpQmCgpcQ1LRJVWDlcWRIS4ASGgaNDbKpTBEN1dx4W2LN0hp919og+NMJUj86NomjxjxkK45/GJVqzTDESI5SNr/nQoey0KP/kx1ZE6/dEF6kwkFOtWt+Odh4jmqjjnJ4+fPBfDY8FC1auK3n974qhzJ4HKzZh3FIPcojvGtSMc3DDRD5MCzV1XeIwzWkPGIiCoz50EA3VD1e/EE/JYWV3v3HyOagmr+j2+lblB9uK3WYtrqnk5JMC/FCCplnbbK/p+lSuyEGSBk96INjI600ygaD1Wem0fvKEct33ew6vWFdRf+BCh4VuqtNuabusvOrq1jNj0ya+oh4a/0
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39850400004)(46966006)(36840700001)(921005)(36756003)(36860700001)(82310400003)(966005)(7636003)(70586007)(82740400003)(47076005)(83380400001)(107886003)(4326008)(356005)(70206006)(2616005)(7696005)(5660300002)(1076003)(26005)(478600001)(7416002)(9786002)(426003)(2906002)(110136005)(186003)(54906003)(6666004)(44832011)(6636002)(36906005)(8676002)(8936002)(316002)(336012)(102446001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 17:43:07.2417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 860dd078-e01c-4d23-5f68-08d958387c1b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3758
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
---
Changes in v2:
- Modepin driver- Addressed review comments:
  - Update APIs
  - Removed unwanted variables
  - Handle return path for probe function

https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#m276c8a5c52f8dc1ed1cd91a2d660f78d498e4ae5
---
 drivers/gpio/Kconfig               |  12 +++
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-zynqmp-modepin.c | 158 +++++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)
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
index 0000000..99c69df
--- /dev/null
+++ b/drivers/gpio/gpio-zynqmp-modepin.c
@@ -0,0 +1,158 @@
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
+#include <linux/of_platform.h>
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
+	if (ret) {
+		pr_err("modepin: get value err %d\n", ret);
+		return ret;
+	}
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
+	ret = zynqmp_pm_bootmode_read(&bootpin_val);
+	if (ret)
+		pr_err("modepin: get value err %d\n", ret);
+
+	if (state)
+		bootpin_val |= BIT(pin + 8);
+	else
+		bootpin_val &= ~BIT(pin + 8);
+
+	/* Configure bootpin value */
+	ret = zynqmp_pm_bootmode_write(bootpin_val);
+	if (ret)
+		pr_err("modepin: %s failed\n", __func__);
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

