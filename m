Return-Path: <linux-gpio+bounces-22065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A8AE6666
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D62561927378
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E402C3259;
	Tue, 24 Jun 2025 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uYxezqFK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C42BE7BC
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771670; cv=none; b=PFN1km6qxc66E/yuOPQdUxH5XZ0b5w5C3npZfrhCMZZXcyZLZGKzWA6K0QDoxpSbi19OVJku4EkTGLat07n0sdmV9hcEnWn8pXE1O1q7xzsmoQIwT6sZrXpJehOcRZQtWZYj1NW2y/vYCXvgXRjGCdOrPphnlbVCFKgNFXVO7Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771670; c=relaxed/simple;
	bh=jw3kRlDg4N5j6EotqYiAhFFG8a9W5+jNB4ooxBcHIWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ix1Ys4YgdIz3WsCBCMqOeKZ4X6D2rDT2WcsLdZlE9h1d0C+pWx5lNYEtBDkpBqaLqehgWS18F3sz5Eg6nw6ply8pmquGfMCRTdXNat6hcD+nj7bg5i3EyNwq4js06wQGEAEFeA63KOBQjPff2NAXNts1XO7IFCq7cCWq/ZFJMZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uYxezqFK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso303060f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771666; x=1751376466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPNorcwe09JFFnqM9zhfrsqCB+MgIigFgdvHKE0gwN8=;
        b=uYxezqFKk2Et+JEUYS6Mpt+1HOdJ3k9arJbJARpAoVsN3IA6FuamwQ5LfU5ZGDkgiD
         sEoJh9T88dWzu/HgHZA0hEYd49+9AzhHaiAD0FTav/syhfRb37VD5atc8wHbnQOk/aFg
         v+fjkVvMf+hfrwxF8eu+2h3qq7gOm3Kz7AxbVxWZxTEpBdOyG/8W8aDdCVKLs4K3lJka
         J0iJfWjRuYsMXktN7gvbgG0XrQN4ckjTR834ZLVrzAkd1jMfUjXP/As8/JJtztuQMqC2
         ogyf5NSTehTsiHWjxOyDnnPWsnnKljFNlXgneta4F6kMar2/2s8zOMJN+g/Ce2R6QX8Y
         kg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771666; x=1751376466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPNorcwe09JFFnqM9zhfrsqCB+MgIigFgdvHKE0gwN8=;
        b=ubypUN7HTpwDQDT2E4Qs7hWt2NT3aX315Ww+Tz9xBlqbpez3TxhHHPPGohhheffwaV
         eLdXy6NmpOdqmHitwRsiQbK3XRgYkbdaFw9zfTkKQqsREGlgD2buYongQQxXvlEBQrgW
         GpHT9nuRtVdpFbNpoWQ48ax9Nc1R+edzgNlKJLqaX6P1fYGPogUlPz3pq2PxPyLRjeZp
         d2TH4g1jGI1ukZvsjDtKI3g4NZjgjcbpMqDnzDwmnkdPdIj38XKUpdkoGe4aTJsyjhE/
         tDjBFpsCLvqucE6y41/+/zsQTHIyqLRwPgNBGS4oNCggwWLqauM+G6qMExIaudHAI4JU
         oe6g==
X-Forwarded-Encrypted: i=1; AJvYcCVEwejWsTH0hwU9djNCnotH/rzclflPqWMPR7Xr5+79ALVdMaev9gDfjZuh3cCT/kIzQIlaTvIwnMny@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2YFd4ECbb62rSSKXT1YDJfuu+8hj+NmNkDUs1h64k9AZISH7b
	vG7VNpm4H6ZyciO4ha6CQl+6INPCZF7i9O1BJpWy9xf7n6f49IUl1hZ8KT7TMTfUvPE=
X-Gm-Gg: ASbGncvnmuJ4kEliL79r3Z40iLaIEWMjuGixY2fHS0L58ZyQ/Aa485Na52VtLiF0JO+
	CoFkI+G7c9l+qD9yE/YU4MqBu6mICMiaKHI6RDacrvdarSYB1mBNOoXT/0wFvewo4/f3Xlx3J1w
	t3vBhpzXOv6sx8zi4wPt7fZ83WPFs/6QPLt0wN0DIkgA4opeG8/k/PdLqbDSIMxKV7KR599RNwV
	kn9nrfNO0pNt65M3mYWuXP1tMhoigxlwG/EtOZETnldWn0MDc0oojPE09BJ1p95Mps6E2+qHBK7
	FEX2NSKvg+8j+J+1MWdR5ATQIxk40nI4QsmB7sfdbMMWh7hIJBUDa7k=
X-Google-Smtp-Source: AGHT+IHyyzlTfmHjpkGDCzSsnZ1DoHQG/VRIolDKsd8x7zCVRfvxcc+irt0fOqtYbtA7YWl7zRSnVg==
X-Received: by 2002:a05:6000:2906:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a6d130b3b5mr12981845f8f.26.1750771666426;
        Tue, 24 Jun 2025 06:27:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:35 +0200
Subject: [PATCH 3/8] gpio: mxc: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-3-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4585;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7dNBbQiZPeeOnrumTKTkdU6R2h9p96Y/Z73AlTuG4GA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfMNW+4W6lbQ4TTtSYHD/RiZ11H/66qnWka0
 tZx5c4m6dSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 cuXCD/92dA/AcL/4wIcsvFVT78uku8a94yvgCY8Yfwac7Bg7Ti5G8WOra1iPVj3PzNTYEvdD7N7
 QPpaOllct2qAG9pPQyearqxDiTmgNpH+vwWOBm4YIYcivJ1ivjy+GX7uSmEwsoGKVCnAOvFpcNb
 i5nQUqiFhHfc5qEfJ81SGLRjULjbOcc5W/zSRK2HrMNLRaH2DwxJYsbDb7zDW5Dp8ZTDFvFpTi4
 81OoKTZpPPqPC7XggbAADV5DIo9iLvaUzSIcR8SIAFZXuvtZXNGWzbrB8Bh5/S88mnOQfLaT+NL
 k6Ix9fgF/nWX89Xkc3MGYBnbr3BPIWblsijrf8Tt4Fsw6Mmjrccruqup722XCFIqs4ZVm6DL3ZL
 l+gj3Kg+h8ntt1RmeQvNmnPaMYK8dx3Qew4o5O5dnxfuJ1FVndQjbYh7MDR5lqUufuXlAH+KsqR
 t+aDny8kpkxxhMW78EQEUz8Zys/x1GKMX/Y2VuX4n2OcTSLJPoa4y63x39GqUolcl1/B32qqZBm
 aocA0tDiV+9i2PpRJkq/hZvbC+ZOLswyPjLKypJNlC/venBFAERaOwDFjGxZK/HWcSSV1DtgfsU
 Kg/TodCncoKm/fg0Su07rfoFDOV+Vfptr8hlH41In2UDKWRAHkPKF37WBhAJabiCvvS81XMsmMW
 vBB+Q/5N53fni7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

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


