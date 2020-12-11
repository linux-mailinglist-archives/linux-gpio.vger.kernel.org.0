Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEDB32D6D3D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 02:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404889AbgLKBVA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 20:21:00 -0500
Received: from foss.arm.com ([217.140.110.172]:49346 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404783AbgLKBUr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Dec 2020 20:20:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4B13139F;
        Thu, 10 Dec 2020 17:20:00 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90A0B3F66B;
        Thu, 10 Dec 2020 17:19:58 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Icenowy Zheng <icenowy@aosc.xyz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org
Subject: [PATCH v2 03/21] pinctrl: sunxi: Add support for the Allwinner H616 pin controller
Date:   Fri, 11 Dec 2020 01:19:16 +0000
Message-Id: <20201211011934.6171-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20201211011934.6171-1-andre.przywara@arm.com>
References: <20201211011934.6171-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port A is used for an internal connection to some analogue circuitry
which looks like an AC200 IP (as in the H6), though this is not
mentioned in the manual.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig               |   5 +
 drivers/pinctrl/sunxi/Makefile              |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c | 548 ++++++++++++++++++++
 3 files changed, 554 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 593293584ecc..73e88ce71a48 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -119,4 +119,9 @@ config PINCTRL_SUN50I_H6_R
 	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN50I_H616
+	bool "Support for the Allwinner H616 PIO"
+	default ARM64 && ARCH_SUNXI
+	select PINCTRL_SUNXI
+
 endif
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 8b7ff0dc3bdf..5359327a3c8f 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -23,5 +23,6 @@ obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
 obj-$(CONFIG_PINCTRL_SUN50I_H5)		+= pinctrl-sun50i-h5.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6_R)	+= pinctrl-sun50i-h6-r.o
+obj-$(CONFIG_PINCTRL_SUN50I_H616)	+= pinctrl-sun50i-h616.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80)		+= pinctrl-sun9i-a80.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80_R)	+= pinctrl-sun9i-a80-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
new file mode 100644
index 000000000000..02ff80bf163a
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
@@ -0,0 +1,548 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner H616 SoC pinctrl driver.
+ *
+ * Copyright (C) 2020 Arm Ltd.
+ * based on the H6 pinctrl driver
+ *   Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+static const struct sunxi_desc_pin h616_pins[] = {
+	/* Internal connection to the AC200 part */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 0),
+		  SUNXI_FUNCTION(0x2, "emac1")),	/* ERXD1 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 1),
+		  SUNXI_FUNCTION(0x2, "emac1")),	/* ERXD0 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 2),
+		  SUNXI_FUNCTION(0x2, "emac1")),	/* ECRS_DV */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),
+		  SUNXI_FUNCTION(0x2, "emac1")),	/* ERXERR */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 4),
+		  SUNXI_FUNCTION(0x2, "emac1")),	/* ETXD1 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 5),
+		  SUNXI_FUNCTION(0x2, "emac1")),	/* ETXD0 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 6),
+		  SUNXI_FUNCTION(0x2, "emac1")),	/* ETXCK */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 7),
+		  SUNXI_FUNCTION(0x2, "emac1")),	/* ETXEN */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 8),
+		  SUNXI_FUNCTION(0x2, "emac1")),	/* EMDC */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 9),
+		  SUNXI_FUNCTION(0x2, "emac1")),	/* EMDIO */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 10),
+		  SUNXI_FUNCTION(0x2, "i2c3")),		/* SCK */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 11),
+		  SUNXI_FUNCTION(0x2, "i2c3")),		/* SDA */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 12),
+		  SUNXI_FUNCTION(0x2, "pwm5")),
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* WE */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* DS */
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* CLK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),	/* PC_EINT0 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* ALE */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* RST */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),	/* PC_EINT1 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* CLE */
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* MOSI */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),	/* PC_EINT2 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* CE1 */
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* CS0 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),	/* PC_EINT3 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* CE0 */
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* MISO */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),	/* PC_EINT4 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* RE */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* CLK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),	/* PC_EINT5 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* RB0 */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* CMD */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),	/* PC_EINT6 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* RB1 */
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* CS1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 7)),	/* PC_EINT7 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ7 */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D3 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 8)),	/* PC_EINT8 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ6 */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D4 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 9)),	/* PC_EINT9 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ5 */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D0 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 10)),	/* PC_EINT10 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ4 */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D5 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 11)),	/* PC_EINT11 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 12)),	/* PC_EINT12 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ3 */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 13)),	/* PC_EINT13 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ2 */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D6 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 14)),	/* PC_EINT14 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ1 */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D2 */
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* WP */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 15)),	/* PC_EINT15 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ0 */
+		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D7 */
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* HOLD */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 16)),	/* PC_EINT16 */
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D1 */
+		  SUNXI_FUNCTION(0x3, "jtag"),		/* MS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 0)),	/* PF_EINT0 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D0 */
+		  SUNXI_FUNCTION(0x3, "jtag"),		/* DI */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 1)),	/* PF_EINT1 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* CLK */
+		  SUNXI_FUNCTION(0x3, "uart0"),		/* TX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 2)),	/* PF_EINT2 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* CMD */
+		  SUNXI_FUNCTION(0x3, "jtag"),		/* DO */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 3)),	/* PF_EINT3 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D3 */
+		  SUNXI_FUNCTION(0x3, "uart0"),		/* RX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 4)),	/* PF_EINT4 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D2 */
+		  SUNXI_FUNCTION(0x3, "jtag"),		/* CK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 5)),	/* PF_EINT5 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 6)),	/* PF_EINT6 */
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* CLK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 0)),	/* PG_EINT0 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* CMD */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 1)),	/* PG_EINT1 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D0 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 2)),	/* PG_EINT2 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 3)),	/* PG_EINT3 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D2 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 4)),	/* PG_EINT4 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D3 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 5)),	/* PG_EINT5 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart1"),		/* TX */
+		  SUNXI_FUNCTION(0x4, "jtag"),		/* MS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 6)),	/* PG_EINT6 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart1"),		/* RX */
+		  SUNXI_FUNCTION(0x4, "jtag"),		/* CK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 7)),	/* PG_EINT7 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart1"),		/* RTS */
+		  SUNXI_FUNCTION(0x3, "clock"),		/* PLL_LOCK_DEBUG */
+		  SUNXI_FUNCTION(0x4, "jtag"),		/* DO */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 8)),	/* PG_EINT8 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart1"),		/* CTS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 9)),	/* PG_EINT9 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* MCLK */
+		  SUNXI_FUNCTION(0x3, "clock"),		/* X32KFOUT */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 10)),	/* PG_EINT10 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* BCLK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 11)),	/* PG_EINT11 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 12),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* SYNC */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 12)),	/* PG_EINT12 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 13),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* DOUT */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 13)),	/* PG_EINT13 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 14),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* DIN */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 14)),	/* PG_EINT14 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 15),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),		/* TX */
+		  SUNXI_FUNCTION(0x5, "i2c4"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 15)),	/* PG_EINT15 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 16),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),		/* RX */
+		  SUNXI_FUNCTION(0x5, "i2c4"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 16)),	/* PG_EINT16 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 17),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),		/* RTS */
+		  SUNXI_FUNCTION(0x5, "i2c3"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 17)),	/* PG_EINT17 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 18),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),		/* CTS */
+		  SUNXI_FUNCTION(0x5, "i2c3"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 18)),	/* PG_EINT18 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 19),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x4, "pwm1"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 19)),	/* PG_EINT19 */
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart0"),		/* TX */
+		  SUNXI_FUNCTION(0x4, "pwm3"),
+		  SUNXI_FUNCTION(0x5, "i2c1"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),	/* PH_EINT0 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart0"),		/* RX */
+		  SUNXI_FUNCTION(0x4, "pwm4"),
+		  SUNXI_FUNCTION(0x5, "i2c1"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),	/* PH_EINT1 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart5"),		/* TX */
+		  SUNXI_FUNCTION(0x3, "spdif"),		/* MCLK */
+		  SUNXI_FUNCTION(0x4, "pwm2"),
+		  SUNXI_FUNCTION(0x5, "i2c2"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),	/* PH_EINT2 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart5"),		/* RX */
+		  SUNXI_FUNCTION(0x4, "pwm1"),
+		  SUNXI_FUNCTION(0x5, "i2c2"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),	/* PH_EINT3 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x3, "spdif"),		/* OUT */
+		  SUNXI_FUNCTION(0x5, "i2c3"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),	/* PH_EINT4 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),		/* TX */
+		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* MCLK */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS0 */
+		  SUNXI_FUNCTION(0x5, "i2c3"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),	/* PH_EINT5 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),		/* RX */
+		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* BCLK */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* CLK */
+		  SUNXI_FUNCTION(0x5, "i2c4"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),	/* PH_EINT6 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),		/* RTS */
+		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* SYNC */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* MOSI */
+		  SUNXI_FUNCTION(0x5, "i2c4"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),	/* PH_EINT7 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),		/* CTS */
+		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* DO0 */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
+		  SUNXI_FUNCTION(0x5, "h_i2s3"),	/* DI1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 8)),	/* PH_EINT8 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 9),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* DI0 */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS1 */
+		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* DO1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),	/* PH_EINT9 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x3, "ir_rx"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),	/* PH_EINT10 */
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXD3 */
+		  SUNXI_FUNCTION(0x3, "dmic"),		/* CLK */
+		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* MCLK */
+		  SUNXI_FUNCTION(0x5, "hdmi"),		/* HSCL */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 0)),	/* PI_EINT0 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXD2 */
+		  SUNXI_FUNCTION(0x3, "dmic"),		/* DATA0 */
+		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* BCLK */
+		  SUNXI_FUNCTION(0x5, "hdmi"),		/* HSDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 1)),	/* PI_EINT1 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXD1 */
+		  SUNXI_FUNCTION(0x3, "dmic"),		/* DATA1 */
+		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* SYNC */
+		  SUNXI_FUNCTION(0x5, "hdmi"),		/* HCEC */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 2)),	/* PI_EINT2 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXD0 */
+		  SUNXI_FUNCTION(0x3, "dmic"),		/* DATA2 */
+		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* DO0 */
+		  SUNXI_FUNCTION(0x5, "h_i2s0_a"),	/* DI1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 3)),	/* PI_EINT3 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXCK */
+		  SUNXI_FUNCTION(0x3, "dmic"),		/* DATA3 */
+		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* DI0 */
+		  SUNXI_FUNCTION(0x5, "h_i2s0_a"),	/* DO1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 4)),	/* PI_EINT4 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXCTL */
+		  SUNXI_FUNCTION(0x3, "uart2"),		/* TX */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* CLK */
+		  SUNXI_FUNCTION(0x5, "i2c0"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 5)),	/* PI_EINT5 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ENULL */
+		  SUNXI_FUNCTION(0x3, "uart2"),		/* RX */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* ERR */
+		  SUNXI_FUNCTION(0x5, "i2c0"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 6)),	/* PI_EINT6 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXD3 */
+		  SUNXI_FUNCTION(0x3, "uart2"),		/* RTS */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* SYNC */
+		  SUNXI_FUNCTION(0x5, "i2c1"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 7)),	/* PI_EINT7 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 8),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXD2 */
+		  SUNXI_FUNCTION(0x3, "uart2"),		/* CTS */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* DVLD */
+		  SUNXI_FUNCTION(0x5, "i2c1"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 8)),	/* PI_EINT8 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 9),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXD1 */
+		  SUNXI_FUNCTION(0x3, "uart3"),		/* TX */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* D0 */
+		  SUNXI_FUNCTION(0x5, "i2c2"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 9)),	/* PI_EINT9 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 10),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXD0 */
+		  SUNXI_FUNCTION(0x3, "uart3"),		/* RX */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* D1 */
+		  SUNXI_FUNCTION(0x5, "i2c2"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 10)),	/* PI_EINT10 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 11),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXCK */
+		  SUNXI_FUNCTION(0x3, "uart3"),		/* RTS */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* D2 */
+		  SUNXI_FUNCTION(0x5, "pwm1"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 11)),	/* PI_EINT11 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 12),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXCTL */
+		  SUNXI_FUNCTION(0x3, "uart3"),		/* CTS */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* D3 */
+		  SUNXI_FUNCTION(0x5, "pwm2"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 12)),	/* PI_EINT12 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 13),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* ECLKIN */
+		  SUNXI_FUNCTION(0x3, "uart4"),		/* TX */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* D4 */
+		  SUNXI_FUNCTION(0x5, "pwm3"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 13)),	/* PI_EINT13 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 14),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* MDC */
+		  SUNXI_FUNCTION(0x3, "uart4"),		/* RX */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* D5 */
+		  SUNXI_FUNCTION(0x5, "pwm4"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 14)),	/* PI_EINT14 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 15),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* MDIO */
+		  SUNXI_FUNCTION(0x3, "uart4"),		/* RTS */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* D6 */
+		  SUNXI_FUNCTION(0x5, "clock"),		/* CLK_FANOUT0 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 15)),	/* PI_EINT15 */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 16),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "emac0"),		/* EPHY_CLK */
+		  SUNXI_FUNCTION(0x3, "uart4"),		/* CTS */
+		  SUNXI_FUNCTION(0x4, "ts0"),		/* D7 */
+		  SUNXI_FUNCTION(0x5, "clock"),		/* CLK_FANOUT1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 16)),	/* PI_EINT16 */
+};
+static const unsigned int h616_irq_bank_map[] = { 0, 2, 3, 4, 5, 6, 7, 8 };
+
+static const struct sunxi_pinctrl_desc h616_pinctrl_data = {
+	.pins = h616_pins,
+	.npins = ARRAY_SIZE(h616_pins),
+	.irq_banks = ARRAY_SIZE(h616_irq_bank_map),
+	.irq_bank_map = h616_irq_bank_map,
+	.irq_read_needs_mux = true,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+};
+
+static int h616_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_init(pdev, &h616_pinctrl_data);
+}
+
+static const struct of_device_id h616_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun50i-h616-pinctrl", },
+	{}
+};
+
+static struct platform_driver h616_pinctrl_driver = {
+	.probe	= h616_pinctrl_probe,
+	.driver	= {
+		.name		= "sun50i-h616-pinctrl",
+		.of_match_table	= h616_pinctrl_match,
+	},
+};
+builtin_platform_driver(h616_pinctrl_driver);
-- 
2.17.5

