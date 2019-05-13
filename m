Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 469AA1BA09
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731344AbfEMP3I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:29:08 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:33946 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731348AbfEMP3H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:29:07 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id BrV22000J3XaVaC01rV2Da; Mon, 13 May 2019 17:29:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0001dN-8u; Mon, 13 May 2019 17:29:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0003Qn-7P; Mon, 13 May 2019 17:29:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/11] pinctrl: sh-pfc: r8a7790: Use new macros for non-GPIO pins
Date:   Mon, 13 May 2019 17:28:50 +0200
Message-Id: <20190513152857.13122-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
References: <20190513152857.13122-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the R-Car H2 pin control driver to use the new macros for
describing pins without GPIO functionality.  This replaces the use of
physical pin numbers on the R-Car H2 SoC (in 31x31 FCBGA package) by
symbolic enum values, referring to signal names.

Note that the user-visible names of these pins are still based on pin
numbers instead of signal names, to preserve DT backwards compatibility.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 34 ++++++++++++++++------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index 80d33c7398df4388..3366ed561cceefdb 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -28,6 +28,12 @@
 	PORT_GP_32(4, fn, sfx),						\
 	PORT_GP_32(5, fn, sfx)
 
+#define CPU_ALL_NOGP(fn)		\
+	PIN_NOGP(IIC0_SDA, "AF15", fn),	\
+	PIN_NOGP(IIC0_SCL, "AG15", fn),	\
+	PIN_NOGP(IIC3_SDA, "AH15", fn),	\
+	PIN_NOGP(IIC3_SCL, "AJ15", fn)
+
 enum {
 	PINMUX_RESERVED = 0,
 
@@ -1727,19 +1733,17 @@ static const u16 pinmux_data[] = {
 	PINMUX_DATA(I2C3_SDA_MARK, FN_SEL_IICDVFS_1),
 };
 
-/* R8A7790 has 6 banks with 32 GPIOs in each = 192 GPIOs */
-#define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
-#define PIN_NUMBER(r, c) (((r) - 'A') * 31 + (c) + 200)
-#define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
+/*
+ * Pins not associated with a GPIO port.
+ */
+enum {
+	GP_ASSIGN_LAST(),
+	NOGP_ALL(),
+};
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
-
-	/* Pins not associated with a GPIO port */
-	SH_PFC_PIN_NAMED(ROW_GROUP_A('F'), 15, AF15),
-	SH_PFC_PIN_NAMED(ROW_GROUP_A('G'), 15, AG15),
-	SH_PFC_PIN_NAMED(ROW_GROUP_A('H'), 15, AH15),
-	SH_PFC_PIN_NAMED(ROW_GROUP_A('J'), 15, AJ15),
+	PINMUX_NOGP_ALL(),
 };
 
 /* - AUDIO CLOCK ------------------------------------------------------------ */
@@ -2135,7 +2139,7 @@ static const unsigned int hscif1_ctrl_b_mux[] = {
 /* - I2C0 ------------------------------------------------------------------- */
 static const unsigned int i2c0_pins[] = {
 	/* SCL, SDA */
-	PIN_A_NUMBER('G', 15), PIN_A_NUMBER('F', 15),
+	PIN_IIC0_SCL, PIN_IIC0_SDA,
 };
 static const unsigned int i2c0_mux[] = {
 	I2C0_SCL_MARK, I2C0_SDA_MARK,
@@ -2201,7 +2205,7 @@ static const unsigned int i2c2_e_mux[] = {
 /* - I2C3 ------------------------------------------------------------------- */
 static const unsigned int i2c3_pins[] = {
 	/* SCL, SDA */
-	PIN_A_NUMBER('J', 15), PIN_A_NUMBER('H', 15),
+	PIN_IIC3_SCL, PIN_IIC3_SDA,
 };
 static const unsigned int i2c3_mux[] = {
 	I2C3_SCL_MARK, I2C3_SDA_MARK,
@@ -2209,7 +2213,7 @@ static const unsigned int i2c3_mux[] = {
 /* - IIC0 (I2C4) ------------------------------------------------------------ */
 static const unsigned int iic0_pins[] = {
 	/* SCL, SDA */
-	PIN_A_NUMBER('G', 15), PIN_A_NUMBER('F', 15),
+	PIN_IIC0_SCL, PIN_IIC0_SDA,
 };
 static const unsigned int iic0_mux[] = {
 	IIC0_SCL_MARK, IIC0_SDA_MARK,
@@ -2274,8 +2278,8 @@ static const unsigned int iic2_e_mux[] = {
 };
 /* - IIC3 (I2C7) ------------------------------------------------------------ */
 static const unsigned int iic3_pins[] = {
-/* SCL, SDA */
-	PIN_A_NUMBER('J', 15), PIN_A_NUMBER('H', 15),
+	/* SCL, SDA */
+	PIN_IIC3_SCL, PIN_IIC3_SDA,
 };
 static const unsigned int iic3_mux[] = {
 	IIC3_SCL_MARK, IIC3_SDA_MARK,
-- 
2.17.1

