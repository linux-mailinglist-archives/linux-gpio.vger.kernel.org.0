Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC9011BA08
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731351AbfEMP3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:29:07 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:51266 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731334AbfEMP3G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:29:06 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id BrV32000C3XaVaC01rV3Qg; Mon, 13 May 2019 17:29:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0001dI-7i; Mon, 13 May 2019 17:29:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0003Qk-64; Mon, 13 May 2019 17:29:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/11] pinctrl: sh-pfc: r8a7778: Use new macros for non-GPIO pins
Date:   Mon, 13 May 2019 17:28:49 +0200
Message-Id: <20190513152857.13122-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
References: <20190513152857.13122-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the R-Car M1A pin control driver to use the new macros for
describing pins without GPIO functionality.  This replaces the use of
physical pin numbers on the R-Car M1A SoC (in 25x25 FCBGA package) by
symbolic enum values, referring to signal names.

Note that the user-visible names of these pins are still based on pin
numbers instead of signal names, to preserve DT backwards compatibility.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c | 29 +++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
index 564b219942aac34c..24866a5958aee512 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
@@ -29,6 +29,11 @@
 	PORT_GP_CFG_32(3, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_27(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
 
+#define CPU_ALL_NOGP(fn)		\
+	PIN_NOGP(CLKOUT, "B25", fn),	\
+	PIN_NOGP(CS0, "A20", fn),	\
+	PIN_NOGP(CS1_A26, "C20", fn)
+
 enum {
 	PINMUX_RESERVED = 0,
 
@@ -1237,19 +1242,17 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP10_24_22,	CAN_CLK_C,	SEL_CANCLK_C),
 };
 
-/* Pin numbers for pins without a corresponding GPIO port number are computed
- * from the row and column numbers with a 1000 offset to avoid collisions with
- * GPIO port numbers.
+/*
+ * Pins not associated with a GPIO port.
  */
-#define PIN_NUMBER(row, col)		(1000+((row)-1)*25+(col)-1)
+enum {
+	GP_ASSIGN_LAST(),
+	NOGP_ALL(),
+};
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
-
-	/* Pins not associated with a GPIO port */
-	SH_PFC_PIN_NAMED(3, 20, C20),
-	SH_PFC_PIN_NAMED(1, 20, A20),
-	SH_PFC_PIN_NAMED(2, 25, B25),
+	PINMUX_NOGP_ALL(),
 };
 
 /* - macro */
@@ -1384,7 +1387,7 @@ HSPI_PFC_DAT(hspi1_a,	HSPI_CLK1_A,		HSPI_CS1_A,
 			HSPI_RX1_A,		HSPI_TX1_A);
 
 HSPI_PFC_PIN(hspi1_b,	RCAR_GP_PIN(0, 27),	RCAR_GP_PIN(0, 26),
-			PIN_NUMBER(1, 20),	PIN_NUMBER(2, 25));
+			PIN_CS0,		PIN_CLKOUT);
 HSPI_PFC_DAT(hspi1_b,	HSPI_CLK1_B,		HSPI_CS1_B,
 			HSPI_RX1_B,		HSPI_TX1_B);
 
@@ -1410,7 +1413,7 @@ I2C_PFC_PIN(i2c1_b,	RCAR_GP_PIN(4, 17),	RCAR_GP_PIN(4, 18));
 I2C_PFC_MUX(i2c1_b,	SDA1_B,			SCL1_B);
 
 /* - I2C2 ------------------------------------------------------------------ */
-I2C_PFC_PIN(i2c2_a,	PIN_NUMBER(3, 20),	RCAR_GP_PIN(1, 3));
+I2C_PFC_PIN(i2c2_a,	PIN_CS1_A26,		RCAR_GP_PIN(1, 3));
 I2C_PFC_MUX(i2c2_a,	SDA2_A,			SCL2_A);
 I2C_PFC_PIN(i2c2_b,	RCAR_GP_PIN(0, 3),	RCAR_GP_PIN(0, 4));
 I2C_PFC_MUX(i2c2_b,	SDA2_B,			SCL2_B);
@@ -1500,7 +1503,7 @@ SCIF_PFC_PIN(scif2_data_e,	RCAR_GP_PIN(0, 3),	RCAR_GP_PIN(0, 4));
 SCIF_PFC_DAT(scif2_data_e,	TX2_E,			RX2_E);
 SCIF_PFC_PIN(scif2_clk_a,	RCAR_GP_PIN(3, 9));
 SCIF_PFC_CLK(scif2_clk_a,	SCK2_A);
-SCIF_PFC_PIN(scif2_clk_b,	PIN_NUMBER(3, 20));
+SCIF_PFC_PIN(scif2_clk_b,	PIN_CS1_A26);
 SCIF_PFC_CLK(scif2_clk_b,	SCK2_B);
 SCIF_PFC_PIN(scif2_clk_c,	RCAR_GP_PIN(4, 12));
 SCIF_PFC_CLK(scif2_clk_c,	SCK2_C);
@@ -1615,7 +1618,7 @@ SSI_PFC_PINS(ssi0_data,		RCAR_GP_PIN(3, 10));
 SSI_PFC_DATA(ssi0_data,		SSI_SDATA0);
 SSI_PFC_PINS(ssi1_a_ctrl,	RCAR_GP_PIN(2, 20),	RCAR_GP_PIN(2, 21));
 SSI_PFC_CTRL(ssi1_a_ctrl,	SSI_SCK1_A,		SSI_WS1_A);
-SSI_PFC_PINS(ssi1_b_ctrl,	PIN_NUMBER(3, 20),	RCAR_GP_PIN(1, 3));
+SSI_PFC_PINS(ssi1_b_ctrl,	PIN_CS1_A26,		RCAR_GP_PIN(1, 3));
 SSI_PFC_CTRL(ssi1_b_ctrl,	SSI_SCK1_B,		SSI_WS1_B);
 SSI_PFC_PINS(ssi1_data,		RCAR_GP_PIN(3, 9));
 SSI_PFC_DATA(ssi1_data,		SSI_SDATA1);
-- 
2.17.1

