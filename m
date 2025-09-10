Return-Path: <linux-gpio+bounces-25864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C2BB50EF5
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 09:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 947697AAF1D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 07:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A0030DECD;
	Wed, 10 Sep 2025 07:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TAlpUBhH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F930DD30
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 07:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488394; cv=none; b=Wct34tloXQcDeeSzBE5Fa4AC8/0nYGWU0WE52IssWXmBYg/lrIcFF/0uUAMuT1ePnszTbIhidmezDkxIMxbWjB2CBKdA65CDw/Z257YdSxAeoeWF94ipgJjgqy7ey1GmXA773FhGPgSOR0nDE/60ieP2vNk5NtL+evCj7aqshFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488394; c=relaxed/simple;
	bh=zNZtdiZhQRPypZTiTBYSh831xD3GK2sObMCGTP/Difg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3xwLKVnE43pnLTN2jziqIY8N4fLkxwoEYusnNuHUSfsFnxeTyOqDd6vPFVFGltG1dK0sC3hozT1mOJiRV/ABPs+acslNWAif8xm1LsMi4xzjykEjPxBMH30qpi8T5XTh25aXbiyk9tfreD8iWn0xQW6d7yc6x6Pep0OStGNutY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TAlpUBhH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so60393675e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 00:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488390; x=1758093190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpH3xP6wyCDFqtxPwQHSi6T7qTG6cxtRQgRVE3rLsKY=;
        b=TAlpUBhH7fc69Cwce0UTEp+49QQkD2sSOHgZ/kULqldWADLj/3KaKS3X/zll5Rb+c+
         Ek4IfLwkkzvFDaBxDpA8vjasnOs1DGWj3iCbf54gtebVHX1X1m3R7x3BUy5n4wQS9Rkn
         FRCGd76Q1N1T+hGniUcJ18nmaganLyfbo7cFkL1inn81ZFA10lFKrCbpOvZXFgvmHyOX
         UiqSI3S3r+ceZHMyzj85gz4/6ayH6YumfnH833Tga6AJ24t4IEk8nW/378Q/6A2SSEEC
         GzKvxaYZLL8XG+O2OkUJu/nvFp2a9ptCLQDAYzaP0/Ar9ynNEKLUgnHpeiYm6ZVEEzna
         wtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488390; x=1758093190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpH3xP6wyCDFqtxPwQHSi6T7qTG6cxtRQgRVE3rLsKY=;
        b=cYAcYT9ZJt1A1/ZU1liGNSq51CwBICPusMt5JDRrxE1IUf9uv8HY1Vwr5lD7U2PrkE
         wG+NjofL7z8vDwNWedz4fpObAUYGMr3Ad8CvugTSl0AHTVDXOAlWn6cBBPUKJfo1cl51
         ea+DbsM1Kqqw5b8uU9uewwELENo9oTO8ckzYZ03hVUoBgvGi3KJ7H4SkibWO7svLjBVX
         OaM/ABoyAuIK6fJeH1UvwGL+n3LwOnvPcNwiNOG0uzIV31IYFey+MXHDD7iNA2gVbzEr
         P2kbEl39ASSEZoGFHZ9vZDa4YitS2tl1sSWAAp3KeIWBOCS6tSle9f9aGjpUJd3oiCgZ
         Dg8A==
X-Gm-Message-State: AOJu0YyejN16w9cle/LU4RgUOrfkdi6EXAnowHkETnpq2xs7dtiM8P/J
	/95ZA892/ngp3qw3YNB/4/vksoSdtAip1vQydbAYjJTUsScb8W6A1Y7ulllO+HeEh1M=
X-Gm-Gg: ASbGncuJsofhe8jKa16FbwFcfZ8KkgRCkU5ZOsQphJ+I97xaOtQRByHCKFYd1o7fjlv
	6L2npuo7xZCpIYleYm5hgTVoA91pchn2jNbVzb8t+PlniZ4Ix7uXa2AGLYSxrGsOO1A7Maw85Aj
	Qg3gYx+nkmLglA0po72fnxCyVZRdNy93VwCiWpV/l2K/jFkMyzyFZ2XljmHZwRWKLJRRXfRkbCD
	X+t1Bescbz9XsUQLPO+hLecgc1t/M2+ZCetg3ru8HN4i+IE9Svszj8iAAbcfniz+dilDQpJtLPp
	ZM3l1xFfPz1TOSbMOuPvGc2s17zT+AhCayCW2or7XfvslwYPR++00oC32hPEHW6t3dUzcqzn6+R
	WLAyPfPSG7MY5vqCM
X-Google-Smtp-Source: AGHT+IHvzaTb6l4WV5jftz/0o+nvoCQMLeFIWHVTLr9cshvRdfatjRswFUx/x04ah3EbwRWAp1+4+w==
X-Received: by 2002:a05:600c:3b23:b0:45b:9c93:d21d with SMTP id 5b1f17b1804b1-45ddde957e4mr149455255e9.8.1757488390271;
        Wed, 10 Sep 2025 00:13:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:45 +0200
Subject: [PATCH v2 09/15] gpio: mt7621: use the generic GPIO chip lock for
 IRQ handling
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-9-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3466;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=11q2Cdfq1GOfHgG+9TvJtv+cnYZQ9ttVALJ5FGWLhWk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTuiV2jdUzIRv5dARsvLCxoAdNPwB3tCj0Wp
 yUtA7jYz6OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7gAKCRARpy6gFHHX
 cnLoD/9oOVXC7jn81QlThye4yt65zIZg8bNy77xMsbujhx+T1ZkIA00xXzPcWUFN+qqLmLzYD67
 7i6XkeUoTgTAPVwo9/YoWHSURE1PUBlPzAG2oeObcx6Nx6rWMNnOzwxgre3p722SfiKAXmI9Sw5
 F3wsjLGHnwlqBKWnVL0yVgDrZxBACpnEwEucj8Di7gGH/7ihgJzLaXVx75XJK701F+pLp/9Jr1b
 c1ljp89dveL18XF8JXKR8nZmWTXhpL5UUOOMNKDpEUkRjJfNlE3qcPFoLPpnCBwf5KAvuB1662Z
 NOdWpl807j5tpMNsDkQF46HO0TWO7x8a2kOQjq+a2LpEmiAbWLNnpZl0nriZC+/4QdtnmORL99P
 HlCfXkeSRSJANw6EIQBw6kabCZ29LmSENq47mJxIBgBjQZ0Dv9qsXH29gMssXXxxDbIwc2pt0Rz
 Dg3AYlmpVgqo86nKo9slX+zfJZfCN/vqpeiMKATef9HH8UX6ZF5VV4MrcBbfkEddTWIrKyXuSYu
 lGknfChnGxXZWC94ReuSzBn20I3JOJ1PhK4M4DsX8Jio5c7C+pAp1MXBa+UAq70CqycsjIDnYFD
 z2EBndwzE9egdkZ9YaRmwFYNNvW/ILgBcppubajjbZcdvPIkL83r8yz8CzrzMylmV4i/KJit1Z8
 q1/yp6vSSydNvbQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver uses its own spinlock in interrupt routines while the
generic GPIO chip callbacks use a separate one. This is, of course, racy
so use the fact that the lock in generic GPIO chip is also a spinlock and
convert the interrupt handling functions in this module to using the
provided generic GPIO chip locking API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mt7621.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index e56812a1721151c8f3b32b5093aee5c74bb798bc..e7bb9b2cd6cf32baa71b4185ea274075a7bc2d8f 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -11,7 +11,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/spinlock.h>
 
 #define MTK_BANK_CNT	3
 #define MTK_BANK_WIDTH	32
@@ -32,7 +31,6 @@
 struct mtk_gc {
 	struct irq_chip irq_chip;
 	struct gpio_generic_chip chip;
-	spinlock_t lock;
 	int bank;
 	u32 rising;
 	u32 falling;
@@ -111,12 +109,12 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct mtk_gc *rg = to_mediatek_gpio(gc);
 	int pin = d->hwirq;
-	unsigned long flags;
 	u32 rise, fall, high, low;
 
 	gpiochip_enable_irq(gc, d->hwirq);
 
-	spin_lock_irqsave(&rg->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&rg->chip);
+
 	rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
 	fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
 	high = mtk_gpio_r32(rg, GPIO_REG_HLVL);
@@ -125,7 +123,6 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
 	mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall | (BIT(pin) & rg->falling));
 	mtk_gpio_w32(rg, GPIO_REG_HLVL, high | (BIT(pin) & rg->hlevel));
 	mtk_gpio_w32(rg, GPIO_REG_LLVL, low | (BIT(pin) & rg->llevel));
-	spin_unlock_irqrestore(&rg->lock, flags);
 }
 
 static void
@@ -134,19 +131,18 @@ mediatek_gpio_irq_mask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct mtk_gc *rg = to_mediatek_gpio(gc);
 	int pin = d->hwirq;
-	unsigned long flags;
 	u32 rise, fall, high, low;
 
-	spin_lock_irqsave(&rg->lock, flags);
-	rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
-	fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
-	high = mtk_gpio_r32(rg, GPIO_REG_HLVL);
-	low = mtk_gpio_r32(rg, GPIO_REG_LLVL);
-	mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall & ~BIT(pin));
-	mtk_gpio_w32(rg, GPIO_REG_REDGE, rise & ~BIT(pin));
-	mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(pin));
-	mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(pin));
-	spin_unlock_irqrestore(&rg->lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &rg->chip) {
+		rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
+		fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
+		high = mtk_gpio_r32(rg, GPIO_REG_HLVL);
+		low = mtk_gpio_r32(rg, GPIO_REG_LLVL);
+		mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall & ~BIT(pin));
+		mtk_gpio_w32(rg, GPIO_REG_REDGE, rise & ~BIT(pin));
+		mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(pin));
+		mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(pin));
+	}
 
 	gpiochip_disable_irq(gc, d->hwirq);
 }
@@ -232,7 +228,6 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	rg = &mtk->gc_map[bank];
 	memset(rg, 0, sizeof(*rg));
 
-	spin_lock_init(&rg->lock);
 	rg->bank = bank;
 
 	dat = mtk->base + GPIO_REG_DATA + (rg->bank * GPIO_BANK_STRIDE);

-- 
2.48.1


