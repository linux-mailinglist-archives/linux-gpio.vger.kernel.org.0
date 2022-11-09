Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17BE5622446
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 07:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiKIG4l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 01:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiKIG4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 01:56:39 -0500
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3BB1DF0F;
        Tue,  8 Nov 2022 22:56:38 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A96uEMj106623;
        Wed, 9 Nov 2022 00:56:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1667976974;
        bh=3aOCoqxf65TlmrWhKMuEUXu7+vkeJELw89gYY75D+yg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=K/g0rbIjZY9eSuHAqLtiv7r/Hdg2FkQf+ibjQWMHKFKcKnHXDHjQLHvA8PTDNq8V4
         m7eIQWvO9UB2Qs3uz2/+3iCANvtM3MXyUyeOohQAxDqPUjebVJUu/s5fjKXC+j6M60
         pWevSI4ytFNsW3ETduRXxaYkj5+1FFDHHZh8GxPw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A96uEuE121959
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Nov 2022 00:56:14 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 9 Nov
 2022 00:56:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 9 Nov 2022 00:56:13 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A96uAEE030003;
        Wed, 9 Nov 2022 00:56:12 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <brgl@bgdev.pl>, <lee@kernel.org>, <linus.walleij@linaro.org>,
        <kristo@kernel.org>, <alexandre.belloni@bootlin.com>,
        <a.zummo@towertech.it>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh@kernel.org>, <vigneshr@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Matt Ranostay <mranostay@ti.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH v3 4/7] gpio: tps6594x: add GPIO support for TPS6594x PMIC
Date:   Tue, 8 Nov 2022 22:55:43 -0800
Message-ID: <20221109065546.24912-5-mranostay@ti.com>
X-Mailer: git-send-email 2.38.GIT
In-Reply-To: <20221109065546.24912-1-mranostay@ti.com>
References: <20221109065546.24912-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for TPS6594X PMICs GPIO interface that has 11 that can be
configured as input or outputs.

Tested-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 drivers/gpio/Kconfig         |   7 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-tps6594x.c | 142 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps6594x.h |   6 ++
 4 files changed, 156 insertions(+)
 create mode 100644 drivers/gpio/gpio-tps6594x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8c756cb29214..0225e6bddf0a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1405,6 +1405,13 @@ config GPIO_TPS65912
 	help
 	  This driver supports TPS65912 GPIO chip.
 
+config GPIO_TPS6594X
+	tristate "TI TPS6594X GPIO driver"
+	depends on MFD_TPS6594X
+	help
+	  Select this option to enable GPIO driver for the TPS6954X
+	  PMIC chip family. There are 11 GPIOs that can be configured.
+
 config GPIO_TPS68470
 	tristate "TPS68470 GPIO"
 	depends on INTEL_SKL_INT3472
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 8629e9eaf79e..e67a9b787b09 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_GPIO_TPS65218)		+= gpio-tps65218.o
 obj-$(CONFIG_GPIO_TPS6586X)		+= gpio-tps6586x.o
 obj-$(CONFIG_GPIO_TPS65910)		+= gpio-tps65910.o
 obj-$(CONFIG_GPIO_TPS65912)		+= gpio-tps65912.o
+obj-$(CONFIG_GPIO_TPS6594X)		+= gpio-tps6594x.o
 obj-$(CONFIG_GPIO_TPS68470)		+= gpio-tps68470.o
 obj-$(CONFIG_GPIO_TQMX86)		+= gpio-tqmx86.o
 obj-$(CONFIG_GPIO_TS4800)		+= gpio-ts4800.o
diff --git a/drivers/gpio/gpio-tps6594x.c b/drivers/gpio/gpio-tps6594x.c
new file mode 100644
index 000000000000..f530ac17f73f
--- /dev/null
+++ b/drivers/gpio/gpio-tps6594x.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPIO driver for TI TPS6594x PMICs
+ *
+ * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <linux/gpio/driver.h>
+#include <linux/mfd/tps6594x.h>
+
+#define GPIO_CFG_MASK	BIT(0)
+#define NGPIOS_PER_REG	8
+
+struct tps6594x_gpio {
+	struct gpio_chip gpio_chip;
+	struct tps6594x *tps;
+};
+
+static int tps6594x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct tps6594x_gpio *gpio = gpiochip_get_data(gc);
+	int ret, val;
+
+	ret = regmap_read(gpio->tps->regmap, TPS6594X_GPIO1_CONF + offset, &val);
+	if (ret)
+		return ret;
+
+	if (val & GPIO_CFG_MASK)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int tps6594x_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct tps6594x_gpio *gpio = gpiochip_get_data(gc);
+
+	return regmap_update_bits(gpio->tps->regmap, TPS6594X_GPIO1_CONF + offset,
+				  GPIO_CFG_MASK, 0);
+}
+
+static int tps6594x_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct tps6594x_gpio *gpio = gpiochip_get_data(gc);
+	unsigned int reg = TPS6594X_GPIO_OUT_1, shift = offset;
+
+	if (shift >= NGPIOS_PER_REG) {
+		reg = TPS6594X_GPIO_OUT_2;
+		shift -= NGPIOS_PER_REG;
+	}
+
+	regmap_update_bits(gpio->tps->regmap, reg, BIT(shift), value ? BIT(shift) : 0);
+
+	return regmap_update_bits(gpio->tps->regmap, TPS6594X_GPIO1_CONF + offset,
+				  GPIO_CFG_MASK, GPIO_CFG_MASK);
+}
+
+static int tps6594x_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct tps6594x_gpio *gpio = gpiochip_get_data(gc);
+	unsigned int reg = TPS6594X_GPIO_IN_1;
+	int ret, val;
+
+	if (offset >= NGPIOS_PER_REG) {
+		reg = TPS6594X_GPIO_IN_2;
+		offset -= NGPIOS_PER_REG;
+	}
+
+	ret = regmap_read(gpio->tps->regmap, reg, &val);
+	if (ret)
+		return ret;
+
+	return !!(val & BIT(offset));
+}
+
+static void tps6594x_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int value)
+{
+	struct tps6594x_gpio *gpio = gpiochip_get_data(gc);
+	unsigned int reg = TPS6594X_GPIO_OUT_1;
+
+	if (offset >= NGPIOS_PER_REG) {
+		reg = TPS6594X_GPIO_OUT_2;
+		offset -= NGPIOS_PER_REG;
+	}
+
+	regmap_update_bits(gpio->tps->regmap, reg, BIT(offset), value ? BIT(offset) : 0);
+}
+
+static const struct gpio_chip template_chip = {
+	.label			= "tps6594x-gpio",
+	.owner			= THIS_MODULE,
+	.get_direction		= tps6594x_gpio_get_direction,
+	.direction_input	= tps6594x_gpio_direction_input,
+	.direction_output	= tps6594x_gpio_direction_output,
+	.get			= tps6594x_gpio_get,
+	.set			= tps6594x_gpio_set,
+	.base			= -1,
+	.ngpio			= 11,
+	.can_sleep		= true,
+};
+
+static int tps6594x_gpio_probe(struct platform_device *pdev)
+{
+	struct tps6594x *tps = dev_get_drvdata(pdev->dev.parent);
+	struct tps6594x_gpio *gpio;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->tps = dev_get_drvdata(pdev->dev.parent);
+	gpio->gpio_chip = template_chip;
+	gpio->gpio_chip.parent = tps->dev;
+
+	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
+}
+
+static const struct of_device_id of_tps6594x_gpio_match[] = {
+	{ .compatible = "ti,tps6594x-gpio", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_tps6594x_gpio_match);
+
+static struct platform_driver tps6594x_gpio_driver = {
+	.driver = {
+		.name = "tps6594x-gpio",
+		.of_match_table = of_match_ptr(of_tps6594x_gpio_match),
+	},
+	.probe = tps6594x_gpio_probe,
+};
+module_platform_driver(tps6594x_gpio_driver);
+
+MODULE_ALIAS("platform:tps6594x-gpio");
+MODULE_AUTHOR("Matt Ranostay <mranostay@ti.com>");
+MODULE_DESCRIPTION("TPS6594X GPIO driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/tps6594x.h b/include/linux/mfd/tps6594x.h
index 5a6af0da9223..c2440f5f43d3 100644
--- a/include/linux/mfd/tps6594x.h
+++ b/include/linux/mfd/tps6594x.h
@@ -21,6 +21,12 @@
 #define TPS6594X_FSM_I2C_TRIGGERS		0x85
 #define TPS6594X_FSM_NSLEEP_TRIGGERS		0x86
 
+#define TPS6594X_GPIO1_CONF			0x31
+#define TPS6594X_GPIO_OUT_1			0x3d
+#define TPS6594X_GPIO_OUT_2			0x3e
+#define TPS6594X_GPIO_IN_1			0x3f
+#define TPS6594X_GPIO_IN_2			0x40
+
 #define TPS6594X_RTC_SECONDS			0xb5
 #define TPS6594X_RTC_MINUTES			0xb6
 #define TPS6594X_RTC_HOURS			0xb7
-- 
2.38.GIT

