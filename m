Return-Path: <linux-gpio+bounces-21870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B849AE034E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 13:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 193B31880518
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 11:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9FB22D7B3;
	Thu, 19 Jun 2025 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ax6ozNZk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7A8225407
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331908; cv=none; b=ovcb0lJt70nV6JckZaAR8E4lb+S2sk1vc3PVDhG3wK2yHKv0x7ie3CMOWkzJbopUp25s/bOJE3rLkdy8CnRapuXrO1z3U7RfS6ZI4GGqDlVLq/x423GQEDckDcFEvMNFwJb3Ug5dIVAAdet3CpaUvrN9dyKKUttCg6Sxzi7IB5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331908; c=relaxed/simple;
	bh=j9f4wXZ5t2XAXanEUVHD87/RaArxaKnhipZYlfXpsp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpI6xlNaTbAMyoXK7KO1rQN36N8RPiwppkPl22Q8jrBRmsn81PNLmcdRq022JfbUAxxUgEz8U1i0ltHx5kc/c+sY6QlsAR7Iql4Ac6a3nSx8fT0z7RRSeBVW9xfSytPTaZflGfUER1gyAOOJ6Po5H3UXZ5HQqF4YqEqJZmRvwhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ax6ozNZk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4530921461aso5611915e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 04:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750331904; x=1750936704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMUcd+uc6x7A0V+vwngRDv9JY2fGk9HpiID8xT5aBxk=;
        b=Ax6ozNZkEw9/kaukGmHoljLccq9kKiPYGdAPGFTQZQafEwx9dSaJ+GGW8tyKcXkfWC
         71G40rrm3n087lY7jt7DtNJATpRHDHkmSJeYio0kgtwWmy8mYLiCc7jiotKR5400eCA6
         PtN2yLo763ev5oLoKK4n/XEssktwx5wFgaSEicU6V1AZGBH6j0D3z9SstXOO8INUkq3G
         +4QyeTFG1kJuQkUW3Q5Gp2HpaMvktcv/NrwiVrGxp/LbS1koAMntl7jMGwq8mM+PNkrV
         aeCfQe1NsMTYnDQwQUTNMMpRJzLv3wK6bcKSKuQHjMRwFek9FwLYZ7SYvDEUWkceQpET
         TI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331904; x=1750936704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMUcd+uc6x7A0V+vwngRDv9JY2fGk9HpiID8xT5aBxk=;
        b=jwCYsjSmZJ/Vvdq2FvGVe+dy/dYU0ujKvnL3Wo+BHRN6rQoaV+vhLdXKSCHPmCcWy8
         VHNtnNiCYnKrVR/ZbQt586nfMfFNO5oQnEVA/YVseCu4bs9AnPqj9RSh012g8MnyFGeU
         7vqFzdrOQ0U+6n1sSzU0Q1l8fV+S9BMm45QL6IEqzHvT5pCfGPqQjj43sO06z/b379i1
         6jQbnVY45uhDxiYhsjQiig59pu8TCg/n72tIzGKD6NFiG86KMGH2C1LBBGRoCXkvwYG+
         w2YqK2bYYNKma7RAAX/helWrW5owUWYCDUIg69qZxZWtH+KlDRHK0udzEAcL6F8VSduu
         KopQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiQ/0Ypljw+nYHIXl/zegptJi37p/yBph6HRqIQ3NeDmTG9+BxQKviDq4ib6xLey4xCL10T2YKg0um@vger.kernel.org
X-Gm-Message-State: AOJu0YyIDyRnw2L/npduOIktxWOMb3ftT44dJinsNACwI61/hG3ODqAF
	WSBsXoQNywmoHc9Uey5BowTAFTNFy7muxOP/LTyPgmo868s/EzDVGsSlqqcttb8tC8I=
X-Gm-Gg: ASbGncsk17/3Q4d518j40Ft6e9CcWmDE7ttqxHahthqi5NF/XTjMvmhAxz+Hz+XekQ3
	JEwjyEkVVe5aHPC2OPmBb5A5bTYPD52wIl8G+uP4wLEaMdgplasYYTwO1nllFxQFRaLa9E/5EBE
	OLoN/Tlt9m8rAGVKpmhMXqPJ/pUYiHZzVQ9WxxdKvyQTQTdUKTsP2Wzwii+hy7Fpewp71teLt/w
	5X72hCZrrKB3gb+RunDkim5PtZkmDiDz/HaQbmlLqGtPC/yP2MJIvI9nlhwFXt8eJv3WtDRl0iP
	WI4W0+o3ItvE2ysauqW7GdUITH8BbJHk+7r0n7aZhc9LhzFncncRFYQYWMgWoevu3Yd6vnfaubz
	SvteSnGv8ltNmiBFy
X-Google-Smtp-Source: AGHT+IHXC9m/G66bF/j2zVUcnh79iZzXUelb2IKow1oIvzi/jXHpfEEk8DwwwTODVwdjkhjcCEbU5w==
X-Received: by 2002:a05:600c:c16b:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-4533ca4f7a8mr249968725e9.10.1750331904336;
        Thu, 19 Jun 2025 04:18:24 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c41sm25674375e9.26.2025.06.19.04.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:18:23 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 19 Jun 2025 12:18:16 +0100
Subject: [PATCH 2/2] pinctrl: samsung: add support for gs101 wakeup mask
 programming
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gs101-eint-mask-v1-2-89438cfd7499@linaro.org>
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11274;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=j9f4wXZ5t2XAXanEUVHD87/RaArxaKnhipZYlfXpsp0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoU/H85R2STeaGxf/g8N5+OSppReVJEiMVaK+QH
 V+YI1kMNIaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaFPx/AAKCRDO6LjWAjRy
 ujbtEACiHziINKlZmSDXFqQHFR0qoqADQ5IRfyK+ZbTNIiew+C3DOq6TfZ1k/Rr4FGucWWzbGkM
 SWlqF3y5DxjKhjbFwcKiq4E/XOID/AQFmiv0N3hIAEv6oyuhWz3i9QWIZ/Sw06dY8gfDutjAIf8
 rNFUso0BWO9sRB8sO5lOXVtTGf1dlZPte0262TQ1FeQBZmzCycMPgOT5oKJI9ekTVX4buG4YfP/
 /OxGkQxV856LuJ9lJM2n2m8gB4xkfJOYEevdqLTwz07UF7gN9KD6wlG6Fsi71OCSf1SJqmL4fky
 XIpS1uFw4xV325LqPk15erH1CFe3IwOtjobUh5VKgxuBzTm47p7oRjqQA4FFqIzmhD62twY+73B
 9svq3w+VzD/bo4IsincVxXlCTsp4uJMLegABZibE+Nh9BX+jUoW9nO6HkH7/Zy7mVD3wW6xnioI
 /4XxLP5arVzfHx9cLDU55YlrrdzaILVLGH7e8DA7vBxJJzVdfmCL0HslDG1H2/0fM0Yjcnj1lRh
 7OaaXPiABRwBVSJQh2wcd0CQMhhiqXUGWszSAWFl6zkQODLbHwLIjamuYfoBLHN8PEiCjWgk5jx
 E8Q2xdKPK3UL6DqICCjcWnGsSwXTdDhq0c3tcfpF5m47ql892DoV/MeFIXPdcL8rvtsguqj9Asm
 /e9CFz8neGAxEwg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gs101 differs to other currently supported SoCs in that it has 3 wakeup
mask registers for the 67 external wakeup interrupt pins in alive and
far_alive.

EINT_WAKEUP_MASK  0x3A80 EINT[31:0]
EINT_WAKEUP_MASK2 0x3A84 EINT[63:32]
EINT_WAKEUP_MASK3 0x3A88 EINT[66:64]

Add gs101 specific callbacks and a dedicated gs101_wkup_irq_chip struct to
handle these differences.

The current wakeup mask with upstream is programmed as
WAKEUP_MASK0[0x3A80] value[0xFFFFFFFF]
WAKEUP_MASK1[0x3A84] value[0xF2FFEFFF]
WAKEUP_MASK2[0x3A88] value[0xFFFFFFFF]

Which corresponds to the following wakeup sources:
gpa7-3  vol down
gpa8-1  vol up
gpa10-1 power
gpa8-2  typec-int

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c    | 100 ++++++++++++++++++++++++----
 drivers/pinctrl/samsung/pinctrl-samsung.h   |   4 ++
 include/linux/soc/samsung/exynos-regs-pmu.h |   1 +
 3 files changed, 91 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index f3e1c11abe55032ee4ed7eb4db861dbb1e60c2bf..5554768d465fe0d8bf6e423b2e835965cde5d8f5 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -32,18 +32,24 @@
 #include "pinctrl-samsung.h"
 #include "pinctrl-exynos.h"
 
+#define MAX_WAKEUP_REG 3
+
 struct exynos_irq_chip {
 	struct irq_chip chip;
 
 	u32 eint_con;
 	u32 eint_mask;
 	u32 eint_pend;
-	u32 *eint_wake_mask_value;
+	u32 eint_num_wakeup_reg;
 	u32 eint_wake_mask_reg;
 	void (*set_eint_wakeup_mask)(struct samsung_pinctrl_drv_data *drvdata,
 				     struct exynos_irq_chip *irq_chip);
 };
 
+static u32 eint_wake_mask_values[MAX_WAKEUP_REG] = { EXYNOS_EINT_WAKEUP_MASK_DISABLED,
+						     EXYNOS_EINT_WAKEUP_MASK_DISABLED,
+						     EXYNOS_EINT_WAKEUP_MASK_DISABLED};
+
 static inline struct exynos_irq_chip *to_exynos_irq_chip(struct irq_chip *chip)
 {
 	return container_of(chip, struct exynos_irq_chip, chip);
@@ -307,7 +313,7 @@ static const struct exynos_irq_chip exynos_gpio_irq_chip __initconst = {
 	.eint_con = EXYNOS_GPIO_ECON_OFFSET,
 	.eint_mask = EXYNOS_GPIO_EMASK_OFFSET,
 	.eint_pend = EXYNOS_GPIO_EPEND_OFFSET,
-	/* eint_wake_mask_value not used */
+	/* eint_wake_mask_values not used */
 };
 
 static int exynos_eint_irq_map(struct irq_domain *h, unsigned int virq,
@@ -467,10 +473,55 @@ __init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 	return ret;
 }
 
+#define BITS_PER_U32 32
+static int gs101_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
+{
+	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
+	struct samsung_pinctrl_drv_data *d = bank->drvdata;
+	u32 bit, wakeup_reg, shift;
+
+	bit = bank->eint_num + irqd->hwirq;
+	wakeup_reg = bit / BITS_PER_U32;
+	shift = bit - (wakeup_reg * BITS_PER_U32);
+
+	if (!on)
+		eint_wake_mask_values[wakeup_reg] |= BIT_U32(shift);
+	else
+		eint_wake_mask_values[wakeup_reg] &= ~BIT_U32(shift);
+
+	dev_info(d->dev, "wake %s for irq %d\n", str_enabled_disabled(on),
+		 irqd->irq);
+
+	return 0;
+}
+
+static void
+gs101_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
+				   struct exynos_irq_chip *irq_chip)
+{
+	struct regmap *pmu_regs;
+
+	if (!drvdata->retention_ctrl || !drvdata->retention_ctrl->priv) {
+		dev_warn(drvdata->dev,
+			 "No PMU syscon available. Wake-up mask will not be set.\n");
+		return;
+	}
+
+	pmu_regs = drvdata->retention_ctrl->priv;
+
+	dev_dbg(drvdata->dev, "Setting external wakeup interrupt mask:\n");
+
+	for (int i = 0; i < irq_chip->eint_num_wakeup_reg; i++) {
+		dev_dbg(drvdata->dev, "\tWAKEUP_MASK%d[0x%X] value[0x%X]\n",
+			i, irq_chip->eint_wake_mask_reg + i * 4,
+			eint_wake_mask_values[i]);
+		regmap_write(pmu_regs, irq_chip->eint_wake_mask_reg + i * 4,
+			     eint_wake_mask_values[i]);
+	}
+}
+
 static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(irqd);
-	struct exynos_irq_chip *our_chip = to_exynos_irq_chip(chip);
 	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
 	unsigned long bit = 1UL << (2 * bank->eint_offset + irqd->hwirq);
 
@@ -478,9 +529,9 @@ static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
 		irqd->irq, bank->name, irqd->hwirq);
 
 	if (!on)
-		*our_chip->eint_wake_mask_value |= bit;
+		eint_wake_mask_values[0] |= bit;
 	else
-		*our_chip->eint_wake_mask_value &= ~bit;
+		eint_wake_mask_values[0] &= ~bit;
 
 	return 0;
 }
@@ -500,10 +551,10 @@ exynos_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
 	pmu_regs = drvdata->retention_ctrl->priv;
 	dev_info(drvdata->dev,
 		 "Setting external wakeup interrupt mask: 0x%x\n",
-		 *irq_chip->eint_wake_mask_value);
+		 eint_wake_mask_values[0]);
 
 	regmap_write(pmu_regs, irq_chip->eint_wake_mask_reg,
-		     *irq_chip->eint_wake_mask_value);
+		     eint_wake_mask_values[0]);
 }
 
 static void
@@ -522,11 +573,10 @@ s5pv210_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
 
 	clk_base = (void __iomem *) drvdata->retention_ctrl->priv;
 
-	__raw_writel(*irq_chip->eint_wake_mask_value,
+	__raw_writel(eint_wake_mask_values[0],
 		     clk_base + irq_chip->eint_wake_mask_reg);
 }
 
-static u32 eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED;
 /*
  * irq_chip for wakeup interrupts
  */
@@ -544,7 +594,7 @@ static const struct exynos_irq_chip s5pv210_wkup_irq_chip __initconst = {
 	.eint_con = EXYNOS_WKUP_ECON_OFFSET,
 	.eint_mask = EXYNOS_WKUP_EMASK_OFFSET,
 	.eint_pend = EXYNOS_WKUP_EPEND_OFFSET,
-	.eint_wake_mask_value = &eint_wake_mask_value,
+	.eint_num_wakeup_reg = 1,
 	/* Only differences with exynos4210_wkup_irq_chip: */
 	.eint_wake_mask_reg = S5PV210_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = s5pv210_pinctrl_set_eint_wakeup_mask,
@@ -564,7 +614,7 @@ static const struct exynos_irq_chip exynos4210_wkup_irq_chip __initconst = {
 	.eint_con = EXYNOS_WKUP_ECON_OFFSET,
 	.eint_mask = EXYNOS_WKUP_EMASK_OFFSET,
 	.eint_pend = EXYNOS_WKUP_EPEND_OFFSET,
-	.eint_wake_mask_value = &eint_wake_mask_value,
+	.eint_num_wakeup_reg = 1,
 	.eint_wake_mask_reg = EXYNOS_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = exynos_pinctrl_set_eint_wakeup_mask,
 };
@@ -583,7 +633,7 @@ static const struct exynos_irq_chip exynos7_wkup_irq_chip __initconst = {
 	.eint_con = EXYNOS7_WKUP_ECON_OFFSET,
 	.eint_mask = EXYNOS7_WKUP_EMASK_OFFSET,
 	.eint_pend = EXYNOS7_WKUP_EPEND_OFFSET,
-	.eint_wake_mask_value = &eint_wake_mask_value,
+	.eint_num_wakeup_reg = 1,
 	.eint_wake_mask_reg = EXYNOS5433_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = exynos_pinctrl_set_eint_wakeup_mask,
 };
@@ -599,13 +649,31 @@ static const struct exynos_irq_chip exynosautov920_wkup_irq_chip __initconst = {
 		.irq_request_resources = exynos_irq_request_resources,
 		.irq_release_resources = exynos_irq_release_resources,
 	},
-	.eint_wake_mask_value = &eint_wake_mask_value,
+	.eint_num_wakeup_reg = 1,
 	.eint_wake_mask_reg = EXYNOS5433_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = exynos_pinctrl_set_eint_wakeup_mask,
 };
 
+static const struct exynos_irq_chip gs101_wkup_irq_chip __initconst = {
+	.chip = {
+		.name = "gs101_wkup_irq_chip",
+		.irq_unmask = exynos_irq_unmask,
+		.irq_mask = exynos_irq_mask,
+		.irq_ack = exynos_irq_ack,
+		.irq_set_type = exynos_irq_set_type,
+		.irq_set_wake = gs101_wkup_irq_set_wake,
+		.irq_request_resources = exynos_irq_request_resources,
+		.irq_release_resources = exynos_irq_release_resources,
+	},
+	.eint_num_wakeup_reg = 3,
+	.eint_wake_mask_reg = GS101_EINT_WAKEUP_MASK,
+	.set_eint_wakeup_mask = gs101_pinctrl_set_eint_wakeup_mask,
+};
+
 /* list of external wakeup controllers supported */
 static const struct of_device_id exynos_wkup_irq_ids[] = {
+	{ .compatible = "google,gs101-wakeup-eint",
+			.data = &gs101_wkup_irq_chip },
 	{ .compatible = "samsung,s5pv210-wakeup-eint",
 			.data = &s5pv210_wkup_irq_chip },
 	{ .compatible = "samsung,exynos4210-wakeup-eint",
@@ -688,6 +756,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static int eint_num;
 /*
  * exynos_eint_wkup_init() - setup handling of external wakeup interrupts.
  * @d: driver data of samsung pinctrl driver.
@@ -736,6 +805,9 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 			return -ENXIO;
 		}
 
+		bank->eint_num = eint_num;
+		eint_num = eint_num + bank->nr_pins;
+
 		if (!fwnode_property_present(bank->fwnode, "interrupts")) {
 			bank->eint_type = EINT_TYPE_WKUP_MUX;
 			++muxed_banks;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index fcc57c244d167db1de8c7aceffa6a9e7484bf348..1cabcbe1401a614ea33803132db776e97c1d56ee 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -141,6 +141,7 @@ struct samsung_pin_bank_type {
  * @eint_type: type of the external interrupt supported by the bank.
  * @eint_mask: bit mask of pins which support EINT function.
  * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
+ * @eint_num: total number of eint pins.
  * @eint_con_offset: ExynosAuto SoC-specific EINT control register offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
@@ -156,6 +157,7 @@ struct samsung_pin_bank_data {
 	enum eint_type	eint_type;
 	u32		eint_mask;
 	u32		eint_offset;
+	u32		eint_num;
 	u32		eint_con_offset;
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
@@ -174,6 +176,7 @@ struct samsung_pin_bank_data {
  * @eint_type: type of the external interrupt supported by the bank.
  * @eint_mask: bit mask of pins which support EINT function.
  * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
+ * @eint_num: total number of eint pins.
  * @eint_con_offset: ExynosAuto SoC-specific EINT register or interrupt offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
@@ -201,6 +204,7 @@ struct samsung_pin_bank {
 	enum eint_type	eint_type;
 	u32		eint_mask;
 	u32		eint_offset;
+	u32		eint_num;
 	u32		eint_con_offset;
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 1a2c0e0838f99821151661878f022f2129a0c19b..938c6db235fb00b1245ab2aa44a094f163b6b84b 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -669,6 +669,7 @@
 #define GS101_CPU_INFORM(cpu)	\
 			(GS101_CPU0_INFORM + (cpu*4))
 #define GS101_SYSTEM_CONFIGURATION				(0x3A00)
+#define GS101_EINT_WAKEUP_MASK					(0x3A80)
 #define GS101_PHY_CTRL_USB20					(0x3EB0)
 #define GS101_PHY_CTRL_USBDP					(0x3EB4)
 

-- 
2.50.0.rc2.701.gf1e915cc24-goog


