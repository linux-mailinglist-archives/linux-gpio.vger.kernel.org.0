Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595C820F916
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 18:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgF3QIM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 12:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgF3QIM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 12:08:12 -0400
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050::465:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD965C061755;
        Tue, 30 Jun 2020 09:08:11 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 49x8Qy0JG5zKm5q;
        Tue, 30 Jun 2020 18:08:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1593533287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bukBcr3BI9HeIa7CGu/rD17u7w+04aytazFoytLYkkA=;
        b=Uql6MpZOM8Sf2yldrDP0RUWXlzyi9fJF+eKKl25JNp4f1BIAgaf+x4BZqsCv7n14rldQYA
        xGuU7nvNrc1H9NY8MVCPw12+yXOpDjFE666RZmWLphqe5mLzRF0EkAmnzupGvJBGWT1ZuE
        Ie2uWOvmy5EHy7wWstww3elStZX+fQZvluzkUquCbSBIpLzX15Y4XQRwyvuO0rLcj/WOQU
        ZFBBxz8SpgH6hPxKnLqZhutYINM0bNxMXAuh04V3YYNBxRi8Nf9hDIQyZj0pSp8t30kXd8
        dy8DV/qAUTZxxiSKFqKgwWVdctgyKj7J83Wj6n5CIimzE6uwpnEFr2eihlRTEQ==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id LHHoUNE662Zk; Tue, 30 Jun 2020 18:08:05 +0200 (CEST)
From:   Sungbo Eo <mans0n@gorani.run>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v3 1/2] gpio: add GPO driver for PCA9570
Date:   Wed,  1 Jul 2020 01:07:36 +0900
Message-Id: <20200630160736.1196697-1-mans0n@gorani.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 6
X-Rspamd-Score: 0.98 / 15.00 / 15.00
X-Rspamd-Queue-Id: A4FF31738
X-Rspamd-UID: 463fb2
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
 drivers/gpio/gpio-pca9570.c | 131 ++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+)
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
index 000000000000..3898d1c6f407
--- /dev/null
+++ b/drivers/gpio/gpio-pca9570.c
@@ -0,0 +1,131 @@
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
+static void pca9570_set_mask_bits(struct gpio_chip *chip, u8 mask, u8 bits)
+{
+	struct pca9570 *gpio = gpiochip_get_data(chip);
+	u8 buffer;
+	int err;
+
+	buffer = (gpio->out & ~mask) | (bits & mask);
+
+	err = i2c_smbus_write_byte(gpio->client, buffer);
+	if (err)
+		return;
+
+	gpio->out = buffer;
+}
+
+static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	pca9570_set_mask_bits(chip, BIT(offset), value ? BIT(offset) : 0);
+}
+
+static void pca9570_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				 unsigned long *bits)
+{
+	pca9570_set_mask_bits(chip, *mask, *bits);
+}
+
+static int pca9570_get_direction(struct gpio_chip *chip,
+				 unsigned offset)
+{
+	/* This device always output */
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int pca9570_direction_input(struct gpio_chip *chip,
+				   unsigned offset)
+{
+	/* This device is output only */
+	return -EINVAL;
+}
+
+static int pca9570_direction_output(struct gpio_chip *chip,
+				    unsigned offset, int value)
+{
+	/* This device always output */
+	pca9570_set(chip, offset, value);
+	return 0;
+}
+
+static const struct gpio_chip template_chip = {
+	.label			= "pca9570",
+	.owner			= THIS_MODULE,
+	.get_direction		= pca9570_get_direction,
+	.direction_input	= pca9570_direction_input,
+	.direction_output	= pca9570_direction_output,
+	.set			= pca9570_set,
+	.set_multiple		= pca9570_set_multiple,
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
+
+	gpio->client = client;
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

