Return-Path: <linux-gpio+bounces-22589-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F700AF0FC7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132B01C27C48
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6943C246778;
	Wed,  2 Jul 2025 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n5cddyhx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66841246773
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448141; cv=none; b=KKcaHBzv0F4S2cAzB+ldQSSlWEaViqk2HY6JKTjnc5yXeQa/UrKsq6X0vY4YkcjKCD0abbFjDr7B3gPeqvO0W5nrTKDyt/A/rQ9ikv8gQGb1kB9k3m/mscUBIgIIv+kLSwGRztkwxDMnOHzy2Mcda4BO+b16FWkVpccf94mFPSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448141; c=relaxed/simple;
	bh=0wJ3VYCq+XU4SPkOteN5MXhoBb6WcYnpfBxrVLUCSwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8a2s4FEEQJWBx2ee4r2k3GZmzV91k0jiMNKgJwoowKgw+5bPf1XLB7EHLGfbNF9l1RO57W0yXA4hpKQZhuKqqd3aUl007ymMa3jZkNqAaB24sKPwUSg9c2sOstW9V1DLntvRjefS/qOfXKo5VXJcMwujih7fFqYWm5+gkm+SPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n5cddyhx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4530921461aso43408625e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448137; x=1752052937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4u+FthQDNPLWdi1PhhMWVGkiqdk0HXsbN17pTQh9z8=;
        b=n5cddyhxXJg1pY4otvSoqJlP79MHBHUc+VJDcxfZty3Ugv9R1UAy6VfrISEU9rkBXO
         5QgBpYnXFv+EhrZWnhGa/yXQXqktnBd+HqKVFLITQnsgKA3J+KLhlv7+jU6cJaJVICCx
         TZ02YFUXAGQB9h7nEhZJr0hJkxcUEO54zApLzxaQBKJYoEdU4wGn/Y7zAsE3s0VP1KDb
         n6bA41bil4XfwkfflHRojrbLq24svB/L/y6DppHtgLCZlQ9reX/60PvJhXaODdfxsiTq
         zY91QRtCJzFFnTAM1rl0T4y2OjDEqilQoiDfThRaSBVzdaQ4PCP0yRcB6p29EJlTIC5n
         bp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448137; x=1752052937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4u+FthQDNPLWdi1PhhMWVGkiqdk0HXsbN17pTQh9z8=;
        b=m+Ek96I7xwsHOSniCM/f92X/xpucWRvrsaCZexIOOMq4doJH3A7v5fUcg+697odNvB
         H6BPVMBNEUwSp96s7v0y5LBBGoYh6h+/sLk1WRoQV9kPqq1hazCRRQNCqwDYdaTA25gH
         AbIvZAdCoeaU6lv+tsZdaqWhtRgPANBjblsQrCZwnq9ONPbD30k9ZEfExqCCyC1dLR7m
         zhYmVHvZS5OBED/ih3VENlpa6uWwc3UIGIEZz/NqCeFPIhbYX9fauDjZymHaJNJl97bB
         cBVaRBPmJueuXJPYwnjHCAZCXBlM7ZcmxSnq56k1q2pJ8W2JmsoQfqX48KBDQUqDWnNE
         Mudw==
X-Forwarded-Encrypted: i=1; AJvYcCXgrEYXNoCQlYSkxvel9xBzUZTiYDXQAq32OENZgMv+C7+wdMwdHt++48CJ2mz44Eba/3ulTWqFjXp9@vger.kernel.org
X-Gm-Message-State: AOJu0YwcJ+GBZ7DLt0/q4HxpX2i6tRiT5CFwTf5RsBoWBUp8JLZ1lf4/
	dDj9i/tINOKb9nWfpkV6lkka+2u2JMe6ENqR8+ZA8NHhmErEi3p53U5p74Fm214q+Tk=
X-Gm-Gg: ASbGnctzEpFSZP8cHliFDOMcKwydZVm2GMbr3eJ6tUzXOlE/FQf/9+3x7A0IYN8QkPh
	2SiunbVD5z0iG/1+QBgYP+ZfzBWCN0diGHR2o9d/0RsXG/pemw0HdZ5fT8gybzrHcAR3mrVdTFX
	3esx8KTfnNg598q2T7HpYlj2T3L5PQn1okuN4YVVe5QI8TV330YodQphgu5PLvdGX9x/BcHik9P
	hWiblmWQaX7MJHAE/bVnLxsM4Z5oLeFK2A8WSU8tClwKuTalvWS30EbDL39O4Gc8j71VbnKMR82
	iJTTuE4OtQr7NziXO7ffeI5rCk/Jkz1suXRzst9WERgtd6wl2SIBAw20xsDHwIX+
X-Google-Smtp-Source: AGHT+IHbZgnhQJE6hWX8QzU1x6mPMLzGFrm4P9DO+m2Xac8J6ESQfWF51nMTQk2usCHmJA4Ncp1IXw==
X-Received: by 2002:a05:600c:a406:b0:453:7bd:2e30 with SMTP id 5b1f17b1804b1-454a3a71785mr17378425e9.29.1751448136731;
        Wed, 02 Jul 2025 02:22:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:09 +0200
Subject: [PATCH v2 2/8] gpio: mxc: use lock guards for the generic GPIO
 chip lock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-2-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3424;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Nhj40fNUX1gi865SKkLYi1vu0OSypgr5Gc9r4LLn2tA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEIGYyx51RBbJ7CzXYFDk/AnkSqzP89dgF6
 L+qchczKKqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 ctL5EADLxOrAEbJSR2Mh80T7Iol3UM1Tdb2AzV5BYhIuzDVEVU7rCgP67SqvrsxLrxDqmIuiL2X
 k22Frcv6RN+XT3rCdfvh8Hkx+TqVkbaAKstzQEkhjFfRe0Z9VJb+R+ql5yd3P3LMQ8hULvdLQHk
 GeQAmaVdeErjT6xzypPJCvsFUS45oUUDQAHlpb4f0EpdVZ6n5r0MtKOJimTPlLSht2YpsODgw4+
 2juaSesJUw5aQXC2Q4fDcjsJarDAZ94aV0QXwJ+x/YFFrQ5/l9ydKgIpBG5iOjFQwqJgqwfJfoG
 M9Pcem2Sz2oTsqCd2qw1eu1kwqZS7EMa+PI6/IHT8dCViyKfTeTU0CAogktbHEc7PK4CNvlJTEf
 IwoJfpM93dcMzElNW57kvB/gJ3NySccCpQEuCrLcrIlP9J1/9n26ugjx97o/Jkr0/iK2p0346Z0
 vMOegy+lHXFjXBrWr9roJpgS6ZAdGmLIfW18LppeFkXAv/lFw1TolYE1FduuKS0YASPNUqn6xRX
 aV0SxpQotRROjkTa34UzpE+zisA06RWWD/Cpf20Sa5kzSUPv0fL3FEf5OOMYvUlPHPd/gKIMyZ7
 7DhDoTCSUfmTf2NlEXl8z1fU4VzSMMAGjfGf6wAiPiwF4waMfPjdZ8E+DrIX7boD38Gwqyit8AL
 /h1jeFyl1o/LiyQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards for the bgpio_lock.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 4af5a2972d12f68909dd87d9396921c80445f87c..1c37168c8d0a657d7f93067d9ac95cfbd821f757 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -161,7 +162,6 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	unsigned long flags;
 	u32 bit, val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
@@ -200,41 +200,38 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &port->gc.bgpio_lock) {
+		if (GPIO_EDGE_SEL >= 0) {
+			val = readl(port->base + GPIO_EDGE_SEL);
+			if (edge == GPIO_INT_BOTH_EDGES)
+				writel(val | (1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+			else
+				writel(val & ~(1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+		}
 
-	if (GPIO_EDGE_SEL >= 0) {
-		val = readl(port->base + GPIO_EDGE_SEL);
-		if (edge == GPIO_INT_BOTH_EDGES)
-			writel(val | (1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
-		else
-			writel(val & ~(1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
+		if (edge != GPIO_INT_BOTH_EDGES) {
+			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
+			bit = gpio_idx & 0xf;
+			val = readl(reg) & ~(0x3 << (bit << 1));
+			writel(val | (edge << (bit << 1)), reg);
+		}
+
+		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		port->pad_type[gpio_idx] = type;
 	}
 
-	if (edge != GPIO_INT_BOTH_EDGES) {
-		reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-		bit = gpio_idx & 0xf;
-		val = readl(reg) & ~(0x3 << (bit << 1));
-		writel(val | (edge << (bit << 1)), reg);
-	}
-
-	writel(1 << gpio_idx, port->base + GPIO_ISR);
-	port->pad_type[gpio_idx] = type;
-
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
-
 	return port->gc.direction_input(&port->gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
 	void __iomem *reg = port->base;
-	unsigned long flags;
 	u32 bit, val;
 	int edge;
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	guard(raw_spinlock_irqsave)(&port->gc.bgpio_lock);
 
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
@@ -250,12 +247,9 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 	} else {
 		pr_err("mxc: invalid configuration for GPIO %d: %x\n",
 		       gpio, edge);
-		goto unlock;
+		return;
 	}
 	writel(val | (edge << (bit << 1)), reg);
-
-unlock:
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.48.1


