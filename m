Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6821E17ADA
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 15:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfEHNkS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 09:40:18 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:33894 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727605AbfEHNkS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 May 2019 09:40:18 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id 9pgE2000R3XaVaC01pgEFt; Wed, 08 May 2019 15:40:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hOMnu-0005Vi-Fo; Wed, 08 May 2019 15:40:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hOMnu-0004B7-Df; Wed, 08 May 2019 15:40:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Cao Van Dong <cv-dong@jinso.co.jp>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/4] pinctrl: sh-pfc: r8a7795: Add TPU pins, groups and functions
Date:   Wed,  8 May 2019 15:40:10 +0200
Message-Id: <20190508134012.16002-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508134012.16002-1-geert+renesas@glider.be>
References: <20190508134012.16002-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pins, groups and functions for the 16-Bit Timer Pulse Unit outputs
on revisions ES2.x and later of the R-Car H3 SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 79073b2f1ae2c335..bfa19309d14c91c5 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -3898,6 +3898,36 @@ static const unsigned int tmu_tclk2_b_mux[] = {
 	TCLK2_B_MARK,
 };
 
+/* - TPU ------------------------------------------------------------------- */
+static const unsigned int tpu_to0_pins[] = {
+	/* TPU0TO0 */
+	RCAR_GP_PIN(6, 28),
+};
+static const unsigned int tpu_to0_mux[] = {
+	TPU0TO0_MARK,
+};
+static const unsigned int tpu_to1_pins[] = {
+	/* TPU0TO1 */
+	RCAR_GP_PIN(6, 29),
+};
+static const unsigned int tpu_to1_mux[] = {
+	TPU0TO1_MARK,
+};
+static const unsigned int tpu_to2_pins[] = {
+	/* TPU0TO2 */
+	RCAR_GP_PIN(6, 30),
+};
+static const unsigned int tpu_to2_mux[] = {
+	TPU0TO2_MARK,
+};
+static const unsigned int tpu_to3_pins[] = {
+	/* TPU0TO3 */
+	RCAR_GP_PIN(6, 31),
+};
+static const unsigned int tpu_to3_mux[] = {
+	TPU0TO3_MARK,
+};
+
 /* - USB0 ------------------------------------------------------------------- */
 static const unsigned int usb0_pins[] = {
 	/* PWEN, OVC */
@@ -4448,6 +4478,10 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(tmu_tclk1_b),
 	SH_PFC_PIN_GROUP(tmu_tclk2_a),
 	SH_PFC_PIN_GROUP(tmu_tclk2_b),
+	SH_PFC_PIN_GROUP(tpu_to0),
+	SH_PFC_PIN_GROUP(tpu_to1),
+	SH_PFC_PIN_GROUP(tpu_to2),
+	SH_PFC_PIN_GROUP(tpu_to3),
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
 	SH_PFC_PIN_GROUP(usb2),
@@ -4943,6 +4977,13 @@ static const char * const tmu_groups[] = {
 	"tmu_tclk2_b",
 };
 
+static const char * const tpu_groups[] = {
+	"tpu_to0",
+	"tpu_to1",
+	"tpu_to2",
+	"tpu_to3",
+};
+
 static const char * const usb0_groups[] = {
 	"usb0",
 };
@@ -5045,6 +5086,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(sdhi3),
 	SH_PFC_FUNCTION(ssi),
 	SH_PFC_FUNCTION(tmu),
+	SH_PFC_FUNCTION(tpu),
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
 	SH_PFC_FUNCTION(usb2),
-- 
2.17.1

