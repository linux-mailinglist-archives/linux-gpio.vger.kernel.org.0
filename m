Return-Path: <linux-gpio+bounces-9217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCDA960BA5
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 15:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 060DE1F2310F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 13:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D421BD4E3;
	Tue, 27 Aug 2024 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkKV1NU5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0D1BAED5;
	Tue, 27 Aug 2024 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764659; cv=none; b=Jr4I2FGI9lUQnISSgjpCxGyqQYtdA/t6Tb7cQcHSuq58lczenH9spJ5bGV/6vA2ctwBmyvnuuSqtLrhoGxRGD7rT8g/QR0OBOxLB8kx2e1YXW61+5C/6Kn8XgWLpuYPbhGPQv/d3mWUxYCARbIYaao0hxGBfYBiLKTzBfizX1JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764659; c=relaxed/simple;
	bh=2K1wyuwSMT74XHFr6HRxXNm8GaWrKNQ1ZfaMNxpq0vE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RFddszzYPFJbDLutugrpsaaSjXD9HiV/wCDcHMBQxU8pl1DdFDHSDOOq1U1zIcaNhYP958dlUKs8JN3M2g2m40JVC1yiuqMKI7+ihr260QjcLdLop87z4UcuKQWMi1F7QVdnnQtbElvSjTGJWzjXhmykOMgD289gQbnHBfa5u8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkKV1NU5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86859e2fc0so681663866b.3;
        Tue, 27 Aug 2024 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724764656; x=1725369456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNpIzehoVO3kCqRaF0rdpphSGUx3m4wwSMFc01GjmaQ=;
        b=EkKV1NU5kxF7Zdls2p4AxnzICAF3XZMTGWfZRoxQlS/IXQdt/IXijmjSfOXJfRohrq
         g99sdzxWrPkjB97vbMHq/2qb6WZWdoi1LGsQkXNsma4JmgOSka/K2u4U80HKHxdrOxKP
         Bzjq4TueH1OiraA8M9ZM264GQppLyBaPZy+Dob5F70VvHkbsQzYpBLVZzubQXEFwrTYw
         Ou8lV6BUKN13C9FIBy9adBnwBWz/sWgEG2Viydhrg+CglfZYTb7zPOUgpNz51QHYx0Sl
         9bnpYK4mk+7K3IVrZ+L7H4OdONV9ojFYJjQWx49haI6Wussy/ititlN9Gbm7Q/kBzlnn
         J3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764656; x=1725369456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNpIzehoVO3kCqRaF0rdpphSGUx3m4wwSMFc01GjmaQ=;
        b=jD9/H0nFmIPsENinnoQPwiOnLlQ9WCKXauz1QqDwdx+kvJNv3CzP8cv2vtnFHDuL9H
         eVkQsAHPhOFiBO3nuUmRGX9tuYLZ0Drvdx92XzlSMwnpxH+bUgdfHIwQBuXnyCWUsOVY
         FzySkAr+3ioifoTSAgHetN30tCjNPINiqk13Qq95WTDA0ycZDCiOirzP6al7kM3Z2gBq
         JYJC8qcE5FSKVRgMALtmbiNnGlda5DL8wi1mo8e2OA+8jO6MfJolslq21eJXFW8XkgJh
         xX/+80ZKPPLHJys6jo/hIu53smPV7fpDpVO7UdkIqGxVbG31auDEiHkddGutYrtmSlsL
         rKdg==
X-Forwarded-Encrypted: i=1; AJvYcCUnW8JaV5IlrEp9QAhIM7tu36DbOLLn2mgDoMp0X2xJazHsLrEIQcpH1P+AUOWHaA6yRUpbbadKvgDW@vger.kernel.org, AJvYcCVhy3Acr+Jhkpg1ydDUKly2tY1I+6pJ+B+wB+n/iRJsp0QpWijnd+HB9DKsLjkGtjJAI/O3gPPaI+sbMbTW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4BrTQV7sbOQ9jgsomVy6oW3I1B2qcyVFYwRCy+ctB/dy978tI
	i8BO0fkiZ04FGUEvmWd4z7/Du/HiGfQnhZ/jdLqGd9Aa8Xhg8GIF
X-Google-Smtp-Source: AGHT+IFBEjILk5nKKq2fakRakoyY8JwFpWwv0fktWG31eWLjsB9k5qcFAuATcrbRXTkr4Q0mH0h9Cg==
X-Received: by 2002:a17:907:97ca:b0:a86:8a89:3d6c with SMTP id a640c23a62f3a-a86e3d41848mr209391866b.66.1724764655913;
        Tue, 27 Aug 2024 06:17:35 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5ac5:89a0:20cd:42bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878597sm110338466b.175.2024.08.27.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 06:17:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] pinctrl: renesas: rzg2l: Introduce single macro for digital noise filter configuration
Date: Tue, 27 Aug 2024 14:17:21 +0100
Message-Id: <20240827131722.89359-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827131722.89359-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240827131722.89359-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

When enabling the digital noise filter for the pins, it is necessary to
configure both the noise filter stages (via the FILNUM register) and the
sampling interval (via the FILCLKSEL register). To simplify this process,
we introduce a single macro for configuring the digital noise filter.

This patch removes the PIN_CFG_FILNUM and PIN_CFG_FILCLKSEL configuration
macros and renames PIN_CFG_FILONOFF to PIN_CFG_NF.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 52 ++++++++++---------------
 1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 2a73a8c374b3..8fc1f28d02d1 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -51,17 +51,15 @@
 #define PIN_CFG_IO_VMC_QSPI		BIT(7)
 #define PIN_CFG_IO_VMC_ETH0		BIT(8)
 #define PIN_CFG_IO_VMC_ETH1		BIT(9)
-#define PIN_CFG_FILONOFF		BIT(10)
-#define PIN_CFG_FILNUM			BIT(11)
-#define PIN_CFG_FILCLKSEL		BIT(12)
-#define PIN_CFG_IOLH_C			BIT(13)
-#define PIN_CFG_SOFT_PS			BIT(14)
-#define PIN_CFG_OEN			BIT(15)
-#define PIN_CFG_NOGPIO_INT		BIT(16)
-#define PIN_CFG_NOD			BIT(17)	/* N-ch Open Drain */
-#define PIN_CFG_SMT			BIT(18)	/* Schmitt-trigger input control */
-#define PIN_CFG_ELC			BIT(19)
-#define PIN_CFG_IOLH_RZV2H		BIT(20)
+#define PIN_CFG_NF			BIT(10)	/* Digital noise filter */
+#define PIN_CFG_IOLH_C			BIT(11)
+#define PIN_CFG_SOFT_PS			BIT(12)
+#define PIN_CFG_OEN			BIT(13)
+#define PIN_CFG_NOGPIO_INT		BIT(14)
+#define PIN_CFG_NOD			BIT(15)	/* N-ch Open Drain */
+#define PIN_CFG_SMT			BIT(16)	/* Schmitt-trigger input control */
+#define PIN_CFG_ELC			BIT(17)
+#define PIN_CFG_IOLH_RZV2H		BIT(18)
 
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
 #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
@@ -69,9 +67,7 @@
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
 					 PIN_CFG_PUPD | \
-					 PIN_CFG_FILONOFF | \
-					 PIN_CFG_FILNUM | \
-					 PIN_CFG_FILCLKSEL)
+					 PIN_CFG_NF)
 
 #define RZG2L_MPXED_PIN_FUNCS		(RZG2L_MPXED_COMMON_PIN_FUNCS(A) | \
 					 PIN_CFG_SR)
@@ -84,10 +80,7 @@
 					 PIN_CFG_SR | \
 					 PIN_CFG_SMT)
 
-#define RZG2L_MPXED_ETH_PIN_FUNCS(x)	((x) | \
-					 PIN_CFG_FILONOFF | \
-					 PIN_CFG_FILNUM | \
-					 PIN_CFG_FILCLKSEL)
+#define RZG2L_MPXED_ETH_PIN_FUNCS(x)	((x) | PIN_CFG_NF)
 
 #define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(61, 54)
 #define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(53, 46)
@@ -394,13 +387,13 @@ static const u64 r9a09g057_variable_pin_cfg[] = {
 #ifdef CONFIG_RISCV
 static const u64 r9a07g043f_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(20, 0, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+					   PIN_CFG_NF |
 					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
 	RZG2L_VARIABLE_PIN_CFG_PACK(20, 1, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+					   PIN_CFG_NF |
 					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
 	RZG2L_VARIABLE_PIN_CFG_PACK(20, 2, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+					   PIN_CFG_NF |
 					   PIN_CFG_IEN  | PIN_CFG_NOGPIO_INT),
 	RZG2L_VARIABLE_PIN_CFG_PACK(20, 3, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
 					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
@@ -431,7 +424,7 @@ static const u64 r9a07g043f_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(24, 4, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
 					   PIN_CFG_NOGPIO_INT),
 	RZG2L_VARIABLE_PIN_CFG_PACK(24, 5, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+					   PIN_CFG_NF |
 					   PIN_CFG_NOGPIO_INT),
 };
 #endif
@@ -1886,8 +1879,7 @@ static const u64 r9a07g043_gpio_configs[] = {
 #ifdef CONFIG_RISCV
 	/* Below additional port pins (P19 - P28) are exclusively available on RZ/Five SoC only */
 	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x06, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
-				    PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
-				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),			/* P19 */
+				    PIN_CFG_NF | PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),	/* P19 */
 	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x07),						/* P20 */
 	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x08, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
 				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),			/* P21 */
@@ -1895,8 +1887,7 @@ static const u64 r9a07g043_gpio_configs[] = {
 			     PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),				/* P22 */
 	RZG2L_GPIO_PORT_SPARSE_PACK_VARIABLE(0x3e, 0x0a),				/* P23 */
 	RZG2L_GPIO_PORT_PACK_VARIABLE(6, 0x0b),						/* P24 */
-	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x0c, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_FILONOFF |
-				    PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x0c, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NF |
 				    PIN_CFG_NOGPIO_INT),				/* P25 */
 	0x0,										/* P26 */
 	0x0,										/* P27 */
@@ -1974,8 +1965,7 @@ static const struct {
 	struct rzg2l_dedicated_configs rzg2l_pins[7];
 } rzg2l_dedicated_pins = {
 	.common = {
-		{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0,
-		 (PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL)) },
+		{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0, PIN_CFG_NF) },
 		{ "TMS/SWDIO", RZG2L_SINGLE_PIN_PACK(0x2, 0,
 		 (PIN_CFG_IOLH_A | PIN_CFG_SR | PIN_CFG_IEN)) },
 		{ "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 0,
@@ -2056,8 +2046,7 @@ static const struct {
 };
 
 static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
-	{ "NMI", RZG2L_SINGLE_PIN_PACK(0x0, 0, (PIN_CFG_FILONOFF | PIN_CFG_FILNUM |
-						PIN_CFG_FILCLKSEL)) },
+	{ "NMI", RZG2L_SINGLE_PIN_PACK(0x0, 0, PIN_CFG_NF) },
 	{ "TMS/SWDIO", RZG2L_SINGLE_PIN_PACK(0x1, 0, (PIN_CFG_IOLH_A | PIN_CFG_IEN |
 						      PIN_CFG_SOFT_PS)) },
 	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x1, 1, (PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS)) },
@@ -2096,8 +2085,7 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 };
 
 static struct rzg2l_dedicated_configs rzv2h_dedicated_pins[] = {
-	{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0, (PIN_CFG_FILONOFF | PIN_CFG_FILNUM |
-						PIN_CFG_FILCLKSEL)) },
+	{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0, PIN_CFG_NF) },
 	{ "TMS_SWDIO", RZG2L_SINGLE_PIN_PACK(0x3, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
 						      PIN_CFG_IEN)) },
 	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
-- 
2.34.1


