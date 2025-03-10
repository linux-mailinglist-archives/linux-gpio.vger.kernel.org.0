Return-Path: <linux-gpio+bounces-17358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F7A594BA
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D54393AA3FA
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05701227EBE;
	Mon, 10 Mar 2025 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2oPyzvpN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE2226CFD
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610431; cv=none; b=lxsOJlwCHRIPyScGp8Es7EngudZclxe69AX8xdJtOfjNP7qMulAo2lBqA82NfUh9gqrGHxWAF0MQ6b82fcn03ftJJkhvW7sDw3S3mEbmxttveqSo6UYeZ4JosK1NWOinPZ+JK0YN731ziARmHwJ0mQo8Q/4efYfoOLphu0Bdv5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610431; c=relaxed/simple;
	bh=oW/aiEUvZZXqJSh9yhfXEXd+nz94th1LNEkngduFixs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrb1fiP0y7L/1eyU/oIWPeqvfSxW9DOPkTSbzjGUdtgqdT+thGX6hj9e5driCqrbBONNzmDt8xJjFqQ1vyxF+ywLjC5KLCicaVaJDS7+22uc/sl15mssTqaRU0b9sDrC9BKjfNzdCOH9/xTvrwBz/bhSNTCKklDGs5Gncn7RP4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2oPyzvpN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3913cf69784so2090126f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610427; x=1742215227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYGAI05OK7Mp/05h37Cjc2avvREPLKZMIgnLXPpZpUk=;
        b=2oPyzvpNOQxj0AoIsHlPAvoQwk2ZarGCLuUwM0+S7xdIB1vsslGDiNQGq/fDW29Pbs
         +yELrJNgE9JQIEzmeM7UQttfKhwVLi6L7JLvSlcPEWE4Fu4iAGmpu7L9avPHPEpIxGk1
         yt/BfQ+ATCsFxPV2Vl+vfYUVcRDLMXKhWm8YLx0FXY6V/W9FFG73tlHRa4BTcPG69zp9
         cfXXVuGfCCIFuH7OVdgsQqSeo7o8le2tr8INqPw/6HmI7zK7zvUWG4BnEE9fOUwhVN+4
         sGRd5yMY6pumPCmdwR0D9TE8ww9RAuPS9N1xCVPWPP2qefTujsAsb0y/C/+NZNGr8NZg
         mbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610427; x=1742215227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYGAI05OK7Mp/05h37Cjc2avvREPLKZMIgnLXPpZpUk=;
        b=n4hEGvFboC41jLAQrsclORmZpjI+KViLla6V39ioYw7Jtg5t116bAMNe8/+SGqpFpi
         19n7Oj6ow/hGMgxVyPtT8iM9gUnhR68NVL3g6xQFfAGQfcxua8dn3H2t4HMR0mXXYpCm
         hd06bXwYsMioADeEkdtAQVm2S9PiUiiPADSPY43Uc6mZwak9fNnK3Ahm2U6/ngIOR7ZX
         WrqhKmTlxgdm+VQ/csi5adZfBKdI1zqwXP8CJPyVhM9XSlMYmACbfMTtd/RViJc1SRnY
         lQ6ehFTIxL+YSkpjXTwHAmmg7KzB72FSlxv4UE+oNL/K44ESGilD/j+++M169rHFoUjT
         PGZQ==
X-Gm-Message-State: AOJu0YyK94woSO6YXql08kxzSQUXC9CLdn2q8OHLwZ+O+JfcXgM1waVS
	FM6//ziU/WHvm72ShzGAglYGJIEQgUm0oZqnzV/EGdIHGOgSrSAR5iY49oep0QY=
X-Gm-Gg: ASbGncuQ8hWYpFiV4v4ewplWnKas5mIJCOuMn6Ui2T64uGPH9r7f9XwgYpChxCPYxNp
	bjrKCyV40+ff9HxNlEz0mU/wSJ6tHVQj2S9qjDBDf7ZdXTVTi7upFMsz0Y6yYkZsuYofqqbPzog
	wEteqbNnpuaKDnZI8HqwYzV+T4HpbOOzD4dv6dK3pyflJI5mYPM2gs9y4NK7nEMVGsXpNHplVo/
	vlZy1Vzx1hfmAsczex5wSgGCvm02tbvDq1aQ4RI/L0Hi83YHgqyGWfgj2mivNrZYR5xMYY5lbRQ
	WB2R55o/7/051GhX08nRbYKAvC5f7Fd1Ckpd3OJNuIcCrmfX
X-Google-Smtp-Source: AGHT+IEpiZSigsD7mq/7aroNSLpkKgw14vyLzwCpAs6P3IU39kiwkAcoJYwXJqsG7JdjAFA2p1EHlQ==
X-Received: by 2002:a05:6000:1fa4:b0:38f:577f:2f6d with SMTP id ffacd0b85a97d-39132d093demr9788508f8f.2.1741610426632;
        Mon, 10 Mar 2025 05:40:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:15 +0100
Subject: [PATCH 01/15] gpio: bcm-kona: use lock guards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-1-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8700;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=64LvLyjulLlcRTZ6GwgHPm6zOm13plfMb/iq3ckJj3M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt21eodUQWkbpDril/aofsEv3YS5awh3YzS5v
 pLHOsHTSUKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtQAKCRARpy6gFHHX
 co4WEACFOzNSsrtqyn29Tv1p2FDoEi4QHiQUDjLxZx2Bv3sENlv3Tx75JcS/y1LNsyW06lE+Lht
 hni/2nm5Ku+vMumPzvWiQpBGr7jvBFFisiXHVGoKHZD60rPJV3x1VGH5fpXSYrkqF0G9SzZi2/l
 sr1zPSrIQ98kdRuklC9yiUQCidpG7gpymoTNQ61suzfAmfv23IiTfxlE8xnzb3YRnGZgMAoTydg
 yiWDrRIiOgcxDTGUf9Qb0NqtPeOKf7xy7K7WDs3vSkHs9HWmU3IAmawoi0CYedV6LVxTwWxjmpc
 csZNcgsMcVziHsGfPLUVy0/8HlwM5Ukux4cLc7Bn6q9k+Jn1ceTy5UyyRzSpdoCI+DC6lp6pzMm
 i654kvtGMluy6k3KW3YAErcIMxRWcM3aXp8RMGs5CxfkUnOMKS4XycWERkdPLun4RgR6HFvrHlI
 KhhJpNS9RGUBP7stOEyCgd+PkGd6y1oU2qGGNshbuXlg9c+xU+R/JZEHApv09Ncywafj9Bdjtpy
 vxHR4j2+I/jnJi56GrWy53xOBgGky1gNT6SAXOIOS1xn01LuIZeRPNMXL0eGmxG0EOxnhXd5psN
 HS/oYXp5UOwxqWQBiSK8N4yy7mxJrW7R5ptA//ih+YDloJvs0xBPMUxedvFEn2yqJ5ElJ7N0WFJ
 qzp7ejpfa8xA3eg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reduce the code complexity by using automatic lock guards with the raw
spinlock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bcm-kona.c | 64 +++++++++++++-------------------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 64908f1a5e7f..a7390b1f1173 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
@@ -100,7 +101,6 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
 					unsigned gpio)
 {
 	u32 val;
-	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
@@ -112,13 +112,11 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
 	}
 
 	if (--bank->gpio_unlock_count[bit] == 0) {
-		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+		guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
 		val |= BIT(bit);
 		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
-
-		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 	}
 }
 
@@ -126,19 +124,16 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
 					unsigned gpio)
 {
 	u32 val;
-	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
 
 	if (bank->gpio_unlock_count[bit] == 0) {
-		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+		guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
 		val &= ~BIT(bit);
 		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
-
-		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 	}
 
 	++bank->gpio_unlock_count[bit];
@@ -161,24 +156,21 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val, reg_offset;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	/* this function only applies to output pin */
 	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
-		goto out;
+		return;
 
 	reg_offset = value ? GPIO_OUT_SET(bank_id) : GPIO_OUT_CLEAR(bank_id);
 
 	val = readl(reg_base + reg_offset);
 	val |= BIT(bit);
 	writel(val, reg_base + reg_offset);
-
-out:
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
@@ -188,11 +180,11 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val, reg_offset;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
 		reg_offset = GPIO_IN_STATUS(bank_id);
@@ -202,8 +194,6 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	/* read the GPIO bank status */
 	val = readl(reg_base + reg_offset);
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	/* return the specified bit status */
 	return !!(val & BIT(bit));
 }
@@ -228,19 +218,17 @@ static int bcm_kona_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_IOTR_MASK;
 	val |= GPIO_GPCTR0_IOTR_CMD_INPUT;
 	writel(val, reg_base + GPIO_CONTROL(gpio));
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 
@@ -252,11 +240,11 @@ static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val, reg_offset;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_IOTR_MASK;
@@ -268,8 +256,6 @@ static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
 	val |= BIT(bit);
 	writel(val, reg_base + reg_offset);
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 
@@ -289,7 +275,6 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
 	u32 val, res;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
@@ -312,7 +297,7 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 	}
 
 	/* spin lock for read-modify-write of the GPIO register */
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_DBR_MASK;
@@ -327,8 +312,6 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 
 	writel(val, reg_base + GPIO_CONTROL(gpio));
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 
@@ -367,17 +350,15 @@ static void bcm_kona_gpio_irq_ack(struct irq_data *d)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_INT_STATUS(bank_id));
 	val |= BIT(bit);
 	writel(val, reg_base + GPIO_INT_STATUS(bank_id));
-
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static void bcm_kona_gpio_irq_mask(struct irq_data *d)
@@ -388,19 +369,16 @@ static void bcm_kona_gpio_irq_mask(struct irq_data *d)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_INT_MASK(bank_id));
 	val |= BIT(bit);
 	writel(val, reg_base + GPIO_INT_MASK(bank_id));
 	gpiochip_disable_irq(&kona_gpio->gpio_chip, gpio);
-
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
@@ -411,19 +389,16 @@ static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_INT_MSKCLR(bank_id));
 	val |= BIT(bit);
 	writel(val, reg_base + GPIO_INT_MSKCLR(bank_id));
 	gpiochip_enable_irq(&kona_gpio->gpio_chip, gpio);
-
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
@@ -433,7 +408,6 @@ static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	unsigned gpio = d->hwirq;
 	u32 lvl_type;
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
@@ -459,15 +433,13 @@ static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_ITR_MASK;
 	val |= lvl_type << GPIO_GPCTR0_ITR_SHIFT;
 	writel(val, reg_base + GPIO_CONTROL(gpio));
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 

-- 
2.45.2


