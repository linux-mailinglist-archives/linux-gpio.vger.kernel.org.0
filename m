Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E546F2F97C4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 03:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731303AbhARCOt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Jan 2021 21:14:49 -0500
Received: from foss.arm.com ([217.140.110.172]:48632 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731074AbhARCLA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 17 Jan 2021 21:11:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6204011D4;
        Sun, 17 Jan 2021 18:09:38 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 634153F719;
        Sun, 17 Jan 2021 18:09:36 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Icenowy Zheng <icenowy@aosc.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org
Subject: [PATCH v3 05/21] pinctrl: sunxi: Add support for the Allwinner H616-R pin controller
Date:   Mon, 18 Jan 2021 02:08:32 +0000
Message-Id: <20210118020848.11721-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210118020848.11721-1-andre.przywara@arm.com>
References: <20210118020848.11721-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are only two pins left now, used to connect to the PMIC via I2C.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/pinctrl/sunxi/Kconfig                 |  5 ++
 drivers/pinctrl/sunxi/Makefile                |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616-r.c | 56 +++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-h616-r.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 73e88ce71a48..33751a6a0757 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -124,4 +124,9 @@ config PINCTRL_SUN50I_H616
 	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN50I_H616_R
+	bool "Support for the Allwinner H616 R-PIO"
+	default ARM64 && ARCH_SUNXI
+	select PINCTRL_SUNXI
+
 endif
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 5359327a3c8f..d3440c42b9d6 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -24,5 +24,6 @@ obj-$(CONFIG_PINCTRL_SUN50I_H5)		+= pinctrl-sun50i-h5.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6_R)	+= pinctrl-sun50i-h6-r.o
 obj-$(CONFIG_PINCTRL_SUN50I_H616)	+= pinctrl-sun50i-h616.o
+obj-$(CONFIG_PINCTRL_SUN50I_H616_R)	+= pinctrl-sun50i-h616-r.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80)		+= pinctrl-sun9i-a80.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80_R)	+= pinctrl-sun9i-a80-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616-r.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616-r.c
new file mode 100644
index 000000000000..8e4f10ab96ce
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616-r.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner H616 R_PIO pin controller driver
+ *
+ * Copyright (C) 2020 Arm Ltd.
+ * Based on former work, which is:
+ *   Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/reset.h>
+
+#include "pinctrl-sunxi.h"
+
+static const struct sunxi_desc_pin sun50i_h616_r_pins[] = {
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "s_rsb"),		/* SCK */
+		  SUNXI_FUNCTION(0x3, "s_i2c")),	/* SCK */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "s_rsb"),		/* SDA */
+		  SUNXI_FUNCTION(0x3, "s_i2c")),	/* SDA */
+};
+
+static const struct sunxi_pinctrl_desc sun50i_h616_r_pinctrl_data = {
+	.pins = sun50i_h616_r_pins,
+	.npins = ARRAY_SIZE(sun50i_h616_r_pins),
+	.pin_base = PL_BASE,
+};
+
+static int sun50i_h616_r_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_init(pdev,
+				  &sun50i_h616_r_pinctrl_data);
+}
+
+static const struct of_device_id sun50i_h616_r_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun50i-h616-r-pinctrl", },
+	{}
+};
+
+static struct platform_driver sun50i_h616_r_pinctrl_driver = {
+	.probe	= sun50i_h616_r_pinctrl_probe,
+	.driver	= {
+		.name		= "sun50i-h616-r-pinctrl",
+		.of_match_table	= sun50i_h616_r_pinctrl_match,
+	},
+};
+builtin_platform_driver(sun50i_h616_r_pinctrl_driver);
-- 
2.17.5

