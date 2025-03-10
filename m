Return-Path: <linux-gpio+bounces-17364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7562A594C9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEFE73AC449
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEDB22ACC6;
	Mon, 10 Mar 2025 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a6+V7RS2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D622A4CD
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610437; cv=none; b=mK+VmzrBP4uG0dLz4A8aWkM5UosUpWrpd7AdF8pHZtEsKwVhrbRUSBnTiZ+pZXGcgeKYF/2+X5B2UNxrO7HJXhanoOfMj94qWtY+u90ImuGO9rvQ5tPfWSDjMdaJV+RCvvz4Cpey7Jim8E6DKIU6BOdqa4c72auFT8oxbFHH+os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610437; c=relaxed/simple;
	bh=M+L3sOe3OAAzrK/5BquNt3kcr6Ll6ljNK/MgillJMU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZXhN4FMZXlXXrseCbmUKru5B2+NooMhQrASzTr+7SGZR419OPIddz0hgrFnUI7BQHqDJ0BqyuSgskYllfugIJeLTYKPX7tPTgcFaLxcu8w4NDEDjcElQdGwdHpNYaWn1XGsL/U7+27TNYYdvZxMkROdUmCSncmhbPdYMUcNhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a6+V7RS2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso3577533f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 05:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610433; x=1742215233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Id3vfYo4VZD5XkzVJtKrhfXekLSBu1hf0uoNw4mF3Eo=;
        b=a6+V7RS2ckUnYyiDdymX3ygwZw4inZEoui+ogR1mRyWdP/p3kx2LzlcA8C6rguemkE
         SrAInpeExQoVAq0bqM6efOcobSFIGSoCweqdVE2I9Zp5Oh40WSe742T0k72ZN8Zf0PcO
         z3mn5VcpvuYKSWXDrGfmff1sYSjLyKT/d5vfE3xZxjxRRfW9QnXK8pL6hBk64jOHWytm
         4lsvOtqNSZBenTX2Tp4Fg+chEXR50DPt2VPgWx/FzW2JPO6izG0T+YL3CiBqJ2e17E8Q
         G1Ark+66ExNkmmpw5AKJxMx2NhzZOAvQsBGML2k2fWZ6rOsqunKjF/rZbAxef+tx4gyU
         gygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610433; x=1742215233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Id3vfYo4VZD5XkzVJtKrhfXekLSBu1hf0uoNw4mF3Eo=;
        b=ekmcWFtVPdA/P5EdZjtMEQtU6hTRC0O8c7wEtWbtid3vIryDnvRFsbm1UbzFje0R5r
         7+GZw/5BGPZaXu5vG57y8llH5Ok32sxXG6SF6TWP9K35yxzgMhCoZ2SwbNNhVExmGrLE
         3mYfA+YMMdXDqvDv4wKoLK3VI8cqM1ym3fut1xqD4IqseTblNWfaiKJH8RZK+QC3QWXe
         7plSdDO/RgDbQl1KK+6J4TLfDYn/QzYAoYWijAn3v9C+EbSlfUCExafygIj8XtufiAe2
         EHOipu8P2601hR6Eyejb4YYe8rZM+BCOKj6ed3700dNqOszPGrGuK1vSlorhPKGLBJsk
         7QLA==
X-Gm-Message-State: AOJu0Yy/6zkREPkqKnusbLvcM9UmfYmCqGQEqPnb97GgXAmilYeOc+3s
	UM0dePQyQj5NEYho4Amf9wl+A0Z/PSOW4sAqWXTBbSDZ7cfcJynVGqMyFoQWhIk=
X-Gm-Gg: ASbGncuBu8CaVC9fU8zcvfrPTsjH/KmmQhk1sIO7Z0K+6DCfcfWYptLOsTnFp6nCxt0
	11RPXF3V/E4DSeuA+aiQV6amgLH/+4ffGdM0leKhpsIetXN1/TY3guKI9h3ueiQczJqb+FjYQYd
	nqcCn4tqFGiktwYojSoAiPC0PVnJtoe/rPlEuvY857KqmhlDi8XpMLte6XvDO20675iMeaB4v6O
	AneioJ9Vm95OFIeDbvpmnSe6qD8nlCosoX0/ugXWTTSRL/S27lBDbMo1Zz9cHuw6HH8jYqXzNlj
	e86KvZbdzZ58sIlA1GEKhLNecQf9jXnwb0rlrg==
X-Google-Smtp-Source: AGHT+IECcUEAyJk+oPoRKjamWfM+6cuRlv65sUT1emZeg5dAbLhRfMSv7hXYlymPRYvGi9qDzp5WJA==
X-Received: by 2002:a05:6000:402a:b0:390:ed05:aa26 with SMTP id ffacd0b85a97d-39132d30c22mr7780118f8f.5.1741610433374;
        Mon, 10 Mar 2025 05:40:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:21 +0100
Subject: [PATCH 07/15] gpio: bt8xx: use lock guards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-7-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4382;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EhqOin58PEfzgx3eJ5unejxbV9F/HjaBEBaMhpRjuiU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt228iyNyevo/zmL5UjBckrYdT+ePey2+NAqp
 f+oE7+vEmCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtgAKCRARpy6gFHHX
 cg4gD/wNsLQBjjyB4YIEs1F1nmfjbZaGOKUNQEQ1mGrVWV+Ys6F2xeaYF0e6BZo64oEe/hRcDAV
 slCccpz4sLSCc7hbjcevCbwK/jTj8sN9aIcgsIMVIVdy5pc98CFwM96Gf6naCZC/62eUr96Gf+p
 2+DRtSDHs7J5I9fKr6O9aKlk4O9dtVnsv89+uEwwM46yXuqjGrKkN8aRGZKlYmMCVriwHN2uZZc
 KhdgcZ5AEQ4fd01RiZwIGeCg3SJs14FqOg46YBWvM7Ba+kcb+83fRcy+TU2nuZ5YK2VlPnhMdQw
 vQipTEKxs8O12n0MXdPkKbiqr3HeTXBKjb3da7SMqPfPrSQ/zV0s6Z7rut0A+rX5ycNhvwQJQ7A
 3WI8cUAFmocYhX0W1T5cN7ssegIzI45Q0QUa16fwxNz92rUvUvEWLIPIhwB3uNmkQblpiIVwGHg
 hSYChG3o1nmtw0YJXc8SM5Njj+2aRx41YGBxy8AmpUO4Lvaisfc/+kWLxhCl36AHy8Q+6KqYNS8
 Vki2t3QAVYFTInIusfdY6zjNNaKVewT98C8xLbU87/eA9GMDVixFyEdXmchmJtC0xKk5cjSR3YL
 mkSF9Y8fy2nJqj8oO+TvBHduRPZlo07/Fh0ewKthqSiRqpTHpeuJD4JmDIjypddrAk4hjBNB/F4
 qJANL60tTxvMY0Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reduce the code complexity by using automatic lock guards with the
spinlock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bt8xx.c | 43 ++++++++++++++-----------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 7920cf256798..173da7bbfc98 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -31,6 +31,7 @@
 
 */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/spinlock.h>
@@ -69,10 +70,9 @@ MODULE_PARM_DESC(gpiobase, "The GPIO number base. -1 means dynamic, which is the
 static int bt8xxgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 {
 	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
-	unsigned long flags;
 	u32 outen, data;
 
-	spin_lock_irqsave(&bg->lock, flags);
+	guard(spinlock_irqsave)(&bg->lock);
 
 	data = bgread(BT848_GPIO_DATA);
 	data &= ~(1 << nr);
@@ -82,20 +82,17 @@ static int bt8xxgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 	outen &= ~(1 << nr);
 	bgwrite(outen, BT848_GPIO_OUT_EN);
 
-	spin_unlock_irqrestore(&bg->lock, flags);
-
 	return 0;
 }
 
 static int bt8xxgpio_gpio_get(struct gpio_chip *gpio, unsigned nr)
 {
 	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bg->lock, flags);
+	guard(spinlock_irqsave)(&bg->lock);
+
 	val = bgread(BT848_GPIO_DATA);
-	spin_unlock_irqrestore(&bg->lock, flags);
 
 	return !!(val & (1 << nr));
 }
@@ -104,10 +101,9 @@ static int bt8xxgpio_gpio_direction_output(struct gpio_chip *gpio,
 					unsigned nr, int val)
 {
 	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
-	unsigned long flags;
 	u32 outen, data;
 
-	spin_lock_irqsave(&bg->lock, flags);
+	guard(spinlock_irqsave)(&bg->lock);
 
 	outen = bgread(BT848_GPIO_OUT_EN);
 	outen |= (1 << nr);
@@ -120,8 +116,6 @@ static int bt8xxgpio_gpio_direction_output(struct gpio_chip *gpio,
 		data &= ~(1 << nr);
 	bgwrite(data, BT848_GPIO_DATA);
 
-	spin_unlock_irqrestore(&bg->lock, flags);
-
 	return 0;
 }
 
@@ -129,10 +123,9 @@ static void bt8xxgpio_gpio_set(struct gpio_chip *gpio,
 			    unsigned nr, int val)
 {
 	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
-	unsigned long flags;
 	u32 data;
 
-	spin_lock_irqsave(&bg->lock, flags);
+	guard(spinlock_irqsave)(&bg->lock);
 
 	data = bgread(BT848_GPIO_DATA);
 	if (val)
@@ -140,8 +133,6 @@ static void bt8xxgpio_gpio_set(struct gpio_chip *gpio,
 	else
 		data &= ~(1 << nr);
 	bgwrite(data, BT848_GPIO_DATA);
-
-	spin_unlock_irqrestore(&bg->lock, flags);
 }
 
 static void bt8xxgpio_gpio_setup(struct bt8xxgpio *bg)
@@ -236,18 +227,15 @@ static void bt8xxgpio_remove(struct pci_dev *pdev)
 static int bt8xxgpio_suspend(struct pci_dev *pdev, pm_message_t state)
 {
 	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
-	unsigned long flags;
 
-	spin_lock_irqsave(&bg->lock, flags);
+	scoped_guard(spinlock_irqsave, &bg->lock) {
+		bg->saved_outen = bgread(BT848_GPIO_OUT_EN);
+		bg->saved_data = bgread(BT848_GPIO_DATA);
 
-	bg->saved_outen = bgread(BT848_GPIO_OUT_EN);
-	bg->saved_data = bgread(BT848_GPIO_DATA);
-
-	bgwrite(0, BT848_INT_MASK);
-	bgwrite(~0x0, BT848_INT_STAT);
-	bgwrite(0x0, BT848_GPIO_OUT_EN);
-
-	spin_unlock_irqrestore(&bg->lock, flags);
+		bgwrite(0, BT848_INT_MASK);
+		bgwrite(~0x0, BT848_INT_STAT);
+		bgwrite(0x0, BT848_GPIO_OUT_EN);
+	}
 
 	pci_save_state(pdev);
 	pci_disable_device(pdev);
@@ -259,7 +247,6 @@ static int bt8xxgpio_suspend(struct pci_dev *pdev, pm_message_t state)
 static int bt8xxgpio_resume(struct pci_dev *pdev)
 {
 	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
-	unsigned long flags;
 	int err;
 
 	pci_set_power_state(pdev, PCI_D0);
@@ -268,7 +255,7 @@ static int bt8xxgpio_resume(struct pci_dev *pdev)
 		return err;
 	pci_restore_state(pdev);
 
-	spin_lock_irqsave(&bg->lock, flags);
+	guard(spinlock_irqsave)(&bg->lock);
 
 	bgwrite(0, BT848_INT_MASK);
 	bgwrite(0, BT848_GPIO_DMA_CTL);
@@ -277,8 +264,6 @@ static int bt8xxgpio_resume(struct pci_dev *pdev)
 	bgwrite(bg->saved_data & bg->saved_outen,
 		BT848_GPIO_DATA);
 
-	spin_unlock_irqrestore(&bg->lock, flags);
-
 	return 0;
 }
 #else

-- 
2.45.2


