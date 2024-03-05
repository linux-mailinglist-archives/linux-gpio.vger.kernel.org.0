Return-Path: <linux-gpio+bounces-4152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 146848729F3
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 23:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A4491F2B2AD
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 22:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2E512D1E6;
	Tue,  5 Mar 2024 22:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WK7oBzz2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C0012BEAE
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 22:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709676549; cv=none; b=hzCRP/26i/AMw7vumSMwRMjyZ7wDERHywNKDj+1LR/9gNAqfJeKFDrZdN67O0WVOHi/D+qQ+fg6dVqjsXRo/KNoet6W+FYrhrtYyaKHDaAb3r+xlQ5WuNuP92NFMIpU5mpSDnL/oQ/MDTEKF4JTm6yeeML1F1yis8O6g48hAQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709676549; c=relaxed/simple;
	bh=4VOQRGGNHn1IIn1ZLijQZp7r692vBrmcK7QdIWSs1SY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pz60j3KbR/3LNlGODe8pisykqCvjlmDVbeIBS7E5xfYsKPm6YFxyJf8QxSgEEUi03PzjU88J5tni98e0dk0veGmhheWs4A4FYWpmxQuxuwQRkytLispPCm9jFfzCMSgIBt9a4za0Fs2t81XoNc9sKANWcWHHhsYy27MTBjx50+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WK7oBzz2; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-563c595f968so9177524a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 14:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709676545; x=1710281345; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CC57Ga2RfJHq8c2gt6LVOSgDiInTgnW/cliHh+GC8aw=;
        b=WK7oBzz2Ocd9/my31zFxMSDp2ALblqzrOMB7wp1RFHtn6ci8iSvrBF+EoOflVMm2Hn
         XxnA2MP10dUns9zrtiPTD7dtrFkdlwCzl6lopXYWC4OlrVVKZqULc6tBIi46a5B7IU4f
         /oMqdtYCoSQcZkZ37qpyA4Fic+YEc476M3hu020JVgIvjdCgqLMpIDr2UaZcOJrx8aa2
         98ilO4aUjsm2JCdtiN3ctgLYGk++iNheHv0Q+BcAVCEiArhjdNkR45phtHplgd6bFlbZ
         FTniGIV5z7Hx7Uw8qguv/oXJvxZLsNnl5SyP01BBrsfJoZKU13sD4CDehIPGXzheps77
         Slcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709676545; x=1710281345;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CC57Ga2RfJHq8c2gt6LVOSgDiInTgnW/cliHh+GC8aw=;
        b=RcrvyrLCm9zsPaVw1ASrexOXH+0TYFOENAZQju+rg/8FUoHEBepTruh+BFktIu19P6
         vwIN0cecSglJ51XkxjGNrtREvPpuUbSOh7yplzX2kv+Mi9X3tK03mNsNJeVq+eGDZtH+
         odKw9AsmdJMZfNaGZ4gc1SalscKP2uo156EJr0+9KUHhe0cH36/ummoIsdaF3DgeIY2E
         LvFLz1gv3mQWHZ/4WUXTv12zFfdmZvDwLv4Tmp/vQ/CfQ+Y9D2j3MYv0Bea54fKqZXvM
         wxYPtK/ARMvvYpwReqPxskJqk0CKgfJNU0OByPY0/SvK7n4o43fYwGSDFraTJW6b08AJ
         OX+g==
X-Gm-Message-State: AOJu0YxIhvcj2LOZAQh8aNGZAtlWcgzluAQ7xYGhXLGQ4TcAFcTsF2Rk
	dkGvDqDtY9lAkyz5hDmIPljafAemT0cPUBhP6mPPNrOHL2Cxypa5vBc3Jza375Y=
X-Google-Smtp-Source: AGHT+IEo8A/wfv3+6WPTlCHO78rl8zXspUcWcUBCZ0a/vDmbcIa7EM3hX02B3xVcKalYWucwE3nfKw==
X-Received: by 2002:a17:906:f35b:b0:a43:fb64:e21d with SMTP id hg27-20020a170906f35b00b00a43fb64e21dmr10769982ejb.7.1709676545257;
        Tue, 05 Mar 2024 14:09:05 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id s21-20020a170906355500b00a44dfaf84f4sm4193652eja.153.2024.03.05.14.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 14:09:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 05 Mar 2024 23:09:04 +0100
Subject: [PATCH v2] gpio: nomadik: Back out some managed resources
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240305-fix-nomadik-gpio-v2-1-e5d1fbdc3f5c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAP+X52UC/32NTQrCMBCFr1Jm7Uh+rBZX3kO6CGaaDmpSJhKUk
 rsbewA3D77H+1khkzBlOHcrCBXOnGIDs+vgNrsYCNk3BqPMQVnV48RvjOnpPN8xLJywV5Px3jv
 XFFptEWqZbfI6Np45v5J8toeif+6fsaJR48nqoyHr7DDQ5cHRSdonCTDWWr+IuUFSsQAAAA==
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

Several commits introduce managed resources (devm_*) into the
nmk_gpio_populate_chip() function.

This isn't always working because when called from the Nomadik pin
control driver we just want to populate some states for the device as
the same states are used by the pin control driver.

Some managed resources such as devm_kzalloc() etc will work, as the
passed in platform device will be used for lifecycle management,
but in some cases where we used the looked-up platform device
for the GPIO block, this will cause problems for the combined
pin control and GPIO driver, because it adds managed resources
to the GPIO device before it is probed, which is something that
the device core will not accept, and all of the GPIO blocks will
refuse to probe:

platform 8012e000.gpio: Resources present before probing
platform 8012e080.gpio: Resources present before probing
(...)

Fix this by not tying any managed resources to the looked-up
gpio_pdev/gpio_dev device, let's just live with the fact that
these need imperative resource management for now.

Drop in some notes and use a local *dev variable to clarify the
code.

Cc: Théo Lebrun <theo.lebrun@bootlin.com>
Fixes: 12410e95903c ("gpio: nomadik: use devm_platform_ioremap_resource() helper")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Fix all the errorpaths.
- I did consider using the goto pattern, but the PTR_CAST() cases
  make it just uglier: we have to cast pointers to integers and back
  to pointers to return them in a goto :/
- Add some missing platform_device_put():s on some errorpaths.
- use PTR_CAST() instead of (void *) cast in one site.
- Link to v1: https://lore.kernel.org/r/20240305-fix-nomadik-gpio-v1-1-73162e3a388e@linaro.org
---
 drivers/gpio/gpio-nomadik.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 483086deb397..e744beafdd00 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -509,9 +509,11 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 {
 	struct nmk_gpio_chip *nmk_chip;
 	struct platform_device *gpio_pdev;
+	struct device *dev = &pdev->dev;
 	struct reset_control *reset;
 	struct device *gpio_dev;
 	struct gpio_chip *chip;
+	struct resource *res;
 	struct clk *clk;
 	void __iomem *base;
 	u32 id, ngpio;
@@ -519,13 +521,13 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 
 	gpio_dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
 	if (!gpio_dev) {
-		dev_err(&pdev->dev, "populate \"%pfwP\": device not found\n", fwnode);
+		dev_err(dev, "populate \"%pfwP\": device not found\n", fwnode);
 		return ERR_PTR(-ENODEV);
 	}
 	gpio_pdev = to_platform_device(gpio_dev);
 
 	if (device_property_read_u32(gpio_dev, "gpio-bank", &id)) {
-		dev_err(&pdev->dev, "populate: gpio-bank property not found\n");
+		dev_err(dev, "populate: gpio-bank property not found\n");
 		platform_device_put(gpio_pdev);
 		return ERR_PTR(-EINVAL);
 	}
@@ -539,7 +541,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	}
 #endif
 
-	nmk_chip = devm_kzalloc(&pdev->dev, sizeof(*nmk_chip), GFP_KERNEL);
+	nmk_chip = devm_kzalloc(dev, sizeof(*nmk_chip), GFP_KERNEL);
 	if (!nmk_chip) {
 		platform_device_put(gpio_pdev);
 		return ERR_PTR(-ENOMEM);
@@ -547,7 +549,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 
 	if (device_property_read_u32(gpio_dev, "ngpios", &ngpio)) {
 		ngpio = NMK_GPIO_PER_CHIP;
-		dev_dbg(&pdev->dev, "populate: using default ngpio (%d)\n", ngpio);
+		dev_dbg(dev, "populate: using default ngpio (%d)\n", ngpio);
 	}
 
 	nmk_chip->is_mobileye_soc = device_is_compatible(gpio_dev,
@@ -559,24 +561,31 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	chip->label = dev_name(gpio_dev);
 	chip->parent = gpio_dev;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	/* NOTE: different devices! No devm_platform_ioremap_resource() here! */
+	res = platform_get_resource(gpio_pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base)) {
 		platform_device_put(gpio_pdev);
 		return ERR_CAST(base);
 	}
 	nmk_chip->addr = base;
 
-	clk = devm_clk_get_optional(gpio_dev, NULL);
+	/* NOTE: do not use devm_ here! */
+	clk = clk_get_optional(gpio_dev, NULL);
 	if (IS_ERR(clk)) {
 		platform_device_put(gpio_pdev);
-		return (void *)clk;
+		return ERR_CAST(clk);
 	}
 	clk_prepare(clk);
 	nmk_chip->clk = clk;
 
-	reset = devm_reset_control_get_optional_shared(gpio_dev, NULL);
+	/* NOTE: do not use devm_ here! */
+	reset = reset_control_get_optional_shared(gpio_dev, NULL);
 	if (IS_ERR(reset)) {
-		dev_err(&pdev->dev, "failed getting reset control: %ld\n",
+		clk_unprepare(clk);
+		clk_put(clk);
+		platform_device_put(gpio_pdev);
+		dev_err(dev, "failed getting reset control: %ld\n",
 			PTR_ERR(reset));
 		return ERR_CAST(reset);
 	}
@@ -588,7 +597,11 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	 */
 	ret = reset_control_deassert(reset);
 	if (ret) {
-		dev_err(&pdev->dev, "failed reset deassert: %d\n", ret);
+		reset_control_put(reset);
+		clk_unprepare(clk);
+		clk_put(clk);
+		platform_device_put(gpio_pdev);
+		dev_err(dev, "failed reset deassert: %d\n", ret);
 		return ERR_PTR(ret);
 	}
 

---
base-commit: caddc92c57451d983c7e31e60b961c5aae4ece63
change-id: 20240305-fix-nomadik-gpio-50f2dddaa2dd

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


