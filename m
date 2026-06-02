Return-Path: <linux-gpio+bounces-37775-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMzVDPVkHmrCiwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37775-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:07:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6416285BD
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0E0D30A6A28
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 05:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE7E24E4C3;
	Tue,  2 Jun 2026 05:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy/law28"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9DA24EAB1
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 05:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376528; cv=none; b=pHGgfR+ZPs4yaXKlLqO9SLOWDktqJ9BfU9JdEF2YZj8YEMriaNvhWCJWXbry1cKBuWIrPJn5uHSlWi6qMU3D8IX4CkTHRgZ3Bog9vKjBqYC4QOnp8b+AuWPgEPmPgqzmkGJQ/gwlgoqDdEk64BM/xat7xCVfSmO7jMgl5kxaTrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376528; c=relaxed/simple;
	bh=PkS84usnPdqdxgf1CnilQiWCG1S+vb0BnjAvWxF/mYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/3powTZYp0F/xVWV68yilBXqT8wYVL5FBV1HmUA2rysQWKDhxOi6Gu9DQ1Ab+zmlSeZxHzMBSdH+1uC9xUxjZI32KOgqwQ7qx1lyc4fCW4lozyTTD8A3CS8F3RR7FCNfLWkZnKi90pyVeIIQUMXdQT4GDyqRYm2KELhuDtkDOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy/law28; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36baec934b6so2143635a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 22:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376524; x=1780981324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gM2FIUryBRQiEGRMHtydSbfKjl7tClJ0BToQ5C2TWsg=;
        b=iy/law28fQAONKO5YrlDt8AxBky93H9ogiI2Lh2pJKpJkI8BqHP9paX8JKcgFnTlpb
         y3hly9kPS6tx+MU7PKFAL4WHt7Cokz3W1a25Tn9iId8i0ABZt0WET/0fOQAYUq1HXhiw
         Sx/dZmo8qU/l1zqtPWroCGa154Cy6NI6CK9uvwdQNE3lhKh0ecG4od9e0g3zBhPJ7wiV
         7u9l28k1yWJ6bIX67SnVgIE8qvsdGmMKl7S8uxqM972XWILVLvwY+pZu4NvET4voXzBs
         VUu+nD6x2OM5h0Fw59rPzJTMIj7Rkdfh748RkT2GTEqpSynsEVdf6rT4EJihygRNq9wZ
         6Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376524; x=1780981324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gM2FIUryBRQiEGRMHtydSbfKjl7tClJ0BToQ5C2TWsg=;
        b=oZTKg3ppdLCkF2qHWlrIwyBnKoLhl0uq/fChnp470NuaRNcDESwqbuzhJWu4JV/WdZ
         uPSzC91B5gJ5xiy2o5Gp/sXSGdNmSYKomQBbxjO5bhO4hql2JAdOq2rgQOVGdf25Rm4o
         bynxF3Ee1U80mfnhOmRahnOd0yPfYInm12FYeAjazsk5u6tiTT9PccYpbSPx1l6iwYCq
         UxvfZcv7WlBbWJFlQnevN3Zdv8eTpsP5i7rsnzpaK5rl2wM4lkVjFhODcuyItmiPgJ8h
         IVO7gx4N/LPSanYN7dJKEMKZ732suWPH6S8PnT/O+JsWM+oEFuGAz6DgcbhD5C4TK42z
         oBVA==
X-Gm-Message-State: AOJu0YyXs1i+JQzWdiC6yPwBrQI+hGqdO1mY8Hsa/KQb3UFjRErZpjVl
	FMGgGCX/HLYLgaANCgTXLR0wlYiFeeN/qiM0gEdjW4eXsIRaVPB9jJpBjwGEdVoq
X-Gm-Gg: Acq92OFKSwR3ty9Yn//e+h5j0tONvmoTu+aqba4LjreyxIiQc5AJNeHvgWAaolJ96bE
	LHrcQzsNfrTJauINj1/M+BSDOhbeUTxi+DyX4+YwSUnBONxDpTDcQqI+3T++26cCy8MN3Qcoa9A
	kulr5Shp641Q1T+pELq06LU2aODepeeiXFyoLUiZfHeKe6gXLDr8icSj7CaEBqdyeZzWiB1dmle
	+NutrMFlrux6XBjjEnfg1Jj9XQec7ExpGcu2u+RZDJwVh3iMcH6rYKhH8y8LGYlvGC+GA5k7EWt
	pLC9les3ld5oH24PiHd1WhHea5+hqft/4bOT0yLDL9QMvt8hZ2ywTI4MXs78ZbKtVyuWlucAqzX
	aytcXhEmvdzuMwtCDWb9ln+UHR7ueBefZgMJQ837qFu8VpOoxbjBgg4daihGhogn1xPEuCbnAdh
	KiYvKLMi4pbsH0dKMUHuIQP1159es0xAhhrEvNzqLe+rpAKASrwkDYKqJuQa1aIFEWEINwFr1JW
	XNrZoxk7LKuQyU7SUSKfCS/TGl3k6Xr2f1t3FlC59KM0Q==
X-Received: by 2002:a05:6a20:c998:b0:3a2:d53f:691c with SMTP id adf61e73a8af0-3b478d11b1bmr2304417637.26.1780376524097;
        Mon, 01 Jun 2026 22:02:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8589d055c7sm8958467a12.9.2026.06.01.22.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 22:02:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/7] gpio: ppc44x: drop PPC-specific IO helpers and rename to ppc44x
Date: Mon,  1 Jun 2026 22:01:30 -0700
Message-ID: <20260602050131.856789-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602050131.856789-1-rosenp@gmail.com>
References: <20260602050131.856789-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-37775-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:email]
X-Rspamd-Queue-Id: 8B6416285BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace PPC-specific clrbits32()/setbits32() with local helpers using
ioread32be()/iowrite32be() which are equivalent on PPC since commit
894fa235eb4c ("powerpc: inline iomap accessors"). This allows the
driver to be compiled on any architecture with COMPILE_TEST.

- Changed Kconfig dependency to depends on 44x || COMPILE_TEST

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig       |  3 +-
 drivers/gpio/gpio-ppc44x.c | 88 ++++++++++++++++++++++----------------
 2 files changed, 53 insertions(+), 38 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 77991da43ec1..7374f82b7040 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -595,9 +595,8 @@ config GPIO_POLARFIRE_SOC
 
 config GPIO_PPC44X
 	tristate "PPC44x GPIO support"
-	depends on 44x
+	depends on 44x || COMPILE_TEST
 	select GPIO_GENERIC
-	select GPIOLIB
 	help
 	  Enable gpiolib support for ppc440 based boards.
 
diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 6b4814ed12b5..cc7796e0cfbd 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * PPC4xx gpio driver
+ * PPC44x gpio driver
  *
  * Copyright (c) 2008 Harris Corporation
  * Copyright (c) 2008 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
@@ -22,7 +22,7 @@
 #define GPIO_MASK2(gpio)	(0xc0000000 >> ((gpio) * 2))
 
 /* Physical GPIO register layout */
-struct ppc4xx_gpio {
+struct ppc44x_gpio {
 	__be32 or;
 	__be32 tcr;
 	__be32 osrl;
@@ -43,11 +43,27 @@ struct ppc4xx_gpio {
 	__be32 isr3h;
 };
 
-struct ppc4xx_gpio_chip {
+struct ppc44x_gpio_chip {
 	struct gpio_generic_chip chip;
 	void __iomem *regs;
 };
 
+static inline void ppc44x_clrbits32(void __iomem *addr, u32 mask)
+{
+	u32 val = ioread32be(addr);
+
+	val &= ~mask;
+	iowrite32be(val, addr);
+}
+
+static inline void ppc44x_setbits32(void __iomem *addr, u32 mask)
+{
+	u32 val = ioread32be(addr);
+
+	val |= mask;
+	iowrite32be(val, addr);
+}
+
 /*
  * GPIO LIB API implementation for GPIOs
  *
@@ -55,9 +71,9 @@ struct ppc4xx_gpio_chip {
  */
 
 static inline void
-__ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+__ppc44x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
 	struct gpio_generic_chip *gen_gc = &chip->chip;
 
 	if (val)
@@ -68,29 +84,29 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	gpio_generic_write_reg(gen_gc, gen_gc->reg_set, gen_gc->sdata);
 }
 
-static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
+static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
 	struct gpio_generic_chip *gen_gc = &chip->chip;
-	struct ppc4xx_gpio __iomem *regs = chip->regs;
+	struct ppc44x_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	gpio_generic_chip_lock_irqsave(gen_gc, flags);
 
 	/* Disable open-drain function */
-	clrbits32(&regs->odr, GPIO_MASK(gpio));
+	ppc44x_clrbits32(&regs->odr, GPIO_MASK(gpio));
 
 	/* Float the pin */
-	clrbits32(&regs->tcr, GPIO_MASK(gpio));
+	ppc44x_clrbits32(&regs->tcr, GPIO_MASK(gpio));
 	gen_gc->sdir &= ~GPIO_MASK(gpio);
 
 	/* Bits 0-15 use TSRL/OSRL, bits 16-31 use TSRH/OSRH */
 	if (gpio < 16) {
-		clrbits32(&regs->osrl, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
 	} else {
-		clrbits32(&regs->osrh, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
 	}
 
 	gpio_generic_chip_unlock_irqrestore(gen_gc, flags);
@@ -99,32 +115,32 @@ static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 }
 
 static int
-ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
+ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
 	struct gpio_generic_chip *gen_gc = &chip->chip;
-	struct ppc4xx_gpio __iomem *regs = chip->regs;
+	struct ppc44x_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	gpio_generic_chip_lock_irqsave(gen_gc, flags);
 
 	/* First set initial value */
-	__ppc4xx_gpio_set(gc, gpio, val);
+	__ppc44x_gpio_set(gc, gpio, val);
 
 	/* Disable open-drain function */
-	clrbits32(&regs->odr, GPIO_MASK(gpio));
+	ppc44x_clrbits32(&regs->odr, GPIO_MASK(gpio));
 
 	/* Drive the pin */
-	setbits32(&regs->tcr, GPIO_MASK(gpio));
+	ppc44x_setbits32(&regs->tcr, GPIO_MASK(gpio));
 	gen_gc->sdir |= GPIO_MASK(gpio);
 
 	/* Bits 0-15 use TSRL, bits 16-31 use TSRH */
 	if (gpio < 16) {
-		clrbits32(&regs->osrl, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
 	} else {
-		clrbits32(&regs->osrh, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
 	}
 
 	gpio_generic_chip_unlock_irqrestore(gen_gc, flags);
@@ -134,14 +150,14 @@ ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static int ppc4xx_gpio_probe(struct platform_device *ofdev)
+static int ppc44x_gpio_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = dev->of_node;
-	struct ppc4xx_gpio_chip *chip;
+	struct ppc44x_gpio_chip *chip;
 	struct gpio_generic_chip_config config;
 	struct gpio_chip *gc;
-	struct ppc4xx_gpio __iomem *regs;
+	struct ppc44x_gpio __iomem *regs;
 	int ret;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
@@ -169,8 +185,8 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 
 	gc = &chip->chip.gc;
 	gc->fwnode = dev_fwnode(dev);
-	gc->direction_input = ppc4xx_gpio_dir_in;
-	gc->direction_output = ppc4xx_gpio_dir_out;
+	gc->direction_input = ppc44x_gpio_dir_in;
+	gc->direction_output = ppc44x_gpio_dir_out;
 
 	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
 	if (!gc->label)
@@ -179,20 +195,20 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 	return devm_gpiochip_add_data(dev, gc, chip);
 }
 
-static const struct of_device_id ppc4xx_gpio_match[] = {
+static const struct of_device_id ppc44x_gpio_match[] = {
 	{
 		.compatible = "ibm,ppc4xx-gpio",
 	},
 	{},
 };
-MODULE_DEVICE_TABLE(of, ppc4xx_gpio_match);
+MODULE_DEVICE_TABLE(of, ppc44x_gpio_match);
 
-static struct platform_driver ppc4xx_gpio_driver = {
-	.probe		= ppc4xx_gpio_probe,
+static struct platform_driver ppc44x_gpio_driver = {
+	.probe		= ppc44x_gpio_probe,
 	.driver		= {
-		.name	= "ppc4xx-gpio",
-		.of_match_table	= ppc4xx_gpio_match,
+		.name	= "ppc44x-gpio",
+		.of_match_table	= ppc44x_gpio_match,
 	},
 };
 
-module_platform_driver(ppc4xx_gpio_driver);
+module_platform_driver(ppc44x_gpio_driver);
-- 
2.54.0


