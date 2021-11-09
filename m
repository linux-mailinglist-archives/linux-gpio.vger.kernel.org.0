Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D3544ACAA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343510AbhKILfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:35:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343514AbhKILfi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:35:38 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0875AC061764
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:32:52 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id b15so55972839edd.7
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R0qlmA8b2Q34/jYfVqhc8zeHHttMkijpNR47IpgYF3I=;
        b=b//K1QxY7PPyHVUEBRjlr8a7rHYSPKy0qcyFoti9GrgJnkQwMfe21pQohM6awJFH1o
         6zO9kJlkSUro6IaSJ+A/jeIsJaTBW50ytXL923yZVWKsNVSiaLTpej7j57fHzeetB3xw
         P/obxLfGnzbUld1fckZ13Tpb21TzO6i9eJ8c2ODjo0piBN26vb1mf0r3I6u839isO3c4
         APJXRAhJRWPbhTZhSHvhELWrx+5ubnUApSvLMg5gEkp+VwBe55Z2tQWXG1F9enpcZsq+
         CNSOxu3Kb+T14Hp4v3tuQCXk8s0E0D/wcIH4WcbGlJeMQZHZ9yD/uk2PzVYwb15BzcJV
         /Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R0qlmA8b2Q34/jYfVqhc8zeHHttMkijpNR47IpgYF3I=;
        b=OMaSgsRFG1xbkCe5BuU9R0X59ncTLOL5xcWkvqAGf8ASwJOPvv9x9dWLefMk6uNpka
         4xocGCp9NKQl53UsIEOCmbmfDQsiTBr52KwQ73qoPanluP+Hcj1KDT1K5RYt0I/qSm+s
         NBtcijwzI5p7zHjop++6TMAUIjX2LY72Ot1dE1PQt6/Rq7MUOoMAjMmHqBJbPOcsNkQU
         FcPlaq30A235DUxpVE29A5UIH6Icz0CQGverGLRt6n5Z6MtdMmfT0YpFoSd1je0qIQl1
         qBdMhHXTCzq7NkbPgmIml0fIRYU4zr3dDN4n3UCHe4BaIg8CSwzNPiiBkHiS3w9Zugba
         YH4g==
X-Gm-Message-State: AOAM5307t3Hec5zuXcv9tuRyLgK8tdNwabxao4jK/XqgsGce0uXWyjci
        I659SjFyEkF8tXi4+IU3tKWryg==
X-Google-Smtp-Source: ABdhPJyrVpAdBF4tabZcr5BDMz/rwGVQ7ZFl0Bz0ZvxxzUxTh+ylyh8rId/7TyrGh2ZKuwUEmyxTIQ==
X-Received: by 2002:a05:6402:3508:: with SMTP id b8mr9118693edd.347.1636457570540;
        Tue, 09 Nov 2021 03:32:50 -0800 (PST)
Received: from fedora.. (cpezg-94-253-144-18-cbl.xnet.hr. [94.253.144.18])
        by smtp.googlemail.com with ESMTPSA id s4sm6771167ejn.25.2021.11.09.03.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 03:32:50 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        andy.shevchenko@gmail.com, michael@walle.cc, andrew@lunn.ch
Cc:     luka.perkov@sartura.hr, bruno.banelli@sartura.hr,
        Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 4/6] reset: Add Delta TN48M CPLD reset controller
Date:   Tue,  9 Nov 2021 12:32:37 +0100
Message-Id: <20211109113239.93493-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109113239.93493-1-robert.marko@sartura.hr>
References: <20211109113239.93493-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Delta TN48M CPLD exposes resets for the following:
* 88F7040 SoC
* 88F6820 SoC
* 98DX3265 switch MAC-s
* 88E1680 PHY-s
* 88E1512 PHY
* PoE PSE controller

Controller supports only self clearing resets.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
Changes in v9:
* Expand KConfig help per Andys comment
* Drop the comma in of_device_id per Andys comment

Changes in v8:
* Drop of.h and include mod_devicetable.h per Andys comment
* Mark the units used in timeout and sleep defines for the timeout poller

Changes in v5:
* Allow COMPILE_TEST as well
* Default to MFD_TN48M_CPLD

Changes in v4:
* Drop assert and deassert as only self-clearing
resets are support by the HW
* Make sure that reset is cleared before returning
from reset.

reset
---
 drivers/reset/Kconfig       |  13 ++++
 drivers/reset/Makefile      |   1 +
 drivers/reset/reset-tn48m.c | 128 ++++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 drivers/reset/reset-tn48m.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5656cac04b4c..4f4e6d76c1f2 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -243,6 +243,19 @@ config RESET_TI_SYSCON
 	  you wish to use the reset framework for such memory-mapped devices,
 	  say Y here. Otherwise, say N.
 
+config RESET_TN48M_CPLD
+	tristate "Delta Networks TN48M switch CPLD reset controller"
+	depends on MFD_TN48M_CPLD || COMPILE_TEST
+	default MFD_TN48M_CPLD
+	help
+	  This enables the reset controller driver for the Delta TN48M CPLD.
+	  It provides reset signals for Armada 7040 and 385 SoC-s, Alleycat 3X
+	  switch MAC-s, Alaska OOB ethernet PHY, Quad Alaska ethernet PHY-s and
+	  Microchip PD69200 PoE PSE controller.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called reset-tn48m.
+
 config RESET_UNIPHIER
 	tristate "Reset controller driver for UniPhier SoCs"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index ea8b8d9ca565..79beab92324f 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
 obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
+obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o
 obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
diff --git a/drivers/reset/reset-tn48m.c b/drivers/reset/reset-tn48m.c
new file mode 100644
index 000000000000..130027291b6e
--- /dev/null
+++ b/drivers/reset/reset-tn48m.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Delta TN48M CPLD reset driver
+ *
+ * Copyright (C) 2021 Sartura Ltd.
+ *
+ * Author: Robert Marko <robert.marko@sartura.hr>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/delta,tn48m-reset.h>
+
+#define TN48M_RESET_REG		0x10
+
+#define TN48M_RESET_TIMEOUT_US	125000
+#define TN48M_RESET_SLEEP_US	10
+
+struct tn48_reset_map {
+	u8 bit;
+};
+
+struct tn48_reset_data {
+	struct reset_controller_dev rcdev;
+	struct regmap *regmap;
+};
+
+static const struct tn48_reset_map tn48m_resets[] = {
+	[CPU_88F7040_RESET] = {0},
+	[CPU_88F6820_RESET] = {1},
+	[MAC_98DX3265_RESET] = {2},
+	[PHY_88E1680_RESET] = {4},
+	[PHY_88E1512_RESET] = {6},
+	[POE_RESET] = {7},
+};
+
+static inline struct tn48_reset_data *to_tn48_reset_data(
+			struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct tn48_reset_data, rcdev);
+}
+
+static int tn48m_control_reset(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
+	unsigned int val;
+
+	regmap_update_bits(data->regmap, TN48M_RESET_REG,
+			   BIT(tn48m_resets[id].bit), 0);
+
+	return regmap_read_poll_timeout(data->regmap,
+					TN48M_RESET_REG,
+					val,
+					val & BIT(tn48m_resets[id].bit),
+					TN48M_RESET_SLEEP_US,
+					TN48M_RESET_TIMEOUT_US);
+}
+
+static int tn48m_control_status(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(data->regmap, TN48M_RESET_REG, &regval);
+	if (ret < 0)
+		return ret;
+
+	if (BIT(tn48m_resets[id].bit) & regval)
+		return 0;
+	else
+		return 1;
+}
+
+static const struct reset_control_ops tn48_reset_ops = {
+	.reset		= tn48m_control_reset,
+	.status		= tn48m_control_status,
+};
+
+static int tn48m_reset_probe(struct platform_device *pdev)
+{
+	struct tn48_reset_data *data;
+	struct regmap *regmap;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = regmap;
+
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &tn48_reset_ops;
+	data->rcdev.nr_resets = ARRAY_SIZE(tn48m_resets);
+	data->rcdev.of_node = pdev->dev.of_node;
+
+	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
+}
+
+static const struct of_device_id tn48m_reset_of_match[] = {
+	{ .compatible = "delta,tn48m-reset" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tn48m_reset_of_match);
+
+static struct platform_driver tn48m_reset_driver = {
+	.driver = {
+		.name = "delta-tn48m-reset",
+		.of_match_table = tn48m_reset_of_match,
+	},
+	.probe = tn48m_reset_probe,
+};
+module_platform_driver(tn48m_reset_driver);
+
+MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
+MODULE_DESCRIPTION("Delta TN48M CPLD reset driver");
+MODULE_LICENSE("GPL");
-- 
2.33.1

