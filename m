Return-Path: <linux-gpio+bounces-17514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBDAA5E6EC
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 23:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4A3D17A44C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 22:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D572D1F0E43;
	Wed, 12 Mar 2025 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XjRcxFZy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA281F0E36
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741816779; cv=none; b=cvQVYLS6UAIXkv7mYEyQ4CBGpZ6jwZJTl54rdjfPEeAuOcc4z9dJd+otH3JX4mPSzGH+4q+aHVDIC/LH6crIYBacjqVFDSuZEl57hip8QrNmd/N/3UwoN5fvIY2ENjRte2qFvpR9MuldnIZHXZt1aw9gZ8P6qITz0+2V2FQR9+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741816779; c=relaxed/simple;
	bh=kPiU7AQPfJUD82MWOCDNYAW1GrB703Ef7mVo1FwKxgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jO3YJhzaVNnIsPBMVdzWMXTab5pBn7pHBpoxJGm74rTN0CGaqZPH+mUvkG/87tft5HVkFw3mpJVhQRjClNHUyEuNxBmMynwZtLH+GrA3JLLOzkh4x+Pf87umzi47lGFfGbfAhelIBpl5mCQa42dEaV8nPUAvvslDWoKdiyIhtFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XjRcxFZy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso290928f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741816776; x=1742421576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gg81qXLeqNRVnYNhWzRtKRq29iOkMMU6/8ZfJi0jsG4=;
        b=XjRcxFZyuySJneYxsTHhsWxWiGUXSeWgXSbwYCDbI2euudmCRr3BDZYVtOXKxpkigM
         e1EDlG7/GRuV4BsgKHCYOSjdOQqTx/M5KxNudtZTWSqvDf5GglR8/Dqqh48fAfr+BzOU
         KBgkA+b6T0MFAzDeOnkkU70SSpMqLnr9ySwTI6WPUAbp+x0CGHCPOsM7HLc+yFe3Y5TF
         Bh67VKnz90rSMPTfbgi1l/jgEcV4HmB8tKnCtYefwAAmEyJCtvLKjGU7meaedjD01vQw
         ia3i3cEO7D+3K9CI6KpEd09ESMOmeCazkJja2C6HtJzSX4Jux1avjcLQxdGREHF9Mwzg
         6q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741816776; x=1742421576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gg81qXLeqNRVnYNhWzRtKRq29iOkMMU6/8ZfJi0jsG4=;
        b=wNsh4bwNFetIzjAznN0AAiOcF3vv/XwXaR88Qqm3cvVt/e5W2scLJ2JGSwAKPh+pLE
         U43lT4wqajHwfOGukgJTHBJzo3Fklmg60+cY1wUdJ4Xm712WYBj981MOcZh6Ch9ra6Lm
         CxFJA2KCro7+ctDrrTZJtaT0yonPWaRPr9S17mcgGBEwRAp1STFsohbI/bKQVfLbAjE0
         1HJJXAu530G+DbISyQD/2396lJjcpS8kcPTNJk2K6k/BnFa5mjVVGc1bI3exiazEhHvS
         4zgQWrwUdxrau8hKe03HSKo0/xKXgQfayyqvGEHVEnSW1w6QIYwZPEIDT9ceD8tyUFd2
         B/LA==
X-Forwarded-Encrypted: i=1; AJvYcCXPQtAzkaOvC0iEOQBd8D0O8SfGhsqqt6kKmPzYeQ8ww51S3dsii6q5FKV5WpQhW+K3WGyGk+yDteF/@vger.kernel.org
X-Gm-Message-State: AOJu0YxxhMu/BtxherbtIP7hMOB5VQeZflF1hW1fpUTIOC6bwu6W7XxY
	2rCHUdr1ATvMI1ObBsRoLM1RCQTSueUjPR9ChCFB9U4j6kt8pP3hxR8lemHtHug=
X-Gm-Gg: ASbGncuOJ4NAszbhntUJVDiwz2nc4E08YdlKhbaHxv5sbmWxwZorkXdIroDRdzB2vSV
	QG6lM0rBSyBxJHrl1+aCuCve/kE0/dtwRtHOmffTXpjwd/PmqmGnLpwuhH9KC5IQsYVPHe9VRec
	/3P+KZYlTl32Ow9eQgRsJ1Z1zcWNF9gwlItEh8c8udUPyWubPh62tpsgE/aTe3yMgwe/QdzSHz9
	Ctf1T+AtpdHtlQaIVMnqO4AP0593Xjthg199qhY7DZlhMtBfB1gL5Kku39mZ4Fw4lmF2ukm8P+c
	+1IxntXnp2ON30K53dIIlIB6OTLJhS7ncjF3S8ooG0scmR1m4FUGGaWZNziOSl3uxNbrgehoG6n
	g
X-Google-Smtp-Source: AGHT+IFzb7lUtfPjgZnNRAWyozRBGsKhIal8z+LRd/5vXoJiXZQ8l/qhHSIzDR0r/OdYP83BWgUYaA==
X-Received: by 2002:a05:6000:21c6:b0:390:de58:d7fe with SMTP id ffacd0b85a97d-3926c5a567bmr6410306f8f.51.1741816775827;
        Wed, 12 Mar 2025 14:59:35 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188bb34asm110175e9.18.2025.03.12.14.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 14:59:34 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 21:59:01 +0000
Subject: [PATCH v5 4/5] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250312-pinctrl-fltcon-suspend-v5-4-d98d5b271242@linaro.org>
References: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
In-Reply-To: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7443;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=kPiU7AQPfJUD82MWOCDNYAW1GrB703Ef7mVo1FwKxgc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn0gO+I6wp5PZe9nuA6dOUTKjwhdH5MMfH7OBz4
 VGFdiIc342JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9IDvgAKCRDO6LjWAjRy
 uu1RD/99O519RhU4ZXcH+hvnFQsOhv5kqvu4Avg1oOQTfGA6vpXMwXfis1s87sfU6YdZeenm32f
 OUG1vWSj6uoJo8em2Fj36/ybDtuORAFGVd/doHKu9yCSfyEMR93tA4xDbVKi6m/beuViFKC1nmI
 S/H1E9oaeyay+BG4XKUqlQg8PXLzGAuO1a1FHjlqYUF/74ckny27LruwsEJ9i6u8TCnSblp93jT
 jUAzD22nQQiLzUWhMonsz5d1jp3uPv5a+T+dJnWV3/y2P54TAoaKpUrfxbPJsr/t43l7kpL3tno
 +IVbYyFp69Yan4/MV4pBlSJPhZY/3D1Vh97Sa+rSr09oLIdqqo1ZEtoVFteScLOboM0DZpSX8K5
 ttpjiSvPPM9G3xFZmwvOo6bBEPYoWto5eSM8Tb1MZvWzOQRXVyQyuQQ2RfYvVjrAh6EeW3L3sjt
 ZCsY01kFTStI9ElEaJWOQYKpuoAlwGuYr30hl/OX60YOWTXzn0wCXr62NdSA7Yco4b8pVt41Ccg
 SFd8nqV/lOQ+c2xW8W2lgu+419HKDSzC4LgnG/02ClTTyNJxI1N/ctM6owHnRZ5z9k1TVGg2yBy
 TOiCBUqb/b/WQUBSZ+4v3RBPGTXxFFfsUC0V6nWbmEzx1CcMZuSDHiv7nTodUnRoTGwB+KnQ7kS
 mnx8vJ7AqmR50iQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gs101 differs to other SoCs in that fltcon1 register doesn't
always exist. Additionally the offset of fltcon0 is not fixed
and needs to use the newly added eint_fltcon_offset variable.

Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configuration")
Cc: stable@vger.kernel.org  # depends on the previous three patches
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v2:
* make it clear exynos_set_wakeup(bank) is conditional on bank type (Andre)
* align style where the '+' is placed (Andre)
* remove unnecessary braces (Andre)
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 71 ++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  2 +
 3 files changed, 85 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 57c98d2451b54b00d50e0e948e272ed53d386c34..fca447ebc5f5956b7e8d2f2d08f23622095b1ee6 100644
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
index af4fb1cde8de942707d932072bb237521e30c9c6..7887fd41665111d7c4b47e2d74f4e6e335914915 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -799,6 +799,41 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
+void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
+{
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+	const void __iomem *regs = bank->eint_base;
+
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
+				       + bank->eint_offset);
+
+		save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+					   + bank->eint_fltcon_offset);
+
+		/* fltcon1 register only exists for pins 4-7 */
+		if (bank->nr_pins > 4)
+			save->eint_fltcon1 = readl(regs +
+						EXYNOS_GPIO_EFLTCON_OFFSET
+						+ bank->eint_fltcon_offset + 4);
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
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_set_wakeup(bank);
+	}
+}
+
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
@@ -818,6 +853,42 @@ void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
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
+		if (bank->nr_pins > 4)
+			pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
+				 readl(eint_fltcfg0 + 4), save->eint_fltcon1);
+
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
index 35c2bc4ea488bda600ebfbda1492f5f49dbd9849..773f161a82a38cbaad05fcbc09a936300f5c7595 100644
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
2.49.0.rc1.451.g8f38331e32-goog


