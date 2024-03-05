Return-Path: <linux-gpio+bounces-4130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E7F871838
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 09:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BF4C1F2254F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 08:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596B07F47A;
	Tue,  5 Mar 2024 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DV1AKP3I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC2B7B3E7
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709627199; cv=none; b=fBZsDHQUH1UlmqcWXtTSmqo3aQ8ARfN96t155XqHQVH8E+iV1jyaCn4PycSzBDGLK6/+NPmJsElbSnb88Hl8ISt2BI7+GCMLlBuQkUtr5/bNeKUTA2ppc4yb5RYN8k5fMm5TilEAR84UNASLJezsxt9hIgoxa13+AfKmjdyAADI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709627199; c=relaxed/simple;
	bh=5FvrQI3nb24c4cBtE1AD3+QcnePFRYQxnA9iQaS7VZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K7/TZHNC9DKM6tCq02deJ+9NIFZGTd9ATmwRpHbiTtnzvup1k0P/UmFH5Jd6Fniwmf2kxcek/PNyJtvUucCdo6F6o4V22+2YdP10AzHWoOAmzDC1/Ny0kfKOnAhCCExZWjiyOe4XmWWKiv3Iay1yh57TjKV6WMxc6Ej3HypzB70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DV1AKP3I; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5649c25369aso7563682a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 00:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709627195; x=1710231995; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhQnfn1wdqMWGFXvLLnPFMPVdYmIy3X2weY0l67X4EA=;
        b=DV1AKP3ISh3eC4QhKIUVLTyoncw1AGDiW0DCW/aOostitld5s2GXE/SxmaZNRXxYXR
         AHFqg2+7A6gb0Pn95xJj4oIQ6GFrVsGupBktCkuvh5yv0rZSQOZ2sBGaa6d5reic6TnQ
         XqNj/3zmI98wI7hkTHk8gBiiJvswGxImANlzP806OSWbLf+W9J6z6N6OGfmr1f/9bX7U
         hkbVCI03Zjsu/Ku17zEgREyUDLcXBnhNvwpIlDnP+TdB7EXaS8nvTiz+yiQ8IXvBtCXP
         VIrmQRDV06TLX3+w6dB0ILuEZjUzHwG5yb4MntXZkAEkpjaAjwjV0I7QVzpB0YN93/RK
         6fKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709627195; x=1710231995;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhQnfn1wdqMWGFXvLLnPFMPVdYmIy3X2weY0l67X4EA=;
        b=H6cTZnZ1nyYWlkX2sL+CyTw15I3PAVWjUgVZViTwIXriF9ePrCSUFUFurFLNH323Zt
         Girv6S7vS4KEedN+8Vx6hFLd2fbNDjJ1Jrt9Fgj5w5CwjkayO62Mm9xvoNHcOeGthCYP
         nuqqZqO5QWCllP5Un/iRZ3EtN+PhoHc/NggWw6L1j0ZUI7lLEAToE019Qmfc1jjY1lCr
         wtf0I7ifj35UFKDGkIh0RVbaAzh9Wm5cjwDgpHK9vHMP8b2E12FW2coKPCrbP7kJd+5B
         PFt/loSVLrqQow01n3w++QYk3A9I8rbynBAg7iHZsZSDsJ+1KQbOiN7XcM7+Y/dziU0/
         WVMg==
X-Gm-Message-State: AOJu0YzjZrKNKh191NVEcBP4dgK/JlaIu5NpyqyN04eaQdQSvhCY0+S5
	75a5fFQ8JrJsUPhkqrK+G2MmGfxDSGXGtefqkNWPwjZ/EvbKkBdYUbATB4jOuJbJ3g1H+zQhTCw
	r
X-Google-Smtp-Source: AGHT+IF6klHJqWT0oB64li1BBZDr5y6xBF4YRpNtgnd+hNquWgAHjZ99ZzB1qAhn62zzWOTkDEfgmw==
X-Received: by 2002:a50:cac7:0:b0:566:d28b:3d72 with SMTP id f7-20020a50cac7000000b00566d28b3d72mr8757465edi.2.1709627195228;
        Tue, 05 Mar 2024 00:26:35 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h6-20020a0564020e0600b00566d87734c0sm4434294edh.16.2024.03.05.00.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 00:26:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 05 Mar 2024 09:26:34 +0100
Subject: [PATCH] gpio: nomadik: Back out some managed resources
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240305-fix-nomadik-gpio-v1-1-73162e3a388e@linaro.org>
X-B4-Tracking: v=1; b=H4sIADnX5mUC/x2MQQqAMAwEvyI5G6hVL35FPAST1iC20oII4t8NX
 gYGZveBKkWlwtQ8UOTSqjmZdG0D60YpCiqbg3d+cL0bMeiNKR/EumM8NePogmdmIiPY7CxizX8
 5L+/7Ab6sIi5iAAAA
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
 drivers/gpio/gpio-nomadik.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 483086deb397..1ed547491f48 100644
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
@@ -559,14 +561,17 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
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
 		return (void *)clk;
@@ -574,9 +579,10 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	clk_prepare(clk);
 	nmk_chip->clk = clk;
 
-	reset = devm_reset_control_get_optional_shared(gpio_dev, NULL);
+	/* NOTE: do not use devm_ here! */
+	reset = reset_control_get_optional_shared(gpio_dev, NULL);
 	if (IS_ERR(reset)) {
-		dev_err(&pdev->dev, "failed getting reset control: %ld\n",
+		dev_err(dev, "failed getting reset control: %ld\n",
 			PTR_ERR(reset));
 		return ERR_CAST(reset);
 	}
@@ -588,7 +594,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	 */
 	ret = reset_control_deassert(reset);
 	if (ret) {
-		dev_err(&pdev->dev, "failed reset deassert: %d\n", ret);
+		dev_err(dev, "failed reset deassert: %d\n", ret);
 		return ERR_PTR(ret);
 	}
 

---
base-commit: caddc92c57451d983c7e31e60b961c5aae4ece63
change-id: 20240305-fix-nomadik-gpio-50f2dddaa2dd

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


