Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67FE14F9EA
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jun 2019 06:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfFWEjD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jun 2019 00:39:03 -0400
Received: from hermes.aosc.io ([199.195.250.187]:52118 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbfFWEjD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 23 Jun 2019 00:39:03 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 9D2BE6CCAF;
        Sun, 23 Jun 2019 04:38:54 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 1/9] pinctrl: sunxi: v3s: introduce support for V3
Date:   Sun, 23 Jun 2019 12:37:53 +0800
Message-Id: <20190623043801.14040-2-icenowy@aosc.io>
In-Reply-To: <20190623043801.14040-1-icenowy@aosc.io>
References: <20190623043801.14040-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce the GPIO pins that is only available on V3 (not on V3s) to the
V3s pinctrl driver.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v3:
- Fixed code alignment.
- Fixed LVDS function number.

Changes in v2:
- Dropped the driver rename patch and apply the changes directly on V3s
  driver.

 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c | 473 +++++++++++++++++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h     |   2 +
 2 files changed, 366 insertions(+), 109 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
index 6704ce8e5e3d..721c997d472b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
@@ -1,5 +1,5 @@
 /*
- * Allwinner V3s SoCs pinctrl driver.
+ * Allwinner V3/V3s SoCs pinctrl driver.
  *
  * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
  *
@@ -28,235 +28,433 @@ static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "uart2"),		/* TX */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),	/* PB_EINT0 */
+		  SUNXI_FUNCTION(0x2, "uart2"),			/* TX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),		/* PB_EINT0 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 1),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "uart2"),		/* RX */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),	/* PB_EINT1 */
+		  SUNXI_FUNCTION(0x2, "uart2"),			/* RX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),		/* PB_EINT1 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 2),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "uart2"),		/* RTS */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),	/* PB_EINT2 */
+		  SUNXI_FUNCTION(0x2, "uart2"),			/* RTS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),		/* PB_EINT2 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "uart2"),		/* D1 */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),	/* PB_EINT3 */
+		  SUNXI_FUNCTION(0x2, "uart2"),			/* D1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),		/* PB_EINT3 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 4),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "pwm0"),
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),	/* PB_EINT4 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),		/* PB_EINT4 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 5),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "pwm1"),
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),	/* PB_EINT5 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),		/* PB_EINT5 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 6),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),	/* PB_EINT6 */
+		  SUNXI_FUNCTION(0x2, "i2c0"),			/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),		/* PB_EINT6 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 7),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SDA */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),	/* PB_EINT7 */
+		  SUNXI_FUNCTION(0x2, "i2c0"),			/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),		/* PB_EINT7 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 8),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SDA */
-		  SUNXI_FUNCTION(0x3, "uart0"),		/* TX */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)),	/* PB_EINT8 */
+		  SUNXI_FUNCTION(0x2, "i2c1"),			/* SDA */
+		  SUNXI_FUNCTION(0x3, "uart0"),			/* TX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)),		/* PB_EINT8 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 9),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
-		  SUNXI_FUNCTION(0x3, "uart0"),		/* RX */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),	/* PB_EINT9 */
+		  SUNXI_FUNCTION(0x2, "i2c1"),			/* SCK */
+		  SUNXI_FUNCTION(0x3, "uart0"),			/* RX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),		/* PB_EINT9 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(B, 10),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "jtag"),		/* MS */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),	/* PB_EINT10 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(B, 11),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "jtag"),		/* CK */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),	/* PB_EINT11 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(B, 12),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "jtag"),		/* DO */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)),	/* PB_EINT12 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(B, 13),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "jtag"),		/* DI */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)),	/* PB_EINT13 */
 	/* Hole */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc2"),		/* CLK */
-		  SUNXI_FUNCTION(0x3, "spi0")),		/* MISO */
+		  SUNXI_FUNCTION(0x2, "mmc2"),			/* CLK */
+		  SUNXI_FUNCTION(0x3, "spi0")),			/* MISO */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc2"),		/* CMD */
-		  SUNXI_FUNCTION(0x3, "spi0")),		/* CLK */
+		  SUNXI_FUNCTION(0x2, "mmc2"),			/* CMD */
+		  SUNXI_FUNCTION(0x3, "spi0")),			/* CLK */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc2"),		/* RST */
-		  SUNXI_FUNCTION(0x3, "spi0")),		/* CS */
+		  SUNXI_FUNCTION(0x2, "mmc2"),			/* RST */
+		  SUNXI_FUNCTION(0x3, "spi0")),			/* CS */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc2"),		/* D0 */
-		  SUNXI_FUNCTION(0x3, "spi0")),		/* MOSI */
+		  SUNXI_FUNCTION(0x2, "mmc2"),			/* D0 */
+		  SUNXI_FUNCTION(0x3, "spi0")),			/* MOSI */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 4),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "mmc2")),		/* D1 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 5),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "mmc2")),		/* D2 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 6),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "mmc2")),		/* D3 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 7),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "mmc2")),		/* D4 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 8),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "mmc2")),		/* D5 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 9),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "mmc2")),		/* D6 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 10),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "mmc2")),		/* D7 */
+	/* Hole */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 0),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D2 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* RXD3 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 1),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D3 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* RXD2 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 2),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D4 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* RXD1 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 3),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D5 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* RXD0 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 4),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D6 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* RXCK */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 5),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D7 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* RXCTL/RXDV */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 6),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D10 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* RXERR */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 7),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D11 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* TXD3 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 8),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D12 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* TXD2 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 9),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D13 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* TXD1 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 10),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D14 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* TXD0 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 11),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D15 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* CRS */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 12),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D18 */
+			  SUNXI_FUNCTION(0x3, "lvds"),		/* VP0 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* TXCK */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 13),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D19 */
+			  SUNXI_FUNCTION(0x3, "lvds"),		/* VN0 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* TXCTL/TXEN */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 14),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D20 */
+			  SUNXI_FUNCTION(0x3, "lvds"),		/* VP1 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* TXERR */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 15),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D21 */
+			  SUNXI_FUNCTION(0x3, "lvds"),		/* VN1 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* CLKIN/COL */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 16),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D22 */
+			  SUNXI_FUNCTION(0x3, "lvds"),		/* VP2 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* MDC */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 17),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D23 */
+			  SUNXI_FUNCTION(0x3, "lvds"),		/* VN2 */
+			  SUNXI_FUNCTION(0x4, "emac")),		/* MDIO */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 18),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* CLK */
+			  SUNXI_FUNCTION(0x3, "lvds")),		/* VPC */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 19),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* DE */
+			  SUNXI_FUNCTION(0x3, "lvds")),		/* VNC */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 20),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* HSYNC */
+			  SUNXI_FUNCTION(0x3, "lvds")),		/* VP3 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 21),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* VSYNC */
+			  SUNXI_FUNCTION(0x3, "lvds")),		/* VN3 */
 	/* Hole */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 0),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* PCLK */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* CLK */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* PCLK */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* CLK */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 1),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* MCLK */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* DE */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* MCLK */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* DE */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 2),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* HSYNC */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* HSYNC */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* HSYNC */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* HSYNC */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* VSYNC */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* VSYNC */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* VSYNC */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* VSYNC */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 4),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D0 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D2 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D0 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D2 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 5),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D1 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D3 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D1 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D3 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 6),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D2 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D4 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D2 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D4 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 7),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D3 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D5 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D3 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D5 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 8),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D4 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D6 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D4 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D6 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 9),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D5 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D7 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D5 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D7 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 10),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D6 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D10 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D6 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D10 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 11),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D7 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D11 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D7 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D11 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 12),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D8 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D12 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D8 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D12 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 13),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D9 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D13 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D9 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D13 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 14),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D10 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D14 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D10 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D14 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 15),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D11 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D15 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D11 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D15 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 16),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D12 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D18 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D12 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D18 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 17),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D13 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D19 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D13 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D19 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 18),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D14 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D20 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D14 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D20 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 19),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* D15 */
-		  SUNXI_FUNCTION(0x3, "lcd")),		/* D21 */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* D15 */
+		  SUNXI_FUNCTION(0x3, "lcd")),			/* D21 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 20),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* FIELD */
-		  SUNXI_FUNCTION(0x3, "csi_mipi")),	/* MCLK */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* FIELD */
+		  SUNXI_FUNCTION(0x3, "csi_mipi")),		/* MCLK */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 21),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* SCK */
-		  SUNXI_FUNCTION(0x3, "i2c1"),		/* SCK */
-		  SUNXI_FUNCTION(0x4, "uart1")),	/* TX */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* SCK */
+		  SUNXI_FUNCTION(0x3, "i2c1"),			/* SCK */
+		  SUNXI_FUNCTION(0x4, "uart1")),		/* TX */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 22),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi"),		/* SDA */
-		  SUNXI_FUNCTION(0x3, "i2c1"),		/* SDA */
-		  SUNXI_FUNCTION(0x4, "uart1")),	/* RX */
+		  SUNXI_FUNCTION(0x2, "csi"),			/* SDA */
+		  SUNXI_FUNCTION(0x3, "i2c1"),			/* SDA */
+		  SUNXI_FUNCTION(0x4, "uart1")),		/* RX */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 23),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x3, "lcd"),		/* D22 */
-		  SUNXI_FUNCTION(0x4, "uart1")),	/* RTS */
+		  SUNXI_FUNCTION(0x3, "lcd"),			/* D22 */
+		  SUNXI_FUNCTION(0x4, "uart1")),		/* RTS */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 24),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x3, "lcd"),		/* D23 */
-		  SUNXI_FUNCTION(0x4, "uart1")),	/* CTS */
+		  SUNXI_FUNCTION(0x3, "lcd"),			/* D23 */
+		  SUNXI_FUNCTION(0x4, "uart1")),		/* CTS */
 	/* Hole */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D1 */
-		  SUNXI_FUNCTION(0x3, "jtag")),		/* MS */
+		  SUNXI_FUNCTION(0x2, "mmc0"),			/* D1 */
+		  SUNXI_FUNCTION(0x3, "jtag")),			/* MS */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D0 */
-		  SUNXI_FUNCTION(0x3, "jtag")),		/* DI */
+		  SUNXI_FUNCTION(0x2, "mmc0"),			/* D0 */
+		  SUNXI_FUNCTION(0x3, "jtag")),			/* DI */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc0"),		/* CLK */
-		  SUNXI_FUNCTION(0x3, "uart0")),	/* TX */
+		  SUNXI_FUNCTION(0x2, "mmc0"),			/* CLK */
+		  SUNXI_FUNCTION(0x3, "uart0")),		/* TX */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc0"),		/* CMD */
-		  SUNXI_FUNCTION(0x3, "jtag")),		/* DO */
+		  SUNXI_FUNCTION(0x2, "mmc0"),			/* CMD */
+		  SUNXI_FUNCTION(0x3, "jtag")),			/* DO */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D3 */
-		  SUNXI_FUNCTION(0x3, "uart0")),	/* RX */
+		  SUNXI_FUNCTION(0x2, "mmc0"),			/* D3 */
+		  SUNXI_FUNCTION(0x3, "uart0")),		/* RX */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D2 */
-		  SUNXI_FUNCTION(0x3, "jtag")),		/* CK */
+		  SUNXI_FUNCTION(0x2, "mmc0"),			/* D2 */
+		  SUNXI_FUNCTION(0x3, "jtag")),			/* CK */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out")),
@@ -264,33 +462,81 @@ static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc1"),		/* CLK */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),	/* PG_EINT0 */
+		  SUNXI_FUNCTION(0x2, "mmc1"),			/* CLK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),		/* PG_EINT0 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc1"),		/* CMD */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),	/* PG_EINT1 */
+		  SUNXI_FUNCTION(0x2, "mmc1"),			/* CMD */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),		/* PG_EINT1 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D0 */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),	/* PG_EINT2 */
+		  SUNXI_FUNCTION(0x2, "mmc1"),			/* D0 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),		/* PG_EINT2 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D1 */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),	/* PG_EINT3 */
+		  SUNXI_FUNCTION(0x2, "mmc1"),			/* D1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),		/* PG_EINT3 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D2 */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),	/* PG_EINT4 */
+		  SUNXI_FUNCTION(0x2, "mmc1"),			/* D2 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),		/* PG_EINT4 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D3 */
-		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),	/* PG_EINT5 */
+		  SUNXI_FUNCTION(0x2, "mmc1"),			/* D3 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),		/* PG_EINT5 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 6),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "uart1"),		/* TX */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),	/* PG_EINT6 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 7),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "uart1"),		/* RX */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 7)),	/* PG_EINT7 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 8),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "uart1"),		/* RTS */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 8)),	/* PG_EINT8 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 9),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "uart1"),		/* CTS */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 9)),	/* PG_EINT9 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 10),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "i2s"),		/* SYNC */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 10)),	/* PG_EINT10 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 11),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "i2s"),		/* BCLK */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 11)),	/* PG_EINT11 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 12),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "i2s"),		/* DOUT */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 12)),	/* PG_EINT12 */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 13),
+			  PINCTRL_SUN8I_V3,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "i2s"),		/* DIN */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 13)),	/* PG_EINT13 */
 };
 
 static const unsigned int sun8i_v3s_pinctrl_irq_bank_map[] = { 1, 2 };
@@ -305,13 +551,22 @@ static const struct sunxi_pinctrl_desc sun8i_v3s_pinctrl_data = {
 
 static int sun8i_v3s_pinctrl_probe(struct platform_device *pdev)
 {
-	return sunxi_pinctrl_init(pdev,
-				  &sun8i_v3s_pinctrl_data);
+	unsigned long variant = (unsigned long)of_device_get_match_data(&pdev->dev);
+
+	return sunxi_pinctrl_init_with_variant(pdev, &sun8i_v3s_pinctrl_data,
+					       variant);
 }
 
 static const struct of_device_id sun8i_v3s_pinctrl_match[] = {
-	{ .compatible = "allwinner,sun8i-v3s-pinctrl", },
-	{}
+	{
+		.compatible = "allwinner,sun8i-v3-pinctrl",
+		.data = (void *)PINCTRL_SUN8I_V3
+	},
+	{
+		.compatible = "allwinner,sun8i-v3s-pinctrl",
+		.data = (void *)PINCTRL_SUN8I_V3S
+	},
+	{ },
 };
 
 static struct platform_driver sun8i_v3s_pinctrl_driver = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 44e30deeee38..a32bb5bcb754 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -94,6 +94,8 @@
 #define PINCTRL_SUN4I_A10	BIT(6)
 #define PINCTRL_SUN7I_A20	BIT(7)
 #define PINCTRL_SUN8I_R40	BIT(8)
+#define PINCTRL_SUN8I_V3	BIT(9)
+#define PINCTRL_SUN8I_V3S	BIT(10)
 
 #define PIO_POW_MOD_SEL_REG	0x340
 
-- 
2.21.0

