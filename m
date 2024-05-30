Return-Path: <linux-gpio+bounces-6940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE208D4988
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 12:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9F51C21E18
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941EA17FAC0;
	Thu, 30 May 2024 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="HdhZNp2d";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="twcUY53l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786CD17E467;
	Thu, 30 May 2024 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064459; cv=none; b=IJdRFJhxXYpPpmOss9jT3VeeKyFoIPs8gMX8SDbz8uAKYVW7sP4+Y6J6jt/1bugvfUdoRvGe0WlJ9covYx2ceUHgXMdlzfo7l2b5s1irs2S7gc8ttStOI+nvc+ihox/PZTNiesIYLG2cghLu/T0W2Fta3BboMTC1JdTONgv10jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064459; c=relaxed/simple;
	bh=5OIPeuVeN1KNAEZlT0LZaR/HZ/SY8ulYGkj6eR62fas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uoJymJemJnZwcWU0ihe+agKOR/ATP9vyDba4fy9Zd336cta2oyCqlE2OlBtJOauX02GbPPTTUdq2TXf1ipJxVk8CiPZ1tRDdf/GzQAtNVv98IgqdMeBZzeKgmmxHF9/YNRiTB2ED6nEctaHjZuYzHDomvqe2LrxML2TphKPwVCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=HdhZNp2d; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=twcUY53l reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1717064456; x=1748600456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2GsMORIYf+pMz5tO/IPerAOcaQlnaitGPSikn9NGX5E=;
  b=HdhZNp2dRLYv+oun+C3GVljwpro5YxjQrhvSx9s3s2U3/NKbL80YTItx
   O8v8t9HtJv+U7E7LQm0Xrqm9GaiolNKiCr7yzcFRI4ccaTidHZax2pT4A
   auYeztm9bOgU+8b01uh2IkLfzHAsKSH1KFFjpw1NwX04vQ6YEKho3fiCT
   4uL1084Vbf/vEe1sFma+KodDGuNNeLEvSXDY0CXUnfdqGtJt3CKyItuEg
   ZU8RDk2YlVtK1neALdEYc2jUyP0DeiCu6479XHspgEdbQT4OpKdU6MGXh
   urgfX7iiMVHBwZ7qm4qkFy0dfIlOsmBncO6IcPqa7typr1V7TZU2vSVJJ
   Q==;
X-CSE-ConnectionGUID: ausLwVM/SSCxTSb3O+lQDA==
X-CSE-MsgGUID: wJt90eZGQfaDhC1Ybbl2wQ==
X-IronPort-AV: E=Sophos;i="6.08,201,1712613600"; 
   d="scan'208";a="37143003"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 May 2024 12:20:54 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63063166276;
	Thu, 30 May 2024 12:20:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1717064450;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2GsMORIYf+pMz5tO/IPerAOcaQlnaitGPSikn9NGX5E=;
	b=twcUY53lczh8bPlJ8CSlVzGhj4eXe47AxkBDM1P7c4sPxaapv86lrzrCWeKibw3VPV3lfV
	cY0rkmevUY5uKJ1US8b54kxnsQvhoq3wycZ2TSMcmLJh2rt26lutf8JsndrRM8a9LOajcY
	3H37BTft3/zwXhmb/045VbeSAJ6ncgJOGIbYggVuq1C6sY9PlBAfh7LU6d9IbPOc2MzjHX
	zDW5JTv76jt9ouSFOr8KywzfgXCEM404WERfBlmkOpfQGRa2mumWm6kO8SW3fjOdv7DO98
	fhQQO7Y6IlQdME2LujFboQ2oTtUeiOzTmtLhqBRfDv0YQwQSar5PjMZJRNlO2Q==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 4/4] gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH interrupt type
Date: Thu, 30 May 2024 12:20:02 +0200
Message-ID: <515324f0491c4d44f4ef49f170354aca002d81ef.1717063994.git.matthias.schiffer@ew.tq-group.com>
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

The TQMx86 GPIO controller only supports falling and rising edge
triggers, but not both. Fix this by implementing a software both-edge
mode that toggles the edge type after every interrupt.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Co-developed-by: Gregor Herburger <gregor.herburger@tq-group.com>
Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: Rebased to remove dependency on refactoring patches

 drivers/gpio/gpio-tqmx86.c | 46 ++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 7e428c872a257..f38a3e8c92120 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -32,6 +32,10 @@
 #define TQMX86_GPII_NONE	0
 #define TQMX86_GPII_FALLING	BIT(0)
 #define TQMX86_GPII_RISING	BIT(1)
+/* Stored in irq_type as a trigger type, but not actually valid as a register
+ * value, so the name doesn't use "GPII"
+ */
+#define TQMX86_INT_BOTH		(BIT(0) | BIT(1))
 #define TQMX86_GPII_MASK	(BIT(0) | BIT(1))
 #define TQMX86_GPII_BITS	2
 /* Stored in irq_type with GPII bits */
@@ -113,9 +117,15 @@ static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int offset)
 {
 	u8 type = TQMX86_GPII_NONE, gpiic;
 
-	if (gpio->irq_type[offset] & TQMX86_INT_UNMASKED)
+	if (gpio->irq_type[offset] & TQMX86_INT_UNMASKED) {
 		type = gpio->irq_type[offset] & TQMX86_GPII_MASK;
 
+		if (type == TQMX86_INT_BOTH)
+			type = tqmx86_gpio_get(&gpio->chip, offset + TQMX86_NGPO)
+				? TQMX86_GPII_FALLING
+				: TQMX86_GPII_RISING;
+	}
+
 	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
 	gpiic &= ~(TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS));
 	gpiic |= type << (offset * TQMX86_GPII_BITS);
@@ -169,7 +179,7 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 		new_type = TQMX86_GPII_FALLING;
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		new_type = TQMX86_GPII_FALLING | TQMX86_GPII_RISING;
+		new_type = TQMX86_INT_BOTH;
 		break;
 	default:
 		return -EINVAL; /* not supported */
@@ -189,8 +199,8 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
 	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
-	unsigned long irq_bits;
-	int i = 0;
+	unsigned long irq_bits, flags;
+	int i;
 	u8 irq_status;
 
 	chained_irq_enter(irq_chip, desc);
@@ -199,6 +209,34 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 	tqmx86_gpio_write(gpio, irq_status, TQMX86_GPIIS);
 
 	irq_bits = irq_status;
+
+	raw_spin_lock_irqsave(&gpio->spinlock, flags);
+	for_each_set_bit(i, &irq_bits, TQMX86_NGPI) {
+		/*
+		 * Edge-both triggers are implemented by flipping the edge
+		 * trigger after each interrupt, as the controller only supports
+		 * either rising or falling edge triggers, but not both.
+		 *
+		 * Internally, the TQMx86 GPIO controller has separate status
+		 * registers for rising and falling edge interrupts. GPIIC
+		 * configures which bits from which register are visible in the
+		 * interrupt status register GPIIS and defines what triggers the
+		 * parent IRQ line. Writing to GPIIS always clears both rising
+		 * and falling interrupt flags internally, regardless of the
+		 * currently configured trigger.
+		 *
+		 * In consequence, we can cleanly implement the edge-both
+		 * trigger in software by first clearing the interrupt and then
+		 * setting the new trigger based on the current GPIO input in
+		 * tqmx86_gpio_irq_config() - even if an edge arrives between
+		 * reading the input and setting the trigger, we will have a new
+		 * interrupt pending.
+		 */
+		if ((gpio->irq_type[i] & TQMX86_GPII_MASK) == TQMX86_INT_BOTH)
+			tqmx86_gpio_irq_config(gpio, i);
+	}
+	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
+
 	for_each_set_bit(i, &irq_bits, TQMX86_NGPI)
 		generic_handle_domain_irq(gpio->chip.irq.domain,
 					  i + TQMX86_NGPO);
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


