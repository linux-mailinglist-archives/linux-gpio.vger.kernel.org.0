Return-Path: <linux-gpio+bounces-7253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854A090009D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 12:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B4662852D7
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 10:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A270E15D5B2;
	Fri,  7 Jun 2024 10:21:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB715D5AD
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755683; cv=none; b=u6JHzdejzaOjkHDHfEKO3YDSWO4OnW9e1nZLSktoW0Rxxt4sS68E0DHIBRnFlcA3lA63majJgn3TzxZRtYrhddbl2FSj9yrclGQn/JqH0kMdQ9sa+7LuYacFeCoNGckSe9lDVF4DakKwzarEmD0gUZkjS+vv04ufxN349g37z/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755683; c=relaxed/simple;
	bh=9TE9lSyPO3G5pcCOYxY/XXH4PkO6Gj5ARGhqLKty69E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cQWLAOYh6sQm+UvASiKvyAwbgcBROm5XdMZPTIYla+fuPc8B2jQeGlG7EbSD41IUKRWnoDBxwHaCe/3MwfnrKlP3tC62F4Eelnh2LAyiTeglcQUc6u3k5u6rLiI7sKTsFxI1MoTWrrLLv9t54AiSQG3eGj0APSWaD4i9/AjwUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4VwcVm6XX2z4xJkc
	for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2024 12:14:08 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5ffd:9c1a:d9c:cf6])
	by albert.telenet-ops.be with bizsmtp
	id YaDz2C00i45NznL06aDzJr; Fri, 07 Jun 2024 12:14:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWae-00ECgX-1s;
	Fri, 07 Jun 2024 12:13:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWbf-00200n-Ib;
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
Subject: [PATCH 5/8] pinctrl: renesas: r8a779g0: Fix IRQ suffixes
Date: Fri,  7 Jun 2024 12:13:52 +0200
Message-Id: <8ce9baf0a0f9346544a3ac801fd962c7c12fd247.1717754960.git.geert+renesas@glider.be>
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

The suffixes of the IRQ identifiers for external interrupts 0-3
are inconsistent:
  - "IRQ0" and "IRQ0_A",
  - "IRQ1" and "IRQ1_A",
  - "IRQ2" and "IRQ2_A",
  - "IRQ3" and "IRQ3_B".
The suffixes for external interrupts 4 and 5 do follow conventional
naming:
  - "IRQ4A" and IRQ4_B",
  - "IRQ5".

Fix this by adopting R-Car V4M naming:
  - Rename "IRQ[0-2]_A" to "IRQ[0-2]_B",
  - Rename "IRQ[0-3]" to "IRQ[0-3]_A".

Fixes: ad9bb2fec66262b0 ("pinctrl: renesas: Initial R8A779G0 (R-Car V4H) PFC support")
Fixes: 1b23d8a478bea9d1 ("pinctrl: renesas: r8a779g0: Add missing IRQx_A/IRQx_B")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 36 +++++++++++++-------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index e3c720ea76e32bd7..f9f650f232e6e71e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -68,10 +68,10 @@
 #define GPSR0_9		F_(MSIOF5_SYNC,		IP1SR0_7_4)
 #define GPSR0_8		F_(MSIOF5_SS1,		IP1SR0_3_0)
 #define GPSR0_7		F_(MSIOF5_SS2,		IP0SR0_31_28)
-#define GPSR0_6		F_(IRQ0,		IP0SR0_27_24)
-#define GPSR0_5		F_(IRQ1,		IP0SR0_23_20)
-#define GPSR0_4		F_(IRQ2,		IP0SR0_19_16)
-#define GPSR0_3		F_(IRQ3,		IP0SR0_15_12)
+#define GPSR0_6		F_(IRQ0_A,		IP0SR0_27_24)
+#define GPSR0_5		F_(IRQ1_A,		IP0SR0_23_20)
+#define GPSR0_4		F_(IRQ2_A,		IP0SR0_19_16)
+#define GPSR0_3		F_(IRQ3_A,		IP0SR0_15_12)
 #define GPSR0_2		F_(GP0_02,		IP0SR0_11_8)
 #define GPSR0_1		F_(GP0_01,		IP0SR0_7_4)
 #define GPSR0_0		F_(GP0_00,		IP0SR0_3_0)
@@ -278,10 +278,10 @@
 #define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC_N_B)	FM(TCLK2_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_7_4	F_(0, 0)		FM(MSIOF3_SS1)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_11_8	F_(0, 0)		FM(MSIOF3_SS2)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR0_15_12	FM(IRQ3)		FM(MSIOF3_SCK)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR0_19_16	FM(IRQ2)		FM(MSIOF3_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR0_23_20	FM(IRQ1)		FM(MSIOF3_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR0_27_24	FM(IRQ0)		FM(MSIOF3_SYNC)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_15_12	FM(IRQ3_A)		FM(MSIOF3_SCK)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_19_16	FM(IRQ2_A)		FM(MSIOF3_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_23_20	FM(IRQ1_A)		FM(MSIOF3_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_27_24	FM(IRQ0_A)		FM(MSIOF3_SYNC)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_31_28	FM(MSIOF5_SS2)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR0 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -290,7 +290,7 @@
 #define IP1SR0_11_8	FM(MSIOF5_TXD)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_15_12	FM(MSIOF5_SCK)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_19_16	FM(MSIOF5_RXD)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR0_23_20	FM(MSIOF2_SS2)		FM(TCLK1)		FM(IRQ2_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_23_20	FM(MSIOF2_SS2)		FM(TCLK1)		FM(IRQ2_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_27_24	FM(MSIOF2_SS1)		FM(HTX1_A)		FM(TX1_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_31_28	FM(MSIOF2_SYNC)		FM(HRX1_A)		FM(RX1_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
@@ -325,8 +325,8 @@
 #define IP2SR1_7_4	FM(SCIF_CLK)		FM(IRQ4_A)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_11_8	FM(SSI_SCK)		FM(TCLK3)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_15_12	FM(SSI_WS)		FM(TCLK4)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR1_19_16	FM(SSI_SD)		FM(IRQ0_A)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR1_23_20	FM(AUDIO_CLKOUT)	FM(IRQ1_A)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR1_19_16	FM(SSI_SD)		FM(IRQ0_B)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR1_23_20	FM(AUDIO_CLKOUT)	FM(IRQ1_B)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_27_24	FM(AUDIO_CLKIN)		FM(PWM3_A)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_31_28	F_(0, 0)		FM(TCLK2)		FM(MSIOF4_SS1)		FM(IRQ3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
@@ -724,16 +724,16 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP0SR0_11_8,	MSIOF3_SS2),
 
-	PINMUX_IPSR_GPSR(IP0SR0_15_12,	IRQ3),
+	PINMUX_IPSR_GPSR(IP0SR0_15_12,	IRQ3_A),
 	PINMUX_IPSR_GPSR(IP0SR0_15_12,	MSIOF3_SCK),
 
-	PINMUX_IPSR_GPSR(IP0SR0_19_16,	IRQ2),
+	PINMUX_IPSR_GPSR(IP0SR0_19_16,	IRQ2_A),
 	PINMUX_IPSR_GPSR(IP0SR0_19_16,	MSIOF3_TXD),
 
-	PINMUX_IPSR_GPSR(IP0SR0_23_20,	IRQ1),
+	PINMUX_IPSR_GPSR(IP0SR0_23_20,	IRQ1_A),
 	PINMUX_IPSR_GPSR(IP0SR0_23_20,	MSIOF3_RXD),
 
-	PINMUX_IPSR_GPSR(IP0SR0_27_24,	IRQ0),
+	PINMUX_IPSR_GPSR(IP0SR0_27_24,	IRQ0_A),
 	PINMUX_IPSR_GPSR(IP0SR0_27_24,	MSIOF3_SYNC),
 
 	PINMUX_IPSR_GPSR(IP0SR0_31_28,	MSIOF5_SS2),
@@ -751,7 +751,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR0_23_20,	MSIOF2_SS2),
 	PINMUX_IPSR_GPSR(IP1SR0_23_20,	TCLK1),
-	PINMUX_IPSR_GPSR(IP1SR0_23_20,	IRQ2_A),
+	PINMUX_IPSR_GPSR(IP1SR0_23_20,	IRQ2_B),
 
 	PINMUX_IPSR_GPSR(IP1SR0_27_24,	MSIOF2_SS1),
 	PINMUX_IPSR_GPSR(IP1SR0_27_24,	HTX1_A),
@@ -851,10 +851,10 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP2SR1_15_12,	TCLK4),
 
 	PINMUX_IPSR_GPSR(IP2SR1_19_16,	SSI_SD),
-	PINMUX_IPSR_GPSR(IP2SR1_19_16,	IRQ0_A),
+	PINMUX_IPSR_GPSR(IP2SR1_19_16,	IRQ0_B),
 
 	PINMUX_IPSR_GPSR(IP2SR1_23_20,	AUDIO_CLKOUT),
-	PINMUX_IPSR_GPSR(IP2SR1_23_20,	IRQ1_A),
+	PINMUX_IPSR_GPSR(IP2SR1_23_20,	IRQ1_B),
 
 	PINMUX_IPSR_GPSR(IP2SR1_27_24,	AUDIO_CLKIN),
 	PINMUX_IPSR_GPSR(IP2SR1_27_24,	PWM3_A),
-- 
2.34.1


