Return-Path: <linux-gpio+bounces-7251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC52190007A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 12:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3B9C1C2105B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 10:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D894215B99E;
	Fri,  7 Jun 2024 10:14:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80544C61B
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755253; cv=none; b=Dq+mggITS8qmdL8wfDNuQF3d7E0aRhRtHKK60+FxkzjmEzWJXHPR2LOMb0iwwDaI83En4PXgy/8GSBkk5nczv2clXaolgG/s7SvEzwuZwLgjlXIcxzYZ+WIO8GvV9SPMTDRypZBLpA0JwE0mfXf9iGDJOY2yLSgoS8dHv4j6T58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755253; c=relaxed/simple;
	bh=Kc7fWT6/f0en6SGFF9QtwSjxgEUzrMbBuWDGk+eBwgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=caMiLNk1WVQwTgnoaNLeD0pmpVV9RwXMGDKo+ji3AQI7/KfUKgefi/UEtdOkq3LXhnBixmLAiI/xMBYSZMyVBdDalzQxN94blv9/vk0hskZlC/QT1soMl/26gg46vtZu+0tNlwu0CpnaSEjfkq2tXxFwJigzw3mAc8I3Cx08h/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5ffd:9c1a:d9c:cf6])
	by xavier.telenet-ops.be with bizsmtp
	id YaDz2C00S45NznL01aDzVv; Fri, 07 Jun 2024 12:14:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWae-00ECgT-16;
	Fri, 07 Jun 2024 12:13:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWbf-00200j-Hu;
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
Subject: [PATCH 4/8] pinctrl: renesas: r8a779g0: Fix (H)SCIF3 suffixes
Date: Fri,  7 Jun 2024 12:13:51 +0200
Message-Id: <61fdde58e369e8070ffd3c5811c089e6219c7ecc.1717754960.git.geert+renesas@glider.be>
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

(H)SCIF instance 3 has two alternate pin groups: "hscif3" and
"hscif3_a", resp. "scif3" and "scif3_a", but the actual meanings of the
pins within the groups do not match.

Increase uniformity by adopting R-Car V4M naming:
  - Rename "hscif3_a" to "hscif3_b",
  - Rename "hscif3" to "hscif3_a",
  - Rename "scif3" to "scif3_b".

While at it, remove unneeded separators.

Fixes: ad9bb2fec66262b0 ("pinctrl: renesas: Initial R8A779G0 (R-Car V4H) PFC support")
Fixes: 050442ae4c74f830 ("pinctrl: renesas: r8a779g0: Add pins, groups and functions")
Fixes: 213b713255defaa6 ("pinctrl: renesas: r8a779g0: Add missing HSCIF3_A")
Fixes: 49e4697656bdd1cd ("pinctrl: renesas: r8a779g0: Add missing SCIF3")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 192 ++++++++++++-------------
 1 file changed, 94 insertions(+), 98 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 7b64429c35ad3e4e..e3c720ea76e32bd7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -77,11 +77,11 @@
 #define GPSR0_0		F_(GP0_00,		IP0SR0_3_0)
 
 /* GPSR1 */
-#define GPSR1_28	F_(HTX3,		IP3SR1_19_16)
-#define GPSR1_27	F_(HCTS3_N,		IP3SR1_15_12)
-#define GPSR1_26	F_(HRTS3_N,		IP3SR1_11_8)
-#define GPSR1_25	F_(HSCK3,		IP3SR1_7_4)
-#define GPSR1_24	F_(HRX3,		IP3SR1_3_0)
+#define GPSR1_28	F_(HTX3_A,		IP3SR1_19_16)
+#define GPSR1_27	F_(HCTS3_N_A,		IP3SR1_15_12)
+#define GPSR1_26	F_(HRTS3_N_A,		IP3SR1_11_8)
+#define GPSR1_25	F_(HSCK3_A,		IP3SR1_7_4)
+#define GPSR1_24	F_(HRX3_A,		IP3SR1_3_0)
 #define GPSR1_23	F_(GP1_23,		IP2SR1_31_28)
 #define GPSR1_22	F_(AUDIO_CLKIN,		IP2SR1_27_24)
 #define GPSR1_21	F_(AUDIO_CLKOUT,	IP2SR1_23_20)
@@ -301,11 +301,11 @@
 
 /* SR1 */
 /* IP0SR1 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR1_3_0	FM(MSIOF1_SS2)		FM(HTX3_A)		FM(TX3)			F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_7_4	FM(MSIOF1_SS1)		FM(HCTS3_N_A)		FM(RX3)			F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_11_8	FM(MSIOF1_SYNC)		FM(HRTS3_N_A)		FM(RTS3_N)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		FM(CTS3_N)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		FM(SCK3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_3_0	FM(MSIOF1_SS2)		FM(HTX3_B)		FM(TX3_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_7_4	FM(MSIOF1_SS1)		FM(HCTS3_N_B)		FM(RX3_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_11_8	FM(MSIOF1_SYNC)		FM(HRTS3_N_B)		FM(RTS3_N_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_B)		FM(CTS3_N_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_B)		FM(SCK3_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_23_20	FM(MSIOF1_RXD)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_27_24	FM(MSIOF0_SS2)		FM(HTX1_B)		FM(TX1_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_B)		FM(RX1_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -331,11 +331,11 @@
 #define IP2SR1_31_28	F_(0, 0)		FM(TCLK2)		FM(MSIOF4_SS1)		FM(IRQ3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP3SR1 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP3SR1_3_0	FM(HRX3)		FM(SCK3_A)		FM(MSIOF4_SS2)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_7_4	FM(HSCK3)		FM(CTS3_N_A)		FM(MSIOF4_SCK)		FM(TPU0TO0_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_N_A)		FM(MSIOF4_TXD)		FM(TPU0TO1_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_15_12	FM(HCTS3_N)		FM(RX3_A)		FM(MSIOF4_RXD)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_19_16	FM(HTX3)		FM(TX3_A)		FM(MSIOF4_SYNC)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_3_0	FM(HRX3_A)		FM(SCK3_A)		FM(MSIOF4_SS2)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_7_4	FM(HSCK3_A)		FM(CTS3_N_A)		FM(MSIOF4_SCK)		FM(TPU0TO0_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_11_8	FM(HRTS3_N_A)		FM(RTS3_N_A)		FM(MSIOF4_TXD)		FM(TPU0TO1_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_15_12	FM(HCTS3_N_A)		FM(RX3_A)		FM(MSIOF4_RXD)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_19_16	FM(HTX3_A)		FM(TX3_A)		FM(MSIOF4_SYNC)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR2 */
 /* IP0SR2 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -776,24 +776,24 @@ static const u16 pinmux_data[] = {
 
 	/* IP0SR1 */
 	PINMUX_IPSR_GPSR(IP0SR1_3_0,	MSIOF1_SS2),
-	PINMUX_IPSR_GPSR(IP0SR1_3_0,	HTX3_A),
-	PINMUX_IPSR_GPSR(IP0SR1_3_0,	TX3),
+	PINMUX_IPSR_GPSR(IP0SR1_3_0,	HTX3_B),
+	PINMUX_IPSR_GPSR(IP0SR1_3_0,	TX3_B),
 
 	PINMUX_IPSR_GPSR(IP0SR1_7_4,	MSIOF1_SS1),
-	PINMUX_IPSR_GPSR(IP0SR1_7_4,	HCTS3_N_A),
-	PINMUX_IPSR_GPSR(IP0SR1_7_4,	RX3),
+	PINMUX_IPSR_GPSR(IP0SR1_7_4,	HCTS3_N_B),
+	PINMUX_IPSR_GPSR(IP0SR1_7_4,	RX3_B),
 
 	PINMUX_IPSR_GPSR(IP0SR1_11_8,	MSIOF1_SYNC),
-	PINMUX_IPSR_GPSR(IP0SR1_11_8,	HRTS3_N_A),
-	PINMUX_IPSR_GPSR(IP0SR1_11_8,	RTS3_N),
+	PINMUX_IPSR_GPSR(IP0SR1_11_8,	HRTS3_N_B),
+	PINMUX_IPSR_GPSR(IP0SR1_11_8,	RTS3_N_B),
 
 	PINMUX_IPSR_GPSR(IP0SR1_15_12,	MSIOF1_SCK),
-	PINMUX_IPSR_GPSR(IP0SR1_15_12,	HSCK3_A),
-	PINMUX_IPSR_GPSR(IP0SR1_15_12,	CTS3_N),
+	PINMUX_IPSR_GPSR(IP0SR1_15_12,	HSCK3_B),
+	PINMUX_IPSR_GPSR(IP0SR1_15_12,	CTS3_N_B),
 
 	PINMUX_IPSR_GPSR(IP0SR1_19_16,	MSIOF1_TXD),
-	PINMUX_IPSR_GPSR(IP0SR1_19_16,	HRX3_A),
-	PINMUX_IPSR_GPSR(IP0SR1_19_16,	SCK3),
+	PINMUX_IPSR_GPSR(IP0SR1_19_16,	HRX3_B),
+	PINMUX_IPSR_GPSR(IP0SR1_19_16,	SCK3_B),
 
 	PINMUX_IPSR_GPSR(IP0SR1_23_20,	MSIOF1_RXD),
 
@@ -864,25 +864,25 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP2SR1_31_28,	IRQ3_B),
 
 	/* IP3SR1 */
-	PINMUX_IPSR_GPSR(IP3SR1_3_0,	HRX3),
+	PINMUX_IPSR_GPSR(IP3SR1_3_0,	HRX3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_3_0,	SCK3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_3_0,	MSIOF4_SS2),
 
-	PINMUX_IPSR_GPSR(IP3SR1_7_4,	HSCK3),
+	PINMUX_IPSR_GPSR(IP3SR1_7_4,	HSCK3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	CTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	MSIOF4_SCK),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	TPU0TO0_A),
 
-	PINMUX_IPSR_GPSR(IP3SR1_11_8,	HRTS3_N),
+	PINMUX_IPSR_GPSR(IP3SR1_11_8,	HRTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	RTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	MSIOF4_TXD),
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	TPU0TO1_A),
 
-	PINMUX_IPSR_GPSR(IP3SR1_15_12,	HCTS3_N),
+	PINMUX_IPSR_GPSR(IP3SR1_15_12,	HCTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_15_12,	RX3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_15_12,	MSIOF4_RXD),
 
-	PINMUX_IPSR_GPSR(IP3SR1_19_16,	HTX3),
+	PINMUX_IPSR_GPSR(IP3SR1_19_16,	HTX3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_19_16,	TX3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_19_16,	MSIOF4_SYNC),
 
@@ -1666,49 +1666,48 @@ static const unsigned int hscif2_ctrl_mux[] = {
 };
 
 /* - HSCIF3 ----------------------------------------------------------------- */
-static const unsigned int hscif3_data_pins[] = {
-	/* HRX3, HTX3 */
+static const unsigned int hscif3_data_a_pins[] = {
+	/* HRX3_A, HTX3_A */
 	RCAR_GP_PIN(1, 24), RCAR_GP_PIN(1, 28),
 };
-static const unsigned int hscif3_data_mux[] = {
-	HRX3_MARK, HTX3_MARK,
+static const unsigned int hscif3_data_a_mux[] = {
+	HRX3_A_MARK, HTX3_A_MARK,
 };
-static const unsigned int hscif3_clk_pins[] = {
-	/* HSCK3 */
+static const unsigned int hscif3_clk_a_pins[] = {
+	/* HSCK3_A */
 	RCAR_GP_PIN(1, 25),
 };
-static const unsigned int hscif3_clk_mux[] = {
-	HSCK3_MARK,
+static const unsigned int hscif3_clk_a_mux[] = {
+	HSCK3_A_MARK,
 };
-static const unsigned int hscif3_ctrl_pins[] = {
-	/* HRTS3_N, HCTS3_N */
+static const unsigned int hscif3_ctrl_a_pins[] = {
+	/* HRTS3_N_A, HCTS3_N_A */
 	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 27),
 };
-static const unsigned int hscif3_ctrl_mux[] = {
-	HRTS3_N_MARK, HCTS3_N_MARK,
+static const unsigned int hscif3_ctrl_a_mux[] = {
+	HRTS3_N_A_MARK, HCTS3_N_A_MARK,
 };
 
-/* - HSCIF3_A ----------------------------------------------------------------- */
-static const unsigned int hscif3_data_a_pins[] = {
-	/* HRX3_A, HTX3_A */
+static const unsigned int hscif3_data_b_pins[] = {
+	/* HRX3_B, HTX3_B */
 	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 0),
 };
-static const unsigned int hscif3_data_a_mux[] = {
-	HRX3_A_MARK, HTX3_A_MARK,
+static const unsigned int hscif3_data_b_mux[] = {
+	HRX3_B_MARK, HTX3_B_MARK,
 };
-static const unsigned int hscif3_clk_a_pins[] = {
-	/* HSCK3_A */
+static const unsigned int hscif3_clk_b_pins[] = {
+	/* HSCK3_B */
 	RCAR_GP_PIN(1, 3),
 };
-static const unsigned int hscif3_clk_a_mux[] = {
-	HSCK3_A_MARK,
+static const unsigned int hscif3_clk_b_mux[] = {
+	HSCK3_B_MARK,
 };
-static const unsigned int hscif3_ctrl_a_pins[] = {
-	/* HRTS3_N_A, HCTS3_N_A */
+static const unsigned int hscif3_ctrl_b_pins[] = {
+	/* HRTS3_N_B, HCTS3_N_B */
 	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 1),
 };
-static const unsigned int hscif3_ctrl_a_mux[] = {
-	HRTS3_N_A_MARK, HCTS3_N_A_MARK,
+static const unsigned int hscif3_ctrl_b_mux[] = {
+	HRTS3_N_B_MARK, HCTS3_N_B_MARK,
 };
 
 /* - I2C0 ------------------------------------------------------------------- */
@@ -2304,29 +2303,6 @@ static const unsigned int scif1_ctrl_b_mux[] = {
 };
 
 /* - SCIF3 ------------------------------------------------------------------ */
-static const unsigned int scif3_data_pins[] = {
-	/* RX3, TX3 */
-	RCAR_GP_PIN(1, 1), RCAR_GP_PIN(1, 0),
-};
-static const unsigned int scif3_data_mux[] = {
-	RX3_MARK, TX3_MARK,
-};
-static const unsigned int scif3_clk_pins[] = {
-	/* SCK3 */
-	RCAR_GP_PIN(1, 4),
-};
-static const unsigned int scif3_clk_mux[] = {
-	SCK3_MARK,
-};
-static const unsigned int scif3_ctrl_pins[] = {
-	/* RTS3_N, CTS3_N */
-	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-};
-static const unsigned int scif3_ctrl_mux[] = {
-	RTS3_N_MARK, CTS3_N_MARK,
-};
-
-/* - SCIF3_A ------------------------------------------------------------------ */
 static const unsigned int scif3_data_a_pins[] = {
 	/* RX3_A, TX3_A */
 	RCAR_GP_PIN(1, 27), RCAR_GP_PIN(1, 28),
@@ -2349,6 +2325,28 @@ static const unsigned int scif3_ctrl_a_mux[] = {
 	RTS3_N_A_MARK, CTS3_N_A_MARK,
 };
 
+static const unsigned int scif3_data_b_pins[] = {
+	/* RX3_B, TX3_B */
+	RCAR_GP_PIN(1, 1), RCAR_GP_PIN(1, 0),
+};
+static const unsigned int scif3_data_b_mux[] = {
+	RX3_B_MARK, TX3_B_MARK,
+};
+static const unsigned int scif3_clk_b_pins[] = {
+	/* SCK3_B */
+	RCAR_GP_PIN(1, 4),
+};
+static const unsigned int scif3_clk_b_mux[] = {
+	SCK3_B_MARK,
+};
+static const unsigned int scif3_ctrl_b_pins[] = {
+	/* RTS3_N_B, CTS3_N_B */
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+};
+static const unsigned int scif3_ctrl_b_mux[] = {
+	RTS3_N_B_MARK, CTS3_N_B_MARK,
+};
+
 /* - SCIF4 ------------------------------------------------------------------ */
 static const unsigned int scif4_data_pins[] = {
 	/* RX4, TX4 */
@@ -2593,12 +2591,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(hscif2_data),
 	SH_PFC_PIN_GROUP(hscif2_clk),
 	SH_PFC_PIN_GROUP(hscif2_ctrl),
-	SH_PFC_PIN_GROUP(hscif3_data),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(hscif3_clk),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(hscif3_ctrl),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(hscif3_data_a),	/* suffix might be updated */
-	SH_PFC_PIN_GROUP(hscif3_clk_a),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(hscif3_ctrl_a),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif3_data_a),
+	SH_PFC_PIN_GROUP(hscif3_clk_a),
+	SH_PFC_PIN_GROUP(hscif3_ctrl_a),
+	SH_PFC_PIN_GROUP(hscif3_data_b),
+	SH_PFC_PIN_GROUP(hscif3_clk_b),
+	SH_PFC_PIN_GROUP(hscif3_ctrl_b),
 
 	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1),
@@ -2689,12 +2687,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif1_data_b),
 	SH_PFC_PIN_GROUP(scif1_clk_b),
 	SH_PFC_PIN_GROUP(scif1_ctrl_b),
-	SH_PFC_PIN_GROUP(scif3_data),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(scif3_clk),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(scif3_ctrl),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(scif3_data_a),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(scif3_clk_a),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(scif3_ctrl_a),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif3_data_a),
+	SH_PFC_PIN_GROUP(scif3_clk_a),
+	SH_PFC_PIN_GROUP(scif3_ctrl_a),
+	SH_PFC_PIN_GROUP(scif3_data_b),
+	SH_PFC_PIN_GROUP(scif3_clk_b),
+	SH_PFC_PIN_GROUP(scif3_ctrl_b),
 	SH_PFC_PIN_GROUP(scif4_data),
 	SH_PFC_PIN_GROUP(scif4_clk),
 	SH_PFC_PIN_GROUP(scif4_ctrl),
@@ -2823,13 +2821,12 @@ static const char * const hscif2_groups[] = {
 };
 
 static const char * const hscif3_groups[] = {
-	/* suffix might be updated */
-	"hscif3_data",
-	"hscif3_clk",
-	"hscif3_ctrl",
 	"hscif3_data_a",
 	"hscif3_clk_a",
 	"hscif3_ctrl_a",
+	"hscif3_data_b",
+	"hscif3_clk_b",
+	"hscif3_ctrl_b",
 };
 
 static const char * const i2c0_groups[] = {
@@ -2999,13 +2996,12 @@ static const char * const scif1_groups[] = {
 };
 
 static const char * const scif3_groups[] = {
-	/* suffix might be updated */
-	"scif3_data",
-	"scif3_clk",
-	"scif3_ctrl",
 	"scif3_data_a",
 	"scif3_clk_a",
 	"scif3_ctrl_a",
+	"scif3_data_b",
+	"scif3_clk_b",
+	"scif3_ctrl_b",
 };
 
 static const char * const scif4_groups[] = {
-- 
2.34.1


