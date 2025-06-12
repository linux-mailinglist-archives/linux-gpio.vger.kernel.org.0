Return-Path: <linux-gpio+bounces-21460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21F5AD7189
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8985A16F3A5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA26525BF07;
	Thu, 12 Jun 2025 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="05vyQCUG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A35225B2E4
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734145; cv=none; b=rL49yc6q4MGIh4/rN0nNVB2pUorOWoe8OCfb+X0PR8w8I21Ti0c1bB3Y7QSowf4WMxcJLxwDozZGfZUNtL1iVn8UoEDoVCKZ4+FF4A0XLQenZOdS89q1/4jdQQH+8P6zBLGfKZujrR/DtgiQCoRfsGR8i/LB6SFO55GTrpxTRSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734145; c=relaxed/simple;
	bh=85haVVGK9Bcs+IGMqbyClCBY80jPljKCDJVYKsTGn2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gcosaum5Yy6IxNe5227N8PKzi3hS1+DNJ8uQ9+POc97wx75DKkeIPhYqmK4dj1H1901zlnhkejt4/IYuUsi4sNDdpNgqpw7nm1KeIdegM+Y93tVQ8EI38Z7OjZNS7qzrNWWAlJMuhtcdHVbU2A/KC65GfLoFFuYbePnnzeDv8NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=05vyQCUG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so7994945e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734141; x=1750338941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYW0+B04sInxcyPw7RL4odLCTvi8nL12cX8+rIobfUQ=;
        b=05vyQCUGCyVUL21Q7WB8NDDudjeoEL6HPiqb/WLi3fxYKzlAgD1oo18WLEXLHHDspR
         LhG+QUMzc4BY9LuApIRxlLdZm9q4kol7WjId6pxyo3RGUwmlJH5md4YeZ73J3Ekr+4G/
         bJctj5NWXCC2y8E3V+Ie6u+WHaUEUksofsiGMDpt+cVC/zALChWN+Uqy6Ix2PyBZz/6j
         ORNci8Ax5DWEofd1qKqXvSZ0E5SXtHNQ+tYstx+qjMwx2DMiPepIn1Ep4gUWFP37CpJE
         mrgD0EzbbmTwHwAlvWuLdvvq924d50aueM8AVxYvtU4URBoZPQg1ihpLMmx+5+S2RON2
         pnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734141; x=1750338941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYW0+B04sInxcyPw7RL4odLCTvi8nL12cX8+rIobfUQ=;
        b=jqXnXFcjByPggpUWHYLOtLWZa6BD1g6/E3Luv0fuU1NelvoBmJWHPU/oZNbO0LyAuq
         gola3FxoqKmDgu5vdgM0XiYYw8iut9PKYesED61odsuGxVYXfZJwNnFq8/rv6LzO3RoA
         9v4VjHu5XL+bpja9IUEsSo+MAjlsRUgTSuUryqNvDzMcG+h07L9g1Iz9Hwb8s/ZKaa8/
         jJBp3JtvqGmE6eV/F6wUpHtasOem8HPZideDTg32L/gnjVQkc3J+G0gl5ZGNecXni60H
         shXKwuvXGz/k+15DIgMVuPHgOw892KclIIFKdUmtfHXD7Q/eaJEfqiwNFgnfBkNaxVAu
         gmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNOItr2+qo/bsPPzV+j9qyd8D6Pkamc6i3XA6hOUn8ZdrhwmX6nrX03cdg0kmIjGQwIS6WJlcMpvVH@vger.kernel.org
X-Gm-Message-State: AOJu0YwPCrYZ52TaXQqFNdKJ/vqR2klQy6s5vl198s1YFUkcZZcbpee9
	CLdg5CsO8Tlu30NShujqTlcXCIYXg9W/Ynqr1o9PwRxSeZznRTbdXAIcra9Nk0GKesM=
X-Gm-Gg: ASbGncthW55xrBtW89yA5c56z3RGLu2Iyz+S2IDyAoHdOj2wVgZP3RfyP2VZ93LipaZ
	6n2rSl87m2I5NqxF7q+jcBfd+JqelapPff6xiDU5pWbLaKskcN2imweA3lIWYv+EIpusTdAowqa
	/tOFIbHGQc4RwXzVjUjXXowtd2RZ3MKCcySAZvlLGVO97O6uTaBsReL3gMPwuI1a3ctCZzvKvZb
	JVcHy4y1W65kC3y98C06UqOjfulms95akjExD6/wpzPge2N9ZvN3iFzVn+fJWeNR67Ve05SULwu
	2qF1VMTQd3DuhkDxFlLWN1F9oMiCMyL9vWimLKFlUta05DNGQDcLSs4=
X-Google-Smtp-Source: AGHT+IFpZ9SXfAbcx9UYgsykf4kQVZZ7hDQIXoDecEBolRJ+pnmV+MNhvJktOJmHqFQTsif+GRyCYg==
X-Received: by 2002:a05:600c:3586:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-4532b8c2f2bmr38451605e9.14.1749734141385;
        Thu, 12 Jun 2025 06:15:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:23 +0200
Subject: [PATCH 14/16] pinctrl: sunxi: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-14-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nIb1ERVNbKJsSviHJxgUP0dw0VlXNMpXQSUn3radzBU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLnDirgrB5LayZ6bmpzTb9vnrrWDTKxpwuY6
 6GuRs6+7+OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5wAKCRARpy6gFHHX
 cjGPD/wNvb4j//YoAIysQkS1R/JAVIQzuJnhYsUG1hvGNE0K/Tj2zywZqHvUHGhwy0MMfY4/IPv
 ipPG/UE5TMpaAfnUreWMO+6gxvRyBKLPdnaXZFXBx84htL1YUquIbzHMfT+cuIwtCnRANTxi9So
 I+0/W4Ejq/+fTnRec5gzwllQdA+qwsjIuNLHh2hmROmHFzBhnrngKJdRyiYjB4n08hMg33DyloF
 R+WMLG5USaOhzS/cXh74PjDCSNab71daGuxVVLjx6sNQm+imFmYb4aAZaHP34eGfUMMInd9XzFM
 SSClmvWkl4TCO/CRIH9s2dok8DZbUhgNwR2461FteN5+z4/wJh7owtQ3RtsRJeriFnI6cdJNxiH
 O/cD4XHBvqloqHTCEeD0KHICq0c4Ka6xKLZZaxo1/eJAtBPvQDdS6VXDNjKjxr4hpedktowfEPL
 8dzAoSnwDri+1MvHu82L2GIfD+vUzkRxP8AhYFQlINlgKg+FSNbV8utKdF7Dp/RvA0AyTR5AygF
 CpNuMQSY+P7pgwk41Y9dwdiFlxRy30of81JlYjV6kdmBpB17p+eWnhfObkprJ5ndF6wY7DM75ri
 VViJexUTAn0tAMuSEcLxSC3FqL/JUCBI8vRA1fvCu2BIbzgjhzOLrsorSrBLj10sqL1w8ZimBia
 8eHbwXrot5DU3sQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf8612d72daacdde6209b0b5c84e010ef3b846c9..9a94c5276828aca51212f536400897e447c62ecd 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -955,8 +955,8 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return val;
 }
 
-static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
-				unsigned offset, int value)
+static int sunxi_pinctrl_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				  int value)
 {
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
 	u32 reg, shift, mask, val;
@@ -976,6 +976,8 @@ static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
 	writel(val, pctl->membase + reg);
 
 	raw_spin_unlock_irqrestore(&pctl->lock, flags);
+
+	return 0;
 }
 
 static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
@@ -1597,7 +1599,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
 	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
 	pctl->chip->get = sunxi_pinctrl_gpio_get;
-	pctl->chip->set = sunxi_pinctrl_gpio_set;
+	pctl->chip->set_rv = sunxi_pinctrl_gpio_set;
 	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate;
 	pctl->chip->to_irq = sunxi_pinctrl_gpio_to_irq;
 	pctl->chip->of_gpio_n_cells = 3;

-- 
2.48.1


