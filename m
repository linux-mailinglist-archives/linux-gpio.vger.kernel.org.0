Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB4E3D78D1
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 16:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236732AbhG0OtJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 10:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbhG0Osl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 10:48:41 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948D6C0613D3;
        Tue, 27 Jul 2021 07:48:23 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l4-20020a05600c1d04b02902506f89ad2dso2088381wms.1;
        Tue, 27 Jul 2021 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+9dE9J28XSMZPaJTo0q0ZGsHy0ZcpNmQIYSkw4PBYIc=;
        b=c7T4HchxSJ0tyuUCeITb/nJEdDiT9OU+JB1BBZKQiGn6+GTm3Oc0M6y9YhcZmIRZKN
         5Bd0CIEbhmdm3R9LnH0zIGn0XAGpNO49yRskSnQi2KoUcU5mbC2f3MO5eOI9Y5M7HvqC
         HNopATGnYvtXD2Zy52EBFt9puLVW1OFiiUXDgcqD19xZT6xy2clGQF8x5q2qUiQY1EoK
         zCVN0Lw9C8S47Ynl8wrvDzWgngADO/bYClB4wxfVICB1JttPA1GuaiqWIIFdR52fzdvd
         LjQrrReAd5NDcdE7WCROlxMFd84hEyEXsRP+YSLjmyvNJV4lCczaYML4w0ZChj+OQWHt
         oosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+9dE9J28XSMZPaJTo0q0ZGsHy0ZcpNmQIYSkw4PBYIc=;
        b=U9Y5Xwau+2qPRPgdb2AStqn/w7sb6v29GCoks0xj+EmS+2tRhvxB/K3Ovyy/PZa2+K
         l+wT9M3+BrvXUlCptTYLx1El3eP6phRPx1F6qi++5yO6aLNUeOHzBd6jsiuXS960Ll3n
         uPj5U4TOG+xYiof5fwFHmVYexGIwA/Q5mingD0oskvehNnH7TipsvEXuRPIGMNW3SMj1
         fO7uoxNhCohRlZGqoXFHXCa8XI2WT0O9K+rtMLeQ9b+phs6BwEwL5609XXgw9IcYUZy+
         O6RFh6WL7SjJF1kFCRuUShCnXoaS2QkGkhHn/mO2rK/WKao6lPBjrVSfvH96GBNrPafq
         7H0A==
X-Gm-Message-State: AOAM532CbW3zX0eb9bO0j131XSt8+b8rVt/YzVeL+23/4sXlfynEaMzD
        /k7k/Jr44NHy2a4m7OB+21Gcou70evqSgWP4
X-Google-Smtp-Source: ABdhPJyhi6eo/w5B4AA428amwYwXb+WdTaV8gjhq8UcG5Pdn2VkbqcB9YWy9gtQ1JPiuYfNz/qpelg==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr7018084wmf.37.1627397301989;
        Tue, 27 Jul 2021 07:48:21 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id o14sm3002555wmq.31.2021.07.27.07.48.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 07:48:21 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
Date:   Tue, 27 Jul 2021 16:48:16 +0200
Message-Id: <20210727144816.8697-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727144816.8697-1-sergio.paracuellos@gmail.com>
References: <20210727144816.8697-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Gpiolib core code has been updated to support setting
friendly names through properly 'gpio-line-names'.
Instead of redefine behaviour here to skip the core
to be executed, just properly assign the desired offset
per bank to get in the core the expected behaviour.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 45 +------------------------------------
 1 file changed, 1 insertion(+), 44 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index fcfc1a1f1a5c..a7275159052e 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -603,49 +603,6 @@ static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
 	.resume_noirq = brcmstb_gpio_resume,
 };
 
-static void brcmstb_gpio_set_names(struct device *dev,
-				   struct brcmstb_gpio_bank *bank)
-{
-	struct device_node *np = dev->of_node;
-	const char **names;
-	int nstrings, base;
-	unsigned int i;
-
-	base = bank->id * MAX_GPIO_PER_BANK;
-
-	nstrings = of_property_count_strings(np, "gpio-line-names");
-	if (nstrings <= base)
-		/* Line names not present */
-		return;
-
-	names = devm_kcalloc(dev, MAX_GPIO_PER_BANK, sizeof(*names),
-			     GFP_KERNEL);
-	if (!names)
-		return;
-
-	/*
-	 * Make sure to not index beyond the end of the number of descriptors
-	 * of the GPIO device.
-	 */
-	for (i = 0; i < bank->width; i++) {
-		const char *name;
-		int ret;
-
-		ret = of_property_read_string_index(np, "gpio-line-names",
-						    base + i, &name);
-		if (ret) {
-			if (ret != -ENODATA)
-				dev_err(dev, "unable to name line %d: %d\n",
-					base + i, ret);
-			break;
-		}
-		if (*name)
-			names[i] = name;
-	}
-
-	bank->gc.names = names;
-}
-
 static int brcmstb_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -759,6 +716,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		gc->of_xlate = brcmstb_gpio_of_xlate;
 		/* not all ngpio lines are valid, will use bank width later */
 		gc->ngpio = MAX_GPIO_PER_BANK;
+		gc->offset = bank->id * MAX_GPIO_PER_BANK;
 		if (priv->parent_irq > 0)
 			gc->to_irq = brcmstb_gpio_to_irq;
 
@@ -769,7 +727,6 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
 		gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
 
-		brcmstb_gpio_set_names(dev, bank);
 		err = gpiochip_add_data(gc, bank);
 		if (err) {
 			dev_err(dev, "Could not add gpiochip for bank %d\n",
-- 
2.25.1

