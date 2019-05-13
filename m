Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49F5B1BA02
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731349AbfEMP3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:29:07 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:55920 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731346AbfEMP3G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:29:06 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id BrV32000S3XaVaC01rV3y3; Mon, 13 May 2019 17:29:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0001eK-FL; Mon, 13 May 2019 17:29:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0003R5-E4; Mon, 13 May 2019 17:29:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/11] pinctrl: sh-pfc: sh73a0: Use new macros for non-GPIO pins
Date:   Mon, 13 May 2019 17:28:56 +0200
Message-Id: <20190513152857.13122-11-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
References: <20190513152857.13122-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the SH-Mobile AG5 pin control driver to use the new macros for
describing pins without GPIO functionality.  This replaces the use of
physical pin numbers on the SH-Mobile AG5 SoC (in 34x34 BGA package) by
symbolic enum values, referring to signal names.

Note that the user-visible names of these pins are still based on pin
numbers instead of signal names, to preserve DT backwards compatibility.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
index 78c7219de764afa5..afabd95105d5bef7 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
@@ -43,6 +43,9 @@
 	PORT_1(288, fn, pfx##288, sfx), PORT_1(289, fn, pfx##289, sfx),	\
 	PORT_10(290, fn, pfx##29, sfx), PORT_10(300, fn, pfx##30, sfx)
 
+#define CPU_ALL_NOGP(fn)	\
+	PIN_NOGP(A11, "F26", fn)
+
 enum {
 	PINMUX_RESERVED = 0,
 
@@ -1158,11 +1161,13 @@ static const u16 pinmux_data[] = {
 #define SH73A0_PIN_IO_PU_PD(pin)	SH_PFC_PIN_CFG(pin, __IO | __PUD)
 #define SH73A0_PIN_O(pin)		SH_PFC_PIN_CFG(pin, __O)
 
-/* Pin numbers for pins without a corresponding GPIO port number are computed
- * from the row and column numbers with a 1000 offset to avoid collisions with
- * GPIO port numbers.
+/*
+ * Pins not associated with a GPIO port.
  */
-#define PIN_NUMBER(row, col)		(1000+((row)-1)*34+(col)-1)
+enum {
+	PORT_ASSIGN_LAST(),
+	NOGP_ALL(),
+};
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	/* Table 25-1 (I/O and Pull U/D) */
@@ -1437,7 +1442,7 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	SH73A0_PIN_O(309),
 
 	/* Pins not associated with a GPIO port */
-	SH_PFC_PIN_NAMED(6, 26, F26),
+	PINMUX_NOGP_ALL(),
 };
 
 /* - BSC -------------------------------------------------------------------- */
@@ -1863,7 +1868,7 @@ static const unsigned int keysc_out7_2_mux[] = {
 };
 static const unsigned int keysc_out8_0_pins[] = {
 	/* KEYOUT8 */
-	PIN_NUMBER(6, 26),
+	PIN_A11,
 };
 static const unsigned int keysc_out8_0_mux[] = {
 	KEYOUT8_MARK,
@@ -3073,7 +3078,7 @@ static const unsigned int tpu4_to2_mux[] = {
 };
 static const unsigned int tpu4_to3_pins[] = {
 	/* TO */
-	PIN_NUMBER(6, 26),
+	PIN_A11,
 };
 static const unsigned int tpu4_to3_mux[] = {
 	TPU4TO3_MARK,
-- 
2.17.1

