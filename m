Return-Path: <linux-gpio+bounces-22590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5429AF0FC9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0216F17E6B1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ECD6247DEA;
	Wed,  2 Jul 2025 09:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FtP6HE4r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DCF245038
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448141; cv=none; b=iU0PS7cRqIGCRN+oT2KQVRZkCyETgHTEwUa8ECDJxKtHvWdjINS4h7igUsPWYabkGlKQh+EfwjcKEjjwPVbsIhD6H5o4xFAtl8eVD+m6M/cUwbsHyrNoHqyBmCmru+TK/O0BIxHgIjjNQb/QKTHRUVZL3RgwBZ4nnFTvJLbrnIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448141; c=relaxed/simple;
	bh=zGHKNbtNrBS41rLCNYxur+PCOJJmaiH5uINBZq1HxL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qufGilq3WzyqpCqydDG+Ngvg9eIpJvWqx3LTEHVm4q67tmozMaUGHFYexj+9uZIr9fsg9hAKsUGd0hViRlBERAyZ841oe1UKj3BaCmaC+OczuZQ18kIo4QqKSJTIm51767hdGg+/3eYyAF4tmuaIOmB8uwCFYQkflMKN4GMrRjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FtP6HE4r; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4530921461aso43408735e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448138; x=1752052938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dp3qpaLxdoL/9VDJ6nL5BaV3W6j7nnnxGCE6fZ2JVIs=;
        b=FtP6HE4rnSaxLqzZzuYG1SVWNtNRpycyaF3AMaHCLdVHVDx9U5Z+aXh1fQ2kcvNL/8
         fCKI5jn/T5HfhScJZPviLcg6M+nq/MeU1le+n/3VJC51WZ2+ikennv/u39ORdkl6yfLW
         SYifRGQRU4x4borSsaUWP1NeTNBcJ6+P/dFjk0mpYeA68QBZDdQY24s81E0CbxunDwnV
         /cmspDmDkUiIgo2xiqkss9icUuMoKbpTHRY2TUPcPa+YMFxKrCHQfZdiulM55mTKqfBz
         eO9vgLSuxfJjEfwQNnLAHPDNP6nQQpJi9GXcS8AKdzsOJQc1KXf8YPFZ3qDnLe+oad6F
         GgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448138; x=1752052938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp3qpaLxdoL/9VDJ6nL5BaV3W6j7nnnxGCE6fZ2JVIs=;
        b=wOvOO/3Krf4toU9sPyqbXNERhAE2tD8K1//r8SssGv3YThqQceIUJVchLOcIgVRCBt
         SIMVEK01N5h25P99bIaH5hbqk8gfkYaWsI3YqHdoyhkL6iOlXPu4CI1BdLJNWDfJHbIs
         qAufbe8K+1Lomas1NKTVW0ajH/bzQZDS42eRe1DURKcld8Aptid4g1gVoKlw2hJURu3X
         TpD32Mx0KJi/nZDAOf9QUk64yUQho/nwyrvEOSeGAAbs05V5T/yRPZve0RY2mUJbHUsK
         2goXYcNwqEfgl1Nn3SBcvJJEzmXiuJ8rgPmATpPFQFayCw9C50WGcf0qu2zVOBri5xDo
         2eFw==
X-Forwarded-Encrypted: i=1; AJvYcCVXJ/J90I5kDDHqLEXl1X7zMu9t6fr8Yi86G5/ajyxWSy8gX/ptRfpx6tDmi594+gzzpr4TMgOwqiqA@vger.kernel.org
X-Gm-Message-State: AOJu0YypgqfgP2SGxKFgvC1BS8yk1XdRsvt8HmND9ZLlRouG3xWIWmfB
	xj9AF0mSQzPUUD54Sziomvsu/PK5Zt8MlryYAjt3Z4KbZ49cd4kzYL0NtQ5LcZAMFpA=
X-Gm-Gg: ASbGncsTNU0frdvDJVExhVo2vUrUXhERhgYp3p+zSr9/hPZKrYoj6/4fmAbSxVldxmm
	8wZzcPfGPYUXFP1L1xQfcHF79s8ZcLPycicmHQVBmUx6g8vTB3TVR7CQWFkLxQbpJbAePpArqnG
	mpnz1vFrdthOOATGSVOUKc2Slhkum4ikfLZz/jImh3barmaaONbx8OUY3+lkjBP1wmZ/KhjNz7K
	3oj+DFlpw1EERUIMeN/7IWGm5UIpCkJ+0hLGnbkS9SzSP9yVnn8TLme9kn+cnXNw8ZIbwZ0Gyds
	xIegDt2FaIGEqjBDpek2nGA4k1+sivh99hpJVLjPNFRFH01DAA695g==
X-Google-Smtp-Source: AGHT+IHjF9A77ATHBE3b9SvMdK9lJT3V87Bih4BU12gvPzJDNkmjN6VHlXOPrM1x33gj1i/Cj7OAEw==
X-Received: by 2002:a05:600c:1d09:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-454a36dc7bemr26756415e9.3.1751448137808;
        Wed, 02 Jul 2025 02:22:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:10 +0200
Subject: [PATCH v2 3/8] gpio: mxc: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-3-6b77aab684d8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4640;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ArrJt1nq0/DyMnLRqYgOtwp6wmTkd8ckjtCqzdNL0po=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEb1a2Iujd3m6Dlq9qCVuQ1Gay7cvpxMQ4G
 8uVzp1zKdCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 coL3EADbnsSHboTOP67UtjJ1KfYAcu2cco3pEtdOD/wcQwvCs1oENdMmSFvj3/vvliHwnUDQoBB
 8d9K803SD2wRFHp8mwhxSTaQs/5KronLBcc0YW0cuf8rLF6ZWJ2L/D4fHLgootUcHEGpFjWpDzM
 AT9HAEa8pch5jvkq1NYCYlwyASLUvtOK/FqXw0Pdq6kpKZJuVBfsbRZC7p1pBQs8h777sqvhTeG
 ZEp6owZnFUs6FMY4CNohTvkIpAtBgOk28droEpctwLgDLm1OEyCGT3KjKhhQSMC62jvonrHj8Hg
 OMSQvXrQ7xSFGaj/pBdarGbtItdoM72Ar8gOqyXiCclxhOlaTEQm1tpIB83LLrOf6u03qOk5R7s
 Biwzu8qoubwnR4G+s8ZQdtYMpWm5TukofpRkhFboE5NZ3ICZ0qqqivzmrl5GiGKFXhRgd2SRM+p
 LJjyeeTgX1fHyD6XwNP8v6x729useTcDxA0m/FAFAArw/9USWIddgzc3wPr7o+CoSXvqI/WL73M
 jVtlyEzryR/+thIAOcyHGvxqZdBA+jofsDudB/SwwJTHIN/OWM/tBhkFOj5PihEJUxIJ0bAlH9S
 uOcujET0gOwaiB4KPVDR4yVbnOFfJfyalXRJ2umXGRW61M4IUDFHA/3/GRlV2GMyKBsxm2CjL6a
 8bhoo/c8RjwdhKQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxc.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 1c37168c8d0a657d7f93067d9ac95cfbd821f757..433cbadc3a4cc67ebc89a4702280975fa8d2c9bc 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -23,6 +23,7 @@
 #include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/of.h>
 #include <linux/bug.h>
 
@@ -65,7 +66,7 @@ struct mxc_gpio_port {
 	int irq_high;
 	void (*mx_irq_handler)(struct irq_desc *desc);
 	struct irq_domain *domain;
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	struct device *dev;
 	u32 both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
@@ -179,7 +180,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		if (GPIO_EDGE_SEL >= 0) {
 			edge = GPIO_INT_BOTH_EDGES;
 		} else {
-			val = port->gc.get(&port->gc, gpio_idx);
+			val = port->gen_gc.gc.get(&port->gen_gc.gc, gpio_idx);
 			if (val) {
 				edge = GPIO_INT_LOW_LEV;
 				pr_debug("mxc: set GPIO %d to low trigger\n", gpio_idx);
@@ -200,7 +201,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
-	scoped_guard(raw_spinlock_irqsave, &port->gc.bgpio_lock) {
+	scoped_guard(gpio_generic_lock_irqsave, &port->gen_gc) {
 		if (GPIO_EDGE_SEL >= 0) {
 			val = readl(port->base + GPIO_EDGE_SEL);
 			if (edge == GPIO_INT_BOTH_EDGES)
@@ -222,7 +223,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		port->pad_type[gpio_idx] = type;
 	}
 
-	return port->gc.direction_input(&port->gc, gpio_idx);
+	return port->gen_gc.gc.direction_input(&port->gen_gc.gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
@@ -231,7 +232,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 	u32 bit, val;
 	int edge;
 
-	guard(raw_spinlock_irqsave)(&port->gc.bgpio_lock);
+	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
 
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
@@ -414,6 +415,7 @@ static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enab
 
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
 	struct mxc_gpio_port *port;
 	int irq_count;
@@ -473,27 +475,31 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
 	mxc_update_irq_chained_handler(port, true);
-	err = bgpio_init(&port->gc, &pdev->dev, 4,
-			 port->base + GPIO_PSR,
-			 port->base + GPIO_DR, NULL,
-			 port->base + GPIO_GDIR, NULL,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+
+	config.dev = &pdev->dev;
+	config.sz = 4;
+	config.dat = port->base + GPIO_PSR;
+	config.set = port->base + GPIO_DR;
+	config.dirout = port->base + GPIO_GDIR;
+	config.flags = BGPIOF_READ_OUTPUT_REG_SET;
+
+	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
 		goto out_bgio;
 
-	port->gc.request = mxc_gpio_request;
-	port->gc.free = mxc_gpio_free;
-	port->gc.to_irq = mxc_gpio_to_irq;
+	port->gen_gc.gc.request = mxc_gpio_request;
+	port->gen_gc.gc.free = mxc_gpio_free;
+	port->gen_gc.gc.to_irq = mxc_gpio_to_irq;
 	/*
 	 * Driver is DT-only, so a fixed base needs only be maintained for legacy
 	 * userspace with sysfs interface.
 	 */
 	if (IS_ENABLED(CONFIG_GPIO_SYSFS))
-		port->gc.base = of_alias_get_id(np, "gpio") * 32;
+		port->gen_gc.gc.base = of_alias_get_id(np, "gpio") * 32;
 	else /* silence boot time warning */
-		port->gc.base = -1;
+		port->gen_gc.gc.base = -1;
 
-	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
+	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
 	if (err)
 		goto out_bgio;
 
@@ -567,7 +573,8 @@ static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
 	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
 	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
 	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
-		return (gpiochip_generic_config(&port->gc, offset, conf) == 0);
+		return (gpiochip_generic_config(&port->gen_gc.gc,
+						offset, conf) == 0);
 
 	return false;
 }

-- 
2.48.1


