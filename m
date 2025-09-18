Return-Path: <linux-gpio+bounces-25860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE65B50EEF
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 09:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC06B1C27D0F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 07:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0124330C37E;
	Wed, 10 Sep 2025 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="falZuiXb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F79030C350
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488385; cv=none; b=EjXC2yac/q7VCgLmF+00ZqwX4LsPDisAEgn0pqpqCvKx5YGL948zefUd9TPmsDk2Un2xjPx+/uOP8I/b298sMCnIXGayYEZ7+wk42aGW1m3yDafk/Ndov30d/IE0lhCjr/5IFIkSjRFogvCuGxDw2r2f4emjqQGqjoJdPCrZMx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488385; c=relaxed/simple;
	bh=wGF1Ft5Th9lWr6LVUh8pQKDzmuomKRBPbMwrlELR5yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iARqrEc11UPv5nVzPW0/IJIkaWtDJWLTXzeeOg9DsCNRHNfG4QZ7SUUgDDfbmYSxezu5m6gTZQ6wFsb31EfyVUKog83w7euxmo9h6E6EWT6rXHFyGnmW2yUlUYG9n2J7sCUmLIhTEZq+kEoNG+ZneA/c29JRqBHKNbDO2Cb/pLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=falZuiXb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3df2f4aedc7so3647297f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488382; x=1758093182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzNPyHa0jkPlsSLca9eNkS1K/hrYwY5/Vqpdrab2tXM=;
        b=falZuiXbL95q2k6I7y80EIKF3SHuM7akQ//QLssW7c0nR0HAa8SAzLxptA1HWDjkHk
         E1RLMdKWo6aGJPCP+C8x4f5JCF09cl3H9A6rl5s0Qlb4Ny4gxJeqPXwkrWbwCu4twwFZ
         VlOd5haCPqxq7nCBsWE4IY8UzApDpT1bOORGqTxfRkDTEIlxixrPkT0DEUUyXV4HrhIE
         DvPh+Jb9Qs++TVMx5aLQxkiXVX6KSpR0vcZMqzOUK7Q8x4qkQUvoMOhW3LeXzA6k27uN
         OuZnHf5HLU/HXm6bac4NEQyToViDl3BiNQUF+vgq3CFdlIPmSa6ucm1yS34m5oOozKZA
         7jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488382; x=1758093182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzNPyHa0jkPlsSLca9eNkS1K/hrYwY5/Vqpdrab2tXM=;
        b=C8Ein/fvqtIqxVWO+WIGdvRVOEuCwPrlZYHjWRXS2O3YTS7/peJl9zBDSg9ugydTbV
         fV+M94h4hjIbgUj1qVMbDdrXi0CnWlq2I23fPiE7w3M5vsF2H92hoV5LqUvbwrinydwp
         YOajwHS6iXAwHLazMEqVkWWnXNb7ND3nLPmR6tZe9tyGOj0hcymUxjxKhfS08sTWsrNg
         Nh+j2QtEpIP0RXa9HY5n64GQItwWUsuikePdoILO2tCSQjoMlrrT7ygnE0P3GQe9AfrD
         4z4jCfMq9xvyjfSANhAL1zCgRgTj08ON1gFEWJJiYyqPNnVeQiK8N7vpctFTOvJ1r+K+
         7/0g==
X-Gm-Message-State: AOJu0YxTYp5zWHmwSU320Dw4MZP/I+SuMOlbSG603v1ua6fqnyexR1ym
	6PwkO9RwvfUc4xdOgP/4Td/tIgbxGR5DZxGa3CI45whZ3IviDxRHxLNSaS1Awa4skNE=
X-Gm-Gg: ASbGncuK2F/wE/bZbjrHkMKN8KN+FfFPHGTnYQDSvEj+lgXLZZ7HUuON9P6kGQ1f+kB
	1PruJ5xuZh01Rc9TU2vEXn7UotvrdGa5XVKN5ENEBtIP6n0VXFLfb7CC3lz5hCrLNKNszgwomKJ
	buTCl+Pqk3qBaVfwYyu9+Rd9kPzNiKvqoKcI7hN/92ovlNd8pWDSrmLUv76OHcz5UV/zu2hrImI
	auew0l2wmpalrIBC31sfPTTGIWRWQFgKzGuJF5vJX6SaNlQ7DLcqjepXXa0m3Ym/ciiWJEAPe7M
	Ji13PQalx+49W6JnfHhv81xu5Kv/5JHJvo0r+iHJ3Pow9h3Uq/gwpN5i0vrnL8XqDq4/ieZpQL1
	M9LRWh8TgYpKLMbo4
X-Google-Smtp-Source: AGHT+IH6hj6uL/adzcwKrLLe4SA0GP0maj4DqTWBN5z6e8LLiMSPzaBwq9uelePGdX1azVmM5KUbVg==
X-Received: by 2002:a05:6000:2f81:b0:3dc:2136:7523 with SMTP id ffacd0b85a97d-3e629f21c5dmr11589105f8f.0.1757488381592;
        Wed, 10 Sep 2025 00:13:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:41 +0200
Subject: [PATCH v2 05/15] gpio: ath79: use the generic GPIO chip lock for
 IRQ handling
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-5-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5449;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bcHa6lqKQlw7+hlZUmJRaNL+C5C3+oP8WjaKrSR1XW4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTt+hUw+YSEHliKosRX9vqPf9bG62Dyu8TzD
 yDJbauawyWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7QAKCRARpy6gFHHX
 cgjbD/9evJ0NuXZ91q3iNSwAVaZeenZlTP+DRb8KXEVzA2NnFZkT8ryykyinuTQapB3BEeeZGR3
 qxtXZA/6Aa4pDEelgXa3R5Slud4ALMe3DBM2spLa9bMNR8bEc+SkzdweAWVg/5/HuIQlCRvjrzp
 1W+XtLhnlMW90K6N9Vo7rfBPUFPDHdkAtTU0zU+qkQ4zruXg3namoxd3duYVJukP0PHgF24QdAU
 sUIGaZkYHl/kZmbqBezIwHIU9zUYkc27WL7u7NHH6gaSyHYtfoJ86ZfpeZHailkQI2Hg5t1ekWU
 FEgLpZlBHffK7Oz+Wbfy5ZaOzxfGz/bAVBv/IpWxF/enn41DCxojgDhZaHMMopQuZ4m58poNP5b
 bWxCKbkNkwmgAZqEPQUlBfwbx9A2hNsURzqbTZsQLJl90GJVMBc+UsgapW8778L1eSjrlvBUw09
 uS6iEOz10vOAEnW5CVSnDkHqzfQzLQGAl0T+Nq/U+Q8Irt89ovsJB8H9IuoZUtY2bISv5Y88Ggo
 MAiLkIze3BVts7D6rhT4QJ98299QoJZWiIzzBaOej0VZwhe6ybHA1JnYn2Fk8j6ZCxq/k1K3mPs
 ptZnktOpsHmeKaArfUTO6Vgs4M735+b1qARrHUwJr0JPIjP3dyooIOyZqfxNk9l39E44JYFp4D+
 6kAWi8aO6delpRg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver uses its own raw spinlock in interrupt routines while the
generic GPIO chip callbacks use a separate one. This is, of course, racy
so use the fact that the lock in generic GPIO chip is also a raw
spinlock and convert the interrupt handling functions in this module to
using the provided generic GPIO chip locking API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 51 ++++++++++++++++++-----------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 8879f23f1871ed323513082f4d2ebb2c40544cde..2ad9f6ac66362fba8cdab152a2b2c782dddf427c 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -31,7 +31,6 @@
 struct ath79_gpio_ctrl {
 	struct gpio_generic_chip chip;
 	void __iomem *base;
-	raw_spinlock_t lock;
 	unsigned long both_edges;
 };
 
@@ -72,23 +71,22 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
 	gpiochip_enable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
+
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_mask(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
-	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &ctrl->chip)
+		ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
+
 	gpiochip_disable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
 }
 
@@ -96,24 +94,20 @@ static void ath79_gpio_irq_enable(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_disable(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, 0);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static int ath79_gpio_irq_set_type(struct irq_data *data,
@@ -122,7 +116,6 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
 	u32 type = 0, polarity = 0;
-	unsigned long flags;
 	bool disabled;
 
 	switch (flow_type) {
@@ -144,7 +137,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 
 	if (flow_type == IRQ_TYPE_EDGE_BOTH) {
 		ctrl->both_edges |= mask;
@@ -169,8 +162,6 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		ath79_gpio_update_bits(
 			ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-
 	return 0;
 }
 
@@ -192,26 +183,24 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct ath79_gpio_ctrl *ctrl =
 		container_of(gen_gc, struct ath79_gpio_ctrl, chip);
-	unsigned long flags, pending;
+	unsigned long pending;
 	u32 both_edges, state;
 	int irq;
 
 	chained_irq_enter(irqchip, desc);
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &ctrl->chip) {
+		pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
 
-	pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
-
-	/* Update the polarity of the both edges irqs */
-	both_edges = ctrl->both_edges & pending;
-	if (both_edges) {
-		state = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
-		ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_POLARITY,
-				both_edges, ~state);
+		/* Update the polarity of the both edges irqs */
+		both_edges = ctrl->both_edges & pending;
+		if (both_edges) {
+			state = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
+			ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_POLARITY,
+					       both_edges, ~state);
+		}
 	}
 
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-
 	for_each_set_bit(irq, &pending, gc->ngpio)
 		generic_handle_domain_irq(gc->irq.domain, irq);
 
@@ -256,8 +245,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->base))
 		return PTR_ERR(ctrl->base);
 
-	raw_spin_lock_init(&ctrl->lock);
-
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,

-- 
2.48.1


