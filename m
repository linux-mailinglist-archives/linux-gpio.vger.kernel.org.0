Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB9211A827
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfLKJtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:49:25 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37313 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfLKJtZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:49:25 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so16158187lfc.4;
        Wed, 11 Dec 2019 01:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nlrj28tfDHGNUlmzomtO0iIIXWqP2utz4IPvo++pu4Q=;
        b=e5XyP6DxXthrKR4SwciIsXgerFWhaJShc/8EOY6qJeaxMQkbcbW2pimAWA2QCSru0Y
         Kxk46aXxoIksT3rl6ow/DuieMMZ+zxUSIQbfLHNWFAt92GIz3qIPklpB9Du0NbF/flJY
         RYjwa/PhemeeHLjLmJHJOvyj8M0FeqIUmIzZYc6CksrnhB1tW08M8tw6hSimg5mDLXKX
         ecqGM5bumCDc6gFlHj9FDkDcYmnbxePD0gtDkBnZ82sRvFiZ0IOP+jpMlRR+YIJgnqcZ
         ZxDTeBz8L8Cy6ojpxLLih8WY2lmzY7jenvusMrZNtLQZLum8d93vC07mG7p/HBJM0WJR
         1/3Q==
X-Gm-Message-State: APjAAAVPtyiSX3+ktXatv5v03pmdkMS6OB1ufkDePUzntXGCZv8hAt9b
        ZqeqCZegXEW98UqYvIL+Sik=
X-Google-Smtp-Source: APXvYqxURVvK692Y4dgkpN+3WDFT5hv4gHAyGNpr1jKWKOE4C2Ws1WtMymFItD/tqufOokLtAzJmhw==
X-Received: by 2002:ac2:5196:: with SMTP id u22mr1535074lfi.123.1576057761237;
        Wed, 11 Dec 2019 01:49:21 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id i16sm816589lfo.87.2019.12.11.01.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 01:49:20 -0800 (PST)
Date:   Wed, 11 Dec 2019 11:49:08 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v6 13/15] gpio: bd71828: Initial support for ROHM BD71828
 PMIC GPIOs
Message-ID: <e20e9a86677bdbd7f9ac889004a34731396d7a28.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ROHM BD71828 PMIC contains 4 pins which can be configured by OTP
to be used for general purposes. First 3 can be used as outputs
and 4.th pin can be used as input. Allow them to be controlled
via GPIO framework.

The driver assumes all of the pins are configured as GPIOs and
trusts that the reserved pins in other OTP configurations are
excluded from control using "gpio-reserved-ranges" device tree
property (or left untouched by GPIO users).

Typical use for 4.th pin (input) is to use it as HALL sensor
input so that this pin state is toggled when HALL sensor detects
LID position change (from close to open or open to close). PMIC
HW implements some extra logic which allows PMIC to power-up the
system when this pin is toggled. Please see the data sheet for
details of GPIO options which can be selected by OTP settings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---

No changes since v5

 drivers/gpio/Kconfig        |  12 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-bd71828.c | 159 ++++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/gpio/gpio-bd71828.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8adffd42f8cb..68adc1b94dda 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1021,6 +1021,18 @@ config GPIO_BD70528
 	  This driver can also be built as a module. If so, the module
 	  will be called gpio-bd70528.
 
+config GPIO_BD71828
+	tristate "ROHM BD71828 GPIO support"
+	depends on MFD_ROHM_BD71828
+	help
+	  Support for GPIOs on ROHM BD71828 PMIC. There are three GPIOs
+	  available on the ROHM PMIC in total. The GPIOs are limited to
+	  outputs only and pins must be configured to GPIO outputs by
+	  OTP. Enable this only if you want to use these pins as outputs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio-bd71828.
+
 config GPIO_BD9571MWV
 	tristate "ROHM BD9571 GPIO support"
 	depends on MFD_BD9571MWV
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 34eb8b2b12dd..8629b81b5c17 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
 obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BCM_XGS_IPROC)	+= gpio-xgs-iproc.o
 obj-$(CONFIG_GPIO_BD70528)		+= gpio-bd70528.o
+obj-$(CONFIG_GPIO_BD71828)		+= gpio-bd71828.o
 obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
diff --git a/drivers/gpio/gpio-bd71828.c b/drivers/gpio/gpio-bd71828.c
new file mode 100644
index 000000000000..04aade9e0a4d
--- /dev/null
+++ b/drivers/gpio/gpio-bd71828.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2018 ROHM Semiconductors
+
+#include <linux/gpio/driver.h>
+#include <linux/mfd/rohm-bd71828.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define GPIO_OUT_REG(off) (BD71828_REG_GPIO_CTRL1 + (off))
+#define HALL_GPIO_OFFSET 3
+
+/*
+ * These defines can be removed when
+ * "gpio: Add definition for GPIO direction"
+ * (9208b1e77d6e8e9776f34f46ef4079ecac9c3c25 in GPIO tree) gets merged,
+ */
+#ifndef GPIO_LINE_DIRECTION_IN
+	#define GPIO_LINE_DIRECTION_IN 1
+	#define GPIO_LINE_DIRECTION_OUT 0
+#endif
+
+struct bd71828_gpio {
+	struct rohm_regmap_dev chip;
+	struct gpio_chip gpio;
+};
+
+static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int value)
+{
+	int ret;
+	struct bd71828_gpio *bdgpio = gpiochip_get_data(chip);
+	u8 val = (value) ? BD71828_GPIO_OUT_HI : BD71828_GPIO_OUT_LO;
+
+	/*
+	 * The HALL input pin can only be used as input. If this is the pin
+	 * we are dealing with - then we are done
+	 */
+	if (offset == HALL_GPIO_OFFSET)
+		return;
+
+	ret = regmap_update_bits(bdgpio->chip.regmap, GPIO_OUT_REG(offset),
+				 BD71828_GPIO_OUT_MASK, val);
+	if (ret)
+		dev_err(bdgpio->chip.dev, "Could not set gpio to %d\n", value);
+}
+
+static int bd71828_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	int ret;
+	unsigned int val;
+	struct bd71828_gpio *bdgpio = gpiochip_get_data(chip);
+
+	if (offset == HALL_GPIO_OFFSET)
+		ret = regmap_read(bdgpio->chip.regmap, BD71828_REG_IO_STAT,
+				  &val);
+	else
+		ret = regmap_read(bdgpio->chip.regmap, GPIO_OUT_REG(offset),
+				  &val);
+	if (!ret)
+		ret = (val & BD71828_GPIO_OUT_MASK);
+
+	return ret;
+}
+
+static int bd71828_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				   unsigned long config)
+{
+	struct bd71828_gpio *bdgpio = gpiochip_get_data(chip);
+
+	if (offset == HALL_GPIO_OFFSET)
+		return -ENOTSUPP;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		return regmap_update_bits(bdgpio->chip.regmap,
+					  GPIO_OUT_REG(offset),
+					  BD71828_GPIO_DRIVE_MASK,
+					  BD71828_GPIO_OPEN_DRAIN);
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return regmap_update_bits(bdgpio->chip.regmap,
+					  GPIO_OUT_REG(offset),
+					  BD71828_GPIO_DRIVE_MASK,
+					  BD71828_GPIO_PUSH_PULL);
+	default:
+		break;
+	}
+	return -ENOTSUPP;
+}
+
+static int bd71828_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	/*
+	 * Pin usage is selected by OTP data. We can't read it runtime. Hence
+	 * we trust that if the pin is not excluded by "gpio-reserved-ranges"
+	 * the OTP configuration is set to OUT. (Other pins but HALL input pin
+	 * on BD71828 can't really be used for general purpose input - input
+	 * states are used for specific cases like regulator control or
+	 * PMIC_ON_REQ.
+	 */
+	if (offset == HALL_GPIO_OFFSET)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int bd71828_probe(struct platform_device *pdev)
+{
+	struct bd71828_gpio *bdgpio;
+	struct rohm_regmap_dev *bd71828;
+
+	bd71828 = dev_get_drvdata(pdev->dev.parent);
+	if (!bd71828) {
+		dev_err(&pdev->dev, "No MFD driver data\n");
+		return -EINVAL;
+	}
+
+	bdgpio = devm_kzalloc(&pdev->dev, sizeof(*bdgpio),
+			      GFP_KERNEL);
+	if (!bdgpio)
+		return -ENOMEM;
+
+	bdgpio->chip.dev = &pdev->dev;
+	bdgpio->gpio.parent = pdev->dev.parent;
+	bdgpio->gpio.label = "bd71828-gpio";
+	bdgpio->gpio.owner = THIS_MODULE;
+	bdgpio->gpio.get_direction = bd71828_get_direction;
+	bdgpio->gpio.set_config = bd71828_gpio_set_config;
+	bdgpio->gpio.can_sleep = true;
+	bdgpio->gpio.get = bd71828_gpio_get;
+	bdgpio->gpio.set = bd71828_gpio_set;
+	bdgpio->gpio.base = -1;
+
+	/*
+	 * See if we need some implementation to mark some PINs as
+	 * not controllable based on DT info or if core can handle
+	 * "gpio-reserved-ranges" and exclude them from control
+	 */
+	bdgpio->gpio.ngpio = 4;
+	bdgpio->gpio.of_node = pdev->dev.parent->of_node;
+	bdgpio->chip.regmap = bd71828->regmap;
+
+	return devm_gpiochip_add_data(&pdev->dev, &bdgpio->gpio,
+				     bdgpio);
+}
+
+static struct platform_driver bd71828_gpio = {
+	.driver = {
+		.name = "bd71828-gpio"
+	},
+	.probe = bd71828_probe,
+};
+
+module_platform_driver(bd71828_gpio);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("BD71828 voltage regulator driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:bd71828-gpio");
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
