Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1054462DF
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 12:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232679AbhKELlx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 07:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbhKELls (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 07:41:48 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE67C061208
        for <linux-gpio@vger.kernel.org>; Fri,  5 Nov 2021 04:39:08 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id c8so15293896ede.13
        for <linux-gpio@vger.kernel.org>; Fri, 05 Nov 2021 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m4bFx6IdGK9SGY5fBjAkncPO0+75+NMay8+xTfQ7Xuo=;
        b=vuxjQdfGYIXuTrQQZnRH8HNL2J5MUX50fdzVp4aKBDek35gQAeQjZ6JIfvo7/va5aH
         IgECzYnWWOGT0KMe5JG2TqmynMjTZbFcV/hE8T+HyQWoJ9CcbjqD7DVy66K5/N1ISuYh
         6m7RSiswoy+XuOKUQW54+pPxJHxmEHJaDOC65groA7k7QMHxAFDNJBzP01jEUEc7NL9U
         LQ7NuhIbYh75TD3QS0kUzjQExrM3EuoAjhtluqvFLDE1qgkoh99hQx2OAo1aO5r+9EUI
         IdC/IsiQYRyUkFjZTgqPQwpeUDLnKY80mPSmF6rh/FajxQlWX3ogg9VSOqjKSPJb+o/2
         WMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m4bFx6IdGK9SGY5fBjAkncPO0+75+NMay8+xTfQ7Xuo=;
        b=a4Gzx+RYzcH15wkylbXc3FdZqR9qjIKHjUZFzg33w+9kkcqNTN2qRPf8Eky1nBdPY3
         /HGno7371q1owbOIMd+4kKw0JrES0EO3nkLSSjErB587g+WDzEn0X5BFxYQG/cAeleog
         GMNh9O7ak7H9VNGqcw8S9qdSInn1S9FHzu6QbpZBGiRzyTBydgTKkInundMuFLplODKc
         U2SoYNVnl4HEbJkgoZeYpF3li1merQ4AzWweekjhYmMSmVv+6VIz2FFmBy7u+v5cH9Da
         i7qZwHxLxPvsOI0+mRLzDJjvg2ruLkgTA/2jgxGKw0+NpiIM4/EhRd+CZa0gzABO+UsT
         4MIg==
X-Gm-Message-State: AOAM532FvgZZFirRwKcbbIh3uSSZRNRaCfpjIyzAvqUc3Bdwt949oHAH
        NkY78bo4qZ9K/xULC6cmTK5FIg==
X-Google-Smtp-Source: ABdhPJxcMKncD5A0RmQ0Dnk5OSfe8ePAR38WITtdjEBd/Jifgc2nDvTy3NCxTnV341BN2iHOsNTG0Q==
X-Received: by 2002:a50:9d49:: with SMTP id j9mr76005676edk.39.1636112347334;
        Fri, 05 Nov 2021 04:39:07 -0700 (PDT)
Received: from fedora.. (dh207-99-83.xnet.hr. [88.207.99.83])
        by smtp.googlemail.com with ESMTPSA id bn20sm4011325ejb.5.2021.11.05.04.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 04:39:06 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        michael@walle.cc
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 2/6] gpio: Add Delta TN48M CPLD GPIO driver
Date:   Fri,  5 Nov 2021 12:38:55 +0100
Message-Id: <20211105113859.101868-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105113859.101868-1-robert.marko@sartura.hr>
References: <20211105113859.101868-1-robert.marko@sartura.hr>
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
---
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
index fab571016adf..31b83271f954 100644
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
+	  they are input-only or ouput-only type.
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
index 000000000000..485565813ad4
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
+	struct gpio_regmap_config config = {0};
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

