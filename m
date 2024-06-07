Return-Path: <linux-gpio+bounces-7250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02D900079
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 12:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F19D41F241FE
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 10:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B4715B980;
	Fri,  7 Jun 2024 10:14:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E827815B98D
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755253; cv=none; b=pDMvMOqLmgegTeuloEWWOSFl7cDIcyCblAf+vg5rmwXhcFdqwFgT2k/xXbf64eybxs9UXmVZ4VYLy+lV5O9BgdPVeFIL3CGgtdIVHDxxFHIBj8a4JXVQ7qSl7QNSEpI4fNw8EiOq2jZko6fm98GmMWc5fJtATVD9TSc8JbqV7Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755253; c=relaxed/simple;
	bh=JqVzWv85H2shrn8GXUTR1rmR97R/502YA6f/muRUzbo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EgTnZJjjIpLClT4503X11E+soz25Q6u3iB8TmEDf3ubcTQazt9xf9E4Pf1md4usf2IS6R7sdRrboreGFGkKhr587yGhKZrrGUFDXYZ7dKlOeGqlaQaa0L3ZDW0XUMvH9mokC0SHh+9fxp7QirOOHCr+QGtEh+6jFVeO6YtKEk4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5ffd:9c1a:d9c:cf6])
	by laurent.telenet-ops.be with bizsmtp
	id YaDz2C00p45NznL01aDz3T; Fri, 07 Jun 2024 12:14:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWae-00ECgc-2Y;
	Fri, 07 Jun 2024 12:13:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWbf-00200u-JP;
	Fri, 07 Jun 2024 12:13:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	LUU HOAI <hoai.luu.ub@renesas.com>,
	Kazuya Mizuguch <kazuya.mizuguchi.ks@renesas.com>,
	Phong Hoang <phong.hoang.wz@renesas.com>,
	CongDang <cong.dang.xn@renesas.com>,
	Thanh Quan <thanh.quan.xn@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/8] pinctrl: renesas: r8a779g0: FIX PWM suffixes
Date: Fri,  7 Jun 2024 12:13:53 +0200
Message-Id: <abb748e6e1e4e7d78beac7d96e7a0a3481b32e75.1717754960.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717754960.git.geert+renesas@glider.be>
References: <cover.1717754960.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PWM channels 0, 2, 8, and 9 do not have alternate pins.
Remove their "_a" or "_b" suffixes to increase uniformity.

Fixes: c606c2fde2330547 ("pinctrl: renesas: r8a779g0: Add missing PWM")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 76 ++++++++++++--------------
 1 file changed, 36 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index f9f650f232e6e71e..3228a61ea4098b93 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -316,9 +316,9 @@
 #define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_B)		FM(SCK1_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_15_12	FM(MSIOF0_RXD)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_19_16	FM(HTX0)		FM(TX0)			F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_23_20	FM(HCTS0_N)		FM(CTS0_N)		FM(PWM8_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_27_24	FM(HRTS0_N)		FM(RTS0_N)		FM(PWM9_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_31_28	FM(HSCK0)		FM(SCK0)		FM(PWM0_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_23_20	FM(HCTS0_N)		FM(CTS0_N)		FM(PWM8)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_27_24	FM(HRTS0_N)		FM(RTS0_N)		FM(PWM9)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_31_28	FM(HSCK0)		FM(SCK0)		FM(PWM0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR1 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP2SR1_3_0	FM(HRX0)		FM(RX0)			F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -355,7 +355,7 @@
 #define IP1SR2_15_12	FM(CANFD0_RX)		FM(STPWT_EXTFXR)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2)		F_(0, 0)		FM(TCLK3_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1_B)		FM(TCLK4_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_27_24	FM(CANFD3_TX)		F_(0, 0)		FM(PWM2_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_27_24	FM(CANFD3_TX)		F_(0, 0)		FM(PWM2)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_31_28	FM(CANFD3_RX)		F_(0, 0)		FM(PWM3_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR2 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -827,15 +827,15 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR1_23_20,	HCTS0_N),
 	PINMUX_IPSR_GPSR(IP1SR1_23_20,	CTS0_N),
-	PINMUX_IPSR_GPSR(IP1SR1_23_20,	PWM8_A),
+	PINMUX_IPSR_GPSR(IP1SR1_23_20,	PWM8),
 
 	PINMUX_IPSR_GPSR(IP1SR1_27_24,	HRTS0_N),
 	PINMUX_IPSR_GPSR(IP1SR1_27_24,	RTS0_N),
-	PINMUX_IPSR_GPSR(IP1SR1_27_24,	PWM9_A),
+	PINMUX_IPSR_GPSR(IP1SR1_27_24,	PWM9),
 
 	PINMUX_IPSR_GPSR(IP1SR1_31_28,	HSCK0),
 	PINMUX_IPSR_GPSR(IP1SR1_31_28,	SCK0),
-	PINMUX_IPSR_GPSR(IP1SR1_31_28,	PWM0_A),
+	PINMUX_IPSR_GPSR(IP1SR1_31_28,	PWM0),
 
 	/* IP2SR1 */
 	PINMUX_IPSR_GPSR(IP2SR1_3_0,	HRX0),
@@ -937,7 +937,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	TCLK4_A),
 
 	PINMUX_IPSR_GPSR(IP1SR2_27_24,	CANFD3_TX),
-	PINMUX_IPSR_GPSR(IP1SR2_27_24,	PWM2_B),
+	PINMUX_IPSR_GPSR(IP1SR2_27_24,	PWM2),
 
 	PINMUX_IPSR_GPSR(IP1SR2_31_28,	CANFD3_RX),
 	PINMUX_IPSR_GPSR(IP1SR2_31_28,	PWM3_B),
@@ -2090,13 +2090,13 @@ static const unsigned int pcie1_clkreq_n_mux[] = {
 	PCIE1_CLKREQ_N_MARK,
 };
 
-/* - PWM0_A ------------------------------------------------------------------- */
-static const unsigned int pwm0_a_pins[] = {
-	/* PWM0_A */
+/* - PWM0 ------------------------------------------------------------------- */
+static const unsigned int pwm0_pins[] = {
+	/* PWM0 */
 	RCAR_GP_PIN(1, 15),
 };
-static const unsigned int pwm0_a_mux[] = {
-	PWM0_A_MARK,
+static const unsigned int pwm0_mux[] = {
+	PWM0_MARK,
 };
 
 /* - PWM1_A ------------------------------------------------------------------- */
@@ -2117,13 +2117,13 @@ static const unsigned int pwm1_b_mux[] = {
 	PWM1_B_MARK,
 };
 
-/* - PWM2_B ------------------------------------------------------------------- */
-static const unsigned int pwm2_b_pins[] = {
-	/* PWM2_B */
+/* - PWM2 ------------------------------------------------------------------- */
+static const unsigned int pwm2_pins[] = {
+	/* PWM2 */
 	RCAR_GP_PIN(2, 14),
 };
-static const unsigned int pwm2_b_mux[] = {
-	PWM2_B_MARK,
+static const unsigned int pwm2_mux[] = {
+	PWM2_MARK,
 };
 
 /* - PWM3_A ------------------------------------------------------------------- */
@@ -2180,22 +2180,22 @@ static const unsigned int pwm7_mux[] = {
 	PWM7_MARK,
 };
 
-/* - PWM8_A ------------------------------------------------------------------- */
-static const unsigned int pwm8_a_pins[] = {
-	/* PWM8_A */
+/* - PWM8 ------------------------------------------------------------------- */
+static const unsigned int pwm8_pins[] = {
+	/* PWM8 */
 	RCAR_GP_PIN(1, 13),
 };
-static const unsigned int pwm8_a_mux[] = {
-	PWM8_A_MARK,
+static const unsigned int pwm8_mux[] = {
+	PWM8_MARK,
 };
 
-/* - PWM9_A ------------------------------------------------------------------- */
-static const unsigned int pwm9_a_pins[] = {
-	/* PWM9_A */
+/* - PWM9 ------------------------------------------------------------------- */
+static const unsigned int pwm9_pins[] = {
+	/* PWM9 */
 	RCAR_GP_PIN(1, 14),
 };
-static const unsigned int pwm9_a_mux[] = {
-	PWM9_A_MARK,
+static const unsigned int pwm9_mux[] = {
+	PWM9_MARK,
 };
 
 /* - QSPI0 ------------------------------------------------------------------ */
@@ -2658,18 +2658,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(pcie0_clkreq_n),
 	SH_PFC_PIN_GROUP(pcie1_clkreq_n),
 
-	SH_PFC_PIN_GROUP(pwm0_a),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(pwm0),
 	SH_PFC_PIN_GROUP(pwm1_a),
 	SH_PFC_PIN_GROUP(pwm1_b),
-	SH_PFC_PIN_GROUP(pwm2_b),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(pwm2),
 	SH_PFC_PIN_GROUP(pwm3_a),
 	SH_PFC_PIN_GROUP(pwm3_b),
 	SH_PFC_PIN_GROUP(pwm4),
 	SH_PFC_PIN_GROUP(pwm5),
 	SH_PFC_PIN_GROUP(pwm6),
 	SH_PFC_PIN_GROUP(pwm7),
-	SH_PFC_PIN_GROUP(pwm8_a),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(pwm9_a),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(pwm8),
+	SH_PFC_PIN_GROUP(pwm9),
 
 	SH_PFC_PIN_GROUP(qspi0_ctrl),
 	BUS_DATA_PIN_GROUP(qspi0_data, 2),
@@ -2923,8 +2923,7 @@ static const char * const pcie_groups[] = {
 };
 
 static const char * const pwm0_groups[] = {
-	/* suffix might be updated */
-	"pwm0_a",
+	"pwm0",
 };
 
 static const char * const pwm1_groups[] = {
@@ -2933,8 +2932,7 @@ static const char * const pwm1_groups[] = {
 };
 
 static const char * const pwm2_groups[] = {
-	/* suffix might be updated */
-	"pwm2_b",
+	"pwm2",
 };
 
 static const char * const pwm3_groups[] = {
@@ -2959,13 +2957,11 @@ static const char * const pwm7_groups[] = {
 };
 
 static const char * const pwm8_groups[] = {
-	/* suffix might be updated */
-	"pwm8_a",
+	"pwm8",
 };
 
 static const char * const pwm9_groups[] = {
-	/* suffix might be updated */
-	"pwm9_a",
+	"pwm9",
 };
 
 static const char * const qspi0_groups[] = {
-- 
2.34.1


