Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E691BA11
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731333AbfEMP3I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:29:08 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:55958 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731345AbfEMP3G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:29:06 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id BrV32000H3XaVaC01rV3y0; Mon, 13 May 2019 17:29:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0001dD-6O; Mon, 13 May 2019 17:29:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0003Qg-4l; Mon, 13 May 2019 17:29:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/11] pinctrl: sh-pfc: emev2: Use new macros for non-GPIO pins
Date:   Mon, 13 May 2019 17:28:48 +0200
Message-Id: <20190513152857.13122-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
References: <20190513152857.13122-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the EMMA Mobile EV2 pin control driver to use the new macros for
describing pins without GPIO functionality.  This replaces the use of
physical pin numbers on the EMMA Mobile EV2 SoC (in 23x23 BGA package)
by symbolic enum values, referring to signal names.

Note that the user-visible names of these pins are still based on pin
numbers instead of signal names, to preserve DT backwards compatibility.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-emev2.c | 70 +++++++++++++++---------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-emev2.c b/drivers/pinctrl/sh-pfc/pfc-emev2.c
index 0af1ef82a1a81a2b..6c66fc335d2f7f2d 100644
--- a/drivers/pinctrl/sh-pfc/pfc-emev2.c
+++ b/drivers/pinctrl/sh-pfc/pfc-emev2.c
@@ -19,6 +19,20 @@
 	PORT_1(155, fn, pfx##155, sfx), PORT_1(156, fn, pfx##156, sfx), \
 	PORT_1(157, fn, pfx##157, sfx), PORT_1(158, fn, pfx##158, sfx)
 
+#define CPU_ALL_NOGP(fn)		\
+	PIN_NOGP(LCD3_B2, "B15", fn),	\
+	PIN_NOGP(LCD3_B3, "C15", fn),	\
+	PIN_NOGP(LCD3_B4, "D15", fn),	\
+	PIN_NOGP(LCD3_B5, "B14", fn),	\
+	PIN_NOGP(LCD3_B6, "C14", fn),	\
+	PIN_NOGP(LCD3_B7, "D14", fn),	\
+	PIN_NOGP(LCD3_G2, "B17", fn),	\
+	PIN_NOGP(LCD3_G3, "C17", fn),	\
+	PIN_NOGP(LCD3_G4, "D17", fn),	\
+	PIN_NOGP(LCD3_G5, "B16", fn),	\
+	PIN_NOGP(LCD3_G6, "C16", fn),	\
+	PIN_NOGP(LCD3_G7, "D16", fn)
+
 enum {
 	PINMUX_RESERVED = 0,
 
@@ -218,10 +232,13 @@ enum {
 	PINMUX_MARK_END,
 };
 
-/* Pin numbers for pins without a corresponding GPIO port number are computed
- * from the row and column numbers with a 1000 offset to avoid collisions with
- * GPIO port numbers. */
-#define PIN_NUMBER(row, col)            (1000+((row)-1)*23+(col)-1)
+/*
+ * Pins not associated with a GPIO port.
+ */
+enum {
+	PORT_ASSIGN_LAST(),
+	NOGP_ALL(),
+};
 
 /* Expand to a list of sh_pfc_pin entries (named PORT#).
  * NOTE: No config are recorded since the driver do not handle pinconf. */
@@ -230,20 +247,7 @@ enum {
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_EMEV_GPIO_ALL(),
-
-	/* Pins not associated with a GPIO port */
-	SH_PFC_PIN_NAMED(2, 14, B14),
-	SH_PFC_PIN_NAMED(2, 15, B15),
-	SH_PFC_PIN_NAMED(2, 16, B16),
-	SH_PFC_PIN_NAMED(2, 17, B17),
-	SH_PFC_PIN_NAMED(3, 14, C14),
-	SH_PFC_PIN_NAMED(3, 15, C15),
-	SH_PFC_PIN_NAMED(3, 16, C16),
-	SH_PFC_PIN_NAMED(3, 17, C17),
-	SH_PFC_PIN_NAMED(4, 14, D14),
-	SH_PFC_PIN_NAMED(4, 15, D15),
-	SH_PFC_PIN_NAMED(4, 16, D16),
-	SH_PFC_PIN_NAMED(4, 17, D17),
+	PINMUX_NOGP_ALL(),
 };
 
 /* Expand to a list of name_DATA, name_FN marks */
@@ -829,12 +833,10 @@ static const unsigned int lcd3_rgb888_pins[] = {
 	/* R[0:7], G[0:7], B[0:7] */
 	32, 33, 34, 35,
 	36, 37, 38, 39,
-	40, 41, PIN_NUMBER(2, 17), PIN_NUMBER(3, 17),
-	PIN_NUMBER(4, 17), PIN_NUMBER(2, 16), PIN_NUMBER(3, 16),
-	PIN_NUMBER(4, 16),
-	42, 43, PIN_NUMBER(2, 15), PIN_NUMBER(3, 15),
-	PIN_NUMBER(4, 15), PIN_NUMBER(2, 14), PIN_NUMBER(3, 14),
-	PIN_NUMBER(4, 14)
+	40, 41, PIN_LCD3_G2, PIN_LCD3_G3,
+	PIN_LCD3_G4, PIN_LCD3_G5, PIN_LCD3_G6, PIN_LCD3_G7,
+	42, 43, PIN_LCD3_B2, PIN_LCD3_B3,
+	PIN_LCD3_B4, PIN_LCD3_B5, PIN_LCD3_B6, PIN_LCD3_B7
 };
 static const unsigned int lcd3_rgb888_mux[] = {
 	LCD3_R0_MARK, LCD3_R1_MARK, LCD3_R2_MARK, LCD3_R3_MARK,
@@ -850,12 +852,10 @@ static const unsigned int yuv3_pins[] = {
 	/* CLK_O, HS, VS, DE */
 	18, 21, 22, 23,
 	/* YUV3_D[0:15] */
-	40, 41, PIN_NUMBER(2, 17), PIN_NUMBER(3, 17),
-	PIN_NUMBER(4, 17), PIN_NUMBER(2, 16), PIN_NUMBER(3, 16),
-	PIN_NUMBER(4, 16),
-	42, 43, PIN_NUMBER(2, 15), PIN_NUMBER(3, 15),
-	PIN_NUMBER(4, 15), PIN_NUMBER(2, 14), PIN_NUMBER(3, 14),
-	PIN_NUMBER(4, 14),
+	40, 41, PIN_LCD3_G2, PIN_LCD3_G3,
+	PIN_LCD3_G4, PIN_LCD3_G5, PIN_LCD3_G6, PIN_LCD3_G7,
+	42, 43, PIN_LCD3_B2, PIN_LCD3_B3,
+	PIN_LCD3_B4, PIN_LCD3_B5, PIN_LCD3_B6, PIN_LCD3_B7,
 };
 static const unsigned int yuv3_mux[] = {
 	YUV3_CLK_O_MARK, YUV3_HS_MARK, YUV3_VS_MARK, YUV3_DE_MARK,
@@ -972,12 +972,10 @@ static const unsigned int tp33_pins[] = {
 	/* CLK, CTRL */
 	38, 39,
 	/* TP33_DATA[0:15] */
-	40, 41, PIN_NUMBER(2, 17), PIN_NUMBER(3, 17),
-	PIN_NUMBER(4, 17), PIN_NUMBER(2, 16), PIN_NUMBER(3, 16),
-	PIN_NUMBER(4, 16),
-	42, 43, PIN_NUMBER(2, 15), PIN_NUMBER(3, 15),
-	PIN_NUMBER(4, 15), PIN_NUMBER(2, 14), PIN_NUMBER(3, 14),
-	PIN_NUMBER(4, 14),
+	40, 41, PIN_LCD3_G2, PIN_LCD3_G3,
+	PIN_LCD3_G4, PIN_LCD3_G5, PIN_LCD3_G6, PIN_LCD3_G7,
+	42, 43, PIN_LCD3_B2, PIN_LCD3_B3,
+	PIN_LCD3_B4, PIN_LCD3_B5, PIN_LCD3_B6, PIN_LCD3_B7,
 };
 static const unsigned int tp33_mux[] = {
 	TP33_CLK_MARK, TP33_CTRL_MARK,
-- 
2.17.1

