Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF463A78BB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 10:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhFOII4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 04:08:56 -0400
Received: from mail-dm6nam11on2064.outbound.protection.outlook.com ([40.107.223.64]:43360
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230332AbhFOII4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Jun 2021 04:08:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHBEN02DHC5ApdyHLIuDwVHTtwgDkvsKfd1jBvutKiTnf6IYhE0ykEN5ojx5lzYOJcNzZJMyo2/Ur+TvbQuoeEG2jcXqU58ljYcYNMlkbD0Nm1cEKGLsG7EnEQ7+xSfHbj2ZFHzL9YtEzYruq6Ax87mLzudYJkq2GXiRpDvummLJSKQLh1IAqm5H/8G22Cfci6SQv3pX4wIeOdEKoAIGXFzChuy7OMrwBSMrrNOkJn+ZU4YGmYaDyGFt5UukcsA4lonmYQgaib3YF852ior1sRx9Njhxzu70P0vOYyFoLKIRXtROsHd0ieVqLdsrkEAaBMjr23AKAavJZlZk7u8Fdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z+ajz9oJTabMq/lg1C/vnSrptLSuNT9aIfqDf71ICI=;
 b=NzNIaYX97g6uHbN1RFGgtZAWZj87GrM33gvrvMWrGxzPXenHQJkFs8PrY5lDvllIoaFSoSGxEFmigvFyRNkz7UwN6Z318yCVLtWJ3e4/8MzJ3uV3LLleHf7V/mBzmR58wWxkZdcn7MXXUJq7sLGlm0KkpbziXDE8YIgsbKMFnzWT3GdswbjTexz+uXNWRjYoNGGQAhXuAYrU5bsZBADlmjlYlViORXjMYXTlh2mHVJna3QPecas3O9YniqC9beUM1M37GT0Y8RS6KD9zRgtgcxcYNZumBhweAvDKMy5AvOy1TxCnvs4FAF3o2UU2HR6YiXq0f6DkK6A6HRM1gDcoKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z+ajz9oJTabMq/lg1C/vnSrptLSuNT9aIfqDf71ICI=;
 b=M3gKXZ+L8IWDpGn1tgr0mL5A4fNQtTinYxcD7L60MdOxVvAA82Egep927P0LHvTB6YF8Uo9nTM8AEp/p91jjFhhpmaqj9ebNWArazotkyAvb8unzq7jaBtBK08UI7VBZLV4e8pdRxnpdA1htxMYD3eJ/9+EcPVkPldm+ThBi2aY=
Received: from DM5PR13CA0030.namprd13.prod.outlook.com (2603:10b6:3:7b::16) by
 BL3PR02MB8185.namprd02.prod.outlook.com (2603:10b6:208:338::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 08:06:50 +0000
Received: from DM3NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::19) by DM5PR13CA0030.outlook.office365.com
 (2603:10b6:3:7b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend
 Transport; Tue, 15 Jun 2021 08:06:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT011.mail.protection.outlook.com (10.13.5.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 08:06:50 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 01:06:43 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 15 Jun 2021 01:06:43 -0700
Envelope-to: git@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 robh+dt@kernel.org,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [10.140.6.35] (port=43350 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1lt45p-0002dn-UA; Tue, 15 Jun 2021 01:06:42 -0700
From:   Piyush Mehta <piyush.mehta@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>, <git@xilinx.com>,
        <sgoud@xilinx.com>, <michal.simek@xilinx.com>,
        Piyush Mehta <piyush.mehta@xilinx.com>
Subject: [PATCH 2/2] gpio: modepin: Add driver support for modepin GPIO controller
Date:   Tue, 15 Jun 2021 13:35:53 +0530
Message-ID: <20210615080553.2021061-3-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615080553.2021061-1-piyush.mehta@xilinx.com>
References: <20210615080553.2021061-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6942f690-db2b-4194-9218-08d92fd487ad
X-MS-TrafficTypeDiagnostic: BL3PR02MB8185:
X-Microsoft-Antispam-PRVS: <BL3PR02MB8185A40BFC76586AE646EC30D4309@BL3PR02MB8185.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jgk+qwwWKEYohWMQbCl1lRPzjlhZMLPpVCvLwpLkV43oQIYuqljZSCQhT1rwW7HImZmVmr2JbUD1Y5wGpdq9/SuEcctuJvpydS5o86d4k6dCityw+2JQLdeoCboLon2P0OD9Yr6WuJ4ayevzDINCAggGFrt6lTIZxyVE+Hb9D5LGnLheO5C6xd7g3H6cHqFGaEWkO39qzk53t6MUzXEI7sPLx/V6zwc0sj1ZqtdAwX5exKlV/wIQQnQkWiW07196Cz7mbIfFPVMdOY8h7gAAQb7hZFnCAzwJVLiTzxg6tcgZPyk4aoMeA62L/GPAxl8k/drCWX1kdl3qcDZ25xvHFzwmuSfzYqxVK9dqN9H/laV4sAqFujk9mCCHa5xVaR9PTQ8NMgWxFHtuCacMFlGcptgsdEh5uisvYWnd9Q0SIbF5aw+7UnlMU2H6CNtb3kJBIV9xUsv6NRLDOcBxuQlFoShGyzvAXr0smz/DPHfRXUrZy7w2QhSxlf44ILR2sSehumX+PxgJToC+zf7oclQ2mvtd+XPey3jNjbIyo+4f8ss1JVE3rBItpOAdcmCIzc/X85/sRTNzktcIHenRUFVP00j1S1rRI3FHYcaRFlTXFlzA4BF9fSI54jR8BM/Czl+WcnsUQtwwTZxsY1bw0IyBHL2hc1dEYsdPc90/OEcqyFouWJB3QRbix8aDdj9Bnud7
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(136003)(36840700001)(46966006)(336012)(426003)(2616005)(6666004)(44832011)(478600001)(2906002)(186003)(54906003)(26005)(316002)(110136005)(8936002)(36906005)(7696005)(36860700001)(107886003)(4326008)(1076003)(8676002)(5660300002)(47076005)(36756003)(82310400003)(7636003)(70206006)(356005)(70586007)(9786002)(82740400003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 08:06:50.4597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6942f690-db2b-4194-9218-08d92fd487ad
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8185
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for the mode pin GPIO controller. GPIO Modepin
driver set and get the value and status of the PS_MODE pin, based on
device-tree pin configuration. These 4-bits boot-mode pins are dedicated
configurable as input/output. After the stabilization of the system,
these mode pins are sampled.

Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
---
 drivers/gpio/Kconfig               |  12 +++
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-zynqmp-modepin.c | 154 +++++++++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 drivers/gpio/gpio-zynqmp-modepin.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1dd0ec6..30e0dbf 100644
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
index d7c81e1..62bfa73 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -182,3 +182,4 @@ obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
 obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
+obj-$(CONFIG_GPIO_ZYNQMP_MODEPIN)	+= gpio-zynqmp-modepin.o
diff --git a/drivers/gpio/gpio-zynqmp-modepin.c b/drivers/gpio/gpio-zynqmp-modepin.c
new file mode 100644
index 0000000..27052f0
--- /dev/null
+++ b/drivers/gpio/gpio-zynqmp-modepin.c
@@ -0,0 +1,154 @@
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
+#define MODE_PINS			4
+#define GET_OUTEN_PIN(pin)		(1U << (pin))
+
+/*
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
+	u32 out_en;
+	u32 regval = 0;
+	int ret;
+
+	out_en = GET_OUTEN_PIN(pin);
+
+	ret = zynqmp_pm_bootmode_read(&regval);
+	if (ret) {
+		pr_err("modepin: get value err %d\n", ret);
+		return ret;
+	}
+
+	return (out_en & (regval >> 8U)) ? 1 : 0;
+}
+
+/*
+ * modepin_gpio_set_value - Modify the state of the pin with specified value
+ * @chip:	gpio_chip instance to be worked on
+ * @pin:	gpio pin number within the device
+ * @state:	value used to modify the state of the specified pin
+ *
+ * Return:	None.
+ */
+static void modepin_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
+				   int state)
+{
+	u32 out_en;
+	u32 bootpin_val = 0;
+	int ret;
+
+	out_en = GET_OUTEN_PIN(pin);
+	state = state != 0 ? out_en : 0;
+	bootpin_val = (state << (8U)) | out_en;
+
+	/* Configure bootpin value */
+	ret = zynqmp_pm_bootmode_write(bootpin_val);
+	if (ret)
+		pr_err("modepin: %s failed\n", __func__);
+}
+
+/*
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
+/*
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
+/*
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
+		dev_err_probe(&pdev->dev, status,
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

