Return-Path: <linux-gpio+bounces-6800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589038D2ED0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AAFF1C22C69
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0DE167DBE;
	Wed, 29 May 2024 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="et7zv5ap";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gQ8kk6Wy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B240169373;
	Wed, 29 May 2024 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968808; cv=none; b=Mm6RbBMOtzTPb2v9krezsNWOmP6PwFDyGlbBmDX4dPIyZMv5kFcnNkWXCDqRk0+ZrcOhatsN45ezM9s3ztk1BGNXHk4mxkWN/64NuwYOD5ylkzfjdT45DMSVq7AZi5SaQFRfdsYQY6jv1SHBrC87b9XSVwbc+BlyAAMgdAjxTuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968808; c=relaxed/simple;
	bh=JeLDWWV7shqo3MwS4sx81AiGJwU5xnJTlYUGzlQUNE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O1jaXW1pFhptW+QcwrHYBGpGv4//anrzjChG9WyGqsTfMnm4/+uWzl3OjlfmazwU1W9d0V7/lkLku02DIwnY3Q+Alyv9yMzv+Mz/xBDzgofNDoNSbeVTsBjmb6VAl332/nGKkV//nrLDJ6z/5EuYuWDflrz2ds6H2c9aANQg7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=et7zv5ap; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gQ8kk6Wy reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716968805; x=1748504805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DRpcV/xV6CYVXujsbd6BhKEAOgQyChA+v6Iq6iozEKo=;
  b=et7zv5apxvUtY+PzFFs/j4u4SZmMQU7Xb8n9v83ijwAqNvzIVTlDc3oD
   rZtCTjXw5egse3bcXiy+5QWNXCxdvF5TELNI+F55RbwQe1NWq3CBZM081
   49C8gf9p0R3hV1mALzIRkjbpDYdMCT3fVJntMJGK+JboxFj2da63iGu8h
   iFlt5/vt9OMXCX56iRh0f8izn0kmGr2GDcZaAkLeN3Sb6V1lIlNbFzFRO
   KJOaqGmPwPan4CMzLsNdcc4Pig9sH3/BI0rHbvayvPkwhM12pLDDk7U5A
   5vzxUsX9E/4hYRlt0BikAqHNk/X2MXWDcP5denemB7BJFCHYiOIiFhxp6
   g==;
X-CSE-ConnectionGUID: Fwzm9xSdSQWM1W/xem86mQ==
X-CSE-MsgGUID: CUx555adQGGBrbSKHtEI9g==
X-IronPort-AV: E=Sophos;i="6.08,197,1712613600"; 
   d="scan'208";a="37119673"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 09:46:43 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1D14165384;
	Wed, 29 May 2024 09:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716968799;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DRpcV/xV6CYVXujsbd6BhKEAOgQyChA+v6Iq6iozEKo=;
	b=gQ8kk6WyfQCRDTR57uGcM2uoAnFvq6UQrmROSSAWxPAFW+0VxmYZS4+llZGP5tCio3fXF4
	yy65v57EuBxY2BjUhUsqFP55f1yzb05TLs9vcw1LPqAxP9gOKwpAWtlZdM2phAtpx+zQIF
	MPISRwsqBZDpHez7SFo/3s2kP7h5daAGbxCtYEwwlSqCjSS4z9Whyu3n+JWd3VhMX//0R+
	2gjX6jeIXlQiKj0DGoH38krWqVMmkQJxKN9RRPsyqYdwgor9l7sKfOeojtl9ZjMKrbwAtt
	hOK/QNFU9M907Jov3kqPVPFLqxECv7fu1tZrAj7Edpv0qAzVi5C+UBkXV5K7dw==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 3/8] gpio: tqmx86: change tqmx86_gpio_write() order of arguments to match regmap API
Date: Wed, 29 May 2024 09:45:15 +0200
Message-ID: <56cb8a4f19ac0596318d740ed14091d6904d3f7f.1716967982.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Conversion to actually use regmap does not seem useful for this driver,
as regmap can't properly represent separate read-only and write-only
registers at the same address, but we can at least match the API to make
the code clearer.

No functional change intended.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/gpio-tqmx86.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index b7e2dbbdc4ebe..613ab9ef2e744 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -48,8 +48,8 @@ static u8 tqmx86_gpio_read(struct tqmx86_gpio_data *gd, unsigned int reg)
 	return ioread8(gd->io_base + reg);
 }
 
-static void tqmx86_gpio_write(struct tqmx86_gpio_data *gd, u8 val,
-			      unsigned int reg)
+static void tqmx86_gpio_write(struct tqmx86_gpio_data *gd, unsigned int reg,
+			      u8 val)
 {
 	iowrite8(val, gd->io_base + reg);
 }
@@ -69,7 +69,7 @@ static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
 	__assign_bit(offset, gpio->output, value);
-	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIOD);
+	tqmx86_gpio_write(gpio, TQMX86_GPIOD, bitmap_get_value8(gpio->output, 0));
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
@@ -117,7 +117,7 @@ static void tqmx86_gpio_irq_mask(struct irq_data *data)
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
 	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
 	gpiic &= ~mask;
-	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
+	tqmx86_gpio_write(gpio, TQMX86_GPIIC, gpiic);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 	gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(data));
 }
@@ -137,7 +137,7 @@ static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
 	gpiic &= ~mask;
 	gpiic |= gpio->irq_type[offset] << (offset * TQMX86_GPII_BITS);
-	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
+	tqmx86_gpio_write(gpio, TQMX86_GPIIC, gpiic);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
@@ -170,7 +170,7 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
 	gpiic &= ~((TQMX86_GPII_MASK) << (offset * TQMX86_GPII_BITS));
 	gpiic |= new_type << (offset * TQMX86_GPII_BITS);
-	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
+	tqmx86_gpio_write(gpio, TQMX86_GPIIC, gpiic);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
 	return 0;
@@ -188,7 +188,7 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(irq_chip, desc);
 
 	irq_status = tqmx86_gpio_read(gpio, TQMX86_GPIIS);
-	tqmx86_gpio_write(gpio, irq_status, TQMX86_GPIIS);
+	tqmx86_gpio_write(gpio, TQMX86_GPIIS, irq_status);
 
 	irq_bits = irq_status;
 	for_each_set_bit(i, &irq_bits, TQMX86_NGPI)
@@ -272,14 +272,14 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 	raw_spin_lock_init(&gpio->spinlock);
 	gpio->io_base = io_base;
 
-	tqmx86_gpio_write(gpio, (u8)~TQMX86_DIR_INPUT_MASK, TQMX86_GPIODD);
+	tqmx86_gpio_write(gpio, TQMX86_GPIODD, (u8)~TQMX86_DIR_INPUT_MASK);
 
 	/*
 	 * Reading the previous output state is not possible with TQMx86 hardware.
 	 * Initialize all outputs to 0 to have a defined state that matches the
 	 * shadow register.
 	 */
-	tqmx86_gpio_write(gpio, 0, TQMX86_GPIOD);
+	tqmx86_gpio_write(gpio, TQMX86_GPIOD, 0);
 
 	chip = &gpio->chip;
 	chip->label = "gpio-tqmx86";
@@ -300,11 +300,11 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 		u8 irq_status;
 
 		/* Mask all interrupts */
-		tqmx86_gpio_write(gpio, 0, TQMX86_GPIIC);
+		tqmx86_gpio_write(gpio, TQMX86_GPIIC, 0);
 
 		/* Clear all pending interrupts */
 		irq_status = tqmx86_gpio_read(gpio, TQMX86_GPIIS);
-		tqmx86_gpio_write(gpio, irq_status, TQMX86_GPIIS);
+		tqmx86_gpio_write(gpio, TQMX86_GPIIS, irq_status);
 
 		girq = &chip->irq;
 		gpio_irq_chip_set_chip(girq, &tqmx86_gpio_irq_chip);
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


