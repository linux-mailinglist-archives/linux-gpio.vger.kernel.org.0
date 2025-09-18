Return-Path: <linux-gpio+bounces-26360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBDEB86D2A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 22:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3016D1700B1
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 20:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97852D3732;
	Thu, 18 Sep 2025 20:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xGuhFMyU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="o+h8em9G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E6915442C;
	Thu, 18 Sep 2025 20:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225869; cv=none; b=r1fk8S7+LssDz1+wYiND9njEZeD9VtIkZ2t3Qx1SkTyowUdjt7nAvpbggejL5fMoibuQEYksN50Q2wOb7v5TwZtqKFIoXRWB65O7aQxwglSPY+YObUMYT/5RqIoQUzBGraj8kDAiskVxAvfsKzsGQLrX8UObdwz5UcUY+vEpzLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225869; c=relaxed/simple;
	bh=Yu1kVblOhzrZaA/bDtaNQDDJ0HkzGWZCNasYADct8BA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S93p0bksIqejBBMpefUqnt7v8GeXt4JRVbthoYR8NPeVYEIrBTVWUe/yEUv7fJHUaHVY5cLODyc+iJhPU5NvZUmMOb7h9qxy71RqPeOVI3iE35qOV639AddRuWgOqPWi0xq0xuy7qLzG2tQLWj+DtvkmL4MbLLW28MWNddLq9og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xGuhFMyU; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=o+h8em9G; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cSRRr5JRnz9tWh;
	Thu, 18 Sep 2025 22:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758225864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y28U9S4jJDU13KdNuHHxZmbfqDNcJux2i4WnwgZv9xQ=;
	b=xGuhFMyU/Rn4iCIfQHs3rtDxSacy8cp9KQFDJv5bAnCEgqzUZ47PK4NeeEyoGL49vwChmD
	IUOStpXX7Zh22jjjHSdkCTbYJ8WDmhDIy2JX+/JYZl3M8vKhFKuvtrUXDVx93O+PmIEbPQ
	Ob7cVcCsxfk2DMR7IAMgTRvgldZjW/oqDiaZha8wN4HJpBaP7YbxNjOaeIwkiOKCmasbCU
	3g5X9LuftQVdeGcO4z/kwS6IWNk0fUbmOvjfdQFKlA9JUYP2hG7zftxTr0XiY9xjQzbfZq
	MIYjn+LCKGZCIHoS1lNQ4qxh7uUtF4Kf+mUP+lk4+fsImucDPXl1TsZ2xwQ/rg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=o+h8em9G;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758225862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y28U9S4jJDU13KdNuHHxZmbfqDNcJux2i4WnwgZv9xQ=;
	b=o+h8em9GK3WxrcFR7n8oWMnpKn+MLVBjdKh7aX+Qu9oRvnyWkPw8CAruURgxmiCf69oE2n
	tYOIeK5hgNKqzn4g93ReUjf8GlB4jtuibayzGqtkpuHnwZEifg1hgXxBIOy5KnYJUZqFof
	Bd214lSCQ7rZOji7K176UnLwPJ9lQuHm56yeeh+MXTUbXQ36kISE1FXspp81LMMljFoKbt
	Y3a029l2PipaBS0XnvliJmnHlXaMkWwW7iSxn5oVYnVIFmOqOsy/PkiLNW5hQhskvF8c1/
	EHvnp46vFMDruJf9qlFmO8W2AE4qDSWHN+xa6yeQqiQ0/1PizW9d1GoZwW1ijQ==
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] pinctrl: renesas: Drop duplicate newlines
Date: Thu, 18 Sep 2025 22:04:01 +0200
Message-ID: <20250918200409.37284-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 169424a3be9c4f182c8
X-MBO-RS-META: 8cinqtj764efegyiyz4sy3jat7y47ao4
X-Rspamd-Queue-Id: 4cSRRr5JRnz9tWh

Remove duplicate newlines. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/pinctrl/renesas/pfc-emev2.c    | 1 -
 drivers/pinctrl/renesas/pfc-r8a73a4.c  | 2 --
 drivers/pinctrl/renesas/pfc-r8a7778.c  | 1 -
 drivers/pinctrl/renesas/pfc-r8a77951.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 1 -
 drivers/pinctrl/renesas/pfc-r8a77965.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a77970.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a77980.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a77995.c | 2 --
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7723.c   | 1 -
 drivers/pinctrl/renesas/pfc-sh7724.c   | 1 -
 drivers/pinctrl/renesas/pfc-sh7734.c   | 1 -
 drivers/pinctrl/renesas/pinctrl-rza1.c | 1 -
 15 files changed, 17 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-emev2.c b/drivers/pinctrl/renesas/pfc-emev2.c
index 86d18b03668ea..eee23ac870766 100644
--- a/drivers/pinctrl/renesas/pfc-emev2.c
+++ b/drivers/pinctrl/renesas/pfc-emev2.c
@@ -666,7 +666,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_NOFN(UART_1_0_PORT158, UART2_TX, SEL_UART_1_0_01),
 };
 
-
 #define EMEV_MUX_PIN(name, pin, mark) \
 	static const unsigned int name##_pins[] = { pin }; \
 	static const unsigned int name##_mux[] = { mark##_MARK }
diff --git a/drivers/pinctrl/renesas/pfc-r8a73a4.c b/drivers/pinctrl/renesas/pfc-r8a73a4.c
index be0a4914eab33..1b00765192f52 100644
--- a/drivers/pinctrl/renesas/pfc-r8a73a4.c
+++ b/drivers/pinctrl/renesas/pfc-r8a73a4.c
@@ -85,7 +85,6 @@
 	/* Port320 - Port329 */						\
 	PORT_10(320, fn, pfx##32, sfx)
 
-
 enum {
 	PINMUX_RESERVED = 0,
 
@@ -227,7 +226,6 @@ enum {
 
 	PINMUX_MARK_BEGIN,
 
-
 #define F1(a)	a##_MARK
 #define F2(a)	a##_MARK
 #define F3(a)	a##_MARK
diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
index db92d6d91d8ee..4611e864ba69d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7778.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
@@ -1994,7 +1994,6 @@ static const char * const scif5_groups[] = {
 	"scif5_data_b",
 };
 
-
 static const char * const sdhi0_groups[] = {
 	"sdhi0_cd",
 	"sdhi0_ctrl",
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index a1d74f61fd8cc..4b04cb9134b65 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -249,7 +249,6 @@
 #define GPSR7_1		FM(AVS2)
 #define GPSR7_0		FM(AVS1)
 
-
 /* IPSRx */		/* 0 */			/* 1 */		/* 2 */			/* 3 */				/* 4 */		/* 5 */		/* 6 */			/* 7 */		/* 8 */			/* 9 */		/* A */		/* B */		/* C - F */
 #define IP0_3_0		FM(AVB_MDC)		F_(0, 0)	FM(MSIOF2_SS2_C)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_7_4		FM(AVB_MAGIC)		F_(0, 0)	FM(MSIOF2_SS1_C)	FM(SCK4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 807834f319f07..aead3b1173c96 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -254,7 +254,6 @@
 #define GPSR7_1		FM(AVS2)
 #define GPSR7_0		FM(AVS1)
 
-
 /* IPSRx */		/* 0 */			/* 1 */		/* 2 */			/* 3 */				/* 4 */		/* 5 */		/* 6 */			/* 7 */		/* 8 */			/* 9 */		/* A */		/* B */		/* C - F */
 #define IP0_3_0		FM(AVB_MDC)		F_(0, 0)	FM(MSIOF2_SS2_C)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_7_4		FM(AVB_MAGIC)		F_(0, 0)	FM(MSIOF2_SS1_C)	FM(SCK4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index e7c88a5d983f4..22640cfe9e329 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -254,7 +254,6 @@
 #define GPSR7_1		FM(AVS2)
 #define GPSR7_0		FM(AVS1)
 
-
 /* IPSRx */		/* 0 */			/* 1 */		/* 2 */			/* 3 */				/* 4 */		/* 5 */		/* 6 */			/* 7 */		/* 8 */			/* 9 */		/* A */		/* B */		/* C - F */
 #define IP0_3_0		FM(AVB_MDC)		F_(0, 0)	FM(MSIOF2_SS2_C)	F_(0, 0)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_7_4		FM(AVB_MAGIC)		F_(0, 0)	FM(MSIOF2_SS1_C)	FM(SCK4_A)			F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index e1b3e3b38ec3b..972b14ab2359a 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -159,7 +159,6 @@
 #define GPSR5_1		FM(QSPI0_MOSI_IO0)
 #define GPSR5_0		FM(QSPI0_SPCLK)
 
-
 /* IPSRx */		/* 0 */				/* 1 */			/* 2 */		/* 3 */		/* 4 */			/* 5 */		/* 6 - F */
 #define IP0_3_0		FM(DU_DR2)			FM(HSCK0)		F_(0, 0)	FM(A0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_7_4		FM(DU_DR3)			FM(HRTS0_N)		F_(0, 0)	FM(A1)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index 877134d78c7e5..53b44b24bfc67 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -193,7 +193,6 @@
 #define GPSR5_1		FM(QSPI0_MOSI_IO0)
 #define GPSR5_0		FM(QSPI0_SPCLK)
 
-
 /* IPSRx */		/* 0 */				/* 1 */			/* 2 */			/* 3 */		/* 4 */		/* 5 */		/* 6 - F */
 #define IP0_3_0		FM(DU_DR2)			FM(SCK4)		FM(GETHER_RMII_CRS_DV)	FM(A0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0_7_4		FM(DU_DR3)			FM(RX4)			FM(GETHER_RMII_RX_ER)	FM(A1)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index 298e7a07e4934..b35c62f9a0618 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -427,7 +427,6 @@ FM(IP12_31_28)	IP12_31_28 \
 #define MOD_SEL1_27		FM(SEL_SCIF0_0)		FM(SEL_SCIF0_1)
 #define MOD_SEL1_26		FM(SEL_SSIF4_0)		FM(SEL_SSIF4_1)
 
-
 #define PINMUX_MOD_SELS	\
 \
 		MOD_SEL1_31 \
@@ -2869,7 +2868,6 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ }
 };
 
-
 static int r8a77995_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	switch (pin) {
diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
index 16e722a4d18fa..46ca28fb2d513 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779f0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -652,7 +652,6 @@ static const unsigned int i2c5_mux[] = {
 	SDA5_MARK, SCL5_MARK,
 };
 
-
 /* - INTC-EX ---------------------------------------------------------------- */
 static const unsigned int intc_ex_irq0_pins[] = {
 	/* IRQ0 */
diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index 48b1eef250d95..63b3725a0cf6f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -259,7 +259,6 @@
 #define GPSR7_1		F_(AVB0_AVTP_CAPTURE,	IP0SR7_7_4)
 #define GPSR7_0		F_(AVB0_AVTP_PPS,	IP0SR7_3_0)
 
-
 /* SR0 */
 /* IP0SR0 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC_N_B)	FM(TCLK2_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
diff --git a/drivers/pinctrl/renesas/pfc-sh7723.c b/drivers/pinctrl/renesas/pfc-sh7723.c
index c1abdec9bf1d6..bdf555e63c2e3 100644
--- a/drivers/pinctrl/renesas/pfc-sh7723.c
+++ b/drivers/pinctrl/renesas/pfc-sh7723.c
@@ -182,7 +182,6 @@ enum {
 	PTZ7_FN, PTZ6_FN, PTZ5_FN, PTZ4_FN,
 	PTZ3_FN, PTZ2_FN, PTZ1_FN, PTZ0_FN,
 
-
 	PSA15_PSA14_FN1, PSA15_PSA14_FN2,
 	PSA13_PSA12_FN1, PSA13_PSA12_FN2,
 	PSA11_PSA10_FN1, PSA11_PSA10_FN2,
diff --git a/drivers/pinctrl/renesas/pfc-sh7724.c b/drivers/pinctrl/renesas/pfc-sh7724.c
index 5148a3460cc6f..4e8c1fae7be65 100644
--- a/drivers/pinctrl/renesas/pfc-sh7724.c
+++ b/drivers/pinctrl/renesas/pfc-sh7724.c
@@ -210,7 +210,6 @@ enum {
 	PTZ7_FN, PTZ6_FN, PTZ5_FN, PTZ4_FN,
 	PTZ3_FN, PTZ2_FN, PTZ1_FN, PTZ0_FN,
 
-
 	PSA15_0, PSA15_1,
 	PSA14_0, PSA14_1,
 	PSA13_0, PSA13_1,
diff --git a/drivers/pinctrl/renesas/pfc-sh7734.c b/drivers/pinctrl/renesas/pfc-sh7734.c
index a0a5d8b94086f..df2de853df932 100644
--- a/drivers/pinctrl/renesas/pfc-sh7734.c
+++ b/drivers/pinctrl/renesas/pfc-sh7734.c
@@ -664,7 +664,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP0_31_30, LCD_DATA15_A, SEL_LCDC_0),
 	PINMUX_IPSR_MSEL(IP0_31_30, TIOC3D_C, SEL_MTU2_CH3_1),
 
-
 	/* IPSR1 */
 	PINMUX_IPSR_GPSR(IP1_1_0, A16),
 	PINMUX_IPSR_GPSR(IP1_1_0, ST0_PWM),
diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index f24e5915cbe4b..4c7326e3de07c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -526,7 +526,6 @@ static inline int rza1_pinmux_get_swio(unsigned int port,
 	const struct rza1_swio_pin *swio_pin;
 	unsigned int i;
 
-
 	for (i = 0; i < table->npins; ++i) {
 		swio_pin = &table->pins[i];
 		if (swio_pin->port == port && swio_pin->pin == pin &&
-- 
2.51.0


