Return-Path: <linux-gpio+bounces-23284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F91CB054A7
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 10:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEAFD188F405
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 08:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005052D1913;
	Tue, 15 Jul 2025 08:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0h5qDbuw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0AD275B17
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567598; cv=none; b=lp8qamFWWBqD4y3ORo3+AIaZhd0EjfUeIQTIJaDKqaOXGZdzGHNcvm1KJjD2lImH3sgpT7qpZwTBD01vgrcFtLorGlhk/BGdNTzXEWela+hTYGYhgBHzUSxbCjQ/OFTrPnAbTXJrFX/ll4XvInS96Ep6cCqx5t9CItcJQM5k8zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567598; c=relaxed/simple;
	bh=UDpK1+HIGJbuxFFSpr/KJZPMvZcS03ihC62nXSk/tK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qijkpgB/RVVExU1+9cyxU6sjWpoh34umxuGJuUm/LLRBx5NI6Q6YlY+SYc5pcLxh8zNBnhZmc6+FpX6te6NXb5ioI7j7CBCEoPRiM58WhBuhtw09lX3HbXpsSDPfrywYWQWBfI9SRAIn3vuKlTU/Ln1cD6unejkr1bcCz6/IyVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0h5qDbuw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so16062585e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752567595; x=1753172395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFnnyTfsIXQpJhF+/WGQapUuTCZXSiHk8q2X23fZOlU=;
        b=0h5qDbuwKLTr66xNY6499iYxiBcs5SED63hrfO29Oum9Jk0EnQVmBJgxXv//P7iyYJ
         dpEpLEWDOHvzmSj7rEGfqyf5sSEnjsHj3CEzSf4s3qVoIV5Zg4wSwsSVne7+C+oXPsTX
         dsBYEZtLrblXAgp+G1IfuHoR8LIkZ3/uc7csupHcf1rUrn9ffIiEx2oOodTxzfSPiKHi
         gHI4GTRMEX+32R23f/4BwW6yscD8q3On+TqxaiF1S6Q6QFYY2GBKWkxOfDb3HSDIrZAG
         hzIR+3YXMHdaapauE+PEhYNbu70YQVCcc+fZTM6t4XLEvzHsemmCl5XIjfs2fHuY6Vjn
         jaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567595; x=1753172395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFnnyTfsIXQpJhF+/WGQapUuTCZXSiHk8q2X23fZOlU=;
        b=j3AxPuCU2F+7rkcItJJu0Idn3KcCpDBz9g6X2eG1xMz+Uh3xd9s48hOnfu9bK9zMbs
         VKcNq04jKLJLlMW/Drk0Ge66wWv7G9wJF5LeQmphVFm/sXEWRLnjo1Bdb29WjI6AAmGZ
         oZ9Lm7nlbM3ofPBSulmZp78hxm0AmF4ZIChVgBmG+KPrumvR+r07ovjaqqqx/dltHxIj
         Oh3YZnk+Tui4f5UJxr2XuXYAuHHUjFA5mtmqK0Id8ciYP5nSff4tWZ8lJ3OLtifFN95c
         /OB/fib98tVOKtb15FyhdLmFVAbQyjSrhe8jASWLyYLA7nz/2PVMyawos4dnpeZ0g3mM
         /Kxw==
X-Gm-Message-State: AOJu0YwQVpgsildDSDeKmfaHBJnPikswyntWP3DsR4TYaH+Kd8pmQIIB
	D2plHBy+pzRdEFuyBFwqNcd1DdLiADOEiR4aWejKmYaQwQBJfynPPO1P+isOvEyB/pQ=
X-Gm-Gg: ASbGnctPhadbdaCk4nSIs7UmCOGixT4LXK3BNT1CBjYB8NnLCx6QasUDVU0Q50uo6Lb
	MpHySrf9eoEHzBchVjLfcBgPrnjwxrbmzczJ7Uq5f+0U4dr4U/U6fQafHHrjO8ruLuQF8jhE9Vo
	vENG97JGleQjXe4e66CNwxafxc1fx9KzTXRF1uk2LldrF1eZxYsPp4/FOD+Pn/d5r+e16eb/E70
	hwmwVB3sHQk8oaC1bQYYHPuEjnyCcZetExY6d0MmISb3Ww1XIj1FGn8N/ftmoL2PnAGFJ5qR5ui
	raU+fZGIJU52ME2tg1deY13nbn3AXx9jpx0rn2etckhseuslaM5OB1XoP8XQOuSy1+kzL9crypq
	FcTuWkRI2uQ61/3K+gFlzYKcM4hc=
X-Google-Smtp-Source: AGHT+IE5CxSoPEz79M3b2KsWjJiw0uzjukQ0YP919W2/8RkiUkIdp8+Z/9VGZ+bFdhXZq+DK5qs1xA==
X-Received: by 2002:a05:600c:4ecf:b0:456:24aa:958e with SMTP id 5b1f17b1804b1-45624aa9786mr31613475e9.0.1752567595198;
        Tue, 15 Jul 2025 01:19:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5631:db97:f06d:3c45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1de0sm14334589f8f.24.2025.07.15.01.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:19:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Jul 2025 10:19:45 +0200
Subject: [PATCH v2 2/2] gpio: wcove: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-gpiochip-set-rv-gpio-remaining-v2-2-072b4cf06330@linaro.org>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
In-Reply-To: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=z2UHcP7yBHuV8GRZRJsQoBcY/v7e8il86W/BXroX7Y0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBodg8nFBlshsE7nY3S8PAEF/CXu7BeLsjIPJYtb
 4REQY135GOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaHYPJwAKCRARpy6gFHHX
 ckkED/9pBgqbllDUrAo09NJa8jA5HnKqg4PGJgMgpdgJJvmOgF+LHMgHEtnWdtTUXATKzuUNQtI
 Mj1bDWKIKcJffkdYnkFTJ4zgmK6I9gJAWMH8+sILozHX/EMsRnnLhcEcXJOcLHOo+BNpAIJ/t5+
 KpSQwT2/Q/FzsvjDTBo65Ys33ferUWzNggsXT6DWIhDLTCNKS7pImS8ovYnE7nBuN2TVytI6kte
 CtUV/BSzebhvKPQ6Fof3639P+uP+/yd88jMEn6KLTPltAizbBO/WssixIFuCSl5csX1qQR1U5Us
 8Ch6GvvOl/9tie0kmAGtWtUnJevLiVIZ9/CWp4miMEFzEcAlGDxvbHIre3DN3/60gs/Ub2se21g
 qro4ppYi3ZOgI8zS861hV0MvNqRTro+9TWqt5Dou2raa8pPmdXryQKFZygBkL9r3QDgGBCwYATj
 bmdT6/4IAUKQkK++zSvPiOItckNebbinKD/z2m9jPwMXCrRm2sf6HtUQ+XDWba16AkFFNXStz3u
 fnrHD+sF5NJXj8wBk36FUEa8OCHxxaEL/+KG0v/+e6s9odmOkN8NAJW/EMwZ5buiHGpsMYqhTpc
 y2PuwGRtEolF7gYNUznK3gizd/dC0tpE5g5vtl5fyAR5uEHfpEXEJboOQEI7dgA4hRmRLKtbN/4
 4vw4SgCt4dkDX2g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wcove.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 816fb8d113e66b27070f286755f3192b2a8f8512..f7df3d5fc71c17fcd1050afdad4187d69dc99012 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -200,15 +200,15 @@ static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return val & 0x1;
 }
 
-static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
 	int reg = to_reg(gpio, CTRL_OUT);
 
 	if (reg < 0)
-		return;
+		return 0;
 
-	regmap_assign_bits(wg->regmap, reg, 1, value);
+	return regmap_assign_bits(wg->regmap, reg, 1, value);
 }
 
 static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
@@ -439,7 +439,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	wg->chip.direction_output = wcove_gpio_dir_out;
 	wg->chip.get_direction = wcove_gpio_get_direction;
 	wg->chip.get = wcove_gpio_get;
-	wg->chip.set = wcove_gpio_set;
+	wg->chip.set_rv = wcove_gpio_set;
 	wg->chip.set_config = wcove_gpio_set_config;
 	wg->chip.base = -1;
 	wg->chip.ngpio = WCOVE_VGPIO_NUM;

-- 
2.48.1


