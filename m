Return-Path: <linux-gpio+bounces-24298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6BCB2268B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0753F1B604E1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DAC2F5320;
	Tue, 12 Aug 2025 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e6RaY7Q+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05D02F4A13
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000788; cv=none; b=DcGWxmFB9DL03QUFy4dkRjsLPz7jgmyO/hZiEMmFehSJLE2oXh/Rqzk/t+lzTp9nPrWqw4lfSekXIVwkFc2VI3TvVBQrzzuCVSlEyYlFamZQUe9kyxs41aTxQJ7pnqE2kg5g+GfscRqtf3ryOOGsWMSVO/B0qlBtdkAmExLVvHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000788; c=relaxed/simple;
	bh=XQaqdc0ktGejmmosFBqHjv8XgXq7TD5YtWkDbZc/RV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hizPBagLaG3pFekEGqG+z1vlCR0g/qvcqHaEsjS9GQiMTYI6PdP1tGfAf6R3Xc10IEdNqs+K/xp/AGkcnbn/+I/VRqYSqAn5gMWmyxL/RR8a0i/94Zeb1aPfmwSirCMPWoED/UKuR5YE/D43Kac9/z1EtvUau/hA2GK8EVTehUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e6RaY7Q+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so36768765e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000785; x=1755605585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3Pd+f1W3JQ+RXDpdyFAaWwHwzHpzCLOKtOb/pgFbgs=;
        b=e6RaY7Q+C2c/vXB1EOt38lZ+4FV5MExdit7xYy6imotQkERil+sSXF+clDE2N+7Q2n
         bf9DLQ4rBmnmiQUKDKcE/lmRY1iggB+LAKRDqvUD5tdykrUASztOqxopY3EsuiQZxr7B
         ervFmI20uPX2stxcKHz2V2yOgBXdV/eDKVSbsbvffWZ9s15qY9lBrZKi/56COLtcUbge
         CVnH7A+Woj0srt1rfnJoGFIclQZHfw0S7rCueb13FKDs+v4x56ZKUvfbQ09r28JsZMc6
         7pm0GEYA/tN32ttkyv9wqNwz/hbWzI0h6bVWu+0ewBJp1emL17vU59Q1A0/UMN2ox5Jt
         CXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000785; x=1755605585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3Pd+f1W3JQ+RXDpdyFAaWwHwzHpzCLOKtOb/pgFbgs=;
        b=rwqEt/Kctra3OdSYn+OB35GeD0f0ImZdvhereilMO2WVxbhrcBNfd4ASEIWwpdOriv
         /FM2EZjJdKQggev4Z9czprKn2WCQHLkbp8HyGs7r8VmySDjrTao6kCASXD+OkYT+07+m
         12m6RSRGqlg4n3SdBaeMkXvhvpZhJty2lj0Yw8AMiSFLMEcDwRnlvhOGYhqzdjn6yigR
         ZQmovR5MkZBXJmDsmMfmoP1Kw6ktdnnfFcirarWC+P4ukE6dOVJqGYd3SE25F++wUhQc
         IzQclh6fgQuJ8DEpNb3CH0JM71QiEh8/uAhRonY4XMe9iMl75+YsOZbzf7gP7UK2s+vI
         i38w==
X-Gm-Message-State: AOJu0YytM3mlTACvoyt9cpCpk+21ahBctDSe18vtbuuPtfHRxTOZQ/Dq
	CbMhgoCAPgeVP7N5InbRhh4y+lVBPlDXGlTcdKdGB+B9cSBujol/GcLZVG2/UZ1dceA=
X-Gm-Gg: ASbGncsTS5v+dfFftwHrwXKolw/ya8c1R2NFM7iC94CEdFisqsXzipEetfpvy3dust4
	vCMFrLS42usyDayrprFRdANO+DZRQJubFueBQDBgqBBB+dCpjxtkNn3P/Fq8ThN1f4IKYDhfTiu
	YiEtPosWp8v9AZiaW86QVYeEKxToTaInucnGLSZ3uwGxPFJYc7ApKRtuagH9fcuzSlb5qeQV1x/
	kbGB4NXQ54mV4kww/Md7FUhNVASU6W0Apz3Yvpvd8srsr5psFqoWsaNCohYgnxALPetp/5Sa7To
	u+XQVr+gBHOjh4vNgMRh4oLmZqQ2nR6udkiRjPw8BmZ3tbl6OTON9y5WDUYQZV4dMXam9BcO3/4
	7rmVlFMPMvF8USME=
X-Google-Smtp-Source: AGHT+IG1WS2cU9iAdxyNt0tdEubOZVkzJVBf0n8UFq8TU+Dupa4pxhDLiX/e/pVHSxsONcnfbUvwXg==
X-Received: by 2002:a5d:660f:0:b0:3b9:132a:a554 with SMTP id ffacd0b85a97d-3b9132aa8c4mr1615617f8f.51.1755000785150;
        Tue, 12 Aug 2025 05:13:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:13:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:54 +0200
Subject: [PATCH RESEND 12/14] gpio: grgpio: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-12-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/B2uC99j03LG6YqrSjYI1DM3Eo3y3JKfFEx
 QfAdkwocqqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwQAKCRARpy6gFHHX
 chomD/99PF5ZgALZBSBXLGEmNVP7fTB67ncQva5kxfSiNoteRRRSkHkgyCVNYJysG2jPmja7155
 ulYjRWLmnmVbYErcjNj5Nvg0VL/vAOSPQX1cl1f0c84S2aDWvq3ZFVZSEDm7gh5EpQRX4TRzmGg
 onz7NzmDK4Y+0azft8KtDcvi/d9fHs8KIS+x18FgiCaNK+CajZXvfFtrYfARotRnPjIFOcs7srb
 fYZwT9K4zO4GEwdxNJRugc5TARAcIcB03ts+P9hfmfgO/joVcjAcziRcj/gUQcCBydm3esCULXJ
 1D2GxsOZ2QUbFZMuKyawmi8yKzIL4XRx/ba/B9i5Lyav5+vVBna0IrbhlpYiLIb6JQRh5h3MJUg
 PdgU8SBqGgxxUUeS0UESQpmBkgdJ7aHfKg84ILJOpsUYuV0BO+43Njn2T+9bpQqa4l3vBWLZqI6
 JDzhxB8Z8a4HwaSJcLb5eUCLZNA0s9BQfWwdlOcXhFpT5KwfiYmXF5Jz5KcOVoZYJmtAgS2OgYR
 0cQWDr34AuW+XtCcXmTe6uliwoo+vUA0oqxTIppfpBzHfV0nw8Jp0+09ZCBbFjProMX0JoP/d6J
 wVO/DYB19bf8sSMEZIN1kQplBcUH9QbtQoug0Hsr+NbStzWLjoSMFWcuqre6llR2E4IjU1sIiIz
 Ph/5uDayKWYxl8A==
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


