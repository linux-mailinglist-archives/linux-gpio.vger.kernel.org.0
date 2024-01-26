Return-Path: <linux-gpio+bounces-2596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D9C83D8AD
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 11:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F68728998E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 10:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026DE17BC9;
	Fri, 26 Jan 2024 10:56:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E4134A5
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266615; cv=none; b=Rd0G4o5t7x74/2tQvcEBKY8SLLBYT0/vaKcgas83Us6Tbu+N1cXpmPbJMJpRECdZpDN7c538+ledHG3on2Oc/c+2Y57VMWpnb196sFn6wx9g9JvjOGgWPpTtlMojZ0HfLWLV8r7AXFpKBbGGDRxPlCourhhU9uXDbdTwgqJozQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266615; c=relaxed/simple;
	bh=jsledUMQzDpyBvByCkZNUoz+0bSUgc6pWYDjOwmGGPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=potSot50GRo1sGURnOffhf7fSIJbcfSJs26BC2UxycYKRlB5ZvjF/SgA3lAuvAN3/EWuhDJUMh8o7mx81BCcIV8kvPQqwoGOp8iUrgaNTKNvaoKEB6YzZBhvZ4vrTrp11xL5mFojpljPBiYrkMT7+1n9k5SMe2WJWbNCHKbabn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by michel.telenet-ops.be with bizsmtp
	id fNwn2B0081AdMdB06NwnHp; Fri, 26 Jan 2024 11:56:47 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsK-00GWgf-Qw;
	Fri, 26 Jan 2024 11:56:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJh0-00G5Tb-A8;
	Fri, 26 Jan 2024 11:44:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/14] pinctrl: renesas: r8a779h0: Add PWM/TPU pins, groups, functions
Date: Fri, 26 Jan 2024 11:44:09 +0100
Message-Id: <ddbd37b1815169a8b18c5026bc4fd957f0b25dde.1706264667.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706264667.git.geert+renesas@glider.be>
References: <cover.1706264667.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add pins, groups and functions for the PWM and 16-Bit Timer Pulse Units
(TPU) on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Change PWM2_B to PWM2_C in comment,
  - Change PWM3_C pin from (1, 12) to (1, 22).
---
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 236 +++++++++++++++++++++++++
 1 file changed, 236 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index f623362c85beca4f..b5d1f6108a6efd5d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -1906,6 +1906,114 @@ static const unsigned int msiof5_rxd_mux[] = {
 	MSIOF5_RXD_MARK,
 };
 
+/* - PWM0_A ------------------------------------------------------------------- */
+static const unsigned int pwm0_a_pins[] = {
+	/* PWM0_A */
+	RCAR_GP_PIN(1, 15),
+};
+static const unsigned int pwm0_a_mux[] = {
+	PWM0_A_MARK,
+};
+
+/* - PWM0_B ------------------------------------------------------------------- */
+static const unsigned int pwm0_b_pins[] = {
+	/* PWM0_B */
+	RCAR_GP_PIN(1, 14),
+};
+static const unsigned int pwm0_b_mux[] = {
+	PWM0_B_MARK,
+};
+
+/* - PWM1_A ------------------------------------------------------------------- */
+static const unsigned int pwm1_a_pins[] = {
+	/* PWM1_A */
+	RCAR_GP_PIN(3, 13),
+};
+static const unsigned int pwm1_a_mux[] = {
+	PWM1_A_MARK,
+};
+
+/* - PWM1_B ------------------------------------------------------------------- */
+static const unsigned int pwm1_b_pins[] = {
+	/* PWM1_B */
+	RCAR_GP_PIN(2, 13),
+};
+static const unsigned int pwm1_b_mux[] = {
+	PWM1_B_MARK,
+};
+
+/* - PWM1_C ------------------------------------------------------------------- */
+static const unsigned int pwm1_c_pins[] = {
+	/* PWM1_C */
+	RCAR_GP_PIN(2, 17),
+};
+static const unsigned int pwm1_c_mux[] = {
+	PWM1_C_MARK,
+};
+
+/* - PWM2_A ------------------------------------------------------------------- */
+static const unsigned int pwm2_a_pins[] = {
+	/* PWM2_A */
+	RCAR_GP_PIN(3, 14),
+};
+static const unsigned int pwm2_a_mux[] = {
+	PWM2_A_MARK,
+};
+
+/* - PWM2_B ------------------------------------------------------------------- */
+static const unsigned int pwm2_b_pins[] = {
+	/* PWM2_B */
+	RCAR_GP_PIN(2, 14),
+};
+static const unsigned int pwm2_b_mux[] = {
+	PWM2_B_MARK,
+};
+
+/* - PWM2_C ------------------------------------------------------------------- */
+static const unsigned int pwm2_c_pins[] = {
+	/* PWM2_C */
+	RCAR_GP_PIN(2, 19),
+};
+static const unsigned int pwm2_c_mux[] = {
+	PWM2_C_MARK,
+};
+
+/* - PWM3_A ------------------------------------------------------------------- */
+static const unsigned int pwm3_a_pins[] = {
+	/* PWM3_A */
+	RCAR_GP_PIN(4, 14),
+};
+static const unsigned int pwm3_a_mux[] = {
+	PWM3_A_MARK,
+};
+
+/* - PWM3_B ------------------------------------------------------------------- */
+static const unsigned int pwm3_b_pins[] = {
+	/* PWM3_B */
+	RCAR_GP_PIN(2, 15),
+};
+static const unsigned int pwm3_b_mux[] = {
+	PWM3_B_MARK,
+};
+
+/* - PWM3_C ------------------------------------------------------------------- */
+static const unsigned int pwm3_c_pins[] = {
+	/* PWM3_C */
+	RCAR_GP_PIN(1, 22),
+};
+static const unsigned int pwm3_c_mux[] = {
+	PWM3_C_MARK,
+};
+
+/* - PWM4 ------------------------------------------------------------------- */
+static const unsigned int pwm4_pins[] = {
+	/* PWM4 */
+	RCAR_GP_PIN(4, 15),
+};
+static const unsigned int pwm4_mux[] = {
+	PWM4_MARK,
+};
+
 /* - QSPI0 ------------------------------------------------------------------ */
 static const unsigned int qspi0_ctrl_pins[] = {
 	/* SPCLK, SSL */
@@ -2097,6 +2205,66 @@ static const unsigned int scif_clk2_mux[] = {
 	SCIF_CLK2_MARK,
 };
 
+/* - TPU_A ------------------------------------------------------------------- */
+static const unsigned int tpu_to0_a_pins[] = {
+	/* TPU0TO0_A */
+	RCAR_GP_PIN(2, 8),
+};
+static const unsigned int tpu_to0_a_mux[] = {
+	TPU0TO0_A_MARK,
+};
+static const unsigned int tpu_to1_a_pins[] = {
+	/* TPU0TO1_A */
+	RCAR_GP_PIN(2, 7),
+};
+static const unsigned int tpu_to1_a_mux[] = {
+	TPU0TO1_A_MARK,
+};
+static const unsigned int tpu_to2_a_pins[] = {
+	/* TPU0TO2_A */
+	RCAR_GP_PIN(2, 12),
+};
+static const unsigned int tpu_to2_a_mux[] = {
+	TPU0TO2_A_MARK,
+};
+static const unsigned int tpu_to3_a_pins[] = {
+	/* TPU0TO3_A */
+	RCAR_GP_PIN(2, 13),
+};
+static const unsigned int tpu_to3_a_mux[] = {
+	TPU0TO3_A_MARK,
+};
+
+/* - TPU_B ------------------------------------------------------------------- */
+static const unsigned int tpu_to0_b_pins[] = {
+	/* TPU0TO0_B */
+	RCAR_GP_PIN(1, 25),
+};
+static const unsigned int tpu_to0_b_mux[] = {
+	TPU0TO0_B_MARK,
+};
+static const unsigned int tpu_to1_b_pins[] = {
+	/* TPU0TO1_B */
+	RCAR_GP_PIN(1, 26),
+};
+static const unsigned int tpu_to1_b_mux[] = {
+	TPU0TO1_B_MARK,
+};
+static const unsigned int tpu_to2_b_pins[] = {
+	/* TPU0TO2_B */
+	RCAR_GP_PIN(2, 0),
+};
+static const unsigned int tpu_to2_b_mux[] = {
+	TPU0TO2_B_MARK,
+};
+static const unsigned int tpu_to3_b_pins[] = {
+	/* TPU0TO3_B */
+	RCAR_GP_PIN(2, 1),
+};
+static const unsigned int tpu_to3_b_mux[] = {
+	TPU0TO3_B_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb0_link),
 	SH_PFC_PIN_GROUP(avb0_magic),
@@ -2202,6 +2370,19 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(msiof5_txd),
 	SH_PFC_PIN_GROUP(msiof5_rxd),
 
+	SH_PFC_PIN_GROUP(pwm0_a),
+	SH_PFC_PIN_GROUP(pwm0_b),
+	SH_PFC_PIN_GROUP(pwm1_a),
+	SH_PFC_PIN_GROUP(pwm1_b),
+	SH_PFC_PIN_GROUP(pwm1_c),
+	SH_PFC_PIN_GROUP(pwm2_a),
+	SH_PFC_PIN_GROUP(pwm2_b),
+	SH_PFC_PIN_GROUP(pwm2_c),
+	SH_PFC_PIN_GROUP(pwm3_a),
+	SH_PFC_PIN_GROUP(pwm3_b),
+	SH_PFC_PIN_GROUP(pwm3_c),
+	SH_PFC_PIN_GROUP(pwm4),
+
 	SH_PFC_PIN_GROUP(qspi0_ctrl),
 	BUS_DATA_PIN_GROUP(qspi0_data, 2),
 	BUS_DATA_PIN_GROUP(qspi0_data, 4),
@@ -2229,6 +2410,15 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif4_ctrl),
 	SH_PFC_PIN_GROUP(scif_clk),
 	SH_PFC_PIN_GROUP(scif_clk2),
+
+	SH_PFC_PIN_GROUP(tpu_to0_a),
+	SH_PFC_PIN_GROUP(tpu_to0_b),
+	SH_PFC_PIN_GROUP(tpu_to1_a),
+	SH_PFC_PIN_GROUP(tpu_to1_b),
+	SH_PFC_PIN_GROUP(tpu_to2_a),
+	SH_PFC_PIN_GROUP(tpu_to2_b),
+	SH_PFC_PIN_GROUP(tpu_to3_a),
+	SH_PFC_PIN_GROUP(tpu_to3_b),
 };
 
 static const char * const avb0_groups[] = {
@@ -2377,6 +2567,33 @@ static const char * const msiof5_groups[] = {
 	"msiof5_rxd",
 };
 
+static const char * const pwm0_groups[] = {
+	"pwm0_a",
+	"pwm0_b",
+};
+
+static const char * const pwm1_groups[] = {
+	"pwm1_a",
+	"pwm1_b",
+	"pwm1_c",
+};
+
+static const char * const pwm2_groups[] = {
+	"pwm2_a",
+	"pwm2_b",
+	"pwm2_c",
+};
+
+static const char * const pwm3_groups[] = {
+	"pwm3_a",
+	"pwm3_b",
+	"pwm3_c",
+};
+
+static const char * const pwm4_groups[] = {
+	"pwm4",
+};
+
 static const char * const qspi0_groups[] = {
 	"qspi0_ctrl",
 	"qspi0_data2",
@@ -2427,6 +2644,17 @@ static const char * const scif_clk2_groups[] = {
 	"scif_clk2",
 };
 
+static const char * const tpu_groups[] = {
+	"tpu_to0_a",
+	"tpu_to0_b",
+	"tpu_to1_a",
+	"tpu_to1_b",
+	"tpu_to2_a",
+	"tpu_to2_b",
+	"tpu_to3_a",
+	"tpu_to3_b",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(avb1),
@@ -2451,6 +2679,12 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(msiof4),
 	SH_PFC_FUNCTION(msiof5),
 
+	SH_PFC_FUNCTION(pwm0),
+	SH_PFC_FUNCTION(pwm1),
+	SH_PFC_FUNCTION(pwm2),
+	SH_PFC_FUNCTION(pwm3),
+	SH_PFC_FUNCTION(pwm4),
+
 	SH_PFC_FUNCTION(qspi0),
 	SH_PFC_FUNCTION(qspi1),
 
@@ -2460,6 +2694,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif_clk),
 	SH_PFC_FUNCTION(scif_clk2),
+
+	SH_PFC_FUNCTION(tpu),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.34.1


