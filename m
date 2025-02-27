Return-Path: <linux-gpio+bounces-16678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA8A478EB
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 10:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D907189113F
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D34227E9B;
	Thu, 27 Feb 2025 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I577nKKi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B185A22688C
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740647894; cv=none; b=rnnr8lCe+6bk+JQfssU1ISMKb/+UFQae+obX5V4Wr/klXrDZ2/XMPtFoQuCGbvXMyEWCHPuAjbH5WeKaJgjpuT6A18aQcAbhDm60OMTMyASlYl8d2E88ZeItO7QcMvApN7z+45UdXXUYQAWQ0/7IY7KT0B6uZj9bhop4eZkT3aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740647894; c=relaxed/simple;
	bh=vYstgA4ius1UoPT3Dr2jg1/y7FmSaj7Sw8lkeF7pqCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SdOlzxXZUtWiqps4xj6A9mOUOpxqQMrHCTKtWRE1f6M10pZLcPSsvIUFso9ljE/jnRG5oryqhwyMAzuvx65wwL79XE103oRYbMhw74p/ky6Bs+oEjEL3wESIZO15d9B0ME/g1tpkiWKjx9BM8XNscdxUTZsWSzDpFLUsQKa1AV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I577nKKi; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30a28bf1baaso7199581fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 01:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740647891; x=1741252691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5h5NSv1ibN9OUwpUhcDyKpysfL1PrF+NnyI3DShvrB0=;
        b=I577nKKizC/gpJNVHtFy6QerKIziw/X+Pdj1g422qBILG0RGpN5+EtDjHxfI7uVSs7
         k8906zbVmpRtoPtyrwIVmd3Ulh50gceL9jk6rxV3fAiWjSwVB+q//nWwOp8L+k6lb0M/
         EVOsNTDmOYdhxAHuhlLyje9SRj/cb7LcdOdGSM68dRrhZn0NvnjRyQ7BVvppQYLx2FXw
         U22YlXfsyjC1GrM6sd3aOlI7EtOC4GX24Jr4K1urrU8kLWsYj7CV2YuUhdu978hCTJMD
         YIt93fWgtM3URSWwcUG/LFhbljwnllo4d3ZdUhhWm9wqcDSpRq8IevQnxi3VCVly84f+
         jskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740647891; x=1741252691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h5NSv1ibN9OUwpUhcDyKpysfL1PrF+NnyI3DShvrB0=;
        b=S0laB3EuuxwsChtaYp+/cbu4cj5C5FGYt2ycwJudtv+oweIRRxD1pHWCcNLmGeBBWD
         B7Ul8yauydbnYMBHaE5HdgIBdLQcihdLiXIedvCrImf1tCVozAOPKFlHEqe/u1ydDzBU
         GTcVnZ+9NnJar2e9E2Ru8IuyN2I6SyvWJXmzC6+KEGEVmuyQA6JA2rW9f+ww2SZ4ZMpA
         OZLsWRY28D9jh6959joQUGaRCKtjeNyh6z1NZHSulWFB/SYMaI8EzXl+bzvwnPtj0S3L
         YSvi5xSy8zmn0QTHWD2+vQ+qaevW4Os3SyHwERmJpst81SInSDJOzR+/+W6EJW5lpSah
         1xlQ==
X-Gm-Message-State: AOJu0YxvEnII6Ywxh21ZL+dE9+TzAd9tuzsIiY3z+/d+gvvF6tmp7KF+
	Gv6cHXJdW6njYH6bJqTrbhraWopiWuTOuDJ5dAuRnX7UqlpNftkQf5zctItvWgYwLP8ZfL0Kqut
	k
X-Gm-Gg: ASbGnct2aqLtCdBqRMUw4PF3mAGkikMk671qMafizMMCdXp5sxH4Vk8eWEuk4yd2FeW
	T1UFlZZHnLHH5DN0/xP3i/I2xTk70Ly+kgrJ6qR3GDMsf3Jb9BhuIY+KrYXu8ul4D2ZfpeP+DKK
	+AxnmspvAGlGXOOfJOTIIvF/BLvnCcxmpUdW1k5oLnnTxUfryBZReUms04b9DTNJnFqpE3gOVvv
	k2NysXewPbmHy/aVGyJlGtPDSWN2BJFaQi/HnDgUvhXj9INCZ4fdhB+538bNYnUrqx865xF2VoY
	KppU2Be0byIlvrjnnvtR3ZYCSMErhFPp/Rw+
X-Google-Smtp-Source: AGHT+IGpGLfGC98sDEjrDSrCzo2t1Vqs7wLlxChgBFmYLDML36CM02Co86IFlhZ0Ek8vlenwOwyAjQ==
X-Received: by 2002:a05:6512:138d:b0:546:3052:4202 with SMTP id 2adb3069b0e04-54839147f79mr12597716e87.27.1740647890789;
        Thu, 27 Feb 2025 01:18:10 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441742d3sm111136e87.34.2025.02.27.01.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:18:09 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Feb 2025 10:18:08 +0100
Subject: [PATCH 2/3] gpio: altera: User gc helper variable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-gpio-mmio-more-v1-2-0ea4ad43d304@linaro.org>
References: <20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org>
In-Reply-To: <20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

Make the code easier to read by adding a local gpio_chip *gc
variable.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-altera.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 17ab039c741314b909f461be7a192791d492c910..290fd168cab24ae0361b43303f8092fc8190c519 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -232,6 +232,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int reg, ret;
 	struct altera_gpio_chip *altera_gc;
+	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
 	int mapped_irq;
 
@@ -241,29 +242,31 @@ static int altera_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&altera_gc->gpio_lock);
 
+	gc = &altera_gc->gc;
+
 	if (device_property_read_u32(dev, "altr,ngpio", &reg))
 		/* By default assume maximum ngpio */
-		altera_gc->gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
+		gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
 	else
-		altera_gc->gc.ngpio = reg;
+		gc->ngpio = reg;
 
-	if (altera_gc->gc.ngpio > ALTERA_GPIO_MAX_NGPIO) {
+	if (gc->ngpio > ALTERA_GPIO_MAX_NGPIO) {
 		dev_warn(&pdev->dev,
 			"ngpio is greater than %d, defaulting to %d\n",
 			ALTERA_GPIO_MAX_NGPIO, ALTERA_GPIO_MAX_NGPIO);
-		altera_gc->gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
+		gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
 	}
 
-	altera_gc->gc.direction_input	= altera_gpio_direction_input;
-	altera_gc->gc.direction_output	= altera_gpio_direction_output;
-	altera_gc->gc.get		= altera_gpio_get;
-	altera_gc->gc.set		= altera_gpio_set;
-	altera_gc->gc.owner		= THIS_MODULE;
-	altera_gc->gc.parent		= &pdev->dev;
-	altera_gc->gc.base		= -1;
+	gc->direction_input	= altera_gpio_direction_input;
+	gc->direction_output	= altera_gpio_direction_output;
+	gc->get		= altera_gpio_get;
+	gc->set		= altera_gpio_set;
+	gc->owner		= THIS_MODULE;
+	gc->parent		= &pdev->dev;
+	gc->base		= -1;
 
-	altera_gc->gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
-	if (!altera_gc->gc.label)
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
+	if (!gc->label)
 		return -ENOMEM;
 
 	altera_gc->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -281,7 +284,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	}
 	altera_gc->interrupt_trigger = reg;
 
-	girq = &altera_gc->gc.irq;
+	girq = &gc->irq;
 	gpio_irq_chip_set_chip(girq, &altera_gpio_irq_chip);
 
 	if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH)

-- 
2.48.1


