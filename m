Return-Path: <linux-gpio+bounces-6799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F38D2ECE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 471CE1C203B6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDB9168C3C;
	Wed, 29 May 2024 07:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="WiwEN09N";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MYr8qIBf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4FD168C02;
	Wed, 29 May 2024 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968802; cv=none; b=HqBLRqvRyU5QOW9BjYgIA7fSK3JzG72suDxnQqPheA+pZ5FA7AxX/9Dy4LIgyilHEgmD1yjAwYlTFvoNCCqblyOshVLcP793kil8PSEL0BcmJNOSFZAYwCYhFdF9Xsm0Dfj5CRQtZH4K9MybQrGO8oAdnQEgKmEVtFzyARQ8/8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968802; c=relaxed/simple;
	bh=66IaNSGvA7muWSKLbc7fT2E8Z2C6kaf7dUeZ4BpJNxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Do4FmDD0E5y+5fTsr1UKeeZ6AihKroYQju+2ikMUo9p44TCKpNyCtzk+75MLT/uahFuJLKYif9TWsDuc3uhdguUHCxWsab554rvxlO2DPqeELdC6VVA09nAMYxTaGlP778eN5U6YQkay+L7uagt4BniVSEeU2Kif0EixsWSi+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=WiwEN09N; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MYr8qIBf reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716968799; x=1748504799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+l73Eh6wbyw+jsi+AgHnt5t4oK5036aERLZLop+rg9k=;
  b=WiwEN09NIuGg3htjLxbJlIa3Jk0bxRPxIj/YX6yQjcqtRSDjQzwtTlUZ
   /CcdRfkk9qQAnW5vcev/tDbmbL6KHtp/9PZcbGgSdabalwXJLwwgfsQvX
   1Md7JMuvstdZt7ByPQV5/OTNs7Hw9FeJgnY3IO5vamRSJ2gGpH7JFRdoL
   VV4N2ERYFDH1npLR5v+NDGjSgzk1OLXWBm7Wgw2ts4AiwrU3eNYoLn11G
   i4eXAvn6gyVT2jXR4pz+2sS6FiYhXfv6GUrsiV7fKIaL+vZNCSRSk5mGt
   L8cYYNtvCK8toMo9YgUpzIVXL718HeXFgRYNgQnDVZBVoptB/0NiEedKi
   A==;
X-CSE-ConnectionGUID: 936FHF0kR9G32/slpcjzgA==
X-CSE-MsgGUID: o48GZXcnQmGOX+DFl2HnIQ==
X-IronPort-AV: E=Sophos;i="6.08,197,1712613600"; 
   d="scan'208";a="37119670"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 09:46:38 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82AE916550D;
	Wed, 29 May 2024 09:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716968794;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+l73Eh6wbyw+jsi+AgHnt5t4oK5036aERLZLop+rg9k=;
	b=MYr8qIBfDOyhNVtxYUEy41K0KJ8o9neXkwBPXDhOEwy01yadQvP+U5P98EqgVrYmBpQDZi
	5zlHLMm0fVMk1XizyEHhxhIcWFszOxJajXp1y1QEJ+gjq9p+jyWWtOIomWE4eBruw9H0rB
	3gsErw4IyZkjddTKfPp3CD+sDjWR9MeeyK0IUs2Zmj+35usYK7Er0NPXxq9HLXeD/7+BGu
	1QmxrBJh0HNqG81iEMHEIT844EhxesIyQMdIhTxbhTdnFPUOnnyNT6j41IIIgb8FLwvlI0
	dPP3Nx43eIV8T2Zyfk2m35cPKAEwF5xy1wk0a5vLmL9p5+DkvGZap98URM0MfA==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 2/8] gpio: tqmx86: introduce shadow register for GPIO output value
Date: Wed, 29 May 2024 09:45:14 +0200
Message-ID: <3fe75a419cd3a4628315e3457703581304cfc9b8.1716967982.git.matthias.schiffer@ew.tq-group.com>
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

The TQMx86 GPIO controller uses the same register address for input and
output data. Reading the register will always return current inputs
rather than the previously set outputs (regardless of the current
direction setting). Therefore, using a RMW pattern does not make sense
when setting output values. Instead, the previously set output register
value needs to be stored as a shadow register.

As there is no reliable way to get the current output values from the
hardware, also initialize all channels to 0, to ensure that stored and
actual output values match. This should usually not have any effect in
practise, as the TQMx86 UEFI sets all outputs to 0 during boot.

Also prepare for extension of the driver to more than 8 GPIOs by using
DECLARE_BITMAP.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/gpio-tqmx86.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 3a28c1f273c39..b7e2dbbdc4ebe 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -6,6 +6,7 @@
  *   Vadim V.Vlasov <vvlasov@dev.rtsoft.ru>
  */
 
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
@@ -38,6 +39,7 @@ struct tqmx86_gpio_data {
 	void __iomem		*io_base;
 	int			irq;
 	raw_spinlock_t		spinlock;
+	DECLARE_BITMAP(output, TQMX86_NGPIO);
 	u8			irq_type[TQMX86_NGPI];
 };
 
@@ -64,15 +66,10 @@ static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
 	unsigned long flags;
-	u8 val;
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	val = tqmx86_gpio_read(gpio, TQMX86_GPIOD);
-	if (value)
-		val |= BIT(offset);
-	else
-		val &= ~BIT(offset);
-	tqmx86_gpio_write(gpio, val, TQMX86_GPIOD);
+	__assign_bit(offset, gpio->output, value);
+	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIOD);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
@@ -277,6 +274,13 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 
 	tqmx86_gpio_write(gpio, (u8)~TQMX86_DIR_INPUT_MASK, TQMX86_GPIODD);
 
+	/*
+	 * Reading the previous output state is not possible with TQMx86 hardware.
+	 * Initialize all outputs to 0 to have a defined state that matches the
+	 * shadow register.
+	 */
+	tqmx86_gpio_write(gpio, 0, TQMX86_GPIOD);
+
 	chip = &gpio->chip;
 	chip->label = "gpio-tqmx86";
 	chip->owner = THIS_MODULE;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


