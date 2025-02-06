Return-Path: <linux-gpio+bounces-15472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D4CA2AF44
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5AA3188BA4C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 17:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054E919AA5D;
	Thu,  6 Feb 2025 17:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfL+lCtM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF63518CBFC;
	Thu,  6 Feb 2025 17:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863971; cv=none; b=cLngprcwSxno0wrWIoKdG4FxLpYppF3IJbRYuTU5IbUtSwP2n4C4T94j8tjDat3hBQd5KfrTpz2NT8uktpaUSzbr+NSzTd4742JbqSd680xkCWeoJyBR5mWmzSuZ12gNN9V70gP0dxX4C5R7Apjdu6OeyukM0ZVgZja5L5txNXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863971; c=relaxed/simple;
	bh=7WR8JnS3yeYmxN508U/o38iQvc/UDrjQqXztDk+gy9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMupksHNi34MYTS0mACISns22rA2unaHcXoGi9IEKCUXr1vODeIlxU+7yWHhcxDZytLE+kyZC9YL/G+Dn/gRC7ZaYkFdORH4l9+nVWuwn/FcofZvXNP5VM5gu1TBriuiMinm2Ch1aLmrmLOwr5mKNTtWujdkV/efkBkV+5lZDLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfL+lCtM; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso4460721a12.0;
        Thu, 06 Feb 2025 09:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738863968; x=1739468768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KODL0yhoUPDVNtnpy6FJ+cvDdJ+oA25cSk5g9bzvODQ=;
        b=KfL+lCtMPYgiNtbrOaybr3p787wJU92wPtRmgi9GP+RJ/dBk807o/zznRbCREyeVWq
         gM/4nxa3qHgHchuO0yoA9myfNkQoLfr6lcmwosYAZGrbYXBfCVY4O2noM8XyJB0lS4UW
         FX51ViQ5cSlK3Bc4l+w50DWaiB18fBtGdmrLjqBIW3zxOXvBeW46+jrFePol4DeXM7q3
         i58XaEaMiY8VTzZvGyfVaK2c8PuHpujQw2eU1GsLzgLGMXpCFKfFz72bqrq45xTd8b6D
         Jr70nxn+ca0gRoBGeHEoJDMK676VW4kbEks54mPkdLLcRlMrrUCfPoTqcIT8LsN8RJqw
         Vu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738863968; x=1739468768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KODL0yhoUPDVNtnpy6FJ+cvDdJ+oA25cSk5g9bzvODQ=;
        b=YvVztpf02rHv3SU8m0BXUSeIDe2Qe54xtt/tngKTZVmLXmFOS6TyyGokuArHG7R3wP
         9ENA/wp9i6g68dgv8spyEUyOpC/L2DqgTIasU+f8EWQ2/T9Udx/i405Tb50io/ZIvk4x
         ZcudXqjwcVOFy0zNSKHybwOmAOlmgLfNgEtUKJSH8VTjz37kc1zb0H3B2E//NXZLAXCw
         LhdiSYUJvstosZOi/G85Y9JFtCWvlGK8vuYp1h/mlSlLVv7n6E7/gnueDN5lOx/PM10g
         7U1WsxqEldVborlmquim0uEM5qruRswlber2Ls+Qyg5edptd2YcU7CuvJXSYFZ7UU+Ns
         Dd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrcbuF49iB/D0hMlqAtQxeX8gVpRYUg56R3zDZvyeEJYp9DZpVc3hRrKBTEfxtVax28DkqaatvisMo0p0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWUS+d0I0qAIAS8AxWIXSrJ6KJJ0/JOKsZwQIkDgZfp5a+eNX6
	veDpLdW6XuJPb4ulW7CGcpn2nlfUU6IPIFI4Z1RmkjhwBKIKaCSQ
X-Gm-Gg: ASbGncsh+oOTZ04xuFpoFLSLh5avMxa1aYtSq7dkex+GyorcwCptIhDv1oqkP3K9oao
	yCbxLnxpkPhOyd2aULB1lRJuWwgfSwQMET75H0cBOm2+am9Eu7dfFChnJaQFtDU+TG2+1ftSRcM
	+vYYG+8i/x2X9pWf/yx5P5+/MdyURrCQZo2t12fGDjkFyAywYf2cT6LDQR+qwTmok7Nc8cTlzAq
	UkLn7ELmFxlFoJSJ0/tdk7S1lOGy7H6YOf1Xz2pVILXQiYXga4EwzVDTc+QStAwu70J1WV0lpa2
	5QGfvrdI4jZI8hDq+8sDcMT90+B8DkTfAsmwJT1wjAuHIUxOMW5aLhOn
X-Google-Smtp-Source: AGHT+IHC2NvW3xsOpdvHPdtwBgbragC0+WC6cpudZ3QpFHpFEhQzZH6rXm/33wXbZ6ujmBOA/gMNxA==
X-Received: by 2002:a17:907:3f15:b0:ab7:b82:899 with SMTP id a640c23a62f3a-ab76e8e8b35mr366530366b.22.1738863967581;
        Thu, 06 Feb 2025 09:46:07 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772fdb84esm128911066b.80.2025.02.06.09.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:46:07 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 06 Feb 2025 18:46:01 +0100
Subject: [PATCH v2 2/3] gpio: bcm-kona: Make sure GPIO bits are unlocked
 when requesting IRQ
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-kona-gpio-fixes-v2-2-409135eab780@gmail.com>
References: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
In-Reply-To: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738863964; l=5750;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7WR8JnS3yeYmxN508U/o38iQvc/UDrjQqXztDk+gy9U=;
 b=+KlU5GvBkFn9goQ4EdnwydwvGXgMKcpmnUBJNSXmMVRJFinzAsh0AQVAAj4uZjUwCQ8GGIC8/
 Cjf/E3q9dbwCXVO9nQCWQvwKIdeUTohVUD6YT/8aJTljylxnEo7dB6X
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The settings for all GPIOs are locked by default in bcm_kona_gpio_reset.
The settings for a GPIO are unlocked when requesting it as a GPIO, but
not when requesting it as an interrupt, causing the IRQ settings to not
get applied.

Fix this by making sure to unlock the right bits when an IRQ is requested.
To avoid a situation where an IRQ being released causes a lock despite
the same GPIO being used by a GPIO request or vice versa, add an unlock
counter and only lock if it reaches 0.

Fixes: 757651e3d60e ("gpio: bcm281xx: Add GPIO driver")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Made the unlock count code cleaner by using increment/decrement
  operators (-- / ++)
- Added extra comment to relres function to match the one in reqres
---
 drivers/gpio/gpio-bcm-kona.c | 67 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 77bd4ec93a231472d7bc40db9d5db12d20bb1611..17f3f210fee9dbb5da3b26e1f86bf8f68089b1cd 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -69,6 +69,22 @@ struct bcm_kona_gpio {
 struct bcm_kona_gpio_bank {
 	int id;
 	int irq;
+	/*
+	 * Used to keep track of lock/unlock operations for each GPIO in the
+	 * bank.
+	 *
+	 * All GPIOs are locked by default (see bcm_kona_gpio_reset), and the
+	 * unlock count for all GPIOs is 0 by default. Each unlock increments
+	 * the counter, and each lock decrements the counter.
+	 *
+	 * The lock function only locks the GPIO once its unlock counter is
+	 * down to 0. This is necessary because the GPIO is unlocked in two
+	 * places in this driver: once for requested GPIOs, and once for
+	 * requested IRQs. Since it is possible for a GPIO to be requested
+	 * as both a GPIO and an IRQ, we need to ensure that we don't lock it
+	 * too early.
+	 */
+	u8 gpio_unlock_count[GPIO_PER_BANK];
 	/* Used in the interrupt handler */
 	struct bcm_kona_gpio *kona_gpio;
 };
@@ -87,14 +103,23 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
 	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
+	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	if (bank->gpio_unlock_count[bit] == 0) {
+		dev_err(kona_gpio->gpio_chip.parent,
+			"Unbalanced locks for GPIO %u\n", gpio);
+		return;
+	}
 
-	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
-	val |= BIT(bit);
-	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
+	if (--bank->gpio_unlock_count[bit] == 0) {
+		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
+		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
+		val |= BIT(bit);
+		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
+
+		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
+	}
 }
 
 static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
@@ -104,14 +129,19 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
 	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
+	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	if (bank->gpio_unlock_count[bit] == 0) {
+		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
-	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
-	val &= ~BIT(bit);
-	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
+		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
+		val &= ~BIT(bit);
+		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
+		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
+	}
+
+	++bank->gpio_unlock_count[bit];
 }
 
 static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
@@ -362,6 +392,7 @@ static void bcm_kona_gpio_irq_mask(struct irq_data *d)
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
+
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	val = readl(reg_base + GPIO_INT_MASK(bank_id));
@@ -384,6 +415,7 @@ static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
+
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	val = readl(reg_base + GPIO_INT_MSKCLR(bank_id));
@@ -479,15 +511,26 @@ static void bcm_kona_gpio_irq_handler(struct irq_desc *desc)
 static int bcm_kona_gpio_irq_reqres(struct irq_data *d)
 {
 	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
+	unsigned int gpio = d->hwirq;
+
+	/*
+	 * We need to unlock the GPIO before any other operations are performed
+	 * on the relevant GPIO configuration registers
+	 */
+	bcm_kona_gpio_unlock_gpio(kona_gpio, gpio);
 
-	return gpiochip_reqres_irq(&kona_gpio->gpio_chip, d->hwirq);
+	return gpiochip_reqres_irq(&kona_gpio->gpio_chip, gpio);
 }
 
 static void bcm_kona_gpio_irq_relres(struct irq_data *d)
 {
 	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
+	unsigned int gpio = d->hwirq;
+
+	/* Once we no longer use it, lock the GPIO again */
+	bcm_kona_gpio_lock_gpio(kona_gpio, gpio);
 
-	gpiochip_relres_irq(&kona_gpio->gpio_chip, d->hwirq);
+	gpiochip_relres_irq(&kona_gpio->gpio_chip, gpio);
 }
 
 static struct irq_chip bcm_gpio_irq_chip = {

-- 
2.48.1


