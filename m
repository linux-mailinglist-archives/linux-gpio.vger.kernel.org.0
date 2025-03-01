Return-Path: <linux-gpio+bounces-16865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD8AA4AAC9
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 12:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9A418977A5
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 11:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0FC1DE4DB;
	Sat,  1 Mar 2025 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AlJhMAAF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846CD1DED71
	for <linux-gpio@vger.kernel.org>; Sat,  1 Mar 2025 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740829433; cv=none; b=osyQl2S5qRnpC9lKuFOINRaI/DmvG0CS1GUMvIz/ABu/8E/l0BnCwVIlD2kYynl1keDzvV41GU/jbS8uBs7Pv7MH2yeUSnYO91eKub+CcnnNRUfcxAhtpfbbumMxDwKLQs/hJhTxJhKF0DXotbYQLcShbhpwd6lMr1NV07fgmMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740829433; c=relaxed/simple;
	bh=WQiMAhEABATibxf9rK2qY4X4q9LA1nT3D1jg8dWK8TE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YPR46XbzyIdIrDOdtCGaxZRAJZDG96c2P5Tr83mh9XU288kqcoP0il2Yrzl2xLf8+yYxgFIbEEJlG0vwxHNSYa41Bmmq6Wa+QspDCMUcovQR1tcWDovP8jXRNwI51qQ7+WnAKvJ/aRszud1P8ZwtO8UJbWnp9YInMjETYgD9esk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AlJhMAAF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso20394045e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 01 Mar 2025 03:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740829429; x=1741434229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z/cSWxWRpqsqO8grG7ONZ7m7YAObdYsI81BO7B0oww=;
        b=AlJhMAAF8uorv8C8nQWvyQKa8JiYhxZBzTo2x0pMT0irNnNKq+0iUCMSmXDqkaCvN3
         DLvOqzDs7KCIGLmN7MalIFdSJHxvzYOxdeXgOp3hntj2ysPVpsrI5qd24K884cp5pVo4
         qd5v1gRZa5msLx6A+VxklrRt/2b1hmBdPQttaeai/wSq7zkjQcSc9OHYHZxAaQdg4JWu
         id6KYsYKgkpVfisPq8JlkqbAk/0WVKLH2E64i2Xzuj43mt/zA+3wxdV4/00NjZs48ciT
         ZfYpdUGH/h9ZGIWRFvXTRHMMHRyACyZUNwkfAi8CjjX7hhj6dIRBQYjE5AKegF3gU/va
         4U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829429; x=1741434229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z/cSWxWRpqsqO8grG7ONZ7m7YAObdYsI81BO7B0oww=;
        b=MtXI883m4Z7fxIDLOM57yT8JiNcDiM8JHprsUJua1Gp2qZtvem9bwIrUy8XQhRFw90
         6p8K6Bk57uDB3ZsIbuqdYiImfX9AaslV5aEs3Aps25+NckPzc6l8oR7u/9YlYsJDw7x5
         lJSX8UHIhPVRQYEelbTW+TVJCX2zHmGgaiGUtlIEwnEdDsS9OzB3zbXQJIeoXYXlZA3m
         B4ZjFILqxf2u0HNo2gGg07hi2Ni6nMZ3ggqZ3vugZ0+EwOT7acNz1alZxti1mcHW3vCW
         So8Vf1xqwKZgIyKwqkKTN0DX18ClBHjyfMzBDw3d1R9eE+eaTdXP8L3XgEFww088nYaW
         Xa5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlUgZCIMojX6r0/vpmC68ZI6SvRq78jBeqamLik97YSNKwO3sAEKm0vX1dl67Vp9m+oShVL6E+VPYT@vger.kernel.org
X-Gm-Message-State: AOJu0YxeChqBXTVHutaP6tIhX5vevNYeVfYspcgWhVK8WQUV16d5z3us
	aV2zkNpXhe516o1zdXvC8Dri1KdTYU0U5REdkBn16k+l1LNFGVpPKnnTKFQBv/o=
X-Gm-Gg: ASbGncsNX7SocoYic0Turiv5A/F5SUoGHvHMn/z698fc/v4mbKoZa0zr91CF24ZyVDb
	YHG7ywT/Z91yEa9bywJTz3pmNDP/wqmudwx2FxweJvhwkcl817RlUD0Fgyb3XwRM+tV455iDzmi
	HbJxUSI6BgXkW79aK8fW5H3ljBpsgyvSv3KLYrMtYwnYxFVoaratqszN69cfB7a5EwgtHTqnzN3
	P7z4SpXY5xmq0khOLMqis2j9At5ToJ/GhwU1Uu+lTE5GlhyEg8CdF27frY9Y9xp9+vYU+DVqq7/
	ixcn7aELFCCQf4J8cXUdWsnMiQUgY9lJzigPQ+9wZhD5ah7Zh+nEgcHHl7Kj3ZHCrW6uZetGoiY
	=
X-Google-Smtp-Source: AGHT+IHX+OpT7K19yydnzy+psqVpStq59olCev5VC5wN6FATIvbdpym0kYv3N0K9MfItgnSgiMs2Bg==
X-Received: by 2002:a05:6000:184e:b0:38d:d767:364 with SMTP id ffacd0b85a97d-390ec7cd0bcmr5447965f8f.13.1740829428873;
        Sat, 01 Mar 2025 03:43:48 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796600sm8002871f8f.20.2025.03.01.03.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 03:43:48 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 01 Mar 2025 11:43:21 +0000
Subject: [PATCH v2 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-pinctrl-fltcon-suspend-v2-3-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6945;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=WQiMAhEABATibxf9rK2qY4X4q9LA1nT3D1jg8dWK8TE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnwvLrfpYm0YyTVeiAj1A7Ag9aSpY7VSix6xhfw
 eZen8OONlCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8Ly6wAKCRDO6LjWAjRy
 ug09D/9g2XLh/S/e21WJPNg/JLGMHnmgmGrxTD1hI2pdfssjjxykj5a1IQIHhclFa3fh1NGdNoa
 JJW+wvLkX5DwhiZNLmKkQpMWMicIEo/DdFACmLH0mpfQApX443hdyd2MDQy+tVXj+brjiTl3GiQ
 Czugm+HOpinux9oHRy0UBjIJ9kU9ZB+BHcf6ZN0ho57T4SjHq/yy33YvBb+q6Zhh6r0x2D9W7lH
 Z8ytM5T7tTXFLV95lWqlB4FQMc9Ljx7jxJPfm8wSgTvdLcUT4kTkDhbJBwTR5syy+LVSjrtlhXv
 pVfeV1PT8dgsvcsIrsRbjElFHfcPoA7qzsBjdi9zbVFTbGIoeUihuQdvKbRhH0sRqawsKQBrgx+
 DDtpSKKqobukBy9cfZshP9Zoa6NJ4t6GJydyHyvOLNi48mzHswG7OCMW+wYBFNOYyDI0frAeNlg
 nlsZGaYv3OJfPvOnrDYVnKYERGiHqv0prrS3sg0jpQX5d94IClgZIEAOb1nnvvgK2e4ZSPWW5Hp
 cu9Tdok5OAik644hkqsvHVNbEAkwHgEWn26YFjJFdPUhNkhFjwJn0JeqicNnfTHYbuLFlSzmP0V
 CKFtZSI2hhvU/S0GHDwIKx5+iQOB171VcufbY/Zszv7a4FR2K9W9A9JpRFK2XseMTrY5YZ8RE9d
 pULSiyl+x3SHCqw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gs101 differs to other SoCs in that fltcon1 register doesn't
always exist. Additionally the offset of fltcon0 is not fixed
and needs to use the newly added eint_fltcon_offset variable.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configuration")
Cc: stable@vger.kernel.org
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 71 ++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  2 +
 3 files changed, 85 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 57c98d2451b5..fca447ebc5f5 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1455,15 +1455,15 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
 		.pin_banks	= gs101_pin_far_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (GSACORE) */
 		.pin_banks	= gs101_pin_gsacore,
@@ -1477,29 +1477,29 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_peric0,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (PERIC1) */
 		.pin_banks	= gs101_pin_peric1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume	= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI1) */
 		.pin_banks	= gs101_pin_hsi1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI2) */
 		.pin_banks	= gs101_pin_hsi2,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index d65a9fba0781..ddc7245ec2e5 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -801,6 +801,41 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
+void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
+{
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+	const void __iomem *regs = bank->eint_base;
+
+	exynos_set_wakeup(bank);
+
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
+				       + bank->eint_offset);
+
+		save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET +
+					   bank->eint_fltcon_offset);
+
+		/* fltcon1 register only exists for pins 4-7 */
+		if (bank->nr_pins > 4)
+			save->eint_fltcon1 = readl(regs +
+						EXYNOS_GPIO_EFLTCON_OFFSET +
+						bank->eint_fltcon_offset + 4);
+
+		save->eint_mask = readl(regs + bank->irq_chip->eint_mask
+					+ bank->eint_offset);
+
+		pr_debug("%s: save     con %#010x\n",
+			 bank->name, save->eint_con);
+		pr_debug("%s: save fltcon0 %#010x\n",
+			 bank->name, save->eint_fltcon0);
+		if (bank->nr_pins > 4)
+			pr_debug("%s: save fltcon1 %#010x\n",
+				 bank->name, save->eint_fltcon1);
+		pr_debug("%s: save    mask %#010x\n",
+			 bank->name, save->eint_mask);
+	}
+}
+
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
@@ -820,6 +855,42 @@ void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
+void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
+{
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+
+	void __iomem *regs = bank->eint_base;
+	void __iomem *eint_fltcfg0 = regs + EXYNOS_GPIO_EFLTCON_OFFSET
+		     + bank->eint_fltcon_offset;
+
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		pr_debug("%s:     con %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
+			       + bank->eint_offset), save->eint_con);
+
+		pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
+			 readl(eint_fltcfg0), save->eint_fltcon0);
+
+		/* fltcon1 register only exists for pins 4-7 */
+		if (bank->nr_pins > 4) {
+			pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
+				 readl(eint_fltcfg0 + 4), save->eint_fltcon1);
+		}
+		pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->irq_chip->eint_mask
+			       + bank->eint_offset), save->eint_mask);
+
+		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
+		       + bank->eint_offset);
+		writel(save->eint_fltcon0, eint_fltcfg0);
+
+		if (bank->nr_pins > 4)
+			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
+		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
+		       + bank->eint_offset);
+	}
+}
+
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 35c2bc4ea488..773f161a82a3 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -225,6 +225,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
+void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
+void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);

-- 
2.48.1.711.g2feabab25a-goog


