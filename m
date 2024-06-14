Return-Path: <linux-gpio+bounces-7459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3555908EC1
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 17:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD07283AFC
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 15:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F0615FA72;
	Fri, 14 Jun 2024 15:29:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78111154457
	for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378998; cv=none; b=i7wr6Qe1dp23NtGJhzavDflmOyot6ffpLdmL5AuYkU2tsuHe6cowFxsH3QYNBxapCqX9djDmQaXJhPwBovKR1qWke0WJfx68KuaPLYVJVBzdQnhilik0aJGRHYVtBQ6K9qQxkH6KPhzQl3oqQCztbLgvLELcSIF2TwcMcHwPlsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378998; c=relaxed/simple;
	bh=G7N4LBPEen+i7Rk41ia8YsIvM9JUaIHDchoyeXscCEI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cQ0GP0qI2dsZ4ToH/rMzFIR57FPKgQxAw8+F9zOhlsQ37FcM2cyr+ymdQRdi5sstnzjeELuN499tSsytpX1lMqgYsEakg6yg+rqcT1P41/qVzYxQPJE18hqOoMlGe/HQXP1oJxZiQSA3SNY5QcDwP8kpl6S48ZHJmxmcV8/l2gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by baptiste.telenet-ops.be with bizsmtp
	id bTVw2C0073w30qz01TVw3i; Fri, 14 Jun 2024 17:29:56 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI8r9-00CeH9-T9;
	Fri, 14 Jun 2024 17:29:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI8sE-00FqOS-Ed;
	Fri, 14 Jun 2024 17:29:54 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a779h0: Remove unneeded separators
Date: Fri, 14 Jun 2024 17:29:53 +0200
Message-Id: <1fcd4f8734d063c9a691d9ab8ca0543892eb8388.1718378979.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usually there are no separators between alternate functions.
Remove them to increase uniformity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v6.11.
---
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 30 ++++++++------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index 944bf927449ddc1b..48b1eef250d950dd 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -1557,7 +1557,7 @@ static const unsigned int hscif0_ctrl_mux[] = {
 	HRTS0_N_MARK, HCTS0_N_MARK,
 };
 
-/* - HSCIF1_A ----------------------------------------------------------------- */
+/* - HSCIF1 ------------------------------------------------------------------- */
 static const unsigned int hscif1_data_a_pins[] = {
 	/* HRX1_A, HTX1_A */
 	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
@@ -1580,7 +1580,6 @@ static const unsigned int hscif1_ctrl_a_mux[] = {
 	HRTS1_N_A_MARK, HCTS1_N_A_MARK,
 };
 
-/* - HSCIF1_B ---------------------------------------------------------------- */
 static const unsigned int hscif1_data_b_pins[] = {
 	/* HRX1_B, HTX1_B */
 	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
@@ -1626,7 +1625,7 @@ static const unsigned int hscif2_ctrl_mux[] = {
 	HRTS2_N_MARK, HCTS2_N_MARK,
 };
 
-/* - HSCIF3_A ----------------------------------------------------------------- */
+/* - HSCIF3 ------------------------------------------------------------------- */
 static const unsigned int hscif3_data_a_pins[] = {
 	/* HRX3_A, HTX3_A */
 	RCAR_GP_PIN(1, 24), RCAR_GP_PIN(1, 28),
@@ -1649,7 +1648,6 @@ static const unsigned int hscif3_ctrl_a_mux[] = {
 	HRTS3_N_A_MARK, HCTS3_N_A_MARK,
 };
 
-/* - HSCIF3_B ----------------------------------------------------------------- */
 static const unsigned int hscif3_data_b_pins[] = {
 	/* HRX3_B, HTX3_B */
 	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 0),
@@ -2109,7 +2107,7 @@ static const unsigned int pcie0_clkreq_n_mux[] = {
 	PCIE0_CLKREQ_N_MARK,
 };
 
-/* - PWM0_A ------------------------------------------------------------------- */
+/* - PWM0 --------------------------------------------------------------------- */
 static const unsigned int pwm0_a_pins[] = {
 	/* PWM0_A */
 	RCAR_GP_PIN(1, 15),
@@ -2118,7 +2116,6 @@ static const unsigned int pwm0_a_mux[] = {
 	PWM0_A_MARK,
 };
 
-/* - PWM0_B ------------------------------------------------------------------- */
 static const unsigned int pwm0_b_pins[] = {
 	/* PWM0_B */
 	RCAR_GP_PIN(1, 14),
@@ -2127,7 +2124,7 @@ static const unsigned int pwm0_b_mux[] = {
 	PWM0_B_MARK,
 };
 
-/* - PWM1_A ------------------------------------------------------------------- */
+/* - PWM1 --------------------------------------------------------------------- */
 static const unsigned int pwm1_a_pins[] = {
 	/* PWM1_A */
 	RCAR_GP_PIN(3, 13),
@@ -2136,7 +2133,6 @@ static const unsigned int pwm1_a_mux[] = {
 	PWM1_A_MARK,
 };
 
-/* - PWM1_B ------------------------------------------------------------------- */
 static const unsigned int pwm1_b_pins[] = {
 	/* PWM1_B */
 	RCAR_GP_PIN(2, 13),
@@ -2145,7 +2141,6 @@ static const unsigned int pwm1_b_mux[] = {
 	PWM1_B_MARK,
 };
 
-/* - PWM1_C ------------------------------------------------------------------- */
 static const unsigned int pwm1_c_pins[] = {
 	/* PWM1_C */
 	RCAR_GP_PIN(2, 17),
@@ -2154,7 +2149,7 @@ static const unsigned int pwm1_c_mux[] = {
 	PWM1_C_MARK,
 };
 
-/* - PWM2_A ------------------------------------------------------------------- */
+/* - PWM2 --------------------------------------------------------------------- */
 static const unsigned int pwm2_a_pins[] = {
 	/* PWM2_A */
 	RCAR_GP_PIN(3, 14),
@@ -2163,7 +2158,6 @@ static const unsigned int pwm2_a_mux[] = {
 	PWM2_A_MARK,
 };
 
-/* - PWM2_B ------------------------------------------------------------------- */
 static const unsigned int pwm2_b_pins[] = {
 	/* PWM2_B */
 	RCAR_GP_PIN(2, 14),
@@ -2172,7 +2166,6 @@ static const unsigned int pwm2_b_mux[] = {
 	PWM2_B_MARK,
 };
 
-/* - PWM2_C ------------------------------------------------------------------- */
 static const unsigned int pwm2_c_pins[] = {
 	/* PWM2_C */
 	RCAR_GP_PIN(2, 19),
@@ -2181,7 +2174,7 @@ static const unsigned int pwm2_c_mux[] = {
 	PWM2_C_MARK,
 };
 
-/* - PWM3_A ------------------------------------------------------------------- */
+/* - PWM3 --------------------------------------------------------------------- */
 static const unsigned int pwm3_a_pins[] = {
 	/* PWM3_A */
 	RCAR_GP_PIN(4, 14),
@@ -2190,7 +2183,6 @@ static const unsigned int pwm3_a_mux[] = {
 	PWM3_A_MARK,
 };
 
-/* - PWM3_B ------------------------------------------------------------------- */
 static const unsigned int pwm3_b_pins[] = {
 	/* PWM3_B */
 	RCAR_GP_PIN(2, 15),
@@ -2199,7 +2191,6 @@ static const unsigned int pwm3_b_mux[] = {
 	PWM3_B_MARK,
 };
 
-/* - PWM3_C ------------------------------------------------------------------- */
 static const unsigned int pwm3_c_pins[] = {
 	/* PWM3_C */
 	RCAR_GP_PIN(1, 22),
@@ -2276,7 +2267,7 @@ static const unsigned int scif0_ctrl_mux[] = {
 	RTS0_N_MARK, CTS0_N_MARK,
 };
 
-/* - SCIF1_A ------------------------------------------------------------------ */
+/* - SCIF1 -------------------------------------------------------------------- */
 static const unsigned int scif1_data_a_pins[] = {
 	/* RX1_A, TX1_A */
 	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
@@ -2299,7 +2290,6 @@ static const unsigned int scif1_ctrl_a_mux[] = {
 	RTS1_N_A_MARK, CTS1_N_A_MARK,
 };
 
-/* - SCIF1_B ------------------------------------------------------------------ */
 static const unsigned int scif1_data_b_pins[] = {
 	/* RX1_B, TX1_B */
 	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
@@ -2322,7 +2312,7 @@ static const unsigned int scif1_ctrl_b_mux[] = {
 	RTS1_N_B_MARK, CTS1_N_B_MARK,
 };
 
-/* - SCIF3_A ------------------------------------------------------------------ */
+/* - SCIF3 -------------------------------------------------------------------- */
 static const unsigned int scif3_data_a_pins[] = {
 	/* RX3_A, TX3_A */
 	RCAR_GP_PIN(1, 27), RCAR_GP_PIN(1, 28),
@@ -2345,7 +2335,6 @@ static const unsigned int scif3_ctrl_a_mux[] = {
 	RTS3_N_A_MARK, CTS3_N_A_MARK,
 };
 
-/* - SCIF3_B ------------------------------------------------------------------ */
 static const unsigned int scif3_data_b_pins[] = {
 	/* RX3_B, TX3_B */
 	RCAR_GP_PIN(1, 1), RCAR_GP_PIN(1, 0),
@@ -2424,7 +2413,7 @@ static const unsigned int ssi_ctrl_mux[] = {
 	SSI_SCK_MARK, SSI_WS_MARK,
 };
 
-/* - TPU_A ------------------------------------------------------------------- */
+/* - TPU --------------------------------------------------------------------- */
 static const unsigned int tpu_to0_a_pins[] = {
 	/* TPU0TO0_A */
 	RCAR_GP_PIN(2, 8),
@@ -2454,7 +2443,6 @@ static const unsigned int tpu_to3_a_mux[] = {
 	TPU0TO3_A_MARK,
 };
 
-/* - TPU_B ------------------------------------------------------------------- */
 static const unsigned int tpu_to0_b_pins[] = {
 	/* TPU0TO0_B */
 	RCAR_GP_PIN(1, 25),
-- 
2.34.1


