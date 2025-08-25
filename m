Return-Path: <linux-gpio+bounces-24912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFDAB33BB1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D902D1889DA5
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A622D6E77;
	Mon, 25 Aug 2025 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CoUc3fsV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566452D5C97
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115347; cv=none; b=S9K23zGaaDhfszb4T5bgDCtTaMlKyM7otLeqHXHDC7tVRwtfFuKsCmSTx88mY0yQMs3C9iq0sDIK7QmIy6BqVQptAWWKMakcKnC2Kj2JGieiUE7B73/xfhxGxUXRUW2uhMEUEfDfvlMlmIXRM0bFS61mUugmehi7r1QVZ4AaUK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115347; c=relaxed/simple;
	bh=XQaqdc0ktGejmmosFBqHjv8XgXq7TD5YtWkDbZc/RV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iexHKudj82+wS6BVkTW/v8ST7V6TIZz9apBC88kIjRH1zUOZN5/P/paVUKNALdK5CYdN7cvlkqw/vQWFmMgRu6J1OZqXCyCfKXltQEtXaDuWCuPjOIdLMrre2Umcy02pktOlQTu4/WpLlu8jWEllM6HlfVp+8oPPiLEeGlY8FJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CoUc3fsV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso1516225f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115343; x=1756720143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3Pd+f1W3JQ+RXDpdyFAaWwHwzHpzCLOKtOb/pgFbgs=;
        b=CoUc3fsVJsoMVguFJarG3Jaba92ON72FGn2QcxLN9SbJ7eWSYDOuGkuxFM6vbECjhX
         +K4HLwjBWJiDu6HaY658a7Kze2p09kKYA0xmxodQlhjRZOKAPTse4jgjxFEzXe65nEV2
         6S6PNvmE2WfyPL+uokTFWewNBnukNnDelDRIO2uA3OKtpXm5raR584CsunUUD0TuMM6/
         Yj/KMeB5kdWihZkLgn6eT9sy2Xhv28VDKGz8nxT+P5RshZx8A+VlOlkagcvCYgatD3zD
         te5WUpJcD3xaFtmGu4jKY279VJFzkUrZYtWte3saFv96L2IYbROhUHsaYvHpU7Co500I
         khnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115343; x=1756720143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3Pd+f1W3JQ+RXDpdyFAaWwHwzHpzCLOKtOb/pgFbgs=;
        b=ifIk5nhIk08U0ex/odxAzYcFdkqtGaE1Eyu37nPooTcncsnfoRwRerMxfrDxdNRBPc
         tW+mEzSGPvCh4L1CQ6Dr447ezZm1zcqYrheGfDfVOnl2qkWCkfmq23P44Zyh+CQHnsQJ
         BFo/WrX5WceHVO/tP5qwJwR4M75dhT5/WDpSa/T4Q1wuTGL3q2LnR+nahwBA1FzhXQqG
         5ZN62aDxXCWBb9WbPoT8mZiV2PGp0mjGjPQNZn1hAtrARy/tvwNJQNHK3MC70Nxege5m
         oWVkInOTMwBd1hkbSKm+e7oJTJd2ul/kFnk1phW3C8JhKVXOFZyL+OYZ6UmwRhWyyrAj
         sgtA==
X-Gm-Message-State: AOJu0YyZdCxrdn91d34ZRyqRq/UTig1IQJDDvqLOuQvFDPdOP68XqnYu
	8K3llymylY3JRKKGVLAlE9OpreonON35a8N/T6fQ39z8pduJ5dbd8iPqB0XTxzYzPPY=
X-Gm-Gg: ASbGnct9X+Ac7+56fq1mObXjoSKNU82RsyLEjE9sTDp0ASc6sHHOwV8++sIKp+xr8qC
	E84/0AFFvl2qo830h34m2QytJOCOjJdo+dlrYkp+oR//82rwknfG+2fjm4rOfc6OcrZqbsGqGKj
	p1vTxNsH7hxiZKNsNg2k6JT8dO7zZKJG5mMTTavjMt9Ch82cMKiwRWVGlylEbfOFVoygiK59j8s
	s3/po0HYoisH76pQFOOWCmJZpJS3CwZPKFmzL1Buq0b7RwyK1iTUjkqpIafYI3Uf39DLKIPuidt
	655X6L1N6X59ZcxAXiR6Vc/mKxrz4GHGI8VphHiOaRYyR3W3bZFWNxdnVgq2E4U9yqGgtYF8VaM
	2qyrd8rZ9KYTJsC9ksg==
X-Google-Smtp-Source: AGHT+IF+DGK7ah98d14Q5J3T1B+5aP3g73ZZMrERf7ASzZkA8tqeaNAu5LBRINhnoLPrv7wp1bRzuw==
X-Received: by 2002:a05:6000:24c3:b0:3b8:d901:fa33 with SMTP id ffacd0b85a97d-3c5dcc0777amr10149165f8f.42.1756115343472;
        Mon, 25 Aug 2025 02:49:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:49:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:53 +0200
Subject: [PATCH RESEND 12/14] gpio: grgpio: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-12-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7995;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AGhvI8vG5SGj9cxXM06eRQt9v1ofBIcmVl22/TTQOT4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDGA9kgZKs4xdDRJcuUH/c6fDnvRy2++EFeeH
 BLsDoydZRSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxgAAKCRARpy6gFHHX
 cl0wEACkbnVrJ7x5Ll/WAAt1ahr6Mj8tuq5YzD7ax3FC6HC4CvaZ6WH/SO/ryTLaakUgwKh3j7N
 fO6l5uFW/wcVU6prgm1r2D2E1oqitoecvCXLhZC0VAfh4ObP+4w1Fhxdb9A9I7LbFoG4C664OJV
 cyCTS+m0GQJBdbplb5e6OYlaXR8sR+2avVJUCud8fyGapgpX4V/aCMEg5zZGS4W1l7F0HSD3dYz
 T15xIr4wwVOlPY0nJea7yuf+Z1iV0Wa3gc1KwcYr9jsZzxCl8pLeHK3WV8zZ+EQvLMjzxcX1MLU
 Nvu0n5R7PgGbDoGLaA61I/ZMO/+CU1HCFOin34RQRAByZ4hlEJt0W2d8WIAqU7oBbixLJnj+wwV
 k2CiHst9w3fOMQ5itLFjIbXQn4cSKshlOY7N5MmkqN+PVSuouHdeZlOenr7aUBlGxTUbd765l5a
 IEfCnuVl2zEqwji8aeb2IUIe89qR5amnHDCgcYcIA1Xs2lZInlSgI14GOBT9PouQsvcmrAGM/rG
 ctVqqUrYD3L+Els1XqQiXtdYGmnZkjPN94CjBQosv449aDZxGgVSrjb7+Y1yTZeIxhV4R7Nu8OD
 puAoBZX9YhLg8JhZRoR2ubcndD5V8tlFRtHjHYfi/NjnTF3GKI46+u4zFCBkdfw/aJgfY9lrMxA
 EkZE+UGaqA8mVBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-grgpio.c | 87 +++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index f3f8bab62f94cefb69d31d76b961ab2d346df49e..3b77fad00749cd5218268b267b5848515c6a26fc 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -19,6 +19,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -59,7 +60,7 @@ struct grgpio_lirq {
 };
 
 struct grgpio_priv {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *regs;
 	struct device *dev;
 
@@ -91,13 +92,12 @@ struct grgpio_priv {
 static void grgpio_set_imask(struct grgpio_priv *priv, unsigned int offset,
 			     int val)
 {
-	struct gpio_chip *gc = &priv->gc;
-
 	if (val)
 		priv->imask |= BIT(offset);
 	else
 		priv->imask &= ~BIT(offset);
-	gc->write_reg(priv->regs + GRGPIO_IMASK, priv->imask);
+
+	gpio_generic_write_reg(&priv->chip, priv->regs + GRGPIO_IMASK, priv->imask);
 }
 
 static int grgpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -118,7 +118,6 @@ static int grgpio_to_irq(struct gpio_chip *gc, unsigned offset)
 static int grgpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct grgpio_priv *priv = irq_data_get_irq_chip_data(d);
-	unsigned long flags;
 	u32 mask = BIT(d->hwirq);
 	u32 ipol;
 	u32 iedge;
@@ -146,15 +145,13 @@ static int grgpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&priv->chip);
 
-	ipol = priv->gc.read_reg(priv->regs + GRGPIO_IPOL) & ~mask;
-	iedge = priv->gc.read_reg(priv->regs + GRGPIO_IEDGE) & ~mask;
+	ipol = gpio_generic_read_reg(&priv->chip, priv->regs + GRGPIO_IPOL) & ~mask;
+	iedge = gpio_generic_read_reg(&priv->chip, priv->regs + GRGPIO_IEDGE) & ~mask;
 
-	priv->gc.write_reg(priv->regs + GRGPIO_IPOL, ipol | pol);
-	priv->gc.write_reg(priv->regs + GRGPIO_IEDGE, iedge | edge);
-
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+	gpio_generic_write_reg(&priv->chip, priv->regs + GRGPIO_IPOL, ipol | pol);
+	gpio_generic_write_reg(&priv->chip, priv->regs + GRGPIO_IEDGE, iedge | edge);
 
 	return 0;
 }
@@ -163,29 +160,23 @@ static void grgpio_irq_mask(struct irq_data *d)
 {
 	struct grgpio_priv *priv = irq_data_get_irq_chip_data(d);
 	int offset = d->hwirq;
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &priv->chip)
+		grgpio_set_imask(priv, offset, 0);
 
-	grgpio_set_imask(priv, offset, 0);
-
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
-
-	gpiochip_disable_irq(&priv->gc, d->hwirq);
+	gpiochip_disable_irq(&priv->chip.gc, d->hwirq);
 }
 
 static void grgpio_irq_unmask(struct irq_data *d)
 {
 	struct grgpio_priv *priv = irq_data_get_irq_chip_data(d);
 	int offset = d->hwirq;
-	unsigned long flags;
 
-	gpiochip_enable_irq(&priv->gc, d->hwirq);
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	gpiochip_enable_irq(&priv->chip.gc, d->hwirq);
+
+	guard(gpio_generic_lock_irqsave)(&priv->chip);
 
 	grgpio_set_imask(priv, offset, 1);
-
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
 }
 
 static const struct irq_chip grgpio_irq_chip = {
@@ -200,12 +191,11 @@ static const struct irq_chip grgpio_irq_chip = {
 static irqreturn_t grgpio_irq_handler(int irq, void *dev)
 {
 	struct grgpio_priv *priv = dev;
-	int ngpio = priv->gc.ngpio;
-	unsigned long flags;
+	int ngpio = priv->chip.gc.ngpio;
 	int i;
 	int match = 0;
 
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&priv->chip);
 
 	/*
 	 * For each gpio line, call its interrupt handler if it its underlying
@@ -221,8 +211,6 @@ static irqreturn_t grgpio_irq_handler(int irq, void *dev)
 		}
 	}
 
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
-
 	if (!match)
 		dev_warn(priv->dev, "No gpio line matched irq %d\n", irq);
 
@@ -253,13 +241,18 @@ static int grgpio_irq_map(struct irq_domain *d, unsigned int irq,
 	dev_dbg(priv->dev, "Mapping irq %d for gpio line %d\n",
 		irq, offset);
 
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	gpio_generic_chip_lock_irqsave(&priv->chip, flags);
 
 	/* Request underlying irq if not already requested */
 	lirq->irq = irq;
 	uirq = &priv->uirqs[lirq->index];
 	if (uirq->refcnt == 0) {
-		raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+		/*
+		 * FIXME: This is not how locking works at all, you can't just
+		 * release the lock for a moment to do something that can't
+		 * sleep...
+		 */
+		gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
 		ret = request_irq(uirq->uirq, grgpio_irq_handler, 0,
 				  dev_name(priv->dev), priv);
 		if (ret) {
@@ -268,11 +261,11 @@ static int grgpio_irq_map(struct irq_domain *d, unsigned int irq,
 				uirq->uirq);
 			return ret;
 		}
-		raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+		gpio_generic_chip_lock_irqsave(&priv->chip, flags);
 	}
 	uirq->refcnt++;
 
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+	gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
 
 	/* Setup irq  */
 	irq_set_chip_data(irq, priv);
@@ -290,13 +283,13 @@ static void grgpio_irq_unmap(struct irq_domain *d, unsigned int irq)
 	struct grgpio_lirq *lirq;
 	struct grgpio_uirq *uirq;
 	unsigned long flags;
-	int ngpio = priv->gc.ngpio;
+	int ngpio = priv->chip.gc.ngpio;
 	int i;
 
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
 
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	gpio_generic_chip_lock_irqsave(&priv->chip, flags);
 
 	/* Free underlying irq if last user unmapped */
 	index = -1;
@@ -315,13 +308,13 @@ static void grgpio_irq_unmap(struct irq_domain *d, unsigned int irq)
 		uirq = &priv->uirqs[lirq->index];
 		uirq->refcnt--;
 		if (uirq->refcnt == 0) {
-			raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+			gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
 			free_irq(uirq->uirq, priv);
 			return;
 		}
 	}
 
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+	gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
 }
 
 static void grgpio_irq_domain_remove(void *data)
@@ -341,6 +334,7 @@ static const struct irq_domain_ops grgpio_irq_domain_ops = {
 static int grgpio_probe(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
+	struct gpio_generic_chip_config config;
 	struct device *dev = &ofdev->dev;
 	void  __iomem *regs;
 	struct gpio_chip *gc;
@@ -359,17 +353,24 @@ static int grgpio_probe(struct platform_device *ofdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	gc = &priv->gc;
-	err = bgpio_init(gc, dev, 4, regs + GRGPIO_DATA,
-			 regs + GRGPIO_OUTPUT, NULL, regs + GRGPIO_DIR, NULL,
-			 BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = regs + GRGPIO_DATA,
+		.set = regs + GRGPIO_OUTPUT,
+		.dirout = regs + GRGPIO_DIR,
+		.flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER,
+	};
+
+	gc = &priv->chip.gc;
+	err = gpio_generic_chip_init(&priv->chip, &config);
 	if (err) {
-		dev_err(dev, "bgpio_init() failed\n");
+		dev_err(dev, "failed to initialize the generic GPIO chip\n");
 		return err;
 	}
 
 	priv->regs = regs;
-	priv->imask = gc->read_reg(regs + GRGPIO_IMASK);
+	priv->imask = gpio_generic_read_reg(&priv->chip, regs + GRGPIO_IMASK);
 	priv->dev = dev;
 
 	gc->owner = THIS_MODULE;

-- 
2.48.1


