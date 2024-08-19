Return-Path: <linux-gpio+bounces-8808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 036D6956E89
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 17:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3C41C20845
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 15:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFD0381C2;
	Mon, 19 Aug 2024 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PN70P6wV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929C29D0C
	for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724080637; cv=none; b=Al4VT7GuISsVZoLRAOJlhNRKt0bhkNWV+4p/EfZJZE0Km0CUupqi8j4KQqmvJNZo83deQ+t8xWmBRO3zGYQP9iXs8B8rCjZZBA5mVcL1M8KUk43fS07App8/SKk7suhVdCtMjUI632DIIqpeuHgcMjfUpicUw89NdcMh3r1Gm2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724080637; c=relaxed/simple;
	bh=vYUrnHLUKnCirrXPVePqYwvf/tnDWXrqxM0mdSUEQ4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pMtiNRh0tMovcJF7c2W2UyMqWmDQl8ls8PYRFg/DADBWb+JHgtSOqHicjjeJBkn1NHbkQgyTZkeRQigOi3IUEc+H4E9vKepPz7TsbbwLh44i5/WfG9aJh6LWashu5omDsKVGzMWEk4rn0dG5P7dtSR6ZM23Rcdsrs2O81dc0YM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PN70P6wV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4281faefea9so34871565e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724080633; x=1724685433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhNL+8XlGXOzfWw8j+/Ok6T9DPcqqekl3QMBg7FURmU=;
        b=PN70P6wVV5E/J053P8MNss/YvD5PgxO2WvN4W5rAB48bDQmpxiELMeLolqHjexccO/
         ICyP7H1xxbgNXTrUpzArBNgHWsl7+3I4VZHxZtbVBwI8PeK7LP0vNUB8T7L6RX6Hl+SG
         zotab+ahV2++oHHj6bLRP9OTaiUqRkp1jb2p2SxhErB0Oj17YXzmXq+x1XM99zFGUQb2
         7gczqu4VAdIbtsdYQGLJbh+4Ffn+OnpdPplIg1hltDC1eyH2lP3FLnEZMPLKvKHYR3Na
         LCoNtawyGAoO0x0MwNaYYw9GdPZP2OmoW8SC4IW1lQK//UjlK95eQLPscuNxT4xg+1of
         B89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724080633; x=1724685433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhNL+8XlGXOzfWw8j+/Ok6T9DPcqqekl3QMBg7FURmU=;
        b=IVuQCAL07SLQl6mg/KsyNhAVWac8UhsSj4sckU+jqaG6FlQuMGmZxaM1K1q7L5ivUy
         rKFh16GXFrxKZQYSjeSq8uPKtcWK1vmaDCb27RhOIpsFr84HWhqEscR2fPHkwgilqFMp
         idwkrT+shV/rlxSDCKw38XBlOhUDtANjzHFbgEtnhY80s5teoj1vhA4L5D/B+hLDfPVF
         C18nPZ2uEBAAtOqjjSdEZ9D2jHWoc5z5ad0TW+RrejshyhFq9XiCx4nsmUgLXDa8Xtix
         SVB5ufyHFi016nCY/iY7JG0FhNy5TOJ5wdfM3266uP1/k6gqqC4ppc3OR5UxF6GxdkvK
         pMvw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Cjlllu0nOvxCMTFw59THxPAfnWa7HMd2eFnH4w4b7spmFKEtW2J2e68EAv4cd0UpAXfAKAinvzbnsa85VeiZ+onM1IgJoFsohw==
X-Gm-Message-State: AOJu0YyD+ZjqLHadHiZwd1MRHDKOGWqxxBsUaMuO3SXw0a6ABoOi58fj
	x0lvhT5/Z/yDPCFetXWts0Qubu1w/R5iEt51VBsx0qwRc+BvUfuAWDliJ3Wqg25dkJzenbUMbm2
	eHRk=
X-Google-Smtp-Source: AGHT+IEWF7CyznAVBor2bq8snEeAd6GUELLADmv/AwQDJqDYlwnB46wfyyghTMjNwcmp6qkOa906rw==
X-Received: by 2002:a05:600c:1549:b0:426:6f38:8974 with SMTP id 5b1f17b1804b1-429ed7772damr76029995e9.6.1724080632257;
        Mon, 19 Aug 2024 08:17:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7b55:8f70:3ecb:b4ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aad70sm10788324f8f.104.2024.08.19.08.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 08:17:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: davinci: drop platform data support
Date: Mon, 19 Aug 2024 17:17:04 +0200
Message-ID: <20240819151705.37258-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more any board files that use the platform data for
gpio-davinci. We can remove the header defining it and port the code to
no longer store any context in pdata.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-davinci.c                | 89 ++++++----------------
 include/linux/platform_data/gpio-davinci.h | 21 -----
 2 files changed, 25 insertions(+), 85 deletions(-)
 delete mode 100644 include/linux/platform_data/gpio-davinci.h

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 1d0175d6350b..7763b99f814a 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -18,7 +18,6 @@
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/gpio-davinci.h>
 #include <linux/property.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/spinlock.h>
@@ -154,74 +153,37 @@ davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 		       value ? &g->set_data : &g->clr_data);
 }
 
-static struct davinci_gpio_platform_data *
-davinci_gpio_get_pdata(struct platform_device *pdev)
-{
-	struct device_node *dn = pdev->dev.of_node;
-	struct davinci_gpio_platform_data *pdata;
-	int ret;
-	u32 val;
-
-	if (!IS_ENABLED(CONFIG_OF) || !pdev->dev.of_node)
-		return dev_get_platdata(&pdev->dev);
-
-	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return NULL;
-
-	ret = of_property_read_u32(dn, "ti,ngpio", &val);
-	if (ret)
-		goto of_err;
-
-	pdata->ngpio = val;
-
-	ret = of_property_read_u32(dn, "ti,davinci-gpio-unbanked", &val);
-	if (ret)
-		goto of_err;
-
-	pdata->gpio_unbanked = val;
-
-	return pdata;
-
-of_err:
-	dev_err(&pdev->dev, "Populating pdata from DT failed: err %d\n", ret);
-	return NULL;
-}
-
 static int davinci_gpio_probe(struct platform_device *pdev)
 {
 	int bank, i, ret = 0;
-	unsigned int ngpio, nbank, nirq;
+	unsigned int ngpio, nbank, nirq, gpio_unbanked;
 	struct davinci_gpio_controller *chips;
-	struct davinci_gpio_platform_data *pdata;
 	struct device *dev = &pdev->dev;
-
-	pdata = davinci_gpio_get_pdata(pdev);
-	if (!pdata) {
-		dev_err(dev, "No platform data found\n");
-		return -EINVAL;
-	}
-
-	dev->platform_data = pdata;
+	struct device_node *dn = dev_of_node(dev);
 
 	/*
 	 * The gpio banks conceptually expose a segmented bitmap,
 	 * and "ngpio" is one more than the largest zero-based
 	 * bit index that's valid.
 	 */
-	ngpio = pdata->ngpio;
-	if (ngpio == 0) {
-		dev_err(dev, "How many GPIOs?\n");
-		return -EINVAL;
-	}
+	ret = of_property_read_u32(dn, "ti,ngpio", &ngpio);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get the number of GPIOs\n");
+	if (ngpio == 0)
+		return dev_err_probe(dev, -EINVAL, "How many GPIOs?\n");
 
 	/*
 	 * If there are unbanked interrupts then the number of
 	 * interrupts is equal to number of gpios else all are banked so
 	 * number of interrupts is equal to number of banks(each with 16 gpios)
 	 */
-	if (pdata->gpio_unbanked)
-		nirq = pdata->gpio_unbanked;
+	ret = of_property_read_u32(dn, "ti,davinci-gpio-unbanked",
+				   &gpio_unbanked);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get the unbanked GPIOs property\n");
+
+	if (gpio_unbanked)
+		nirq = gpio_unbanked;
 	else
 		nirq = DIV_ROUND_UP(ngpio, 16);
 
@@ -252,7 +214,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	chips->chip.set = davinci_gpio_set;
 
 	chips->chip.ngpio = ngpio;
-	chips->chip.base = pdata->no_auto_base ? pdata->base : -1;
+	chips->chip.base = -1;
 
 #ifdef CONFIG_OF_GPIO
 	chips->chip.parent = dev;
@@ -261,6 +223,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 #endif
 	spin_lock_init(&chips->lock);
 
+	chips->gpio_unbanked = gpio_unbanked;
+
 	nbank = DIV_ROUND_UP(ngpio, 32);
 	for (bank = 0; bank < nbank; bank++)
 		chips->regs[bank] = gpio_base + offset_array[bank];
@@ -488,7 +452,6 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	unsigned	ngpio;
 	struct device *dev = &pdev->dev;
 	struct davinci_gpio_controller *chips = platform_get_drvdata(pdev);
-	struct davinci_gpio_platform_data *pdata = dev->platform_data;
 	struct davinci_gpio_regs __iomem *g;
 	struct irq_domain	*irq_domain = NULL;
 	struct irq_chip *irq_chip;
@@ -502,7 +465,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	if (dev->of_node)
 		gpio_get_irq_chip = (gpio_get_irq_chip_cb_t)device_get_match_data(dev);
 
-	ngpio = pdata->ngpio;
+	ngpio = chips->chip.ngpio;
 
 	clk = devm_clk_get(dev, "gpio");
 	if (IS_ERR(clk)) {
@@ -514,7 +477,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (!pdata->gpio_unbanked) {
+	if (chips->gpio_unbanked) {
 		irq = devm_irq_alloc_descs(dev, -1, 0, ngpio, 0);
 		if (irq < 0) {
 			dev_err(dev, "Couldn't allocate IRQ numbers\n");
@@ -546,11 +509,11 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * controller only handling trigger modes.  We currently assume no
 	 * IRQ mux conflicts; gpio_irq_type_unbanked() is only for GPIOs.
 	 */
-	if (pdata->gpio_unbanked) {
+	if (chips->gpio_unbanked) {
 		/* pass "bank 0" GPIO IRQs to AINTC */
 		chips->chip.to_irq = gpio_to_irq_unbanked;
-		chips->gpio_unbanked = pdata->gpio_unbanked;
-		binten = GENMASK(pdata->gpio_unbanked / 16, 0);
+
+		binten = GENMASK(chips->gpio_unbanked / 16, 0);
 
 		/* AINTC handles mask/unmask; GPIO handles triggering */
 		irq = chips->irqs[0];
@@ -564,7 +527,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		writel_relaxed(~0, &g->set_rising);
 
 		/* set the direct IRQs up to use that irqchip */
-		for (gpio = 0; gpio < pdata->gpio_unbanked; gpio++) {
+		for (gpio = 0; gpio < chips->gpio_unbanked; gpio++) {
 			irq_set_chip(chips->irqs[gpio], irq_chip);
 			irq_set_handler_data(chips->irqs[gpio], chips);
 			irq_set_status_flags(chips->irqs[gpio],
@@ -675,8 +638,7 @@ static void davinci_gpio_restore_context(struct davinci_gpio_controller *chips,
 static int davinci_gpio_suspend(struct device *dev)
 {
 	struct davinci_gpio_controller *chips = dev_get_drvdata(dev);
-	struct davinci_gpio_platform_data *pdata = dev_get_platdata(dev);
-	u32 nbank = DIV_ROUND_UP(pdata->ngpio, 32);
+	u32 nbank = DIV_ROUND_UP(chips->chip.ngpio, 32);
 
 	davinci_gpio_save_context(chips, nbank);
 
@@ -686,8 +648,7 @@ static int davinci_gpio_suspend(struct device *dev)
 static int davinci_gpio_resume(struct device *dev)
 {
 	struct davinci_gpio_controller *chips = dev_get_drvdata(dev);
-	struct davinci_gpio_platform_data *pdata = dev_get_platdata(dev);
-	u32 nbank = DIV_ROUND_UP(pdata->ngpio, 32);
+	u32 nbank = DIV_ROUND_UP(chips->chip.ngpio, 32);
 
 	davinci_gpio_restore_context(chips, nbank);
 
diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
deleted file mode 100644
index b82e44662efe..000000000000
--- a/include/linux/platform_data/gpio-davinci.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * DaVinci GPIO Platform Related Defines
- *
- * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
- */
-
-#ifndef __DAVINCI_GPIO_PLATFORM_H
-#define __DAVINCI_GPIO_PLATFORM_H
-
-struct davinci_gpio_platform_data {
-	bool	no_auto_base;
-	u32	base;
-	u32	ngpio;
-	u32	gpio_unbanked;
-};
-
-/* Convert GPIO signal to GPIO pin number */
-#define GPIO_TO_PIN(bank, gpio)	(16 * (bank) + (gpio))
-
-#endif
-- 
2.43.0


