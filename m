Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C140D2FB2EB
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729884AbhASHYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:24:52 -0500
Received: from mail-lj1-f178.google.com ([209.85.208.178]:35575 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbhASHX6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 02:23:58 -0500
Received: by mail-lj1-f178.google.com with SMTP id p13so20816443ljg.2;
        Mon, 18 Jan 2021 23:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ShiG8ncvQqYw1SDkHGr+rcvPNVAuPLpZAxLBK/z6p+4=;
        b=jKuaIvvhF7F5Id7Fbm/tDF9tu4FrJsYJK2lzzL6UyjRwRDRSNHvLIurIjHSLcfkzG5
         9i/u+4nova0v9ysjS1hUAXIEJaFZZ3ctv+V610ojfTyAbp++YSEMnA2q44y4KZ8VcGMB
         eWQ43XtjJOBAkH/xb2mAVhpWxReyVYdZ4EKIwuEkHkvrejVkKfheQvcBF7jFHQsmrE7g
         NvCRYrdeuOQlUk8GSJ04LkRd1BzUbB8BHan4QJQriZctN44ze5QIRsFZZM0LOyAX6Qp3
         wfNNq0YrPj3bJ95SIopUAELXWnacwabz44Nw2uUKAHOr5rMyBFwEd/k0I161xvxFJs+N
         EfWg==
X-Gm-Message-State: AOAM530PGn+5ZKpolUfRozquXSa/0ayk/9gZQgAPOVhm7fjCj90aaFWI
        FAPGF8SiKhdPHLVZPEMVpaQ=
X-Google-Smtp-Source: ABdhPJxNf1kTyWJ8dhSflagljSf/R6XPWSMvBRrv9RBYDoQNkJiMXeqPUYkQA5PELCyIFPhs1KW1Mg==
X-Received: by 2002:a05:651c:1356:: with SMTP id j22mr1351691ljb.237.1611040995391;
        Mon, 18 Jan 2021 23:23:15 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id d6sm2187479lfl.175.2021.01.18.23.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 23:23:14 -0800 (PST)
Date:   Tue, 19 Jan 2021 09:23:08 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v2 10/17] gpio: support ROHM BD71815 GPOs
Message-ID: <50f72f1f7f28e969a1e0353712fcc530bce9dd06.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
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
---
Changes since v1:
  - removed unneeded headers
  - clarified dev/parent->dev usage
  - removed forgotten #define DEBUG

 drivers/gpio/Kconfig        |  10 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-bd71815.c | 171 ++++++++++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+)
 create mode 100644 drivers/gpio/gpio-bd71815.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c70f46e80a3b..fd7283af858d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1096,6 +1096,16 @@ config GPIO_BD70528
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
index 35e3b6026665..86bb680522a6 100644
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
index 000000000000..664de5f69bf1
--- /dev/null
+++ b/drivers/gpio/gpio-bd71815.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support to GPOs on ROHM BD71815
+ */
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/gpio/driver.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+/* For the BD71815 register definitions */
+#include <linux/mfd/rohm-bd71815.h>
+
+struct bd71815_gpio {
+	struct gpio_chip chip;
+	struct device *dev;
+	struct regmap *regmap;
+	/*
+	 * Sigh. The BD71815 and BD71817 were originally designed to support two
+	 * GPO pins. At some point it was noticed the second GPO pin which is
+	 * the E5 pin located at the center of IC is hard to use on PCB (due to
+	 * the location). It was decided to not promote this second GPO and pin
+	 * is marked as GND on the data-sheet. The functionality is still there
+	 * though! I guess driving GPO connected to ground is a bad idea. Thus
+	 * we do not support it by default. OTOH - the original driver written
+	 * by colleagues at Embest did support controlling this second GPO. It
+	 * is thus possible this is used in some of the products.
+	 *
+	 * This driver does not by default support configuring this second GPO
+	 * but allows using it by providing the DT property
+	 * "rohm,enable-hidden-gpo".
+	 */
+	bool e5_pin_is_gpo;
+};
+
+static int bd71815gpo_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
+	int ret = 0;
+	int val;
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
+	int ret, val, mask;
+
+	if (!bd71815->e5_pin_is_gpo && offset)
+		return;
+
+	mask = BIT(offset);
+	val = value ? mask : 0;
+	ret = regmap_update_bits(bd71815->regmap, BD71815_REG_GPO, mask, val);
+	if (ret)
+		dev_warn(bd71815->dev, "failed to toggle GPO\n");
+}
+
+static int bd71815_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				   unsigned long config)
+{
+	struct bd71815_gpio *bdgpio = gpiochip_get_data(chip);
+
+	if (!bdgpio->e5_pin_is_gpo && offset)
+		return -EOPNOTSUPP;
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
+	return -EOPNOTSUPP;
+}
+
+/* BD71815 GPIO is actually GPO */
+static int bd71815gpo_direction_get(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+/* Template for GPIO chip */
+static struct gpio_chip bd71815gpo_chip = {
+	.label			= "bd71815",
+	.owner			= THIS_MODULE,
+	.get			= bd71815gpo_get,
+	.get_direction		= bd71815gpo_direction_get,
+	.set			= bd71815gpo_set,
+	.set_config		= bd71815_gpio_set_config,
+	.can_sleep		= 1,
+};
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
+	g->e5_pin_is_gpo = of_property_read_bool(parent->of_node,
+						 "rohm,enable-hidden-gpo");
+	g->chip = bd71815gpo_chip;
+	g->chip.base = -1;
+
+	if (g->e5_pin_is_gpo)
+		g->chip.ngpio = 2;
+	else
+		g->chip.ngpio = 1;
+
+	g->chip.parent = parent;
+	g->chip.of_node = parent->of_node;
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
+static const struct platform_device_id bd7181x_gpo_id[] = {
+	{ "bd71815-gpo" },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, bd7181x_gpo_id);
+
+static struct platform_driver gpo_bd71815_driver = {
+	.driver = {
+		.name	= "bd71815-gpo",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= gpo_bd71815_probe,
+	.id_table	= bd7181x_gpo_id,
+};
+
+module_platform_driver(gpo_bd71815_driver);
+
+/* Note:  this hardware lives inside an I2C-based multi-function device. */
+MODULE_ALIAS("platform:bd71815-gpo");
+
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
