Return-Path: <linux-gpio+bounces-11113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3079971AF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 18:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27607281169
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 16:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE781946C8;
	Wed,  9 Oct 2024 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UKKOTqgW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1034F1DFDBD
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728491358; cv=none; b=EPzZpklwwrujq5OBhwgZsDczhpBN+PDeVDgALkEfBxyVpjRYZCHCtMxRrrLvvke2oRUhWkHw9cFTKiDaEYcKXekFTVjy3twp0p8t/zwUU+gwXX1cVZ79DaMup1/YcrMviPKk9fiVyxM4nI/B0NzXLndx3qLQsHNSvvwGEcx2xlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728491358; c=relaxed/simple;
	bh=PDjCtEd65pLvqJqA4DGmEYQMfK1MTSAAaUijFern5sE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QjzlyTYmCsnNZkGRTyLnmhgnFwjyzq3c4wPLhlDO27Ea/XWMfk2d8THz7QVyKhrS4Aa5D4dgvWTE1xHgUanSHYoGh9+np+bGPXMTvRH4820xrwp1zV9B7mUnaPlYFxZ8og7zVnS1+cbSg6sLMlFRD6V8HM769eTW1kNZjOtdWNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UKKOTqgW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso66560515e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728491354; x=1729096154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PaDjPkWaQG2wts5WRsXEAPUVwmnnHMybRjZYeJvsAEU=;
        b=UKKOTqgWbPmHsUB5r4mLnSsb7OOT6Oj2YxZa4kCAIA80REryytr3Ca+HqQk/DilXBR
         SbaounxR+gZqWLsi+nTQ8Jeb/ySsBRyWmLoTE+VNO/HLPhZvRvNTuEP0ge8w+VkDdOyH
         yKYriO049YqEQX4Olls83KohZZCEPWBAZ+tfqSOK5Spxgi/bPcm+VR9HISHoFlGJk/K5
         Hn3PDsYnJmdOUlkbXVihvfQysxZoBhTO4gc1mx1t5YwUEC1JG5N6rm01NOiEnKsSLU8k
         N98D+KgWg9fBEIVYjnncpHwZNix0FyA6rIXwt5yOnKeGtGd+jIe0s4NtuLL2Ionv4k2O
         dR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728491354; x=1729096154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaDjPkWaQG2wts5WRsXEAPUVwmnnHMybRjZYeJvsAEU=;
        b=j40laoTnJ52r4ShhNmGQPaqvsAY/q3obSOxSJnRK9So69E1HbDuhKAuP7QjX67f81V
         CV3JWbkXjSu8RVZ0XKXbO0rTvPqMq0Z2q/UO/TSTAw7hfufek7PGdClULY7ZvHIO4KdK
         53sQhjCXwEmIAhUsTdfnTHqCkNP+i+CybnEpktIjkTJgdOpvArzImkHPMMuatA06t6+4
         BLJWpaMY+lUJ5AztlMKLNGmXRhWK1MOyg15ywNAzlrCjAs9Qp8SJ+0MKUvDg0R9fwyPZ
         ExwZ51xBAa2ePpyb9V8E7OqX5AhCXhMYy+0zxLi9sq788IDLsrp1cx9oMkq8oQEptvfA
         1S7w==
X-Gm-Message-State: AOJu0Yy30bLjIhHe6J+LhPJ4T39zmlSleAxC3oqd9Sr+7WWB6IbLenAf
	Qj20ihWjgm4CacF3KsR0VQ8B0Ib1qjIozLEMqsCp0o27P2NcckekKjs895CGsQ0=
X-Google-Smtp-Source: AGHT+IHOGSipqL/icOQsUozWU890KNhChVKqtfE51nl9eohpRfGEfBJrVYHA7bBsj+DgXJEf2+KSYA==
X-Received: by 2002:a05:600c:1ca7:b0:42c:be90:fa2f with SMTP id 5b1f17b1804b1-430d5aad152mr27110105e9.25.1728491354171;
        Wed, 09 Oct 2024 09:29:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ff96:3068:2ae4:3fe0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf45df4sm24795475e9.13.2024.10.09.09.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:29:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: mpc8xxx: use a helper variable to store the address of pdev->dev
Date: Wed,  9 Oct 2024 18:29:09 +0200
Message-ID: <20241009162910.33477-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of repeatedly dereferencing pdev, just store the address of the
embedded struct device in a local variable and use it instead for
improved readability.

While at it: rearrange variable declarations.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 46 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 685ec31db409..30f36f94ba1b 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -300,14 +300,15 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 
 static int mpc8xxx_probe(struct platform_device *pdev)
 {
+	const struct mpc8xxx_gpio_devtype *devtype = NULL;
 	struct device_node *np = pdev->dev.of_node;
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc;
-	struct gpio_chip	*gc;
-	const struct mpc8xxx_gpio_devtype *devtype = NULL;
+	struct device *dev = &pdev->dev;
 	struct fwnode_handle *fwnode;
+	struct gpio_chip *gc;
 	int ret;
 
-	mpc8xxx_gc = devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), GFP_KERNEL);
+	mpc8xxx_gc = devm_kzalloc(dev, sizeof(*mpc8xxx_gc), GFP_KERNEL);
 	if (!mpc8xxx_gc)
 		return -ENOMEM;
 
@@ -320,32 +321,28 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		return PTR_ERR(mpc8xxx_gc->regs);
 
 	gc = &mpc8xxx_gc->gc;
-	gc->parent = &pdev->dev;
+	gc->parent = dev;
 
-	if (device_property_read_bool(&pdev->dev, "little-endian")) {
-		ret = bgpio_init(gc, &pdev->dev, 4,
-				 mpc8xxx_gc->regs + GPIO_DAT,
-				 NULL, NULL,
-				 mpc8xxx_gc->regs + GPIO_DIR, NULL,
-				 BGPIOF_BIG_ENDIAN);
+	if (device_property_read_bool(dev, "little-endian")) {
+		ret = bgpio_init(gc, dev, 4, mpc8xxx_gc->regs + GPIO_DAT,
+				 NULL, NULL, mpc8xxx_gc->regs + GPIO_DIR,
+				 NULL, BGPIOF_BIG_ENDIAN);
 		if (ret)
 			return ret;
-		dev_dbg(&pdev->dev, "GPIO registers are LITTLE endian\n");
+		dev_dbg(dev, "GPIO registers are LITTLE endian\n");
 	} else {
-		ret = bgpio_init(gc, &pdev->dev, 4,
-				 mpc8xxx_gc->regs + GPIO_DAT,
-				 NULL, NULL,
-				 mpc8xxx_gc->regs + GPIO_DIR, NULL,
-				 BGPIOF_BIG_ENDIAN
+		ret = bgpio_init(gc, dev, 4, mpc8xxx_gc->regs + GPIO_DAT,
+				 NULL, NULL, mpc8xxx_gc->regs + GPIO_DIR,
+				 NULL, BGPIOF_BIG_ENDIAN
 				 | BGPIOF_BIG_ENDIAN_BYTE_ORDER);
 		if (ret)
 			return ret;
-		dev_dbg(&pdev->dev, "GPIO registers are BIG endian\n");
+		dev_dbg(dev, "GPIO registers are BIG endian\n");
 	}
 
 	mpc8xxx_gc->direction_output = gc->direction_output;
 
-	devtype = device_get_match_data(&pdev->dev);
+	devtype = device_get_match_data(dev);
 	if (!devtype)
 		devtype = &mpc8xxx_gpio_devtype_default;
 
@@ -370,7 +367,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	 * associated input enable must be set (GPIOxGPIE[IEn]=1) to propagate
 	 * the port value to the GPIO Data Register.
 	 */
-	fwnode = dev_fwnode(&pdev->dev);
+	fwnode = dev_fwnode(dev);
 	if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
 	    of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
 	    of_device_is_compatible(np, "fsl,ls1088a-gpio") ||
@@ -381,9 +378,9 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 			gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, gc, mpc8xxx_gc);
+	ret = devm_gpiochip_add_data(dev, gc, mpc8xxx_gc);
 	if (ret) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"GPIO chip registration failed with status %d\n", ret);
 		return ret;
 	}
@@ -404,18 +401,17 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
 
-	ret = devm_request_irq(&pdev->dev, mpc8xxx_gc->irqn,
+	ret = devm_request_irq(dev, mpc8xxx_gc->irqn,
 			       mpc8xxx_gpio_irq_cascade,
 			       IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascade",
 			       mpc8xxx_gc);
 	if (ret) {
-		dev_err(&pdev->dev,
-			"failed to devm_request_irq(%d), ret = %d\n",
+		dev_err(dev, "failed to devm_request_irq(%d), ret = %d\n",
 			mpc8xxx_gc->irqn, ret);
 		goto err;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
+	device_init_wakeup(dev, true);
 
 	return 0;
 err:
-- 
2.43.0


