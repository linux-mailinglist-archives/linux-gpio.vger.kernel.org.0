Return-Path: <linux-gpio+bounces-25793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38213B4A7EF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5FB03B9918
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA4130F524;
	Tue,  9 Sep 2025 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GMuSDjPd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE430C62A
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 09:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409368; cv=none; b=FmRAxZ7V4tPnU1IK49llL9BWvZb/pl5KQZSHLCHwr5lQ41zi6GBN6ty6hKexxpFJcumrl2SDip/6SO1CFXnmzOEDYLgAKG8U28a8wftQJPcF3qhATFsZfUrNwYrm5BpqSFmNEHPmKT1STlqwX5nUslaPeFGoYDF5oBRr/lQP3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409368; c=relaxed/simple;
	bh=YHCDclMZWYBHiDakJuHyUUOzgFbXdibwObNF9cKGOLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAyoX7+hBCnuh2KEhEtpKUf5ABv2crIr/BZZQZ01ISBrfIpLAGz2/sbmBu0jDqqxY1mscBkDYL2Lp4cM1ZJrHd7gurQebcYQEGmr+bOAWBKbnvnLlYlBsTxb1DY/Vet/mooS9Oc6+f4e1xLxrLgn+tt/Xwh9xqDlEO3poTCYlMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GMuSDjPd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3dcce361897so3554513f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 02:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409364; x=1758014164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VwQnMFFQUbJBhEJZKQm6c3MliGwPjiIRbJeY0+XPvc=;
        b=GMuSDjPd+RcpepgIm4hszzrxYZizrDPODw7QME5bzWjRi/p9n1mhrqybne48g70qh+
         wWUonCaLd9ekTmqReWDu1ThdGccL030CJ63x/nfOJw+oT+tJQgrTi/p15IdhLY0hxFbm
         YNFy6DcE8tBBM2r3c5LqGpY3aH832n7Y/ps0B27jmTChKjIwF8Wdlrvk9LI7owdZWIRM
         HZfxoR0HW2ICdgDvSxOaCG8J6gwPCbQ/idaI5OimwoC2cU5X/Cuy9YHZ5LSNKScJqfyD
         P9kdMBLTFpBdZLAF8D8eoztL12eTQR2QtjyuD0InsjrJRsRGf7pj7i4D7+dwOTmKoqnL
         AIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409364; x=1758014164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VwQnMFFQUbJBhEJZKQm6c3MliGwPjiIRbJeY0+XPvc=;
        b=BQZ+lwftW9qmQSikBxdht1zcqSUB1kwJ3ulFWeeClpGr4ZQTEpU7p+JyKEAv1GrnX7
         9DuygtzruWioMDGbBVBdqZThagKLJ5+lgMX9asNijl+0lSoF+aG+6gqBK57aOghhOR1X
         Gx6XjzY1aB3wTQnJeCIsKsKMpLOUlsUnemD9zLVKU6l7vD777lVXV96zBlUx6IUj4XOJ
         FGrmZ53A8zBCNZfUTIZyPyD4FQIOlxbPbbAK8S4vF826xjoPICy1ArKweGnjiB1BgiWr
         PkMzWyDjAmCtiPzoFvmKeYziO021nLjrMnJUV88dkxO9XXJ7fAHlWsTuUequJVIbd8nH
         y8PQ==
X-Gm-Message-State: AOJu0YyikdBvgWgqsEESuU5FZociAU7kLgfa7h5PX7ZYhO/hrJ3XhXsz
	U4uUErittFTU7Jk7a6Hw2CRwPldPJgy0TfyczZqWwWIqXlBWApZRnMC6VhbUbGgN+wc=
X-Gm-Gg: ASbGncu2ANzAdCZlMrQDGdrzVjmYYUN5rIsxqpUcMGIN7mxQivvMVADt8uGnU8Y0Fns
	0XiT4F9MJdoTeh25cXJd5JrI7bF2H3/anW4GZWnVEdkhJaLVZy6gVQLjo+glI5XsMNjaGQf/BSs
	aYiaX4CBHcgW3YugGjAn3EBMjp4x0bes0yV9pZxT1wnMmq2JXI4T7OMFNRiwGHaqSPX5lcZ45VY
	fPRUeDKBkOcdrst4rj06QG5AaxoeJUBb4M+Cswjc5Je7KZkqOHpLQugabBptfwIdp1Dmjt7QlaC
	aksTL9vWlwKVHZ0CfhUSFCy2HVAKxHJHZdpQkxNfKU8MsbPI3CIOplQIFBiGWEY7iFLeBkkA1M7
	lmOa3FuXOtv/dcPwStw==
X-Google-Smtp-Source: AGHT+IGSoxbk5sH0hMOySaw2VZsrge4cwThUG4Xe74T/OfiVTIcnZT3WjcEd/0+Yql9jfkf8sxO4lQ==
X-Received: by 2002:a05:6000:2c02:b0:3e7:4835:8eab with SMTP id ffacd0b85a97d-3e7483594c6mr5567609f8f.6.1757409364085;
        Tue, 09 Sep 2025 02:16:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:38 +0200
Subject: [PATCH 11/15] gpio: sifive: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-11-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6420;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/rxFAj2OADgDUL6LIIa7xxiLekFYD7JnAKzsE5ctpDE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A6EyJpcO128tCwjMCd1RkR25TZMB81unx5s
 eXDdbnNcyuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOgAKCRARpy6gFHHX
 cgGED/9FeSGkmGNg2EwnlMYXHTeuncfNpcU+URNlNHzV5moJDeqP5Jcdq2gkGu4eZWS4s/RSYS+
 uzqOnYP4B/+yZWqNCJV6koa4fyCCMPUSnl8vNFE0+sn7b0TQwQEjFotjBrmcuFefH043O0+OgVH
 5O4/TrWmKig8t9Q91Fd891R2HPyfnf/VHC0uokZBlyP+MNveQUnXtyWXSJzH/VCr2rXM9KhKS1/
 8BLs5SCXZHRd3wHL8ARw+0y4hR4dDvAzBLhHG0bdGOhqAGlN+UGUQ5AAgL6itzzMSnu8fmun8m8
 SVroKjYq1jSMIpPWw83EIXGo15EK1Ct998onKm5hm0CQ7Cl6QhNtglDmZfLBuYWUQPu58AE7AT6
 agpeRAQESZNCyNy+QkyHlvbSL4XLwI6w2OWbWfSXkpnw9SHXOOAiw+fTp3sDaATrBHaA8xpEdUu
 O/l/wlMR/MDlNGtdzm1K21bnIon9aUwX3UkOeoKqEJVknuwWqppp0+2XM5RVcGwOb5MISLvMcWx
 uM3DMZ2cx/rVKPrz5Ikl/DA2+cpR3VjxNI6jQ047QI4fabGO+AGuJiHm8PMHgbXO98+9Ql/KGCC
 9oXUgUeXq3i0nrkvQthDI7BdNsf+od/Dhx2KKNpxAOVBqjsqFPFdsIY3pcUBKn8hisdX5u/sztw
 adjL6kx7DcdyUQw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sifive.c | 73 ++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 98ef975c44d9a6c9238605cfd1d5820fd70a66ca..07ee5c0b4f8023978c76873f25119d5dc21d996c 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -32,7 +33,7 @@
 
 struct sifive_gpio {
 	void __iomem		*base;
-	struct gpio_chip	gc;
+	struct gpio_generic_chip gen_gc;
 	struct regmap		*regs;
 	unsigned long		irq_state;
 	unsigned int		trigger[SIFIVE_GPIO_MAX];
@@ -41,10 +42,10 @@ struct sifive_gpio {
 
 static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
 {
-	unsigned long flags;
 	unsigned int trigger;
 
-	raw_spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
+
 	trigger = (chip->irq_state & BIT(offset)) ? chip->trigger[offset] : 0;
 	regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset),
 			   (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset) : 0);
@@ -54,7 +55,6 @@ static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
 			   (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) : 0);
 	regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset),
 			   (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) : 0);
-	raw_spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
 }
 
 static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
@@ -72,13 +72,12 @@ static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
 }
 
 static void sifive_gpio_irq_enable(struct irq_data *d)
-{
+	{
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	int offset = hwirq % SIFIVE_GPIO_MAX;
 	u32 bit = BIT(offset);
-	unsigned long flags;
 
 	gpiochip_enable_irq(gc, hwirq);
 	irq_chip_enable_parent(d);
@@ -86,13 +85,13 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
 	/* Switch to input */
 	gc->direction_input(gc, offset);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	/* Clear any sticky pending interrupts */
-	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
+		/* Clear any sticky pending interrupts */
+		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
+	}
 
 	/* Enable interrupts */
 	assign_bit(offset, &chip->irq_state, 1);
@@ -118,15 +117,14 @@ static void sifive_gpio_irq_eoi(struct irq_data *d)
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
 	u32 bit = BIT(offset);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	/* Clear all pending interrupts */
-	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
+		/* Clear all pending interrupts */
+		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
+	}
 
 	irq_chip_eoi_parent(d);
 }
@@ -179,6 +177,7 @@ static const struct regmap_config sifive_gpio_regmap_config = {
 
 static int sifive_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
@@ -217,13 +216,17 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	 */
 	parent = irq_get_irq_data(chip->irq_number[0])->domain;
 
-	ret = bgpio_init(&chip->gc, dev, 4,
-			 chip->base + SIFIVE_GPIO_INPUT_VAL,
-			 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
-			 NULL,
-			 chip->base + SIFIVE_GPIO_OUTPUT_EN,
-			 chip->base + SIFIVE_GPIO_INPUT_EN,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = chip->base + SIFIVE_GPIO_INPUT_VAL,
+		.set = chip->base + SIFIVE_GPIO_OUTPUT_VAL,
+		.dirout = chip->base + SIFIVE_GPIO_OUTPUT_EN,
+		.dirin = chip->base + SIFIVE_GPIO_INPUT_EN,
+		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+	};
+
+	ret = gpio_generic_chip_init(&chip->gen_gc, &config);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
@@ -236,12 +239,12 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
 	chip->irq_state = 0;
 
-	chip->gc.base = -1;
-	chip->gc.ngpio = ngpio;
-	chip->gc.label = dev_name(dev);
-	chip->gc.parent = dev;
-	chip->gc.owner = THIS_MODULE;
-	girq = &chip->gc.irq;
+	chip->gen_gc.gc.base = -1;
+	chip->gen_gc.gc.ngpio = ngpio;
+	chip->gen_gc.gc.label = dev_name(dev);
+	chip->gen_gc.gc.parent = dev;
+	chip->gen_gc.gc.owner = THIS_MODULE;
+	girq = &chip->gen_gc.gc.irq;
 	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
 	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
@@ -249,7 +252,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
 
-	return gpiochip_add_data(&chip->gc, chip);
+	return gpiochip_add_data(&chip->gen_gc.gc, chip);
 }
 
 static const struct of_device_id sifive_gpio_match[] = {

-- 
2.48.1


