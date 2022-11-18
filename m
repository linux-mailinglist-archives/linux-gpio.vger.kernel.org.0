Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512D862F10F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 10:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241368AbiKRJXG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 04:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241427AbiKRJXF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 04:23:05 -0500
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A97815718;
        Fri, 18 Nov 2022 01:23:04 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AI9Mh7c089012;
        Fri, 18 Nov 2022 03:22:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1668763363;
        bh=YfY1G9SWBu/P/IsT935fulLEbwN9xeyiglcojcgB5MM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dcBbOq0IdS2GMqWulF8I+T0KHbW/ov8mDlGX72GUDlMIh3IsPNr79ReOQn7XiZ8cs
         e15TgmOoWnKHAinalJh93Xk4gDs4jjt1zqD0ru1hEoeflVC3pk071PHyKqRd3MqRK6
         OkVkwkCTNrQFt2KEPaluZD4opE4nwUkW7/l0adio=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AI9Mhlp029997
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Nov 2022 03:22:43 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 18
 Nov 2022 03:22:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 18 Nov 2022 03:22:42 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AI9Mdbb060374;
        Fri, 18 Nov 2022 03:22:41 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <vigneshr@ti.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v4 4/4] gpio: gpio-tps6594x: add GPIO support for TPS6594x PMIC
Date:   Fri, 18 Nov 2022 01:22:18 -0800
Message-ID: <20221118092218.480147-5-mranostay@ti.com>
X-Mailer: git-send-email 2.38.GIT
In-Reply-To: <20221118092218.480147-1-mranostay@ti.com>
References: <20221118092218.480147-1-mranostay@ti.com>
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

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 drivers/gpio/Kconfig         |  9 +++++
 drivers/gpio/Makefile        |  1 +
 drivers/gpio/gpio-tps6594x.c | 78 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps6594x.h |  4 ++
 4 files changed, 92 insertions(+)
 create mode 100644 drivers/gpio/gpio-tps6594x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ec7cfd4f52b1..6b65c790efe7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1405,6 +1405,15 @@ config GPIO_TPS65912
 	help
 	  This driver supports TPS65912 GPIO chip.
 
+config GPIO_TPS6594X
+	tristate "TI TPS6594X GPIO driver"
+	depends on MFD_TPS6594X || COMPILE_TEST
+	select REGMAP
+	select GPIO_REGMAP
+	help
+	  Select this option to enable GPIO driver for the TPS6954X
+	  PMIC chip family. There are 11 GPIOs that can be configured.
+
 config GPIO_TPS68470
 	tristate "TPS68470 GPIO"
 	depends on INTEL_SKL_INT3472
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 010587025fc8..9892f9adc5b5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -159,6 +159,7 @@ obj-$(CONFIG_GPIO_TPS65218)		+= gpio-tps65218.o
 obj-$(CONFIG_GPIO_TPS6586X)		+= gpio-tps6586x.o
 obj-$(CONFIG_GPIO_TPS65910)		+= gpio-tps65910.o
 obj-$(CONFIG_GPIO_TPS65912)		+= gpio-tps65912.o
+obj-$(CONFIG_GPIO_TPS6594X)		+= gpio-tps6594x.o
 obj-$(CONFIG_GPIO_TPS68470)		+= gpio-tps68470.o
 obj-$(CONFIG_GPIO_TQMX86)		+= gpio-tqmx86.o
 obj-$(CONFIG_GPIO_TS4800)		+= gpio-ts4800.o
diff --git a/drivers/gpio/gpio-tps6594x.c b/drivers/gpio/gpio-tps6594x.c
new file mode 100644
index 000000000000..733fedba70cb
--- /dev/null
+++ b/drivers/gpio/gpio-tps6594x.c
@@ -0,0 +1,78 @@
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
+#include <linux/gpio/regmap.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/tps6594x.h>
+
+#define GPIO_BANK_SIZE	8
+#define GPIO_CFG_MASK	BIT(0)
+
+static int tps6594x_regmap_xlate(struct gpio_regmap *gpio,
+				    unsigned int base, unsigned int offset,
+				    unsigned int *reg, unsigned int *mask)
+{
+	if (base == TPS6594X_GPIO_CONF) {
+		*reg = base + offset;
+		*mask = GPIO_CFG_MASK;
+	} else {
+		unsigned int line = offset % GPIO_BANK_SIZE;
+		unsigned int stride = offset / GPIO_BANK_SIZE;
+
+		*reg = base + stride;
+		*mask = BIT(line);
+	}
+
+	return 0;
+}
+
+static int tps6594x_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_regmap_config config = {0};
+	struct regmap *regmap;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	config.regmap = regmap;
+	config.parent = &pdev->dev;
+	config.ngpio = 11;
+	config.ngpio_per_reg = GPIO_BANK_SIZE;
+
+	config.reg_dat_base = TPS6594X_GPIO_IN;
+	config.reg_set_base = TPS6594X_GPIO_OUT;
+	config.reg_dir_out_base = TPS6594X_GPIO_CONF;
+	config.reg_mask_xlate = tps6594x_regmap_xlate;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
+}
+
+static const struct of_device_id of_tps6594x_gpio_match[] = {
+	{ .compatible = "ti,tps6594-gpio", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_tps6594x_gpio_match);
+
+static struct platform_driver tps6594x_gpio_driver = {
+	.driver = {
+		.name = "tps6594-gpio",
+		.of_match_table = of_tps6594x_gpio_match,
+	},
+	.probe = tps6594x_gpio_probe,
+};
+module_platform_driver(tps6594x_gpio_driver);
+
+MODULE_ALIAS("platform:tps6594-gpio");
+MODULE_AUTHOR("Matt Ranostay <mranostay@ti.com>");
+MODULE_DESCRIPTION("TPS6594X GPIO driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/tps6594x.h b/include/linux/mfd/tps6594x.h
index 5a6af0da9223..155618e4d5d0 100644
--- a/include/linux/mfd/tps6594x.h
+++ b/include/linux/mfd/tps6594x.h
@@ -21,6 +21,10 @@
 #define TPS6594X_FSM_I2C_TRIGGERS		0x85
 #define TPS6594X_FSM_NSLEEP_TRIGGERS		0x86
 
+#define TPS6594X_GPIO_CONF			0x31
+#define TPS6594X_GPIO_OUT			0x3d
+#define TPS6594X_GPIO_IN			0x3f
+
 #define TPS6594X_RTC_SECONDS			0xb5
 #define TPS6594X_RTC_MINUTES			0xb6
 #define TPS6594X_RTC_HOURS			0xb7
-- 
2.38.GIT

