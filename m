Return-Path: <linux-gpio+bounces-14559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8C7A03D23
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 11:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 126A73A15A4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 10:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6351DFE01;
	Tue,  7 Jan 2025 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfHREEKS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CAC647;
	Tue,  7 Jan 2025 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247594; cv=none; b=brvAkVm3JwELq7L0iLHUIAfc9nR/d02YYDDY4i2uIwW8EZmgVcYm0G55lMXLOLXLsnRFJm4Hb22M0ATHpAZ4QT/fYyYzFC3kiEuGCAGsmyuz0KRixi83E/9mvrCKkB49BjGAVfRNK2+BptkngBs2G6rW/S4OirSrgkbdqdk/uQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247594; c=relaxed/simple;
	bh=t6oy69iMVGjqctnR2L0pYtVYakRDjyeBb1hZowl0zfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GdEToa7/OyCidt75EMh3eR1ffJnLdC0BIeW6f5nQOAiYr9nCpIr4lQJt03oIhqw9UtMvKyHMe/RsIBF5iCHo1qXZJvA655r7HZMs0ENOXZeY1OFahUvMfYGUVFbKdzNXrauWjklR1rnfowJHVjzOOVLpogN5uoVrKV8SV9WR/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfHREEKS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436281c8a38so109940065e9.3;
        Tue, 07 Jan 2025 02:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736247589; x=1736852389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRUXan58Pc+Wpg8faWCV9442K3E36wHgGtDGr9Uy+bs=;
        b=AfHREEKShjlu1eoCbtwbNysI85F7h+jo7Av3+0032u44jyPwXu5Fmdi3YoVuRPYybi
         T80NE8kaOG38g/haEe5Ckq5Rk4ZC45ldXjWgy/GL1h4QmYekEZ6XNBuwhUkETVQIbheA
         XaCMCT87WwSXQWNzi2P4nltHlnVqUKv+kmWxJjAChUSD/rQzOAqvo0MHoCZAeHMtjrGl
         1eZPzAVxUFVZ55GkESLC5S6TiKi0hdWu+ACWe8DjwNzagmj+6UEOvlH812YO0NLd8ht2
         7yyUTvUjOHiKHtGcuA56LIGpllsQKCrXjQYZmmYMA4iYMxW5i+j4Wg+fVL6fo5NsERfX
         MKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247589; x=1736852389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRUXan58Pc+Wpg8faWCV9442K3E36wHgGtDGr9Uy+bs=;
        b=ZemdPkWXYgWXXMT12+Mz22VCX3adQ2I9BmvWBGMbL4zo9SAc6nxOR5vthVsDIoh0yA
         ZL4OjuXAW1cAEi1KxJCux1hqmbr68ChYiJnVsd+EowgON3MjioyvNofW5BN/B3k8uukw
         Q581KdcpZwKYXkhg3/PP/dYoZBnaHetp818u6uxMpZaX72B+F7Sjk41yP8ufQFIBhBBs
         9n8MYHq2K7IAHjVFknqJ8PpzbH/RwnOKKLeQ+ygcIVXbj8ekSwlT0w6FPnqgscZVesZy
         FxdG1GrDKz85oqPwi+UP5XhiOwBWJYIjs1EKpcPK+QksGR3Pef86G/ctisKTXE2U2o2E
         foEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi09JOOCeLh74e/7EL96ktSm425Bv0MGh6BUcsn7Yz6dpuK3o1J0QZ3IB/DEZdjrlTzZYukktCGb/n@vger.kernel.org, AJvYcCWKHRmQbejLLIBsEr+NXj/JC+DotRAyxiRp7+OLjnygEBREqC+bt+Ws+ILYjrKEnguILozXgI01pwHSe3cl@vger.kernel.org
X-Gm-Message-State: AOJu0YwKa2Ci2SF21diE+KcF01yt9Qb2fkvGGb1PX47sNVRksPaElIHl
	uiSVOnhFoQPasBQxFqg1mxpaUPheL6kawtxfVT/rFIBVFCkmqaaS
X-Gm-Gg: ASbGnctm5EDQ5GDTHh9WFXxSW32j07p0N1gW6iO+3PfOqm9l5mVFHOLDC+/zXgHR6hG
	aW3xdj1Irv7jm7SjtRMP7LlDwhjj3O/oEG8/TmUn58o6ycPcDV3+QG/7NFEzKrm7qDnaCSy2sgB
	rIXGbH1zGD5EFkTAN1yD0XWqhhuxQCrojvyGKYuFB9v9l6xQ0+rm23FYZCtXmWqyzteDZKpyK0o
	HQfp+Z+Klq5nkmkRDjBChBmgmxqLGw0r1LyJWa92RW3znVyLExTzzO560m2BFpynXLbgWLKlB/o
	1ea0vieN
X-Google-Smtp-Source: AGHT+IEk1zbPQGVp6WjbP4toce8bcGAM1XoCSrISQAXDxhxUaFCnOMAgeTKb5j9qcVIcyMcAK1uOJw==
X-Received: by 2002:a05:6000:188d:b0:385:f7d2:7e9b with SMTP id ffacd0b85a97d-38a221f3785mr48427459f8f.30.1736247589229;
        Tue, 07 Jan 2025 02:59:49 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:da96:e87:47b7:8629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acadcsm49583555f8f.105.2025.01.07.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:59:48 -0800 (PST)
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
Subject: [PATCH] pinctrl: renesas: rzg2l: Use configurable PFC mask
Date: Tue,  7 Jan 2025 10:59:47 +0000
Message-ID: <20250107105947.321847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make the PFC mask for the PFC_mx register configurable to address
differences between SoCs in the RZ/G2L family and RZ/V2H.

On RZ/G2L family SoCs, the PFC_mx mask is `0x7` (3 bits), while on RZ/V2H
it is `0xf` (4 bits). The previous implementation hardcoded the PFC mask
as `0x7`, which caused incorrect behavior when configuring PFC registers
on RZ/V2H.

To resolve this, introduce a `pfcmask` field in the `rzg2l_hwcfg` structure
to make the mask value configurable based on the SoC. Update PFC-related
logic to use `hwcfg->pfcmask` instead of a hardcoded value. Additionally,
update hardware configuration definitions to include the appropriate mask
values (`0x7` for RZ/G2L family and `0xf` for RZ/V2H).

Fixes: 9bd95ac86e70 ("pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC")
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index ffcc5255724d..a36c73fd4159 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -159,7 +159,6 @@
 #define PWPR_REGWE_B		BIT(5)	/* OEN Register Write Enable, known only in RZ/V2H(P) */
 
 #define PM_MASK			0x03
-#define PFC_MASK		0x07
 #define IEN_MASK		0x01
 #define IOLH_MASK		0x03
 #define SR_MASK			0x01
@@ -261,6 +260,7 @@ enum rzg2l_iolh_index {
  * @func_base: base number for port function (see register PFC)
  * @oen_max_pin: the maximum pin number supporting output enable
  * @oen_max_port: the maximum port number supporting output enable
+ * @pfcmask: mask for the PFC_m register
  */
 struct rzg2l_hwcfg {
 	const struct rzg2l_register_offsets regs;
@@ -273,6 +273,7 @@ struct rzg2l_hwcfg {
 	u8 func_base;
 	u8 oen_max_pin;
 	u8 oen_max_port;
+	u8 pfcmask;
 };
 
 struct rzg2l_dedicated_configs {
@@ -498,6 +499,7 @@ static void rzv2h_pmc_writeb(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset)
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
+	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	unsigned long flags;
 	u32 reg;
 
@@ -505,7 +507,7 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 
 	/* Set pin to 'Non-use (Hi-Z input protection)'  */
 	reg = readw(pctrl->base + PM(off));
-	reg &= ~(PM_MASK << (pin * 2));
+	reg &= ~(hwcfg->pfcmask << (pin * 2));
 	writew(reg, pctrl->base + PM(off));
 
 	pctrl->data->pwpr_pfc_lock_unlock(pctrl, false);
@@ -516,7 +518,7 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 
 	/* Select Pin function mode with PFC register */
 	reg = readl(pctrl->base + PFC(off));
-	reg &= ~(PFC_MASK << (pin * 4));
+	reg &= ~(hwcfg->pfcmask << (pin * 4));
 	writel(reg | (func << (pin * 4)), pctrl->base + PFC(off));
 
 	/* Switch to Peripheral pin function with PMC register */
@@ -3082,6 +3084,7 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 {
 	u32 nports = pctrl->data->n_port_pins / RZG2L_PINS_PER_PORT;
+	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	unsigned long flags;
 
 	spin_lock_irqsave(&pctrl->lock, flags);
@@ -3110,7 +3113,7 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 				continue;
 
 			/* Set pin to 'Non-use (Hi-Z input protection)' */
-			pm &= ~(PM_MASK << (pin * 2));
+			pm &= ~(hwcfg->pfcmask << (pin * 2));
 			writew(pm, pctrl->base + PM(off));
 
 			/* Temporarily switch to GPIO mode with PMC register */
@@ -3118,8 +3121,8 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 			writeb(pmc, pctrl->base + PMC(off));
 
 			/* Select Pin function mode. */
-			pfc &= ~(PFC_MASK << (pin * 4));
-			pfc |= (cache->pfc[port] & (PFC_MASK << (pin * 4)));
+			pfc &= ~(hwcfg->pfcmask << (pin * 4));
+			pfc |= (cache->pfc[port] & (hwcfg->pfcmask << (pin * 4)));
 			writel(pfc, pctrl->base + PFC(off));
 
 			/* Switch to Peripheral pin function. */
@@ -3235,6 +3238,7 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.iolh_groupb_oi = { 100, 66, 50, 33, },
 	.tint_start_index = 9,
 	.oen_max_pin = 0,
+	.pfcmask = 0x7,
 };
 
 static const struct rzg2l_hwcfg rzg3s_hwcfg = {
@@ -3268,6 +3272,7 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 	.func_base = 1,
 	.oen_max_pin = 1, /* Pin 1 of P0 and P7 is the maximum OEN pin. */
 	.oen_max_port = 7, /* P7_1 is the maximum OEN port. */
+	.pfcmask = 0x7,
 };
 
 static const struct rzg2l_hwcfg rzv2h_hwcfg = {
@@ -3275,6 +3280,7 @@ static const struct rzg2l_hwcfg rzv2h_hwcfg = {
 		.pwpr = 0x3c04,
 	},
 	.tint_start_index = 17,
+	.pfcmask = 0xf,
 };
 
 static struct rzg2l_pinctrl_data r9a07g043_data = {
-- 
2.43.0


