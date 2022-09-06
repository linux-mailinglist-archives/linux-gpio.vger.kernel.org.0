Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDB925AE962
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 15:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240426AbiIFNUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 09:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240430AbiIFNUJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 09:20:09 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B4F6EF1B;
        Tue,  6 Sep 2022 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wo/EV7QqZ9QryOEWXm+SSe/wdGQZ2eAO7FaYnn8Qs8o=; b=VMHxy6pfNViSYdIn8hqdrS3UJD
        QvojdXLNUL1gy99dHM4avwcEY2Gx+CDlKa0Lu9GlrAJDJRCcsP0jrVEMi8wVpLcBX6uHPlUFwTsJZ
        nriEHEAxqQxBFH+i4j8LpZp5WjFvQbRNRbWnwAuJ6cJhMN6KXqSZQ2Lfc7syuSspNIicVJjRfpo/8
        gJ/6dZVlHxmAwUD/vecwdgpHiEn0FRw5UEt1+tFfREhPghrK6ZrYuWv/K5LbcXjAqZccggzeAtoTv
        Uz9y73AFjNVWTn4iMuzbhzi7Q4/V3dAp+5pweWHP9gWeXPNGGANhIcQUWgIM/0CJJguC99b+2hjpk
        Xbz1eMjQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58022 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1oVYUd-0003sU-Id; Tue, 06 Sep 2022 14:19:55 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1oVYUc-005Cme-SM; Tue, 06 Sep 2022 14:19:54 +0100
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From:   Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 6/7] gpio: Add new gpio-macsmc driver for Apple Macs
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oVYUc-005Cme-SM@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 06 Sep 2022 14:19:54 +0100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Hector Martin <marcan@marcan.st>

This driver implements the GPIO service on top of the SMC framework
on Apple Mac machines. In particular, these are the GPIOs present in the
PMU IC which are used to control power to certain on-board devices.

Although the underlying hardware supports various pin config settings
(input/output, open drain, etc.), this driver does not implement that
functionality and leaves it up to the firmware to configure things
properly. We also don't yet support interrupts/events. This is
sufficient for device power control, which is the only thing we need to
support at this point. More features will be implemented when needed.

To our knowledge, only Apple Silicon Macs implement this SMC feature.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/gpio/Kconfig       |  11 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-macsmc.c | 242 +++++++++++++++++++++++++++++++++++++
 3 files changed, 254 insertions(+)
 create mode 100644 drivers/gpio/gpio-macsmc.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0642f579196f..9b87f5ebe1b9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1292,6 +1292,17 @@ config GPIO_LP87565
 	  This driver can also be built as a module. If so, the module will be
 	  called gpio-lp87565.
 
+config GPIO_MACSMC
+	tristate "Apple Mac SMC GPIO"
+	depends on APPLE_SMC
+	default ARCH_APPLE
+	help
+	  Support for GPIOs controlled by the SMC microcontroller on Apple Mac
+	  systems.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called gpio-macsmc.
+
 config GPIO_MADERA
 	tristate "Cirrus Logic Madera class codecs"
 	depends on PINCTRL_MADERA
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a0985d30f51b..a401a467c6f4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_GPIO_LP873X)		+= gpio-lp873x.o
 obj-$(CONFIG_GPIO_LP87565)		+= gpio-lp87565.o
 obj-$(CONFIG_GPIO_LPC18XX)		+= gpio-lpc18xx.o
 obj-$(CONFIG_GPIO_LPC32XX)		+= gpio-lpc32xx.o
+obj-$(CONFIG_GPIO_MACSMC)		+= gpio-macsmc.o
 obj-$(CONFIG_GPIO_MADERA)		+= gpio-madera.o
 obj-$(CONFIG_GPIO_MAX3191X)		+= gpio-max3191x.o
 obj-$(CONFIG_GPIO_MAX7300)		+= gpio-max7300.o
diff --git a/drivers/gpio/gpio-macsmc.c b/drivers/gpio/gpio-macsmc.c
new file mode 100644
index 000000000000..4e8e5de9ca26
--- /dev/null
+++ b/drivers/gpio/gpio-macsmc.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC GPIO driver
+ * Copyright The Asahi Linux Contributors
+ *
+ * This driver implements basic SMC PMU GPIO support that can read inputs
+ * and write outputs. Mode changes and IRQ config are not yet implemented.
+ */
+
+#include <linux/bitmap.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/macsmc.h>
+
+#define MAX_GPIO 64
+
+/*
+ * Commands 0-6 are, presumably, the intended API.
+ * Command 0xff lets you get/set the pin configuration in detail directly,
+ * but the bit meanings seem not to be stable between devices/PMU hardware
+ * versions.
+ *
+ * We're going to try to make do with the low commands for now.
+ * We don't implement pin mode changes at this time.
+ */
+
+#define CMD_ACTION	(0 << 24)
+#define CMD_OUTPUT	(1 << 24)
+#define CMD_INPUT	(2 << 24)
+#define CMD_PINMODE	(3 << 24)
+#define CMD_IRQ_ENABLE	(4 << 24)
+#define CMD_IRQ_ACK	(5 << 24)
+#define CMD_IRQ_MODE	(6 << 24)
+#define CMD_CONFIG	(0xff << 24)
+
+#define MODE_INPUT	0
+#define MODE_OUTPUT	1
+#define MODE_VALUE_0	0
+#define MODE_VALUE_1	2
+
+#define IRQ_MODE_HIGH		0
+#define IRQ_MODE_LOW		1
+#define IRQ_MODE_RISING		2
+#define IRQ_MODE_FALLING	3
+#define IRQ_MODE_BOTH		4
+
+#define CONFIG_MASK	GENMASK(23, 16)
+#define CONFIG_VAL	GENMASK(7, 0)
+
+#define CONFIG_OUTMODE	GENMASK(7, 6)
+#define CONFIG_IRQMODE	GENMASK(5, 3)
+#define CONFIG_PULLDOWN	BIT(2)
+#define CONFIG_PULLUP	BIT(1)
+#define CONFIG_OUTVAL	BIT(0)
+
+/*
+ * Output modes seem to differ depending on the PMU in use... ?
+ * j274 / M1 (Sera PMU):
+ *   0 = input
+ *   1 = output
+ *   2 = open drain
+ *   3 = disable
+ * j314 / M1Pro (Maverick PMU):
+ *   0 = input
+ *   1 = open drain
+ *   2 = output
+ *   3 = ?
+ */
+
+struct macsmc_gpio {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct gpio_chip gc;
+
+	int first_index;
+};
+
+static int macsmc_gpio_nr(smc_key key)
+{
+	int low = hex_to_bin(key & 0xff);
+	int high = hex_to_bin((key >> 8) & 0xff);
+
+	if (low < 0 || high < 0)
+		return -1;
+
+	return low | (high << 4);
+}
+
+static int macsmc_gpio_key(unsigned int offset)
+{
+	return _SMC_KEY("gP\0\0") | hex_asc_hi(offset) << 8 | hex_asc_lo(offset);
+}
+
+static int macsmc_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+	smc_key key = macsmc_gpio_key(offset);
+	u32 val;
+	int ret;
+
+	/* First try reading the explicit pin mode register */
+	ret = apple_smc_rw_u32(smcgp->smc, key, CMD_PINMODE, &val);
+	if (!ret)
+		return (val & MODE_OUTPUT) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+
+	/*
+	 * Less common IRQ configs cause CMD_PINMODE to fail, and so does open drain mode.
+	 * Fall back to reading IRQ mode, which will only succeed for inputs.
+	 */
+	ret = apple_smc_rw_u32(smcgp->smc, key, CMD_IRQ_MODE, &val);
+	return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int macsmc_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+	smc_key key = macsmc_gpio_key(offset);
+	u32 cmd, val;
+	int ret;
+
+	ret = macsmc_gpio_get_direction(gc, offset);
+	if (ret < 0)
+		return ret;
+
+	if (ret == GPIO_LINE_DIRECTION_OUT)
+		cmd = CMD_OUTPUT;
+	else
+		cmd = CMD_INPUT;
+
+	ret = apple_smc_rw_u32(smcgp->smc, key, cmd, &val);
+	if (ret < 0)
+		return ret;
+
+	return val ? 1 : 0;
+}
+
+static void macsmc_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+	smc_key key = macsmc_gpio_key(offset);
+	int ret;
+
+	value |= CMD_OUTPUT;
+	ret = apple_smc_write_u32(smcgp->smc, key, CMD_OUTPUT | value);
+	if (ret < 0)
+		dev_err(smcgp->dev, "GPIO set failed %p4ch = 0x%x\n", &key, value);
+}
+
+static int macsmc_gpio_init_valid_mask(struct gpio_chip *gc,
+				       unsigned long *valid_mask, unsigned int ngpios)
+{
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+	int count;
+	int i;
+
+	count = apple_smc_get_key_count(smcgp->smc) - smcgp->first_index;
+	if (count > MAX_GPIO)
+		count = MAX_GPIO;
+
+	bitmap_zero(valid_mask, ngpios);
+
+	for (i = 0; i < count; i++) {
+		int ret, gpio_nr;
+		smc_key key;
+
+		ret = apple_smc_get_key_by_index(smcgp->smc, smcgp->first_index + i, &key);
+		if (ret < 0)
+			return ret;
+
+		if (key > SMC_KEY(gPff))
+			break;
+
+		gpio_nr = macsmc_gpio_nr(key);
+		if (gpio_nr < 0 || gpio_nr > MAX_GPIO) {
+			dev_err(smcgp->dev, "Bad GPIO key %p4ch\n", &key);
+			continue;
+		}
+
+		set_bit(gpio_nr, valid_mask);
+	}
+
+	return 0;
+}
+
+static int macsmc_gpio_probe(struct platform_device *pdev)
+{
+	struct fwnode_handle *fwnode;
+	struct macsmc_gpio *smcgp;
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	smc_key key;
+	int ret;
+
+	smcgp = devm_kzalloc(&pdev->dev, sizeof(*smcgp), GFP_KERNEL);
+	if (!smcgp)
+		return -ENOMEM;
+
+	fwnode = device_get_named_child_node(pdev->dev.parent, "gpio");
+	device_set_node(&pdev->dev, fwnode);
+
+	smcgp->dev = &pdev->dev;
+	smcgp->smc = smc;
+	smcgp->first_index = apple_smc_find_first_key_index(smc, SMC_KEY(gP00));
+
+	if (smcgp->first_index >= apple_smc_get_key_count(smc))
+		return -ENODEV;
+
+	ret = apple_smc_get_key_by_index(smc, smcgp->first_index, &key);
+	if (ret < 0)
+		return ret;
+
+	if (key > macsmc_gpio_key(MAX_GPIO - 1))
+		return -ENODEV;
+
+	dev_info(smcgp->dev, "First GPIO key: %p4ch\n", &key);
+
+	smcgp->gc.label = "macsmc-pmu-gpio";
+	smcgp->gc.owner = THIS_MODULE;
+	smcgp->gc.get = macsmc_gpio_get;
+	smcgp->gc.set = macsmc_gpio_set;
+	smcgp->gc.get_direction = macsmc_gpio_get_direction;
+	smcgp->gc.init_valid_mask = macsmc_gpio_init_valid_mask;
+	smcgp->gc.can_sleep = true;
+	smcgp->gc.ngpio = MAX_GPIO;
+	smcgp->gc.base = -1;
+	smcgp->gc.parent = &pdev->dev;
+
+	return devm_gpiochip_add_data(&pdev->dev, &smcgp->gc, smcgp);
+}
+
+static struct platform_driver macsmc_gpio_driver = {
+	.driver = {
+		.name = "macsmc-gpio",
+	},
+	.probe = macsmc_gpio_probe,
+};
+module_platform_driver(macsmc_gpio_driver);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC GPIO driver");
+MODULE_ALIAS("platform:macsmc-gpio");
-- 
2.30.2

