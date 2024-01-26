Return-Path: <linux-gpio+bounces-2587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A724183D88C
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 11:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8EAA1C252A4
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 10:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B28E12E4E;
	Fri, 26 Jan 2024 10:56:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F5B12E76
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266611; cv=none; b=W+iS/uzWm8NsD4WCuodEPMRfFT9OSGmNgnF8FjZRg+U2zOEV3m+TuhE4UnaVq5MLLctJZqS3XR9cMYRv4m22uNOlUTn62yyxLHKWc0m5eniVc5KJRkzysP6D5n6+3CmdyuMGCvI4tIas/gKm+DkCFVJTLrYktKbMTsroR5vBZ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266611; c=relaxed/simple;
	bh=gR8/3MoXuaB+Rxv/q+72fPWPqnLRBHQY/wL4bcN+j0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DKJYVSfCCFpyq0RmLKh5ObHHFQIxjvzuH8AhDX2WoGLsMVC+HBGHQSBpakz0XChOtOINyNIrfZyHYfp62LsLitGTcBzC39EC1JG08tyQtMuD8cGyNYMhtAROz0/MQDaBWc26vodq27eapOJ0rl7xeEhTBZOrwBe+ckySNnjNEd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by laurent.telenet-ops.be with bizsmtp
	id fNwm2B00J1AdMdB01NwmKS; Fri, 26 Jan 2024 11:56:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsK-00GWgS-82;
	Fri, 26 Jan 2024 11:56:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJh0-00G5Tq-DD;
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
Subject: [PATCH 14/14] pinctrl: renesas: r8a779h0: Add Audio pins, groups, functions
Date: Fri, 26 Jan 2024 11:44:12 +0100
Message-Id: <e7d5024c23929d2eccb02bb5daf44c914db07d80.1706264667.git.geert+renesas@glider.be>
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

Add pins, groups and functions for Audio on the Renesas R-Car V4M
(R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index 715fb81a798d4b9b..afa8f06c85cf5bd6 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -1191,6 +1191,22 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_NOGP_ALL(),
 };
 
+/* - AUDIO CLOCK ----------------------------------------- */
+static const unsigned int audio_clkin_pins[] = {
+	/* CLK IN */
+	RCAR_GP_PIN(1, 22),
+};
+static const unsigned int audio_clkin_mux[] = {
+	AUDIO_CLKIN_MARK,
+};
+static const unsigned int audio_clkout_pins[] = {
+	/* CLK OUT */
+	RCAR_GP_PIN(1, 21),
+};
+static const unsigned int audio_clkout_mux[] = {
+	AUDIO_CLKOUT_MARK,
+};
+
 /* - AVB0 ------------------------------------------------ */
 static const unsigned int avb0_link_pins[] = {
 	/* AVB0_LINK */
@@ -2260,6 +2276,22 @@ static const unsigned int scif_clk2_mux[] = {
 	SCIF_CLK2_MARK,
 };
 
+/* - SSI ------------------------------------------------- */
+static const unsigned int ssi_data_pins[] = {
+	/* SSI_SD */
+	RCAR_GP_PIN(1, 20),
+};
+static const unsigned int ssi_data_mux[] = {
+	SSI_SD_MARK,
+};
+static const unsigned int ssi_ctrl_pins[] = {
+	/* SSI_SCK,  SSI_WS */
+	RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 19),
+};
+static const unsigned int ssi_ctrl_mux[] = {
+	SSI_SCK_MARK, SSI_WS_MARK,
+};
+
 /* - TPU_A ------------------------------------------------------------------- */
 static const unsigned int tpu_to0_a_pins[] = {
 	/* TPU0TO0_A */
@@ -2321,6 +2353,9 @@ static const unsigned int tpu_to3_b_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(audio_clkin),
+	SH_PFC_PIN_GROUP(audio_clkout),
+
 	SH_PFC_PIN_GROUP(avb0_link),
 	SH_PFC_PIN_GROUP(avb0_magic),
 	SH_PFC_PIN_GROUP(avb0_phy_int),
@@ -2474,6 +2509,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif_clk),
 	SH_PFC_PIN_GROUP(scif_clk2),
 
+	SH_PFC_PIN_GROUP(ssi_data),
+	SH_PFC_PIN_GROUP(ssi_ctrl),
+
 	SH_PFC_PIN_GROUP(tpu_to0_a),
 	SH_PFC_PIN_GROUP(tpu_to0_b),
 	SH_PFC_PIN_GROUP(tpu_to1_a),
@@ -2484,6 +2522,11 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(tpu_to3_b),
 };
 
+static const char * const audio_clk_groups[] = {
+	"audio_clkin",
+	"audio_clkout",
+};
+
 static const char * const avb0_groups[] = {
 	"avb0_link",
 	"avb0_magic",
@@ -2731,6 +2774,11 @@ static const char * const scif_clk2_groups[] = {
 	"scif_clk2",
 };
 
+static const char * const ssi_groups[] = {
+	"ssi_data",
+	"ssi_ctrl",
+};
+
 static const char * const tpu_groups[] = {
 	"tpu_to0_a",
 	"tpu_to0_b",
@@ -2743,6 +2791,8 @@ static const char * const tpu_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(audio_clk),
+
 	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(avb1),
 	SH_PFC_FUNCTION(avb2),
@@ -2790,6 +2840,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif_clk),
 	SH_PFC_FUNCTION(scif_clk2),
 
+	SH_PFC_FUNCTION(ssi),
+
 	SH_PFC_FUNCTION(tpu),
 };
 
-- 
2.34.1


