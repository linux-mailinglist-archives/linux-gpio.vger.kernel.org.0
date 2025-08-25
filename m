Return-Path: <linux-gpio+bounces-24913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DACB33BB4
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C58F8188E899
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862302D7801;
	Mon, 25 Aug 2025 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HocPE5J5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EB3222562
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115348; cv=none; b=WhTuXILOl+d358roVtUw9+3yeQyVSzHk+k5P9u8K8TA+r1muWYFbd4gGFHfrZ2sVfdIf5BWWGqIhMY2CNli3+YVCpvsLImlcqhaGwaTjzlt7saTEhOPtXPalrdM1uLQTCtIGoXrbSSDXd+Z3L8g3vR/Rfh/vPf03zeGvK+2QKCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115348; c=relaxed/simple;
	bh=hum5I1GPDuLqOSB9j4Zgav5iBNyPswfyro5xC1hpoVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KDoLMKRsF/TRnmWNpsRJLhzDfxpEd3atFMTRDdK8Phdu69vT0oGSpphO7pN7pT1XgbijPDYV+N2OLH0iAwPTYGb43BwgHNdiJ/Vue/1RS+QKSReCEwBao44UQDtSaRWBOGthWCBKUQBIEara+Obl0PMToJ44hLbXWLCS495RwfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HocPE5J5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b00797dso33041255e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115345; x=1756720145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnIvSpX6XaNR1KpnyS1XpJFUwit84iSFYji6KHBKLOk=;
        b=HocPE5J5Lu6D/A/Iw5Wn83CNwazFQYgd5fnkv+g6oQ5VJobrVFgBbf7NDpNhFCcOt2
         BUc0gElCrkihfC77rms6Dx1jYzZXq0gzHtwFXudsSIiHS/JP+8XaPR/6wjtSXyYmU4GB
         dTT4A4gq94aH9ulofrTjQ3Q6n2YdjfZvm80OK4trPrEZhieB5RD7WMn5LMX/pGPMCTL3
         Nd35LAyYdGNYQFU6AsfYLXLMiOLq07mxetwhR6k9kL4qZCc7tHnsBFGEA5O69lumJ5cp
         W/G2P8y/7ZYU62a10ruS3ZOSlbAlmDRG9mIqPXEsI2hYwUvpHFZvo9mZBSbIMvE2Ivgw
         I6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115345; x=1756720145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnIvSpX6XaNR1KpnyS1XpJFUwit84iSFYji6KHBKLOk=;
        b=Oaxgt2VzUeq6cXt4JFedpJH2cqKS865Hsfav8JiRyES3jfCrjpzkps2xM7ja2987M+
         VFrJ4Ar5gf1ncvBbjAoaeGIs0fT38QV2tDIW5lE3MguvYRf5ucnvvm+0HFSP9H5xuBKx
         XhB0F/DOYqCDnQaduqtyVaALyDyrfY2RbBBbdwCliSWYd/gflLBQHTIi24t3OVI0eMGS
         h/LRQqIhQYztZtxZAC7zdIpKTihw02JUxoNJGRhgcSMqf4+WvV/RVXaaDjiiZ5GDaMOs
         ITpSdU0njRhifs8TY7IoBmOcnhKWZQlGTohxHh6aJCc7C0266qYPqyIY/EIpVgAC32Dr
         SMlQ==
X-Gm-Message-State: AOJu0YyyFXpU3AG2HstsmoI27XkVKrcFWLJV+AWXOJ7KBE2Afa9BrHEb
	EzFvrdzRBjVLt2NqiXGrDUDoSqZBLoovUeXGezw4x+LfrOj835nw3rZG66R5JWEeCyw=
X-Gm-Gg: ASbGncvnCKWoLhL7UNg7JVzOEGGYs2viJPs+wAh7yUD1HSyInPXLmmvsAE1q35aJYqT
	slp/yV3G+jn+TZ0old7B7bHFgZEfVVBoc7+qFVpUY93d8BKm9SKFwn5OeXkUgVoH8BVm8vmjj2Y
	pKPP4qgGV03Txsw709AhT+g9NVQtB5TvCln1fHLD4d3zKd1qolH5enXkycBk1KjowaktVxTyb6U
	ub3CFVwWOm4GNYQD8QU+Eg3ZMFS3oLDalHheNrF7ZdbH+l2FFI2SWGct4u7KjQg7ErK5D8DDCYA
	JK7ymgtYgDBCaNYVGeYtMesfg8c5EH1C3USf+HbpnXf2dXl/zUWfO0znrEYynv47Bl1B4PDXFmT
	ZirUdzI6YCQ/VdtLCCg==
X-Google-Smtp-Source: AGHT+IG16Vk1oAADcf2tKKMlQW20YxVITJDeKRUq+CWLvo6Qa5c/sMUP4UJmgZHpEofTALTKNOQBfA==
X-Received: by 2002:a05:6000:1881:b0:3c9:24f5:470c with SMTP id ffacd0b85a97d-3c924f54bfemr2819993f8f.42.1756115344648;
        Mon, 25 Aug 2025 02:49:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:49:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:54 +0200
Subject: [PATCH RESEND 13/14] gpio: mpc8xxx: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-13-356b4b1d5110@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10008;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8xlnAhAzfwO4+HhxnfhDkoiDZ7pkFtIamWGlMtDqlhM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDGAf7tPAAs+l1JeaG+mB0PRgBMQttnEOo/AN
 +lu29h0TJOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxgAAKCRARpy6gFHHX
 ckhAD/93TqSAaRskVVoK3MfNfb4UbXffJdI73/IvgWbXLS9h972jdGVx8f8sOYaaD7OFy6blc8L
 3yPGdSKtokC922c3mzsplBLSI5NNKk+2lCGubHU39muVBKmW3Pm8udEnebzAYzYFpapzqZpm83z
 z2xt6Jz42VGiOQ3cxrWg6TWDLqmLvn+lxU6ZRYFfJyunaj1+bkWaBR1ZDWBuIyhTiQ2wa7JwcQe
 OWjB1ncUqBUzuMYrczGWYKoS6Hd+VI+MgpLV5gLbtqL5MS4QKkAjXgwTrLtFZUdnYNgMNxoIk6i
 vydOKmmioVLskgqJ/FBZJMC+qxdR5O0YnA7AcuyvPLCZcQW2us3SQepQJyu7++ILB+qQEWBOZG8
 2WfeaOIPMCFYeDpYNzhAu2dTGJo96ncuCel47uatnXeidoBUvRwcSidwL1l0gki7k0Q/MSUHokR
 GiMa7MPimmzMkJcE0weWAoCggKxxKELqDfWO7PPQEkrpoHcamAaAJTH+hc3WfmwA9xeW5R8j32N
 bv4tXZs2zExOmA7R7dV9kvHxtThR9hc8qdy2bUNlHkT1/0byYPoVNGm+sr9Joc42CCEPNPlp1lo
 FBb3JcJiindPn79p0V39AjyxN8dP5/Tcic1VqguAqACaBfqVFz11mBmntFVBXOsCs5GDGcsbGJG
 dJPotEspK3Pn6ow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 102 +++++++++++++++++++++++++++-----------------
 1 file changed, 62 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 121efdd71e451d4f992fa195b0d56d7146a6f3dd..38643fb813c562957076aab48d804f8048cee5e4 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -9,6 +9,7 @@
 #include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -34,7 +35,7 @@
 #define GPIO_IBE		0x18
 
 struct mpc8xxx_gpio_chip {
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	void __iomem *regs;
 	raw_spinlock_t lock;
 
@@ -66,8 +67,10 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
 	u32 out_mask, out_shadow;
 
-	out_mask = gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
-	val = gc->read_reg(mpc8xxx_gc->regs + GPIO_DAT) & ~out_mask;
+	out_mask = gpio_generic_read_reg(&mpc8xxx_gc->chip,
+					 mpc8xxx_gc->regs + GPIO_DIR);
+	val = gpio_generic_read_reg(&mpc8xxx_gc->chip,
+				    mpc8xxx_gc->regs + GPIO_DAT) & ~out_mask;
 	out_shadow = gc->bgpio_data & out_mask;
 
 	return !!((val | out_shadow) & mpc_pin2mask(gpio));
@@ -108,12 +111,13 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *data)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = data;
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned long mask;
 	int i;
 
-	mask = gc->read_reg(mpc8xxx_gc->regs + GPIO_IER)
-		& gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR);
+	mask = gpio_generic_read_reg(&mpc8xxx_gc->chip,
+				     mpc8xxx_gc->regs + GPIO_IER) &
+	       gpio_generic_read_reg(&mpc8xxx_gc->chip,
+				     mpc8xxx_gc->regs + GPIO_IMR);
 	for_each_set_bit(i, &mask, 32)
 		generic_handle_domain_irq(mpc8xxx_gc->irq, 31 - i);
 
@@ -124,15 +128,17 @@ static void mpc8xxx_irq_unmask(struct irq_data *d)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
+	struct gpio_chip *gc = &mpc8xxx_gc->chip.gc;
 	unsigned long flags;
 
 	gpiochip_enable_irq(gc, hwirq);
 
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
-		gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
+	gpio_generic_write_reg(&mpc8xxx_gc->chip,
+			       mpc8xxx_gc->regs + GPIO_IMR,
+		gpio_generic_read_reg(&mpc8xxx_gc->chip,
+				      mpc8xxx_gc->regs + GPIO_IMR)
 		| mpc_pin2mask(irqd_to_hwirq(d)));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
@@ -142,13 +148,14 @@ static void mpc8xxx_irq_mask(struct irq_data *d)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
+	struct gpio_chip *gc = &mpc8xxx_gc->chip.gc;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
-		gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
+	gpio_generic_write_reg(&mpc8xxx_gc->chip, mpc8xxx_gc->regs + GPIO_IMR,
+		gpio_generic_read_reg(&mpc8xxx_gc->chip,
+				      mpc8xxx_gc->regs + GPIO_IMR)
 		& ~mpc_pin2mask(irqd_to_hwirq(d)));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
@@ -159,32 +166,34 @@ static void mpc8xxx_irq_mask(struct irq_data *d)
 static void mpc8xxx_irq_ack(struct irq_data *d)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER,
+	gpio_generic_write_reg(&mpc8xxx_gc->chip, mpc8xxx_gc->regs + GPIO_IER,
 		      mpc_pin2mask(irqd_to_hwirq(d)));
 }
 
 static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned long flags;
 
 	switch (flow_type) {
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_LEVEL_LOW:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
-			gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
+		gpio_generic_write_reg(&mpc8xxx_gc->chip,
+				       mpc8xxx_gc->regs + GPIO_ICR,
+			gpio_generic_read_reg(&mpc8xxx_gc->chip,
+					      mpc8xxx_gc->regs + GPIO_ICR)
 			| mpc_pin2mask(irqd_to_hwirq(d)));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
-			gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
+		gpio_generic_write_reg(&mpc8xxx_gc->chip,
+				       mpc8xxx_gc->regs + GPIO_ICR,
+			gpio_generic_read_reg(&mpc8xxx_gc->chip,
+					      mpc8xxx_gc->regs + GPIO_ICR)
 			& ~mpc_pin2mask(irqd_to_hwirq(d)));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
@@ -199,7 +208,6 @@ static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
 static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned long gpio = irqd_to_hwirq(d);
 	void __iomem *reg;
 	unsigned int shift;
@@ -217,7 +225,9 @@ static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_LEVEL_LOW:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		gc->write_reg(reg, (gc->read_reg(reg) & ~(3 << shift))
+		gpio_generic_write_reg(&mpc8xxx_gc->chip, reg,
+				       (gpio_generic_read_reg(&mpc8xxx_gc->chip,
+							      reg) & ~(3 << shift))
 			| (2 << shift));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
@@ -225,14 +235,18 @@ static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	case IRQ_TYPE_EDGE_RISING:
 	case IRQ_TYPE_LEVEL_HIGH:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		gc->write_reg(reg, (gc->read_reg(reg) & ~(3 << shift))
+		gpio_generic_write_reg(&mpc8xxx_gc->chip, reg,
+				       (gpio_generic_read_reg(&mpc8xxx_gc->chip,
+							      reg) & ~(3 << shift))
 			| (1 << shift));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		gc->write_reg(reg, (gc->read_reg(reg) & ~(3 << shift)));
+		gpio_generic_write_reg(&mpc8xxx_gc->chip, reg,
+				       (gpio_generic_read_reg(&mpc8xxx_gc->chip,
+							      reg) & ~(3 << shift)));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
@@ -309,6 +323,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 static int mpc8xxx_probe(struct platform_device *pdev)
 {
 	const struct mpc8xxx_gpio_devtype *devtype = NULL;
+	struct gpio_generic_chip_config config;
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc;
 	struct device *dev = &pdev->dev;
 	struct fwnode_handle *fwnode;
@@ -327,26 +342,28 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (IS_ERR(mpc8xxx_gc->regs))
 		return PTR_ERR(mpc8xxx_gc->regs);
 
-	gc = &mpc8xxx_gc->gc;
+	gc = &mpc8xxx_gc->chip.gc;
 	gc->parent = dev;
 
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = mpc8xxx_gc->regs + GPIO_DAT,
+		.dirout = mpc8xxx_gc->regs + GPIO_DIR,
+		.flags = BGPIOF_BIG_ENDIAN
+	};
+
 	if (device_property_read_bool(dev, "little-endian")) {
-		ret = bgpio_init(gc, dev, 4, mpc8xxx_gc->regs + GPIO_DAT,
-				 NULL, NULL, mpc8xxx_gc->regs + GPIO_DIR,
-				 NULL, BGPIOF_BIG_ENDIAN);
-		if (ret)
-			return ret;
 		dev_dbg(dev, "GPIO registers are LITTLE endian\n");
 	} else {
-		ret = bgpio_init(gc, dev, 4, mpc8xxx_gc->regs + GPIO_DAT,
-				 NULL, NULL, mpc8xxx_gc->regs + GPIO_DIR,
-				 NULL, BGPIOF_BIG_ENDIAN
-				 | BGPIOF_BIG_ENDIAN_BYTE_ORDER);
-		if (ret)
-			return ret;
+		config.flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
 		dev_dbg(dev, "GPIO registers are BIG endian\n");
 	}
 
+	ret = gpio_generic_chip_init(&mpc8xxx_gc->chip, &config);
+	if (ret)
+		return ret;
+
 	mpc8xxx_gc->direction_output = gc->direction_output;
 
 	devtype = device_get_match_data(dev);
@@ -379,10 +396,13 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	    device_is_compatible(dev, "fsl,ls1028a-gpio") ||
 	    device_is_compatible(dev, "fsl,ls1088a-gpio") ||
 	    is_acpi_node(fwnode)) {
-		gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
+		gpio_generic_write_reg(&mpc8xxx_gc->chip,
+				       mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
 		/* Also, latch state of GPIOs configured as output by bootloader. */
-		gc->bgpio_data = gc->read_reg(mpc8xxx_gc->regs + GPIO_DAT) &
-			gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
+		gc->bgpio_data = gpio_generic_read_reg(&mpc8xxx_gc->chip,
+						       mpc8xxx_gc->regs + GPIO_DAT) &
+				 gpio_generic_read_reg(&mpc8xxx_gc->chip,
+						       mpc8xxx_gc->regs + GPIO_DIR);
 	}
 
 	ret = devm_gpiochip_add_data(dev, gc, mpc8xxx_gc);
@@ -405,8 +425,10 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		return 0;
 
 	/* ack and mask all irqs */
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
+	gpio_generic_write_reg(&mpc8xxx_gc->chip,
+			       mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
+	gpio_generic_write_reg(&mpc8xxx_gc->chip,
+			       mpc8xxx_gc->regs + GPIO_IMR, 0);
 
 	ret = devm_request_irq(dev, mpc8xxx_gc->irqn,
 			       mpc8xxx_gpio_irq_cascade,

-- 
2.48.1


