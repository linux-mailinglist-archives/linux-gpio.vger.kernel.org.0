Return-Path: <linux-gpio+bounces-18181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F34A79200
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 17:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80EA11894DD2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 15:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AC923E334;
	Wed,  2 Apr 2025 15:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wxVal7Ex"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA59323C8C3
	for <linux-gpio@vger.kernel.org>; Wed,  2 Apr 2025 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607066; cv=none; b=hDxk2onLAM3bDtnQPyBeRxncTMGsX7s40DOUqHP/M5kmUoomWf3bXYwp24yJtar0GgcyoSNXqXg+5vR5UKgqIsifZAOKu5EWir8iJKlVrVaUFiHgpRBs0Nlul8LTMmmkKsiuF1y02mtpKniFZIj9Fe1pTVaZ2SmvBCcheOhhaOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607066; c=relaxed/simple;
	bh=+vRNL7JjGCNtmJAbIRr10U3zF2K/nXrIo0wzFSbSVGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jQzBI1xC4N+akiFVBwFK7zRP6pzFQload+C/Wai5fq9d6aIX26vYikK5KFrNjqSMMC9baVyRZGHin2LYBcpjIJRSVDmLoU62yP3c2QP54eSvy7d1YQWm5RARP3sCNT8MQ2E0KkJJqIcKY8d241w+TqGbCJCk0eci+Fekh7EWn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wxVal7Ex; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3996af42857so751001f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Apr 2025 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607062; x=1744211862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJXyGFNl9SEsXCG7pRs0ciZjuv0V95H1dQUcXEiYOzY=;
        b=wxVal7ExN0noT6R+PU2x/ZEmro6It4O0+glZNA8U6MFnC90NjwxRAmw2WawtWxjxS6
         RxqlFPDOKYnbAJaAzTEZ9qr8C5pPz5uL+QYy+ujpTi5eCIUxZgWDAL682GpAAAQpQoX6
         NL3wj4v/Tn5gySqkUeKo7W87ojC7PfJIF8Z0/7xBE0Tu4YipRcIYQppYQ/kvywsWwFhd
         BLGiQ0jw9ClWN2yEqVHx28plaI71slkMF1MK6EknJYcAK4St8yOmnagXjKzft7fm68TU
         js4kHRUMM6SVrIQ9CYLX+rKaLHCd6KHTRUBNEO5qrHXZsgBThlFcQTjXU5nBpswOZTo1
         SBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607062; x=1744211862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJXyGFNl9SEsXCG7pRs0ciZjuv0V95H1dQUcXEiYOzY=;
        b=aN0FbLJuy012M5gj5DSouVNsshzgFDIb9HjEn0eF0ex9S+HtBBPSST6fRKY1NVAmWe
         xkNlzQeK71yoLAP9g97z0WF19OKKnIQDBTE9mKKxuTPM359+i18m54i35zkRIhs5cYz/
         1Lgnnb0kELJTFW7R5ZDN44ZSUFAOcPsyE0Wyx2VpCgz7wZxbmaE+BehGr+Di9tAMJfLk
         8a2MhZCMxCJAQQcM2ELE6w8/MtwpsjpGrS4eaqt/X56o3BsO5WLqTdarYbOUaLmc9Efr
         j66D2z7Vtz3VEgpQM6SyCSJAJU49rsF0GJyV4JJthhvGQ89Xd65vMInG/HurfNuGUyW8
         +xGA==
X-Forwarded-Encrypted: i=1; AJvYcCXydN6lGtNJg6b/eB8UQ6MIQJS4U8sqfuESf9djyrEZ8GrGHh00YMnsOf/0fQxkgnQLlwRNEZHYuRtt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6X2XI33gl4INXZK7K2Q4xw4eOV3NVBAj7H2A/3RiN65HJ/Sxt
	pp+yxcfVTOX+AFbQbLOW3mqVb+ZDQHuxVCYhybqFwbVsdQbnUBMSYdxDHNhrFaM=
X-Gm-Gg: ASbGncuTIXIzXYUu0opBVTqik5Ege5cmMTxgt7msg5zrfJ+VnNPg5IKRdZvEx5C40IY
	63tZxpViQW/CeV87rVKglYND5Z2OSXJFx6ahv2VE3dUUjccTT4ZcnGWtNU2ZtfrbV60KOAhHjN/
	AAfHBlMYvjd/3pdGRPfPc2mfJZS8+wfRzWnhE0wwa2rmpijztJfkPG4aNvEerpEVapEke9fN8Zb
	KdYk/lkLbg9qigmcZ9xrtUQ7wBNjCQvsjjy2kkcqjN9CM2ERlcKAoYddfx7JSjmhX9CQT1COPeZ
	7QK5FvmkiN+qj+AZw7z4WR4UCcJOHcdIwV6T4nYyarca+rkiXhjndhRw5O9JkVtZ5pJPmp0IKse
	AiyDjQROP
X-Google-Smtp-Source: AGHT+IGXFitwfRwQw8LcY87uDeDOkdepFnFOIZQ0PmBBCKyFhe/uyPZiGsOkZ5b44Pxx5/sBXlJP6g==
X-Received: by 2002:a5d:6d88:0:b0:391:865:5a93 with SMTP id ffacd0b85a97d-39c2a6a3e06mr2274333f8f.22.1743607061958;
        Wed, 02 Apr 2025 08:17:41 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:41 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 02 Apr 2025 16:17:32 +0100
Subject: [PATCH v6 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-3-78ce0d4eb30c@linaro.org>
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
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7439;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=+vRNL7JjGCNtmJAbIRr10U3zF2K/nXrIo0wzFSbSVGQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUPlcQ6xH1bRCUPq2XjXcbjl07iHX8ZEn0Xt
 nUnMLNbmP2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VDwAKCRDO6LjWAjRy
 uoo4EACS3wlPtSC+5jM+PNGrsaSxnHM/kS7RXO4f/aScP2JCK3jHkFsgH6li8eDpPtB1EQVHSr/
 sVx50HGvnfdVIOCT6YRtZ3U9wVD7XNAxv8TTw1bAY5oHMWP4lAc3HVOSqhiYJW+svlMFOz9vh1i
 7ysTZDh4MSoidu4IYVNtRhhsYhFD81jAWTSu6MTItdSgpcnq+xRCBRUUkBDHkqHrcmtk4QFoYD6
 SPDD/tFjI/E/tx/vRFKB5/F3xu6LM2pbzhDRhht9Z/JMLJ7fUbgPv6ZS9SInt0eZwgB6U22GLsU
 m7HxboSktZenp6KAKXxU9SAD4uTcq/9TVqzS5Fx1bS7BLoPGYqLoF0EDBPPXllXpuzQSA6AgnOB
 TNHnQNKd4q8gsqETj0KNB5r7A//kPufzaP4wchUQXGsKrkw7BTgWEqb1vEtZAklJtEDDWRBctOq
 4Dvhl5VpUw502xbZFt+5KGQ6mc3IL0i7vk5keRp8MHy5my6ei0LUiWL6qR/EnZ5GeNcQKuNl8do
 Pq1vBnoFiPB4pTckWY3wZqzRpMWZ0rYkA6TkUmWfzNjPuQOPySll9qS+j2hPbuEQxUZzVHysecQ
 Jwv41rr4UIbgvcY1LY3UIqgqVpxscwjxixUYIPcG98wwaUNa6Fc9Ry9DoumKSIH+3xVc3woA8Km
 SwdAmRANnD9s+fQ==
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
index 4b5d4e436a337ff13dee6ef740a1500eaf86cc12..9fd894729a7b87c3e144ff90921a1cadbde93d3d 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1762,15 +1762,15 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
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
@@ -1784,29 +1784,29 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
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
index 18c327f7e313355c4aba72f49a79b1697244f1ba..0879684338c772e484174a94ac2c274cc7d932ed 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -800,6 +800,41 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
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
@@ -819,6 +854,42 @@ void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
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
index 3a771862b4b1762b32f9e067b011e80cfebb99d2..2bee52b61b9317ff79c618c1dc53e98242805087 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -244,6 +244,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
+void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
+void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);

-- 
2.49.0.504.g3bcea36a83-goog


