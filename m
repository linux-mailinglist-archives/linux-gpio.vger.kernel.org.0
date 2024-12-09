Return-Path: <linux-gpio+bounces-13637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F339E9093
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36222188716A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 10:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A531121D00A;
	Mon,  9 Dec 2024 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Yp4hSp5F";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="SU8z9eyp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C28217676;
	Mon,  9 Dec 2024 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733740614; cv=none; b=bFOFGQ/md/CSr5dIzwx9tw86zLIbJTTRCPxZWCasOyGaOhXJiq9gG8Lf2udahbaTn28/I445HmCq6u9+Rh11X1qC2jt/TuoB1vZNMnE993AJRw2GFLVanvpke10faiEPl2ut38u/HiGLhoXDox+wqm0lDw66/Vx9HV8NKbZdqWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733740614; c=relaxed/simple;
	bh=oVS9tzeNo7CsFEhheHtWjTsxK/WlbZAhXTrOmICW7PM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sCtpk5FycoiXmwF8feiprQ0Ei/TenNOgFqLCVQHyhb8aGnbkwWEd4JLFaVXNKh2PcuB78ZoEUa1zBtIQAmZ1TrzwKpcT/ZTpIg07xaiin2F/pJsIIpLFairB2okbjQzClkcspLPFmr8ejutBq16oQN4Hz6Qfz9GG3oEF2kdGYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Yp4hSp5F; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=SU8z9eyp reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733740612; x=1765276612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3GsMM2YeX5/LW7lIKPJeDGsFJioH4XRYcPWTt8pgsss=;
  b=Yp4hSp5FGXUXHq0ykphb4x6VAawp9u/Bp2A5yhOKNGIIJHIRyGXQxIUX
   Qdf+e9rPM9BLdCcJsuAQqDcOgq+1m8mPVgY0VIPQ/YXK5rrHo8HJS3FrZ
   dPQ/DDgaGhJEA7lxVcCk6h33sUW0slC4a650Xx9WgPK+Q6N+F3svGUkDh
   CYKP1xmA4EcrErVfk8ngIllzjbVe4zP17/hwXuLs6plgM/Xr1TNKdh1AY
   aC/DF81BVEF00w6VfupgAkDpteXG+YSfkPUNv8tCxf4zDl7H4qkQ+vmpH
   O+TQBJq1AJTxWKmNZpUJKuDa8paS/x/oqx/kzGCTnC5K9jVwi+w7qN3/T
   Q==;
X-CSE-ConnectionGUID: /19JHd0RRoqJvvRLtMsuXw==
X-CSE-MsgGUID: AtRkPYonQpO95BEOj+mVug==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40483004"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 11:36:49 +0100
X-CheckPoint: {6756C841-34-F5DC7025-F79421CB}
X-MAIL-CPID: 34C7053E5EE9A47CFEE19BD5992A1727_0
X-Control-Analysis: str=0001.0A682F1E.6756C841.0097,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D915B166471;
	Mon,  9 Dec 2024 11:36:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733740605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GsMM2YeX5/LW7lIKPJeDGsFJioH4XRYcPWTt8pgsss=;
	b=SU8z9eyphfgzkgELcHDSbZXNjEgrMkb8JqJ++R+ifGRor0pB7JhAsLXpb8r5razz96pR9t
	dox0+Zz5ntm+DfPT6hO5Wd/CU+g63M9HROpwtTUS4i1JMTeRw16W64z8ht5mc+wc3NYN9H
	IZX/wxY5AQgTbujvCng3nkp8V28XhvwKkedlKmX+UpTkc1d5+IaY5EjwlVf28dqdek+jxq
	za9cSegQ4fpcQ9x+BoWbMrL2DMg7GvPlMGzKsa4jWJZAgmxvH+8QoCxvbfRV+p9eKLwNS/
	GSsaAWKZjNuvH6/b+qCtNHiJFpdPsodyGsivTZsBB/7xR+WJHxPFJcP89Q9tNg==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 3/4] gpio: tqmx86: introduce tqmx86_gpio_clrsetbits() helper
Date: Mon,  9 Dec 2024 11:36:10 +0100
Message-ID: <a7b98f12da735f735b33200f6324360fc380e6d0.1733739697.git.matthias.schiffer@ew.tq-group.com>
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

Add a helper for the common read-modify-write pattern (only used in
tqmx86_gpio_irq_config() initially).

No functional change intended.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/gpio-tqmx86.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 27f44d112d582..54e7e193bb209 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -65,6 +65,18 @@ static void tqmx86_gpio_write(struct tqmx86_gpio_data *gd, u8 val,
 	iowrite8(val, gd->io_base + reg);
 }
 
+static void tqmx86_gpio_clrsetbits(struct tqmx86_gpio_data *gpio,
+				    u8 clr, u8 set, unsigned int reg)
+	__must_hold(&gpio->spinlock)
+{
+	u8 val = tqmx86_gpio_read(gpio, reg);
+
+	val &= ~clr;
+	val |= set;
+
+	tqmx86_gpio_write(gpio, val, reg);
+}
+
 static int tqmx86_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
@@ -118,7 +130,7 @@ static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
 static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int hwirq)
 	__must_hold(&gpio->spinlock)
 {
-	u8 type = TQMX86_INT_TRIG_NONE, gpiic;
+	u8 type = TQMX86_INT_TRIG_NONE;
 	int gpiic_irq = hwirq - TQMX86_NGPO;
 
 	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED) {
@@ -130,10 +142,10 @@ static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int hwirq)
 				: TQMX86_INT_TRIG_RISING;
 	}
 
-	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
-	gpiic &= ~TQMX86_GPIIC_MASK(gpiic_irq);
-	gpiic |= TQMX86_GPIIC_CONFIG(gpiic_irq, type);
-	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
+	tqmx86_gpio_clrsetbits(gpio,
+			       TQMX86_GPIIC_MASK(gpiic_irq),
+			       TQMX86_GPIIC_CONFIG(gpiic_irq, type),
+			       TQMX86_GPIIC);
 }
 
 static void tqmx86_gpio_irq_mask(struct irq_data *data)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


