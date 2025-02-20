Return-Path: <linux-gpio+bounces-16271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C8EA3D5B9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 11:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9FDF174071
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596591F7557;
	Thu, 20 Feb 2025 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hJS9EAFo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFDD1F5429
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045453; cv=none; b=FScKVgdU+EtgtkGKeFfo/vxsFjX/C/J1UlcmVCR0kSeM1b/Tn1C3HbOe/8jUdkV896DieRxq8vdHwMMtG9rWwNIwBzFdJigFv0yy3wLoO6s8tHb7QluoT8Mx+cLJCmKEsxfbU2I2o2xR5G76DO/yhIGDGVbVkJbO7Q+p8pSRMNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045453; c=relaxed/simple;
	bh=NnBp0w2M0mG/BKyGhs8L3ZC35EcY3EHpBmbW/9My7kE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QXz4V6H2AMslupOqOULRJ/9fJYJZgJpV63p62/piij7PUO5DUd31VD6I+jjuGDJbKFo/hQ1kEhO2ibffi2+b5bAyNU1IItJP9A7jCxRQgk7kKkyfCw9VyOZiMEDOsE6ijy4p0l3yiintdl3hWR4GoaAmoZpNlrh47Q7xGlEWxaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hJS9EAFo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so343384f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740045450; x=1740650250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFP3BWLRoarTDuzkFu54gj+7G/B3xWzwQYpBIvwtezE=;
        b=hJS9EAFob9UDnPWThgmkDIfZnqARjfWWBFh94AoyjaLz8gn8JFJRcggneWvvNpn+Vq
         cAhtfGKb+xSdnB2RJDB+Y07es7K7opJZDVmBQyrt1hN9VbZnZFyqd+xGLCRM13+8nHgQ
         MlKId7iSomwPILzJ4L/pJC57j7P6idogtHf20FEbAbSEZ1A/AXs63BCUot3MDitfJP4y
         pAE749gMTvz0yC1hPcQn2Z02Pcp+8reIDAh6Wn8LeFZYEqJDBOMpNZ89+37gAk0Pg06z
         b6RUme4MkN0TREOmGwuTvB4M/0Y1DBRGKNeLEhIMvO3WPi1s92w33hjv41yA5sIIzDpu
         zFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740045450; x=1740650250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFP3BWLRoarTDuzkFu54gj+7G/B3xWzwQYpBIvwtezE=;
        b=vK+P/Yr3X7Ww9dTxzOG9yRyPEqoH8IOq7jmj80gXgT5ViAHyqqmf8ekimkoqyehMLx
         9TsF/nvSg8M225YYSZ7yZ9KC1pPWdE8oRO9ln/vdWrGsZB7PGwpxGF7Cak6GYMwtAtBr
         r5a5WI1rvytpX884NEy4PX67rFygs8SBuZoPOzwmJ+wcI0CA28JgfUpiJEVS97JLZfXJ
         5U56crN73SwZIiCwwqS9wqItUCB2intgI7txyUIQGXj4VuJ5IA4Mkn5rcyPA6ytexb4/
         xrJZlolOzO8KBuhj2NG6jHxbkFw30kqPxG5AakNwZcWNBqhPl4BpqhyoyHSq9Z5iyzkn
         P3Fg==
X-Gm-Message-State: AOJu0YzJt9ykhO0uxC7jKdBgF5stgHeFGNMffbhVAFy9v9eDj+JmQoDt
	R1Ty92GpZXb+M9JIH4WWvcsZ6J8ckpGWeTysZKQ8t887PvTw0vlrO9Fsll32+9c=
X-Gm-Gg: ASbGncsXzrNpbMyH6k346qEIqNhbuGoZO+/JQVXLWLHj5gOh6cy5tJ/rc5xmtIJPvpb
	5muPGoZGjAnyGjzjio4xHvDUAH2jWnalK8FfEjpKm3v9KMicTBpP/k+xv8SawVhfZPnqQMbbNSa
	GDsmTskjKlVrfn2SrPR6ryNCE4rmMMuYK38dCKCY0127kpZCo0X+bgoi3JoPM+VHDL5sYlAR5CX
	nNaNcgPlDT0U7TZmNQY19UpivU+J6hiIMLdrhqpqauYr6jpzdlvQzPBi7pYoyBfYg1JkJOa0ksS
	SZLtHDM=
X-Google-Smtp-Source: AGHT+IE7LTypG/R5CN/TOyG8sAm7zEA+o+H1HuE4eBAXwnbyVrvVBKMEJ+Ek6z9WOj0N2K/PYrT7oQ==
X-Received: by 2002:a05:6000:1888:b0:38f:2403:8e98 with SMTP id ffacd0b85a97d-38f5878e43amr6319178f8f.20.1740045448193;
        Thu, 20 Feb 2025 01:57:28 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e2e4:418d:7462:9cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm20509174f8f.64.2025.02.20.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:57:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 10:57:10 +0100
Subject: [PATCH v2 13/15] gpio: latch: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-gpio-set-retval-v2-13-bc4cfd38dae3@linaro.org>
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
In-Reply-To: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3181;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ukn05BqACGwwwWlKrdsOqwNXe7CEYNGDC4sytyH/SQg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBntvx5ueiRKxKTIQAcW2Tr6mLrD6qXtYhcR1u5k
 XFRSkPV7HaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ7b8eQAKCRARpy6gFHHX
 cpCuEACVbwS5t2klGPSt1+JkfEwzGorD77BmVXhLCWRBp2jHj3eaLTOwFnRFJ+nbhOlo8EMbUF4
 CzMeo8IyJLaRY+286RSh84pQRfc/uHyL5O4Ne7gWw3m0Dl2jz25DHX3N/+ZhUkiBCt5YX6AptY1
 0z22+ObBU2GJ+7Z18U3Sa2oi76gvU6isDvkS2L3NXWEi+iCpMt9a18Geutk9bDLaGQ9q55IRuAN
 590AhgySSkN72x2Iv8+AahcNOy+rgbrdDMAquN/ULZRTe+cquDy3tyvFm9xtUyp3/oMQRB4fMz5
 i0pwWDi++4OhV1wWxisQiHqd6e/vNj4ceCGixC20sR+CbHdiRZckFTVD3dh/ynEO9vRcd/w16za
 SmNdmEgheWuWg2uNaHj/tPnftRGx3oBXAZ7AAxO9GBePUkobbTUuoRoDIxECpLMZW/Irb1eJA14
 FlFe1zkaLtuWMTEzdOlBG+mDC0oSTSFLe+/PhLKhiWyZYEDlbPP2UsosD4MI0ZdfZcdKF4eElQr
 AM+hPmcCMXFCy0R4A+vhGjDQoNnoYhvr6+hCZGQO8TmLFdMinTMiipJh5OHCL88Ei4hewO1RRp9
 QqqY01vdjNpbQHaEoAAoVZ9sjAezt2ktsN09+0jvBiCTxMXZR6LGYA3tM6gOlqei0uhs4sy7Erf
 gGhtXGADDS8VSOg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-latch.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-latch.c b/drivers/gpio/gpio-latch.c
index f227966c50d5..3d0ff09284fb 100644
--- a/drivers/gpio/gpio-latch.c
+++ b/drivers/gpio/gpio-latch.c
@@ -73,41 +73,46 @@ static int gpio_latch_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static void gpio_latch_set_unlocked(struct gpio_latch_priv *priv,
-				    int (*set)(struct gpio_desc *desc, int value),
-				    unsigned int offset, bool val)
+static int gpio_latch_set_unlocked(struct gpio_latch_priv *priv,
+				   int (*set)(struct gpio_desc *desc, int value),
+				   unsigned int offset, bool val)
 {
-	int latch = offset / priv->n_latched_gpios;
-	int i;
+	int latch = offset / priv->n_latched_gpios, i, ret;
 
 	assign_bit(offset, priv->shadow, val);
 
-	for (i = 0; i < priv->n_latched_gpios; i++)
-		set(priv->latched_gpios->desc[i],
-		    test_bit(latch * priv->n_latched_gpios + i, priv->shadow));
+	for (i = 0; i < priv->n_latched_gpios; i++) {
+		ret = set(priv->latched_gpios->desc[i],
+			  test_bit(latch * priv->n_latched_gpios + i,
+				   priv->shadow));
+		if (ret)
+			return ret;
+	}
 
 	ndelay(priv->setup_duration_ns);
 	set(priv->clk_gpios->desc[latch], 1);
 	ndelay(priv->clock_duration_ns);
 	set(priv->clk_gpios->desc[latch], 0);
+
+	return 0;
 }
 
-static void gpio_latch_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int gpio_latch_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct gpio_latch_priv *priv = gpiochip_get_data(gc);
 
 	guard(spinlock_irqsave)(&priv->spinlock);
 
-	gpio_latch_set_unlocked(priv, gpiod_set_value, offset, val);
+	return gpio_latch_set_unlocked(priv, gpiod_set_value, offset, val);
 }
 
-static void gpio_latch_set_can_sleep(struct gpio_chip *gc, unsigned int offset, int val)
+static int gpio_latch_set_can_sleep(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct gpio_latch_priv *priv = gpiochip_get_data(gc);
 
 	guard(mutex)(&priv->mutex);
 
-	gpio_latch_set_unlocked(priv, gpiod_set_value_cansleep, offset, val);
+	return gpio_latch_set_unlocked(priv, gpiod_set_value_cansleep, offset, val);
 }
 
 static bool gpio_latch_can_sleep(struct gpio_latch_priv *priv, unsigned int n_latches)
@@ -161,11 +166,11 @@ static int gpio_latch_probe(struct platform_device *pdev)
 
 	if (gpio_latch_can_sleep(priv, n_latches)) {
 		priv->gc.can_sleep = true;
-		priv->gc.set = gpio_latch_set_can_sleep;
+		priv->gc.set_rv = gpio_latch_set_can_sleep;
 		mutex_init(&priv->mutex);
 	} else {
 		priv->gc.can_sleep = false;
-		priv->gc.set = gpio_latch_set;
+		priv->gc.set_rv = gpio_latch_set;
 		spin_lock_init(&priv->spinlock);
 	}
 

-- 
2.45.2


