Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E45A3541BC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Apr 2021 13:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235182AbhDELnX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Apr 2021 07:43:23 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:45719 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235123AbhDELnX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Apr 2021 07:43:23 -0400
Received: by mail-lj1-f176.google.com with SMTP id z8so12354467ljm.12;
        Mon, 05 Apr 2021 04:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hrrY+K42HKKRs8SR3n24iRJN3pEJi2aPqhjWkRPMSUQ=;
        b=svbUbxItQg/CXn+wJue2dTpgHj17MiiR7adi1DNqrXyP+2GKqs8xBtJEe9jVE3ynRq
         4TGXjnBQtlSl22zV70eNRKHQJfgE4UMVTUx2fJYIUxUaJ7f1WfT1j0lRkMpisNp4Mb/d
         W/vuwCpNU6y8ZKs5CX7iaWpQneuESA0iwrpGCKUKTWmBe3xBkjxwe3qTj3HRU6DCUZMd
         uxPW5rGIOyBX7H8OAKVrSCo3noarsdagoC7Bhwuq+hYIPUdebip8jdgCy2AiYuW5/5Fd
         f0BbNCAGA9SdECh/8wNS+vyMbQA4zXqS1otWMNHteKJHxkRyVqftgHgmhfJaz78CTI3v
         pzuQ==
X-Gm-Message-State: AOAM531dY+KjFMCafGm1dIxxb54jyi9YQz9T6fBOPYzPFxNK3mJK36YY
        5mWlQiWG7RtM0b+Yx3jVDwQ=
X-Google-Smtp-Source: ABdhPJzQVZDQ8gbFGdT1Uy/p8xq9KJGe/7fR2LvezWP/tcuvuL1MD6b3lr9OHalAFIGbCjixjImDlQ==
X-Received: by 2002:a2e:730b:: with SMTP id o11mr15877059ljc.221.1617622995333;
        Mon, 05 Apr 2021 04:43:15 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id 10sm1744504lfg.157.2021.04.05.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 04:43:14 -0700 (PDT)
Date:   Mon, 5 Apr 2021 14:43:08 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org
Subject: [PATCH v6 09/16] gpio: support ROHM BD71815 GPOs
Message-ID: <10656473f107dbf21e91dc1f1b24197fa45d4934.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support GPO(s) found from ROHM BD71815 power management IC. The IC has two
GPO pins but only one is properly documented in the data-sheet. The driver
exposes by default only the documented GPO. The second GPO is connected to
E5 pin and is marked as GND in the data-sheet. Control for this
undocumented pin can be enabled using a special DT property.

This driver is derived from work by Peter Yang <yanglsh@embest-tech.com>
although not so much of the original is left.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes since v5:
 - more styling fixes
 - corrected commit message spelling
 - dropped error print as was suggested by Andy
 - dropped explicit setting of the .owner in driver struct

 drivers/gpio/Kconfig        |  10 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-bd71815.c | 185 ++++++++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+)
 create mode 100644 drivers/gpio/gpio-bd71815.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec4c2e8..d3b3de514f6e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1105,6 +1105,16 @@ config GPIO_BD70528
 	  This driver can also be built as a module. If so, the module
 	  will be called gpio-bd70528.
 
+config GPIO_BD71815
+	tristate "ROHM BD71815 PMIC GPIO support"
+	depends on MFD_ROHM_BD71828
+	help
+	  Support for GPO(s) on ROHM BD71815 PMIC. There are two GPOs
+	  available on the ROHM PMIC.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio-bd71815.
+
 config GPIO_BD71828
 	tristate "ROHM BD71828 GPIO support"
 	depends on MFD_ROHM_BD71828
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c58a90a3c3b1..4c12f31db31f 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
 obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BCM_XGS_IPROC)	+= gpio-xgs-iproc.o
 obj-$(CONFIG_GPIO_BD70528)		+= gpio-bd70528.o
+obj-$(CONFIG_GPIO_BD71815)		+= gpio-bd71815.o
 obj-$(CONFIG_GPIO_BD71828)		+= gpio-bd71828.o
 obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
diff --git a/drivers/gpio/gpio-bd71815.c b/drivers/gpio/gpio-bd71815.c
new file mode 100644
index 000000000000..d7dcb3395a77
--- /dev/null
+++ b/drivers/gpio/gpio-bd71815.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support to GPOs on ROHM BD71815
+ * Copyright 2021 ROHM Semiconductors.
+ * Author: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+ *
+ * Copyright 2014 Embest Technology Co. Ltd. Inc.
+ * Author: yanglsh@embest-tech.com
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+/* For the BD71815 register definitions */
+#include <linux/mfd/rohm-bd71815.h>
+
+struct bd71815_gpio {
+	/* chip.parent points the MFD which provides DT node and regmap */
+	struct gpio_chip chip;
+	/* dev points to the platform device for devm and prints */
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+static int bd71815gpo_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
+	int ret, val;
+
+	ret = regmap_read(bd71815->regmap, BD71815_REG_GPO, &val);
+	if (ret)
+		return ret;
+
+	return (val >> offset) & 1;
+}
+
+static void bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
+	int ret, bit;
+
+	bit = BIT(offset);
+
+	if (value)
+		ret = regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
+	else
+		ret = regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
+
+	if (ret)
+		dev_warn(bd71815->dev, "failed to toggle GPO\n");
+}
+
+static int bd71815_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				   unsigned long config)
+{
+	struct bd71815_gpio *bdgpio = gpiochip_get_data(chip);
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		return regmap_update_bits(bdgpio->regmap,
+					  BD71815_REG_GPO,
+					  BD71815_GPIO_DRIVE_MASK << offset,
+					  BD71815_GPIO_OPEN_DRAIN << offset);
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return regmap_update_bits(bdgpio->regmap,
+					  BD71815_REG_GPO,
+					  BD71815_GPIO_DRIVE_MASK << offset,
+					  BD71815_GPIO_CMOS << offset);
+	default:
+		break;
+	}
+	return -ENOTSUPP;
+}
+
+/* BD71815 GPIO is actually GPO */
+static int bd71815gpo_direction_get(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+/* Template for GPIO chip */
+static const struct gpio_chip bd71815gpo_chip = {
+	.label			= "bd71815",
+	.owner			= THIS_MODULE,
+	.get			= bd71815gpo_get,
+	.get_direction		= bd71815gpo_direction_get,
+	.set			= bd71815gpo_set,
+	.set_config		= bd71815_gpio_set_config,
+	.can_sleep		= true,
+};
+
+#define BD71815_TWO_GPIOS	GENMASK(1, 0)
+#define BD71815_ONE_GPIO	BIT(0)
+
+/*
+ * Sigh. The BD71815 and BD71817 were originally designed to support two GPO
+ * pins. At some point it was noticed the second GPO pin which is the E5 pin
+ * located at the center of IC is hard to use on PCB (due to the location). It
+ * was decided to not promote this second GPO and the pin is marked as GND in
+ * the datasheet. The functionality is still there though! I guess driving a GPO
+ * connected to the ground is a bad idea. Thus we do not support it by default.
+ * OTOH - the original driver written by colleagues at Embest did support
+ * controlling this second GPO. It is thus possible this is used in some of the
+ * products.
+ *
+ * This driver does not by default support configuring this second GPO
+ * but allows using it by providing the DT property
+ * "rohm,enable-hidden-gpo".
+ */
+static int bd71815_init_valid_mask(struct gpio_chip *gc,
+				   unsigned long *valid_mask,
+				   unsigned int ngpios)
+{
+	if (ngpios != 2)
+		return 0;
+
+	if (gc->parent && device_property_present(gc->parent,
+						  "rohm,enable-hidden-gpo"))
+		*valid_mask = BD71815_TWO_GPIOS;
+	else
+		*valid_mask = BD71815_ONE_GPIO;
+
+	return 0;
+}
+
+static int gpo_bd71815_probe(struct platform_device *pdev)
+{
+	struct bd71815_gpio *g;
+	struct device *parent, *dev;
+
+	/*
+	 * Bind devm lifetime to this platform device => use dev for devm.
+	 * also the prints should originate from this device.
+	 */
+	dev = &pdev->dev;
+	/* The device-tree and regmap come from MFD => use parent for that */
+	parent = dev->parent;
+
+	g = devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
+	if (!g)
+		return -ENOMEM;
+
+	g->chip = bd71815gpo_chip;
+
+	/*
+	 * FIXME: As writing of this the sysfs interface for GPIO control does
+	 * not respect the valid_mask. Do not trust it but rather set the ngpios
+	 * to 1 if "rohm,enable-hidden-gpo" is not given.
+	 *
+	 * This check can be removed later if the sysfs export is fixed and
+	 * if the fix is backported.
+	 *
+	 * For now it is safest to just set the ngpios though.
+	 */
+	if (device_property_present(parent, "rohm,enable-hidden-gpo"))
+		g->chip.ngpio = 2;
+	else
+		g->chip.ngpio = 1;
+
+	g->chip.init_valid_mask = bd71815_init_valid_mask;
+	g->chip.base = -1;
+	g->chip.parent = parent;
+	g->regmap = dev_get_regmap(parent, NULL);
+	g->dev = dev;
+
+	return devm_gpiochip_add_data(dev, &g->chip, g);
+}
+
+static struct platform_driver gpo_bd71815_driver = {
+	.driver = {
+		.name	= "bd71815-gpo",
+	},
+	.probe		= gpo_bd71815_probe,
+};
+module_platform_driver(gpo_bd71815_driver);
+
+MODULE_ALIAS("platform:bd71815-gpo");
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_AUTHOR("Peter Yang <yanglsh@embest-tech.com>");
+MODULE_DESCRIPTION("GPO interface for BD71815");
+MODULE_LICENSE("GPL");
-- 
2.25.4


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
