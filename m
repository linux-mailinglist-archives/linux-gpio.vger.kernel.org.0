Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CD039DC8F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 14:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhFGMgf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 08:36:35 -0400
Received: from mail-ed1-f45.google.com ([209.85.208.45]:45049 "EHLO
        mail-ed1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbhFGMge (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 08:36:34 -0400
Received: by mail-ed1-f45.google.com with SMTP id u24so20110259edy.11
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 05:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lGX0JNuG31D7qcZgJCbDC1QXAo75ucOQHTYj8s/w3Tk=;
        b=MmuLlDq2V4KmdjVVafyc0Q9KsXRJdG8yNpliR5wm/1W8tW3lib3Ds5v/LHfdcW33+Z
         q8JL/IUn0Wu1Nyrh16IKs73bWd2h7G1NMUl58Fg0CvWnccWBBFP1PaCONNC2B/Ar+HJd
         atfq3xc7L8QAksb5gcdibFtrSZciUam44WRqiYljp9iMApr7mm4AF0ERG1c2Ti2dmAI5
         3tNgnfUSW3Ui0G9rBLlsExr9qSpUJI4xuLx6lv0XcAYPvOumkkaS8nw/cbKPr7iIPTun
         vy4bs+sK88EEA+BVFHFI++Bz6UGtdGbbisI4YUaK/uhA9B91x+Y32VlnA68mctzvZGMa
         4Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lGX0JNuG31D7qcZgJCbDC1QXAo75ucOQHTYj8s/w3Tk=;
        b=lOOcUa7rjqG5WJpcA9PrYfNYfKJc9VQb+JF7focW8xdszsTg3xM5DCMbCp4BRZFj8R
         MI3j4POJnrsh5Q69nQm2JtI0XvRo9g9Q+BxfWOZj5Q7t9S8fa+6vztt+Hy+2w5gQcyAJ
         wEDBHithISnsYBG3gl4yWuuaUKviKUdbUKPokdfUzNoo99bdNq75DTk0xGsjoFnMrSyu
         7NLwxn9PQD0/olbZ5QE+SWtks0hmjcJI8Rq9jiCuTN/Kom7DW/spiW3dn7mFCyAf1j0G
         yRLM7CiJPeAFfu4TDvyk/dCBhWZ3TN7chOq8/aWxGCT2GChzy8dp1kVUC11r09+7jq4K
         gDKQ==
X-Gm-Message-State: AOAM533YlMvcRcJ/RHskfaDZKm9REtMdvF65IveUqzKfCDOZ75X4290v
        3CVT4FTkmguxIJLIAg5UYBZgOg==
X-Google-Smtp-Source: ABdhPJwBkuM9a1lFjS6uETXxtGLxH0bl5hZtHfMKTl7at5o+kdVktFHXtKudt9rIsEgSg6K9xu2oHQ==
X-Received: by 2002:aa7:c4d0:: with SMTP id p16mr20379672edr.150.1623069206234;
        Mon, 07 Jun 2021 05:33:26 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id f18sm6471000ejz.119.2021.06.07.05.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 05:33:25 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v6 2/6] gpio: Add Delta TN48M CPLD GPIO driver
Date:   Mon,  7 Jun 2021 14:33:13 +0200
Message-Id: <20210607123317.3242031-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607123317.3242031-1-robert.marko@sartura.hr>
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.

It is a mix of input only and output only pins.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v6:
* Drop unused header
* Return the return value of device_property_read_u32()
instead of a hardcoded return

Changes in v2:
* Rewrite to use simple I2C MFD and GPIO regmap
* Drop DT bindings for pin numbering

 drivers/gpio/Kconfig      | 12 ++++++
 drivers/gpio/Makefile     |  1 +
 drivers/gpio/gpio-tn48m.c | 88 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 drivers/gpio/gpio-tn48m.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec4c2e8..472f7764508e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1310,6 +1310,18 @@ config GPIO_TIMBERDALE
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
index 000000000000..b12a6b4bc4b3
--- /dev/null
+++ b/drivers/gpio/gpio-tn48m.c
@@ -0,0 +1,88 @@
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
+	TN48M_SFP_TX_DISABLE = 1,
+	TN48M_SFP_PRESENT,
+	TN48M_SFP_LOS,
+};
+
+static int tn48m_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_regmap_config config = {0};
+	enum tn48m_gpio_type type;
+	struct regmap *regmap;
+	u32 base;
+	int ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+
+	type = (uintptr_t)device_get_match_data(&pdev->dev);
+	if (!type)
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
+	config.ngpio = 4;
+
+	switch (type) {
+	case TN48M_SFP_TX_DISABLE:
+		config.reg_set_base = base;
+		break;
+	case TN48M_SFP_PRESENT:
+		config.reg_dat_base = base;
+		break;
+	case TN48M_SFP_LOS:
+		config.reg_dat_base = base;
+		break;
+	default:
+		dev_err(&pdev->dev, "unknown type %d\n", type);
+		return -ENODEV;
+	}
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
+}
+
+static const struct of_device_id tn48m_gpio_of_match[] = {
+	{ .compatible = "delta,tn48m-gpio-sfp-tx-disable", .data = (void *)TN48M_SFP_TX_DISABLE },
+	{ .compatible = "delta,tn48m-gpio-sfp-present", .data = (void *)TN48M_SFP_PRESENT },
+	{ .compatible = "delta,tn48m-gpio-sfp-los", .data = (void *)TN48M_SFP_LOS },
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
2.31.1

