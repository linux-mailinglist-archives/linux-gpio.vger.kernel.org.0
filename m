Return-Path: <linux-gpio+bounces-22066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DBAE666B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E5DA1888D07
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096802D0274;
	Tue, 24 Jun 2025 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o8m1EzXp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C52C325B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771671; cv=none; b=SDayNLI/vWpJuDRiCX12r+4XXK1bdfhba0EmmjwYBhGVHtKhQlcGYHDeHG4fToTHfWUUI634OVFhyT1iQh6TnulRzZ9hXnUtHHIhXp8jAdMFtd9j5Zf7wfgaiGqN02Ro5+0c27sHgL4rmxkqrmGTl3o/lboryI7WG8nOtHqFrQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771671; c=relaxed/simple;
	bh=bWZ1u1STZp0yQIfYwwSw+kW7LNE5faGgyfS27qTRHKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=og+nT2uLJ3qjv4VeT/pZxmRQ/Ejr4H8qZ1bI8IHPed8cICeFtbtJk5QiyB+1def4mVXsrII2U+mhQWCEWDBjLLxmNZCiNoDWut3Oys5b/cfJcygba1wQNGn5B5ctAhV2URcWi6HPEOUAdiMNhTWCsM6K+jNXU/G1aP2u+xpK3LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o8m1EzXp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf214200so48093575e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771668; x=1751376468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz5UgUcfJE5/vvcmcGQA+0Z6POYK3b+XtNUBsVCQb4k=;
        b=o8m1EzXpkCG4kM6EvS+bAFLki5QTt6BQE/jVO2LvIRO0bYEzuPIihf3d3dyc+1+CnS
         KogBxaKgmfaCofuJgXKTjd2SZb+fcVkrgHDM84cguhXZexwtw3TqqU3QMkGGHlk0YteW
         im0Te8WcyGNzWJLuQi8XZ3Ax2OEDMD8TKEWFrVTgaxIqcad7J2Pmp+qQfyHAdQdj4TDN
         WG5F6f1xb2qos5gC1acs6NPZ6qGSo7bJbgsGWbpM7XtvJIzGPipl6yKVLKXQ7aVoiLxk
         T67SGdvPaZzXAwsioMqQxe1KWBG0ZKn6laN6kP1YWJMMfPOvMfHn6rzJ2hO442M/DtgZ
         hIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771668; x=1751376468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yz5UgUcfJE5/vvcmcGQA+0Z6POYK3b+XtNUBsVCQb4k=;
        b=fat7hXGIKaOdjIdNziC3GmD2yfIH3R6x5HBjgksk4+aaYjYQqwlO2VYbytpJPS0QZB
         Ue86nE0BoOcVxdh70dw5w+EhLZhh7YN0ZRz59TE2gw/sTfpLrKsyMJXHBGNO9KMlE6nX
         GCRRM2Vao0nkBCN1QwNfOd7okgy8nQTG6Xvr4NSIQbeIkYpU8wBrayHf4uztBnuwl11z
         Yp5Iyewdz2BAtHeCyXDBRNg6gAJR7+i82pDjKzJU4DoqTh2Xr5s++/MtIyqSW2DgT5/P
         Pa1NSV2IU5Fd/Fwe3k2u+gm+iv/sAcYJo5fj5D7ifRHaR4j7bOcsBosQfm/NxB7a7Am7
         YOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWI04gYXx/TsO45NKBpf6seS4tAJ8ysoJNFOYVk9JGGsLPIincDyP4OJViEBxbJdTXVdWJGgHPhJwz@vger.kernel.org
X-Gm-Message-State: AOJu0YyambyO/R9Gq8ebXxmThHyBADpIV/jgqdIgdR9jehMJAakN1R2B
	SE/EvczVXDq+rvbYYdWBtL4YWW+lcuvP7p++KUY8kpkjX2I3nupc7iFFcXSThTrjyFM=
X-Gm-Gg: ASbGncsttJv6YoKJfR2y7q0G4aykfEhfyH9s0xTRu+tDEE5G00Q3QvWJTnJrNUYjvbu
	DSqh1qtBLRb7MDyjI758xpPBN1UZDUtpXmJnIn8ZB2tRaaMk+VVPzh2GyXL8wOCvSNIK24TJd/w
	uLMndczCS7fraEyfSWJhuxn1v8YRfbqTwocy1KStbWKGjW/YvtWtCPbSM8xvCkDWAjU771RrnpA
	NthBQg31/gCGzMzWIXyELGO9njyXFq0VvECtbGC3Nv0c1fkwGYtLToVGAw9H4nSmGghlxj8MjVe
	XxUr759z+MduiGBaolJ46ryWewa23jj1ctlcROdGtatOX6zh6Mmp2K0=
X-Google-Smtp-Source: AGHT+IG/rMIA1tRjVdj3q4SOViQlyMWTekKDIwuSgQnLjsVI8uTdmmUZ8XoTL0DwczoQXfHr+oFANw==
X-Received: by 2002:a05:600c:4fc5:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-453659ee9famr163886375e9.16.1750771667661;
        Tue, 24 Jun 2025 06:27:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:36 +0200
Subject: [PATCH 4/8] gpio: clps711x: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-4-aea12209d258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2507;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OkRIBmYFSPotnoBgPQDP6/8HKcnoOvUDc41iS6fYioA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfMbPu3QHXEoC8paJDXYv/gt/g9kEj7UXkyU
 u/AkDzJ9XyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 cqvQEADRUtAfEOV7Ay2ZXGRBZi9QFKTOR5D69z+0IPw3vm3QCtGQZRlJ8JDtArb68wwxcn8W9Xl
 bhesTMoqW8ZvfiB9SwP1m0/MxRR4ur7gidUJir2mToNygsd2gZVzc1FiqtO7x5me/mGGdmR50jm
 AbhJMd74VIf8ONYDGvoR8+U3eaERIjx+FXy/ejzHQX0UYqSRyDMYYDC5n/Hsr+Su9Yi9R12eaoi
 Hnl8sa1QLcOO5vMmtjPkAQxkW8qKb3j59l7jv5w+6V5I8vlrb+gh5hTTMoIwuPwi79puS9eayf0
 AfL010thQXzq4JCkj3VnOpVabnqPMLND3RChr/ia906jXkX+A7IsE05MJcgrp0/be8cdSsvDcAu
 QrdjcI+YcElqlb0waB/hQvNub7yYf+TOlrKYpalE0O1Pfyc/8OdTWoPbzjQjXGoXHpDZUSxgtN4
 PGDp1IW/2933ZGNBxSqcHVaCIuOVTk5Cd2Su+YrheH83MGWIUgXVnufHgv85OTKuuK4ZTpq6SZ8
 4lI8d3sYUme9PeKZUPwbjh6p/nZGIDS3bpbENzlhuW8kLayIz2Ej4Rxe/fpY+GFgplPQDtJc3mp
 rKv/wXaVXbZGFr3G+dBjmdGrNM4B1oCPPb68byPwhd1GCP0/Z4jbqdK+TXRfwhUuINbZ9BetAMh
 PE1c7oyln4QHdhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-clps711x.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index d69a24dd4828975b4d62f66b011964456976bfa6..397b347ad6e8b036edbfff75b6a31f2170334f66 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -8,13 +8,15 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
 
 static int clps711x_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	struct gpio_generic_chip *gen_gc;
 	void __iomem *dat, *dir;
-	struct gpio_chip *gc;
 	int err, id;
 
 	if (!np)
@@ -24,8 +26,8 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	if ((id < 0) || (id > 4))
 		return -ENODEV;
 
-	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
-	if (!gc)
+	gen_gc = devm_kzalloc(&pdev->dev, sizeof(*gen_gc), GFP_KERNEL);
+	if (!gen_gc)
 		return -ENOMEM;
 
 	dat = devm_platform_ioremap_resource(pdev, 0);
@@ -36,35 +38,38 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dir))
 		return PTR_ERR(dir);
 
+	config.dev = &pdev->dev;
+	config.sz = 1;
+	config.dat = dat;
+
 	switch (id) {
 	case 3:
 		/* PORTD is inverted logic for direction register */
-		err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
-				 NULL, dir, 0);
+		config.dirin = dir;
 		break;
 	default:
-		err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
-				 dir, NULL, 0);
+		config.dirout = dir;
 		break;
 	}
 
+	err = gpio_generic_chip_init(gen_gc, &config);
 	if (err)
 		return err;
 
 	switch (id) {
 	case 4:
 		/* PORTE is 3 lines only */
-		gc->ngpio = 3;
+		gen_gc->gc.ngpio = 3;
 		break;
 	default:
 		break;
 	}
 
-	gc->base = -1;
-	gc->owner = THIS_MODULE;
-	platform_set_drvdata(pdev, gc);
+	gen_gc->gc.base = -1;
+	gen_gc->gc.owner = THIS_MODULE;
+	platform_set_drvdata(pdev, &gen_gc->gc);
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct of_device_id clps711x_gpio_ids[] = {

-- 
2.48.1


