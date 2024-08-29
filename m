Return-Path: <linux-gpio+bounces-9409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D158965049
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 21:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F20D01F246B6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 19:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20901BF336;
	Thu, 29 Aug 2024 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIoorCpa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE961BA28E;
	Thu, 29 Aug 2024 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960986; cv=none; b=sa9eQdTvqOpiqbXXpumSj1ry9ifhT9r4vZBEC6quBFbtgesezG2L6k/VsqTthe7T/xexptp5WfSzUxk5Vnp4Aq5Mudni0xcwYlRvU01TKoqdf/K/wsYOxmXprpAtLzGwBxl8a0oNnWOTSLbi3SymUQy2fm6z6lqjapbV2ShqYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960986; c=relaxed/simple;
	bh=od7CYXkcYMStnLZsiJYEIcQQ0o1+R6HjL1pNS7/vipE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ktorU03+B+O0raq7eYKa/bctOE1cQStrm/WjDIgW4YM/bpNEauUD4+wYWj+NAeU8SsGXhV4QpkFWSCQmW4vXQ5jhpOCwz5K1+VAbPua1se4J6/7rNabe3WWw2coCkoMV7nOt7IxaXkV9pseLDdiNxdU7HeK92DdbDne8ecEkRDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIoorCpa; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c09fd20eddso1250425a12.3;
        Thu, 29 Aug 2024 12:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724960983; x=1725565783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UGBoRFOBqrRTk+B+FWdhTGlgg2q2ipMJYTRDgaMda0=;
        b=TIoorCpaaboU3OHc10Fr+MyxNiT+LxJd2AEJsd9uzoEgPWS99u80lls5OXjAYhqMg2
         23iRGGOunTSePhkSgQ1ussSMseUIUkXC+kQWJx3OpXXfD/nWuGNLiYSIuX60+8C0yei7
         P7NdwPqm/P3FoShZqkZxE2ac/v2LVsYX4Wrx8klugtVpZQnmMM12smVR/mB0nB7DWLc8
         X0jRvmVkhSbLvx0NMxrVqKaWy2p8lSAzzvJ3/skee1LCZ3RWvg1rFl/pjCqJifekaUYb
         N/mOOkImRHK24EogRVYDWyfkrJJyq55XqLSpI1MkxlQF1dYwsHdZlSUP8Kh59vhA/du7
         cpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960983; x=1725565783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UGBoRFOBqrRTk+B+FWdhTGlgg2q2ipMJYTRDgaMda0=;
        b=Rv+efgVp53OOYr4QDrtZksC5EQPeo0RylPl+QN+dYG1+29J1A6V5X5rqKKjeKZOUY+
         l2KNn+aFI28wr+ek2yUY5usN6l54fJvSDi00MqRsoBxcvcChAljIhlXS7o9+9rCHqZ84
         jrYxNHGuLXHdBiH3TfRaSs9vB+PGoVRlHMgFBIxW/wLZ/bCGl49KR3BXxnQLb/SZ9kt4
         5pceYT7lIlQQ5vbiziiYZtKzEnPbMJQpD6jWhYB8xyteF9KM9d08baVoF8MR9DqM1yyb
         OYPKcq8ePDA+CHM2HGYTTyMlyH2OtfTG0FVizP8vEjplhOOftYz0p3FrmBFfgR98sSKF
         aKJw==
X-Forwarded-Encrypted: i=1; AJvYcCVzVAP+S92pErYF1EnV4txLvzFSwxLgqnHQryaC01O7h3efn6daBTMQFPVHwf24ON7betqU2kGcpo+V@vger.kernel.org, AJvYcCW/37Nt0zvVuTnib4uRbJzRFcdhZRD0MiBOGQeHajS1iTyqzLcnPhSAFYSzpECgqKyYhEGJB29kb4hscaB5@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdvgZmPM+aCZLUDnLx5wZQEDWFx2ePYqh/obvTEfb/B+n1ND0
	rHdVT5Eza0e7u45CXcn83mJtvPawt3admVDJzTkGkKElJo7JRhSO
X-Google-Smtp-Source: AGHT+IGy8uaql+xot4f0kP9LDiYroHLu1dlYF/yObB4yb6IrWJg2KxqaSUdu3p6XpPJ/p+2eQsUjKw==
X-Received: by 2002:a05:6402:234f:b0:5a1:1b3f:fbf5 with SMTP id 4fb4d7f45d1cf-5c21ed3e07cmr3513807a12.12.1724960982537;
        Thu, 29 Aug 2024 12:49:42 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a26f:c074:4086:5001])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a327sm1027891a12.4.2024.08.29.12.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:49:41 -0700 (PDT)
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
Subject: [PATCH v2 1/2] pinctrl: renesas: rzg2l: Introduce single macro for digital noise filter configuration
Date: Thu, 29 Aug 2024 20:48:39 +0100
Message-Id: <20240829194841.84398-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829194841.84398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240829194841.84398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Support for enabling the digital noise filter, and support for
configuring the noise filter stages (via the FILNUM register) and the
sampling interval (via the FILCLKSEL register) are related: a pin
supports either all or none of them. Hence simplify declaring digital
noise filter support for a pin by using a single feature flag instead of
three separate flags.

This patch removes the PIN_CFG_FILNUM and PIN_CFG_FILCLKSEL configuration
macros and renames PIN_CFG_FILONOFF to PIN_CFG_NF.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Updated commit description
- Collated RB tag
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


