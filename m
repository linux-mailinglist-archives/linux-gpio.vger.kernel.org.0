Return-Path: <linux-gpio+bounces-13817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 751009EE878
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 15:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9DD11690CA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 14:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB7622145C;
	Thu, 12 Dec 2024 14:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="gzFoNKp/";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pJpGcjdJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D585B2153EF;
	Thu, 12 Dec 2024 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734012543; cv=none; b=rlfkuMZFsputnFQUFnr2YClsEZ69tZytCJ6s+veb/OYIzZ7P4xaf6A/kut7v9iYxRwBN5fIGM6J1wUqDGr/CRBuZ6ojW8ESfi+apmqIP/eLjYLBToELkhsZMVXJn29YtSHLTjef/8Tu7J0GToCMC23pI7EpzA+t1BuAaFqBrYNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734012543; c=relaxed/simple;
	bh=bBN5FNu9QgpvClX6IMfAS7L4hO3y3iroHF8YuPSR57g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BgSX2ltfnvDMPs73O9Fg1UT3VjNOfhBH0rpbdKD3JQY5VuNgJpwjxBLAXNxVGHexSRdf5zV2/Q6y6FyagqAU5XDsM/tZ4BmJQHmeP74pM4/D2MI5X353C3j8THlzvUhyNesNI6wS8vwvUaFTv5NZuHl1zhnG3TkyJc0YYjGBEqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=gzFoNKp/; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pJpGcjdJ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1734012541; x=1765548541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5um5sWjiiZxgsQah+EqmqCRGB9RnVyyrwX3M80A2Qqs=;
  b=gzFoNKp/FsNTIqyib4WehuuFG5QnJItC6PCTA4+Fi8PUt3g9N8Vn8JRf
   BsqD0b+jBN7idZ1UxAHd97BO2MpvE6Pg1XCAxuO2GuwVGQOVaTBuJv3ZH
   Y89xETEVW1IdADrrbli3WbNrbWQjMBnGUnYQujyUEyfViaZs+dXx5HIus
   AjLIoedEIAyO1K9tWL+iY0ke5BlBGZisGf0OM0h89x7GJI67Jv+ZumgID
   3yiHNve3ekCq9cfH/+4RYO1CLt+zMjpDmrgmLNLZSvKtq+m4P0V+ouhYj
   8Orc+RdXVNGSs3iEI9PadJ0SHGa3La7D65XmZX3QPv9tkjhPWzO2PydSw
   A==;
X-CSE-ConnectionGUID: yc1ylwYdQNOshfpDhfMlng==
X-CSE-MsgGUID: Ep3eSzf2SWuIn/Mm/X+ASQ==
X-IronPort-AV: E=Sophos;i="6.12,228,1728943200"; 
   d="scan'208";a="40566537"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Dec 2024 15:09:00 +0100
X-CheckPoint: {675AEE7C-1B-3E9838BF-EEE9C5D3}
X-MAIL-CPID: 817FAB6172436064C1ED4FF72C63ADFF_1
X-Control-Analysis: str=0001.0A682F25.675AEE7C.0089,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C860916B96B;
	Thu, 12 Dec 2024 15:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1734012536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5um5sWjiiZxgsQah+EqmqCRGB9RnVyyrwX3M80A2Qqs=;
	b=pJpGcjdJzs7J0lSqAVImwusNWhbVaufxWfLtGzS46BL4Y10aGgtKAtbbiby39DAKWjvsGZ
	I6hocPT9V/r7TzZBe1dLguxrgwX7fKU7jdv6pWh+3yUfEPd23/r1cJjhJ/I6kG3ad46mkG
	PjAIx8S+6HSNaXrHS899wVDKA6Xq9ZTtYfgo69GFxnqXwfm126biwLKdw+RkDwatElB4h/
	umnbga9Mwe6bPpG0e1ffm6QaRpLmemXzeoc3NhzJbgjWDrbVCd4Xwk7ZpuYp5Dp1WlDxy1
	tuz90imrtqFG77+nRWYwqAp4xk2p9BKqhqgdZrJ4D4dbmvzIY+6dMANQOquOLA==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 5/5] gpio: tqmx86: add support for changing GPIO directions
Date: Thu, 12 Dec 2024 15:08:09 +0100
Message-ID: <d89da2f0e13fa6c8ec3f9076eed242133a1e3a63.1734001247.git.matthias.schiffer@ew.tq-group.com>
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

Only GPIOs 4..7 have IRQ support on the TQMx86 variants currently handled
by the driver, but apart from that, changing directions works fine. The
default directions are left unchanged (0..3 output, 4..7 input) to match
the COM Express specification.

A tqmx86_gpio_set() variant without locking is introduced as a new
helper.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: use lock guards

 drivers/gpio/gpio-tqmx86.c | 44 ++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 4bef13cad1807..18f523a15b3c0 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -85,6 +85,14 @@ static int tqmx86_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(tqmx86_gpio_read(gpio, TQMX86_GPIOD) & BIT(offset));
 }
 
+static void _tqmx86_gpio_set(struct tqmx86_gpio_data *gpio, unsigned int offset,
+			     int value)
+	__must_hold(&gpio->spinlock)
+{
+	__assign_bit(offset, gpio->output, value);
+	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIOD);
+}
+
 static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			    int value)
 {
@@ -92,39 +100,47 @@ static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 	guard(raw_spinlock_irqsave)(&gpio->spinlock);
 
-	__assign_bit(offset, gpio->output, value);
-	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIOD);
+	_tqmx86_gpio_set(gpio, offset, value);
 }
 
 static int tqmx86_gpio_direction_input(struct gpio_chip *chip,
 				       unsigned int offset)
 {
-	/* Direction cannot be changed. Validate is an input. */
-	if (BIT(offset) & TQMX86_DIR_INPUT_MASK)
-		return 0;
-	else
-		return -EINVAL;
+	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
+
+	guard(raw_spinlock_irqsave)(&gpio->spinlock);
+
+	tqmx86_gpio_clrsetbits(gpio, BIT(offset), 0, TQMX86_GPIODD);
+
+	return 0;
 }
 
 static int tqmx86_gpio_direction_output(struct gpio_chip *chip,
 					unsigned int offset,
 					int value)
 {
-	/* Direction cannot be changed, validate is an output */
-	if (BIT(offset) & TQMX86_DIR_INPUT_MASK)
-		return -EINVAL;
+	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
+
+	guard(raw_spinlock_irqsave)(&gpio->spinlock);
+
+	_tqmx86_gpio_set(gpio, offset, value);
+	tqmx86_gpio_clrsetbits(gpio, 0, BIT(offset), TQMX86_GPIODD);
 
-	tqmx86_gpio_set(chip, offset, value);
 	return 0;
 }
 
 static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
 				     unsigned int offset)
 {
-	if (TQMX86_DIR_INPUT_MASK & BIT(offset))
-		return GPIO_LINE_DIRECTION_IN;
+	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
+	u8 val;
+
+	val = tqmx86_gpio_read(gpio, TQMX86_GPIODD);
+
+	if (val & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return GPIO_LINE_DIRECTION_OUT;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int hwirq)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


