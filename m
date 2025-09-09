Return-Path: <linux-gpio+bounces-25791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A519AB4A79B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3AC37B0754
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0368030C638;
	Tue,  9 Sep 2025 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tKTq4F0o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D512630AD0F
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409365; cv=none; b=X24+tJpH8h+f6ry+WfKw8x4QIn14aVSRmdYu8R600iULq3somUW0CfU/IEYAUjAqr4jnGwEP7D9NvzTvwhVHtykd1HgzEXx2qOE5UO+mkJBAripQgnYhvbLzDo3b/JWe+WfvBSz9CcAHcXbefBWFuuxIO/LjDLv6dGftlTYtLzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409365; c=relaxed/simple;
	bh=mT4HHJlQwDtBRNGtv0Vlu1Vz/E9b0L/SsnLUi3FcPmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMChLsg2llqlh9XurN1UQn8B2xspEYvbWu0PwunK/DaSxZ+lpz1GWN5bwHXlSJwaSeVmFzotF3IktG/wtnk790Nsu8ZnTSZHYS9mZlk0Ioo58MpzHKFVdqbcQUu4wNhtO5VB50SpraWCTwrVmccW3jg03QQMf2vkJdRGnLoyims=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tKTq4F0o; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3e4b5aee522so1734861f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409360; x=1758014160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KL9vzdB3rn5rw8BZuNP7vkkI7cxEgPULxm91j0nzvgM=;
        b=tKTq4F0og357Q/mJXQWi14Ypo7+WxyHKu154SFIzaab37IghP6Af9hySDcxelnyeH3
         +RmlUd1sfNClvc/d1aVNGjsfQOPX2r8KGHfiVhIC1hDI4W+TdjYDI2kEFMimKDYh8SgD
         IciAY+HyM/0RmYiwe7OqzxT9WgHMiU8xtBvl06iKrQ4K8Cd2shmlB1O2yJXhHqsZznv0
         Js6CgqkMwDYG2yP23Qp2T2QhFvW8IiILRDfNH3jVf7rz5+rhwuj7p7+ImsqP24V2hGOD
         XDtStfwgQkc2MnnvKgSBbMRT43a5Muf0qP7uCe4lG0IkIdi7k5ybFBtoyGzyRIekw1IH
         AAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409360; x=1758014160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KL9vzdB3rn5rw8BZuNP7vkkI7cxEgPULxm91j0nzvgM=;
        b=PrfMALFnUDlDJX8Mfrg1pRBan4CvP8l6MPvYS6iCpf1bcdgYFxpJHOI5vZg1/y205F
         6CQI5vbnuRSCI2bh9tTDBURktWxP28z2e+qD1Zwgzr3KKjOl9VaIX4V0T+LiR2LEiCg7
         VzU2y3XJG+d+rkaRLDdjyT5XMEixAo1NH2afdXODedPIc0ngkAAruKgS7OHljrIq2AXz
         zx8CMLBFw7Cwo7RnMTWbpMY6/t0dZB1bpG7Ty4d4ukT73mn8w4eCNb3a/PdT3pXxNwRO
         yZo7duJuZTevOzt+oQYBIqFg/tF9HpXi4pZ8Qc8nIGIozX5hJDLsV8CJl7QXXx2EtzVL
         PaSg==
X-Gm-Message-State: AOJu0Yw4rZ1xY2eTeHn4ECcpOlbiUwD7cSe1E8Bste33T4QDx7Y0Vryq
	a8bEQewU1DX1SpN+uZ8tBwRLYjZK9Mk4gmiWsYnxSmZWA+5Xsg8vN5zEL5qfzcdA5Lw=
X-Gm-Gg: ASbGnctD5I1m0f8ZCrP60oi0Ot++1dftnIGdGW1wbj60Pb0paLJmx2YPdXWRyduartT
	KHldnmXoSz2L4WTXmefxJ+qOrXJ2s5brSPZ6oGQ1RjCTQuLpxX8EK8EQHj6bJUC4dtB+LZVEQl/
	ah+M/hRK4XpUQSou2WL2hC8fIibVez2su145MqYN0f6NMXFTjrZbjyr7RMwc7pYDN4XfUzVhaFs
	evjRRYCMOk3hgk65t9n7mgyqHyKpgtW+WoYtpP1dltazJzVVNRTV+WZJs/ywZn3Ud/SoqnlS6KR
	X+FwGj9j5qDRKROSoaP0rEA+pxb6YNO2jFwXXMVmbDVaZ08WqdOWybaCFpdDrWo2haemDFJWQ2f
	7LK1Lsi9cWU8GCrH0APp7krBlyxWP
X-Google-Smtp-Source: AGHT+IElprL5INRLVNJ+11qN0fy1HYZVdF9Hf2dkjaJyGXUISCK8Dqmmny10BUou6nIZqG3u9n4RWw==
X-Received: by 2002:a5d:5d82:0:b0:3e0:152a:87be with SMTP id ffacd0b85a97d-3e637465896mr7665428f8f.7.1757409360205;
        Tue, 09 Sep 2025 02:16:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:36 +0200
Subject: [PATCH 09/15] gpio: mt7621: use the generic GPIO chip lock for IRQ
 handling
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-9-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
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
 bh=Oz11Eo/choziEy0hLlcQbOcdTEl544VmwNckDeQn6Nk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A56zsdMufj8Pobta094n4YAfVek1kM5dHRc
 3RuFMo6rwSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOQAKCRARpy6gFHHX
 ck/ZD/9kOmHM3sCPOzZ+PtF9D6Vwe/xJuMOGBuy7kR2ISYdA+n+r8GKYNFFP4nYxlpgWmS5AZ4C
 1x73FaP/rL03yvk6FmCRR59qwYYDoXzEvbeFkTQSNWh8LcZqRbR+l+/X5WEU9iRD3ascVlVF2+T
 D/Av/HOzNB0FQAHl8VB+63yHTVFDb2Izvfzk5Pc0f3uqSi6V6pLBst+R3HYv0s2yTQGqFelWKYp
 7raUH5xD0PLH2jiT9I80GASVctUKzPa2att4UUNaUl8t7veUxmRpdS/ZW9G1HwZS2OGvWHgdO8G
 zVARPtwdMr3nnIJL5da+yR38xhYniIU1tzKoYEkiFgZTyPUU/zIERxM9qHxq6oR+diGqaafx0Ma
 GF14s5chu1Di4MmgXJqoMcgeqNr5jWoswrVJLNron55YH+qCfah7n4ggD7plduSdtTvLnqHisYK
 +JXSAFqMchoqJajC2TS/z8xeJQ+2AfOsqKOqWawCCU/YLFPLotCX8UxcpnHeMAvjEaYBIn6Ilyv
 muINEZGvCBa/g8CGMcQzNwC1/x+79zqzAnQuahwXnKcHGzYPYT+8YfySJ6gs44DLHnLg3PXlp4M
 NfNd/bHJRWZIIjENkPi+B2+g6hvot/8XR+7fDQmoM/JaklpmUa2L9WV/IDYk1iWPO9aQ4RwTxUj
 scKngBko4gL2BHA==
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
index ed444cc8bc7c2b921be6588ce850027a2e3088b4..31736f12ca100ef615d4aa4b2c968db6b58ef4e1 100644
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


