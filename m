Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050EC765066
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 11:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbjG0Jz0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 05:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbjG0JzW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 05:55:22 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81CF118;
        Thu, 27 Jul 2023 02:55:19 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R6srq2027806;
        Thu, 27 Jul 2023 05:55:16 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3s36afngfg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Jul 2023 05:55:15 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 36R9tEoQ029483
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Jul 2023 05:55:14 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 27 Jul 2023 05:55:13 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 27 Jul 2023 05:55:13 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 27 Jul 2023 05:55:13 -0400
Received: from okan.localdomain ([10.158.19.61])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 36R9snRT029827;
        Thu, 27 Jul 2023 05:55:07 -0400
From:   Okan Sahin <okan.sahin@analog.com>
To:     <okan.sahin@analog.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/2] gpio: ds4520: Add ADI DS4520 GPIO Expander Support
Date:   Thu, 27 Jul 2023 12:54:30 +0300
Message-ID: <20230727095432.82591-3-okan.sahin@analog.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727095432.82591-1-okan.sahin@analog.com>
References: <20230727095432.82591-1-okan.sahin@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: GNeab-SzilAD6F6Hk4znl-MTF6719-9O
X-Proofpoint-ORIG-GUID: GNeab-SzilAD6F6Hk4znl-MTF6719-9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=853 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270087
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The DS4520 is a 9-bit nonvolatile (NV) I/O expander.
It offers users a digitally programmable alternative
to hardware jumpers and mechanical switches that are
being used to control digital logic node.

Signed-off-by: Okan Sahin <okan.sahin@analog.com>
---
 drivers/gpio/Kconfig       | 11 ++++++
 drivers/gpio/Makefile      |  1 +
 drivers/gpio/gpio-ds4520.c | 80 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 drivers/gpio/gpio-ds4520.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 13be729710f2..5f89e46d6411 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1000,6 +1000,17 @@ config GPIO_ADNP
 	  enough to represent all pins, but the driver will assume a
 	  register layout for 64 pins (8 registers).
 
+config GPIO_DS4520
+	tristate "DS4520 I2C GPIO expander"
+	select REGMAP_I2C
+	select GPIO_REGMAP
+	help
+	  GPIO driver for ADI DS4520 I2C-based GPIO expander.
+	  Say yes here to enable the GPIO driver for the ADI DS4520 chip.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-ds4520.
+
 config GPIO_GW_PLD
 	tristate "Gateworks PLD GPIO Expander"
 	depends on OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c048ba003367..6f8656d5d617 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_GPIO_DA9052)		+= gpio-da9052.o
 obj-$(CONFIG_GPIO_DA9055)		+= gpio-da9055.o
 obj-$(CONFIG_GPIO_DAVINCI)		+= gpio-davinci.o
 obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
+obj-$(CONFIG_GPIO_DS4520)		+= gpio-ds4520.o
 obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
 obj-$(CONFIG_GPIO_EM)			+= gpio-em.o
diff --git a/drivers/gpio/gpio-ds4520.c b/drivers/gpio/gpio-ds4520.c
new file mode 100644
index 000000000000..1903deaef3e9
--- /dev/null
+++ b/drivers/gpio/gpio-ds4520.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2023 Analog Devices, Inc.
+ * Driver for the DS4520 I/O Expander
+ */
+
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/i2c.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define DS4520_PULLUP0		0xF0
+#define DS4520_IO_CONTROL0	0xF2
+#define DS4520_IO_STATUS0	0xF8
+
+static const struct regmap_config ds4520_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int ds4520_gpio_probe(struct i2c_client *client)
+{
+	struct gpio_regmap_config config = { };
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+	u32 ngpio;
+	u32 base;
+	int ret;
+
+	ret = device_property_read_u32(dev, "reg", &base);
+	if (ret)
+		return dev_err_probe(dev, ret, "Missing 'reg' property.\n");
+
+	ret = device_property_read_u32(dev, "ngpios", &ngpio);
+	if (ret)
+		return dev_err_probe(dev, ret, "Missing 'ngpios' property.\n");
+
+	regmap = devm_regmap_init_i2c(client, &ds4520_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to allocate register map\n");
+
+	config.regmap = regmap;
+	config.parent = dev;
+	config.ngpio = ngpio;
+
+	config.reg_dat_base = base + DS4520_IO_STATUS0;
+	config.reg_set_base = base + DS4520_PULLUP0;
+	config.reg_dir_out_base = base + DS4520_IO_CONTROL0;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &config));
+}
+
+static const struct of_device_id ds4520_gpio_of_match_table[] = {
+	{ .compatible = "adi,ds4520-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ds4520_gpio_of_match_table);
+
+static const struct i2c_device_id ds4520_gpio_id_table[] = {
+	{ "ds4520-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ds4520_gpio_id_table);
+
+static struct i2c_driver ds4520_gpio_driver = {
+	.driver = {
+		.name = "ds4520-gpio",
+		.of_match_table = ds4520_gpio_of_match_table,
+	},
+	.probe = ds4520_gpio_probe,
+	.id_table = ds4520_gpio_id_table,
+};
+module_i2c_driver(ds4520_gpio_driver);
+
+MODULE_DESCRIPTION("DS4520 I/O Expander");
+MODULE_AUTHOR("Okan Sahin <okan.sahin@analog.com>");
+MODULE_LICENSE("GPL");
-- 
2.30.2

