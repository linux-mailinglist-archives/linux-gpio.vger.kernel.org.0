Return-Path: <linux-gpio+bounces-6938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6A28D497E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 12:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B323B226A6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7762117C7CB;
	Thu, 30 May 2024 10:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="a2prJpHm";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XVLs+pSK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624C1761B1;
	Thu, 30 May 2024 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064451; cv=none; b=R6NiLs31/MTPSY5nYEX6mhR9MpAw03TSLEmYG+rSJAGsouYIJJ+rIfimhqCd4OY5kghGDcDY71WefAasoxgk0B/iaj6c4y+rykYCo86/naNgVcS86kKf6O9z57aM5mSyQZvGgwHMq3UQijgN/LbicSFQ+2ED/PXsq2CNLQkaL1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064451; c=relaxed/simple;
	bh=u52T1BLdg7V8uIm/Xqta4vGvy70GQpllaYbNXinkqbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dLJUslJxJ/i2KIWOLhVznxEsrAb7SucC4GshyBURFyVFiITO70KdlV7cdTlGy5XDNFyLwUznrNLXRbidMMFP462KOrA0xKk5uSmu5Phr2hvELBMnJK8td18UWbqkot19s4Yxe+tQNJfbfUu7yJsLtoBm1/le0HnJlwJOMqlGSdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=a2prJpHm; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XVLs+pSK reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1717064448; x=1748600448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pV6xOVNrVp5MkIWD0BIWMbmJBcDgsjfm31+wvnFNx1s=;
  b=a2prJpHmSCSxW7tvXct0P7ZvFuc5aMsuhi6Gycxj7FnHDSn6vCnnbHcm
   TKTHpwDqAtNMx3rP0YF8+tZH1wTNIYnoqlJbeLahXhtxgtH9KPz5qqa61
   uMWTArcxg+cLxpxlLBzkCGLfXnb2f0LLygu8rAeLsQKtoK1gO73exUe20
   z2dK271bowEFM4ZjkvI0ZjqZn+W9CL5fdFano6Rf/S9D1K67SELtRBpLd
   NA6iOZyf8o69zcuv8yR3exgZWmctoK7Y7fY/k2e00GGULxl5PTj+1N9Fd
   0nrf1fxBjs39s3C2uzahODCfRA6C619mmaxfFfZyDBst16paFV2dt77Hq
   A==;
X-CSE-ConnectionGUID: LQjt2KniSKmyQ/81T/5UHw==
X-CSE-MsgGUID: /TJHXBzKS+Gwysk0Z7y88w==
X-IronPort-AV: E=Sophos;i="6.08,201,1712613600"; 
   d="scan'208";a="37143000"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 May 2024 12:20:45 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65F9016633A;
	Thu, 30 May 2024 12:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1717064441;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pV6xOVNrVp5MkIWD0BIWMbmJBcDgsjfm31+wvnFNx1s=;
	b=XVLs+pSKSFrmcZPnxujT09gAVfm9Att43T91Shp7N5EMZPabzEnF7qW4bvdkBbXkRo4saU
	tRyydq7/N/CggBmcBpkSyVV8e/ovYRrpS4zKSvbDp8K3bazd/ooRrhkOEwi4WyN7V9T7gG
	55A40NNRGV9zmCI8ZdYL2oohVUEgJRorpa+XrkyMFp0Cf2csOui4Zq+wRU/sKv1a5OGICj
	ij9UWKMsSnNthtwBJf8h2qJDUyzJqtSeBq3/5mQmdkSO1pDx3AN26UeF/Lpx/FU9mAwPtV
	g+CiZpydCkbDftF2m0MhGnyCSoNG8IP2Dc7NvrHn4SdhSuv2hHnsGV08UEfhtg==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/4] gpio: tqmx86: introduce shadow register for GPIO output value
Date: Thu, 30 May 2024 12:20:00 +0200
Message-ID: <d0555933becd45fa92a85675d26e4d59343ddc01.1717063994.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <e0e38c9944ad6d281d9a662a45d289b88edc808e.1717063994.git.matthias.schiffer@ew.tq-group.com>
References: <e0e38c9944ad6d281d9a662a45d289b88edc808e.1717063994.git.matthias.schiffer@ew.tq-group.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

v2: added Reviewed-by

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


