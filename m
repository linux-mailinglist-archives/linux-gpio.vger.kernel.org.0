Return-Path: <linux-gpio+bounces-3077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6F84DD88
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BDE61F2891D
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3AE7316D;
	Thu,  8 Feb 2024 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CeO8e5Gs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC8B6F50E
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386380; cv=none; b=aShquBNqWiRVhVwkyk4WRofInNBs5is+ExpJqCBDb7+D3vliMT8mhfE0qcJ1foM/nW/VKb7SsRW6+3zPM1+c3mhaRHOB0ULBA/m30GbPYoksmfmK7bs8aNaCsVWLtPO83Fd04n3xkvypUOdP7PrwnMqYHFHiTPMZQNHP5EjKN9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386380; c=relaxed/simple;
	bh=44Khv6FYuGS4iTpA4mYtVBSUOUtv1cSVLwwGoaAVCzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZMzFfbaJAIUIVjz7igbyrWLsglddLt07kqaRpcuSSwloLrNoHoOKisC40gI+Yk58KR73Xl2xtw0cXRpQ+qgjCflsRFFJXLeduE9Yl79Gw+VumOsSuuu7I0T2RmhPjjU40rO/aYky8cr2w+IRtJDLYgdgF3TgdTKsY/vK2u075Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CeO8e5Gs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33b58ddefd3so285526f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707386377; x=1707991177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDH9FjcEQjELl5YLDi/Mv6f4/sVoNw9s95JjQsJXfFU=;
        b=CeO8e5GstTxMGUOLdzSfOQiUUopuo7gqO519aKHVbA+HzDDtzMlm/SDx3YMpFe6xYT
         Fpn2Pwat2iAaaTYZH4lj/hZY8DE8+ZyA9wbqXNWi6VSr2cbT/Q+DDjEjhF7E3h7UEz+W
         FkvFTMZeB53BL8uQzokgQtLUauLB7DeehEhPAgDZJ4oczK5uOkjT5aNyJDRWNpZdRUP1
         nBUExk5TDkylBXU53SuqGXUU5OolxtGhCzH3IBJabzu2qUy/ee32tsURcrdWgkk3SsF0
         iD1XH5/5Sf5MKTGNv+tgEfeXAYQae5IJ8j8srfDOS0ftaVkmYUuQLv5lz/F+gMI4zX9H
         GgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707386377; x=1707991177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDH9FjcEQjELl5YLDi/Mv6f4/sVoNw9s95JjQsJXfFU=;
        b=UjhggGnDrinUUMLPFUnnQo2XIjet5UC1n0AHAozy1SO+re6UKrlQHuASRTjJWPEWuT
         kuuvFe6KJ3jvvxK1GLnXa/4YIKdDZmi6I/QaFuhpVIv9mmMQekgO9I89keABP178/Mnx
         ulS6BhAa9HT2FknNfZGGgrIkzWVXcZXseBm2oHgHiZQE3uxCiPhFbV6BD4t1UFeKeIhk
         iv+e1SQUoSVCSG/T5ZZZqs55m72OVAGjQMAaKB375O/VHxBbIYkg6YkgHJ4cNPMVaJPd
         U1CTjDaIdw2ByGfhXBFoU56firTUYXGGIpWi4fl6bi3jIUI70D3euGVbjDXhGKQbARZc
         EDhA==
X-Gm-Message-State: AOJu0YzKmsm+C6Qt1a7i89EsfSh8WYYCfQJN2TwSXgHul0qs/e2fEJg0
	xrsnaAh98oHvDAGCPbRHMuiD2BnBE1ILQihvVJcrSxrLFjbFVGCVlK4PWMAA+AM=
X-Google-Smtp-Source: AGHT+IHJPGmnwEdCYIiqnvuMa3t/IOLS1maS1ioSsM1EpsF7be0KRjYGP2fIM9FXq373ezuSkLBcjg==
X-Received: by 2002:a05:6000:1246:b0:33b:2fba:1eab with SMTP id j6-20020a056000124600b0033b2fba1eabmr4879005wrx.30.1707386377087;
        Thu, 08 Feb 2024 01:59:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXq7h4bUJb5LA5R2LqcyELd/oIeGfFD2bNctDA2TxzEqtFJBWk+P0wU6OZJVnPvgbai7uKrmYFQJSLqXEGY8CJYRCtr9JwUu5SJWW8dppJDNLwOycExWIPo9jzONi7Zug/weFuuzjkFJGXxeFOB8h0nP7E4GsTu0eaEjEEoryvy0aoN+PhrkweLHW5at77c49Tmqn72lILU4D0+K6zmllrGbfdn/kp3co4XPTL5C1JLG6B0z0ckw9R49y5rw3mM6O0CikB6dXtYKOHEB6dg6r/sibA9U4tL8ZHkrkUml969HJA5uGDVqudw+OWwxTDEtg5fmzcuWzSSY8xmyYJyc0fTlgo76fxepw==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:44bd:e160:131:19a4])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d60d1000000b0033af5086c2dsm3265963wrt.58.2024.02.08.01.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:59:36 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 11/24] gpio: remove unneeded code from gpio_device_get_desc()
Date: Thu,  8 Feb 2024 10:59:07 +0100
Message-Id: <20240208095920.8035-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208095920.8035-1-brgl@bgdev.pl>
References: <20240208095920.8035-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The GPIO chip pointer is unused. Let's remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5e098a7816bd..939ae167244c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -184,16 +184,6 @@ EXPORT_SYMBOL_GPL(gpiochip_get_desc);
 struct gpio_desc *
 gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum)
 {
-	struct gpio_chip *gc;
-
-	/*
-	 * FIXME: This will be locked once we protect gdev->chip everywhere
-	 * with SRCU.
-	 */
-	gc = gdev->chip;
-	if (!gc)
-		return ERR_PTR(-ENODEV);
-
 	if (hwnum >= gdev->ngpio)
 		return ERR_PTR(-EINVAL);
 
-- 
2.40.1


