Return-Path: <linux-gpio+bounces-13635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AD99E908E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90E3E1887025
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 10:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF61219EA0;
	Mon,  9 Dec 2024 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="guzyPdZu";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KmmjtJfW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911CB219EBB;
	Mon,  9 Dec 2024 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733740606; cv=none; b=bd+T8Gg0NRJPbJJPNUhjkU8HvZYXPs4X87/9jMVqonIWwtSVkdRsBwbPArUFFlbQoKMMEYSiUosq6S2fYEtwOrfuYcdX1FU11qeKY9d0rEm3izC1uG4ytlvTBXTSn0V91CYqn333BiZCvsbVf9am9ce+AHvEhh379yRJgsvR7tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733740606; c=relaxed/simple;
	bh=JI7OPn8ArbubGWsozuWATmltmnJfJ2iGfS0abpLqhxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fr38q4wGe9M9MT0UrO5o5KIg2Xbb3Jp6rW0mjsnPKVhj3p0jOXA3Cj9FFkJciNnQg8XdPd9NOSXbWSaJloFw6VWCKWDrQTf7MpWaaghabS8ciYwPMrlvdls7KxI60VpFz8AawysyBcbG9CjqkuWuVzP45lJMYe09ZuleCLOdKtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=guzyPdZu; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KmmjtJfW reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733740603; x=1765276603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wdqp1mO90TjbNxCy1UZnwPCKmuE7HC7tkaeefblMHEE=;
  b=guzyPdZuwln3bo8ifRStUrdoHHLn1GNxDp5JOaSysbTOUj0HWBdd6NGu
   ywSQkdGRo45HGlB1l4PX9DVmhpyHA2ILZLPslt0GRGNvkpC6lAVF8GK/8
   Vc5ecL3JxkDsUGoFw02dg0ATpXviUTPGiKlK7hyfcxgiXnL4a+pIIEGXn
   pSTGDKLMe0edzFkqzMdNHgcR9o3eNtxrhqjZG2btPrFtBw1FhSRTasogZ
   GDbtv37M0xuqI3+dauPb1m9Bbb0YHrDOvYDVYZdEf/8PD/lqsCPWV9xKv
   y69/f1+fqwXD+gMpLrJdFWP/Y5cfJEs5rxhcr69lo9qvljad8VXgyQVy+
   w==;
X-CSE-ConnectionGUID: xppyoOrPQx2m42sZBoQTAA==
X-CSE-MsgGUID: vLERhh9KSfCh3Xf/QWerbQ==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40483000"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 11:36:40 +0100
X-CheckPoint: {6756C838-16-D31EDE1A-D52D6119}
X-MAIL-CPID: BE2805596DDDB0EB2CE6272D89627E81_5
X-Control-Analysis: str=0001.0A682F1A.6756C838.0091,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A232F165BA9;
	Mon,  9 Dec 2024 11:36:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733740595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wdqp1mO90TjbNxCy1UZnwPCKmuE7HC7tkaeefblMHEE=;
	b=KmmjtJfWdXfa/MixZYU+Ipb4Wbf6DfoY7Mwn43PqbiKGyNWiH7e5MnxuxAQ8dADn5u/oWa
	6EIHgC5lfFN79S0ZwVW2TLY9YrdS5W4nb0EZ6ZfU42T6GQe64P+c3LcSDYDoiBDLP4YeAi
	KVKSfekmzgxMDhMSlTa435F2ezPvTfDWU7dIhIU4A+56e02+t1bWMfZmt3iP3zbYILFyQb
	jPU6Qd014MUz+iY6kkGhbLMQVrMrLisRgt8QasHVsIfAa4Q915OgzmVmdW7kTjeEwuXLFu
	hXFgskJbEUsXvQ5D0s7lqErOrEl5d15/Fa4+PkHc5kCDW0nDwiB37kB91512Og==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 1/4] gpio: tqmx86: add macros for interrupt configuration
Date: Mon,  9 Dec 2024 11:36:08 +0100
Message-ID: <fba6114b73634d0327d5d34a0634d3b500aab059.1733739697.git.matthias.schiffer@ew.tq-group.com>
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

We now consistently use TQMX86_INT_* flags for irq_type values. The
TQMX86_GPII_CONFIG macro is used to convert from TQMX86_INT_TRIG_*
flags to GPII register values. Bit patterns for TQMX86_INT_* are chosen
to make this conversion as simple as possible.

No functional change intended.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/gpio-tqmx86.c | 43 ++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 5e26eb3adabbf..667cb34b882f0 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -29,18 +29,21 @@
 #define TQMX86_GPIIC	3	/* GPI Interrupt Configuration Register */
 #define TQMX86_GPIIS	4	/* GPI Interrupt Status Register */
 
-#define TQMX86_GPII_NONE	0
-#define TQMX86_GPII_FALLING	BIT(0)
-#define TQMX86_GPII_RISING	BIT(1)
-/* Stored in irq_type as a trigger type, but not actually valid as a register
- * value, so the name doesn't use "GPII"
+/* NONE, FALLING and RISING use the same bit patterns that can be programmed to
+ * the GPII register (after passing them to the TQMX86_GPII_ macros to shift
+ * them to the right position)
  */
-#define TQMX86_INT_BOTH		(BIT(0) | BIT(1))
-#define TQMX86_GPII_MASK	(BIT(0) | BIT(1))
-#define TQMX86_GPII_BITS	2
+#define TQMX86_INT_TRIG_NONE	0
+#define TQMX86_INT_TRIG_FALLING	BIT(0)
+#define TQMX86_INT_TRIG_RISING	BIT(1)
+#define TQMX86_INT_TRIG_BOTH	(BIT(0) | BIT(1))
+#define TQMX86_INT_TRIG_MASK	(BIT(0) | BIT(1))
 /* Stored in irq_type with GPII bits */
 #define TQMX86_INT_UNMASKED	BIT(2)
 
+#define TQMX86_GPIIC_CONFIG(i, v)	((v) << (2 * (i)))
+#define TQMX86_GPIIC_MASK(i)		TQMX86_GPIIC_CONFIG(i, TQMX86_INT_TRIG_MASK)
+
 struct tqmx86_gpio_data {
 	struct gpio_chip	chip;
 	void __iomem		*io_base;
@@ -115,20 +118,20 @@ static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
 static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int offset)
 	__must_hold(&gpio->spinlock)
 {
-	u8 type = TQMX86_GPII_NONE, gpiic;
+	u8 type = TQMX86_INT_TRIG_NONE, gpiic;
 
 	if (gpio->irq_type[offset] & TQMX86_INT_UNMASKED) {
-		type = gpio->irq_type[offset] & TQMX86_GPII_MASK;
+		type = gpio->irq_type[offset] & TQMX86_INT_TRIG_MASK;
 
-		if (type == TQMX86_INT_BOTH)
+		if (type == TQMX86_INT_TRIG_BOTH)
 			type = tqmx86_gpio_get(&gpio->chip, offset + TQMX86_NGPO)
-				? TQMX86_GPII_FALLING
-				: TQMX86_GPII_RISING;
+				? TQMX86_INT_TRIG_FALLING
+				: TQMX86_INT_TRIG_RISING;
 	}
 
 	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
-	gpiic &= ~(TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS));
-	gpiic |= type << (offset * TQMX86_GPII_BITS);
+	gpiic &= ~TQMX86_GPIIC_MASK(offset);
+	gpiic |= TQMX86_GPIIC_CONFIG(offset, type);
 	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
 }
 
@@ -173,20 +176,20 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 
 	switch (edge_type) {
 	case IRQ_TYPE_EDGE_RISING:
-		new_type = TQMX86_GPII_RISING;
+		new_type = TQMX86_INT_TRIG_RISING;
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		new_type = TQMX86_GPII_FALLING;
+		new_type = TQMX86_INT_TRIG_FALLING;
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		new_type = TQMX86_INT_BOTH;
+		new_type = TQMX86_INT_TRIG_BOTH;
 		break;
 	default:
 		return -EINVAL; /* not supported */
 	}
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpio->irq_type[offset] &= ~TQMX86_GPII_MASK;
+	gpio->irq_type[offset] &= ~TQMX86_INT_TRIG_MASK;
 	gpio->irq_type[offset] |= new_type;
 	tqmx86_gpio_irq_config(gpio, offset);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
@@ -232,7 +235,7 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 		 * reading the input and setting the trigger, we will have a new
 		 * interrupt pending.
 		 */
-		if ((gpio->irq_type[i] & TQMX86_GPII_MASK) == TQMX86_INT_BOTH)
+		if ((gpio->irq_type[i] & TQMX86_INT_TRIG_MASK) == TQMX86_INT_TRIG_BOTH)
 			tqmx86_gpio_irq_config(gpio, i);
 	}
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


