Return-Path: <linux-gpio+bounces-24910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB5B33B9D
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AC8D204332
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776EA2D63F9;
	Mon, 25 Aug 2025 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZpaxidKH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AAD2D060B
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115345; cv=none; b=fzl2pvKxCwzDk8/t0GTP/hTI8EelmH7xdmJiwvogUgF+5Q4I+fHU/7HGuY9Bg7dNcp4LZoKvD2NW9Pl3yWV5MKE4ix+c3Nb9T/N1lRg40JucH7XiYWnxD9ThsfWN3cwCnhBBv29pu485RT4C98EXNSbTtqgujkTybQyPfOak83A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115345; c=relaxed/simple;
	bh=JoATGmb5B+qG9j8i++GOB88ySA0sb3+2w5K/6Uoihrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sIMufAZ9NXUnjCbVe1d/iFAmfavPah+ywMZ/+KdH/2tNo4QZuOSDcqZZQ1wayOPnwuDXZoYpPEbAVC74UVYjTjG0pm7LdRwfq/K0cG6HPcSYl66OASVwG01bwQBIBp4cAUMAYfKgaaMVoEDjBaumTIPP3g2+CfLoDG86fCVG8Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZpaxidKH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2556405f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115341; x=1756720141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JXqL63qeFVdF/I9mGFbork5TN+ZaQ7aCD37gp/UqF0=;
        b=ZpaxidKHuSljwbQkaoS4rxy/mPLpAmHZQ4KCdlyh+vtgGKVNapHPnRl/dFeyRXs/8e
         v4+p3x7jo4lz/ji38hC7ijCBkMX7gisMy2gKJl1X+aSyvUwfpsO4OVmeyI93FGcOSQnK
         NJuyD4k+gecKgLlBis6Zg408BoWKA5FMD9n4gQQRnG6xBTeT5/OYXfoVQOglGbL9Nc7m
         /h19R9snABqTWxM0nIskE86ZNN8lFEKHohA439EMv43JXqYYWtIE3zS+VQWjboY2RPbr
         c1qdzl2dFrbgaUQvmUfAveH+if1sTQQy0GMn3OYHi8AiVXzGHWFExrzfinsBKrX7aY8S
         89mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115341; x=1756720141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JXqL63qeFVdF/I9mGFbork5TN+ZaQ7aCD37gp/UqF0=;
        b=hcwRfUrvF5hMDbOgfEkVW9QEHNjJ5TXJQcC9XARYIg2C7Oeq2QOYo/ETc2RB40cqz9
         7fgCRgUzMG4GmxaSOGdzkPrVaHInBdAkhEp2+ect+IR95j5OWmejBNOYZjyzdlDzA+Uv
         voY8k7HZXOw/PoOOf6AVqpqeP51zEmn5a4YM4m1g7xN4F0Qo7ErRDAu/xeLFa0W5gdGz
         1UHIxtw1VklT31S9l4jFSMPiIGaCFqbkZ+FoeWAw/xWT4HLn/HjCYpac3bjReZVhgqzb
         3buvzh1AONSwrSoszwnIfGepkUROzFAIia77iFrdWbKleGIbUCqCOTDpJ5VjND6z+qtQ
         xM9A==
X-Gm-Message-State: AOJu0Yz4Imi5E+FlzCDuFJ86+Dlzy+2gRWrY++2MAKoDvxAOE0rWQiVZ
	Ni/+nIQqN6mT/GsT5r+A5H1jP/dv1RYYFGbRhsMzJ9T5AE9Zs5yHiX88ZvWB/BfRlv4=
X-Gm-Gg: ASbGnctHMyfcS7Wt/KXZ2hlt4LgEkoQaim8sFJ8FHgcjTRhVZZJGEPQajeE+fk1mv1S
	iqN12ZF08soQz1t4/ptt6g1APVc4OffTd4DRahIRxjiv4HcuGF743uS5qnNlGOGw6v+/HfTOlRc
	7YGo42I0Iz0e1oeLhawTsMUUiRU7gRXdCWd+/0U7cvlDP31gwMDXoCNos3JAoO3PTs1dVZuoB4o
	BKqjK6ernSMejlValDrg3LFt5aZvVEdXB6oAg2iUPLMkCSD0Z8tAIJ7hzNasy5953YIHbcHAGud
	23ChxWEtlyRtAgtzuyAwkiFcHJVzSR5PXAH6t9DhvlG3BAlf7PT9uFB/zIFLrS14CqMw/XrlZFT
	xpqrsdPsBEAmBceGFUj3V8ClSc4ZO
X-Google-Smtp-Source: AGHT+IGqQFUyVzUhWNvcRXp/aqVwDzPVihVhyMJEm+AleXvTWHTL72e7MVyfwP+PUw30TkIPXUveHg==
X-Received: by 2002:a05:6000:4308:b0:3c8:443:4053 with SMTP id ffacd0b85a97d-3c804434626mr3718081f8f.1.1756115341323;
        Mon, 25 Aug 2025 02:49:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:49:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:51 +0200
Subject: [PATCH RESEND 10/14] gpio: amdpt: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-10-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4007;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J+TT9XjbJJKbjE77nqgtMEqiO3qZwqcbYA98JKh3zw8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF/x4Ui4aJKIzDH0rV5RTC964M761/7Rc/Gu
 oO2Vd9gFnOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfwAKCRARpy6gFHHX
 cjssEAC2/HEP7ClxN+Z8FxBVvzsXbdSfTrHqx8ubSZGhwCLUqGKdylAim9rPEKUHQQJB/fTrtSk
 egIV2DUIsexkGXJ1mJCvGuBNj/pfGF0RgghPgpVvghNihgUq3kyktUSiakewhKE+/wB9xY/zY5s
 7ejYlAKn3+KSQCUx+QM52LHaAVqmyS+Mh8zKZMniaYendSd22YsR5+8kFl6z/Q7jIV328Cx5k7V
 Jk+CdFJYezEdAqt+VK12+7oekT2rST3kwH+l4Ya3XVwf2KXKayHfYa8iVO336uUAAYVTEkxvOu1
 gaJfg7h9eN4sj8WdyPzUF6aKNsfpConZVaana8Qp8CFJwmm64Gz3H1pVbv9ypJCKAYzbL7MxeTo
 /lx2ztvw/OHEW9W9Gg3nKBJaPKKGLwujx49JiyIspjJkmzRFLpe9YwL3ZKWdXyj6/F2aCtKwzzj
 ySE/0nZ08eBBBWzTv8kmu1NZYGivXV1s+df1EAdJ6W/fYdfNGeV0mdle2jq9/MvVeHT6GhSx601
 IRTeESGbheUdw46N2E6VehPM3kfoz76g0ZJt8CfIBTzqmPCIMSmWi45ihLiWXhbqZsr9UXxWJKs
 mEvYxOpXORIGUWGbrA8P5KTcOQPCdV9rMn5CbM60cbPNHuruPDjzZ6M3AGpet3TGnIWBgKFxvAt
 J1c3T3Q9aDoUaRA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-amdpt.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index b70036587d9c3f64bb73ed3b94e1c14f249c9e21..0a9b870705b90bdc9bdab93ce5a4a33ebdafccc6 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/spinlock.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
@@ -24,54 +25,50 @@
 #define PT_SYNC_REG        0x28
 
 struct pt_gpio_chip {
-	struct gpio_chip         gc;
+	struct gpio_generic_chip chip;
 	void __iomem             *reg_base;
 };
 
 static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	u32 using_pins;
 
 	dev_dbg(gc->parent, "pt_gpio_request offset=%x\n", offset);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
 	if (using_pins & BIT(offset)) {
 		dev_warn(gc->parent, "PT GPIO pin %x reconfigured\n",
 			 offset);
-		raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 		return -EINVAL;
 	}
 
 	writel(using_pins | BIT(offset), pt_gpio->reg_base + PT_SYNC_REG);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-
 	return 0;
 }
 
 static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
 {
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	u32 using_pins;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
 	using_pins &= ~BIT(offset);
 	writel(using_pins, pt_gpio->reg_base + PT_SYNC_REG);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-
 	dev_dbg(gc->parent, "pt_gpio_free offset=%x\n", offset);
 }
 
 static int pt_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct pt_gpio_chip *pt_gpio;
 	int ret = 0;
@@ -91,22 +88,27 @@ static int pt_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(pt_gpio->reg_base);
 	}
 
-	ret = bgpio_init(&pt_gpio->gc, dev, 4,
-			 pt_gpio->reg_base + PT_INPUTDATA_REG,
-			 pt_gpio->reg_base + PT_OUTPUTDATA_REG, NULL,
-			 pt_gpio->reg_base + PT_DIRECTION_REG, NULL,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = pt_gpio->reg_base + PT_INPUTDATA_REG,
+		.set = pt_gpio->reg_base + PT_OUTPUTDATA_REG,
+		.dirout = pt_gpio->reg_base + PT_DIRECTION_REG,
+		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+	};
+
+	ret = gpio_generic_chip_init(&pt_gpio->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize the generic GPIO chip\n");
 		return ret;
 	}
 
-	pt_gpio->gc.owner            = THIS_MODULE;
-	pt_gpio->gc.request          = pt_gpio_request;
-	pt_gpio->gc.free             = pt_gpio_free;
-	pt_gpio->gc.ngpio            = (uintptr_t)device_get_match_data(dev);
+	pt_gpio->chip.gc.owner = THIS_MODULE;
+	pt_gpio->chip.gc.request = pt_gpio_request;
+	pt_gpio->chip.gc.free = pt_gpio_free;
+	pt_gpio->chip.gc.ngpio = (uintptr_t)device_get_match_data(dev);
 
-	ret = devm_gpiochip_add_data(dev, &pt_gpio->gc, pt_gpio);
+	ret = devm_gpiochip_add_data(dev, &pt_gpio->chip.gc, pt_gpio);
 	if (ret) {
 		dev_err(dev, "Failed to register GPIO lib\n");
 		return ret;

-- 
2.48.1


