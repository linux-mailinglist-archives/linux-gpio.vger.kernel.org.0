Return-Path: <linux-gpio+bounces-15103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC7A23291
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 18:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B58B1661DA
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 17:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DED1DDD1;
	Thu, 30 Jan 2025 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vlpr4akX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12FF1EEA5C;
	Thu, 30 Jan 2025 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257052; cv=none; b=fVPZpMZWk6IcIxdqmVw+8qW0gSt7L2G/3ZsgM7pM6iEoQHnV0kz3fy3XaxEKVUYE5olMJIOUNFzqZtK/9O90DOcibcyr0CDunPmGKXM2DprVOS/C+PISM66k94sZTjk1CBcPcOevZaD91HDHqMVngxaXdbBJcIs+vxxYd5PXxu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257052; c=relaxed/simple;
	bh=u/+/6oXLd6+8p4ISUc4dZfXLRZwgDwDp5TQolK7dfdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uxZgGYcXpArlpC4trYiwh7wpXUIIZJAgkEs4Y7YqlwlAI50zdFpqR23NosQMXKhSXh4nbeA1lu0wiSooF7tXE6ypjeQ7njUn82iASnlyOMCfaznbnfK6UxHLQY7fjZoo7C6IVxuk0mCyYXgPhG/ptm4kL8u/a41ZHVKgH+6pNWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vlpr4akX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dc7425ec5fso1683715a12.0;
        Thu, 30 Jan 2025 09:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738257049; x=1738861849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJILXEd7Bk4n9XRVFJJqsZHPV65V50vrP2P74djXhDI=;
        b=Vlpr4akX9cJpLOxDQZCSq0BooDZZoH10Qg3cvgwJdxsFus4kckbLgU2+MPb/MFfpwu
         myp9QVVHB6OVarJ4X12y5UvdQk4lBQXFZ9Dxc6Rs+LuXLHCWOQlpHj+bgzxG7TVpLV23
         OvnzGcAjl8bDdIGnr1rjJOYnSWODgr1rfPTh6FdJkE3u9Neaq7n68ojTQqcxm4TUcQND
         keukr68EsidBRzXXoBiaLaYnMWpxFr5kW8Kx8yWvZQeUfS7llKC7+nNUweW/QvSDyI2z
         6LIbP+Q5QAxAy7XQyBJ7rpEpp4vKqTMHseprTMKCdL6v7NUoxMrlRP8NBlpG2pLuzsmZ
         6Izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257049; x=1738861849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJILXEd7Bk4n9XRVFJJqsZHPV65V50vrP2P74djXhDI=;
        b=bRkYbR3xVxXmKAydgyLwrkRGwu4XgW2k0AhjD+qh0HlNNbbkp4EdzFADdb0JIegcD+
         YdaRveSRZfHWmvPAmke7JNffJqb4VG0RxRWWSm8ZycYqNfKMmhGTgY4G8MWZKQUTsp8O
         VQOwrZVAvh2MgaEY/68zp4LHiwRDylcqE9CTMQCf/xZKqih6i0u4FTYrIUscsj6ETcDK
         hIEqluvcrzut6UnFCpN0n1LWXJtCA3hkfu/I1xKWu+Ub0lt6utJ/mpUGP/24zNesM+RR
         /alpFgcxHiRhxlsIpYCHN2upUc+S4RaWGIDipt2tQQHvoAj8Kr3LcQThDRnCb7Oo8jCD
         V6+g==
X-Forwarded-Encrypted: i=1; AJvYcCVWQ/WQB0SCIoG4h1dFjWQxX+harPzY0esB3hNTUsvuxq5XF2z0CCTQ3KTEf7ZQScUBtY9NyNd43GPkUzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAGB3kxdjV/LI6VupHiMOY0YggV1GkQW8hvGEK+Pmktw8z1Zot
	MrvuNw4YJJTpMLD8AmUoR9XXIMB+lEMcFTZxylxjBXCbW2xyEWY4
X-Gm-Gg: ASbGnctPC9n6kZDUiDKxTNsErXNxlOyQu6qjXQviGuPCvO22rTf+SI4nmLzN/6frzA7
	DN1It5NvAIFdjLFt0JJt+a+uCrjygsk5GDNKujR6U6sXhZhXI/srfenBEFXwv7K40jajejnPraE
	RQUUx/KT+ga0/BhtxU90xTz5T7YudMCw1HO5vw4jJ1aX9mF8NA+L3vGZyz0EAr1GndevTlZOkZu
	Cq+e9AnbLJeP+XSH1OTE8mc87GpDwwgeK+Ryk5uZmQ5R3h2zwaF+ETiQ6lWQXYMdtj5Wo42PuEO
	UNbqzsKAa5Vo2XWavQ4mUf1Gsy6XuuJjQHpAKSpPsRP1xzAdTJzthzAznj46GQ==
X-Google-Smtp-Source: AGHT+IFAnpRLNsyVf8mXzqZtef5s42rzpM6qY7SdaKSW6CZL/ZCx7tiVfCthAs0UpSAl3lJ9Uf7yUQ==
X-Received: by 2002:a05:6402:51cf:b0:5d9:f042:dab with SMTP id 4fb4d7f45d1cf-5dc5efc4d4cmr8906902a12.18.1738257048885;
        Thu, 30 Jan 2025 09:10:48 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9da7sm1349021a12.79.2025.01.30.09.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:10:48 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 30 Jan 2025 18:10:38 +0100
Subject: [PATCH 2/3] gpio: bcm-kona: Make sure GPIO bits are unlocked when
 requesting IRQ
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
In-Reply-To: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>, 
 Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>, 
 Christian Daudt <csd@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738257044; l=5448;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=u/+/6oXLd6+8p4ISUc4dZfXLRZwgDwDp5TQolK7dfdI=;
 b=lFDCJhekiG5EjIiw059fySrtvLGejPNvpYMjNE0Qjm8Wqw2b5fGJMdkMhmeJD2Mh21EKCn3Jw
 41bclgINcJiApDq9d1q5qgfXdy8zh3eRr6YGXKf3uBT+2viSuBfZrJj
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
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/gpio/gpio-bcm-kona.c | 69 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 77bd4ec93a231472d7bc40db9d5db12d20bb1611..eeaa921df6f072129dbdf1c73d6da2bd7c1fe716 100644
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
@@ -87,14 +103,25 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
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
+	bank->gpio_unlock_count[bit] -= 1;
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
+	if (bank->gpio_unlock_count[bit] == 0) {
+		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
+		val |= BIT(bit);
+		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
+
+		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
+	}
 }
 
 static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
@@ -104,14 +131,20 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
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
+
+		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
+	}
+
+	bank->gpio_unlock_count[bit] += 1;
 }
 
 static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
@@ -362,6 +395,7 @@ static void bcm_kona_gpio_irq_mask(struct irq_data *d)
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
+
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	val = readl(reg_base + GPIO_INT_MASK(bank_id));
@@ -384,6 +418,7 @@ static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
+
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	val = readl(reg_base + GPIO_INT_MSKCLR(bank_id));
@@ -479,15 +514,25 @@ static void bcm_kona_gpio_irq_handler(struct irq_desc *desc)
 static int bcm_kona_gpio_irq_reqres(struct irq_data *d)
 {
 	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
+	unsigned int gpio = d->hwirq;
 
-	return gpiochip_reqres_irq(&kona_gpio->gpio_chip, d->hwirq);
+	/*
+	 * We need to unlock the GPIO before any other operations are performed
+	 * on the relevant GPIO configuration registers
+	 */
+	bcm_kona_gpio_unlock_gpio(kona_gpio, gpio);
+
+	return gpiochip_reqres_irq(&kona_gpio->gpio_chip, gpio);
 }
 
 static void bcm_kona_gpio_irq_relres(struct irq_data *d)
 {
 	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
+	unsigned int gpio = d->hwirq;
+
+	bcm_kona_gpio_lock_gpio(kona_gpio, gpio);
 
-	gpiochip_relres_irq(&kona_gpio->gpio_chip, d->hwirq);
+	gpiochip_relres_irq(&kona_gpio->gpio_chip, gpio);
 }
 
 static struct irq_chip bcm_gpio_irq_chip = {

-- 
2.48.1


