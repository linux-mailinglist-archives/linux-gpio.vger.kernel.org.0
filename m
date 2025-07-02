Return-Path: <linux-gpio+bounces-22594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B860BAF0FD0
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08CCA1C28007
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490CB24EF8C;
	Wed,  2 Jul 2025 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YLM0WY4a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7C724BD04
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448146; cv=none; b=r2TJENEeJFYuz0DW8HwCnJVcjK+9cEuSo8p7foZdOnxdAJoxFtyYx6dfLrJsP+jPAklSwaHpSy+OlEFDDEdVB/GSynb+cDVzxBEQZ1uxppMAODIicwIexQRH7jTvepxiMzgP3ZbvMMmY3Ndox+DI3Vv02A2zzFrocQLrNng2hhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448146; c=relaxed/simple;
	bh=4iVeUyERDDHkTH4ltFoPxFSF2/I8bwoJQ4/oXYA6VM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwZygaoR9qJm/DdgpF8xSmSIA8KCNidINH9tyP/RS7vHMTf6XhXNK2gyJ1bj+arPKqt2l2QedoHNM4tiVn58Mb6Rt9clSCWv1YRd3ItBOg81JWpX+ttStr5uTX/uHcKTa1JQ0QLtS4WCxF9gzprctLLXyvJuzE+U6PenxHcu4iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YLM0WY4a; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d7b50815so31081945e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448142; x=1752052942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ad7oUQvI6PDZjS2O6AwRif7/SXK6hLx/gAToo+NgacI=;
        b=YLM0WY4aHq9ElYF2/W3K9Vujn4Tq6goLKqW341+PNNpXvegHmTzt3wAew3YsuIzQcC
         YaS78p3H0u9jjiSveuQ+HCfSGeEA3hzONtkeZxhlDt/h3aWgx2iL9DPeIs+5+Ma3wx72
         gOhrr4XSfWof9m0DmxCLPmJIEW/jGO18m4bHlitrjUjWrVUUP+dsOT58Qow2wKMXsxc0
         UlWqcG4iYjiJ+dfX5NOEhLx7AVssnXuQU1OHKZCQrx+sbv0KnToRCtFo2YuIW/e41csf
         Tq6fVOUgCT9D0X6uo29f/Ow6zQNXo9u4wmVJ9TkZFIbRIHs71Ol3R7Ymmy7sbqaFZ5q2
         xp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448142; x=1752052942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ad7oUQvI6PDZjS2O6AwRif7/SXK6hLx/gAToo+NgacI=;
        b=TAqeszx/+HLD0GO0RUHHzksSpY2qg5duxVlaVq5Ipp58gLHlc27bSPdUy8nEhPcsEx
         5R2ZT0h4YDw0Hs7gGJS3XGxfy4YB+geZpgkHpEjfqrcczf6lRArXKUZep2JElgAORSW3
         vnw5AZL//2z24UhBbZnN4mJdIuIejRh0t69vcMySZqmSCJl1SY97KWwFUSDnxWmxY+ys
         TextWjROms7q2OVFP50/a8H/QwVnsq2RJj7AjKkRhW4Q1z29Op0BhSt13aYiUqTXPwfL
         wtqYfD2ItphVhv+ppoxkAVYE2FiyqBCb618Ayn/VU1sNdluExD4TuMtgaO5zAx1Q7Djj
         NLSw==
X-Forwarded-Encrypted: i=1; AJvYcCVG64v6JFke1VHC83XITZb68gyzC5D/RHCRwDi4Jj5LP6ACwKFmRPE5hro5RRaVaKaP3+9XjG6MPL34@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6rRcSPcQnw3FGseJ7vACovz0OVPkxb7Ijfcfppzfl8pBNFcCS
	54MJm+CLrArQbKK8/1K9R+Y3XxW0f/qSClL7+Uw89DQ1/TROxBc6iSLwnDDVtX7573o=
X-Gm-Gg: ASbGnctf2p4wRdPHEwrcBolRU3j5krD9A7pWlxXkPilRTHQvTaX6xkTtTVUYzyE7i9O
	G/6ZIWk6ScLWK7TexWq4lLuQJmBlC9X5/e5aaiY/fh0SmWT0g2V5ISISisYX5dqaH7CO4s7KtwX
	nkrMz+TktiajkFFdbMSNh73QhMlFTeseRCIH0IxNd/I/hNTFWChUSIvYv4eU9wedyLTkqCm97Nl
	zNnCxrSiSVe2Q+PrCZ45r6J6TPjIWaGftwv+uRJYiEuDTLr868B3LJkwAOiaXYIJjT5hFmIf0gd
	p1/Besl+UkaOLrIOBYrrnm4pGgm4JxrI0tjTllCNlj+wDm4sq5V0Rw==
X-Google-Smtp-Source: AGHT+IHQETB8lTm9+hLI/dbMN3Wi3OJ6TYb3T/RQNRaI++EeI7AdPVaW+bjvnU39OB/wmNc6zsXphw==
X-Received: by 2002:a05:600c:c110:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-454a37a0c5fmr13465465e9.20.1751448142277;
        Wed, 02 Jul 2025 02:22:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:14 +0200
Subject: [PATCH v2 7/8] gpio: 74xx-mmio: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-7-6b77aab684d8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NelkNx3yrqHzmKm2P1uPmiOUgHjfGOUZnOiW3Ed2H8Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpFMFRjgdJp4gN49lAUNyNScZLj8unAUrqxA
 TlGQdopYPWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RQAKCRARpy6gFHHX
 chISD/0d2nxJ4jqvObUkaYOTAp6yEzU4nhTwpX7uYqr64Dq+PtpZ0mZAFVY/NilwEGkXXfz1CWi
 TUw2BGeG7k10VEtCpBotWOdH6w5cWVIPfvQjh+kQMWL96vEyrzUEcoN4+6iErIQM0Q1L3M4rzVi
 C+jlKTMK80v7u4BJKaP+kuKGsiBH8cvzsER0antU/WZ6WuUXL6keXDYvALIXKhxBqehKtfB0deA
 v0OexUV7IPxSBg98BRmwBjVEWlxD+HvgSEvy9ZBnu1X9u/WAA+aTSjaHLAsi+6k4YdYLjl2gKal
 6612WKkBYi2/cJ22XtHAjknibKyq9wrS7xuQD8V56mLNA7w0iOHcnV93Vs3W9ZMiUL0AoNPKwE9
 m/fR1k3A7kWphQ5Q3VMgqi+aV8zCUXZmMLwfKFv6f32koHxxWKX39CA5LpDyL5IvwOxzm195H+o
 RuW6C10tv+gz0f2TByzxFwk3nn6N45lFQZOhqfQAL8nKCQXLunrRx9Sh/0yWnqPfbIoyywtSZZv
 eI6/gvoqMjywrdrDAlp408zqK35N3ErsruQZXDtdqJzAi9H8Exi9S7kMZ+/g3e1eB24NE59zBfJ
 b7idsPFZpkR7NjLvnhJ1Bed3Gffj4o1ZpAlaOy9bpk1U1l28+laiFglLyJIi3rY1TjUpfHGPeB9
 YGUMmuT8qWsmIOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-74xx-mmio.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 3ba21add3a1c669171578ceaf9cc1728c060d401..bd2cc5f4f851650a499382b050a556506f4c5031 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -8,6 +8,7 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -18,8 +19,8 @@
 #define MMIO_74XX_BIT_CNT(x)	((x) & GENMASK(7, 0))
 
 struct mmio_74xx_gpio_priv {
-	struct gpio_chip	gc;
-	unsigned		flags;
+	struct gpio_generic_chip gen_gc;
+	unsigned int flags;
 };
 
 static const struct of_device_id mmio_74xx_gpio_ids[] = {
@@ -99,16 +100,15 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
 
-	if (priv->flags & MMIO_74XX_DIR_OUT) {
-		gc->set_rv(gc, gpio, val);
-		return 0;
-	}
+	if (priv->flags & MMIO_74XX_DIR_OUT)
+		return gpio_generic_chip_set(&priv->gen_gc, gpio, val);
 
 	return -ENOTSUPP;
 }
 
 static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct mmio_74xx_gpio_priv *priv;
 	void __iomem *dat;
 	int err;
@@ -123,19 +123,21 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dat))
 		return PTR_ERR(dat);
 
-	err = bgpio_init(&priv->gc, &pdev->dev,
-			 DIV_ROUND_UP(MMIO_74XX_BIT_CNT(priv->flags), 8),
-			 dat, NULL, NULL, NULL, NULL, 0);
+	config.dev = &pdev->dev;
+	config.sz = DIV_ROUND_UP(MMIO_74XX_BIT_CNT(priv->flags), 8);
+	config.dat = dat;
+
+	err = gpio_generic_chip_init(&priv->gen_gc, &config);
 	if (err)
 		return err;
 
-	priv->gc.direction_input = mmio_74xx_dir_in;
-	priv->gc.direction_output = mmio_74xx_dir_out;
-	priv->gc.get_direction = mmio_74xx_get_direction;
-	priv->gc.ngpio = MMIO_74XX_BIT_CNT(priv->flags);
-	priv->gc.owner = THIS_MODULE;
+	priv->gen_gc.gc.direction_input = mmio_74xx_dir_in;
+	priv->gen_gc.gc.direction_output = mmio_74xx_dir_out;
+	priv->gen_gc.gc.get_direction = mmio_74xx_get_direction;
+	priv->gen_gc.gc.ngpio = MMIO_74XX_BIT_CNT(priv->flags);
+	priv->gen_gc.gc.owner = THIS_MODULE;
 
-	return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
+	return devm_gpiochip_add_data(&pdev->dev, &priv->gen_gc.gc, priv);
 }
 
 static struct platform_driver mmio_74xx_gpio_driver = {

-- 
2.48.1


