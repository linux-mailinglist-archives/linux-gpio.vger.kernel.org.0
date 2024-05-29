Return-Path: <linux-gpio+bounces-6803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E546D8D2ED6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A9861F29953
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9E3169AED;
	Wed, 29 May 2024 07:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="FzrIIszX";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Vq82qAAm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B44169AD4;
	Wed, 29 May 2024 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968819; cv=none; b=UPCwSN2M+mWGtEo+A3JcjEN+aHs9uV4KTFGF9+Ay6G19KmmimEJUuyz5l2rzreTHFKNgLP89A0MmQx2UUDFhCb2/4X718/FL9HJmX23So2c6hgiWASnc+h4d43Ia7kTUQAiwuBv4+8wPs7sWNQy67sN6Bz9xttyQmxSGgfcq9U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968819; c=relaxed/simple;
	bh=e9bGX647w93B52kYjOmsjqM01YRxU/eV/LT0LaGAkcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDyrvTj8Ew0fKOqBce3hTYr3TfH2hIDwz5l/seg9n+7wtF/7ADNTJz349I7YZDcm4AthRQSnFLlTjlr+9b6yMAf/tOsS5tS0eA0KNp5WiQ/g9o8x0+bs+fVC57nBGPGWoHUsFoberUaOA/SlRcfqvqP9vlqlvoqbqtpA9FnYxGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=FzrIIszX; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Vq82qAAm reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716968817; x=1748504817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5mC5a04FWitjLLcuwOIE5BRImolQeptkvJ2oDOnHWlM=;
  b=FzrIIszXv77n9Nx2ZxUhGKVcNOHpI2w/GdOkiRqhK7opy95jhIz5q72x
   4CqQv95d7B+Px53D84NE58szsIctTLKj62wRtcjuqpMOY4QDDlDybEGph
   F/uD6EMoLgsSvrPj48V6ByuBTe+HeQ7QGBYtGjCH6a7ECrgWwSKcU16CT
   9TOmiHYFPrQ/ILBqm4BhZusRNh8E7gdWfo+RwXRQUDx+rQvbej3j1GC38
   InmE9pwdqp7vZe89t3b0yCueMi+YCR9+NgG3TtYCOP6wbq3l3HMXFZTZq
   zRTpYL5PGx9OAIgiWEFYUgKY+oZpNQp+m5VMqYzuC/8ZnxfrfcR0Loh49
   Q==;
X-CSE-ConnectionGUID: FuVZP7pBQBibKHXtc/oEOA==
X-CSE-MsgGUID: 8VPqbF+tRqmmqhSsDH2qJg==
X-IronPort-AV: E=Sophos;i="6.08,197,1712613600"; 
   d="scan'208";a="37119687"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 09:46:56 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB9CF1653B0;
	Wed, 29 May 2024 09:46:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716968812;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5mC5a04FWitjLLcuwOIE5BRImolQeptkvJ2oDOnHWlM=;
	b=Vq82qAAmpxXLhcHuuQtM4yvxWQ54zcTutca/XiOKmFTm75q1D+oLQjX7Sl5Q5uLjJAuyDz
	jO1JJr40afhDfyuYi8xrIYjSTrI4UqLTrkqWuVbdEeNc7MykT0CxwVKtr80DG9M5Bw0L/d
	qbM0e9/WJAHaZFrBKiSsgd2QXxU5khzSy+wG+n4EIOqskqwdv5F8dl9SmEwhSOquJ0MW1b
	pDwlcH/+goOpxP5keFAHEWZtANdHKV4ilEltYErNaH8k+VVrnlyX8VHZtJb6ovvE7pedUJ
	bW1jIa2psCM3Kf8Y8fBmURGoh/H5LKC0rzrv7D4TT8BRPK7ZQkr5uBC71FO3Ig==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 6/8] gpio: tqmx86: store IRQ triggers without offsetting index
Date: Wed, 29 May 2024 09:45:18 +0200
Message-ID: <9525c437801bbb9be1c67745a0ffb7797bb58e05.1716967982.git.matthias.schiffer@ew.tq-group.com>
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

This will allow us to move all offset handling into a single place in
the following commits. The additional irq_type indices remain unused,
but the tqmx86_gpio_data size increase is insignificant.

No functional change intended.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/gpio-tqmx86.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index d6e77f604f4df..4b37cc3bdd455 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -44,7 +44,7 @@ struct tqmx86_gpio_data {
 	int			irq;
 	raw_spinlock_t		spinlock;
 	DECLARE_BITMAP(output, TQMX86_NGPIO);
-	u8			irq_type[TQMX86_NGPI];
+	u8			irq_type[TQMX86_NGPIO];
 };
 
 static u8 tqmx86_gpio_read(struct tqmx86_gpio_data *gd, unsigned int reg)
@@ -146,7 +146,7 @@ static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 	gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(data));
 
 	mask = TQMX86_GPII_MASK(offset);
-	val = TQMX86_GPII_CONFIG(offset, gpio->irq_type[offset]);
+	val = TQMX86_GPII_CONFIG(offset, gpio->irq_type[data->hwirq]);
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
 	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
@@ -175,7 +175,7 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 		return -EINVAL; /* not supported */
 	}
 
-	gpio->irq_type[offset] = new_type;
+	gpio->irq_type[data->hwirq] = new_type;
 
 	mask = TQMX86_GPII_MASK(offset);
 	val = TQMX86_GPII_CONFIG(offset, new_type);
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


