Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 159D612B06
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2019 11:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfECJtb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 May 2019 05:49:31 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:46266 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfECJtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 May 2019 05:49:31 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id 7lpT200033XaVaC01lpTVP; Fri, 03 May 2019 11:49:28 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hMUop-0003sg-7m; Fri, 03 May 2019 11:49:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hMUop-0003Bl-6q; Fri, 03 May 2019 11:49:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Cao Van Dong <cv-dong@jinso.co.jp>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] pinctrl: sh-pfc: r8a7795: Add TPU pins, groups and functions
Date:   Fri,  3 May 2019 11:49:24 +0200
Message-Id: <20190503094926.12208-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503094926.12208-1-geert+renesas@glider.be>
References: <20190503094926.12208-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pins, groups and functions for the 16-Bit Timer Pulse Unit outputs
on revisions ES2.x and later of the R-Car H3 SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

