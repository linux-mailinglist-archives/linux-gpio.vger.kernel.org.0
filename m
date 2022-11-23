Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 906F8634FA5
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 06:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235718AbiKWFgH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 00:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiKWFgG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 00:36:06 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F75A8220E;
        Tue, 22 Nov 2022 21:36:05 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AN5ZvWT069671;
        Tue, 22 Nov 2022 23:35:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1669181758;
        bh=NdO5jA3a9LFnnECIA7JkH+5Zum+nigvcUum3+kHD5KU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=bLxgDAwOfyX3N40QnVDrriHadmNhCnNCO6SZY+x2/EPtJxOL5pUE7rvfqiaiJoY5A
         WtY7hQ0eJRECEZhDwYORQR5MsTxFyE7r+o3hqOTSlQWD3QSUANS9U76pqs/dY307mU
         qPCfrTTzh0sE7BN9ZJy15TDKmwWGzTxdGsCJRdNA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AN5ZvM2047985
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Nov 2022 23:35:57 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 22
 Nov 2022 23:35:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 22 Nov 2022 23:35:57 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AN5Zs96119355;
        Tue, 22 Nov 2022 23:35:56 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <michael@walle.cc>, <vigneshr@ti.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v5 4/4] gpio: gpio-tps6594: add GPIO support for TPS6594 PMIC
Date:   Tue, 22 Nov 2022 21:35:12 -0800
Message-ID: <20221123053512.1195309-5-mranostay@ti.com>
X-Mailer: git-send-email 2.38.GIT
In-Reply-To: <20221123053512.1195309-1-mranostay@ti.com>
References: <20221123053512.1195309-1-mranostay@ti.com>
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

Add support for TPS6594 PMICs GPIO interface that has 11 that can be
configured as input or outputs.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 drivers/gpio/Kconfig        |  9 +++++
 drivers/gpio/Makefile       |  1 +
 drivers/gpio/gpio-tps6594.c | 78 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps6594.h |  4 ++
 4 files changed, 92 insertions(+)
 create mode 100644 drivers/gpio/gpio-tps6594.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ec7cfd4f52b1..f34b3746075a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1405,6 +1405,15 @@ config GPIO_TPS65912
 	help
 	  This driver supports TPS65912 GPIO chip.
 
+config GPIO_TPS6594
+	tristate "TI TPS6594 GPIO driver"
+	depends on MFD_TPS6594 || COMPILE_TEST
+	select REGMAP
+	select GPIO_REGMAP
+	help
+	  Select this option to enable GPIO driver for the TPS6954
+	  PMIC chip family. There are 11 GPIOs that can be configured.
+
 config GPIO_TPS68470
 	tristate "TPS68470 GPIO"
 	depends on INTEL_SKL_INT3472
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 010587025fc8..31bef1cc112f 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -159,6 +159,7 @@ obj-$(CONFIG_GPIO_TPS65218)		+= gpio-tps65218.o
 obj-$(CONFIG_GPIO_TPS6586X)		+= gpio-tps6586x.o
 obj-$(CONFIG_GPIO_TPS65910)		+= gpio-tps65910.o
 obj-$(CONFIG_GPIO_TPS65912)		+= gpio-tps65912.o
+obj-$(CONFIG_GPIO_TPS6594)		+= gpio-tps6594.o
 obj-$(CONFIG_GPIO_TPS68470)		+= gpio-tps68470.o
 obj-$(CONFIG_GPIO_TQMX86)		+= gpio-tqmx86.o
 obj-$(CONFIG_GPIO_TS4800)		+= gpio-ts4800.o
diff --git a/drivers/gpio/gpio-tps6594.c b/drivers/gpio/gpio-tps6594.c
new file mode 100644
index 000000000000..983c37a77266
--- /dev/null
+++ b/drivers/gpio/gpio-tps6594.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPIO driver for TI TPS6594 PMICs
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
+#include <linux/mfd/tps6594.h>
+
+#define GPIO_BANK_SIZE	8
+#define GPIO_CFG_MASK	BIT(0)
+
+static int tps6594_regmap_xlate(struct gpio_regmap *gpio,
+				    unsigned int base, unsigned int offset,
+				    unsigned int *reg, unsigned int *mask)
+{
+	if (base == TPS6594_GPIO_CONF) {
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
+static int tps6594_gpio_probe(struct platform_device *pdev)
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
+	config.reg_dat_base = TPS6594_GPIO_IN;
+	config.reg_set_base = TPS6594_GPIO_OUT;
+	config.reg_dir_out_base = TPS6594_GPIO_CONF;
+	config.reg_mask_xlate = tps6594_regmap_xlate;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
+}
+
+static const struct of_device_id of_tps6594_gpio_match[] = {
+	{ .compatible = "ti,tps6594-gpio", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_tps6594_gpio_match);
+
+static struct platform_driver tps6594_gpio_driver = {
+	.driver = {
+		.name = "tps6594-gpio",
+		.of_match_table = of_tps6594_gpio_match,
+	},
+	.probe = tps6594_gpio_probe,
+};
+module_platform_driver(tps6594_gpio_driver);
+
+MODULE_ALIAS("platform:tps6594-gpio");
+MODULE_AUTHOR("Matt Ranostay <mranostay@ti.com>");
+MODULE_DESCRIPTION("TPS6594 GPIO driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/tps6594.h b/include/linux/mfd/tps6594.h
index f721ec9880dd..758b1bc44178 100644
--- a/include/linux/mfd/tps6594.h
+++ b/include/linux/mfd/tps6594.h
@@ -21,6 +21,10 @@
 #define TPS6594_FSM_I2C_TRIGGERS		0x85
 #define TPS6594_FSM_NSLEEP_TRIGGERS		0x86
 
+#define TPS6594_GPIO_CONF			0x31
+#define TPS6594_GPIO_OUT			0x3d
+#define TPS6594_GPIO_IN			0x3f
+
 #define TPS6594_RTC_SECONDS			0xb5
 #define TPS6594_RTC_MINUTES			0xb6
 #define TPS6594_RTC_HOURS			0xb7
-- 
2.38.GIT

