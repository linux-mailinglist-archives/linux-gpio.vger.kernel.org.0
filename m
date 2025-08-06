Return-Path: <linux-gpio+bounces-24052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17448B1CCBA
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 21:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5DA18C3398
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 19:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231442BDC14;
	Wed,  6 Aug 2025 19:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gggNnIKx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9C72BD5A8;
	Wed,  6 Aug 2025 19:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510170; cv=none; b=R0ZQ2JsJJ9/4xmoqFgIChY8bYp3dt5Cd+H9QtLWQQz/6SRZqYEQBuPMNNTsXLbw5icVwa+o2OB24iQc48QUF1ZS3YC5636prnQvjwilJkzvjiXXPBZ89beW703dl5Dql2EeKAoM/s7beeEjt7LuU74OLWs22OFizEeJzYZRLSq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510170; c=relaxed/simple;
	bh=mwRvI5NcIVs7A/paUov8QRYH5K5yKqlt4OPk8LqvNKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXkenpiwjVzQGDxI+R4azTuyVlHl5JQIIpkNuvq6JEgsA+QGbus0+j8bPgFbbu3UhG4vZu4YspwMiYuFeY9PA9wX8Gh8VVGK+J+cCQg4Svdm/KLpLGAmmSP7MMroBsfbuRfdpPr2uBYJZgi1rovhQbAbfwmE3FAOdq11Wi0wj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gggNnIKx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-458b2d9dba5so2082705e9.1;
        Wed, 06 Aug 2025 12:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510167; x=1755114967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSI9A41xeCvyr0TWuLEKI69GRigmnPYBsDmDAY5+8nA=;
        b=gggNnIKx7YppYkxaEidpl5tmpTgvnvujM0hc3FhVWGFpE4kNWAogCmCJm0/6oYR5TB
         Xz3bqJDZhJHSMFyDycfRGfyAFV50UKKI5uDPiA2omGFjGYdZsCfYTvEB13YYYGpKCMMJ
         1BE6psXbVCnoxT++kKyH65nEEsJr7gDsWsOu9v6ur+yceFuG4077kJaio14l3u89LwPK
         XjfUfXyONGJ9LV7uIUthT2zLo63kOUZ8YLypLu1DIKOO2lkp9Q3HiIWaNBtLV7b2Cn3h
         /lkow5J1tbhyohp3Kv21YjnU7TSBxGRsbyxcy/eK3cGdHQZpJ5Y0eOcyMXwHnF2u7/NU
         eElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510167; x=1755114967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSI9A41xeCvyr0TWuLEKI69GRigmnPYBsDmDAY5+8nA=;
        b=BvHNfr9rYjPL8RtTYEvVlG64cpSyF5U6I/642GJGDgYEGWi+vnl6Wdzc52TzJ1yYXH
         nCl57XUIKGB4ddndM1YeVwFu/L99eOUQCFW/OysLy+ctSy/ojHGph7EBnTAIUcCPxmZ1
         kRkyBkU3uFaYT/dxeyOKQejNTIB8EVaep8v9Y/EMw1dIbpl2xSqgktF5E+NQjChidHNU
         VbQ9SuaN/XDrnQDYtq9CsBA+ANvn36fzw3fXO/0lpsl1+5/KPn+QNHLVU1voz/ZED/hu
         i4SOV0/E7GnuIoCswEFHrYSPb13kEoARuBvzOTe5Si5JG32EhsjjMrLrDw5H7tSTohFH
         lDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPWcdFCbrRhcu5rMOlHnii0k4hYNgVluMOdRpJN+kB9+NX8SbtjKJ7axPk74LQyP5DEAedgufzzq7zqPYh@vger.kernel.org, AJvYcCUmbsaJpCgMWmUgmrPd7JKeCPbWOifKL8HmXNTy1FWBwKa6s25KGwLQKCDQhl1H/M2DlETrgNwXJ8R8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ihoK5lw1XhHTywa2FuoKblSFWrdWvvf99FMS2YMe8NH+fStj
	DPYV27vMLgVc84dzfZC9lVpzuithbCK2mvL4CS2FuPLit+j2HaVjSvw5
X-Gm-Gg: ASbGncv3lCC82QNmQAWdPQQqLM+vaiunf5FYRVRNb1CzfuGA/L4ylXkJwuq52VPOsiO
	wlMJFB4tg3f8Sg+n7CwfIzzRib9ofDHzkhgJ8+T9OGMK+OmfudvJgi2E1cTIr0wo9p4aPt8GEEQ
	5kdRuETg2MypCX5Y0lTsb5nqksGE015nCKQLfGCqIqwbSHKw36z4Yp/y3qtZk4p9Dh3Y9AJrGlk
	BnUPmLZDgbiE7Nx2VIn127znu1qGJAxJ7o5Toe0scrJn4OeAk9eTKfejDSqk1mRLJflEPUnyHg8
	SKebSn2m7tO54vgSa1WW5gl/wXf2EEMOY4pzOWySRJx27ziSkiVV/yxfsyElCO+cIz+k67paYU9
	J+1ZzHs/kFAxrhYa/qWI+RmkJOCFv5FcLMEFB50HoctJvJfpngDM1hgxRtL+5PB6YfqVMvkyidF
	Z5E1z5pWs5
X-Google-Smtp-Source: AGHT+IEIfx3VNkFYtBpgpX3sCdU7n5wNtLk6bNrV1KuRFFBLH6fLxnkHu1Wax2iauMMij7CakQEuEQ==
X-Received: by 2002:a05:600c:3b8c:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-459edd9bcd4mr7289935e9.24.1754510167031;
        Wed, 06 Aug 2025 12:56:07 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf93dsm24137782f8f.27.2025.08.06.12.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 12:56:06 -0700 (PDT)
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
Subject: [PATCH v3 5/7] pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}
Date: Wed,  6 Aug 2025 20:55:53 +0100
Message-ID: <20250806195555.1372317-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Unify the OEN handling on RZ/V2H(P) and RZ/V2N SoCs by reusing the existing
rzg2l_read_oen and rzg2l_write_oen functions from RZ/G2L. Add a
pin_to_oen_bit callback in rzg2l_pinctrl_data to look up per-pin OEN bit
positions, and introduce an oen_pwpr_lock flag in the hwcfg to manage PWPR
locking on SoCs that require it (RZ/V2H(P) family). Remove the hardcoded
PFC_OEN define and obsolete per-SoC OEN helpers.

Also drop redundant checks for the OEN offset in the suspend/resume paths,
as all supported SoCs now provide a valid offset through the `regs.oen`
field.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- Grouped oen_pwpr_lock flag with other bools
- Dropped redundant checks for OEN offset in suspend/resume paths
- Updated the commit message to reflect the changes
- Added Reviewed-by tag from Geert.

v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 68 ++++++++-----------------
 1 file changed, 22 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 491cf5582b6c..d5eea8ae4cdc 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -146,7 +146,6 @@
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
-#define PFC_OEN			(0x3C40) /* known on RZ/V2H(P) only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -255,6 +254,7 @@ enum rzg2l_iolh_index {
  * @iolh_groupb_oi: IOLH group B output impedance specific values
  * @tint_start_index: the start index for the TINT interrupts
  * @drive_strength_ua: drive strength in uA is supported (otherwise mA is supported)
+ * @oen_pwpr_lock: flag indicating if the OEN register is locked by PWPR
  * @func_base: base number for port function (see register PFC)
  * @oen_max_pin: the maximum pin number supporting output enable
  * @oen_max_port: the maximum port number supporting output enable
@@ -267,6 +267,7 @@ struct rzg2l_hwcfg {
 	u16 iolh_groupb_oi[4];
 	u16 tint_start_index;
 	bool drive_strength_ua;
+	bool oen_pwpr_lock;
 	u8 func_base;
 	u8 oen_max_pin;
 	u8 oen_max_port;
@@ -1083,10 +1084,11 @@ static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 
 static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen)
 {
+	const struct rzg2l_register_offsets *regs = &pctrl->data->hwcfg->regs;
 	u16 oen_offset = pctrl->data->hwcfg->regs.oen;
 	unsigned long flags;
+	u8 val, pwpr;
 	int bit;
-	u8 val;
 
 	if (!pctrl->data->pin_to_oen_bit)
 		return -EINVAL;
@@ -1101,7 +1103,13 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 		val &= ~BIT(bit);
 	else
 		val |= BIT(bit);
+	if (pctrl->data->hwcfg->oen_pwpr_lock) {
+		pwpr = readb(pctrl->base + regs->pwpr);
+		writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
+	}
 	writeb(val, pctrl->base + oen_offset);
+	if (pctrl->data->hwcfg->oen_pwpr_lock)
+		writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
 	spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
@@ -1192,7 +1200,7 @@ static int rzv2h_bias_param_to_hw(enum pin_config_param param)
 	return -EINVAL;
 }
 
-static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+static int rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	static const char * const pin_names[] = { "ET0_TXC_TXCLK", "ET1_TXC_TXCLK",
 						  "XSPI0_RESET0N", "XSPI0_CS0N",
@@ -1206,41 +1214,7 @@ static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 	}
 
 	/* Should not happen. */
-	return 0;
-}
-
-static u32 rzv2h_oen_read(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
-{
-	u8 bit;
-
-	bit = rzv2h_pin_to_oen_bit(pctrl, _pin);
-
-	return !(readb(pctrl->base + PFC_OEN) & BIT(bit));
-}
-
-static int rzv2h_oen_write(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen)
-{
-	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
-	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
-	unsigned long flags;
-	u8 val, bit;
-	u8 pwpr;
-
-	bit = rzv2h_pin_to_oen_bit(pctrl, _pin);
-	spin_lock_irqsave(&pctrl->lock, flags);
-	val = readb(pctrl->base + PFC_OEN);
-	if (oen)
-		val &= ~BIT(bit);
-	else
-		val |= BIT(bit);
-
-	pwpr = readb(pctrl->base + regs->pwpr);
-	writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
-	writeb(val, pctrl->base + PFC_OEN);
-	writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
-	spin_unlock_irqrestore(&pctrl->lock, flags);
-
-	return 0;
+	return -EINVAL;
 }
 
 static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
@@ -3140,8 +3114,7 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 	}
 
 	cache->qspi = readb(pctrl->base + QSPI);
-	if (pctrl->data->hwcfg->regs.oen)
-		cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
+	cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
 
 	if (!atomic_read(&pctrl->wakeup_path))
 		clk_disable_unprepare(pctrl->clk);
@@ -3166,8 +3139,7 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	}
 
 	writeb(cache->qspi, pctrl->base + QSPI);
-	if (pctrl->data->hwcfg->regs.oen)
-		writeb(cache->oen, pctrl->base + pctrl->data->hwcfg->regs.oen);
+	writeb(cache->oen, pctrl->base + pctrl->data->hwcfg->regs.oen);
 	for (u8 i = 0; i < 2; i++) {
 		if (regs->sd_ch)
 			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
@@ -3267,8 +3239,10 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 static const struct rzg2l_hwcfg rzv2h_hwcfg = {
 	.regs = {
 		.pwpr = 0x3c04,
+		.oen = 0x3c40,
 	},
 	.tint_start_index = 17,
+	.oen_pwpr_lock = true,
 };
 
 static struct rzg2l_pinctrl_data r9a07g043_data = {
@@ -3365,8 +3339,9 @@ static struct rzg2l_pinctrl_data r9a09g056_data = {
 #endif
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
-	.oen_read = &rzv2h_oen_read,
-	.oen_write = &rzv2h_oen_write,
+	.pin_to_oen_bit = &rzv2h_pin_to_oen_bit,
+	.oen_read = &rzg2l_read_oen,
+	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
@@ -3389,8 +3364,9 @@ static struct rzg2l_pinctrl_data r9a09g057_data = {
 #endif
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
-	.oen_read = &rzv2h_oen_read,
-	.oen_write = &rzv2h_oen_write,
+	.pin_to_oen_bit = &rzv2h_pin_to_oen_bit,
+	.oen_read = &rzg2l_read_oen,
+	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
-- 
2.50.1


