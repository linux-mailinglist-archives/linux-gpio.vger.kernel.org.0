Return-Path: <linux-gpio+bounces-27685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C469C0E2D5
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 14:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5304E4FB252
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B227305E10;
	Mon, 27 Oct 2025 13:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MYbdnWdS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114FC30171F
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572901; cv=none; b=R1uC944dFl+OIlxBIMP38q2dSkMhE5mPoCrGFDJAbCtaYeWr0X+FxmFp6/oN/w9PD2FRhDsdfJ3gtQo8DTd2CSUPSZ3K6SlEYsWOZSd03dvXeeynS/VYgcKHkBLXp3phKywhCKavfprZXLrdz/hEKQxjW0mMpRMN0aG13CwVT8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572901; c=relaxed/simple;
	bh=7MbQ16/Ul93oOSwMTkqbJaUlUg7qjzVOPHPyDowNFPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJ2ta3Up2jTl52D7fd2/o/silLlbqq7i8LBEA1GYSnvwJPW1z+fDCxfHd0plX92Bagt9/UgBIek9ICZ6sFhg9W+2orN0ss6cnHgRpu83agO5PbI+rjHi1DUlDH5bBnlcfVNQCNqd/eqjmPRZnC8+KbyQKKXRG3trybAuB6LzoLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MYbdnWdS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-426fc536b5dso3222256f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 06:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761572895; x=1762177695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7V5SyCo+i37v8YAlmgrKeW3wyrzXx7ogleXBs1WYh8=;
        b=MYbdnWdSLy2BpkKZ4vmuSQQpEeUE77nEffVQcCQJalQHh5FQE5tHuVJMMYT4nYs0bo
         lp1XO7kr7xE+sE0cNuJOwk7jD7JKyUKL6/axE9Nbv09OmEJUdMGkl/hK3HzqcQEek4hO
         tmjpT3402D4gd7fHjUb/eFzm7PdHJhQOiCZicvZnxIL3ufSEw9XP3gUKO60D+28UZMJF
         wD0UEWo5vOcfNyXsLe/PrlggBq8vq06sK+2ivvnuLdqDhHhSRDViO9iP20Ke6JydPK8i
         109fjnx/wV7QHGsapq+xhTxG3IHicjpPg0y86pIGrqai1bHJ80YfeqglqkxQlm3VPBYF
         fyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572895; x=1762177695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7V5SyCo+i37v8YAlmgrKeW3wyrzXx7ogleXBs1WYh8=;
        b=GxPyRH1u/+xcvnyaYCq9FQO1G36OBRIQ8gmwSZtR2maUwX7lgqzhMknKLkO43zyVnn
         tQVouentdnGmoMnzpklsyD4Ax0DIBvLt3aWgZEUOsoczHeVF62urRQi4LFDlKFgaZUaW
         vizzxjSNTz6qeruTWtFehrblVtmIB8Qx3/LKWGvHrJyScfgzCRqlIsibpA5qq4Ls+Bld
         1sO5afSfGct4AtaMnIi4AWsqIClCRGDYvX3wsq0frn3VswS7Yrbu9DrGUBedp1Zi9Rpr
         SP8p9aCEN5RKiDk5U448wEmgrqeNL+2NA1OI8WOx2Uvlh2iIfU5neuAVJHaXF9sXk1ha
         MFVA==
X-Gm-Message-State: AOJu0YyN/+To07Hg0h5y04hmI3zkSkIPFPYZfpgQerLkHcXPMhNhybJr
	2LXdUan1q07R5/HLV0V2s0fqKtNY/ATm15qpjphWyuEiWa1oRfpmM4PlLyj461puv9U=
X-Gm-Gg: ASbGnctvRqPouuvGpP8sk93fhW1/iIviAxeiMgcr7DPdQNjo2hDnwn+Gjvbn2x9CVqA
	ZR3WY5PLUUML3YML8J6fTrelYSML08T7WIm+Mkgrm2PT+A1c6pCV6Fsremn19X1EhRMmsba5PaP
	R82TQJbKxznEu6fCBWJgDbyDwursoApUTU+K+DAKP3XawchtPPURwinIIcqGzG2DwD7nSf9cnD/
	Y7NO06EID6sQvAWnFy9a9VBqITN3WPxn3cVScM1qCUkLHdBQF9jtjpocnu6UfeXpVxjHpJJxgaP
	JkFGs1Cv8v/ezSMrKuH0O1f4eB2K5TafHAWR25f+fWouENBfFOpCS+JCjSwplj7YxNCi/0hGTEy
	jPMzYJQLOHY3lup/UjwP6AwXPirjNUXW6E9Q3B7GPblPSSebBHPifgth74PUZY24eMVvF52o=
X-Google-Smtp-Source: AGHT+IGiIsOBaWBH4D+A4/FuLtO/uYeS6HYsGfK/AkrO4TKBnvykRi0u0bo2XRkTZ0mujM4nwirsAQ==
X-Received: by 2002:a05:6000:1862:b0:427:921:8972 with SMTP id ffacd0b85a97d-4299074fe53mr10423607f8f.40.1761572895002;
        Mon, 27 Oct 2025 06:48:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db964sm14483390f8f.33.2025.10.27.06.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:48:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 14:48:03 +0100
Subject: [PATCH 2/2] gpio: mmio: drop the "bgpio" prefix
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-gpio-mmio-refactor-v1-2-b0de7cd5a4b9@linaro.org>
References: <20251027-gpio-mmio-refactor-v1-0-b0de7cd5a4b9@linaro.org>
In-Reply-To: <20251027-gpio-mmio-refactor-v1-0-b0de7cd5a4b9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=24916;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Qdgae8s/MaucODdSsq4e3B3BfdIRpcASisyCi9i6jXo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/3gZ+cl8L8HXP9Ml2ZnLZJ8jk3xEHjSpbCM9S
 V4JU85S6PaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP94GQAKCRARpy6gFHHX
 cu7lEACFXHVZumgP2iZw5hLCwB8LCaok/gO6mu89WqAI3uNXEmEu3bDLa16E7Ft4i2XPilqbeVU
 BKnuRrkShk4ldeIBQ9EFIQ8iPWb5oLmGuwQtGt02L5ueSFCAGqmsq+9ld3A3eOa3DG7ijAcVIHq
 Ru6brjWbA2QiBu80/hT26bJQ4vV+mPK0giBcMXOLdoKhS6Hsu5FAOvlrEpV/lkCPq50CmE7jM6O
 i38jJFhXN0cwtEyXWEXAU59Jho5QEVVGsNuX1U1gVrRK+Qa8k5ALw6ggplssZEQd1g139MM14NF
 L1yq5+7RdKztbgWqm/RiLvXEg0QQbbs/Ps4Mp0+OPS0Ml2+ksnIv9QvBvhqMMH8nNGa7mJ7fhA6
 KsybDB3BVD/qcrG2OPQdFstgR0cV1APNzLzUgOa/+EugvHQFjc2NPGH5EOOHJOZNdVU6HvUlEQ6
 1HA/tOrqgJVWtY+CMLlzYjEaSjEc+PuhTGd3plroWdQsq/Otoeb8YcWDDNW4ddFcUJOPGX34bZs
 Kw7+PKfNbloRR01Q6w55WXDbTy2Z7xX2NRHQqaHnQSCGncF4iGIEXaj3Ib03fXp+Jc6lQrgVhNU
 kZuiH0d/wNxqz7NVenpoffeiHmsuvpd1LcdMdHpWrsInnf23l4tGtSxVUOzTG8azNKwJ3ljtbO5
 oc5fIDPbQAsgtJA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The "bgpio" prefix is a historical left-over. We no longer use it in any
user-facing symbol. Let's drop it from the module's internals as well
and replace it with "gpio_mmio_".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 299 ++++++++++++++++++++++++-----------------------
 1 file changed, 150 insertions(+), 149 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 95ebbdf04343b81b1b8d836542c324bffb9c40e8..b3a26a06260bbb6f1a5b1ecace1e58610d3cc99c 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -62,69 +62,69 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 
 #include "gpiolib.h"
 
-static void bgpio_write8(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write8(void __iomem *reg, unsigned long data)
 {
 	writeb(data, reg);
 }
 
-static unsigned long bgpio_read8(void __iomem *reg)
+static unsigned long gpio_mmio_read8(void __iomem *reg)
 {
 	return readb(reg);
 }
 
-static void bgpio_write16(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write16(void __iomem *reg, unsigned long data)
 {
 	writew(data, reg);
 }
 
-static unsigned long bgpio_read16(void __iomem *reg)
+static unsigned long gpio_mmio_read16(void __iomem *reg)
 {
 	return readw(reg);
 }
 
-static void bgpio_write32(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write32(void __iomem *reg, unsigned long data)
 {
 	writel(data, reg);
 }
 
-static unsigned long bgpio_read32(void __iomem *reg)
+static unsigned long gpio_mmio_read32(void __iomem *reg)
 {
 	return readl(reg);
 }
 
 #if BITS_PER_LONG >= 64
-static void bgpio_write64(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write64(void __iomem *reg, unsigned long data)
 {
 	writeq(data, reg);
 }
 
-static unsigned long bgpio_read64(void __iomem *reg)
+static unsigned long gpio_mmio_read64(void __iomem *reg)
 {
 	return readq(reg);
 }
 #endif /* BITS_PER_LONG >= 64 */
 
-static void bgpio_write16be(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write16be(void __iomem *reg, unsigned long data)
 {
 	iowrite16be(data, reg);
 }
 
-static unsigned long bgpio_read16be(void __iomem *reg)
+static unsigned long gpio_mmio_read16be(void __iomem *reg)
 {
 	return ioread16be(reg);
 }
 
-static void bgpio_write32be(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write32be(void __iomem *reg, unsigned long data)
 {
 	iowrite32be(data, reg);
 }
 
-static unsigned long bgpio_read32be(void __iomem *reg)
+static unsigned long gpio_mmio_read32be(void __iomem *reg)
 {
 	return ioread32be(reg);
 }
 
-static unsigned long bgpio_line2mask(struct gpio_chip *gc, unsigned int line)
+static unsigned long gpio_mmio_line2mask(struct gpio_chip *gc, unsigned int line)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
@@ -133,10 +133,10 @@ static unsigned long bgpio_line2mask(struct gpio_chip *gc, unsigned int line)
 	return BIT(line);
 }
 
-static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
+static int gpio_mmio_get_set(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
-	unsigned long pinmask = bgpio_line2mask(gc, gpio);
+	unsigned long pinmask = gpio_mmio_line2mask(gc, gpio);
 	bool dir = !!(chip->sdir & pinmask);
 
 	if (dir)
@@ -149,8 +149,8 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
  * This assumes that the bits in the GPIO register are in native endianness.
  * We only assign the function pointer if we have that.
  */
-static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-				  unsigned long *bits)
+static int gpio_mmio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				      unsigned long *bits)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long get_mask = 0, set_mask = 0;
@@ -169,18 +169,18 @@ static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
+static int gpio_mmio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
-	return !!(chip->read_reg(chip->reg_dat) & bgpio_line2mask(gc, gpio));
+	return !!(chip->read_reg(chip->reg_dat) & gpio_mmio_line2mask(gc, gpio));
 }
 
 /*
  * This only works if the bits in the GPIO register are in native endianness.
  */
-static int bgpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
-			      unsigned long *bits)
+static int gpio_mmio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
+				  unsigned long *bits)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
@@ -193,8 +193,8 @@ static int bgpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 /*
  * With big endian mirrored bit order it becomes more tedious.
  */
-static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
-				 unsigned long *bits)
+static int gpio_mmio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
+				     unsigned long *bits)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long readmask = 0;
@@ -206,7 +206,7 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 
 	/* Create a mirrored mask */
 	for_each_set_bit(bit, mask, gc->ngpio)
-		readmask |= bgpio_line2mask(gc, bit);
+		readmask |= gpio_mmio_line2mask(gc, bit);
 
 	/* Read the register */
 	val = chip->read_reg(chip->reg_dat) & readmask;
@@ -216,20 +216,20 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 	 * in bit 0 ... line 31 in bit 31 for a 32bit register.
 	 */
 	for_each_set_bit(bit, &val, gc->ngpio)
-		*bits |= bgpio_line2mask(gc, bit);
+		*bits |= gpio_mmio_line2mask(gc, bit);
 
 	return 0;
 }
 
-static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
+static int gpio_mmio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	return 0;
 }
 
-static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int gpio_mmio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
-	unsigned long mask = bgpio_line2mask(gc, gpio);
+	unsigned long mask = gpio_mmio_line2mask(gc, gpio);
 
 	guard(raw_spinlock)(&chip->lock);
 
@@ -243,11 +243,11 @@ static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
-				int val)
+static int gpio_mmio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
+				    int val)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
-	unsigned long mask = bgpio_line2mask(gc, gpio);
+	unsigned long mask = gpio_mmio_line2mask(gc, gpio);
 
 	if (val)
 		chip->write_reg(chip->reg_set, mask);
@@ -257,10 +257,10 @@ static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 	return 0;
 }
 
-static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int gpio_mmio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
-	unsigned long mask = bgpio_line2mask(gc, gpio);
+	unsigned long mask = gpio_mmio_line2mask(gc, gpio);
 
 	guard(raw_spinlock)(&chip->lock);
 
@@ -274,10 +274,11 @@ static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static void bgpio_multiple_get_masks(struct gpio_chip *gc,
-				     unsigned long *mask, unsigned long *bits,
-				     unsigned long *set_mask,
-				     unsigned long *clear_mask)
+static void gpio_mmio_multiple_get_masks(struct gpio_chip *gc,
+					 unsigned long *mask,
+					 unsigned long *bits,
+					 unsigned long *set_mask,
+					 unsigned long *clear_mask)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	int i;
@@ -287,23 +288,23 @@ static void bgpio_multiple_get_masks(struct gpio_chip *gc,
 
 	for_each_set_bit(i, mask, chip->bits) {
 		if (test_bit(i, bits))
-			*set_mask |= bgpio_line2mask(gc, i);
+			*set_mask |= gpio_mmio_line2mask(gc, i);
 		else
-			*clear_mask |= bgpio_line2mask(gc, i);
+			*clear_mask |= gpio_mmio_line2mask(gc, i);
 	}
 }
 
-static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
-					  unsigned long *mask,
-					  unsigned long *bits,
-					  void __iomem *reg)
+static void gpio_mmio_set_multiple_single_reg(struct gpio_chip *gc,
+					      unsigned long *mask,
+					      unsigned long *bits,
+					      void __iomem *reg)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long set_mask, clear_mask;
 
 	guard(raw_spinlock)(&chip->lock);
 
-	bgpio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
+	gpio_mmio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
 
 	chip->sdata |= set_mask;
 	chip->sdata &= ~clear_mask;
@@ -311,34 +312,34 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
 	chip->write_reg(reg, chip->sdata);
 }
 
-static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-			       unsigned long *bits)
-{
-	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
-
-	bgpio_set_multiple_single_reg(gc, mask, bits, chip->reg_dat);
-
-	return 0;
-}
-
-static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
+static int gpio_mmio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 				  unsigned long *bits)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
-	bgpio_set_multiple_single_reg(gc, mask, bits, chip->reg_set);
+	gpio_mmio_set_multiple_single_reg(gc, mask, bits, chip->reg_dat);
 
 	return 0;
 }
 
-static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
-					 unsigned long *mask,
-					 unsigned long *bits)
+static int gpio_mmio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
+				      unsigned long *bits)
+{
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+
+	gpio_mmio_set_multiple_single_reg(gc, mask, bits, chip->reg_set);
+
+	return 0;
+}
+
+static int gpio_mmio_set_multiple_with_clear(struct gpio_chip *gc,
+					     unsigned long *mask,
+					     unsigned long *bits)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long set_mask, clear_mask;
 
-	bgpio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
+	gpio_mmio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
 
 	if (set_mask)
 		chip->write_reg(chip->reg_set, set_mask);
@@ -348,7 +349,8 @@ static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
 	return 0;
 }
 
-static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
+static int gpio_mmio_dir_return(struct gpio_chip *gc, unsigned int gpio,
+				bool dir_out)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
@@ -361,36 +363,36 @@ static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_ou
 		return pinctrl_gpio_direction_input(gc, gpio);
 }
 
-static int bgpio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
+static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
 {
 	return -EINVAL;
 }
 
-static int bgpio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
+static int gpio_mmio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	return bgpio_dir_return(gc, gpio, false);
+	return gpio_mmio_dir_return(gc, gpio, false);
 }
 
-static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
-				int val)
+static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
+				 int val)
 {
 	return -EINVAL;
 }
 
-static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
-				int val)
+static int gpio_mmio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
+				    int val)
 {
 	gc->set(gc, gpio, val);
 
-	return bgpio_dir_return(gc, gpio, true);
+	return gpio_mmio_dir_return(gc, gpio, true);
 }
 
-static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
+static int gpio_mmio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
 	scoped_guard(raw_spinlock, &chip->lock) {
-		chip->sdir &= ~bgpio_line2mask(gc, gpio);
+		chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
 
 		if (chip->reg_dir_in)
 			chip->write_reg(chip->reg_dir_in, ~chip->sdir);
@@ -398,40 +400,40 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 			chip->write_reg(chip->reg_dir_out, chip->sdir);
 	}
 
-	return bgpio_dir_return(gc, gpio, false);
+	return gpio_mmio_dir_return(gc, gpio, false);
 }
 
-static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
+static int gpio_mmio_get_dir(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
 	/* Return 0 if output, 1 if input */
 	if (chip->dir_unreadable) {
-		if (chip->sdir & bgpio_line2mask(gc, gpio))
+		if (chip->sdir & gpio_mmio_line2mask(gc, gpio))
 			return GPIO_LINE_DIRECTION_OUT;
 		return GPIO_LINE_DIRECTION_IN;
 	}
 
 	if (chip->reg_dir_out) {
-		if (chip->read_reg(chip->reg_dir_out) & bgpio_line2mask(gc, gpio))
+		if (chip->read_reg(chip->reg_dir_out) & gpio_mmio_line2mask(gc, gpio))
 			return GPIO_LINE_DIRECTION_OUT;
 		return GPIO_LINE_DIRECTION_IN;
 	}
 
 	if (chip->reg_dir_in)
-		if (!(chip->read_reg(chip->reg_dir_in) & bgpio_line2mask(gc, gpio)))
+		if (!(chip->read_reg(chip->reg_dir_in) & gpio_mmio_line2mask(gc, gpio)))
 			return GPIO_LINE_DIRECTION_OUT;
 
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static void bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
+static void gpio_mmio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
 	guard(raw_spinlock)(&chip->lock);
 
-	chip->sdir |= bgpio_line2mask(gc, gpio);
+	chip->sdir |= gpio_mmio_line2mask(gc, gpio);
 
 	if (chip->reg_dir_in)
 		chip->write_reg(chip->reg_dir_in, ~chip->sdir);
@@ -439,47 +441,47 @@ static void bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 		chip->write_reg(chip->reg_dir_out, chip->sdir);
 }
 
-static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
-				   int val)
+static int gpio_mmio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
+				       int val)
 {
-	bgpio_dir_out(gc, gpio, val);
+	gpio_mmio_dir_out(gc, gpio, val);
 	gc->set(gc, gpio, val);
-	return bgpio_dir_return(gc, gpio, true);
+	return gpio_mmio_dir_return(gc, gpio, true);
 }
 
-static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
-				   int val)
+static int gpio_mmio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
+				       int val)
 {
 	gc->set(gc, gpio, val);
-	bgpio_dir_out(gc, gpio, val);
-	return bgpio_dir_return(gc, gpio, true);
+	gpio_mmio_dir_out(gc, gpio, val);
+	return gpio_mmio_dir_return(gc, gpio, true);
 }
 
-static int bgpio_setup_accessors(struct device *dev,
-				 struct gpio_generic_chip *chip,
-				 bool byte_be)
+static int gpio_mmio_setup_accessors(struct device *dev,
+				     struct gpio_generic_chip *chip,
+				     bool byte_be)
 {
 	switch (chip->bits) {
 	case 8:
-		chip->read_reg	= bgpio_read8;
-		chip->write_reg	= bgpio_write8;
+		chip->read_reg	= gpio_mmio_read8;
+		chip->write_reg	= gpio_mmio_write8;
 		break;
 	case 16:
 		if (byte_be) {
-			chip->read_reg	= bgpio_read16be;
-			chip->write_reg	= bgpio_write16be;
+			chip->read_reg	= gpio_mmio_read16be;
+			chip->write_reg	= gpio_mmio_write16be;
 		} else {
-			chip->read_reg	= bgpio_read16;
-			chip->write_reg	= bgpio_write16;
+			chip->read_reg	= gpio_mmio_read16;
+			chip->write_reg	= gpio_mmio_write16;
 		}
 		break;
 	case 32:
 		if (byte_be) {
-			chip->read_reg	= bgpio_read32be;
-			chip->write_reg	= bgpio_write32be;
+			chip->read_reg	= gpio_mmio_read32be;
+			chip->write_reg	= gpio_mmio_write32be;
 		} else {
-			chip->read_reg	= bgpio_read32;
-			chip->write_reg	= bgpio_write32;
+			chip->read_reg	= gpio_mmio_read32;
+			chip->write_reg	= gpio_mmio_write32;
 		}
 		break;
 #if BITS_PER_LONG >= 64
@@ -489,8 +491,8 @@ static int bgpio_setup_accessors(struct device *dev,
 				"64 bit big endian byte order unsupported\n");
 			return -EINVAL;
 		} else {
-			chip->read_reg	= bgpio_read64;
-			chip->write_reg	= bgpio_write64;
+			chip->read_reg	= gpio_mmio_read64;
+			chip->write_reg	= gpio_mmio_write64;
 		}
 		break;
 #endif /* BITS_PER_LONG >= 64 */
@@ -524,8 +526,8 @@ static int bgpio_setup_accessors(struct device *dev,
  *	- an input direction register (named "dirin") where a 1 bit indicates
  *	the GPIO is an input.
  */
-static int bgpio_setup_io(struct gpio_generic_chip *chip,
-			  const struct gpio_generic_chip_config *cfg)
+static int gpio_mmio_setup_io(struct gpio_generic_chip *chip,
+			      const struct gpio_generic_chip_config *cfg)
 {
 	struct gpio_chip *gc = &chip->gc;
 
@@ -536,25 +538,25 @@ static int bgpio_setup_io(struct gpio_generic_chip *chip,
 	if (cfg->set && cfg->clr) {
 		chip->reg_set = cfg->set;
 		chip->reg_clr = cfg->clr;
-		gc->set = bgpio_set_with_clear;
-		gc->set_multiple = bgpio_set_multiple_with_clear;
+		gc->set = gpio_mmio_set_with_clear;
+		gc->set_multiple = gpio_mmio_set_multiple_with_clear;
 	} else if (cfg->set && !cfg->clr) {
 		chip->reg_set = cfg->set;
-		gc->set = bgpio_set_set;
-		gc->set_multiple = bgpio_set_multiple_set;
+		gc->set = gpio_mmio_set_set;
+		gc->set_multiple = gpio_mmio_set_multiple_set;
 	} else if (cfg->flags & GPIO_GENERIC_NO_OUTPUT) {
-		gc->set = bgpio_set_none;
+		gc->set = gpio_mmio_set_none;
 		gc->set_multiple = NULL;
 	} else {
-		gc->set = bgpio_set;
-		gc->set_multiple = bgpio_set_multiple;
+		gc->set = gpio_mmio_set;
+		gc->set_multiple = gpio_mmio_set_multiple;
 	}
 
 	if (!(cfg->flags & GPIO_GENERIC_UNREADABLE_REG_SET) &&
 	    (cfg->flags & GPIO_GENERIC_READ_OUTPUT_REG_SET)) {
-		gc->get = bgpio_get_set;
+		gc->get = gpio_mmio_get_set;
 		if (!chip->be_bits)
-			gc->get_multiple = bgpio_get_set_multiple;
+			gc->get_multiple = gpio_mmio_get_set_multiple;
 		/*
 		 * We deliberately avoid assigning the ->get_multiple() call
 		 * for big endian mirrored registers which are ALSO reflecting
@@ -563,18 +565,18 @@ static int bgpio_setup_io(struct gpio_generic_chip *chip,
 		 * reading each line individually in that fringe case.
 		 */
 	} else {
-		gc->get = bgpio_get;
+		gc->get = gpio_mmio_get;
 		if (chip->be_bits)
-			gc->get_multiple = bgpio_get_multiple_be;
+			gc->get_multiple = gpio_mmio_get_multiple_be;
 		else
-			gc->get_multiple = bgpio_get_multiple;
+			gc->get_multiple = gpio_mmio_get_multiple;
 	}
 
 	return 0;
 }
 
-static int bgpio_setup_direction(struct gpio_generic_chip *chip,
-				 const struct gpio_generic_chip_config *cfg)
+static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
+				     const struct gpio_generic_chip_config *cfg)
 {
 	struct gpio_chip *gc = &chip->gc;
 
@@ -582,27 +584,27 @@ static int bgpio_setup_direction(struct gpio_generic_chip *chip,
 		chip->reg_dir_out = cfg->dirout;
 		chip->reg_dir_in = cfg->dirin;
 		if (cfg->flags & GPIO_GENERIC_NO_SET_ON_INPUT)
-			gc->direction_output = bgpio_dir_out_dir_first;
+			gc->direction_output = gpio_mmio_dir_out_dir_first;
 		else
-			gc->direction_output = bgpio_dir_out_val_first;
-		gc->direction_input = bgpio_dir_in;
-		gc->get_direction = bgpio_get_dir;
+			gc->direction_output = gpio_mmio_dir_out_val_first;
+		gc->direction_input = gpio_mmio_dir_in;
+		gc->get_direction = gpio_mmio_get_dir;
 	} else {
 		if (cfg->flags & GPIO_GENERIC_NO_OUTPUT)
-			gc->direction_output = bgpio_dir_out_err;
+			gc->direction_output = gpio_mmio_dir_out_err;
 		else
-			gc->direction_output = bgpio_simple_dir_out;
+			gc->direction_output = gpio_mmio_simple_dir_out;
 
 		if (cfg->flags & GPIO_GENERIC_NO_INPUT)
-			gc->direction_input = bgpio_dir_in_err;
+			gc->direction_input = gpio_mmio_dir_in_err;
 		else
-			gc->direction_input = bgpio_simple_dir_in;
+			gc->direction_input = gpio_mmio_simple_dir_in;
 	}
 
 	return 0;
 }
 
-static int bgpio_request(struct gpio_chip *gc, unsigned int gpio_pin)
+static int gpio_mmio_request(struct gpio_chip *gc, unsigned int gpio_pin)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
@@ -641,23 +643,23 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	gc->parent = dev;
 	gc->label = dev_name(dev);
 	gc->base = -1;
-	gc->request = bgpio_request;
+	gc->request = gpio_mmio_request;
 	chip->be_bits = !!(flags & GPIO_GENERIC_BIG_ENDIAN);
 
 	ret = gpiochip_get_ngpios(gc, dev);
 	if (ret)
 		gc->ngpio = chip->bits;
 
-	ret = bgpio_setup_io(chip, cfg);
+	ret = gpio_mmio_setup_io(chip, cfg);
 	if (ret)
 		return ret;
 
-	ret = bgpio_setup_accessors(dev, chip,
+	ret = gpio_mmio_setup_accessors(dev, chip,
 				    flags & GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER);
 	if (ret)
 		return ret;
 
-	ret = bgpio_setup_direction(chip, cfg);
+	ret = gpio_mmio_setup_direction(chip, cfg);
 	if (ret)
 		return ret;
 
@@ -668,7 +670,7 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	}
 
 	chip->sdata = chip->read_reg(chip->reg_dat);
-	if (gc->set == bgpio_set_set &&
+	if (gc->set == gpio_mmio_set_set &&
 			!(flags & GPIO_GENERIC_UNREADABLE_REG_SET))
 		chip->sdata = chip->read_reg(chip->reg_set);
 
@@ -700,9 +702,8 @@ EXPORT_SYMBOL_GPL(gpio_generic_chip_init);
 
 #if IS_ENABLED(CONFIG_GPIO_GENERIC_PLATFORM)
 
-static void __iomem *bgpio_map(struct platform_device *pdev,
-			       const char *name,
-			       resource_size_t sane_sz)
+static void __iomem *gpio_mmio_map(struct platform_device *pdev,
+				   const char *name, resource_size_t sane_sz)
 {
 	struct resource *r;
 	resource_size_t sz;
@@ -718,16 +719,16 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 	return devm_ioremap_resource(&pdev->dev, r);
 }
 
-static const struct of_device_id bgpio_of_match[] = {
+static const struct of_device_id gpio_mmio_of_match[] = {
 	{ .compatible = "brcm,bcm6345-gpio" },
 	{ .compatible = "wd,mbl-gpio" },
 	{ .compatible = "ni,169445-nand-gpio" },
 	{ .compatible = "intel,ixp4xx-expansion-bus-mmio-gpio" },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, bgpio_of_match);
+MODULE_DEVICE_TABLE(of, gpio_mmio_of_match);
 
-static int bgpio_pdev_probe(struct platform_device *pdev)
+static int gpio_mmio_pdev_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config;
 	struct gpio_generic_chip *gen_gc;
@@ -750,23 +751,23 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 
 	sz = resource_size(r);
 
-	dat = bgpio_map(pdev, "dat", sz);
+	dat = gpio_mmio_map(pdev, "dat", sz);
 	if (IS_ERR(dat))
 		return PTR_ERR(dat);
 
-	set = bgpio_map(pdev, "set", sz);
+	set = gpio_mmio_map(pdev, "set", sz);
 	if (IS_ERR(set))
 		return PTR_ERR(set);
 
-	clr = bgpio_map(pdev, "clr", sz);
+	clr = gpio_mmio_map(pdev, "clr", sz);
 	if (IS_ERR(clr))
 		return PTR_ERR(clr);
 
-	dirout = bgpio_map(pdev, "dirout", sz);
+	dirout = gpio_mmio_map(pdev, "dirout", sz);
 	if (IS_ERR(dirout))
 		return PTR_ERR(dirout);
 
-	dirin = bgpio_map(pdev, "dirin", sz);
+	dirin = gpio_mmio_map(pdev, "dirin", sz);
 	if (IS_ERR(dirin))
 		return PTR_ERR(dirin);
 
@@ -812,25 +813,25 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
-static const struct platform_device_id bgpio_id_table[] = {
+static const struct platform_device_id gpio_mmio_id_table[] = {
 	{
 		.name		= "basic-mmio-gpio",
 		.driver_data	= 0,
 	},
 	{ }
 };
-MODULE_DEVICE_TABLE(platform, bgpio_id_table);
+MODULE_DEVICE_TABLE(platform, gpio_mmio_id_table);
 
-static struct platform_driver bgpio_driver = {
+static struct platform_driver gpio_mmio_driver = {
 	.driver = {
 		.name = "basic-mmio-gpio",
-		.of_match_table = bgpio_of_match,
+		.of_match_table = gpio_mmio_of_match,
 	},
-	.id_table = bgpio_id_table,
-	.probe = bgpio_pdev_probe,
+	.id_table = gpio_mmio_id_table,
+	.probe = gpio_mmio_pdev_probe,
 };
 
-module_platform_driver(bgpio_driver);
+module_platform_driver(gpio_mmio_driver);
 
 #endif /* CONFIG_GPIO_GENERIC_PLATFORM */
 

-- 
2.48.1


