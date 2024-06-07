Return-Path: <linux-gpio+bounces-7255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E84C9000BA
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 12:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C200DB22DB5
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 10:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A8F15D5B2;
	Fri,  7 Jun 2024 10:23:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A6915CD6D
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755833; cv=none; b=uvDDeVqJiU51396FrZn+EOuTAKv2tt7LHdcvEMwKAJ+w9tB52uC9TrKZI3AcnvN5bP0Vk7WwSz0Ikb5APqHL9pgsXyzY1/wbubg2nXQkuWldbOcdYo/iz1QkthvfnLzG+KGHU0gxSTiCeK/oxGW2kvHreOFuaxyFC96A96gyuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755833; c=relaxed/simple;
	bh=gS3tS7spl7UA//1iTx+bLTSEK6tZnerQMkwzqKS4yfM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bBl2Wj+4dBY2jzBqOrOOMDzD5ACvChQR/El1zHB5R/MsreTtS3lZI4ILaYLJhHC6dvYwN4qRp4R5y6zbFo7ncg1FREHNBwQblUc8QTn4uYxWNo07R7DSxKZLl0S7owlQVaOzsaQLBAotQJiIP1x7nNTQ5dSLUp/icdir0hWX3c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4VwcVm69Q0z4wxqK
	for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2024 12:14:08 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5ffd:9c1a:d9c:cf6])
	by baptiste.telenet-ops.be with bizsmtp
	id YaDz2C00M45NznL01aDz7g; Fri, 07 Jun 2024 12:14:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWae-00ECgO-0I;
	Fri, 07 Jun 2024 12:13:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWbf-00200f-H7;
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
Subject: [PATCH 3/8] pinctrl: renesas: r8a779g0: Fix (H)SCIF1 suffixes
Date: Fri,  7 Jun 2024 12:13:50 +0200
Message-Id: <5009130d1867e12abf9b231c8838fd05e2b28bee.1717754960.git.geert+renesas@glider.be>
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

The Pin Multiplex attachment in Rev.1.10 of the R-Car V4H Series
Hardware User's Manual still has two alternate pin groups (GP0_14-18
and GP1_6-10) each named both HSCIF1 and SCIF1.  To differentiate, the
pin control driver uses "(h)scif1" and "(h)scif1_x", which were
considered temporary names until the conflict was sorted out.

Fix this by adopting R-Car V4M naming:
  - Rename "(h)scif1" to "(h)scif1_a",
  - Rename "(h)scif1_x" to "(h)scif1_b".

Adopt the R-Car V4M naming "(h)scif1_a" and "(h)scif1_b" to increase
uniformity.

While at it, remove unneeded separators.

Fixes: ad9bb2fec66262b0 ("pinctrl: renesas: Initial R8A779G0 (R-Car V4H) PFC support")
Fixes: 050442ae4c74f830 ("pinctrl: renesas: r8a779g0: Add pins, groups and functions")
Fixes: cf4f7891847bc558 ("pinctrl: renesas: r8a779g0: Add missing HSCIF1_X")
Fixes: 9c151c2be92becf2 ("pinctrl: renesas: r8a779g0: Add missing SCIF1_X")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 208 ++++++++++++-------------
 1 file changed, 102 insertions(+), 106 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index ba2ec8e0421199b0..7b64429c35ad3e4e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -291,13 +291,13 @@
 #define IP1SR0_15_12	FM(MSIOF5_SCK)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_19_16	FM(MSIOF5_RXD)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_23_20	FM(MSIOF2_SS2)		FM(TCLK1)		FM(IRQ2_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR0_27_24	FM(MSIOF2_SS1)		FM(HTX1)		FM(TX1)			F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR0_31_28	FM(MSIOF2_SYNC)		FM(HRX1)		FM(RX1)			F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_27_24	FM(MSIOF2_SS1)		FM(HTX1_A)		FM(TX1_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_31_28	FM(MSIOF2_SYNC)		FM(HRX1_A)		FM(RX1_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR0 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP2SR0_3_0	FM(MSIOF2_TXD)		FM(HCTS1_N)		FM(CTS1_N)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR0_7_4	FM(MSIOF2_SCK)		FM(HRTS1_N)		FM(RTS1_N)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR0_11_8	FM(MSIOF2_RXD)		FM(HSCK1)		FM(SCK1)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR0_3_0	FM(MSIOF2_TXD)		FM(HCTS1_N_A)		FM(CTS1_N_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR0_7_4	FM(MSIOF2_SCK)		FM(HRTS1_N_A)		FM(RTS1_N_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR0_11_8	FM(MSIOF2_RXD)		FM(HSCK1_A)		FM(SCK1_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR1 */
 /* IP0SR1 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -307,13 +307,13 @@
 #define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		FM(CTS3_N)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		FM(SCK3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_23_20	FM(MSIOF1_RXD)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_27_24	FM(MSIOF0_SS2)		FM(HTX1_X)		FM(TX1_X)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_X)		FM(RX1_X)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_27_24	FM(MSIOF0_SS2)		FM(HTX1_B)		FM(TX1_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_B)		FM(RX1_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR1 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_N_X)		FM(CTS1_N_X)		FM(CANFD5_TX_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_N_X)		FM(RTS1_N_X)		FM(CANFD5_RX_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_X)		FM(SCK1_X)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_N_B)		FM(CTS1_N_B)		FM(CANFD5_TX_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_N_B)		FM(RTS1_N_B)		FM(CANFD5_RX_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_B)		FM(SCK1_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_15_12	FM(MSIOF0_RXD)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_19_16	FM(HTX0)		FM(TX0)			F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_23_20	FM(HCTS0_N)		FM(CTS0_N)		FM(PWM8_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -754,25 +754,25 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1SR0_23_20,	IRQ2_A),
 
 	PINMUX_IPSR_GPSR(IP1SR0_27_24,	MSIOF2_SS1),
-	PINMUX_IPSR_GPSR(IP1SR0_27_24,	HTX1),
-	PINMUX_IPSR_GPSR(IP1SR0_27_24,	TX1),
+	PINMUX_IPSR_GPSR(IP1SR0_27_24,	HTX1_A),
+	PINMUX_IPSR_GPSR(IP1SR0_27_24,	TX1_A),
 
 	PINMUX_IPSR_GPSR(IP1SR0_31_28,	MSIOF2_SYNC),
-	PINMUX_IPSR_GPSR(IP1SR0_31_28,	HRX1),
-	PINMUX_IPSR_GPSR(IP1SR0_31_28,	RX1),
+	PINMUX_IPSR_GPSR(IP1SR0_31_28,	HRX1_A),
+	PINMUX_IPSR_GPSR(IP1SR0_31_28,	RX1_A),
 
 	/* IP2SR0 */
 	PINMUX_IPSR_GPSR(IP2SR0_3_0,	MSIOF2_TXD),
-	PINMUX_IPSR_GPSR(IP2SR0_3_0,	HCTS1_N),
-	PINMUX_IPSR_GPSR(IP2SR0_3_0,	CTS1_N),
+	PINMUX_IPSR_GPSR(IP2SR0_3_0,	HCTS1_N_A),
+	PINMUX_IPSR_GPSR(IP2SR0_3_0,	CTS1_N_A),
 
 	PINMUX_IPSR_GPSR(IP2SR0_7_4,	MSIOF2_SCK),
-	PINMUX_IPSR_GPSR(IP2SR0_7_4,	HRTS1_N),
-	PINMUX_IPSR_GPSR(IP2SR0_7_4,	RTS1_N),
+	PINMUX_IPSR_GPSR(IP2SR0_7_4,	HRTS1_N_A),
+	PINMUX_IPSR_GPSR(IP2SR0_7_4,	RTS1_N_A),
 
 	PINMUX_IPSR_GPSR(IP2SR0_11_8,	MSIOF2_RXD),
-	PINMUX_IPSR_GPSR(IP2SR0_11_8,	HSCK1),
-	PINMUX_IPSR_GPSR(IP2SR0_11_8,	SCK1),
+	PINMUX_IPSR_GPSR(IP2SR0_11_8,	HSCK1_A),
+	PINMUX_IPSR_GPSR(IP2SR0_11_8,	SCK1_A),
 
 	/* IP0SR1 */
 	PINMUX_IPSR_GPSR(IP0SR1_3_0,	MSIOF1_SS2),
@@ -798,27 +798,27 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP0SR1_23_20,	MSIOF1_RXD),
 
 	PINMUX_IPSR_GPSR(IP0SR1_27_24,	MSIOF0_SS2),
-	PINMUX_IPSR_GPSR(IP0SR1_27_24,	HTX1_X),
-	PINMUX_IPSR_GPSR(IP0SR1_27_24,	TX1_X),
+	PINMUX_IPSR_GPSR(IP0SR1_27_24,	HTX1_B),
+	PINMUX_IPSR_GPSR(IP0SR1_27_24,	TX1_B),
 
 	PINMUX_IPSR_GPSR(IP0SR1_31_28,	MSIOF0_SS1),
-	PINMUX_IPSR_GPSR(IP0SR1_31_28,	HRX1_X),
-	PINMUX_IPSR_GPSR(IP0SR1_31_28,	RX1_X),
+	PINMUX_IPSR_GPSR(IP0SR1_31_28,	HRX1_B),
+	PINMUX_IPSR_GPSR(IP0SR1_31_28,	RX1_B),
 
 	/* IP1SR1 */
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	MSIOF0_SYNC),
-	PINMUX_IPSR_GPSR(IP1SR1_3_0,	HCTS1_N_X),
-	PINMUX_IPSR_GPSR(IP1SR1_3_0,	CTS1_N_X),
+	PINMUX_IPSR_GPSR(IP1SR1_3_0,	HCTS1_N_B),
+	PINMUX_IPSR_GPSR(IP1SR1_3_0,	CTS1_N_B),
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	CANFD5_TX_B),
 
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	MSIOF0_TXD),
-	PINMUX_IPSR_GPSR(IP1SR1_7_4,	HRTS1_N_X),
-	PINMUX_IPSR_GPSR(IP1SR1_7_4,	RTS1_N_X),
+	PINMUX_IPSR_GPSR(IP1SR1_7_4,	HRTS1_N_B),
+	PINMUX_IPSR_GPSR(IP1SR1_7_4,	RTS1_N_B),
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	CANFD5_RX_B),
 
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	MSIOF0_SCK),
-	PINMUX_IPSR_GPSR(IP1SR1_11_8,	HSCK1_X),
-	PINMUX_IPSR_GPSR(IP1SR1_11_8,	SCK1_X),
+	PINMUX_IPSR_GPSR(IP1SR1_11_8,	HSCK1_B),
+	PINMUX_IPSR_GPSR(IP1SR1_11_8,	SCK1_B),
 
 	PINMUX_IPSR_GPSR(IP1SR1_15_12,	MSIOF0_RXD),
 
@@ -1598,49 +1598,48 @@ static const unsigned int hscif0_ctrl_mux[] = {
 };
 
 /* - HSCIF1 ----------------------------------------------------------------- */
-static const unsigned int hscif1_data_pins[] = {
-	/* HRX1, HTX1 */
+static const unsigned int hscif1_data_a_pins[] = {
+	/* HRX1_A, HTX1_A */
 	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
 };
-static const unsigned int hscif1_data_mux[] = {
-	HRX1_MARK, HTX1_MARK,
+static const unsigned int hscif1_data_a_mux[] = {
+	HRX1_A_MARK, HTX1_A_MARK,
 };
-static const unsigned int hscif1_clk_pins[] = {
-	/* HSCK1 */
+static const unsigned int hscif1_clk_a_pins[] = {
+	/* HSCK1_A */
 	RCAR_GP_PIN(0, 18),
 };
-static const unsigned int hscif1_clk_mux[] = {
-	HSCK1_MARK,
+static const unsigned int hscif1_clk_a_mux[] = {
+	HSCK1_A_MARK,
 };
-static const unsigned int hscif1_ctrl_pins[] = {
-	/* HRTS1_N, HCTS1_N */
+static const unsigned int hscif1_ctrl_a_pins[] = {
+	/* HRTS1_N_A, HCTS1_N_A */
 	RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 16),
 };
-static const unsigned int hscif1_ctrl_mux[] = {
-	HRTS1_N_MARK, HCTS1_N_MARK,
+static const unsigned int hscif1_ctrl_a_mux[] = {
+	HRTS1_N_A_MARK, HCTS1_N_A_MARK,
 };
 
-/* - HSCIF1_X---------------------------------------------------------------- */
-static const unsigned int hscif1_data_x_pins[] = {
-	/* HRX1_X, HTX1_X */
+static const unsigned int hscif1_data_b_pins[] = {
+	/* HRX1_B, HTX1_B */
 	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
 };
-static const unsigned int hscif1_data_x_mux[] = {
-	HRX1_X_MARK, HTX1_X_MARK,
+static const unsigned int hscif1_data_b_mux[] = {
+	HRX1_B_MARK, HTX1_B_MARK,
 };
-static const unsigned int hscif1_clk_x_pins[] = {
-	/* HSCK1_X */
+static const unsigned int hscif1_clk_b_pins[] = {
+	/* HSCK1_B */
 	RCAR_GP_PIN(1, 10),
 };
-static const unsigned int hscif1_clk_x_mux[] = {
-	HSCK1_X_MARK,
+static const unsigned int hscif1_clk_b_mux[] = {
+	HSCK1_B_MARK,
 };
-static const unsigned int hscif1_ctrl_x_pins[] = {
-	/* HRTS1_N_X, HCTS1_N_X */
+static const unsigned int hscif1_ctrl_b_pins[] = {
+	/* HRTS1_N_B, HCTS1_N_B */
 	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 8),
 };
-static const unsigned int hscif1_ctrl_x_mux[] = {
-	HRTS1_N_X_MARK, HCTS1_N_X_MARK,
+static const unsigned int hscif1_ctrl_b_mux[] = {
+	HRTS1_N_B_MARK, HCTS1_N_B_MARK,
 };
 
 /* - HSCIF2 ----------------------------------------------------------------- */
@@ -2260,49 +2259,48 @@ static const unsigned int scif0_ctrl_mux[] = {
 };
 
 /* - SCIF1 ------------------------------------------------------------------ */
-static const unsigned int scif1_data_pins[] = {
-	/* RX1, TX1 */
+static const unsigned int scif1_data_a_pins[] = {
+	/* RX1_A, TX1_A */
 	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
 };
-static const unsigned int scif1_data_mux[] = {
-	RX1_MARK, TX1_MARK,
+static const unsigned int scif1_data_a_mux[] = {
+	RX1_A_MARK, TX1_A_MARK,
 };
-static const unsigned int scif1_clk_pins[] = {
-	/* SCK1 */
+static const unsigned int scif1_clk_a_pins[] = {
+	/* SCK1_A */
 	RCAR_GP_PIN(0, 18),
 };
-static const unsigned int scif1_clk_mux[] = {
-	SCK1_MARK,
+static const unsigned int scif1_clk_a_mux[] = {
+	SCK1_A_MARK,
 };
-static const unsigned int scif1_ctrl_pins[] = {
-	/* RTS1_N, CTS1_N */
+static const unsigned int scif1_ctrl_a_pins[] = {
+	/* RTS1_N_A, CTS1_N_A */
 	RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 16),
 };
-static const unsigned int scif1_ctrl_mux[] = {
-	RTS1_N_MARK, CTS1_N_MARK,
+static const unsigned int scif1_ctrl_a_mux[] = {
+	RTS1_N_A_MARK, CTS1_N_A_MARK,
 };
 
-/* - SCIF1_X ------------------------------------------------------------------ */
-static const unsigned int scif1_data_x_pins[] = {
-	/* RX1_X, TX1_X */
+static const unsigned int scif1_data_b_pins[] = {
+	/* RX1_B, TX1_B */
 	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
 };
-static const unsigned int scif1_data_x_mux[] = {
-	RX1_X_MARK, TX1_X_MARK,
+static const unsigned int scif1_data_b_mux[] = {
+	RX1_B_MARK, TX1_B_MARK,
 };
-static const unsigned int scif1_clk_x_pins[] = {
-	/* SCK1_X */
+static const unsigned int scif1_clk_b_pins[] = {
+	/* SCK1_B */
 	RCAR_GP_PIN(1, 10),
 };
-static const unsigned int scif1_clk_x_mux[] = {
-	SCK1_X_MARK,
+static const unsigned int scif1_clk_b_mux[] = {
+	SCK1_B_MARK,
 };
-static const unsigned int scif1_ctrl_x_pins[] = {
-	/* RTS1_N_X, CTS1_N_X */
+static const unsigned int scif1_ctrl_b_pins[] = {
+	/* RTS1_N_B, CTS1_N_B */
 	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 8),
 };
-static const unsigned int scif1_ctrl_x_mux[] = {
-	RTS1_N_X_MARK, CTS1_N_X_MARK,
+static const unsigned int scif1_ctrl_b_mux[] = {
+	RTS1_N_B_MARK, CTS1_N_B_MARK,
 };
 
 /* - SCIF3 ------------------------------------------------------------------ */
@@ -2586,12 +2584,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(hscif0_data),
 	SH_PFC_PIN_GROUP(hscif0_clk),
 	SH_PFC_PIN_GROUP(hscif0_ctrl),
-	SH_PFC_PIN_GROUP(hscif1_data),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(hscif1_clk),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(hscif1_ctrl),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(hscif1_data_x),	/* suffix might be updated */
-	SH_PFC_PIN_GROUP(hscif1_clk_x),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(hscif1_ctrl_x),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif1_data_a),
+	SH_PFC_PIN_GROUP(hscif1_clk_a),
+	SH_PFC_PIN_GROUP(hscif1_ctrl_a),
+	SH_PFC_PIN_GROUP(hscif1_data_b),
+	SH_PFC_PIN_GROUP(hscif1_clk_b),
+	SH_PFC_PIN_GROUP(hscif1_ctrl_b),
 	SH_PFC_PIN_GROUP(hscif2_data),
 	SH_PFC_PIN_GROUP(hscif2_clk),
 	SH_PFC_PIN_GROUP(hscif2_ctrl),
@@ -2685,12 +2683,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
-	SH_PFC_PIN_GROUP(scif1_data),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(scif1_clk),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(scif1_ctrl),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(scif1_data_x),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(scif1_clk_x),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(scif1_ctrl_x),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif1_data_a),
+	SH_PFC_PIN_GROUP(scif1_clk_a),
+	SH_PFC_PIN_GROUP(scif1_ctrl_a),
+	SH_PFC_PIN_GROUP(scif1_data_b),
+	SH_PFC_PIN_GROUP(scif1_clk_b),
+	SH_PFC_PIN_GROUP(scif1_ctrl_b),
 	SH_PFC_PIN_GROUP(scif3_data),		/* suffix might be updated */
 	SH_PFC_PIN_GROUP(scif3_clk),		/* suffix might be updated */
 	SH_PFC_PIN_GROUP(scif3_ctrl),		/* suffix might be updated */
@@ -2810,13 +2808,12 @@ static const char * const hscif0_groups[] = {
 };
 
 static const char * const hscif1_groups[] = {
-	/* suffix might be updated */
-	"hscif1_data",
-	"hscif1_clk",
-	"hscif1_ctrl",
-	"hscif1_data_x",
-	"hscif1_clk_x",
-	"hscif1_ctrl_x",
+	"hscif1_data_a",
+	"hscif1_clk_a",
+	"hscif1_ctrl_a",
+	"hscif1_data_b",
+	"hscif1_clk_b",
+	"hscif1_ctrl_b",
 };
 
 static const char * const hscif2_groups[] = {
@@ -2993,13 +2990,12 @@ static const char * const scif0_groups[] = {
 };
 
 static const char * const scif1_groups[] = {
-	/* suffix might be updated */
-	"scif1_data",
-	"scif1_clk",
-	"scif1_ctrl",
-	"scif1_data_x",
-	"scif1_clk_x",
-	"scif1_ctrl_x",
+	"scif1_data_a",
+	"scif1_clk_a",
+	"scif1_ctrl_a",
+	"scif1_data_b",
+	"scif1_clk_b",
+	"scif1_ctrl_b",
 };
 
 static const char * const scif3_groups[] = {
-- 
2.34.1


