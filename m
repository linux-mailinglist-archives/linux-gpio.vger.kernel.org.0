Return-Path: <linux-gpio+bounces-17178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8A9A557A4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 21:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 869CA166402
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 20:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689DB26BD82;
	Thu,  6 Mar 2025 20:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r3lqsaoW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C327605D
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741293791; cv=none; b=I5dQi1u3W59cB4Nlp3wBLrkfipLI5PcvoVxRzsc3PXB++YRWLSAViqpFPs6P3u600yEFXEhDzaZ1t+Rg37HVJ9XFnoJEyiZVMJwllK59+i3TUvMhGV31tCyNeeIhwVfTm6H89Z9HyQWOrOS/zTKhQCYuFn2i855kuUVOki8cSZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741293791; c=relaxed/simple;
	bh=NirIpxWoE4Y292tcCiQzgW8fqYwxiPKlGnOzOBSkjKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXcqdGpdJLp/RwRnALTPoWC0v5bpjzuAJZs+pUxLe4scqX/N4e4ToY/njDQMRQxSYgBJ5B1jPgYiH59x9HPUxOae5Qy56Lr15X6AG2WsrwltdHrlQU2nr4iX+Ae4XRZ4qxA0gwAfw8l4ev/dXpMhgNQwz7C7odewZ2jH6F4n78s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r3lqsaoW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bdc607c3fso7275875e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 12:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741293786; x=1741898586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pz0TSBuXYl1JFJpacBt0m6D7fYiAAt7Zxz8MpIO+YIg=;
        b=r3lqsaoWsmgRzRhvCIV+eFMBt8dRZOQZZvVq9TOpMs2bxKOHuuoLq8rgqCyT7dsega
         JqLpKwb/UMymf64Giiup0JN/mCQ6/VrYWK7m2E5nA0YltfGo7PDcK9ku5QiS5pQeVDlT
         eaFRywkqn59NzMz1W9LU174YL911SvQtrV86j4I3RKWzVkp+JcFbQVF0YVyTco91V3ng
         KAcvpm5CNQXZzYE95mkwve20kUnZJYxvPrSA0ltrI6vyFzxgHS9aM/k9B7cKxcn8qZrC
         G0c1RgKEXqmO53HLR+KuZU7lVXdQmEIFDKplLGm6JyXioxT4CKRE+Ps7ic/tu45DS0bZ
         4fOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293786; x=1741898586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pz0TSBuXYl1JFJpacBt0m6D7fYiAAt7Zxz8MpIO+YIg=;
        b=srsmatWkkdz7U/DcIdkgekCNbXSGQUQLh+9ToRMHiZvWnk8X/FVR79IVvMyC+mqoxS
         uLOueMUon6D9X7O492ki9Qn8WWviuoIr7XdMcHjzOBZv3Q1FXgxA0H7bIfErJP/+OfPB
         eNwl2oAuGB/m3a1/+luQnUfeMMi0AYPKdqezpc1KVpUnOj09lTQZc9tWI6jXkSGNMdiZ
         DZftEBkHOXKttVf1K+FaZlCnqFW/R1/xUS8chrufhsT4AvifDyb+wrqumYNs77jmEfmR
         CBS3n6r17UNpidswsLtwq8u1NbH7Qo0D2A9joAkG0LXsH+L2OZ3Yir9f5+uA/mk8clfB
         5hCA==
X-Forwarded-Encrypted: i=1; AJvYcCVNIuSBqEgZB6j8ey3+ScLC0Gch6LaLWfFoIPUYDGYcK9FOUyH+xB4DZKNbOksOQw+o8U8N1l1UmSjH@vger.kernel.org
X-Gm-Message-State: AOJu0YxQmbwywuBZWAQbLRSqHVexs8Xcyjd2BEYaSAGCJucWBxyWIC2I
	7PzJpxG89Lmeejky6N3lOv0BC97b/oS30o0bzB5BGE9xkAmPeuDdP8aEjJcc06ebsAip4hGS6As
	O
X-Gm-Gg: ASbGnctTVZWZ79Qvs1RvYPwz8ZkR10+6RpJT/NY3wXNGGzr17+NlKxagkVsGotZnBAq
	LuTGgHcf08WeLuieZl+i5SKHDVfQ9/KCX8qvpfsDRdPGD02dO77/Vt4O4u18mkZWjj4uZChS0ty
	3AkAekaCCpQWj3m4x0kPI/JPMfPW22evVotKbkJFnv/FFEyoqUGqCfo+/b/suLGRMB82x6Qa+S3
	p1eJ8Zt8W8KwA3BD1wLYBpR95zRVcO/GFHfSusL2Hkanx8KlCV5Uz733P5pBqOhKWUj8TY4pR+6
	dSaHgvFg1C/Ux4jiIME5jYXGoPr6QGbaEde9OXX9aVsmJDC3yMmEfhnuXQZsEmljMHwySOpouUU
	=
X-Google-Smtp-Source: AGHT+IEbhlFM4X4/ijxoyGYg9xjw4F1n2ZDTzmLDMvViJH8ucomvKfyavrR+Fcaw4OwDHAEgmG1eGQ==
X-Received: by 2002:a05:600c:524d:b0:439:84ba:5773 with SMTP id 5b1f17b1804b1-43c6871c50fmr6598055e9.31.1741293785668;
        Thu, 06 Mar 2025 12:43:05 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd9470e2sm30081715e9.33.2025.03.06.12.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:43:05 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 06 Mar 2025 20:42:36 +0000
Subject: [PATCH v3 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-pinctrl-fltcon-suspend-v3-2-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17600;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=NirIpxWoE4Y292tcCiQzgW8fqYwxiPKlGnOzOBSkjKM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnygjQL7dQVXxbBbiZ+BWpZNWT4iYdpjf+QW+JE
 KHU+VMCUQSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8oI0AAKCRDO6LjWAjRy
 up9DD/9+4zJZqVRDJg9wIngLgxiWFzrFIIItOuFpZIXiYJGiNWudj/thMH40CwvW+aVikO0OGOU
 00cYXAzPyAatrxZpt6DGh5YhRBWiE0z3cuB2lsOaS5VlabxemxYEGtYLL9Jr+wEMBdvNy3OcGI7
 e2wkXwOq0/DaZeZDwlEzVGTObzM15ITMbuonnxe/L5oIdaty4HHUOgwaNqhr75uN61sLjBa4cL8
 RV4SiIRhMe0g1lwYxJZCIwXdOzjl5ZHebe1veBCI0QxR61Uf/q7C4Akd22uQI5fkJCNAgE/dhW0
 iB6v0SYzJLogCG1hPpeH/kx7R34xqe/81eXro5ea+QcMPV0yXMCZfulVEKkmsOzrwHu+h0ARJfi
 AY/1cP0gND87uXNvTxr9n7nbLshwVf63B70oSYoUTRnyaZNMlNWLL4W9VXPShD8NW6H4asCEzpT
 NLR/iMb1U4He5NC6cE+zy+W+ezdK8TqQOpvfmDc32H/mfv31S3PcYlKjZPWoUfluH0s9w7OtvIv
 na/u+AI+mjjtzJkiK/Mj3UcH+hr1d+1QadYPGYy+RuoHsxImEXZpoimmzlenYo+0cnYPxcVsmSV
 0RmccL29gGEGve4RNM9qyHQT1ILfdZ1+8qSqW6naRNVehGZhJOk+rzdA5pxkDkW1wZmwKYigZOM
 5J6lD3ZeTlfL+SA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gs101 needs it's own suspend/resume callbacks to use the newly
added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
registers. It also differs to previous SoCs in that fltcon1
register doesn't always exist for each bank.

exynosautov920 also has dedicated logic for using eint_con_offset
and eint_mask_offset for saving & restoring it's registers.

Refactor the existing platform specific suspend/resume callback
so that each SoC variant has their own callback containing the
SoC specific logic.

Additionally we now call drvdata->suspend() & drvdata->resume()
from within the loop that iterates the banks in
samsung_pinctrl_suspend() and samsung_pinctrl_resume().

This simplifies the logic, and allows us to remove the
clk_enable() and clk_disable() from the callbacks.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v2:
* Remove useless init (Andre)
* make it clear set_wakeup is conditional on bank->eint_type (Andre)

Changes since v1:
* Split code refactor & gs101 parts into separate patches (Andre)
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  28 ++--
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 201 ++++++++++---------------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |   6 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  11 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   8 +-
 5 files changed, 109 insertions(+), 145 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index e28fe81776466b693417c66bb15752d609b79eb1..57c98d2451b54b00d50e0e948e272ed53d386c34 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1112,8 +1112,8 @@ static const struct samsung_pin_ctrl exynosautov920_pin_ctrl[] = {
 		.pin_banks	= exynosautov920_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks0),
 		.eint_wkup_init	= exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 		.retention_data	= &exynosautov920_retention_data,
 	}, {
 		/* pin-controller instance 1 AUD data */
@@ -1124,43 +1124,43 @@ static const struct samsung_pin_ctrl exynosautov920_pin_ctrl[] = {
 		.pin_banks	= exynosautov920_pin_banks2,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks2),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 HSI1 data */
 		.pin_banks	= exynosautov920_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks3),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 HSI2 data */
 		.pin_banks	= exynosautov920_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks4),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 HSI2UFS data */
 		.pin_banks	= exynosautov920_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks5),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC0 data */
 		.pin_banks	= exynosautov920_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks6),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC1 data */
 		.pin_banks	= exynosautov920_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks7),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ac6dc22b37c98ed5b7fca3335764f19abb2f71cc..f10ff09c1af01c11ff9229aaef77df32eb057b7b 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -761,153 +761,114 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	return 0;
 }
 
-static void exynos_pinctrl_suspend_bank(
-				struct samsung_pinctrl_drv_data *drvdata,
-				struct samsung_pin_bank *bank)
+static void exynos_set_wakeup(struct samsung_pin_bank *bank)
 {
-	struct exynos_eint_gpio_save *save = bank->soc_priv;
-	const void __iomem *regs = bank->eint_base;
+	struct exynos_irq_chip *irq_chip;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for saving state\n");
-		return;
+	if (bank->irq_chip) {
+		irq_chip = bank->irq_chip;
+		irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
 	}
-
-	save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
-						+ bank->eint_offset);
-	save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset);
-	save->eint_fltcon1 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset + 4);
-	save->eint_mask = readl(regs + bank->irq_chip->eint_mask
-						+ bank->eint_offset);
-
-	clk_disable(bank->drvdata->pclk);
-
-	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
-	pr_debug("%s: save fltcon0 %#010x\n", bank->name, save->eint_fltcon0);
-	pr_debug("%s: save fltcon1 %#010x\n", bank->name, save->eint_fltcon1);
-	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
 }
 
-static void exynosauto_pinctrl_suspend_bank(struct samsung_pinctrl_drv_data *drvdata,
-					    struct samsung_pin_bank *bank)
+void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for saving state\n");
-		return;
-	}
-
-	save->eint_con = readl(regs + bank->pctl_offset + bank->eint_con_offset);
-	save->eint_mask = readl(regs + bank->pctl_offset + bank->eint_mask_offset);
-
-	clk_disable(bank->drvdata->pclk);
-
-	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
-	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
+				       + bank->eint_offset);
+		save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+					   + 2 * bank->eint_offset);
+		save->eint_fltcon1 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+					   + 2 * bank->eint_offset + 4);
+		save->eint_mask = readl(regs + bank->irq_chip->eint_mask
+					+ bank->eint_offset);
+
+		pr_debug("%s: save     con %#010x\n",
+			 bank->name, save->eint_con);
+		pr_debug("%s: save fltcon0 %#010x\n",
+			 bank->name, save->eint_fltcon0);
+		pr_debug("%s: save fltcon1 %#010x\n",
+			 bank->name, save->eint_fltcon1);
+		pr_debug("%s: save    mask %#010x\n",
+			 bank->name, save->eint_mask);
+	} else if (bank->eint_type == EINT_TYPE_WKUP)
+		exynos_set_wakeup(bank);
 }
 
-void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
+void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
-	struct samsung_pin_bank *bank = drvdata->pin_banks;
-	struct exynos_irq_chip *irq_chip = NULL;
-	int i;
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+	const void __iomem *regs = bank->eint_base;
 
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
-		}
-	}
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		save->eint_con = readl(regs + bank->pctl_offset +
+				       bank->eint_con_offset);
+		save->eint_mask = readl(regs + bank->pctl_offset +
+					bank->eint_mask_offset);
+		pr_debug("%s: save     con %#010x\n",
+			 bank->name, save->eint_con);
+		pr_debug("%s: save    mask %#010x\n",
+			 bank->name, save->eint_mask);
+	} else if (bank->eint_type == EINT_TYPE_WKUP)
+		exynos_set_wakeup(bank);
 }
 
-static void exynos_pinctrl_resume_bank(
-				struct samsung_pinctrl_drv_data *drvdata,
-				struct samsung_pin_bank *bank)
+void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for restoring state\n");
-		return;
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		pr_debug("%s:     con %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
+			       + bank->eint_offset), save->eint_con);
+		pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+			       + 2 * bank->eint_offset), save->eint_fltcon0);
+		pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+			       + 2 * bank->eint_offset + 4),
+			       save->eint_fltcon1);
+		pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->irq_chip->eint_mask
+			       + bank->eint_offset), save->eint_mask);
+
+		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
+		       + bank->eint_offset);
+		writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
+		       + 2 * bank->eint_offset);
+		writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
+		       + 2 * bank->eint_offset + 4);
+		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
+		       + bank->eint_offset);
 	}
-
-	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
-			readl(regs + EXYNOS_GPIO_ECON_OFFSET
-			+ bank->eint_offset), save->eint_con);
-	pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
-			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-			+ 2 * bank->eint_offset), save->eint_fltcon0);
-	pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
-			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-			+ 2 * bank->eint_offset + 4), save->eint_fltcon1);
-	pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
-			readl(regs + bank->irq_chip->eint_mask
-			+ bank->eint_offset), save->eint_mask);
-
-	writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
-						+ bank->eint_offset);
-	writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset);
-	writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset + 4);
-	writel(save->eint_mask, regs + bank->irq_chip->eint_mask
-						+ bank->eint_offset);
-
-	clk_disable(bank->drvdata->pclk);
 }
 
-static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_data *drvdata,
-					   struct samsung_pin_bank *bank)
+void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for restoring state\n");
-		return;
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		/* exynosautov920 has eint_con_offset for all but one bank */
+		if (!bank->eint_con_offset)
+			exynos_pinctrl_resume(bank);
+
+		pr_debug("%s:     con %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->pctl_offset + bank->eint_con_offset),
+			       save->eint_con);
+		pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->pctl_offset +
+			       bank->eint_mask_offset), save->eint_mask);
+
+		writel(save->eint_con,
+		       regs + bank->pctl_offset + bank->eint_con_offset);
+		writel(save->eint_mask,
+		       regs + bank->pctl_offset + bank->eint_mask_offset);
 	}
-
-	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
-		 readl(regs + bank->pctl_offset + bank->eint_con_offset), save->eint_con);
-	pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
-		 readl(regs + bank->pctl_offset + bank->eint_mask_offset), save->eint_mask);
-
-	writel(save->eint_con, regs + bank->pctl_offset + bank->eint_con_offset);
-	writel(save->eint_mask, regs + bank->pctl_offset + bank->eint_mask_offset);
-
-	clk_disable(bank->drvdata->pclk);
-}
-
-void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
-{
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
 }
 
 static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drvdata)
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 33df21d5c9d61e852834031570d4a0ac0e51f6a4..35c2bc4ea488bda600ebfbda1492f5f49dbd9849 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -221,8 +221,10 @@ struct exynos_muxed_weint_data {
 
 int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d);
 int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d);
-void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata);
-void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata);
+void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
+void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
+void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
+void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 963060920301ec90affb2ee6d758d3d602ffb4a9..375634d8cc79d6533603e3eed562452181e2ee25 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1349,6 +1349,9 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 		const u8 *widths = bank->type->fld_width;
 		enum pincfg_type type;
 
+		if (drvdata->suspend)
+			drvdata->suspend(bank);
+
 		/* Registers without a powerdown config aren't lost */
 		if (!widths[PINCFG_TYPE_CON_PDN])
 			continue;
@@ -1373,8 +1376,6 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 
 	clk_disable(drvdata->pclk);
 
-	if (drvdata->suspend)
-		drvdata->suspend(drvdata);
 	if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
 		drvdata->retention_ctrl->enable(drvdata);
 
@@ -1406,9 +1407,6 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 		return ret;
 	}
 
-	if (drvdata->resume)
-		drvdata->resume(drvdata);
-
 	for (i = 0; i < drvdata->nr_banks; i++) {
 		struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
 		void __iomem *reg = bank->pctl_base + bank->pctl_offset;
@@ -1416,6 +1414,9 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 		const u8 *widths = bank->type->fld_width;
 		enum pincfg_type type;
 
+		if (drvdata->resume)
+			drvdata->resume(bank);
+
 		/* Registers without a powerdown config aren't lost */
 		if (!widths[PINCFG_TYPE_CON_PDN])
 			continue;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 371e4f02bbfb375964b7833beb9bbc098a51f4a3..e939e5bb0347458ae4a9014fd9657fc59c5c3994 100644
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
2.49.0.rc0.332.g42c0ae87b1-goog


