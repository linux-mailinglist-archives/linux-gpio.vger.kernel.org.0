Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25050212310
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2020 14:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgGBMSc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jul 2020 08:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728719AbgGBMSb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2020 08:18:31 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FB5C08C5C1;
        Thu,  2 Jul 2020 05:18:31 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 49yHF06CWrzQlGD;
        Thu,  2 Jul 2020 14:18:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1593692302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EIj20HX95snYmPG/7jI7KaQQOGUtgL8Mvme8Ks4nzhc=;
        b=HFEU1uQ8qzL873DN1bsMb8re2M5hjcviTD9RwTQEogPUdM47VnXEDmRoVnn2dFs55zjQmY
        DVxCJcYRAzffuICD+HTCoMnZbH9N1VYMiNBj2gajmdVwAPSvCHT/MRt1SpfgxXmueZ9/lw
        3rN7j1Bfy2ZE/ioR19wkwgnQrWlwRZ2Y31NMmj6gSzIeCj5ilnERLJPfbNmsZZGDLVZpL1
        KGWFbZERHXfyTIWHa+iaG3advmNmGYNxaS3dEoSBNbhkBse0OClUpD0Sr37bf/YX6hH2Ud
        p9DOtqPXciOozb5vyZO6ke8rDcBE+NPwMEs6i5E9eXDB46hEfhc+/6j4+37k9Q==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id XJvfdkuutk6U; Thu,  2 Jul 2020 14:18:20 +0200 (CEST)
From:   Sungbo Eo <mans0n@gorani.run>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v4 1/2] gpio: add GPO driver for PCA9570
Date:   Thu,  2 Jul 2020 21:17:22 +0900
Message-Id: <20200702121722.1121468-1-mans0n@gorani.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 4
X-Rspamd-Score: 0.72 / 15.00 / 15.00
X-Rspamd-Queue-Id: 498741791
X-Rspamd-UID: 0ff4fe
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

NXP PCA9570 is 4-bit I2C GPO expander without interrupt functionality.
Its ports are controlled only by a data byte without register address.

As there is no other driver similar enough to be adapted for it, a new
driver is introduced here.

Signed-off-by: Sungbo Eo <mans0n@gorani.run>
---
v4:
* removed ->direction_input() and ->direction_output()
  (Seems unnecessary to me)
* removed ->set_multiple()
  (I'm not sure this implementation is really correct)
* added ->get()
  (DS says we can read the status from the device)
* read current status during probe

v3:
* remove mutex
* rename buffer to out
* simplify return statements
* replace ->probe() to ->probe_new()
* move ngpio to driver_data
  (PCA9571 is 8-bit so I thought making ngpio configurable is a good idea)

v2:
* move the direction functions below the set functions
* use devm_gpiochip_add_data() and remove the remove callback

v1:
Tested in kernel 5.4 on an ipq40xx platform.

This is my first time submitting a whole driver patch, and I'm not really
familiar with this PCA expander series.
Please let me know how I can improve this patch further.

FYI there's an unmerged patch for this chip.
http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2017-May/105602.html
I don't have PCA9571 either so I didn't add support for it.
---
 drivers/gpio/Kconfig        |   8 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-pca9570.c | 138 ++++++++++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 drivers/gpio/gpio-pca9570.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c6b5c65c8405..d10dcb81b841 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -962,6 +962,14 @@ config GPIO_PCA953X_IRQ
 	  Say yes here to enable the pca953x to be used as an interrupt
 	  controller. It requires the driver to be built in the kernel.
 
+config GPIO_PCA9570
+	tristate "PCA9570 4-Bit I2C GPO expander"
+	help
+	  Say yes here to enable the GPO driver for the NXP PCA9570 chip.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-pca9570.
+
 config GPIO_PCF857X
 	tristate "PCF857x, PCA{85,96}7x, and MAX732[89] I2C GPIO expanders"
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1e4894e0bf0f..33cb40c28a61 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -110,6 +110,7 @@ obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
 obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
 obj-$(CONFIG_GPIO_PCA953X)		+= gpio-pca953x.o
+obj-$(CONFIG_GPIO_PCA9570)		+= gpio-pca9570.o
 obj-$(CONFIG_GPIO_PCF857X)		+= gpio-pcf857x.o
 obj-$(CONFIG_GPIO_PCH)			+= gpio-pch.o
 obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
new file mode 100644
index 000000000000..fc031f2f03c8
--- /dev/null
+++ b/drivers/gpio/gpio-pca9570.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for PCA9570 I2C GPO expander
+ *
+ * Copyright (C) 2020 Sungbo Eo <mans0n@gorani.run>
+ *
+ * Based on gpio-tpic2810.c
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+
+/**
+ * struct pca9570 - GPIO driver data
+ * @chip: GPIO controller chip
+ * @client: I2C device pointer
+ * @out: Buffer for device register
+ */
+struct pca9570 {
+	struct gpio_chip chip;
+	struct i2c_client *client;
+	u8 out;
+};
+
+static int pca9570_read(struct pca9570 *gpio, u8 *value)
+{
+	s32 ret;
+
+	ret = i2c_smbus_read_byte(gpio->client);
+	if (ret < 0)
+		return ret;
+
+	*value = (u8)ret;
+	return 0;
+}
+
+static int pca9570_write(struct pca9570 *gpio, u8 value)
+{
+	return i2c_smbus_write_byte(gpio->client, value);
+}
+
+static int pca9570_get_direction(struct gpio_chip *chip,
+				 unsigned offset)
+{
+	/* This device always output */
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int pca9570_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct pca9570 *gpio = gpiochip_get_data(chip);
+	u8 buffer;
+	int ret;
+
+	ret = pca9570_read(gpio, &buffer);
+	if (ret)
+		return ret;
+
+	return !!(buffer & BIT(offset));
+}
+
+static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	struct pca9570 *gpio = gpiochip_get_data(chip);
+	u8 buffer = gpio->out;
+	int ret;
+
+	if (value)
+		buffer |= BIT(offset);
+	else
+		buffer &= ~BIT(offset);
+
+	ret = pca9570_write(gpio, buffer);
+	if (ret)
+		return;
+
+	gpio->out = buffer;
+}
+
+static const struct gpio_chip template_chip = {
+	.label			= "pca9570",
+	.owner			= THIS_MODULE,
+	.get_direction		= pca9570_get_direction,
+	.get			= pca9570_get,
+	.set			= pca9570_set,
+	.base			= -1,
+	.can_sleep		= true,
+};
+
+static const struct i2c_device_id pca9570_id_table[] = {
+	{ "pca9570", 4 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
+
+static const struct of_device_id pca9570_of_match_table[] = {
+	{ .compatible = "nxp,pca9570" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
+
+static int pca9570_probe(struct i2c_client *client)
+{
+	struct pca9570 *gpio;
+
+	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->chip = template_chip;
+	gpio->chip.parent = &client->dev;
+	gpio->chip.ngpio = i2c_match_id(pca9570_id_table, client)->driver_data;
+	gpio->client = client;
+
+	/* Read the current output level */
+	(void) pca9570_read(gpio, &gpio->out);
+
+	i2c_set_clientdata(client, gpio);
+
+	return devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);
+}
+
+static struct i2c_driver pca9570_driver = {
+	.driver = {
+		.name = "pca9570",
+		.of_match_table = pca9570_of_match_table,
+	},
+	.probe_new = pca9570_probe,
+	.id_table = pca9570_id_table,
+};
+module_i2c_driver(pca9570_driver);
+
+MODULE_AUTHOR("Sungbo Eo <mans0n@gorani.run>");
+MODULE_DESCRIPTION("GPIO expander driver for PCA9570");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

