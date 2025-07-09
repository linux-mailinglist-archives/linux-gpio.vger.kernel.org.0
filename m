Return-Path: <linux-gpio+bounces-23028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53370AFEEA8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87A641C80B2A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E317B2EA479;
	Wed,  9 Jul 2025 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvATbaWH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88612E9ECC;
	Wed,  9 Jul 2025 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077320; cv=none; b=o1U5zA2XGO1JiD4SSu7qq8himg+u0rAyPN11mEpoKPi4pDnsed973DwL0imWABl+TCdHWJpSomWnrPlk9uxMaFlByXnKExucn9fQLOa/gKRm3ujddgNKjP0kZkB3NGUzmJIAVfWs0k4Jb2/zidmOzG2Wa4wui3ITwsLSCpaQlPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077320; c=relaxed/simple;
	bh=kZsMF9PH/uKNlzfxv3oC+i484V5rR03nkK+9vzngpu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlgpqqmInD1X2Cr3I/yOFva96VmYP5qYsZpOqS+fulm/1GtLD0MxIIDVPHLLNLyhOP7LEDpuFOAmlFp1afXjYEADdLJMIejLFjX8Vo2Fh0nD2lkqtYhzw9sZdVXWgKXMELjmPlPQQ5hJOUOJ66t6gmHyzvZz69gt2uc1CaHSdhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvATbaWH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso8913265e9.0;
        Wed, 09 Jul 2025 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077317; x=1752682117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQchwjWBmsVPFG1/hlspb5mC7Dl4wCOCwe3Vgy3tmEM=;
        b=kvATbaWHie67OsWuq73tM8S39dXkugloAVXuLHumeqj1oLjft36Zlo8OuySaxKJFuK
         rMAYCZWUnE83XKLF3behX9lBIuIfBHWQDFcOSgQIL+hXqXwhAz2TeXIDKZwabIYvunTF
         vPQZSWPDPoBkycnrGPIQLunrd/X6dHXy/W7iRw69V6IiY3z2H/CC+G/hstVqMuqrBY5T
         fyn+R+wBPGiOjlOa0uYsBv5LGkYAWVj0FuYke0sB589Affz6k1v2W/FmGo5Mghk8sEck
         HLkCf3la9ogbFvhymG0S+pfQGx4oziqMvNhPwVyRnAHRMdCqOZH/SpSpN/iOb8tHCgmC
         Kp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077317; x=1752682117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQchwjWBmsVPFG1/hlspb5mC7Dl4wCOCwe3Vgy3tmEM=;
        b=YO9uQhTuPtux1pEXBB0nnLwioliqGpT6ncsVYpc6xu2Dt6a2F6LgVWTA369Pue76kn
         kVzXkyt5Zc3ZKXk7AmZPlt5bdo1HfIlmo9f3mbNvATljc4k34toX7hwgKi+dvmEsWXH4
         iDaqz4M9/4zUTo8JNcGnMIRXNC5WAMYYxdJnrKh0dgDhnax9gqW3RJewd73apBSIY9l2
         plNcnCnydYW4OnBdgAcPrBo0eAxdEnreiH+seukOE66ulsprMHIm2DJbxx1oSYTUMavt
         rQxJwqt7/jHd7Lpwjjj9Bk9kmlzvnlPzPp4RyHyCdpZnFoFhq/CPuYU+i0VqPzfEZcoG
         n8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWYWdTKXnke389P3WwUm0A2AWrkIF2Z5Sjxpkhe/ynwGTn34V5VQbIj0RDhbnaNYS1DaZJUEmTNgxE1@vger.kernel.org, AJvYcCWk4XlWvNq5YCWgrOA22VqQVy/QRoewZ5bG8miaIFe0DmVc2N2uY0WvSjVk0vlF+qPQieMME+NC9kpCU1Rl@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEyYkJms1J6TbW9ycFHClgHpuVdY/eARXmG5uHZDuEvfn+YV4
	6o5ejzPAu+JZhPLlvuyXwSLqDn5v1dZltaSLycADMpFZKc3Wz58dkB1TzFx2Zw==
X-Gm-Gg: ASbGncvF6+78ZCoGDojsmjxQi5uolQDXEBb7r6RM18o2tCaHc/mGWW6tuKmJ1UhfNmU
	IWhEo0AnoWKyBF/TgbnuLfsgINmm54zj7QxqkgZoc7aNFQul1P7aSJqiFYCijaIb8uisEzbPbZ8
	0r/yRd2XTvBIDFQ+HSHINBllZjgdoRlOnvUfFwjlcA5bJttqAxFT5RSQg7OxTkhzmdfrvLjpqr3
	ihqsZONg9rpQgDDBfJMck90IWAr/90J464uwOSOjzoIrXUxImzZPY4HeW+3HhUvtY2sWUmHGRTA
	q3QiazI+zeoSfbdO4mI6zBUl4zCbN3c/blfYyzwyojoRcI6+r4Pr4lAcL5zuE5vn6nIq0kysSd8
	UeHBSObNL6Zo=
X-Google-Smtp-Source: AGHT+IGSdDcm1ZajKQqWIe0FklxMr8IEmeu3LElppNvF1PKsdPHVfCstLjJeCRI6xfIuy2U9WFlcEA==
X-Received: by 2002:a05:600c:3b93:b0:453:835a:db with SMTP id 5b1f17b1804b1-454db88f64bmr706375e9.4.1752077316934;
        Wed, 09 Jul 2025 09:08:36 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c930:b02d:bf60:750b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9671asm16639686f8f.53.2025.07.09.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 09:08:36 -0700 (PDT)
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
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}
Date: Wed,  9 Jul 2025 17:08:17 +0100
Message-ID: <20250709160819.306875-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 62 ++++++++-----------------
 1 file changed, 20 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index cf0b92c661d9..64101423e1f3 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -146,7 +146,6 @@
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
-#define PFC_OEN			(0x3C40) /* known on RZ/V2H(P) only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -258,6 +257,7 @@ enum rzg2l_iolh_index {
  * @func_base: base number for port function (see register PFC)
  * @oen_max_pin: the maximum pin number supporting output enable
  * @oen_max_port: the maximum port number supporting output enable
+ * @oen_pwpr_lock: flag indicating if the OEN register is locked by PWPR
  */
 struct rzg2l_hwcfg {
 	const struct rzg2l_register_offsets regs;
@@ -270,6 +270,7 @@ struct rzg2l_hwcfg {
 	u8 func_base;
 	u8 oen_max_pin;
 	u8 oen_max_port;
+	bool oen_pwpr_lock;
 };
 
 struct rzg2l_dedicated_configs {
@@ -1082,10 +1083,11 @@ static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 
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
@@ -1099,7 +1101,13 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
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
@@ -1190,7 +1198,7 @@ static int rzv2h_bias_param_to_hw(enum pin_config_param param)
 	return -EINVAL;
 }
 
-static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+static int rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	static const char * const pin_names[] = { "ET0_TXC_TXCLK", "ET1_TXC_TXCLK",
 						  "XSPI0_RESET0N", "XSPI0_CS0N",
@@ -1204,41 +1212,7 @@ static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
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
@@ -3263,8 +3237,10 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 static const struct rzg2l_hwcfg rzv2h_hwcfg = {
 	.regs = {
 		.pwpr = 0x3c04,
+		.oen = 0x3c40,
 	},
 	.tint_start_index = 17,
+	.oen_pwpr_lock = true,
 };
 
 static struct rzg2l_pinctrl_data r9a07g043_data = {
@@ -3361,8 +3337,9 @@ static struct rzg2l_pinctrl_data r9a09g056_data = {
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
@@ -3385,8 +3362,9 @@ static struct rzg2l_pinctrl_data r9a09g057_data = {
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
2.49.0


