Return-Path: <linux-gpio+bounces-6939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C648D4981
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 12:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CABAD1C21E58
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096E017D372;
	Thu, 30 May 2024 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="R7p4UVRd";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jYMg6BBa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FCA17C7B6;
	Thu, 30 May 2024 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064453; cv=none; b=Owj9d1bsuj2anAVHKjmt7c3hjqIqkt/VYzt7nLWQtqW4hew9RmL1NT9RPA9CuRcHF0JDwE0jJOV4CBmWcvWV50onW5J4Hi7ygSiO7DgurUk5XF4nsGekhwGkBT1ZDZTLwAuH3E9wOHWnL2Se6a8CU3fVseGNx/Ifxkx5UlwBVSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064453; c=relaxed/simple;
	bh=5eLebbaV0zyj+qyJX+UH7BnQi/ioKPhf5f4rEpWKx7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QCql/R0/2dwFJXPeHUOxYfJ3S4ycskUQDau9JayzQQ9A2J7L2W1EIBKvpDyyeWYdUiB4MbEjjGlqs6jK01kb8mrxjQzJChRREyBGO24BxRsm/9H3gDKcxlc3IRwqkkyEFl2eLkObIIwaZqak+iOQjD0RsxZv5JtfEs4d7b0cn98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=R7p4UVRd; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jYMg6BBa reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1717064451; x=1748600451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZyafMC3/3WL47KpxCKY/Ub/1F+zp4lv5M5Px5fItPpA=;
  b=R7p4UVRdO7dBR1tT8z7rOWEeXypDxEuVWyOy++qUiCoT9/Re9gAlJmo+
   smzuudKCrN+17V5Z25n/zzzoSTVdyBqsKP7mwkJR7zLXUbVa5GnSBLkq4
   MK1tIPxKeTOwpxTdKjJdBZcTrUIKNaPsWFU6vyBMLkdxBNrjeM9Fpsojy
   VRK3TG0byy54e9B1esNTiBUMYpM1kiV/aWIt+xbbE7RJKTRWm7+Hot2Jd
   VP094Irt7GAzbbv3ZicoAYMkJyWWjsg7fZ5tqCY4AOce8L+PieveHo6dD
   ne7jQYuMeV+JgiVFUAzBy+he64sSKd/Ikm9p9Ut9TDGRRU146AQjfdlNJ
   g==;
X-CSE-ConnectionGUID: V6YNQxmyRnaIyGO5gT3bJw==
X-CSE-MsgGUID: JcMIrmFYTqCfvcE4DHiErw==
X-IronPort-AV: E=Sophos;i="6.08,201,1712613600"; 
   d="scan'208";a="37143002"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 May 2024 12:20:50 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0064A166210;
	Thu, 30 May 2024 12:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1717064446;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZyafMC3/3WL47KpxCKY/Ub/1F+zp4lv5M5Px5fItPpA=;
	b=jYMg6BBa3wzyC+2lziogLD8ZkYWBe4yQl1jU4NsdKo4oAbHaFZKyi2gfCEVy+GKHUwehhE
	gkJvAk9twZL541pexY9Sh277Ct6U1cyg23JRuv5LBWMkgNt/1VWXUBU3IKcSwqmbWmYuc2
	N01xTDF68uyAH78wZuDvJxlZhJW1J0HO0SahDSB8AixYUxNPwiE+3HVq7ZBplclkz6gLOV
	w3YVwz8G4wCCEf7bAaXANmXpNzNqOotWFxR/LB+8vDr6whoO8HGg3iCz7bdUyxaKeIHxnD
	hvXTZY65sQYM0Zfyk/E4GfpSdlcop6O7yfik95/aRkamCrHn+kwDVjC2TYMMVg==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 3/4] gpio: tqmx86: store IRQ trigger type and unmask status separately
Date: Thu, 30 May 2024 12:20:01 +0200
Message-ID: <6aa4f207f77cb58ef64ffb947e91949b0f753ccd.1717063994.git.matthias.schiffer@ew.tq-group.com>
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

irq_set_type() should not implicitly unmask the IRQ.

All accesses to the interrupt configuration register are moved to a new
helper tqmx86_gpio_irq_config(). We also introduce the new rule that
accessing irq_type must happen while locked, which will become
significant for fixing EDGE_BOTH handling.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: Rebased to remove dependency on refactoring patches

 drivers/gpio/gpio-tqmx86.c | 48 ++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index b7e2dbbdc4ebe..7e428c872a257 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -29,15 +29,19 @@
 #define TQMX86_GPIIC	3	/* GPI Interrupt Configuration Register */
 #define TQMX86_GPIIS	4	/* GPI Interrupt Status Register */
 
+#define TQMX86_GPII_NONE	0
 #define TQMX86_GPII_FALLING	BIT(0)
 #define TQMX86_GPII_RISING	BIT(1)
 #define TQMX86_GPII_MASK	(BIT(0) | BIT(1))
 #define TQMX86_GPII_BITS	2
+/* Stored in irq_type with GPII bits */
+#define TQMX86_INT_UNMASKED	BIT(2)
 
 struct tqmx86_gpio_data {
 	struct gpio_chip	chip;
 	void __iomem		*io_base;
 	int			irq;
+	/* Lock must be held for accessing output and irq_type fields */
 	raw_spinlock_t		spinlock;
 	DECLARE_BITMAP(output, TQMX86_NGPIO);
 	u8			irq_type[TQMX86_NGPI];
@@ -104,21 +108,32 @@ static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
+static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int offset)
+	__must_hold(&gpio->spinlock)
+{
+	u8 type = TQMX86_GPII_NONE, gpiic;
+
+	if (gpio->irq_type[offset] & TQMX86_INT_UNMASKED)
+		type = gpio->irq_type[offset] & TQMX86_GPII_MASK;
+
+	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
+	gpiic &= ~(TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS));
+	gpiic |= type << (offset * TQMX86_GPII_BITS);
+	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
+}
+
 static void tqmx86_gpio_irq_mask(struct irq_data *data)
 {
 	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
 	unsigned long flags;
-	u8 gpiic, mask;
-
-	mask = TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS);
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
-	gpiic &= ~mask;
-	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
+	gpio->irq_type[offset] &= ~TQMX86_INT_UNMASKED;
+	tqmx86_gpio_irq_config(gpio, offset);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
+
 	gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(data));
 }
 
@@ -128,16 +143,12 @@ static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
 	unsigned long flags;
-	u8 gpiic, mask;
-
-	mask = TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS);
 
 	gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(data));
+
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
-	gpiic &= ~mask;
-	gpiic |= gpio->irq_type[offset] << (offset * TQMX86_GPII_BITS);
-	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
+	gpio->irq_type[offset] |= TQMX86_INT_UNMASKED;
+	tqmx86_gpio_irq_config(gpio, offset);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
@@ -148,7 +159,7 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	unsigned int edge_type = type & IRQF_TRIGGER_MASK;
 	unsigned long flags;
-	u8 new_type, gpiic;
+	u8 new_type;
 
 	switch (edge_type) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -164,13 +175,10 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 		return -EINVAL; /* not supported */
 	}
 
-	gpio->irq_type[offset] = new_type;
-
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
-	gpiic &= ~((TQMX86_GPII_MASK) << (offset * TQMX86_GPII_BITS));
-	gpiic |= new_type << (offset * TQMX86_GPII_BITS);
-	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
+	gpio->irq_type[offset] &= ~TQMX86_GPII_MASK;
+	gpio->irq_type[offset] |= new_type;
+	tqmx86_gpio_irq_config(gpio, offset);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
 	return 0;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


