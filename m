Return-Path: <linux-gpio+bounces-18179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37712A791FD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 17:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7165D7A266B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 15:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDAD23C8B5;
	Wed,  2 Apr 2025 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gETdlxem"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C505127E18
	for <linux-gpio@vger.kernel.org>; Wed,  2 Apr 2025 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607063; cv=none; b=RrMkgeeHB7bEkyf9bRdnsw0gnjFaYeoKjJXuDWaFFjr4Ao9Eti1i4NBe1Q8N98xLnsW/haCJIertK0H3ckmwQSoWLWEeQnxCin9bq9Il5GsSL1sG2L34QUuZbyrqTFAk6fZ8AM2SLRrlYnuke3zWiea/qsNRdgHA/TxDwyuVnI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607063; c=relaxed/simple;
	bh=SOyw3jdStYdySfM8lBPDNtxClYBS3HT3b7KLkFjw5bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cn4LbnPIdK9Yz4EwAgCQpd48ufrqC3lckbFl8fxs/Ny6f0QRmcMl6cXKqVYRfW/VscmJhKvcq/xWuBdSVvQZkXnHFTLqCLnu6kkiK+QhUVu7diZiqorFdCjrPTvsWfuvD50foRQp4ZW5zsspfNfIaEZhclMXujYXKyBKYXNMVFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gETdlxem; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3979457f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Apr 2025 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607059; x=1744211859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfPwCl7aYTIbWPSAYmdsvg2+Jb9PZVNsfh4JLw3ATow=;
        b=gETdlxem3ny0UBec8J/MTaUIbk8sPoC+ZpvUauNIgKvdF3qiGHHxNhCaFIXFx5m6XS
         kZEfVoyMjKCy5YXHsHY6JYAdv+t4mE/rMg3D2EmZcwPRj+OgPONSWhe02WyQ0iYwLDV9
         zcz8W2SDsvZUc38lC412klAnEYtLfirF/0kIGlfHNlt2e58VypPnJH5J0j8PpPJ1ZpI7
         nDOfOjuYpH2Lv7ffflXgSXiIpuY7bRP4ENbiKZrpFVU75WgwYWM7lTi0k5SUaKSEpQA9
         y4mWKphVQzDkSxE91P7NKtrUUGj//6ALo9pkRXAIORdvHjQPM83phcJjKpylZ7VNixwN
         1kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607059; x=1744211859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfPwCl7aYTIbWPSAYmdsvg2+Jb9PZVNsfh4JLw3ATow=;
        b=ksXw5muYB2trmbwa2wZ00E2oBbsI+0zPxxCdquKmjz4q5/Pvzb/FeBeaf5zE9QQ/18
         Kbr3GghuaNXhcoqjyH9XkZZNhDbTiSTFToyZYjK/B4u59a2h5ZcOuE7lBnpJQ4JUmqUQ
         Rx8lI5Xf4Qgas3YyWp3BOb1aHYKv4zeVP4dpAStqq46v/lP88bqTh5fhlKkwmCyssE8U
         bvmkTav9EduW74fnVFBzHarM5Y0+ul7n0tBuoL3zt8Kugyst+3nIxMM391lhDbTbzdzv
         SZQ8AlrR9oIBF1FnVGDmNy4U5ZI0ExHJHEDvUw9t6YPXQ/7y/pgy5fAOwFKep39GqX4F
         0oQA==
X-Forwarded-Encrypted: i=1; AJvYcCVHS6Uiwcx81IHcNHAMKyQd0MWWhVtc0uVMwY9h34H+jv36PHio4B1tNL64MtwQNkopl9wtbnjT6gGY@vger.kernel.org
X-Gm-Message-State: AOJu0YzlMvHifRUn1Ljh/vVBg5kdOy5NTOhgmHecCc047ZCPzYowYAVL
	aXABxSTAu150DLl3Wwmr8vrEEW9a1SFWslSEkDwh8axHAbpjmycd8yb7RI6Medw=
X-Gm-Gg: ASbGncvy/wqOcfczdO1ERIBMU0fSW91wgXtYRNCQwoapdSCG2VbADMB8zbSraatyQtO
	Lle9xd5reos6wNuDxisMNvlXs5BkCnrBmdhvpu+SMjWFEyFh4sBoFtZCI19JSNjtsjcbyCnPBHM
	2p7tESDzo9uG69P25elrexwyCpKLZfHHIKUXv11o16vvY7R9d+7ECeSBZsmXziU1/dSuEonERjI
	2BCqsCXvabIe20Kcam/FUDQRnpDyedAmAfE9GNwiwckR50TvnwndJsk266/zsm9QB5HTP5HqMoN
	R8IST5wovXZ3bLa2DvnMB8SMQFc9sp1wzqpi0xVTGCuXvbrqcj97WBUm92HBi7fBamoNBtIVrQ=
	=
X-Google-Smtp-Source: AGHT+IFLdkbEa6K1faZlIk+TcENgKb4y4keAd2lgqG563akV2hjUSxTIV8SnOYHmRxq7XbWIlJosHQ==
X-Received: by 2002:a05:6000:144e:b0:39a:d20b:5c25 with SMTP id ffacd0b85a97d-39c120e34ffmr14401209f8f.26.1743607059322;
        Wed, 02 Apr 2025 08:17:39 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:38 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 02 Apr 2025 16:17:30 +0100
Subject: [PATCH v6 1/4] pinctrl: samsung: refactor drvdata suspend & resume
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-1-78ce0d4eb30c@linaro.org>
References: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
In-Reply-To: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10911;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=SOyw3jdStYdySfM8lBPDNtxClYBS3HT3b7KLkFjw5bI=;
 b=owEBbAKT/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUORK1okRhy92aZ5/zfF/Uu4Lef42dODQBq+
 NkN1s3qFfuJAjIEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VDgAKCRDO6LjWAjRy
 ujLbD/MGef9ZtKfw/6GtMkCSwqrst5lC7jROYLj2A1qiaz0Wan9N1nK9mxxr8cXoZNUnppMZB/k
 PPcQCER88cwn5G96+IQcuYOYbXDcqHJP65C8h4Fkxzy/hfEdJqpXTBOGBjgMvIWluXF4I7QZ5G9
 pvV9BYmG3PYPCEakcPDbJsjh3i8p38cEuetrOIYnJw9PVM5DcrXsJ8CBPwcqv0Z3IILPKnw4fTL
 /mNC8XMJ50+k7Irz++wOHpuH7d7hlWCmuqFIPG2R9yuBtvnYdOtl9CTYsTYlylu7khed4xqrEWH
 0Li1VcJG16pd7AQLcvQBpwOBylP+R1bcoDzI1YRRh63L6PZBiv6PMnBaOqOmZY9Y0WQ0NZ64fvR
 RulKxSpq928AXrJOCRdcmeo/ddDOkqb4zz4v+kytNTFfwSqQfIxigercuiC41P0A314tjHfsHph
 //I9zq9nLL+ayHmzh7GnG96DKF7TzEqCwhs5Ddo6I+2R18MnD98P+nnOolk8/kpS3u40hk2CrQI
 Ns8pcv4AxnOjonXWr044q9EY9yOvqQjp8ODptbGe7XV16/bpSoUE/hX3AppqV91hnHTpxv+yEtv
 4jENH9oHPFOKn4S2s4XblEEg+Q2m6RFjAy7T9xTGWV+IUJc9ysibwShtqF3cOrDdJBDxE23MOUm
 On68kyrV+d7u7
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

This enables the clk_enable() and clk_disable() logic to be removed
from each callback, but otherwise should have no functional impact.

It is a prepatory patch so that the callbacks can become SoC
specific.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v5:
* Ensure it is symmetrically reversed (Krzysztof)
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 89 ++++++++-----------------------
 drivers/pinctrl/samsung/pinctrl-exynos.h  |  4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c | 21 +++++---
 drivers/pinctrl/samsung/pinctrl-samsung.h |  8 +--
 4 files changed, 42 insertions(+), 80 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 42093bae8bb79390f3c0ee7d387220b297af812b..ae82f42be83cf0a294452d7f44cd744295bb0408 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -762,19 +762,11 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	return 0;
 }
 
-static void exynos_pinctrl_suspend_bank(
-				struct samsung_pinctrl_drv_data *drvdata,
-				struct samsung_pin_bank *bank)
+static void exynos_pinctrl_suspend_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for saving state\n");
-		return;
-	}
-
 	save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
 						+ bank->eint_offset);
 	save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
@@ -784,71 +776,46 @@ static void exynos_pinctrl_suspend_bank(
 	save->eint_mask = readl(regs + bank->irq_chip->eint_mask
 						+ bank->eint_offset);
 
-	clk_disable(bank->drvdata->pclk);
-
 	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
 	pr_debug("%s: save fltcon0 %#010x\n", bank->name, save->eint_fltcon0);
 	pr_debug("%s: save fltcon1 %#010x\n", bank->name, save->eint_fltcon1);
 	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
 }
 
-static void exynosauto_pinctrl_suspend_bank(struct samsung_pinctrl_drv_data *drvdata,
-					    struct samsung_pin_bank *bank)
+static void exynosauto_pinctrl_suspend_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for saving state\n");
-		return;
-	}
-
 	save->eint_con = readl(regs + bank->pctl_offset + bank->eint_con_offset);
 	save->eint_mask = readl(regs + bank->pctl_offset + bank->eint_mask_offset);
 
-	clk_disable(bank->drvdata->pclk);
-
 	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
 	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
 }
 
-void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
+void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
-	struct samsung_pin_bank *bank = drvdata->pin_banks;
 	struct exynos_irq_chip *irq_chip = NULL;
-	int i;
 
-	for (i = 0; i < drvdata->nr_banks; ++i, ++bank) {
-		if (bank->eint_type == EINT_TYPE_GPIO) {
-			if (bank->eint_con_offset)
-				exynosauto_pinctrl_suspend_bank(drvdata, bank);
-			else
-				exynos_pinctrl_suspend_bank(drvdata, bank);
-		}
-		else if (bank->eint_type == EINT_TYPE_WKUP) {
-			if (!irq_chip) {
-				irq_chip = bank->irq_chip;
-				irq_chip->set_eint_wakeup_mask(drvdata,
-							       irq_chip);
-			}
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		if (bank->eint_con_offset)
+			exynosauto_pinctrl_suspend_bank(bank);
+		else
+			exynos_pinctrl_suspend_bank(bank);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		if (!irq_chip) {
+			irq_chip = bank->irq_chip;
+			irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
 		}
 	}
 }
 
-static void exynos_pinctrl_resume_bank(
-				struct samsung_pinctrl_drv_data *drvdata,
-				struct samsung_pin_bank *bank)
+static void exynos_pinctrl_resume_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for restoring state\n");
-		return;
-	}
-
 	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
 			readl(regs + EXYNOS_GPIO_ECON_OFFSET
 			+ bank->eint_offset), save->eint_con);
@@ -870,22 +837,13 @@ static void exynos_pinctrl_resume_bank(
 						+ 2 * bank->eint_offset + 4);
 	writel(save->eint_mask, regs + bank->irq_chip->eint_mask
 						+ bank->eint_offset);
-
-	clk_disable(bank->drvdata->pclk);
 }
 
-static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_data *drvdata,
-					   struct samsung_pin_bank *bank)
+static void exynosauto_pinctrl_resume_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for restoring state\n");
-		return;
-	}
-
 	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
 		 readl(regs + bank->pctl_offset + bank->eint_con_offset), save->eint_con);
 	pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
@@ -894,21 +852,16 @@ static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_data *drvd
 	writel(save->eint_con, regs + bank->pctl_offset + bank->eint_con_offset);
 	writel(save->eint_mask, regs + bank->pctl_offset + bank->eint_mask_offset);
 
-	clk_disable(bank->drvdata->pclk);
 }
 
-void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
+void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
 {
-	struct samsung_pin_bank *bank = drvdata->pin_banks;
-	int i;
-
-	for (i = 0; i < drvdata->nr_banks; ++i, ++bank)
-		if (bank->eint_type == EINT_TYPE_GPIO) {
-			if (bank->eint_con_offset)
-				exynosauto_pinctrl_resume_bank(drvdata, bank);
-			else
-				exynos_pinctrl_resume_bank(drvdata, bank);
-		}
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		if (bank->eint_con_offset)
+			exynosauto_pinctrl_resume_bank(bank);
+		else
+			exynos_pinctrl_resume_bank(bank);
+	}
 }
 
 static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drvdata)
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index b483270ddc53c0b0e8d0f425cd7b0f59e6a894da..341155c1abd153eb3efec5212b268ccfa535bd8e 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -240,8 +240,8 @@ struct exynos_muxed_weint_data {
 
 int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d);
 int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d);
-void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata);
-void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata);
+void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
+void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 2896eb2de2c098c72adc4de5c9d72bb2b7e46bdb..ef557217e173af905c1667c6a167c5c77057e254 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1333,6 +1333,7 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 {
 	struct samsung_pinctrl_drv_data *drvdata = dev_get_drvdata(dev);
+	struct samsung_pin_bank *bank;
 	int i;
 
 	i = clk_enable(drvdata->pclk);
@@ -1343,7 +1344,7 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 	}
 
 	for (i = 0; i < drvdata->nr_banks; i++) {
-		struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
+		bank = &drvdata->pin_banks[i];
 		const void __iomem *reg = bank->pctl_base + bank->pctl_offset;
 		const u8 *offs = bank->type->reg_offset;
 		const u8 *widths = bank->type->fld_width;
@@ -1371,10 +1372,14 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 		}
 	}
 
+	for (i = 0; i < drvdata->nr_banks; i++) {
+		bank = &drvdata->pin_banks[i];
+		if (drvdata->suspend)
+			drvdata->suspend(bank);
+	}
+
 	clk_disable(drvdata->pclk);
 
-	if (drvdata->suspend)
-		drvdata->suspend(drvdata);
 	if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
 		drvdata->retention_ctrl->enable(drvdata);
 
@@ -1392,6 +1397,7 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 {
 	struct samsung_pinctrl_drv_data *drvdata = dev_get_drvdata(dev);
+	struct samsung_pin_bank *bank;
 	int ret;
 	int i;
 
@@ -1406,11 +1412,14 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 		return ret;
 	}
 
-	if (drvdata->resume)
-		drvdata->resume(drvdata);
+	for (i = 0; i < drvdata->nr_banks; i++) {
+		bank = &drvdata->pin_banks[i];
+		if (drvdata->resume)
+			drvdata->resume(bank);
+	}
 
 	for (i = 0; i < drvdata->nr_banks; i++) {
-		struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
+		bank = &drvdata->pin_banks[i];
 		void __iomem *reg = bank->pctl_base + bank->pctl_offset;
 		const u8 *offs = bank->type->reg_offset;
 		const u8 *widths = bank->type->fld_width;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 3cf758df7d69127a1b012105eebcfbba45c993f2..fcc57c244d167db1de8c7aceffa6a9e7484bf348 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -285,8 +285,8 @@ struct samsung_pin_ctrl {
 	int		(*eint_gpio_init)(struct samsung_pinctrl_drv_data *);
 	int		(*eint_wkup_init)(struct samsung_pinctrl_drv_data *);
 	void		(*pud_value_init)(struct samsung_pinctrl_drv_data *drvdata);
-	void		(*suspend)(struct samsung_pinctrl_drv_data *);
-	void		(*resume)(struct samsung_pinctrl_drv_data *);
+	void		(*suspend)(struct samsung_pin_bank *bank);
+	void		(*resume)(struct samsung_pin_bank *bank);
 };
 
 /**
@@ -335,8 +335,8 @@ struct samsung_pinctrl_drv_data {
 
 	struct samsung_retention_ctrl	*retention_ctrl;
 
-	void (*suspend)(struct samsung_pinctrl_drv_data *);
-	void (*resume)(struct samsung_pinctrl_drv_data *);
+	void (*suspend)(struct samsung_pin_bank *bank);
+	void (*resume)(struct samsung_pin_bank *bank);
 };
 
 /**

-- 
2.49.0.504.g3bcea36a83-goog


