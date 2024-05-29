Return-Path: <linux-gpio+bounces-6804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 273D28D2ED8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D21E528C3F0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A0F16A363;
	Wed, 29 May 2024 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="U6RTjOMJ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AbbykAQk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8DD168C37;
	Wed, 29 May 2024 07:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968824; cv=none; b=uMvl4N/EeRX0c+iq0zry/2HOQY6iofrZp6V0OEYaGVYHXLupeao+d4lmjBQlithojwUV+pZ33ihz9ntwL1UuqD+E4U/aematSOZpDdIPkFfzaTuis34rWobec7dc7+B+2/ECBEW54bJt54Z8DarGlwpLORAR55AfW1ehf73ud3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968824; c=relaxed/simple;
	bh=3QHuTILnJdSRl5pi75xZK9x5MRDmej8FTxrGOuEg8Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7w3+O4igq/156FQAQdTmqtBn4yKW0EHX9URptq4e9b6EgTya1PDAgfkOwhad85QAr18kax/7mfiP5dViElrS5/3avrfZzme0NcXL/HkOgNwByXhXhxTAN+gWWi8TL12f2kRGz6rz1m+K4TiPuSlD/8DhcBRuGDAJkjLVhg+i70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=U6RTjOMJ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AbbykAQk reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716968823; x=1748504823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=caOZbQUWt+zI8G+ePC5/yzmPLu8LPl6qOM0XKEOKGSI=;
  b=U6RTjOMJUvj4bJIdrU3+jULbFQ2tRgOEB6Yi5LGs4/wK/1/vl9WCAHa0
   hRpSVE14t0XMwKmwlJ9Gem134wiyzN8KhaSVEfGu6WmfDX2Qtkwtr8wCa
   M6tt/ZOHs8XDyLGeJrImQyCd1u3rqbS3N1D9k1Uf3IhJD235FcqsorJoA
   pGx26LVqEQ65aY4PyyKSRiKpi2UxmvP0d9CjUNPWk3ANMu8uCqHvi3Btr
   xjK1PukJvM7/3uJDPPm8sUH+Yv0OgIAiHHtb21iltMG06qVKrilEN+PGj
   omQI6NGznTdfsrWKYiFWXiSDUry/A0DbB5NtsGuOYpfwdQ4jNMCV7JcK/
   g==;
X-CSE-ConnectionGUID: NkF9IZlsRPa7UV+p6zylWw==
X-CSE-MsgGUID: kwSqeFqeTCmONvzNVtEpyw==
X-IronPort-AV: E=Sophos;i="6.08,197,1712613600"; 
   d="scan'208";a="37119690"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 09:47:00 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5100E1653AF;
	Wed, 29 May 2024 09:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716968816;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=caOZbQUWt+zI8G+ePC5/yzmPLu8LPl6qOM0XKEOKGSI=;
	b=AbbykAQk48vIParFn5Hv0sDBd8BoQxx74naZyfBOFuokIRfaFADSgqH1YeoIoQoUBMyhPn
	XjOxCwcXXXvuLVxyuCvYKINBDdhJO0NtyhqTvmy8ZTJakyJBVIl4CQKmB1UPjCBuS9OPxy
	xdCbLkUTRlnA0PcfGz9SiOqzu4OJWFpBS6LmY1Md42W/t4iCPgYPXNRe+4SZhoCvCUxKAI
	zH1z8iHt2x0T9cuo/zGfi9QFGAfws38x9Yp8iIGC2ShFyHQ9WKmDzOC1sOh9jidWpBLuWC
	koVYIfSqt+A3tcKMJJLvcxtuTT/cEcUmZN9+vncwWK5QtEXFwFD+NqUzuVBfDA==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 7/8] gpio: tqmx86: store IRQ trigger type and unmask status separately
Date: Wed, 29 May 2024 09:45:19 +0200
Message-ID: <c0b01bce7758847916e7b12000ab1e02025c23f4.1716967982.git.matthias.schiffer@ew.tq-group.com>
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

irq_set_type() should not implicitly unmask the IRQ.

All accesses to the interrupt configuration register are moved to a new
helper _tqmx86_gpio_irq_config(). We also introduce the new rule that
accessing irq_type must happen while locked, which will become
significant for fixing EDGE_BOTH handling.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/gpio-tqmx86.c | 41 +++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 4b37cc3bdd455..c957be3341774 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -34,6 +34,7 @@
 #define TQMX86_INT_TRIG_RISING	0x2
 #define TQMX86_INT_TRIG_BOTH	0x3
 #define TQMX86_INT_TRIG_MASK	0x3
+#define TQMX86_INT_UNMASKED	BIT(2)
 
 #define TQMX86_GPII_CONFIG(i, v)	((v) << (2 * (i)))
 #define TQMX86_GPII_MASK(i)		TQMX86_GPII_CONFIG(i, TQMX86_INT_TRIG_MASK)
@@ -42,6 +43,7 @@ struct tqmx86_gpio_data {
 	struct gpio_chip	chip;
 	void __iomem		*io_base;
 	int			irq;
+	/* Lock must be held for accessing output and irq_type fields */
 	raw_spinlock_t		spinlock;
 	DECLARE_BITMAP(output, TQMX86_NGPIO);
 	u8			irq_type[TQMX86_NGPIO];
@@ -119,17 +121,28 @@ static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
+static void _tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int hwirq)
+{
+	unsigned int offset = hwirq - TQMX86_NGPO;
+	u8 type = TQMX86_INT_TRIG_NONE, mask, val;
+
+	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED)
+		type = gpio->irq_type[hwirq] & TQMX86_INT_TRIG_MASK;
+
+	mask = TQMX86_GPII_MASK(offset);
+	val = TQMX86_GPII_CONFIG(offset, type);
+	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
+}
+
 static void tqmx86_gpio_irq_mask(struct irq_data *data)
 {
-	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
 	unsigned long flags;
-	u8 mask;
 
-	mask = TQMX86_GPII_MASK(offset);
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, 0);
+	gpio->irq_type[data->hwirq] &= ~TQMX86_INT_UNMASKED;
+	_tqmx86_gpio_irq_config(gpio, data->hwirq);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
 	gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(data));
@@ -137,18 +150,15 @@ static void tqmx86_gpio_irq_mask(struct irq_data *data)
 
 static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 {
-	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
 	unsigned long flags;
-	u8 mask, val;
 
 	gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(data));
 
-	mask = TQMX86_GPII_MASK(offset);
-	val = TQMX86_GPII_CONFIG(offset, gpio->irq_type[data->hwirq]);
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
+	gpio->irq_type[data->hwirq] |= TQMX86_INT_UNMASKED;
+	_tqmx86_gpio_irq_config(gpio, data->hwirq);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
@@ -156,10 +166,9 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
-	unsigned int offset = (data->hwirq - TQMX86_NGPO);
 	unsigned int edge_type = type & IRQF_TRIGGER_MASK;
 	unsigned long flags;
-	u8 new_type, mask, val;
+	u8 new_type;
 
 	switch (edge_type) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -175,12 +184,12 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 		return -EINVAL; /* not supported */
 	}
 
-	gpio->irq_type[data->hwirq] = new_type;
-
-	mask = TQMX86_GPII_MASK(offset);
-	val = TQMX86_GPII_CONFIG(offset, new_type);
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
+
+	gpio->irq_type[data->hwirq] &= ~TQMX86_INT_TRIG_MASK;
+	gpio->irq_type[data->hwirq] |= new_type;
+	_tqmx86_gpio_irq_config(gpio, data->hwirq);
+
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
 	return 0;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


