Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D328B17AD4
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 15:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727632AbfEHNkR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 09:40:17 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:33884 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727618AbfEHNkQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 May 2019 09:40:16 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id 9pgE2000U3XaVaC01pgEFv; Wed, 08 May 2019 15:40:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hOMnu-0005Vm-H1; Wed, 08 May 2019 15:40:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hOMnu-0004BA-Ff; Wed, 08 May 2019 15:40:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Cao Van Dong <cv-dong@jinso.co.jp>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/4] pinctrl: sh-pfc: r8a7796: Add TPU pins, groups and functions
Date:   Wed,  8 May 2019 15:40:11 +0200
Message-Id: <20190508134012.16002-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508134012.16002-1-geert+renesas@glider.be>
References: <20190508134012.16002-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pins, groups and functions for the 16-Bit Timer Pulse Unit outputs
on the R-Car M3-W and RZ/G2M SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Update .common[] array sizes.
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 46 ++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 33108f8886901a19..d7d7867753080c2e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -3888,6 +3888,36 @@ static const unsigned int tmu_tclk2_b_mux[] = {
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
@@ -4107,7 +4137,7 @@ static const unsigned int vin5_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[312];
+	struct sh_pfc_pin_group common[316];
 	struct sh_pfc_pin_group automotive[30];
 } pinmux_groups = {
 	.common = {
@@ -4394,6 +4424,10 @@ static const struct {
 		SH_PFC_PIN_GROUP(tmu_tclk1_b),
 		SH_PFC_PIN_GROUP(tmu_tclk2_a),
 		SH_PFC_PIN_GROUP(tmu_tclk2_b),
+		SH_PFC_PIN_GROUP(tpu_to0),
+		SH_PFC_PIN_GROUP(tpu_to1),
+		SH_PFC_PIN_GROUP(tpu_to2),
+		SH_PFC_PIN_GROUP(tpu_to3),
 		SH_PFC_PIN_GROUP(usb0),
 		SH_PFC_PIN_GROUP(usb1),
 		SH_PFC_PIN_GROUP(usb30),
@@ -4915,6 +4949,13 @@ static const char * const tmu_groups[] = {
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
@@ -4960,7 +5001,7 @@ static const char * const vin5_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[49];
+	struct sh_pfc_function common[50];
 	struct sh_pfc_function automotive[4];
 } pinmux_functions = {
 	.common = {
@@ -5008,6 +5049,7 @@ static const struct {
 		SH_PFC_FUNCTION(sdhi3),
 		SH_PFC_FUNCTION(ssi),
 		SH_PFC_FUNCTION(tmu),
+		SH_PFC_FUNCTION(tpu),
 		SH_PFC_FUNCTION(usb0),
 		SH_PFC_FUNCTION(usb1),
 		SH_PFC_FUNCTION(usb30),
-- 
2.17.1

