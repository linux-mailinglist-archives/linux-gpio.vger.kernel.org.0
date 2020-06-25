Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD589209ADC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 09:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390224AbgFYH6d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 03:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgFYH6d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 03:58:33 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA916C061573;
        Thu, 25 Jun 2020 00:58:32 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 49sspF3NPCzQlBc;
        Thu, 25 Jun 2020 09:58:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1593071907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=JpJXxQs6zbhQxeu2G4ZNxYmO47LAD2sZeqMehItYaoc=;
        b=gUoC8vvPvtWFcEKVscYisoMq9g0lAjDHn50Kb+oAuBCDinBnfRt9QVGxny9iDEABJL/76l
        1dpdowYpo3ATGqicRSHZH4WI7jU9U+6SHiiEhnaQ+ANfC0ElSyXc5FGDBCC/2Y0TbLQ/sZ
        HtaGIE0NqZElgLxjLpC8EVuqqywTI+P6EeQVtuxHsddgIhqXDCkQ4U0iEauTrw6A7275sq
        JlJaopmUBzZT0IuzxaDmFMit8aEL+RvjBicyE+YgTXP3ssnIy6szWgaQr7/SmzNIUPWsZx
        7z/Pz+rrisxwdrL2N/9N8OQ/8DrsGFrzqjClZbM6kKomON8vZ571PUCSYLVNhA==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id y5lpYIbug6eb; Thu, 25 Jun 2020 09:58:25 +0200 (CEST)
From:   Sungbo Eo <mans0n@gorani.run>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v2 1/2] gpio: add GPO driver for PCA9570
Date:   Thu, 25 Jun 2020 16:58:05 +0900
Message-Id: <20200625075805.363918-1-mans0n@gorani.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -0.52 / 15.00 / 15.00
X-Rspamd-Queue-Id: 1E6E3181C
X-Rspamd-UID: 22dd90
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
v2:
* move the direction functions below the set functions
* use devm_gpiochip_add_data() and remove the remove callback

v1:
Tested in kernel 5.4 on an ipq40xx platform.

This is my first time submitting a whole driver patch, and I'm not really familiar with this PCA expander series.
Please let me know how I can improve this patch further.

FYI there's an unmerged patch for this chip.
http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2017-May/105602.html
I don't have PCA9571 either so I didn't add support for it.
---
 drivers/gpio/Kconfig        |   8 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-pca9570.c | 148 ++++++++++++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
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
index 000000000000..e6b6c4e791c0
--- /dev/null
+++ b/drivers/gpio/gpio-pca9570.c
@@ -0,0 +1,148 @@
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
+#include <linux/mutex.h>
+
+/**
+ * struct pca9570 - GPIO driver data
+ * @chip: GPIO controller chip
+ * @client: I2C device pointer
+ * @buffer: Buffer for device register
+ * @lock: Protects write sequences
+ */
+struct pca9570 {
+	struct gpio_chip chip;
+	struct i2c_client *client;
+	u8 buffer;
+	struct mutex lock;
+};
+
+static void pca9570_set_mask_bits(struct gpio_chip *chip, u8 mask, u8 bits)
+{
+	struct pca9570 *gpio = gpiochip_get_data(chip);
+	u8 buffer;
+	int err;
+
+	mutex_lock(&gpio->lock);
+
+	buffer = gpio->buffer & ~mask;
+	buffer |= (mask & bits);
+
+	err = i2c_smbus_write_byte(gpio->client, buffer);
+	if (!err)
+		gpio->buffer = buffer;
+
+	mutex_unlock(&gpio->lock);
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
+	.ngpio			= 4,
+	.can_sleep		= true,
+};
+
+static const struct of_device_id pca9570_of_match_table[] = {
+	{ .compatible = "nxp,pca9570" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
+
+static int pca9570_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct pca9570 *gpio;
+	int ret;
+
+	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, gpio);
+
+	gpio->chip = template_chip;
+	gpio->chip.parent = &client->dev;
+
+	gpio->client = client;
+
+	mutex_init(&gpio->lock);
+
+	ret = devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);
+	if (ret < 0) {
+		dev_err(&client->dev, "Unable to register gpiochip\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id pca9570_id_table[] = {
+	{ "pca9570", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
+
+static struct i2c_driver pca9570_driver = {
+	.driver = {
+		.name = "pca9570",
+		.of_match_table = pca9570_of_match_table,
+	},
+	.probe = pca9570_probe,
+	.remove = pca9570_remove,
+	.id_table = pca9570_id_table,
+};
+module_i2c_driver(pca9570_driver);
+
+MODULE_AUTHOR("Sungbo Eo <mans0n@gorani.run>");
+MODULE_DESCRIPTION("GPIO expander driver for PCA9570");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

