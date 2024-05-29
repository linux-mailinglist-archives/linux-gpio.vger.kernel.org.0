Return-Path: <linux-gpio+bounces-6802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B69AD8D2ED4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 680EA28C6FE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8A8169ACD;
	Wed, 29 May 2024 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Hb8hTpDT";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="heV64doR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5394C169AD1;
	Wed, 29 May 2024 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968816; cv=none; b=KvJa4lTPb3126RE8hIIGF99GiQlnI+SK0srDeH7FAKsECYtFuz4+7rBvuxDL9ptNd0PcJUm5mUxZBte+4U4fGQsNk/jc9qJHpd6BLbLnCEPgViK9bhdZuRMRZ+YvLsvonBT1+5C31xNI+6ljKTVlHpyHu+eAUTX8H8OEjFgro/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968816; c=relaxed/simple;
	bh=/QPRmbsPp3LreFM3iHccIolB8KMSFLEmPqwDwKBZyF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETNox/49ePSXvgTc1INV8EoNtzOm4A2ahupb/DBc78p3ov2QipurF/hZByAw1OHt2GgR1PezKxzbNHhqL2BHtsObL9K6pxHPVLX79XzTPqRCB8JV7rhRAyHnkd4zbMs0gnQwfvZF5c4d2AXYeMnlJ24KPUtmZ2hd9XdvBZcgZiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Hb8hTpDT; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=heV64doR reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716968814; x=1748504814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tQA7zmYXOg/1xwBxM2JFCsYV85xxh4w97CwmaIjuDsc=;
  b=Hb8hTpDTY/R/3LO9KXM5EPNizpuQTOf5b3Scl0cDl93MTmlDriHGE+fM
   v9sqQ4iiMUQuSmpqzKUiShGFaPckCRbZ5b7Ow/XUlNJMmG0BsR1grkQC4
   urt3SuxGnLPc5NyE3HTzG8ZGWPP7QJk2MKItRng4P0SvEKwHyZ0Le9zd/
   Yj9TQ0KRu/N4nBycEAeeQuiM3CYxSCMjAdxpDJyfIcgE9q6Xp9Ecd7cjv
   pX7l2SX/FsugnLYeBWBMLJXJQjoJ7fBKQQnSxmMV+VL01w/vc3kmxabei
   +bgMKLe4nFgp7q3Gp+OCZvFRvjLv08SzERYnE6mshlBJBzBgHbiRjCzw3
   w==;
X-CSE-ConnectionGUID: Cr/XnRHaTMKtg11gwDs+6g==
X-CSE-MsgGUID: o7BzfOm+SZezxoqqls+F3Q==
X-IronPort-AV: E=Sophos;i="6.08,197,1712613600"; 
   d="scan'208";a="37119683"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 09:46:52 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94C0F165515;
	Wed, 29 May 2024 09:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716968807;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tQA7zmYXOg/1xwBxM2JFCsYV85xxh4w97CwmaIjuDsc=;
	b=heV64doRR904WyxfzLHEIn9HNWiaCMeuYQf6JE/+MWyoBzHO38Q9EJfIqLCFxWg/rn631p
	lhHrfFB74Yf9Zk8xbEdDG4TxO9cFMG9U42v3oLzi5LbIFOIxji96rdSaX5k+yWODmYOjXs
	gICt18z1lXlYorTneU7hL4JhuJ0QO1qtsbOU5UEXRPEKZhbdBfsI65YSw2GMx0RjX36xxQ
	LkjzmlQsm17JOcbngzgJ1QF0+8X0h0ERxTPrMfjpUifcH54FelmienpEuDZQg++DCd86Tj
	hiWetsGOPxzK5kXgjOVjQBHrMVTS/0lMLSw4KlsY5vE6h77EBsyDioVg3mLwWw==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 5/8] gpio: tqmx86: add macros for interrupt configuration
Date: Wed, 29 May 2024 09:45:17 +0200
Message-ID: <be8cf3c39f41f1a46bed2587014a4703b7f24012.1716967982.git.matthias.schiffer@ew.tq-group.com>
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

The new macros introduce a distinction between flags used by the driver
to represent interrupt configuration (TQMX86_INT_ prefix) and the flags
actually written to the hardware (TQMX86_GPII_ prefix). The
TQMX86_INT_TRIG_ values are chosen such that they can be converted to
register values by a simple shift (in the TQMX86_GPII_CONFIG() macro),
at least for the NONE/FALLING/RISING triggers.

No functional change intended.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/gpio-tqmx86.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 7a851e1730dd1..d6e77f604f4df 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -29,10 +29,14 @@
 #define TQMX86_GPIIC	3	/* GPI Interrupt Configuration Register */
 #define TQMX86_GPIIS	4	/* GPI Interrupt Status Register */
 
-#define TQMX86_GPII_FALLING	BIT(0)
-#define TQMX86_GPII_RISING	BIT(1)
-#define TQMX86_GPII_MASK	(BIT(0) | BIT(1))
-#define TQMX86_GPII_BITS	2
+#define TQMX86_INT_TRIG_NONE	0x0
+#define TQMX86_INT_TRIG_FALLING	0x1
+#define TQMX86_INT_TRIG_RISING	0x2
+#define TQMX86_INT_TRIG_BOTH	0x3
+#define TQMX86_INT_TRIG_MASK	0x3
+
+#define TQMX86_GPII_CONFIG(i, v)	((v) << (2 * (i)))
+#define TQMX86_GPII_MASK(i)		TQMX86_GPII_CONFIG(i, TQMX86_INT_TRIG_MASK)
 
 struct tqmx86_gpio_data {
 	struct gpio_chip	chip;
@@ -123,7 +127,7 @@ static void tqmx86_gpio_irq_mask(struct irq_data *data)
 	unsigned long flags;
 	u8 mask;
 
-	mask = TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS);
+	mask = TQMX86_GPII_MASK(offset);
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
 	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, 0);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
@@ -141,8 +145,8 @@ static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 
 	gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(data));
 
-	mask = TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS);
-	val = gpio->irq_type[offset] << (offset * TQMX86_GPII_BITS);
+	mask = TQMX86_GPII_MASK(offset);
+	val = TQMX86_GPII_CONFIG(offset, gpio->irq_type[offset]);
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
 	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
@@ -159,13 +163,13 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 
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
-		new_type = TQMX86_GPII_FALLING | TQMX86_GPII_RISING;
+		new_type = TQMX86_INT_TRIG_BOTH;
 		break;
 	default:
 		return -EINVAL; /* not supported */
@@ -173,8 +177,8 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 
 	gpio->irq_type[offset] = new_type;
 
-	mask = TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS);
-	val = new_type << (offset * TQMX86_GPII_BITS);
+	mask = TQMX86_GPII_MASK(offset);
+	val = TQMX86_GPII_CONFIG(offset, new_type);
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
 	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


