Return-Path: <linux-gpio+bounces-19665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58684AABE19
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BE6F4E4EED
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2662426B2D5;
	Tue,  6 May 2025 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y5IjZGwM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E583A266591
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522120; cv=none; b=nK/BTZQLcIvUisQq0Cs8MozHdb7x6sL2I6nD58XhdfjE69q6MM7mSOsxzAIKZOesPkH127gIwgcOp3yWC73rhusqInAIBKniqaTt7lu+kvgxsMogAvMfE+kiH4M5VE2ZYy4V1Zm6ufFmLY3P9L1nuV7hB7Vua/78rBWjlnjf2+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522120; c=relaxed/simple;
	bh=IbSKueG4T1w5hLwqUJQp0pczxkABxHLz/yO6KUzj4SY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9Ge/3XKzL95twzvdyY0jgwR7z8hr6pWuTyGG7T+iTnYNhnZIRpwJ6Q/AKRyIiI3h2afqfFoQ1XGxoYWHrVqT5MEpQcqggrVnctBbkTh9XqYfqt5u0jJXCd3WWAZeBApmFMGC/rzB2K0Yk9+ga/92uZ5IueZLHgOiSuTrFKqPpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=y5IjZGwM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso24086285e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 02:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522117; x=1747126917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzbCIL5EmcrHi3mTAUSbK1a5S0Wxm64DnLguO1BXQQU=;
        b=y5IjZGwMxnkFQ0uj8yUwyBnp7WVt5E0BRkpni/NjTYjlTh7Iazi135MNNBdPgN8lWh
         8DkBGpTwbfLctSnJzDftEg/oqQpHEZRjxYSuFdDd2o3FpvSfZ+kcP0l2SFhr8CtBa0LG
         WBpLrqkc+LR5p5r4Vev68VR4+nxEwoU1AFHhAZjKMTmkkytliQ5t2j3gjJ3LEUT6rNEt
         zGKL0jpuX8dNc4npvtiIf4lIumUKkj35qE+rPzbfXZ/aCwxPMNzSi1o138EXrQXQgsCi
         tC70FSY29EyumSsQasZ0m/I8iBbq6tOJUSpfRW9/rP8NDlPh2Nak2XwOTScwQqX46YWl
         dmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522117; x=1747126917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzbCIL5EmcrHi3mTAUSbK1a5S0Wxm64DnLguO1BXQQU=;
        b=RlNAyM+4vmHqDB1U3LaiiA9ftgM+iXXcTxN42evs2SlaOLjFWlH7mqXQ7b6P884mrQ
         DGYxNthYKMsg8BzEslhKcZyuRfDvXaGHr32gpU9KmBZDydIakFOxcFNTqE/3ThzWJzOd
         GzPyKn6UbHDvIbQl2KDzZmSnps9E9S/yVlWna3kwDjapFoFQWuUiQqya8FWsITTB2Mlk
         BXU0iMFne0LYXUdOdxUIhxRx8DMx93wMTloO7MuVQBlndtmBD066pO4IlamNTOlLrL66
         QZbjkUXhbuinu6pV9AdTA3zpobv2yXCpkTeIaz7JmWCB/XwxZXaRDJevRemIX0HpCoiX
         N9aw==
X-Gm-Message-State: AOJu0Yx9qKvub1I2X6V+Ykf4VqWZYi862b9I5EEpvCMfLCfV+8VoWuqX
	EfDyZc9tu5sb2fPWXPz0fvNjgPD8iy1oI7pW7Yff6s2k20urrGuZbV4bMObKJjk=
X-Gm-Gg: ASbGncsCXI+baR6jMlxB9hgNmNYoA6wPJ+B4zPH+skYzxs78rqTbZKo+2hHepEQH7KA
	bMBVpGXMYCNky2q9UbhEd1Nk7SV3ZFJDiXUUGca43uNYUW2XLcbNsE8tFW9S5KFfsxUbI4MLrSK
	R+YPFgJGz3MlRpPLmOJBcKzK+Ed3FG8zKmavTyBOLeyy8akAEJa8YfHk4Ijovk0JhsYLOt86fzH
	/1Pu9KfmR2srz1TQ944fPcgU5DflzAwv1DvRh7in/QfjuG0ikGRrB2T7X1Opg40nFzoBbVDb2vT
	yqmUs54rop/BTmwFIRNCPVg1ZrwizBARj0k=
X-Google-Smtp-Source: AGHT+IGgnwi/HajGwBN2etEehTpEfYXl+12hvkBZaP+MY4NtXZEvU51wQ1BmWfxWVuZOtYDPaafmGQ==
X-Received: by 2002:a05:600c:870c:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-441c48b0293mr95619375e9.2.1746522117202;
        Tue, 06 May 2025 02:01:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:47 +0200
Subject: [PATCH 04/12] gpio: lpc32xx: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-4-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3802;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pkwKmHhImUif17/jZfTfBMk3jt1SPyMBx6Ss/hErFtg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/9TJ55lbmkFhoanmnEostEI47tL6hoIvYnL
 ZZagsOqxo6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/QAKCRARpy6gFHHX
 ct1QEAC423y9clg9nGV1YeByPJgeWj0gMw56ZFNdnyyMycEv3OSni1/WHQkvTTCQFt8E1qq7b/F
 6xhGCoM/JqbCjOGU9mCTIv2WeeSa7l2AknIRXh0ZkvEd2FghdLwtj9Wm67vEXZ55TDva/H1vZ0s
 8CPBER8+RCKw7XgM+69mvkJWqryrpun0ZTxG2mG/+6LMLFOB5oSNVhtcoTsMp0tRUkvxzuzp7WA
 8cYw//hoLHjPizzikrb2hL0VNSxUTBPng/Kwz52q4AtH9anIm4EQ4FepkyQl8hMeljpBLU8OIoj
 IJYc1ZP7RPRsKOtdIgUgAQFzAFmBuOlT1uudjCpC3lSkp1iavqrp33+oHwYyKXli88bW6JVVNN4
 JgV6huyPI/62eFf/NmMrwLmniamsI6Jebb6J8zq5QJbM/XH5flRznoYFzaJkxTFeH4vdR7AeqIJ
 KunX2Fx46t8qItztrc95vcyygKaK9KZWJTjxSJAqz52jAW8hcoP1ui6txBNde6Zuwmm9xepQfJR
 P+ZCRkbEVhQ2azeYr1hkGl6JHTulaGxuykZlI33bsmw28EtPYBHjknlyz8X0JciXIOi9+HR/SJB
 fMi4/Ly0G9I4Y2I0gepTijxupA9E+Wv6Ps5L8AlBdaoeWDZ8JZxNpbA0cFatfxf0fqSX7IQRio4
 TYfKXfSySfvZL/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-lpc32xx.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index c097e310c9e84..6668b8bd9f1ea 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -340,28 +340,34 @@ static int lpc32xx_gpio_dir_out_always(struct gpio_chip *chip, unsigned pin,
 	return 0;
 }
 
-static void lpc32xx_gpio_set_value_p012(struct gpio_chip *chip, unsigned pin,
-	int value)
+static int lpc32xx_gpio_set_value_p012(struct gpio_chip *chip,
+				       unsigned int pin, int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpio_level_p012(group, pin, value);
+
+	return 0;
 }
 
-static void lpc32xx_gpio_set_value_p3(struct gpio_chip *chip, unsigned pin,
-	int value)
+static int lpc32xx_gpio_set_value_p3(struct gpio_chip *chip,
+				     unsigned int pin, int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpio_level_p3(group, pin, value);
+
+	return 0;
 }
 
-static void lpc32xx_gpo_set_value(struct gpio_chip *chip, unsigned pin,
-	int value)
+static int lpc32xx_gpo_set_value(struct gpio_chip *chip, unsigned int pin,
+				 int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpo_level_p3(group, pin, value);
+
+	return 0;
 }
 
 static int lpc32xx_gpo_get_value(struct gpio_chip *chip, unsigned pin)
@@ -401,7 +407,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.direction_input	= lpc32xx_gpio_dir_input_p012,
 			.get			= lpc32xx_gpio_get_value_p012,
 			.direction_output	= lpc32xx_gpio_dir_output_p012,
-			.set			= lpc32xx_gpio_set_value_p012,
+			.set_rv			= lpc32xx_gpio_set_value_p012,
 			.request		= lpc32xx_gpio_request,
 			.to_irq			= lpc32xx_gpio_to_irq_p01,
 			.base			= LPC32XX_GPIO_P0_GRP,
@@ -417,7 +423,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.direction_input	= lpc32xx_gpio_dir_input_p012,
 			.get			= lpc32xx_gpio_get_value_p012,
 			.direction_output	= lpc32xx_gpio_dir_output_p012,
-			.set			= lpc32xx_gpio_set_value_p012,
+			.set_rv			= lpc32xx_gpio_set_value_p012,
 			.request		= lpc32xx_gpio_request,
 			.to_irq			= lpc32xx_gpio_to_irq_p01,
 			.base			= LPC32XX_GPIO_P1_GRP,
@@ -433,7 +439,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.direction_input	= lpc32xx_gpio_dir_input_p012,
 			.get			= lpc32xx_gpio_get_value_p012,
 			.direction_output	= lpc32xx_gpio_dir_output_p012,
-			.set			= lpc32xx_gpio_set_value_p012,
+			.set_rv			= lpc32xx_gpio_set_value_p012,
 			.request		= lpc32xx_gpio_request,
 			.base			= LPC32XX_GPIO_P2_GRP,
 			.ngpio			= LPC32XX_GPIO_P2_MAX,
@@ -448,7 +454,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.direction_input	= lpc32xx_gpio_dir_input_p3,
 			.get			= lpc32xx_gpio_get_value_p3,
 			.direction_output	= lpc32xx_gpio_dir_output_p3,
-			.set			= lpc32xx_gpio_set_value_p3,
+			.set_rv			= lpc32xx_gpio_set_value_p3,
 			.request		= lpc32xx_gpio_request,
 			.to_irq			= lpc32xx_gpio_to_irq_gpio_p3,
 			.base			= LPC32XX_GPIO_P3_GRP,
@@ -476,7 +482,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 		.chip = {
 			.label			= "gpo_p3",
 			.direction_output	= lpc32xx_gpio_dir_out_always,
-			.set			= lpc32xx_gpo_set_value,
+			.set_rv			= lpc32xx_gpo_set_value,
 			.get			= lpc32xx_gpo_get_value,
 			.request		= lpc32xx_gpio_request,
 			.base			= LPC32XX_GPO_P3_GRP,

-- 
2.45.2


