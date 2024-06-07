Return-Path: <linux-gpio+bounces-7254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E669000B6
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 12:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E08521C222F9
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 10:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A38715B99D;
	Fri,  7 Jun 2024 10:23:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4042F1E51D
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755821; cv=none; b=gFKrKoWJykiSnXPOvgWEhLXnuJyR51s7JuQhPCQ9yjZzh066n+wsKMJCsfsM4lZsPr4SJfzoLQ9cLN6f3lRDPxly8CJqFRrZeSNdEM8KmW8dkqnjk0yt6sfoV9lMCJNKgiIlUczYm4ElRr9HjWxpyRGlnN2Fe2ZQgRutxzR8XHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755821; c=relaxed/simple;
	bh=gyR/0gLFmok33OQL/9d+54PAju+H+4hhW8s7S3AqEO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NrIpaXqa9MJqSQC5s/WegcfMRTUB+w3hZ0YD4AFFxWczS6CVxlDsw1ALG7xQ/RVSsLbok13FNo4A0HTihydCf76rhBsaugK2eSYk+4WBK3MVMP1BhN/b2F3uowUoIAcJRRVE+vc0ba/f4yfmw5ZohvWxiwztub1nnZjFVxPq7so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4VwcVm6QgXz4x5b1
	for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2024 12:14:08 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5ffd:9c1a:d9c:cf6])
	by andre.telenet-ops.be with bizsmtp
	id YaDz2C00C45NznL01aDzC7; Fri, 07 Jun 2024 12:14:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWae-00ECgl-4I;
	Fri, 07 Jun 2024 12:13:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWbf-002012-Ku;
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
Subject: [PATCH 8/8] pinctrl: renesas: r8a779g0: Fix TPU suffixes
Date: Fri,  7 Jun 2024 12:13:55 +0200
Message-Id: <0dd9428bc24e97e1001ed3976b1cb98966f5e7e3.1717754960.git.geert+renesas@glider.be>
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

The Timer Pulse Unit channels have two alternate pin groups:
"tpu_to[0-3]" and "tpu_to[0-3]_a".

Increase uniformity by adopting R-Car V4M naming:
  - Rename "tpu_to[0-3]_a" to "tpu_to[0-3]_b",
  - Rename "tpu_to[0-3]" to "tpu_to[0-3]_a",

Fixes: ad9bb2fec66262b0 ("pinctrl: renesas: Initial R8A779G0 (R-Car V4H) PFC support")
Fixes: 050442ae4c74f830 ("pinctrl: renesas: r8a779g0: Add pins, groups and functions")
Fixes: 85a9cbe4c57bb958 ("pinctrl: renesas: r8a779g0: Add missing TPU0TOx_A")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 128 ++++++++++++-------------
 1 file changed, 63 insertions(+), 65 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 8c19b892441a3567..bb843e333c880f91 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -119,8 +119,8 @@
 #define GPSR2_11	F_(CANFD0_RX,		IP1SR2_15_12)
 #define GPSR2_10	F_(CANFD0_TX,		IP1SR2_11_8)
 #define GPSR2_9		F_(CAN_CLK,		IP1SR2_7_4)
-#define GPSR2_8		F_(TPU0TO0,		IP1SR2_3_0)
-#define GPSR2_7		F_(TPU0TO1,		IP0SR2_31_28)
+#define GPSR2_8		F_(TPU0TO0_A,		IP1SR2_3_0)
+#define GPSR2_7		F_(TPU0TO1_A,		IP0SR2_31_28)
 #define GPSR2_6		F_(FXR_TXDB,		IP0SR2_27_24)
 #define GPSR2_5		F_(FXR_TXENB_N_A,	IP0SR2_23_20)
 #define GPSR2_4		F_(RXDB_EXTFXR,		IP0SR2_19_16)
@@ -332,29 +332,29 @@
 
 /* IP3SR1 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP3SR1_3_0	FM(HRX3_A)		FM(SCK3_A)		FM(MSIOF4_SS2)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_7_4	FM(HSCK3_A)		FM(CTS3_N_A)		FM(MSIOF4_SCK)		FM(TPU0TO0_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_11_8	FM(HRTS3_N_A)		FM(RTS3_N_A)		FM(MSIOF4_TXD)		FM(TPU0TO1_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_7_4	FM(HSCK3_A)		FM(CTS3_N_A)		FM(MSIOF4_SCK)		FM(TPU0TO0_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_11_8	FM(HRTS3_N_A)		FM(RTS3_N_A)		FM(MSIOF4_TXD)		FM(TPU0TO1_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR1_15_12	FM(HCTS3_N_A)		FM(RX3_A)		FM(MSIOF4_RXD)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR1_19_16	FM(HTX3_A)		FM(TX3_A)		FM(MSIOF4_SYNC)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR2 */
 /* IP0SR2 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR2_3_0	FM(FXR_TXDA)		FM(CANFD1_TX)		FM(TPU0TO2_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR2_7_4	FM(FXR_TXENA_N_A)	FM(CANFD1_RX)		FM(TPU0TO3_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_3_0	FM(FXR_TXDA)		FM(CANFD1_TX)		FM(TPU0TO2_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_7_4	FM(FXR_TXENA_N_A)	FM(CANFD1_RX)		FM(TPU0TO3_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_11_8	FM(RXDA_EXTFXR)		FM(CANFD5_TX_A)		FM(IRQ5)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_15_12	FM(CLK_EXTFXR)		FM(CANFD5_RX_A)		FM(IRQ4_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_19_16	FM(RXDB_EXTFXR)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_23_20	FM(FXR_TXENB_N_A)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_27_24	FM(FXR_TXDB)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR2_31_28	FM(TPU0TO1)		FM(CANFD6_TX)		F_(0, 0)		FM(TCLK2_C)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_31_28	FM(TPU0TO1_A)		FM(CANFD6_TX)		F_(0, 0)		FM(TCLK2_C)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR2 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR2_3_0	FM(TPU0TO0)		FM(CANFD6_RX)		F_(0, 0)		FM(TCLK1_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_3_0	FM(TPU0TO0_A)		FM(CANFD6_RX)		F_(0, 0)		FM(TCLK1_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_7_4	FM(CAN_CLK)		FM(FXR_TXENA_N_B)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_11_8	FM(CANFD0_TX)		FM(FXR_TXENB_N_B)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_15_12	FM(CANFD0_RX)		FM(STPWT_EXTFXR)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2)		F_(0, 0)		FM(TCLK3_C)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1_B)		FM(TCLK4_C)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2_A)		F_(0, 0)		FM(TCLK3_C)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3_A)		FM(PWM1_B)		FM(TCLK4_C)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_27_24	FM(CANFD3_TX)		F_(0, 0)		FM(PWM2)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_31_28	FM(CANFD3_RX)		F_(0, 0)		FM(PWM3_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
@@ -871,12 +871,12 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	HSCK3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	CTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	MSIOF4_SCK),
-	PINMUX_IPSR_GPSR(IP3SR1_7_4,	TPU0TO0_A),
+	PINMUX_IPSR_GPSR(IP3SR1_7_4,	TPU0TO0_B),
 
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	HRTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	RTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	MSIOF4_TXD),
-	PINMUX_IPSR_GPSR(IP3SR1_11_8,	TPU0TO1_A),
+	PINMUX_IPSR_GPSR(IP3SR1_11_8,	TPU0TO1_B),
 
 	PINMUX_IPSR_GPSR(IP3SR1_15_12,	HCTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_15_12,	RX3_A),
@@ -889,11 +889,11 @@ static const u16 pinmux_data[] = {
 	/* IP0SR2 */
 	PINMUX_IPSR_GPSR(IP0SR2_3_0,	FXR_TXDA),
 	PINMUX_IPSR_GPSR(IP0SR2_3_0,	CANFD1_TX),
-	PINMUX_IPSR_GPSR(IP0SR2_3_0,	TPU0TO2_A),
+	PINMUX_IPSR_GPSR(IP0SR2_3_0,	TPU0TO2_B),
 
 	PINMUX_IPSR_GPSR(IP0SR2_7_4,	FXR_TXENA_N_A),
 	PINMUX_IPSR_GPSR(IP0SR2_7_4,	CANFD1_RX),
-	PINMUX_IPSR_GPSR(IP0SR2_7_4,	TPU0TO3_A),
+	PINMUX_IPSR_GPSR(IP0SR2_7_4,	TPU0TO3_B),
 
 	PINMUX_IPSR_GPSR(IP0SR2_11_8,	RXDA_EXTFXR),
 	PINMUX_IPSR_GPSR(IP0SR2_11_8,	CANFD5_TX_A),
@@ -909,12 +909,12 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP0SR2_27_24,	FXR_TXDB),
 
-	PINMUX_IPSR_GPSR(IP0SR2_31_28,	TPU0TO1),
+	PINMUX_IPSR_GPSR(IP0SR2_31_28,	TPU0TO1_A),
 	PINMUX_IPSR_GPSR(IP0SR2_31_28,	CANFD6_TX),
 	PINMUX_IPSR_GPSR(IP0SR2_31_28,	TCLK2_C),
 
 	/* IP1SR2 */
-	PINMUX_IPSR_GPSR(IP1SR2_3_0,	TPU0TO0),
+	PINMUX_IPSR_GPSR(IP1SR2_3_0,	TPU0TO0_A),
 	PINMUX_IPSR_GPSR(IP1SR2_3_0,	CANFD6_RX),
 	PINMUX_IPSR_GPSR(IP1SR2_3_0,	TCLK1_B),
 
@@ -928,11 +928,11 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1SR2_15_12,	STPWT_EXTFXR),
 
 	PINMUX_IPSR_GPSR(IP1SR2_19_16,	CANFD2_TX),
-	PINMUX_IPSR_GPSR(IP1SR2_19_16,	TPU0TO2),
+	PINMUX_IPSR_GPSR(IP1SR2_19_16,	TPU0TO2_A),
 	PINMUX_IPSR_GPSR(IP1SR2_19_16,	TCLK3_C),
 
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	CANFD2_RX),
-	PINMUX_IPSR_GPSR(IP1SR2_23_20,	TPU0TO3),
+	PINMUX_IPSR_GPSR(IP1SR2_23_20,	TPU0TO3_A),
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	PWM1_B),
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	TCLK4_C),
 
@@ -2403,64 +2403,63 @@ static const unsigned int ssi_ctrl_mux[] = {
 	SSI_SCK_MARK, SSI_WS_MARK,
 };
 
-/* - TPU ------------------------------------------------------------------- */
-static const unsigned int tpu_to0_pins[] = {
-	/* TPU0TO0 */
+/* - TPU -------------------------------------------------------------------- */
+static const unsigned int tpu_to0_a_pins[] = {
+	/* TPU0TO0_A */
 	RCAR_GP_PIN(2, 8),
 };
-static const unsigned int tpu_to0_mux[] = {
-	TPU0TO0_MARK,
+static const unsigned int tpu_to0_a_mux[] = {
+	TPU0TO0_A_MARK,
 };
-static const unsigned int tpu_to1_pins[] = {
-	/* TPU0TO1 */
+static const unsigned int tpu_to1_a_pins[] = {
+	/* TPU0TO1_A */
 	RCAR_GP_PIN(2, 7),
 };
-static const unsigned int tpu_to1_mux[] = {
-	TPU0TO1_MARK,
+static const unsigned int tpu_to1_a_mux[] = {
+	TPU0TO1_A_MARK,
 };
-static const unsigned int tpu_to2_pins[] = {
-	/* TPU0TO2 */
+static const unsigned int tpu_to2_a_pins[] = {
+	/* TPU0TO2_A */
 	RCAR_GP_PIN(2, 12),
 };
-static const unsigned int tpu_to2_mux[] = {
-	TPU0TO2_MARK,
+static const unsigned int tpu_to2_a_mux[] = {
+	TPU0TO2_A_MARK,
 };
-static const unsigned int tpu_to3_pins[] = {
-	/* TPU0TO3 */
+static const unsigned int tpu_to3_a_pins[] = {
+	/* TPU0TO3_A */
 	RCAR_GP_PIN(2, 13),
 };
-static const unsigned int tpu_to3_mux[] = {
-	TPU0TO3_MARK,
+static const unsigned int tpu_to3_a_mux[] = {
+	TPU0TO3_A_MARK,
 };
 
-/* - TPU_A ------------------------------------------------------------------- */
-static const unsigned int tpu_to0_a_pins[] = {
-	/* TPU0TO0_A */
+static const unsigned int tpu_to0_b_pins[] = {
+	/* TPU0TO0_B */
 	RCAR_GP_PIN(1, 25),
 };
-static const unsigned int tpu_to0_a_mux[] = {
-	TPU0TO0_A_MARK,
+static const unsigned int tpu_to0_b_mux[] = {
+	TPU0TO0_B_MARK,
 };
-static const unsigned int tpu_to1_a_pins[] = {
-	/* TPU0TO1_A */
+static const unsigned int tpu_to1_b_pins[] = {
+	/* TPU0TO1_B */
 	RCAR_GP_PIN(1, 26),
 };
-static const unsigned int tpu_to1_a_mux[] = {
-	TPU0TO1_A_MARK,
+static const unsigned int tpu_to1_b_mux[] = {
+	TPU0TO1_B_MARK,
 };
-static const unsigned int tpu_to2_a_pins[] = {
-	/* TPU0TO2_A */
+static const unsigned int tpu_to2_b_pins[] = {
+	/* TPU0TO2_B */
 	RCAR_GP_PIN(2, 0),
 };
-static const unsigned int tpu_to2_a_mux[] = {
-	TPU0TO2_A_MARK,
+static const unsigned int tpu_to2_b_mux[] = {
+	TPU0TO2_B_MARK,
 };
-static const unsigned int tpu_to3_a_pins[] = {
-	/* TPU0TO3_A */
+static const unsigned int tpu_to3_b_pins[] = {
+	/* TPU0TO3_B */
 	RCAR_GP_PIN(2, 1),
 };
-static const unsigned int tpu_to3_a_mux[] = {
-	TPU0TO3_A_MARK,
+static const unsigned int tpu_to3_b_mux[] = {
+	TPU0TO3_B_MARK,
 };
 
 /* - TSN0 ------------------------------------------------ */
@@ -2702,14 +2701,14 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(ssi_data),
 	SH_PFC_PIN_GROUP(ssi_ctrl),
 
-	SH_PFC_PIN_GROUP(tpu_to0),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(tpu_to0_a),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(tpu_to1),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(tpu_to1_a),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(tpu_to2),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(tpu_to2_a),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(tpu_to3),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(tpu_to3_a),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(tpu_to0_a),
+	SH_PFC_PIN_GROUP(tpu_to0_b),
+	SH_PFC_PIN_GROUP(tpu_to1_a),
+	SH_PFC_PIN_GROUP(tpu_to1_b),
+	SH_PFC_PIN_GROUP(tpu_to2_a),
+	SH_PFC_PIN_GROUP(tpu_to2_b),
+	SH_PFC_PIN_GROUP(tpu_to3_a),
+	SH_PFC_PIN_GROUP(tpu_to3_b),
 
 	SH_PFC_PIN_GROUP(tsn0_link),
 	SH_PFC_PIN_GROUP(tsn0_phy_int),
@@ -3020,15 +3019,14 @@ static const char * const ssi_groups[] = {
 };
 
 static const char * const tpu_groups[] = {
-	/* suffix might be updated */
-	"tpu_to0",
 	"tpu_to0_a",
-	"tpu_to1",
+	"tpu_to0_b",
 	"tpu_to1_a",
-	"tpu_to2",
+	"tpu_to1_b",
 	"tpu_to2_a",
-	"tpu_to3",
+	"tpu_to2_b",
 	"tpu_to3_a",
+	"tpu_to3_b",
 };
 
 static const char * const tsn0_groups[] = {
-- 
2.34.1


