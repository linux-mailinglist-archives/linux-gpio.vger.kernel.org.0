Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E981C36FA5B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbhD3MgQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbhD3MgO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:36:14 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C2EC06138D
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:35:26 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id bf4so2697337edb.11
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i0cSCbcDHWG/8GaSaPh7T/5+VrTGI0FCz2o91j0PTnQ=;
        b=h3hpWtCxwdwT6lTCfhAxK3+Ql8i6N0Igt1R4A0SuVHRuIqBS9JWrX7dv87ptzXCw9j
         hV3EECstOGdU7Ue3xtbR5fdUG3b7deYCIR0fo2IhFotkqWtuhV50pb11AzvFgLWAlo59
         MT/2PyU09yq159Fq4Zh+oonB76JhyFHhjJ8QIGPB92+pCfLu4S9JtGcpNLOCanOjWLhK
         slHB7JtuKOLoBjlzLnsr4HBAaH9fLFzgeLIDgcVNWG6VRPMOrrR2bSp6dgo4rMFGqCzl
         1/W5xOSQ/Us4nB0fbdWrsOcqnk3ZDWGxKkJnaAmuOk1fvEIYCooQT71YYC58F6q77Y7s
         TE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i0cSCbcDHWG/8GaSaPh7T/5+VrTGI0FCz2o91j0PTnQ=;
        b=T08UV33N9EEMBaOqZk1MMoRDpndCP7vqzmk7j1B/flzS5LuiwBHJ+cqAvcN4xLxlYp
         JKPktGRZECXGbCpCkK8Ua5+5GhZDNvyxo8/ACXP0oW5PMATpv7qGqB2aasnVsOOXP/Nc
         L2DBd2mOpFuGLnYFHLwP5ohxs3YOhHCNV7CCnUzsbd9YjKhHUxQU7oppufoCoa4JhUpL
         kf+eeR0s/jos3RBqndBF5ZwxKPLRy+LRAp1XTI0S8F+LsSBASF+VopJw5y+MBkvk6ysn
         8sZxerS+oBjTKvoSzoxH51Wc1txMXM82nqa3IAgJxDi4w7zAHSQuL4XW32psxl4BkjTw
         hfNA==
X-Gm-Message-State: AOAM5306ir1WBo9owOqKqCfsojwjDU7kw1+SBwkisb2xUt57ShbBp4Y1
        Jn9FnUa9BmoZhXiizo54FRmotg==
X-Google-Smtp-Source: ABdhPJytqxGq0ddEG+C0dxahGrKQzDVHu5R9tF/X8QdWH3+ovV8Syn3VuMaxGGTS7Lf6fLtxLtjUWw==
X-Received: by 2002:aa7:c7cc:: with SMTP id o12mr5720466eds.291.1619786125022;
        Fri, 30 Apr 2021 05:35:25 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-15.xnet.hr. [88.207.97.15])
        by smtp.googlemail.com with ESMTPSA id d15sm1822988ejj.42.2021.04.30.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 05:35:24 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     lee.jones@linaro.org, robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jdelvare@suse.com, linux@roeck-us.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/6] gpio: Add Delta TN48M CPLD GPIO driver
Date:   Fri, 30 Apr 2021 14:35:08 +0200
Message-Id: <20210430123511.116057-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430123511.116057-1-robert.marko@sartura.hr>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.

It is a mix of input only and output only pins.

Since there is no logical GPIO numbering arbitrary one is used
along dt-bindings to make it humanly readable.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/gpio/Kconfig      |  12 +++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-tn48m.c | 191 ++++++++++++++++++++++++++++++++++++++
 drivers/mfd/tn48m-cpld.c  |   6 +-
 include/linux/mfd/tn48m.h |   3 +
 5 files changed, 212 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpio/gpio-tn48m.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec4c2e8..e17d4416786a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1310,6 +1310,18 @@ config GPIO_TIMBERDALE
 	help
 	Add support for the GPIO IP in the timberdale FPGA.
 
+config GPIO_TN48M_CPLD
+	tristate "Delta Networks TN48M switch CPLD GPIO driver"
+	depends on MFD_TN48M_CPLD
+	depends on OF_GPIO
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
index c58a90a3c3b1..271fb806475e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -145,6 +145,7 @@ obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
 obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
 obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
 obj-$(CONFIG_GPIO_TIMBERDALE)		+= gpio-timberdale.o
+obj-$(CONFIG_GPIO_TN48M_CPLD)		+= gpio-tn48m.o
 obj-$(CONFIG_GPIO_TPIC2810)		+= gpio-tpic2810.o
 obj-$(CONFIG_GPIO_TPS65086)		+= gpio-tps65086.o
 obj-$(CONFIG_GPIO_TPS65218)		+= gpio-tps65218.o
diff --git a/drivers/gpio/gpio-tn48m.c b/drivers/gpio/gpio-tn48m.c
new file mode 100644
index 000000000000..4e859e4c339c
--- /dev/null
+++ b/drivers/gpio/gpio-tn48m.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Delta TN48M CPLD GPIO driver
+ *
+ * Copyright 2020 Sartura Ltd
+ *
+ * Author: Robert Marko <robert.marko@sartura.hr>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <linux/mfd/tn48m.h>
+#include <dt-bindings/gpio/tn48m-gpio.h>
+
+struct tn48m_gpio {
+	struct gpio_chip chip;
+	struct tn48m_data *data;
+};
+
+static int tn48m_gpio_get_direction(struct gpio_chip *chip,
+				    unsigned int offset)
+{
+	switch (offset) {
+	case SFP_TX_DISABLE_52:
+	case SFP_TX_DISABLE_51:
+	case SFP_TX_DISABLE_50:
+	case SFP_TX_DISABLE_49:
+		return GPIO_LINE_DIRECTION_OUT;
+	case SFP_PRESENT_52:
+	case SFP_PRESENT_51:
+	case SFP_PRESENT_50:
+	case SFP_PRESENT_49:
+	case SFP_LOS_52:
+	case SFP_LOS_51:
+	case SFP_LOS_50:
+	case SFP_LOS_49:
+		return GPIO_LINE_DIRECTION_IN;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int tn48m_gpio_get_reg(unsigned int offset)
+{
+	switch (offset) {
+	case SFP_TX_DISABLE_52:
+	case SFP_TX_DISABLE_51:
+	case SFP_TX_DISABLE_50:
+	case SFP_TX_DISABLE_49:
+		return SFP_TX_DISABLE;
+	case SFP_PRESENT_52:
+	case SFP_PRESENT_51:
+	case SFP_PRESENT_50:
+	case SFP_PRESENT_49:
+		return SFP_PRESENT;
+	case SFP_LOS_52:
+	case SFP_LOS_51:
+	case SFP_LOS_50:
+	case SFP_LOS_49:
+		return SFP_LOS;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int tn48m_gpio_get_mask(unsigned int offset)
+{
+	switch (offset) {
+	case SFP_TX_DISABLE_52:
+	case SFP_PRESENT_52:
+	case SFP_LOS_52:
+		return BIT(3);
+	case SFP_TX_DISABLE_51:
+	case SFP_PRESENT_51:
+	case SFP_LOS_51:
+		return BIT(2);
+	case SFP_TX_DISABLE_50:
+	case SFP_PRESENT_50:
+	case SFP_LOS_50:
+		return BIT(1);
+	case SFP_TX_DISABLE_49:
+	case SFP_PRESENT_49:
+	case SFP_LOS_49:
+		return BIT(0);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int tn48m_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct tn48m_gpio *gpio = gpiochip_get_data(chip);
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(gpio->data->regmap,
+			  tn48m_gpio_get_reg(offset),
+			  &regval);
+	if (ret < 0)
+		return ret;
+
+	return regval & tn48m_gpio_get_mask(offset);
+}
+
+static void tn48m_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	struct tn48m_gpio *gpio = gpiochip_get_data(chip);
+
+	regmap_update_bits(gpio->data->regmap,
+			   tn48m_gpio_get_reg(offset),
+			   tn48m_gpio_get_mask(offset),
+			   value ? tn48m_gpio_get_mask(offset) : 0);
+}
+
+static int tn48m_gpio_direction_output(struct gpio_chip *chip,
+				       unsigned int offset, int value)
+{
+	tn48m_gpio_set(chip, offset, value);
+
+	return 0;
+}
+
+/*
+ * Required for SFP as it calls gpiod_direction_input()
+ * and if its missing TX disable GPIO will print an
+ * error and not be controlled anymore.
+ */
+static int tn48m_gpio_direction_input(struct gpio_chip *chip,
+				      unsigned int offset)
+{
+	return 0;
+}
+
+static const struct gpio_chip tn48m_template_chip = {
+	.label			= "tn48m-gpio",
+	.owner			= THIS_MODULE,
+	.get_direction		= tn48m_gpio_get_direction,
+	.direction_output	= tn48m_gpio_direction_output,
+	.direction_input	= tn48m_gpio_direction_input,
+	.get			= tn48m_gpio_get,
+	.set			= tn48m_gpio_set,
+	.base			= -1,
+	.ngpio			= 12,
+	.can_sleep		= true,
+};
+
+static int tn48m_gpio_probe(struct platform_device *pdev)
+{
+	struct tn48m_gpio *gpio;
+	int ret;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, gpio);
+
+	gpio->data = dev_get_drvdata(pdev->dev.parent);
+	gpio->chip = tn48m_template_chip;
+	gpio->chip.parent = gpio->data->dev;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id tn48m_gpio_id_table[] = {
+	{ "delta,tn48m-gpio", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, tn48m_gpio_id_table);
+
+static struct platform_driver tn48m_gpio_driver = {
+	.driver = {
+		.name = "tn48m-gpio",
+	},
+	.probe = tn48m_gpio_probe,
+	.id_table = tn48m_gpio_id_table,
+};
+module_platform_driver(tn48m_gpio_driver);
+
+MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
+MODULE_DESCRIPTION("Delta TN48M CPLD GPIO driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/tn48m-cpld.c b/drivers/mfd/tn48m-cpld.c
index b84510fb630a..f22a15ddd22d 100644
--- a/drivers/mfd/tn48m-cpld.c
+++ b/drivers/mfd/tn48m-cpld.c
@@ -17,7 +17,11 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-static const struct mfd_cell tn48m_cell[] = {};
+static const struct mfd_cell tn48m_cell[] = {
+	{
+		.name = "delta,tn48m-gpio",
+	}
+};
 
 static const struct regmap_config tn48m_regmap_config = {
 	.reg_bits = 8,
diff --git a/include/linux/mfd/tn48m.h b/include/linux/mfd/tn48m.h
index 551c550efa54..9cc2b04c8d69 100644
--- a/include/linux/mfd/tn48m.h
+++ b/include/linux/mfd/tn48m.h
@@ -19,6 +19,9 @@
 #define BOARD_ID_TN48M		0xa
 #define BOARD_ID_TN48M_P	0xb
 #define CPLD_CODE_VERSION	0x2
+#define SFP_TX_DISABLE		0x31
+#define SFP_PRESENT		0x3a
+#define SFP_LOS			0x40
 
 struct tn48m_data {
 	struct device *dev;
-- 
2.31.1

