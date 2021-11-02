Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845DD443431
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235026AbhKBQ74 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234926AbhKBQ7r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:59:47 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA79C06120E
        for <linux-gpio@vger.kernel.org>; Tue,  2 Nov 2021 09:57:10 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id o8so6419212edc.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Nov 2021 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rDDYTDspgp8Ul44UQDWDHvvXMcABRbKOgmSpNamD6mw=;
        b=LzZBDppf8fqM2ASseGTdwJ3XSlXUWIc5Ygovur1SMCJPuLPJKWPpNHKTbvBkr2Tv3l
         rsOX1qwNzjg0l0G6KCgWO+d70lldFWxtF88FDX2OHS6mNJCKQughC7F1GOuPjubGT7aE
         yCouxeMt+jfuquesK4NAcTvPbY9QzwSjpE0H+ULo7idOiruM25pBmpcpdX4K2NRfyx7D
         yivMHQSD6xyGooCwZb3VnjZ/ZqibE5FyGXodeStiE6kGLn1xxxddA/yRph+dkO8Moyth
         BC7ODvMlFHZHB3vEToquufbvzhbtcfZbToM38MGjyELkhjH6nEQt0oVbREgMDPJV64XK
         lEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rDDYTDspgp8Ul44UQDWDHvvXMcABRbKOgmSpNamD6mw=;
        b=pdzk1Kjp8iYDMUvkkS8CFhciiOK78i0BRV7he8H1buMMAHrYXXCy3lZmB4P5mhSzPC
         ACut9HhkMuP8hj9JFBoRYZhCpzsvAMvt8CV3S8oSnRZ5SaQ7reRm+Obn39wi1EiSvb3N
         qXF2rvV7ECakqbTWz3nOtgl5I6c5gzi8p5uupPx4qFIQD3SJGIXeCViv21wrwGA5D4WJ
         /wGNjBG2tv9ZEdB0wKPz+H6aYKnZxdRpaPBggXz/kQaY2JKBz2ND62iCphsztu0IweTY
         Wx+CcP750b1RfFkwmht+9wajubT8z9XTcI8Wi2z5GmI6IXoLjmrosaBv54cbUvKDjWlJ
         6Mrw==
X-Gm-Message-State: AOAM531VI3vrFZ9zy2yBSiMt4CLDiOLvQpimlQ9Rv5Xr5zUhFmZga+10
        RPdb+oag6PjaqqnG2IZAoaeXNQ==
X-Google-Smtp-Source: ABdhPJzgAdAimWe6gdDH3/qbllQkSMNCek73zZknfI2crIypdTw1VLgIr8YIRNKHewfLykaIfB4Log==
X-Received: by 2002:a05:6402:26d3:: with SMTP id x19mr17104215edd.279.1635872229377;
        Tue, 02 Nov 2021 09:57:09 -0700 (PDT)
Received: from fedora.. (cpezg-94-253-144-183-cbl.xnet.hr. [94.253.144.183])
        by smtp.googlemail.com with ESMTPSA id i22sm10816297edu.93.2021.11.02.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:57:09 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrew@lunn.ch,
        andy.shevchenko@gmail.com
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 4/6] reset: Add Delta TN48M CPLD reset controller
Date:   Tue,  2 Nov 2021 17:56:55 +0100
Message-Id: <20211102165657.3428995-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102165657.3428995-1-robert.marko@sartura.hr>
References: <20211102165657.3428995-1-robert.marko@sartura.hr>
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
---
Changes in v5:
* Allow COMPILE_TEST as well
* Default to MFD_TN48M_CPLD

Changes in v4:
* Drop assert and deassert as only self-clearing
resets are support by the HW
* Make sure that reset is cleared before returning
from reset.
---
 drivers/reset/Kconfig       |  10 +++
 drivers/reset/Makefile      |   1 +
 drivers/reset/reset-tn48m.c | 128 ++++++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/reset/reset-tn48m.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5656cac04b4c..e76aba5f4c84 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -243,6 +243,16 @@ config RESET_TI_SYSCON
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
index 000000000000..8b58685f4043
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
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/delta,tn48m-reset.h>
+
+#define TN48M_RESET_REG		0x10
+
+#define TN48M_RESET_TIMEOUT	125000
+#define TN48M_RESET_SLEEP	10
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
+					TN48M_RESET_SLEEP,
+					TN48M_RESET_TIMEOUT);
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
+	{ .compatible = "delta,tn48m-reset", },
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

