Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA639443423
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbhKBQ7s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234618AbhKBQ7n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:59:43 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B737DC0613F5
        for <linux-gpio@vger.kernel.org>; Tue,  2 Nov 2021 09:57:07 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id f4so20152961edx.12
        for <linux-gpio@vger.kernel.org>; Tue, 02 Nov 2021 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bJLBhHUS7qs9PSWzH59G7r313Yc/Cs8WjA0pjPpGbiE=;
        b=q7Uubr8OR4gWKbQqnqZs0imaFVtJrf+yggtGL2n6cEVh/wzwEjrcYM3sNQyqx5yLeC
         EGfDz0bW/FSGX7z//LJkIdVCwJtf8chZs+p39Kfnbui6fZUi60k3wtz+XuW8VFV4E6X2
         cpvGJBaZPhuqvyD+YVHSOLCFJ+u2Y2UIzPYG3WntZsmH+P6EorVG0BYyN7XUwB3/G65+
         rix985e6xnl5bnDeb2KnwDmTxglXW8CdET9e4MV+jomKiVRc5YmUKWDjf6pCoIe0/2wV
         vTJ2W+W+ZYsq6eZVbrNcrgqu9/Nradiws7/SxD9xKiUCmfxXp0DvWu9ovRObFwAvsWtN
         sbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bJLBhHUS7qs9PSWzH59G7r313Yc/Cs8WjA0pjPpGbiE=;
        b=HEGOdsaGAOsfZ9ulrTbGsnLqb0Lo6ek6+XbB7IF1P1eUh39pVfqZNZFJ9WPC1tGgGw
         oiiIwmrp7P7/b5bEEB8O9seO9bvnt+YH78h0aOPt2ux3W8/tpU+FfFoLcqBiJai0ix+/
         u0Qu58T654SZ30Cf6Ve9lHYXMAD94s64ylhf0dS2LR7k9GT2mDHIUlNavKy1kUlBfQUj
         GW6ma2WqFc6KBVfwjIo0mJiCA7cko7ou/I0xhOQtxM3Hjd+8SNAXsZgc0aec9P7tQA74
         CPFac8nMKatqE+NRDF/0+AI51po3/Bh1cnq5LoqfmNfWuc1TSHVNr5s5kEBcx9MXuhd4
         0A5Q==
X-Gm-Message-State: AOAM533DcfuFUJ89oXAGfFQA1n+gALH5mfrmg26DR/8jgRLZ59Rdgb41
        GffwzQBWDQqJhr/uqJB17vznFQ==
X-Google-Smtp-Source: ABdhPJwiUeHAzZB3F9+g/QU/T6b56+4C/vPdgbNry+/IWlB1K1L+R7QCPpNymiHYNqnSToCwLOm6Fw==
X-Received: by 2002:a05:6402:5189:: with SMTP id q9mr50720480edd.94.1635872226310;
        Tue, 02 Nov 2021 09:57:06 -0700 (PDT)
Received: from fedora.. (cpezg-94-253-144-183-cbl.xnet.hr. [94.253.144.183])
        by smtp.googlemail.com with ESMTPSA id i22sm10816297edu.93.2021.11.02.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:57:05 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrew@lunn.ch,
        andy.shevchenko@gmail.com
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 2/6] gpio: Add Delta TN48M CPLD GPIO driver
Date:   Tue,  2 Nov 2021 17:56:53 +0100
Message-Id: <20211102165657.3428995-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102165657.3428995-1-robert.marko@sartura.hr>
References: <20211102165657.3428995-1-robert.marko@sartura.hr>
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
index fab571016adf..5ccdf0636fad 100644
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
+	  Networks TN48M switch CPLD.
+	  They are used for inputs and outputs on the SFP slots.
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
index 000000000000..08909555e73d
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
+	const struct tn48m_gpio_config *gpio_config = NULL;
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

