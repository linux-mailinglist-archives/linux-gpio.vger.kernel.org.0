Return-Path: <linux-gpio+bounces-13636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F4C9E908D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7732283476
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 10:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5B221D003;
	Mon,  9 Dec 2024 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="JZ5EN03Q";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rBDb/wjX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675A21CFF1;
	Mon,  9 Dec 2024 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733740608; cv=none; b=sckuWzBSbol6fyAQN9jtgBla5BAemLfXDra3sq8h9arBjbSSeWd1sUFQ5lVoYvvEzbLVYxdl1jfNX2VgAUR3kiUlCJoOKLBbLkq/rqlhKBaxjMFnl+0+8qkLzS5xuCK85eMB3nELO9ZhSbc4OfuJYwtAxmZ+MXQgt3hThSq61yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733740608; c=relaxed/simple;
	bh=pAoxSXngND2bMKFr+KhlrWzilA1m/LE6JYrxjg6+CFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X7tnddLY7iftRAmLRKhnr8NXVhBAsI4H6vUs6rEj/39U+kJpxDpg27MdhRsQKGZKquVvhKpfUNJ/olZe+MZjvbkBXPU7dDT1I9HpxYkbqOe3ThtIB7h3r95PLCV7oWKMCoaLlE0WKz6kGztQWsqYGEO6navoxinXOnP+C7YbeOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=JZ5EN03Q; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rBDb/wjX reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733740606; x=1765276606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aDdKBWWJ7wM5AWxEQtEXbU0AZzMZrsK8pqyt1rECCa4=;
  b=JZ5EN03QXVw6RRIYIyFHLmpvwXQsIy8fThEvjhIATPoEMXNFvDiBM2fd
   JL2+a0YAhMv/17PAPA5MTSTSirsALUF0uNVmysUTg+I0D84Ou5YrQPREj
   MiQKm7T8aAyKy2BDb8nslr0KGIyo9X5PgeGf4msAr4FKmO/M963536s9B
   6YLC1fptQqhif1orSsBcr5cR4PyEiLk7ncS3QQxshNf+rVorRnRgHKS46
   wDoJTLloyNPfL89WVhpL9U6eAPY5DRE4HYf3JUgtFcaUbHF8v3tG+l1JI
   37mk34UDYZ3S4l67p5oTnX7JDM975EHkhUzuHXwgDYHo9hp0DEmffJ1Re
   w==;
X-CSE-ConnectionGUID: qqbQgCbBRxy1J56Pgf13pA==
X-CSE-MsgGUID: 2jQn3grkS5qGSsIyxH0Xpw==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40483002"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 11:36:44 +0100
X-CheckPoint: {6756C83C-32-86C05612-CA75E1CA}
X-MAIL-CPID: EBC25288A17EA342F275077FE268272A_1
X-Control-Analysis: str=0001.0A682F25.6756C83D.002B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41BD2166751;
	Mon,  9 Dec 2024 11:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733740600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDdKBWWJ7wM5AWxEQtEXbU0AZzMZrsK8pqyt1rECCa4=;
	b=rBDb/wjXuKm7pjM+gyzZANNkeDWZlCkzbE0g5Bu5nnZ2BuI5dOyZgHLpXFMIHpgjFnT6Y3
	vgCpNUgCLwKoj1bzqyrrDbCK6Ze4bZ743WIZcE5VP0JnoOmEKivy4Pc6IQvpuNZmg1ZvTz
	m5Bq4bDyTDY6nu7cDqFbo6HxJBZspEeYe3LPSK+nuEKudDYHudONhbTRPHwfegkaiB5XhK
	rjBctmPSre2YfiZ1dePU51CVfvXD5PO4aoC21wJsiUMByQi8p8jDoxR9tAljbJbEXJq2VM
	3V7hdRI1xpekAaQtp3T+VSVpyA0gHbIBGG5zGt+53SY/VLHQbfgTlSn6N8lcdg==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 2/4] gpio: tqmx86: consistently refer to IRQs by hwirq numbers
Date: Mon,  9 Dec 2024 11:36:09 +0100
Message-ID: <c018f77529eac5667c9dcc3acc980221408b7dab.1733739697.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com>
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
 drivers/gpio/gpio-tqmx86.c | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 667cb34b882f0..27f44d112d582 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -51,7 +51,7 @@ struct tqmx86_gpio_data {
 	/* Lock must be held for accessing output and irq_type fields */
 	raw_spinlock_t		spinlock;
 	DECLARE_BITMAP(output, TQMX86_NGPIO);
-	u8			irq_type[TQMX86_NGPI];
+	u8			irq_type[TQMX86_NGPIO];
 };
 
 static u8 tqmx86_gpio_read(struct tqmx86_gpio_data *gd, unsigned int reg)
@@ -115,36 +115,36 @@ static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
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
@@ -152,7 +152,6 @@ static void tqmx86_gpio_irq_mask(struct irq_data *data)
 
 static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 {
-	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
 	unsigned long flags;
@@ -160,8 +159,8 @@ static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 	gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(data));
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpio->irq_type[offset] |= TQMX86_INT_UNMASKED;
-	tqmx86_gpio_irq_config(gpio, offset);
+	gpio->irq_type[data->hwirq] |= TQMX86_INT_UNMASKED;
+	tqmx86_gpio_irq_config(gpio, data->hwirq);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
@@ -169,7 +168,6 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
-	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	unsigned int edge_type = type & IRQF_TRIGGER_MASK;
 	unsigned long flags;
 	u8 new_type;
@@ -189,9 +187,9 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
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
@@ -203,7 +201,7 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
 	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
 	unsigned long irq_bits, flags;
-	int i;
+	int i, hwirq;
 	u8 irq_status;
 
 	chained_irq_enter(irq_chip, desc);
@@ -215,6 +213,8 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
 	for_each_set_bit(i, &irq_bits, TQMX86_NGPI) {
+		hwirq = i + TQMX86_NGPO;
+
 		/*
 		 * Edge-both triggers are implemented by flipping the edge
 		 * trigger after each interrupt, as the controller only supports
@@ -235,8 +235,8 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
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


