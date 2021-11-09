Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5CB144ACA6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343512AbhKILff (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:35:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343510AbhKILfe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:35:34 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0A8C0613F5
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:32:48 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id o8so75273847edc.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zrtwtw2r9OikwlQFHJNJj3GiBNDj9j6F3aHBsectFJw=;
        b=CSBqvBY9btSCKcnVRiQ4vHbgFrmAoY9QDieqIcHoYaWb2QEtW5vPT+py2NGWnDRPG9
         CwvZWA4nQe1m+7wUsXOLOiovZtNz42fjlA330iIOfevzENUM2hwcIhtZ+g4KQZpT+DJZ
         3aUuy9R1UTVqD2S8fmAjB9NRZyFuGQ32VF580A8MEOjNzlGhQCQb+TSyIjEd0hIIVD/g
         9yFDUaygaPKBa6WB4E5M8NxlOjNL3ZfHPGK7c4Atkaq/43HeX7fks/wS/ofvE+ExMrUA
         S3DKOY795ONM/lV2LitD/lnBpHi359sN+TRh725//WHOycN6AVJKRj8+XSAtPgT+nYAI
         JAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zrtwtw2r9OikwlQFHJNJj3GiBNDj9j6F3aHBsectFJw=;
        b=ZBSXbTwFyOJW/kdcw4bdbvJO7fHGJ+GLcCauCvJuEIM9rrRu80ZpAS/7VSIC8R1Jx6
         CaTn+91cZ+Ibz/qMmgKHQrmxuniDO4WJexaLtSsSh3XZxBeDjioU22oLhpaAJOGM/EIm
         +QxhC5CQcQmQt0Fh8tfweqs+6iO65YOLswlEWApuc+fR9mi5IXJtJntMSE7H0Wn6NiKs
         NCWxTzHEC8s4wSk9zSBWv9/5VD+uDG4JAc3V5xsv8aUSGr7dOPKipN2X5pBCi1VMxTSy
         HAIzPprqD6yPxqPmjsrotMU1aOOE5KGH29wyAMrtUiAULWJZXfY/6aLC/muetodkbTDc
         J0yg==
X-Gm-Message-State: AOAM533Z7P+AUaFneWx+/P41kQL+cQTMrXIsLAU4YWNPPmDskdhv3KWx
        8KWpZUCwgR5NJeMjUL/gTBxwdA==
X-Google-Smtp-Source: ABdhPJy/GHPj5U4nDr9MspcobBmIRy/vKrnGZFPy/vpCfQ//H/RgyGwwkvC6SJL+QbgCtvTIyTOSPQ==
X-Received: by 2002:a05:6402:4412:: with SMTP id y18mr8980593eda.103.1636457566925;
        Tue, 09 Nov 2021 03:32:46 -0800 (PST)
Received: from fedora.. (cpezg-94-253-144-18-cbl.xnet.hr. [94.253.144.18])
        by smtp.googlemail.com with ESMTPSA id s4sm6771167ejn.25.2021.11.09.03.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 03:32:46 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        andy.shevchenko@gmail.com, michael@walle.cc, andrew@lunn.ch
Cc:     luka.perkov@sartura.hr, bruno.banelli@sartura.hr,
        Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 2/6] gpio: Add Delta TN48M CPLD GPIO driver
Date:   Tue,  9 Nov 2021 12:32:35 +0100
Message-Id: <20211109113239.93493-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109113239.93493-1-robert.marko@sartura.hr>
References: <20211109113239.93493-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Delta TN48M switch has an onboard Lattice CPLD that is used as a GPIO
expander.

The CPLD provides 12 pins in total on the TN48M, but on more advanced
switch models it provides up to 192 pins, so the driver is extendable
to support more switches.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
Changes in v9:
* Use {} instead of {0} for initialising the regmap config per Andys
comment
* Fix spelling mistake in KConfig

Changes in v8:
* No need to assing NULL to gpio_config per Andys comment

Changes in v7:
* Change compatibles, reduce their number
* Rework the driver to be easily extendible to support more devices
* Use match data to populate configuration
* Drop reviews and ACK-s as the driver changed

Changes in v6:
* Drop unused header
* Return the return value of device_property_read_u32()
instead of a hardcoded return

Changes in v2:
* Rewrite to use simple I2C MFD and GPIO regmap
* Drop DT bindings for pin numbering
---
 drivers/gpio/Kconfig      |  12 +++++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-tn48m.c | 100 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/gpio/gpio-tn48m.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fab571016adf..8f7dd207bd16 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1344,6 +1344,18 @@ config GPIO_TIMBERDALE
 	help
 	Add support for the GPIO IP in the timberdale FPGA.
 
+config GPIO_TN48M_CPLD
+	tristate "Delta Networks TN48M switch CPLD GPIO driver"
+	depends on MFD_TN48M_CPLD
+	select GPIO_REGMAP
+	help
+	  This enables support for the GPIOs found on the Delta
+	  Networks TN48M switch Lattice CPLD. It provides 12 pins in total,
+	  they are input-only or output-only type.
+
+	  This driver can also be built as a module. If so, the
+	  module will be called gpio-tn48m.
+
 config GPIO_TPS65086
 	tristate "TI TPS65086 GPO"
 	depends on MFD_TPS65086
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 32a32659866a..93abc7461e45 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -148,6 +148,7 @@ obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
 obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
 obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
 obj-$(CONFIG_GPIO_TIMBERDALE)		+= gpio-timberdale.o
+obj-$(CONFIG_GPIO_TN48M_CPLD)		+= gpio-tn48m.o
 obj-$(CONFIG_GPIO_TPIC2810)		+= gpio-tpic2810.o
 obj-$(CONFIG_GPIO_TPS65086)		+= gpio-tps65086.o
 obj-$(CONFIG_GPIO_TPS65218)		+= gpio-tps65218.o
diff --git a/drivers/gpio/gpio-tn48m.c b/drivers/gpio/gpio-tn48m.c
new file mode 100644
index 000000000000..cd4a80b22794
--- /dev/null
+++ b/drivers/gpio/gpio-tn48m.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Delta TN48M CPLD GPIO driver
+ *
+ * Copyright (C) 2021 Sartura Ltd.
+ *
+ * Author: Robert Marko <robert.marko@sartura.hr>
+ */
+
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+enum tn48m_gpio_type {
+	TN48M_GP0 = 1,
+	TN48M_GPI,
+};
+
+struct tn48m_gpio_config {
+	int ngpio;
+	int ngpio_per_reg;
+	enum tn48m_gpio_type type;
+};
+
+static const struct tn48m_gpio_config tn48m_gpo_config = {
+	.ngpio = 4,
+	.ngpio_per_reg = 4,
+	.type = TN48M_GP0,
+};
+
+static const struct tn48m_gpio_config tn48m_gpi_config = {
+	.ngpio = 4,
+	.ngpio_per_reg = 4,
+	.type = TN48M_GPI,
+};
+
+static int tn48m_gpio_probe(struct platform_device *pdev)
+{
+	const struct tn48m_gpio_config *gpio_config;
+	struct gpio_regmap_config config = {};
+	struct regmap *regmap;
+	u32 base;
+	int ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+
+	gpio_config = device_get_match_data(&pdev->dev);
+	if (!gpio_config)
+		return -ENODEV;
+
+	ret = device_property_read_u32(&pdev->dev, "reg", &base);
+	if (ret)
+		return ret;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	config.regmap = regmap;
+	config.parent = &pdev->dev;
+	config.ngpio = gpio_config->ngpio;
+	config.ngpio_per_reg = gpio_config->ngpio_per_reg;
+	switch (gpio_config->type) {
+	case TN48M_GP0:
+		config.reg_set_base = base;
+		break;
+	case TN48M_GPI:
+		config.reg_dat_base = base;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
+}
+
+static const struct of_device_id tn48m_gpio_of_match[] = {
+	{ .compatible = "delta,tn48m-gpo", .data = &tn48m_gpo_config },
+	{ .compatible = "delta,tn48m-gpi", .data = &tn48m_gpi_config },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tn48m_gpio_of_match);
+
+static struct platform_driver tn48m_gpio_driver = {
+	.driver = {
+		.name = "delta-tn48m-gpio",
+		.of_match_table = tn48m_gpio_of_match,
+	},
+	.probe = tn48m_gpio_probe,
+};
+module_platform_driver(tn48m_gpio_driver);
+
+MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
+MODULE_DESCRIPTION("Delta TN48M CPLD GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.33.1

