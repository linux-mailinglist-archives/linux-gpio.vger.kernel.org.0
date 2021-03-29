Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5D534D0A0
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 14:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhC2M5Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 08:57:24 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:40755 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbhC2M5G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 08:57:06 -0400
Received: by mail-lf1-f50.google.com with SMTP id a198so18274566lfd.7;
        Mon, 29 Mar 2021 05:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iRQm7adOIabnAfpsuFSutUolgUzBs7NwmGrsdLAuNXA=;
        b=o7JehHz1p+MGdDkNUjlk5hnU88uYTPZ6sp8dmC/e/RIVv8Re3CCh7ocIQc/WFJg2WX
         vXNNLhlZQbSv4UXBImGMfF3+d8I+WB2VzEl/yGNU9PfvjgV/LM90xXUYsBO72oGjLhWi
         CEoQidWLn5lLQiwVNCHndI+KvU6Y0B2Su8QZol1t4RGr9CJ+6oRSQ8OnKgzbQhWr2jJd
         glGjYYiKKjoY4+bTz91U3aiGlu7fuSyKZilEJ+kK1OU9DvpBNAvwTZZWDdcL4MyGWnL6
         4exT3trk2Iub1mKCHs8QhFk5CQ9fCqOK2L2KGHykxB5WrMmEKnwPabZGSResdtOGar9d
         AjNg==
X-Gm-Message-State: AOAM532wyDD7rqFxy7cY7s7yfsePIpQOZO+4Whg/DI5if+simXSjihtJ
        z9s1hffZJNzN33NltLex1mo=
X-Google-Smtp-Source: ABdhPJyQB5nFBtK5BPwMV2u6/oqVU7ff09UBq+kyAXMWbWUz02g1bXwVLvLV4wN8T7NkZ+zjjyc6Bg==
X-Received: by 2002:a19:6b13:: with SMTP id d19mr15882316lfa.291.1617022624787;
        Mon, 29 Mar 2021 05:57:04 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id t5sm2387508ljc.78.2021.03.29.05.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 05:57:04 -0700 (PDT)
Date:   Mon, 29 Mar 2021 15:56:58 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org
Subject: [PATCH v5 09/19] gpio: support ROHM BD71815 GPOs
Message-ID: <118a6160880a212d20d0251f763cad295c741b4d.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support GPO(s) found from ROHM BD71815 power management IC. The IC has two
GPO pins but only one is properly documented in data-sheet. The driver
exposes by default only the documented GPO. The second GPO is connected to
E5 pin and is marked as GND in data-sheet. Control for this undocumented
pin can be enabled using a special DT property.

This driver is derived from work by Peter Yang <yanglsh@embest-tech.com>
although not so much of original is left.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---

Linus, Bartosz, please note that I changed this patch somewhat according
to suggestions from Andy. Please let me know if you want to revoke acks.

Changes since v4:
 - styling fixes
 - implemented init_valid_mask
 - added comment that the ngpio hack can be deleted later
   if sysfs IF does respect the valid_mask

 drivers/gpio/Kconfig        |  10 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-bd71815.c | 193 ++++++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+)
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
index 000000000000..c7f37813d629
--- /dev/null
+++ b/drivers/gpio/gpio-bd71815.c
@@ -0,0 +1,193 @@
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
+	struct gpio_chip chip;
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
+	.can_sleep		= 1,
+};
+
+#define BD71815_TWO_GPIOS	0x3UL
+#define BD71815_ONE_GPIO	0x1UL
+
+/*
+ * Sigh. The BD71815 and BD71817 were originally designed to support two GPO
+ * pins. At some point it was noticed the second GPO pin which is the E5 pin
+ * located at the center of IC is hard to use on PCB (due to the location). It
+ * was decided to not promote this second GPO and pin is marked as GND in the
+ * datasheet. The functionality is still there though! I guess driving a GPO
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
+	int ret;
+	struct bd71815_gpio *g;
+	struct device *dev;
+	struct device *parent;
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
+	 * As writing of this the sysfs interface for GPIO control does not
+	 * respect the valid_mask. Do not trust it but rather set the ngpios
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
+	ret = devm_gpiochip_add_data(dev, &g->chip, g);
+	if (ret < 0) {
+		dev_err(dev, "could not register gpiochip, %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static struct platform_driver gpo_bd71815_driver = {
+	.driver = {
+		.name	= "bd71815-gpo",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= gpo_bd71815_probe,
+};
+
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
