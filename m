Return-Path: <linux-gpio+bounces-6801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA498D2ED2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B02A28C57A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6D0168C14;
	Wed, 29 May 2024 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ikkrLO/N";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AabwbyZU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90AA167DBB;
	Wed, 29 May 2024 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968811; cv=none; b=fqVRVLA/z7zsyO3PzuOxHKvsijOT4Uy/xG4jGbbHxkMOLP+4a8xw8CtSCYLq3ExsPr8Uqgwqet+5/OWUHJT1B5jBXes2KuFEdqtDjxPLW8/WQeev4W+3Rr36egbHfDGVXVT72yJlDSaq3k+IylVDOY5ovyQPk2h4z+3oQWDexjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968811; c=relaxed/simple;
	bh=brvOhRjd9ucisgiL0Zw+CRt1DO+weYJtOxfFuNiHLFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jkKVA8/CUduN77gRX4TWfKCB++m+llCxpa5SagwCHOiFXXU7s+FQwbVPyGsstEibd4L1SfGld9arMc9HoI1t7ay+Bp4TBBPcAbdR8srzAIhdpeakNbCUYyFLk941Cb7SCocCda3aDKeKZIO1nDdgZ4V756HT1jkx/HpafOusCkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ikkrLO/N; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AabwbyZU reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716968809; x=1748504809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Mg8rq7zdLPhOpKV49x/S2Vbpx0uGiGQv0E3qedMQBE=;
  b=ikkrLO/NBfFS7dsRSDaiPYT0RXeLy1EucyHALjhNawGbrDDYrR3ka0VZ
   uhZ+DGL+0zxC4eMgcO7GL394sx82ZOuAt2bjFLI6UVghQ47eobWh2xN8w
   qTE/VY+1ek1ebeg8hTvtzPeyXiSEfBmhYmW9nO7scqnkvZ3/ObxkJrOLv
   xPe4XLr9smVNxVhNHwXUUrXnI4nNTrkxeqcTBK/y09xTdqxACTqE/m0st
   D2xfj4iyG51QpAZ+XteVWrJCbuj/VQEsBzOWAkN83FLQa1Y9C5GweoeTV
   eDcXtuiKI5ZjeB2yGv7WjMnEMjgRLDyhFt5mBzR7EB/oOt6WZamc7XX6Q
   g==;
X-CSE-ConnectionGUID: kCpDvH+ZRbuNsJETzP5ZHw==
X-CSE-MsgGUID: s3TzDlp9RDSo0MneQyqbfg==
X-IronPort-AV: E=Sophos;i="6.08,197,1712613600"; 
   d="scan'208";a="37119677"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 09:46:47 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42EA3165514;
	Wed, 29 May 2024 09:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716968803;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3Mg8rq7zdLPhOpKV49x/S2Vbpx0uGiGQv0E3qedMQBE=;
	b=AabwbyZUYN9WLVaWNZeygd9tBTcjvN0WZZVVvJMNs9YyEfdO/pqHxKMO1FKcVxLvVC5gp8
	u03BZZbqdpGkmNm5EUvdCuegJQiYcANmQ4kXQiGJ8fo8j611qC3h+4o9ae46l1iWSBJrj7
	+VgpYlb6Hg8t0KCQRbbzrqMawC0b2onsrTjrHKNcMvy9+sGbthszKgsIQaDHP45S12byu+
	fCVHjHw4yZ7DWT809NNaERnWYtLQz0eZ8NZJuFxnPZxVQmqUAelsEabtTwvc/SmFxm01z+
	AbJYMj13wgmJRUTECIFJCxPhsz6MdQHQQCwnifjxohPe7U0ROu2xnZWWhtEL7g==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 4/8] gpio: tqmx86: introduce _tqmx86_gpio_update_bits() helper
Date: Wed, 29 May 2024 09:45:16 +0200
Message-ID: <0a21e3f14742e9adcf29361f7f2867199cd0dd4a.1716967982.git.matthias.schiffer@ew.tq-group.com>
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

Simplify a lot of code in the driver by introducing helpers for the
common RMW pattern. No tqmx86_gpio_update_bits() function with builtin
locking is added, as it would become redundant with the following fixes,
which further consolidate interrupt configuration register setup.

No functional change intended.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/gpio-tqmx86.c | 40 ++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 613ab9ef2e744..7a851e1730dd1 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -54,6 +54,17 @@ static void tqmx86_gpio_write(struct tqmx86_gpio_data *gd, unsigned int reg,
 	iowrite8(val, gd->io_base + reg);
 }
 
+static void _tqmx86_gpio_update_bits(struct tqmx86_gpio_data *gd,
+				     unsigned int reg, u8 mask, u8 val)
+{
+	u8 tmp = tqmx86_gpio_read(gd, reg);
+
+	tmp &= ~mask;
+	tmp |= val & mask;
+
+	tqmx86_gpio_write(gd, reg, tmp);
+}
+
 static int tqmx86_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
@@ -110,15 +121,13 @@ static void tqmx86_gpio_irq_mask(struct irq_data *data)
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
 	unsigned long flags;
-	u8 gpiic, mask;
+	u8 mask;
 
 	mask = TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS);
-
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
-	gpiic &= ~mask;
-	tqmx86_gpio_write(gpio, TQMX86_GPIIC, gpiic);
+	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, 0);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
+
 	gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(data));
 }
 
@@ -128,16 +137,14 @@ static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
 	unsigned long flags;
-	u8 gpiic, mask;
-
-	mask = TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS);
+	u8 mask, val;
 
 	gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(data));
+
+	mask = TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS);
+	val = gpio->irq_type[offset] << (offset * TQMX86_GPII_BITS);
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
-	gpiic &= ~mask;
-	gpiic |= gpio->irq_type[offset] << (offset * TQMX86_GPII_BITS);
-	tqmx86_gpio_write(gpio, TQMX86_GPIIC, gpiic);
+	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
@@ -148,7 +155,7 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	unsigned int edge_type = type & IRQF_TRIGGER_MASK;
 	unsigned long flags;
-	u8 new_type, gpiic;
+	u8 new_type, mask, val;
 
 	switch (edge_type) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -166,11 +173,10 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 
 	gpio->irq_type[offset] = new_type;
 
+	mask = TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS);
+	val = new_type << (offset * TQMX86_GPII_BITS);
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
-	gpiic &= ~((TQMX86_GPII_MASK) << (offset * TQMX86_GPII_BITS));
-	gpiic |= new_type << (offset * TQMX86_GPII_BITS);
-	tqmx86_gpio_write(gpio, TQMX86_GPIIC, gpiic);
+	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
 	return 0;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


