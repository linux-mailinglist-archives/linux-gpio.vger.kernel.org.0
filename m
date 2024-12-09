Return-Path: <linux-gpio+bounces-13638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D6C9E9095
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5878C1637DA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 10:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A072221E08C;
	Mon,  9 Dec 2024 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="nbC4NSaf";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RbjyXkEz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D8021D59D;
	Mon,  9 Dec 2024 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733740617; cv=none; b=huZWkC8fzuIPOmmrTrEuRMKV72IM1mKlMLlqN8on5xJ3JD5grVjK2atGeS7TAjsRJDudUJ6m2QBbEhiVQN6qd7pZ+u32pRqG2l373T9AgF13Eq6GbuH1VDkb8H7Kr9LgP3ONWV1fwj618ehPA1GMQHR1UUT4eoxtKKtBUXIyfZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733740617; c=relaxed/simple;
	bh=XPXDDWsTYp9a1nso6BhBQSLItX/DWJfeMm5HuQsCBNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MGfI0Eyn8KEHBdBDltI8NanhaenD55AIdsCBW+DVb45mIa1uf8ApGGQvMdHr3mOCp6cRXNw/axoKzaIgH7KVHPqLd3VPvuQRU2S5yMOdkJbIi/eAdQWGCDkVO/JMNHiq1IxcTW3UnaH1zI5XsKG0tZj/23PVHMrVqiiYzb87sFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=nbC4NSaf; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RbjyXkEz reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733740615; x=1765276615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E+vB5HAiznNbp3IlGxXsMkg/hKO1xPMsQOOTQfvN+QU=;
  b=nbC4NSafV4JqoV6FcZb/NFI81ol3PwUPZJ0elFOiFE4KNagLJvJBIBpC
   ggFp0nujgLiV2iJMtduzckH0YCyvGR01JoEuhSsZeRhIlEpvIupULcuDP
   Zt9ji1UmzRB6LfElJDCxY/xPcrB1ytOceoEMgYJqUKBrjAJ0L5/cFe5NP
   RRHw4bbSTWqqkl/d/+Fw5k7FD6m8HbGM9eGDE4wX2v/oYxU0beKECp2sh
   g47SI1/nM8TFHiUZoA2wAnCoj3s5tPA2pVv7vmMPQtfgQVmINedxcwWUq
   XY5mthBAM16mvrYXQHeakftvbPpvfytOi5ZhVoPMQjZPd24ygmUK5ZMuj
   w==;
X-CSE-ConnectionGUID: bseE2S+JQ3a6VQAurb9X8g==
X-CSE-MsgGUID: OClMur2tSLWGbCIJF0bkiA==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40483011"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 11:36:54 +0100
X-CheckPoint: {6756C846-2-5736D786-D50827BE}
X-MAIL-CPID: 1FB7F56F1D846769F7DD09E81DDE5422_2
X-Control-Analysis: str=0001.0A682F2A.6756C846.0052,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70CA5166837;
	Mon,  9 Dec 2024 11:36:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733740609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E+vB5HAiznNbp3IlGxXsMkg/hKO1xPMsQOOTQfvN+QU=;
	b=RbjyXkEzn3u/KvolU+nGSZHqIWuzYPwXprZo3blF17VEWios6CGXhmCRWs9Q1RrqVfgTdv
	a1qrs95Hh/etrqjao0WeQkmumvsEIPvRiJFvmRqb+6YRlJPAOIeqN4s6GCfpA9fzBil7jn
	5vXvvSMCQnqJ3oXxOL1p21FSuQC23cMj9m3EDVm36662jwnWLcnI1GXP+A0EeSDBhjOFKP
	S8+c9MPsSGME4x09Ws9yVS4rEr+HMFkINk3eEEmF94cjAWdHTfduqJtvVE1ZvsLHvHylPC
	iFJnI5pGfl7uW5mOpfgkbEC78IZPIJ9BmwUgK7maFE+Y+0WpAn0rzQM5trAxag==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 4/4] gpio: tqmx86: add support for changing GPIO directions
Date: Mon,  9 Dec 2024 11:36:11 +0100
Message-ID: <0fd4b472b1ed6d67d8d1fe2f20d3bedd7eda210f.1733739697.git.matthias.schiffer@ew.tq-group.com>
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

Only GPIOs 4..7 have IRQ support on the TQMx86 variants currently handled
by the driver, but apart from that, changing directions works fine. The
default directions are left unchanged (0..3 output, 4..7 input) to match
the COM Express specification.

A tqmx86_gpio_set() variant without locking is introduced as a new
helper.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/gpio-tqmx86.c | 46 ++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 54e7e193bb209..4c7e7b5950426 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -84,6 +84,14 @@ static int tqmx86_gpio_get(struct gpio_chip *chip, unsigned int offset)
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
@@ -91,40 +99,50 @@ static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	__assign_bit(offset, gpio->output, value);
-	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIOD);
+	_tqmx86_gpio_set(gpio, offset, value);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
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
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&gpio->spinlock, flags);
+	tqmx86_gpio_clrsetbits(gpio, BIT(offset), 0, TQMX86_GPIODD);
+	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
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
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&gpio->spinlock, flags);
+	_tqmx86_gpio_set(gpio, offset, value);
+	tqmx86_gpio_clrsetbits(gpio, 0, BIT(offset), TQMX86_GPIODD);
+	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
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


