Return-Path: <linux-gpio+bounces-25448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00761B41791
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEFFD178FDD
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AC62E8E1D;
	Wed,  3 Sep 2025 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZhD4euWe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2742E7BBC
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886427; cv=none; b=bekdK84Sow+jL/cV4NRbwdzT33OOfew9yDiQpv9G9vZsAQRKwEAGvAHxPXIMDIqrvQDO0QJTLDk95CRGywgp/TOcNoXEIanmXRg1fMkpbCDJWtnkDKPCB5k4Xo/Aip1CUK604JUKFTHgiLM2Vjm7Jmk8S5Ss3VkDf3utHFz7vjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886427; c=relaxed/simple;
	bh=4x98K3aQl/xztbZfGB4AJfweBaBdOshWUE/BWHC2Kj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RZbkAEbpdOwEBsSwyFWX/UXcKXYJdunk++58jbtN9v/W+IC9AqSZBNK23zGjGGCCTmnwmwGcUCePq9xNxwfLQkawC+zQZjzlnsv9TzZRQjLRe5u9XuyYlyDZ/zhbbDvd1n0z5wqpU9bB4g1Yx7zqF9iK10P4qnjChLn4T8BB8qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZhD4euWe; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso5366355f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886424; x=1757491224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYwmni1hXWO/pBUFWlI/OZdneLuAnbaQ5tKKR7h+3l8=;
        b=ZhD4euWeZEmeELLiZZ9zs+w7zIJ3a4Ei03GIhP45lUrlk/zoCiS71ebbQNNecPLAKE
         J0GZthms7APY01Yi3le9f19QJNRIYmeVJJBmLtbC0g2985z1J6+Y5w7OlxRBUPcWXPkt
         n/y7r6h8QApmtwP6GgMFi9/j7L8BaGuRBUlBCnerGU/7bbqrOzqh6kc1BHnMH73Mt+98
         xzwp5osZZ+ANVVfQykNRHAiOxK6d6UDbs6ymdnsiLHOtVy/CQaOiKOigwcmsaTmNQAYv
         ZAfQ7YRzGlaDKNmF8H4Jrn5yQLLDR/nZWs2rm9aBOdoosJILgBN+2Dgw7z1rlk191W9e
         dT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886424; x=1757491224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYwmni1hXWO/pBUFWlI/OZdneLuAnbaQ5tKKR7h+3l8=;
        b=p9VcTr4TbXYH6KXaBKbw+ek9vRA0Pm0QT7uHr9ditP14DvsqHUoF953DLvKpNIwF+J
         55IAtf2uE5Qsb9nE6DNlriE8Y43iTQtW43Y5dboKSpWKF5Tut0ti4i4bmArxP0rxoC9t
         O1L2kRtrRgcO5YJ+QUnnypiuAk9f0LLpq4PN1r3AK/hdxrmoM2vmX0mN3cIXPbBWa6+u
         1OYKGbYVh4ZyBbdEKVMfZhET5RDXlJ/+0s7oXPp/UUZB3HbmXrDkL5JPL4WbnPcb/8Tn
         oPc1fr9cdNmuMi34ikyMOFXrJslTiefjRQN/iLKnjX/9zlgk9O+SNgfuDESgI3Dbfv1R
         vMow==
X-Gm-Message-State: AOJu0YxFV13ahme9kT1f98crBamN69B9UGFd/J4BGMp7S1t417AkjpJF
	ui1TCsFY5LL5E9fdswGgCNiC70CCZfMp+5mNAuYB/iZZnVJXfL0XDSg+NmXRK4w7em0=
X-Gm-Gg: ASbGncvtYi7/kYDD1J2FVp7JiJHVz9BtOPAlIMuTtYcb6uhLSU318l9MAudAQ5Y5yzH
	tBVeupQ73S+JuleWwTBR7VJ2Q7dOx3T//c1LtxgNxOp63AW3t/lpoLGhQsZZIDSevYiP3C8fioN
	InGiTTp61Tb/i6pYn+UvBj4xJBRlFvR19O7Z6l057SXjysYQl1PdS9kSMsj8i/Xu7WFG0VeZ7A9
	0ZMzUQloAMLB48yTr9QRLDHJInIxYOkmGnzL+jJanAdvmN7HqQle8M+WRi9BRBSx2PNSH8TLr8g
	Kv1gtB5vDrUpCoD7g2avhAhq/YimWE7DEBksPk5Ta9iD9qayNSjxAGtv77hBlKIcrp9t0OWngeR
	dFONiq/H1AroWH5W0
X-Google-Smtp-Source: AGHT+IFmkjrHAAYGj6IwtUK0RPtQQhaSyqEXfmZGy9M5k0aw4twRLthEEYHwEar7N6lyyToFTgs2NA==
X-Received: by 2002:a05:6000:2089:b0:3c9:79fe:f4f5 with SMTP id ffacd0b85a97d-3d1dc5a233dmr7864793f8f.8.1756886423609;
        Wed, 03 Sep 2025 01:00:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:07 +0200
Subject: [PATCH 03/12] gpio: idt3243x: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-3-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4965;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=e/qGrO8l+ENSlw7HsMx562UJMTgOPKWKnabZxYTV0tI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WR0q/PabxdIvdLuE5NvJ2Vf33JlqQQHM24o
 lmAyWJXZSiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kQAKCRARpy6gFHHX
 csuFD/4l6q+pYGbMLExGUqxOdQN4Qaa2wc88p4+eTqITDl6QmdBk7jg8eDU1raZaO50yTBq8nyX
 WMMpOG0CVqAwUjYw+jrfXEVBkMbnNl2HTlxp/R1SVyUyJrXtLhtwjYf2BLh18hhNKNLf+uw9nJk
 zReeTu5hD90OVTk9qoq7ZFEn61vZeEcT1qjGkM+t/JHkvh5HC4WtmC9uH7FP2PwcyreqTDTvs44
 2n+qz0lTIlHsek8dAsKIk8g/XHCXKz0k8UXTupshUiJO6x0GU9iP4VfPZeMb/QEzC3sV+TzgHxY
 cw5OvDsNufNtrHMGf5piBrg+fHvyGhlJUjyNYYweDw/20ty4XMQ7fQRpspSJ8KHjIyd5YgnUnX/
 H5r5q+z8I+EnYalW22flHyOlYK4BHdhuf3+h+jHylT6Lx2qIdDnQDjvhTuhsIUhczCfARTwdJtk
 31ylCCp8KxYth7VXtiYI3vC+Z6EHnFb8oTiaQXDSjwhum9GM/0XNpLa5lIy8FdIZe3R6KcBZzFh
 V/OeNbJ3UvbAiuVPnUkk1KAppgZ/6A9Z/KvgHLSDj4GHzGqkbPrczDKUtOoiKmg6zdK8JqjmeJk
 9dCSx+hYa2qw+joESxnZ1cep1QqyS00e/ligPrj1e8elBK2CIEcir+oHv3CtSd+blUDgw432spk
 apu8x7vO5jXT02g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-idt3243x.c | 45 ++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index 535f255144556ecb71c5e3f8756f9f4a8bd9ca3d..232a621ba086ef66b2d2f0d471388c77ac5caa5b 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -18,7 +19,7 @@
 #define IDT_GPIO_ISTAT		0x0C
 
 struct idt_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *pic;
 	void __iomem *gpio;
 	u32 mask_cache;
@@ -50,14 +51,13 @@ static int idt_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	unsigned int sense = flow_type & IRQ_TYPE_SENSE_MASK;
-	unsigned long flags;
 	u32 ilevel;
 
 	/* hardware only supports level triggered */
 	if (sense == IRQ_TYPE_NONE || (sense & IRQ_TYPE_EDGE_BOTH))
 		return -EINVAL;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 
 	ilevel = readl(ctrl->gpio + IDT_GPIO_ILEVEL);
 	if (sense & IRQ_TYPE_LEVEL_HIGH)
@@ -68,7 +68,6 @@ static int idt_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	writel(ilevel, ctrl->gpio + IDT_GPIO_ILEVEL);
 	irq_set_handler_locked(d, handle_level_irq);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 	return 0;
 }
 
@@ -84,14 +83,11 @@ static void idt_gpio_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-
-	ctrl->mask_cache |= BIT(d->hwirq);
-	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
-
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &ctrl->chip) {
+		ctrl->mask_cache |= BIT(d->hwirq);
+		writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
+	}
 
 	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
@@ -100,15 +96,13 @@ static void idt_gpio_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
-	unsigned long flags;
 
 	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 
 	ctrl->mask_cache &= ~BIT(d->hwirq);
 	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
-
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static int idt_gpio_irq_init_hw(struct gpio_chip *gc)
@@ -134,6 +128,7 @@ static const struct irq_chip idt_gpio_irqchip = {
 
 static int idt_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq;
 	struct idt_gpio_ctrl *ctrl;
@@ -150,18 +145,24 @@ static int idt_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->gpio))
 		return PTR_ERR(ctrl->gpio);
 
-	ctrl->gc.parent = dev;
+	ctrl->chip.gc.parent = dev;
 
-	ret = bgpio_init(&ctrl->gc, &pdev->dev, 4, ctrl->gpio + IDT_GPIO_DATA,
-			 NULL, NULL, ctrl->gpio + IDT_GPIO_DIR, NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = ctrl->gpio + IDT_GPIO_DATA,
+		.dirout = ctrl->gpio + IDT_GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&ctrl->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize the generic GPIO chip\n");
 		return ret;
 	}
 
 	ret = device_property_read_u32(dev, "ngpios", &ngpios);
 	if (!ret)
-		ctrl->gc.ngpio = ngpios;
+		ctrl->chip.gc.ngpio = ngpios;
 
 	if (device_property_read_bool(dev, "interrupt-controller")) {
 		ctrl->pic = devm_platform_ioremap_resource_byname(pdev, "pic");
@@ -172,7 +173,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
 		if (parent_irq < 0)
 			return parent_irq;
 
-		girq = &ctrl->gc.irq;
+		girq = &ctrl->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &idt_gpio_irqchip);
 		girq->init_hw = idt_gpio_irq_init_hw;
 		girq->parent_handler = idt_gpio_dispatch;
@@ -188,7 +189,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_bad_irq;
 	}
 
-	return devm_gpiochip_add_data(&pdev->dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(&pdev->dev, &ctrl->chip.gc, ctrl);
 }
 
 static const struct of_device_id idt_gpio_of_match[] = {

-- 
2.48.1


