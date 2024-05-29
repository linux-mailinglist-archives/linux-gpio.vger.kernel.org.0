Return-Path: <linux-gpio+bounces-6805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A1A8D2EDA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FB711C20DAF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B1416A387;
	Wed, 29 May 2024 07:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="PnQzSDY+";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ZJT8jAYg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBE169361;
	Wed, 29 May 2024 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968828; cv=none; b=fy98l+0fyviINDIa82LpnMCM8poMAVQi9oW5OIH7rc4OAAlKXxSrDob/W9UJc1J8YVDxOXYhkLc9FrTb4SluNtSNQJ+2w0ouLcDrtrfJZLByQgNcLBRuRMXxJSd7HKbw8YFguy7etss3v6XZ3IrGlbFzCbpTqmJLHUwNSmDR4sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968828; c=relaxed/simple;
	bh=ye0+AjR4xMDKiF5PJH1197PGAb/qUvHf1ZXJ3sOWkFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j8jwnNWyBfqMsM52WeZ/r97R4M4KUnSvLsaqNAq7k81QpRg3LCepf/aZv2d5ZDw+98nYYAvmvZyKrzyccOMB8E7t7Odn6U2v4KpnqkVuTeVMB/J6yLdRpKMoimQsZ57g49FuFouRt7L5x4e+7rfajwql/1EDcgJLHiW8hmX8svM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=PnQzSDY+; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ZJT8jAYg reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716968826; x=1748504826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jr7fCGaDvK5T7b6qLgLPpM6rhJVmlldtFLw2mTSr8uw=;
  b=PnQzSDY+eAjLbSBkd+iGcCQejpclTbywUcpshXCvBhkGLz0MA6OoNj5K
   dylc0zIaiiSRDzGg6EL/EoMN0uE9t4+Cs1xzDrSfvXhdCtfqI3fRNXKBg
   91DRhn3DJQYQ1hSuGckJKQMTw3WnHjBH2WAshGRdClJQMDuV/gAwwE1Uu
   DHR1T8a6ECAQAMfgAvCZioSqWFpDiZI8kV8fiB2VSsOm2DaKaAQY9o5wg
   xfCYTn/bsVjr49lU/8o0vMawMqobPUwqwElZEsl0DcUfrQI1PYpqj8Wne
   ZYCZscw8m4FUS2SzNHfzuCM9EFMdHXXX+e9kF07XyxnJtpin3Lx0azL+q
   A==;
X-CSE-ConnectionGUID: EaU7X7mNTratvwXWAZb0Zg==
X-CSE-MsgGUID: qdE9Eec3SjmEOzh16s/Hzg==
X-IronPort-AV: E=Sophos;i="6.08,197,1712613600"; 
   d="scan'208";a="37119692"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 09:47:05 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A57421653AB;
	Wed, 29 May 2024 09:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716968821;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jr7fCGaDvK5T7b6qLgLPpM6rhJVmlldtFLw2mTSr8uw=;
	b=ZJT8jAYgmnnSI475P0T/ckUTC6jaFyiPh64UJh1ZT9s64k+6C0ONUO1/Abtyo7oEYqe7DG
	wgO6hr8Nmt/4TKH0U2ao19npBheotBq8XzfOHjoLWB74K05l9h9qdsptvMVle/096Sw6cG
	czQP3n4S4X7dY2qiIJM7CzZg3dWNfxvWJjsZ2MbYsxoIYXnQkyLkplZfQ032phth0cb4ls
	e7WXKbmBWo36qosA/6K2abBpg1jc0rFrn/b5+2xfUGUAFg4X1cDnIdFkpxVRwpHDI3Ex0t
	ltteaWNrrqMBzGGyv6pyHs4ExEs8u5VupCZzSuhvpN8oMHni4gv7Onslh5FVpQ==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 8/8] gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH interrupt type
Date: Wed, 29 May 2024 09:45:20 +0200
Message-ID: <2c265b6bcfcde7d2327b94c4f6e3ad6d4f1e2de7.1716967982.git.matthias.schiffer@ew.tq-group.com>
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

The TQMx86 GPIO controller only supports falling and rising edge
triggers, but not both. Fix this by implementing a software both-edge
mode that toggles the edge type after every interrupt.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Co-developed-by: Gregor Herburger <gregor.herburger@tq-group.com>
Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/gpio-tqmx86.c | 42 +++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index c957be3341774..400415676ad5d 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -126,9 +126,15 @@ static void _tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int hwirq)
 	unsigned int offset = hwirq - TQMX86_NGPO;
 	u8 type = TQMX86_INT_TRIG_NONE, mask, val;
 
-	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED)
+	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED) {
 		type = gpio->irq_type[hwirq] & TQMX86_INT_TRIG_MASK;
 
+		if (type == TQMX86_INT_TRIG_BOTH)
+			type = tqmx86_gpio_get(&gpio->chip, hwirq)
+				? TQMX86_INT_TRIG_FALLING
+				: TQMX86_INT_TRIG_RISING;
+	}
+
 	mask = TQMX86_GPII_MASK(offset);
 	val = TQMX86_GPII_CONFIG(offset, type);
 	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
@@ -200,8 +206,8 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
 	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
-	unsigned long irq_bits;
-	int i = 0;
+	unsigned long irq_bits, flags;
+	int i, hwirq;
 	u8 irq_status;
 
 	chained_irq_enter(irq_chip, desc);
@@ -210,6 +216,36 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 	tqmx86_gpio_write(gpio, TQMX86_GPIIS, irq_status);
 
 	irq_bits = irq_status;
+
+	raw_spin_lock_irqsave(&gpio->spinlock, flags);
+	for_each_set_bit(i, &irq_bits, TQMX86_NGPI) {
+		hwirq = i + TQMX86_NGPO;
+
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
+		 * _tqmx86_gpio_irq_config() - even if an edge arrives between
+		 * reading the input and setting the trigger, we will have a new
+		 * interrupt pending.
+		 */
+		if ((gpio->irq_type[hwirq] & TQMX86_INT_TRIG_MASK) == TQMX86_INT_TRIG_BOTH)
+			_tqmx86_gpio_irq_config(gpio, hwirq);
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


