Return-Path: <linux-gpio+bounces-1848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D11C181D63D
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Dec 2023 20:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CBC0B218E5
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Dec 2023 19:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62B513ACC;
	Sat, 23 Dec 2023 19:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gH582sO3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBF71401A
	for <linux-gpio@vger.kernel.org>; Sat, 23 Dec 2023 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a233bf14cafso344988266b.2
        for <linux-gpio@vger.kernel.org>; Sat, 23 Dec 2023 11:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703359145; x=1703963945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dl+++DRdm00PXx9jJ+9cB6WjPEZdIF4coFJBY+INy5g=;
        b=gH582sO3vvVGnFqahMl7hOz6g6iud0pu0gXIXakkJCQbwX+oXD/uuKt6ZmokPVpTaX
         Vkp44aWlEGPwPrhQ8VavKUaDZ7vRMExPSLIDU2CSBa5mGFZ4bbaVOxvZ1BOybHUtxLbP
         c4JIyU/Ev+JK0RDmWmw6iVRo8xUfk9uWugxlSR+2gbGV4LdLo9TkOJM2nD5KP2ibZcdA
         Sr5Yspfcr69UxE607bDNJuL7UAG0VhFTqe6Ry0FeodVyk03tluTQjj9YfTay363BXrPc
         ebbsgM8k9j1F0GBvLHjdHNwumYjMlVKXBZbyUA7b8cr3oZlX3fED95vpZhQIc8Ln2Pga
         psKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703359145; x=1703963945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dl+++DRdm00PXx9jJ+9cB6WjPEZdIF4coFJBY+INy5g=;
        b=Lt6okhDFEOyff+1HFcweVXl56cgnCcFRn80Hy34gS1S+BRCAyOBYJvJn2swzC8mSYF
         4HA2FoeZ84H8LFtF6U6mc1SVuBTYEzCrLwaBrb8YIYjy9l9KyL0gSdBzbKUAAru2H6Kk
         YUvdWz+w+OKFMDZExAPXOaEpxN6G4o2V6I7O4iBMy5vtgBmjBOuNVDJNuN4GfKkGoZXB
         GEq8ypj281IzkADFLqC3Msz+SOa3T4pPlBxCfG9m1Y+WT7HymsAXJOi91LNw9j966aiI
         0jbpFg/roa43Sr+fEu2W3PneFaH170gR3OmlAemPAHFK6aHwj5UcX50X2vxf2YQxY0Bp
         MWZA==
X-Gm-Message-State: AOJu0YwiHcBqbVatM1TTC7Bmp2KHo8zN6Ipdoufy17L3LmXnz1rtjAto
	owb+2chp/81XWPfGftSCwjSCb5lRlzylDQ==
X-Google-Smtp-Source: AGHT+IFTnnh0k8o1Ulu+wZ6pXsn6Fbgloq5p6tPXvLGXwAjvJ/OEjsTKUixyPvU+j9hVX44R89PSzw==
X-Received: by 2002:a17:906:364d:b0:a23:3399:31c4 with SMTP id r13-20020a170906364d00b00a23339931c4mr1621067ejb.120.1703359145101;
        Sat, 23 Dec 2023 11:19:05 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id cl2-20020a170906c4c200b00a19afc16d23sm3278613ejb.104.2023.12.23.11.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 11:19:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomasz Figa <tomasz.figa@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: samsung: constify iomem pointers
Date: Sat, 23 Dec 2023 20:19:02 +0100
Message-Id: <20231223191902.22857-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Constify few pointers to iomem, where the destination memory is not
modified, for code safety and readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 4 ++--
 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index d3d4b5d036c8..871c1eb46ddf 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -693,7 +693,7 @@ static void exynos_pinctrl_suspend_bank(
 				struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
-	void __iomem *regs = bank->eint_base;
+	const void __iomem *regs = bank->eint_base;
 
 	save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
 						+ bank->eint_offset);
@@ -714,7 +714,7 @@ static void exynosauto_pinctrl_suspend_bank(struct samsung_pinctrl_drv_data *drv
 					    struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
-	void __iomem *regs = bank->eint_base;
+	const void __iomem *regs = bank->eint_base;
 
 	save->eint_con = readl(regs + bank->pctl_offset + bank->eint_con_offset);
 	save->eint_mask = readl(regs + bank->pctl_offset + bank->eint_mask_offset);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index dbf38767f15f..ed07e23e0912 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -565,7 +565,7 @@ static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 /* gpiolib gpio_get callback function */
 static int samsung_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	void __iomem *reg;
+	const void __iomem *reg;
 	u32 data;
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	const struct samsung_pin_bank_type *type = bank->type;
@@ -1204,7 +1204,7 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 
 	for (i = 0; i < drvdata->nr_banks; i++) {
 		struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
-		void __iomem *reg = bank->pctl_base + bank->pctl_offset;
+		const void __iomem *reg = bank->pctl_base + bank->pctl_offset;
 		const u8 *offs = bank->type->reg_offset;
 		const u8 *widths = bank->type->fld_width;
 		enum pincfg_type type;
-- 
2.34.1


