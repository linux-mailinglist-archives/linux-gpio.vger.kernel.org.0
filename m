Return-Path: <linux-gpio+bounces-24964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FC7B3590F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 11:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 295B93BAA87
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD24331984C;
	Tue, 26 Aug 2025 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WkroMv5s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A321030AAD4
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200916; cv=none; b=fu59Nm+OqWOvceXyR8n+vIJ8gH8sZoMkTfNA/BMfyruvIdWmkljbwScaZxGU6kTGat3Ucp/VugQtn1KNGKPUIa98NWI2+4dI7ycc3+V6hMHYYrRLiQwVEz1n1x9cd0puAPWrUbqxHHSgM2KsfChgS1iz9VdkJDHTeWmqCdKARoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200916; c=relaxed/simple;
	bh=ANodkn/JBi/nD3cyNS1lTtKkoOSFk1GkBDbJ17B8p/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGXosE84uSD52qsEl6848oKOHsq5B6qegJCVHjMpeRVg34qUvznj2bsGUGd7LILXqeWLRezvxzYxu//6UPNsvaSlXBIN2SgzX8ioAz21BRluxeGCxxvC8OR+KgewUdToLC1yqjdBKKfvtccsrtlmxOWDl+hDRQH6zZqoIHTFsxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WkroMv5s; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso28420945e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 02:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200913; x=1756805713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lATIPSy5e6EtCT9cnYgcUD2Ds0mi2iLMFvh/wI5iKp0=;
        b=WkroMv5stvVRD9qUnVCzfDPRWtT/YDtTwhNTmxFidMbSl1tClwz83lIxuQzUWoFku2
         sLYqWMvaD07gpfy4s5etUZFnfffjLhgdU5835rdBjTYEzC+N/s17hEgA8jXdt1fp9PAW
         iOFPSoQfP+FkuxCdYShC/Eo+Vr0Ihwc9rcuGaVDEpueVVKNaqerxsmAf1tEX0ReK6XEZ
         LghIopSwWl5v8oLYptcENiRxiJ0SmLgfgjNirVncyy7iVq/K7Ny/ZHbmB6AjIsciHTGI
         7l6qyNfgHRVVSqhXoeZcA2WNfXDA0MVpZtlYi7dPErTwuq2SkJSwnrpNCn00rqijUQX3
         Sntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200913; x=1756805713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lATIPSy5e6EtCT9cnYgcUD2Ds0mi2iLMFvh/wI5iKp0=;
        b=QNP04hLN0A+sZsVYxZ9RL/RRUkt34z/v5xQWev+0FglV8qkKRBTDv2pJ5JghYrAMUg
         5nIYi+xYxkqGgWND50zggesmyRMekvBnRFZY2xzNg5ZT2z09vnLDOLzQjE0W3SvoKJVy
         KEFW8HUegOrqzStDPzEWoiS1lU6b4ZV5ARXyS5ng6AZ21KW3indoi/gO0fke9fZmY+X0
         gREQYTgYxJSd2K6NRVt+o7N1C1jAcvSLnNIybvU6Mh1Q7BcNIgUnsm/El2eY8mFwxGZq
         BQYMS8SY/v60PF0U59YCfbhvNscqEkBx97gOOQ+nbnhDmXKijkLznnQx5ohXESE+e1cV
         FjXw==
X-Gm-Message-State: AOJu0YxavhysPzE92Tj1bpD1OI1sI9k9Pio0UHPCo1dxWTuSX0FmbQvB
	XUMKDLnAgomIJOx3EaeV04gb5KMErM29RNynf3XXyOuO7OPC3CM+Ca4dGaNU4B0Bw04=
X-Gm-Gg: ASbGncsAxnzuGkvCPQPtWKTveG4uUY+/wOdHf1Gtm7tQfCXkdJr3W6ikX6FxHVcMT1L
	mjga0cyObmTQRCz7WIlPsafjMiXG6iSY31PhaeushEZb3X1bPjLtC2uAyBAB/psmQtD6ve9ZFc3
	uycXtQYiQb1zcH2x8mZttz6/5xBWKY/ILmv2gWfsgePe2DbaUpFVwWe3qRP3K14WkwshbJdcFjf
	1UtLsxtJ/FkqacYYGM4VCNK8dhuoF4TFNOuqyvcWVyyeQyeOSu5i9DvTItYQhBbPmO9C7990BtV
	mwSgoyaowswgZAWsv1zg88nhi+tRJMxaRJgZ3xeDPzhLI8pOb7UgUia16oi3xSJmC7TvzsMv1Vb
	+9hX7wdYF5IZ1opH1bM76qZctFCk9R0OWWHj20Q==
X-Google-Smtp-Source: AGHT+IG4AZWGUoJwLuc2ootBVti7BUMsrtAyRnTnepKJgcUpTo6Dd5cIJq7uF1V4qZbMDI/zddDMAA==
X-Received: by 2002:a5d:5f50:0:b0:3c8:7303:8fa1 with SMTP id ffacd0b85a97d-3c87303915fmr5611467f8f.32.1756200912864;
        Tue, 26 Aug 2025 02:35:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:02 +0200
Subject: [PATCH 01/12] gpio: xgene-sb: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-1-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5979;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9jFh2D6ttrCYJYtJTOU/wJErxn3PlPPm9jnKQyT1lBE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/M/YFESIOoQ5SAnEVMCLG3mCi3FKtS5BecE
 Qi6HSZxDFWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zAAKCRARpy6gFHHX
 cjKHEACkTe3hmggUqlQY+tCcGrk7zCxmF559kPKX0+oo9gCa6z7tc5vKsTIU/1ownJEORH/T9mt
 GueVzDiLUBD4kPeXUyeqMWEnmCCl5jYH0SnUdjp6VSifD915KGXTUybakeQW80q1LQGa339ZMGg
 wnTPR7gowN9vKdEqGjNFWFR+6i7dCComPP+GBX82+IaWhSBOCEnYReWLPx9HtwUGVahmAb4eNjH
 ilvp6kzIToZETYcW/JcUU80rLgpJLdVVWQdFDOpg9ePgYAubD4f1cWNgicweX+00tUoGK0FJDvW
 AqxRkdLJRCdsdu80o70yks5XZnXgijc8H7JuuLclA3OuKrKjkicmdHM9DX//gLZpHZrueo46eIK
 J4FsFxhx7hoe/iZkWCHnoXYWJ2EwGToeFoxUzOqApHWjkOt/ONKPnkybTNn8IbGKSJbthG+MAK+
 +YFKujGW+bW28V+fUWkt4CDAh5qTE2iTMv2JioiYmrA0SuqYcX/IePGW+jAdpJIT1elVOELvnmU
 TQYdoMBNaxwacnDr4kW4pFdYSkbNCTWQ6Ql08eIejPWc6ULocXQzg+YwyqBfgb9aDD2CBD99M3Q
 laSEjjOylEmwpCLUe2+Orh8PuzbE8T5/vRyzXSiBI0Y/TDyY0FWqlSeqIdYdiCs7oiONEOhnhmM
 K9HtaDPmq2JRATQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xgene-sb.c | 53 +++++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index b51b1fa726bb5ac6fce21f93e98035b5f684ee88..c559a89aadf7a77bd9cce7e5a7d4a2b241307812 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -21,6 +21,7 @@
 #include <linux/types.h>
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #include "gpiolib-acpi.h"
 
@@ -40,7 +41,7 @@
 
 /**
  * struct xgene_gpio_sb - GPIO-Standby private data structure.
- * @gc:				memory-mapped GPIO controllers.
+ * @chip:			Generic GPIO chip data
  * @regs:			GPIO register base offset
  * @irq_domain:			GPIO interrupt domain
  * @irq_start:			GPIO pin that start support interrupt
@@ -48,7 +49,7 @@
  * @parent_irq_base:		Start parent HWIRQ
  */
 struct xgene_gpio_sb {
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	void __iomem		*regs;
 	struct irq_domain	*irq_domain;
 	u16			irq_start;
@@ -91,9 +92,9 @@ static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)
 		break;
 	}
 
-	xgene_gpio_set_bit(&priv->gc, priv->regs + MPA_GPIO_SEL_LO,
+	xgene_gpio_set_bit(&priv->chip.gc, priv->regs + MPA_GPIO_SEL_LO,
 			gpio * 2, 1);
-	xgene_gpio_set_bit(&priv->gc, priv->regs + MPA_GPIO_INT_LVL,
+	xgene_gpio_set_bit(&priv->chip.gc, priv->regs + MPA_GPIO_INT_LVL,
 			d->hwirq, lvl_type);
 
 	/* Propagate IRQ type setting to parent */
@@ -109,14 +110,14 @@ static void xgene_gpio_sb_irq_mask(struct irq_data *d)
 
 	irq_chip_mask_parent(d);
 
-	gpiochip_disable_irq(&priv->gc, d->hwirq);
+	gpiochip_disable_irq(&priv->chip.gc, d->hwirq);
 }
 
 static void xgene_gpio_sb_irq_unmask(struct irq_data *d)
 {
 	struct xgene_gpio_sb *priv = irq_data_get_irq_chip_data(d);
 
-	gpiochip_enable_irq(&priv->gc, d->hwirq);
+	gpiochip_enable_irq(&priv->chip.gc, d->hwirq);
 
 	irq_chip_unmask_parent(d);
 }
@@ -155,15 +156,15 @@ static int xgene_gpio_sb_domain_activate(struct irq_domain *d,
 	u32 gpio = HWIRQ_TO_GPIO(priv, irq_data->hwirq);
 	int ret;
 
-	ret = gpiochip_lock_as_irq(&priv->gc, gpio);
+	ret = gpiochip_lock_as_irq(&priv->chip.gc, gpio);
 	if (ret) {
-		dev_err(priv->gc.parent,
+		dev_err(priv->chip.gc.parent,
 		"Unable to configure XGene GPIO standby pin %d as IRQ\n",
 				gpio);
 		return ret;
 	}
 
-	xgene_gpio_set_bit(&priv->gc, priv->regs + MPA_GPIO_SEL_LO,
+	xgene_gpio_set_bit(&priv->chip.gc, priv->regs + MPA_GPIO_SEL_LO,
 			gpio * 2, 1);
 	return 0;
 }
@@ -174,8 +175,8 @@ static void xgene_gpio_sb_domain_deactivate(struct irq_domain *d,
 	struct xgene_gpio_sb *priv = d->host_data;
 	u32 gpio = HWIRQ_TO_GPIO(priv, irq_data->hwirq);
 
-	gpiochip_unlock_as_irq(&priv->gc, gpio);
-	xgene_gpio_set_bit(&priv->gc, priv->regs + MPA_GPIO_SEL_LO,
+	gpiochip_unlock_as_irq(&priv->chip.gc, gpio);
+	xgene_gpio_set_bit(&priv->chip.gc, priv->regs + MPA_GPIO_SEL_LO,
 			gpio * 2, 0);
 }
 
@@ -237,6 +238,7 @@ static const struct irq_domain_ops xgene_gpio_sb_domain_ops = {
 
 static int xgene_gpio_sb_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct xgene_gpio_sb *priv;
 	int ret;
 	void __iomem *regs;
@@ -263,14 +265,19 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = bgpio_init(&priv->gc, &pdev->dev, 4,
-			regs + MPA_GPIO_IN_ADDR,
-			regs + MPA_GPIO_OUT_ADDR, NULL,
-			regs + MPA_GPIO_OE_ADDR, NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = regs + MPA_GPIO_IN_ADDR,
+		.set = regs + MPA_GPIO_OUT_ADDR,
+		.dirout = regs + MPA_GPIO_OE_ADDR,
+	};
+
+	ret = gpio_generic_chip_init(&priv->chip, &config);
         if (ret)
                 return ret;
 
-	priv->gc.to_irq = xgene_gpio_sb_to_irq;
+	priv->chip.gc.to_irq = xgene_gpio_sb_to_irq;
 
 	/* Retrieve start irq pin, use default if property not found */
 	priv->irq_start = XGENE_DFLT_IRQ_START_PIN;
@@ -283,12 +290,12 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 		priv->nirq = val32;
 
 	/* Retrieve number gpio, use default if property not found */
-	priv->gc.ngpio = XGENE_DFLT_MAX_NGPIO;
+	priv->chip.gc.ngpio = XGENE_DFLT_MAX_NGPIO;
 	if (!device_property_read_u32(&pdev->dev, "apm,nr-gpios", &val32))
-		priv->gc.ngpio = val32;
+		priv->chip.gc.ngpio = val32;
 
 	dev_info(&pdev->dev, "Support %d gpios, %d irqs start from pin %d\n",
-			priv->gc.ngpio, priv->nirq, priv->irq_start);
+			priv->chip.gc.ngpio, priv->nirq, priv->irq_start);
 
 	platform_set_drvdata(pdev, priv);
 
@@ -298,9 +305,9 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 	if (!priv->irq_domain)
 		return -ENODEV;
 
-	priv->gc.irq.domain = priv->irq_domain;
+	priv->chip.gc.irq.domain = priv->irq_domain;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
+	ret = devm_gpiochip_add_data(&pdev->dev, &priv->chip.gc, priv);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"failed to register X-Gene GPIO Standby driver\n");
@@ -311,7 +318,7 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "X-Gene GPIO Standby driver registered\n");
 
 	/* Register interrupt handlers for GPIO signaled ACPI Events */
-	acpi_gpiochip_request_interrupts(&priv->gc);
+	acpi_gpiochip_request_interrupts(&priv->chip.gc);
 
 	return ret;
 }
@@ -320,7 +327,7 @@ static void xgene_gpio_sb_remove(struct platform_device *pdev)
 {
 	struct xgene_gpio_sb *priv = platform_get_drvdata(pdev);
 
-	acpi_gpiochip_free_interrupts(&priv->gc);
+	acpi_gpiochip_free_interrupts(&priv->chip.gc);
 
 	irq_domain_remove(priv->irq_domain);
 }

-- 
2.48.1


