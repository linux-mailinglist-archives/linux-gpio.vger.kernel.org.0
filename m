Return-Path: <linux-gpio+bounces-13813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D699EE86B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 15:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CF1A2821EF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 14:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BB221639E;
	Thu, 12 Dec 2024 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="eC/91xHx";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oHPkTm52"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DF42153F1;
	Thu, 12 Dec 2024 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734012532; cv=none; b=j653c9FDXqgPZeHiThW3vOciJcWSp8QI/PzM3uEHYWw3y0ODDHpg8JakGNu3qHj/3yW3qBN4iQftDAkMOKW0TJPY+Vqen74okCwXMImyP9PiExoDA8fhr5ZcowlAWGlEWGPYgeMKk1IunY/YN+RiDkAxZnmlhq13fT/nXF0sgyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734012532; c=relaxed/simple;
	bh=FRwARpDPfq25XHcmUGzLwyiViyq3Mv2R1wUlUtCJjKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dclDya2aIVjY/V1uRl/2ntxs5iGT3R2kh4wiOWfIWJYwFMW767j8ChmAHKHVwfALiCmMmP162YO8ve+g9WS0Ylwa0ZHEMBB8m9qqnlGs4BMf483YeQJntJQzbd9Q7PqBX7p0yvzZn0E4h5KtWr4u5ZO7rAG6CP+LG5a9SfgKcDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=eC/91xHx; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oHPkTm52 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1734012529; x=1765548529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EtUKXCd5mO5REGXTGnzkXbObfBe3wwqQTa4OtrOVC34=;
  b=eC/91xHxtUrP5OseSeIG0QZmXyKVHXwuKJ43e887vk2aJnrQkUUhtcUD
   tGJWsTm8YsgDKdNSGJPDAdRvpkKOwdZxGCZnZMnovpjTWpfddQ6zrHW4R
   tjtViwwWm1GHvKqoaTLb2opQnQnQ3OMTaHYVtG6Qq7RRrkEZqS3Y61hSF
   KfGbSZv0DUOEHlZ1f+tE7LHxux4BaQlmKBEJLMMOS9XeXtRfRQkJNGmvY
   B7B7DXUc1zWin2VWCAAdpbDWM8UmstGcAvlH4nXgoCp5B5XnHygAg5uVl
   s6ljxTkzcg78q/ovwO0o3+IsXWErZTbWX0ciL+xfILZ1VESn7R33uBJF/
   A==;
X-CSE-ConnectionGUID: W/YMomxqTVSksrdlk0kJwQ==
X-CSE-MsgGUID: l84GWP9nSpmfWYzLnN6Ifg==
X-IronPort-AV: E=Sophos;i="6.12,228,1728943200"; 
   d="scan'208";a="40566520"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Dec 2024 15:08:42 +0100
X-CheckPoint: {675AEE69-3B-98002871-E6E29D66}
X-MAIL-CPID: E54E7DEFC4F28C67FF61896AFDAD8815_3
X-Control-Analysis: str=0001.0A682F20.675AEE6A.0020,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66C1E1681B2;
	Thu, 12 Dec 2024 15:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1734012517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtUKXCd5mO5REGXTGnzkXbObfBe3wwqQTa4OtrOVC34=;
	b=oHPkTm52DdAHMZs0e5JNDxms4PHF4b5fHfnZmalXSHnKZVP5erYnrei9yjBHONBZsh4aer
	OZadcClPlJE7sfyoXIZSQGs4BgDO12QP+8yyeYLcoczSkdX03mCjA9UqOTq/SdL0clbPMP
	o3MA/g3ZOC1/c35LpThF344Z9qUuS+7S9vHGmu2FIGQUlfAIHF+g5uWs4tjVcnFRln49Px
	EIk2JsiY3xg75IcEvrJd/34HZ0IpfbBOrm5rEPMOo7U8k0aNspk07LNees/lRy5bj0NDTA
	tY1hRkyainXtVkzfxcbhViY69xl7Y38M4Me0UHru85YnHRDPZO7sYgZXMHVEsQ==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 1/5] gpio: tqmx86: add macros for interrupt configuration
Date: Thu, 12 Dec 2024 15:08:05 +0100
Message-ID: <26c01bce589aedb794c19ea7ccd85f6143532e48.1734001247.git.matthias.schiffer@ew.tq-group.com>
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

Consistently use TQMX86_INT_* flags for irq_type values. The
TQMX86_GPII_CONFIG macro is used to convert from TQMX86_INT_TRIG_*
flags to GPII register values. Bit patterns for TQMX86_INT_* are chosen
to make this conversion as simple as possible.

No functional change intended.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2:
- improved wording of commit description
- fixed comment format

 drivers/gpio/gpio-tqmx86.c | 44 +++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 5e26eb3adabbf..dda57fc02214b 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -29,18 +29,22 @@
 #define TQMX86_GPIIC	3	/* GPI Interrupt Configuration Register */
 #define TQMX86_GPIIS	4	/* GPI Interrupt Status Register */
 
-#define TQMX86_GPII_NONE	0
-#define TQMX86_GPII_FALLING	BIT(0)
-#define TQMX86_GPII_RISING	BIT(1)
-/* Stored in irq_type as a trigger type, but not actually valid as a register
- * value, so the name doesn't use "GPII"
+/*
+ * NONE, FALLING and RISING use the same bit patterns that can be programmed to
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
@@ -115,20 +119,20 @@ static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
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
 
@@ -173,20 +177,20 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 
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
@@ -232,7 +236,7 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
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


