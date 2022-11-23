Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF433634FA9
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 06:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbiKWFgJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 00:36:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiKWFgI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 00:36:08 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0419FF1D87;
        Tue, 22 Nov 2022 21:36:06 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AN5ZkKA115327;
        Tue, 22 Nov 2022 23:35:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1669181746;
        bh=tA1+Xm5vcxi2u2VEj2z6DAUNH7zFuQWnUWprauTHUXU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=G7HITg7IH3VEdvObsqvZSTsqayblNeXA0xUNYazFzKkE3CPcPhIGc3q3aIgg2JlH/
         Rhhm5r5HZbn8JQXI1nQpkpUEiQ0jWLiYAxOQ8fv4o+47c2yH6679AydgOdNwSYcAMa
         GH4Ft5gpAFsU9lWXFX44Lw+WVWfNsoR5z729FLrs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AN5ZkIw047938
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Nov 2022 23:35:46 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 22
 Nov 2022 23:35:46 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 22 Nov 2022 23:35:46 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AN5Zgav112779;
        Tue, 22 Nov 2022 23:35:44 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <michael@walle.cc>, <vigneshr@ti.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, Keerthy <j-keerthy@ti.com>,
        Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v5 2/4] mfd: tps6594: Add support for TPS6594 PMIC devices
Date:   Tue, 22 Nov 2022 21:35:10 -0800
Message-ID: <20221123053512.1195309-3-mranostay@ti.com>
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

From: Keerthy <j-keerthy@ti.com>

The TPS6594 chip is a PMIC, and contains the following components:

- GPIO controller
- RTC

Signed-off-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 drivers/mfd/Kconfig         |  14 +++++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/tps6594.c       | 113 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps6594.h |  84 +++++++++++++++++++++++++++
 4 files changed, 212 insertions(+)
 create mode 100644 drivers/mfd/tps6594.c
 create mode 100644 include/linux/mfd/tps6594.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6653d03e0fe3..c54f2959a200 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1596,6 +1596,20 @@ config MFD_TI_LP873X
 	  This driver can also be built as a module. If so, the module
 	  will be called lp873x.
 
+config MFD_TPS6594
+	tristate "TI TPS6594 Power Management IC"
+	depends on I2C && OF
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  If you say yes here then you get support for the TPS6594 series of
+	  Power Management Integrated Circuits (PMIC).
+	  These include voltage regulators, RTS, configurable
+	  General Purpose Outputs (GPO) that are used in portable devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tps6594.
+
 config MFD_TI_LP87565
 	tristate "TI LP87565 Power Management IC"
 	depends on I2C && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 4dd479212b3a..b4fdfcc57831 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_MFD_TPS65910)	+= tps65910.o
 obj-$(CONFIG_MFD_TPS65912)	+= tps65912-core.o
 obj-$(CONFIG_MFD_TPS65912_I2C)	+= tps65912-i2c.o
 obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
+obj-$(CONFIG_MFD_TPS6594)	+= tps6594.o
 obj-$(CONFIG_MENELAUS)		+= menelaus.o
 
 obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
diff --git a/drivers/mfd/tps6594.c b/drivers/mfd/tps6594.c
new file mode 100644
index 000000000000..a7f80833e8fc
--- /dev/null
+++ b/drivers/mfd/tps6594.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for TPS6594 PMIC chips
+ *
+ * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com/
+ * Author: Keerthy <j-keerthy@ti.com>
+ */
+
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/tps6594.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+static const struct regmap_config tps6594_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = TPS6594_REG_MAX,
+};
+
+static const struct mfd_cell tps6594_cells[] = {
+	{ .name = "tps6594-gpio" },
+	{ .name = "tps6594-rtc" },
+};
+
+static struct tps6594 *tps;
+
+static void tps6594_power_off(void)
+{
+	regmap_write(tps->regmap, TPS6594_FSM_NSLEEP_TRIGGERS,
+		TPS6594_FSM_NSLEEP_NSLEEP1B | TPS6594_FSM_NSLEEP_NSLEEP2B);
+
+	regmap_write(tps->regmap, TPS6594_INT_STARTUP,
+		TPS6594_INT_STARTUP_NPWRON_START_INT |
+		TPS6594_INT_STARTUP_ENABLE_INT | TPS6594_INT_STARTUP_RTC_INT |
+		TPS6594_INT_STARTUP_SOFT_REBOOT_INT);
+
+	regmap_write(tps->regmap, TPS6594_INT_MISC,
+		TPS6594_INT_MISC_BIST_PASS_INT |
+		TPS6594_INT_MISC_EXT_CLK_INT | TPS6594_INT_MISC_TWARN_INT);
+
+	regmap_write(tps->regmap, TPS6594_CONFIG_1,
+		TPS6594_CONFIG_NSLEEP1_MASK | TPS6594_CONFIG_NSLEEP2_MASK);
+
+	regmap_write(tps->regmap, TPS6594_FSM_I2C_TRIGGERS,
+		TPS6594_FSM_I2C_TRIGGERS_I2C0);
+}
+
+static int tps6594_probe(struct i2c_client *client)
+{
+	struct tps6594 *ddata;
+	struct device_node *node = client->dev.of_node;
+	unsigned int otpid;
+	int ret;
+
+	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->dev = &client->dev;
+
+	ddata->regmap = devm_regmap_init_i2c(client, &tps6594_regmap_config);
+	if (IS_ERR(ddata->regmap))
+		return dev_err_probe(ddata->dev, PTR_ERR(ddata->regmap),
+			"Failed to initialize register map\n");
+
+	ret = regmap_read(ddata->regmap, TPS6594_REG_DEV_REV, &otpid);
+	if (ret)
+		return dev_err_probe(ddata->dev, ret, "Failed to read OTP ID\n");
+
+	ddata->rev = otpid;
+	i2c_set_clientdata(client, ddata);
+
+	ret = mfd_add_devices(ddata->dev, PLATFORM_DEVID_AUTO, tps6594_cells,
+			      ARRAY_SIZE(tps6594_cells), NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(ddata->dev, ret, "Failed to register cells\n");
+
+	tps = ddata;
+
+	if (of_property_read_bool(node, "ti,system-power-controller"))
+		pm_power_off = tps6594_power_off;
+
+	return 0;
+}
+
+static const struct of_device_id of_tps6594_match_table[] = {
+	{ .compatible = "ti,tps6594", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_tps6594_match_table);
+
+static const struct i2c_device_id tps6594_id_table[] = {
+	{ "tps6594", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tps6594_id_table);
+
+static struct i2c_driver tps6594_driver = {
+	.driver	= {
+		.name	= "tps6594",
+		.of_match_table = of_tps6594_match_table,
+	},
+	.probe_new	= tps6594_probe,
+	.id_table	= tps6594_id_table,
+};
+module_i2c_driver(tps6594_driver);
+
+MODULE_AUTHOR("J Keerthy <j-keerthy@ti.com>");
+MODULE_DESCRIPTION("TPS6594 PMIC device driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/tps6594.h b/include/linux/mfd/tps6594.h
new file mode 100644
index 000000000000..f721ec9880dd
--- /dev/null
+++ b/include/linux/mfd/tps6594.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Core driver interface for TI TPS6594 PMIC family
+ *
+ * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#ifndef __MFD_TPS6594_H
+#define __MFD_TPS6594_H
+
+#include <linux/bits.h>
+
+/* TPS6594 chip ID list */
+#define TPS6594			0x00
+
+/* All register addresses */
+#define TPS6594_REG_DEV_REV			0x01
+#define TPS6594_INT_STARTUP			0x65
+#define TPS6594_INT_MISC			0x66
+#define TPS6594_CONFIG_1			0x7d
+#define TPS6594_FSM_I2C_TRIGGERS		0x85
+#define TPS6594_FSM_NSLEEP_TRIGGERS		0x86
+
+#define TPS6594_RTC_SECONDS			0xb5
+#define TPS6594_RTC_MINUTES			0xb6
+#define TPS6594_RTC_HOURS			0xb7
+#define TPS6594_RTC_DAYS			0xb8
+#define TPS6594_RTC_MONTHS			0xb9
+#define TPS6594_RTC_YEARS			0xba
+#define TPS6594_RTC_WEEKS			0xbb
+#define TPS6594_ALARM_SECONDS			0xbc
+#define TPS6594_ALARM_MINUTES			0xbd
+#define TPS6594_ALARM_HOURS			0xbe
+#define TPS6594_ALARM_DAYS			0xbf
+#define TPS6594_ALARM_MONTHS			0xc0
+#define TPS6594_ALARM_YEARS			0xc1
+#define TPS6594_RTC_CTRL_1			0xc2
+#define TPS6594_RTC_CTRL_2			0xc3
+#define TPS6594_RTC_STATUS			0xc4
+#define TPS6594_RTC_INTERRUPTS			0xc5
+#define TPS6594_REG_MAX			0xd0
+
+/* Register field definitions */
+#define TPS6594_DEV_REV_DEV_ID			0xff
+
+#define TPS6594_INT_STARTUP_NPWRON_START_INT	BIT(0)
+#define TPS6594_INT_STARTUP_ENABLE_INT		BIT(1)
+#define TPS6594_INT_STARTUP_RTC_INT		BIT(2)
+#define TPS6594_INT_STARTUP_FSD_INT		BIT(4)
+#define TPS6594_INT_STARTUP_SOFT_REBOOT_INT	BIT(5)
+
+#define TPS6594_INT_MISC_BIST_PASS_INT		BIT(0)
+#define TPS6594_INT_MISC_EXT_CLK_INT		BIT(1)
+#define TPS6594_INT_MISC_TWARN_INT		BIT(3)
+
+#define TPS6594_CONFIG_NSLEEP1_MASK		BIT(6)
+#define TPS6594_CONFIG_NSLEEP2_MASK		BIT(7)
+
+#define TPS6594_FSM_I2C_TRIGGERS_I2C0		BIT(0)
+
+#define TPS6594_FSM_NSLEEP_NSLEEP1B		BIT(0)
+#define TPS6594_FSM_NSLEEP_NSLEEP2B		BIT(1)
+
+#define TPS6594_RTC_CTRL_REG_GET_TIME		BIT(6)
+#define TPS6594_RTC_CTRL_REG_STOP_RTC		BIT(0)
+#define TPS6594_RTC_INTERRUPTS_REG_IT_ALARM	BIT(3)
+
+#define TPS6594_RTC_STATUS_RUN			BIT(1)
+
+/**
+ * struct tps6594 - state holder for the tps6594 driver
+ * @dev: struct device pointer for MFD device
+ * @rev: revision of the tps6594
+ * @lock: lock guarding the data structure
+ * @regmap: register map of the tps6594 PMIC
+ *
+ * Device data may be used to access the TPS6594 chip
+ */
+struct tps6594 {
+	struct device *dev;
+	u8 rev;
+	struct regmap *regmap;
+};
+#endif /* __MFD_TPS6594_H */
-- 
2.38.GIT

