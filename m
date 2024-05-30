Return-Path: <linux-gpio+bounces-6972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D32A38D514B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A5961F21039
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3A747A7A;
	Thu, 30 May 2024 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5OqNwbb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C7B5337F;
	Thu, 30 May 2024 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090937; cv=none; b=r8IQNdW/axizgedtOHrylKreDNiI6lpHEYvX/hh/Hv9ailFVep2P7NNATj6z0GlH5CLhpD5eO6rcn/++KCGnHKdGPN8pYpzdXLsTfRQPAzB/bzDwz4Xux2aTTa2RcQDdeiqBMesbv8TYsjJKFgbt2w8G1A2+kzV/NCKcm9J2LCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090937; c=relaxed/simple;
	bh=dmafKK4V9Jo7/DvjYcB10vSmxUrMpkYqS/Py8kzLLik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rfbL8n/f4huX2Lx9Hvtqm0YhCR/Kfjfxdn8M8l9G24DW346l41iVyzVzxpFk86YpXNJqWX1gszcB3V07HBEiKyM5ZAP96DlXwIR+9Nh4XblK9Z4v6C2iFmE6CxKL7wxKa3D+df8wF+BR+cjo6uIG2SZNXC80u/jw3KJfaP+BUIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5OqNwbb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f62a628b4cso3554525ad.1;
        Thu, 30 May 2024 10:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090935; x=1717695735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tfy++x52mBdsaKltNEVDx4b9YJF7xx5k90A9ioo+R8=;
        b=O5OqNwbbc2xrtN6EbEwvv6C1mOxw1sznOwbZv2RucDuSVoVJbQDMKQHVOaA7t1oLMd
         4iP2axHRdQn2D8SeBLO9HEXpjQFiv3KxxJ0RbcqKLG5mN3srkcRipHhSY8BXsnJ1zhNz
         v1lkWq6PgvHJmjHTZlKVlgWG7Lq89NWmIibQP87MCq2ir3xofjW5F9SxEAdAEOOUpd0k
         3VwIg/RjSPMUVddDwy0reHcXjFZJVwlTaMoze/AuyteW0r9vpUh2U/JwP5lhOcbjFOw/
         ajmbyB81nF6Uo8a/DWUPDcgZUAsaPB8a3SrERc3ZXGKMW8Q+hSzxi4p0svLkmZ0Uu1SQ
         SXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090935; x=1717695735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tfy++x52mBdsaKltNEVDx4b9YJF7xx5k90A9ioo+R8=;
        b=gaGVW+o/jqZ7EL9+UOMn80F5RjN7WdIDsCUuoduu9PKM1dz3l/KU+erqWdbz37pgt7
         WdgqHBPQKKGFfsHu2PhVkgydD2gdXfeMARdHjl+ja1zaqaVMQt/Ks9UFP4uHtD59S12A
         kzJ/3hLfoaW2VEPDBsN+Rp6YcHzoL8jhJs9nGsnvgLHF2aaTp1Rz29elYNIsnuD33Jsr
         IFPk64mUwSVU+BXoNjRIthKN54FZeiYbSQUGsJcanvHaOcyZyAkIHW+kMKgw8gWYJvb1
         kB6GSJPjeKy07MpIAtWETE6ZQqXFO5d7vsyAquhvGpS4Tst9lDY6CspJ7KRVFhfu68QU
         Jzkw==
X-Forwarded-Encrypted: i=1; AJvYcCVobYXWkZuqgmVQj+/wVLrszSlB7V2xenapfNONQi+T1uv+LmihS+oLl4qfdPWI3isvOg781O71lhiF9jloQW94lnIaaCAHztZg6lig8dZxQMALYLMeoA4yKLEUpcDQKhW/F0Gq1Bpi6NUo0zHQDA25fztAMvZBsRdq9FFpoupqcvxIHek=
X-Gm-Message-State: AOJu0YweyvS2x6myNI38R1IjxlHumFm0IjkdZ9ylbLAQTV3aWz2Oy4bI
	ZtXKeGbe6bxJJXMAf4R77WC3sSFMyCvgYKJacN5MMh0vBU0IT78x
X-Google-Smtp-Source: AGHT+IHK/wexEcRujfhaR44ZVhFrKgeZTaufhD1XRjLYRPwaPmnURN0Pte//dmx1z+oLgh3wxqQESA==
X-Received: by 2002:a17:903:2385:b0:1f6:18f9:b764 with SMTP id d9443c01a7336-1f619624a67mr32422005ad.30.1717090935120;
        Thu, 30 May 2024 10:42:15 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 07/15] pinctrl: renesas: pinctrl-rzg2l: Add function pointer for locking/unlocking the PFC register
Date: Thu, 30 May 2024 18:38:49 +0100
Message-Id: <20240530173857.164073-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the RZ/G2L SoC, the PFCWE bit controls writing to PFC registers.
However, on the RZ/V2H(P) SoC, the PFCWE (REGWE_A on RZ/V2H) bit controls
writing to both PFC and PMC registers. Additionally, BIT(7) B0WI is
undocumented for the PWPR register on RZ/V2H(P) SoC. To accommodate these
differences across SoC variants, introduce the pwpr_pfc_lock_unlock()
function pointer.

Note, in rzg2l_pinctrl_set_pfc_mode() the pwpr_pfc_lock_unlock(.., false)
is now called before PMC read/write and pwpr_pfc_lock_unlock(.., true) is
now called after PMC read/write this is to keep changes minimal for
RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Introduced single function pointer to (un)lock
- Updated commit message

RFC->v2
- Introduced function pointer for (un)lock
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 44 +++++++++++++++----------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 6e3b1adb95f6..a3fd14b95c5a 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -241,6 +241,8 @@ struct rzg2l_dedicated_configs {
 	u64 config;
 };
 
+struct rzg2l_pinctrl;
+
 struct rzg2l_pinctrl_data {
 	const char * const *port_pins;
 	const u64 *port_pin_configs;
@@ -251,6 +253,7 @@ struct rzg2l_pinctrl_data {
 	const struct rzg2l_hwcfg *hwcfg;
 	const u64 *variable_pin_cfg;
 	unsigned int n_variable_pin_cfg;
+	void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
 };
 
 /**
@@ -383,7 +386,6 @@ static const u64 r9a07g043f_variable_pin_cfg[] = {
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
-	const struct rzg2l_register_offsets *regs = &pctrl->data->hwcfg->regs;
 	unsigned long flags;
 	u32 reg;
 
@@ -394,27 +396,23 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 	reg &= ~(PM_MASK << (pin * 2));
 	writew(reg, pctrl->base + PM(off));
 
+	pctrl->data->pwpr_pfc_lock_unlock(pctrl, false);
+
 	/* Temporarily switch to GPIO mode with PMC register */
 	reg = readb(pctrl->base + PMC(off));
 	writeb(reg & ~BIT(pin), pctrl->base + PMC(off));
 
-	/* Set the PWPR register to allow PFC register to write */
-	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
-	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* BOWI=0, PFCWE=1 */
-
 	/* Select Pin function mode with PFC register */
 	reg = readl(pctrl->base + PFC(off));
 	reg &= ~(PFC_MASK << (pin * 4));
 	writel(reg | (func << (pin * 4)), pctrl->base + PFC(off));
 
-	/* Set the PWPR register to be write-protected */
-	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
-	writel(PWPR_BOWI, pctrl->base + regs->pwpr);	/* BOWI=1, PFCWE=0 */
-
 	/* Switch to Peripheral pin function with PMC register */
 	reg = readb(pctrl->base + PMC(off));
 	writeb(reg | BIT(pin), pctrl->base + PMC(off));
 
+	pctrl->data->pwpr_pfc_lock_unlock(pctrl, true);
+
 	spin_unlock_irqrestore(&pctrl->lock, flags);
 };
 
@@ -2439,12 +2437,8 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 {
 	u32 nports = pctrl->data->n_port_pins / RZG2L_PINS_PER_PORT;
-	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
-	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 
-	/* Set the PWPR register to allow PFC register to write. */
-	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
-	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* BOWI=0, PFCWE=1 */
+	pctrl->data->pwpr_pfc_lock_unlock(pctrl, false);
 
 	/* Restore port registers. */
 	for (u32 port = 0; port < nports; port++) {
@@ -2487,9 +2481,7 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 		}
 	}
 
-	/* Set the PWPR register to be write-protected. */
-	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
-	writel(PWPR_BOWI, pctrl->base + regs->pwpr);	/* BOWI=1, PFCWE=0 */
+	pctrl->data->pwpr_pfc_lock_unlock(pctrl, true);
 }
 
 static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
@@ -2551,6 +2543,21 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	return 0;
 }
 
+static void rzg2l_pwpr_pfc_lock_unlock(struct rzg2l_pinctrl *pctrl, bool lock)
+{
+	const struct rzg2l_register_offsets *regs = &pctrl->data->hwcfg->regs;
+
+	if (lock) {
+		/* Set the PWPR register to be write-protected */
+		writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
+		writel(PWPR_BOWI, pctrl->base + regs->pwpr);	/* BOWI=1, PFCWE=0 */
+	} else {
+		/* Set the PWPR register to allow PFC register to write */
+		writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
+		writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* BOWI=0, PFCWE=1 */
+	}
+}
+
 static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3014,
@@ -2608,6 +2615,7 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.variable_pin_cfg = r9a07g043f_variable_pin_cfg,
 	.n_variable_pin_cfg = ARRAY_SIZE(r9a07g043f_variable_pin_cfg),
 #endif
+	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 };
 
 static struct rzg2l_pinctrl_data r9a07g044_data = {
@@ -2619,6 +2627,7 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins.common) +
 		ARRAY_SIZE(rzg2l_dedicated_pins.rzg2l_pins),
 	.hwcfg = &rzg2l_hwcfg,
+	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 };
 
 static struct rzg2l_pinctrl_data r9a08g045_data = {
@@ -2629,6 +2638,7 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.n_port_pins = ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_PINS_PER_PORT,
 	.n_dedicated_pins = ARRAY_SIZE(rzg3s_dedicated_pins),
 	.hwcfg = &rzg3s_hwcfg,
+	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 };
 
 static const struct of_device_id rzg2l_pinctrl_of_table[] = {
-- 
2.34.1


