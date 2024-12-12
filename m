Return-Path: <linux-gpio+bounces-13814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E499EE86D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 15:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5860E281F08
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 14:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD8E2144DE;
	Thu, 12 Dec 2024 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="aC2e5LWC";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NOOhlPvj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13A2153FF;
	Thu, 12 Dec 2024 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734012532; cv=none; b=Ddo459p9PHYELodNPgHRLoshBrzA0UvSQVd4BXi97JgaJP/oVJZQ2sqsdWVcYE5v1TfvUyKYLoDrgJpS4Jf3xQGmoWH+OQrMZz5ri3ddTRiVf6DiMp0pWYLMURz3GakeTxsFKXprrEFExe8fUPxCTufEpoaz48pG0ve7QcOUidM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734012532; c=relaxed/simple;
	bh=ZWxtozm7UmcJvYvnI8gvV7MZmk3N7v3NvhyF+raNy7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MxamdYE6MqThu9684/kXJNch08AHqzB1klGdWPAiv6rROJmkYkJ7iuRK6E9n9f0pHZBf6e928B1c0gH63P1ySmMrfcaJvKJFcTEGAveolq/eur/tgacDnVf/En4/2bAPDCoePKqxei3w1lQQ7sMda8Y04lfRheAm+bwLT3wL5OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=aC2e5LWC; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NOOhlPvj reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1734012529; x=1765548529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6GQkelO2o7qk2yd+kX8NKvy5P8H6SjzCj/caSY1cU3Y=;
  b=aC2e5LWCclpjaUhOW/SFsn1if77hfimBBVu2h0+zbHVs4uDkuIn+eKVK
   OGSRtVAhsk7jds4yim0rJgrr9/FwANNtVhARVznAD/U8fJNlDV+5q3B8C
   YS/UR2QnR45kA/XUKtD5FPimj33wx8RqaaSCbxChUOOHLjH2sAMKlW3Mq
   UCUdtWGfREPpWKSByBTyT8ohhH9O5njlROxTHt0r54YNNJAfvjUKqcJda
   uQZLl38bNoVTv2GRyLCP5YagufOL3ZOLCbgTYEtJdXADAJSas3UABwPIl
   77eWbVB5JIegiySuxtq00lrppjCe9CAZxSoua1ASxu33SbxMxTYPpkZSF
   g==;
X-CSE-ConnectionGUID: vfuQj/svRsyAwxY+8k0Tyw==
X-CSE-MsgGUID: 9AtRfPHeQRy6k//Z/BO8hQ==
X-IronPort-AV: E=Sophos;i="6.12,228,1728943200"; 
   d="scan'208";a="40566527"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Dec 2024 15:08:46 +0100
X-CheckPoint: {675AEE6E-22-98002871-E6E29D66}
X-MAIL-CPID: CF6A1B8B7FDC6EB17BD15049343FEB64_3
X-Control-Analysis: str=0001.0A682F20.675AEE6E.00D8,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DED616ACD0;
	Thu, 12 Dec 2024 15:08:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1734012522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GQkelO2o7qk2yd+kX8NKvy5P8H6SjzCj/caSY1cU3Y=;
	b=NOOhlPvjD1iRFndGHIZCMM8IUgai+2ju8ARVX6oe63Iqn6VyHx/hHw46o3OqMnP+rD/gWG
	cIDbm+zi8gxUXEHJNYEHgOplk24KPA5DRY8n+Rb7ndNz12UzatyTg3xyM9q5ZrUHOPKbTW
	qxi/9+2g/vITTt1EQ2p9qlMWQUd/gr9NKWYtCBQ6+mSMZRlkp0NhZ+K0FSwvo/fNZdo58r
	4+kw4mf+7eBAdEXwdfwNbiPDoWlNC9kqU2y5N3dz7iPeg/8Ggn2bjxZLEkuDsAD+kLindO
	EdJjk/ZFJ8c3OxWWGW/qoy4jHdLlSQWfjD7c7x+nXidw74ZhfrpsJ0XLAASKsw==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/5] gpio: tqmx86: consistently refer to IRQs by hwirq numbers
Date: Thu, 12 Dec 2024 15:08:06 +0100
Message-ID: <94b78f4a9500bb71e66c0f7d3b084fec5cfe42ca.1734001247.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734001247.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1734001247.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On currently supported variants of the TQMx86 GPIO controller, only
GPIOs 4-7 have IRQ support; in the interrupt status and config
registers, position 0 therefore corresponds to GPIO 4, position 1 to
GPIO 5, etc. This was made even more confusing by sometimes using the
term "offset" to refer to GPIO numbers (which are equavalent to hwirq
numbers), and sometimes to bit positions in the hardware registers.

With this change, the whole driver consistently uses hwirq numbers (==
GPIO numbers) when referring to the IRQs, and only the two pieces of
code that interact with the hardware registers (tqmx86_gpio_irq_config()
and tqmx86_gpio_irq_handler()) deal with bit positions. Space for hwirq
numbers 0-3 is reserved in the irq_type array, but remains unused for
existing (COM Express) TQMx86 variants; support for TQMx86 variants that
support IRQs on all GPIO lines will be added in the future.

No functional change intended.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes

 drivers/gpio/gpio-tqmx86.c | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index dda57fc02214b..38208a7dc1e62 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -52,7 +52,7 @@ struct tqmx86_gpio_data {
 	/* Lock must be held for accessing output and irq_type fields */
 	raw_spinlock_t		spinlock;
 	DECLARE_BITMAP(output, TQMX86_NGPIO);
-	u8			irq_type[TQMX86_NGPI];
+	u8			irq_type[TQMX86_NGPIO];
 };
 
 static u8 tqmx86_gpio_read(struct tqmx86_gpio_data *gd, unsigned int reg)
@@ -116,36 +116,36 @@ static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int offset)
+static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int hwirq)
 	__must_hold(&gpio->spinlock)
 {
 	u8 type = TQMX86_INT_TRIG_NONE, gpiic;
+	int gpiic_irq = hwirq - TQMX86_NGPO;
 
-	if (gpio->irq_type[offset] & TQMX86_INT_UNMASKED) {
-		type = gpio->irq_type[offset] & TQMX86_INT_TRIG_MASK;
+	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED) {
+		type = gpio->irq_type[hwirq] & TQMX86_INT_TRIG_MASK;
 
 		if (type == TQMX86_INT_TRIG_BOTH)
-			type = tqmx86_gpio_get(&gpio->chip, offset + TQMX86_NGPO)
+			type = tqmx86_gpio_get(&gpio->chip, hwirq)
 				? TQMX86_INT_TRIG_FALLING
 				: TQMX86_INT_TRIG_RISING;
 	}
 
 	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
-	gpiic &= ~TQMX86_GPIIC_MASK(offset);
-	gpiic |= TQMX86_GPIIC_CONFIG(offset, type);
+	gpiic &= ~TQMX86_GPIIC_MASK(gpiic_irq);
+	gpiic |= TQMX86_GPIIC_CONFIG(gpiic_irq, type);
 	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
 }
 
 static void tqmx86_gpio_irq_mask(struct irq_data *data)
 {
-	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpio->irq_type[offset] &= ~TQMX86_INT_UNMASKED;
-	tqmx86_gpio_irq_config(gpio, offset);
+	gpio->irq_type[data->hwirq] &= ~TQMX86_INT_UNMASKED;
+	tqmx86_gpio_irq_config(gpio, data->hwirq);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
 	gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(data));
@@ -153,7 +153,6 @@ static void tqmx86_gpio_irq_mask(struct irq_data *data)
 
 static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 {
-	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
 	unsigned long flags;
@@ -161,8 +160,8 @@ static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 	gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(data));
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpio->irq_type[offset] |= TQMX86_INT_UNMASKED;
-	tqmx86_gpio_irq_config(gpio, offset);
+	gpio->irq_type[data->hwirq] |= TQMX86_INT_UNMASKED;
+	tqmx86_gpio_irq_config(gpio, data->hwirq);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
@@ -170,7 +169,6 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
-	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	unsigned int edge_type = type & IRQF_TRIGGER_MASK;
 	unsigned long flags;
 	u8 new_type;
@@ -190,9 +188,9 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	}
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpio->irq_type[offset] &= ~TQMX86_INT_TRIG_MASK;
-	gpio->irq_type[offset] |= new_type;
-	tqmx86_gpio_irq_config(gpio, offset);
+	gpio->irq_type[data->hwirq] &= ~TQMX86_INT_TRIG_MASK;
+	gpio->irq_type[data->hwirq] |= new_type;
+	tqmx86_gpio_irq_config(gpio, data->hwirq);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
 	return 0;
@@ -204,7 +202,7 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
 	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
 	unsigned long irq_bits, flags;
-	int i;
+	int i, hwirq;
 	u8 irq_status;
 
 	chained_irq_enter(irq_chip, desc);
@@ -216,6 +214,8 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
 	for_each_set_bit(i, &irq_bits, TQMX86_NGPI) {
+		hwirq = i + TQMX86_NGPO;
+
 		/*
 		 * Edge-both triggers are implemented by flipping the edge
 		 * trigger after each interrupt, as the controller only supports
@@ -236,8 +236,8 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 		 * reading the input and setting the trigger, we will have a new
 		 * interrupt pending.
 		 */
-		if ((gpio->irq_type[i] & TQMX86_INT_TRIG_MASK) == TQMX86_INT_TRIG_BOTH)
-			tqmx86_gpio_irq_config(gpio, i);
+		if ((gpio->irq_type[hwirq] & TQMX86_INT_TRIG_MASK) == TQMX86_INT_TRIG_BOTH)
+			tqmx86_gpio_irq_config(gpio, hwirq);
 	}
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


