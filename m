Return-Path: <linux-gpio+bounces-22169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4B2AE7F83
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 12:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 720133B0A80
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9547729C353;
	Wed, 25 Jun 2025 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Jlno8gm7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD442BDC06
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847627; cv=none; b=QFBH77ULF+V3pD0HR5yiAOupwzuy3AugjpJLCdXALHzTE+a1ygPuQbQPH20w9V6CKp9gZ/7TnTg5Vyf4vliIX9tAMjy7171i/mLci0FSsK9PnHIj8ggAMmcu4Czdz3VLD+kcdLG+8BqLCiU8/4y++zgJ0d3sAGursPNJSH51sXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847627; c=relaxed/simple;
	bh=729bTHeMbxQBEWcLQhpwWJ2bHQvRnqwTAVtSem1K0kU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtJTserzIhHubzzt2cGAnaDf12nRyEQAJNZeOURRbCCFN7D4aed1Zt9dUVq35tALGTZEzYs9Lc5nPCJBO23DrmeVN2eA4QzXBbQ13zFxNIaCyYd7umbuqsPlzGCA7axP89cwU3wkMJLRmB0V+RdUOmoiFxdQRdVnQO4NXEmq9T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Jlno8gm7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45377776935so30192575e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847623; x=1751452423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tU449U3rD07cot6WAW8djohd5BFLFtc92RhNFArY8gQ=;
        b=Jlno8gm7CFFi0GZCfZjZdluLwdqG2VBiuXElRNSfpi68cOZB7+fEfuZu58w4Ao0iCd
         d030vhujAcvvg047sVlLojsHtELsWIfthdGwpM5tvHTJpaAIvV2/J0vuG7vhbkdIJF7n
         PqxBoEJhazdV13qjoK7kB1SudLIok/iM7B4iUEN4fk2rIGMXJLxim5yKwXzJmpDiROfG
         SxbDgQWffhY42pldx1Qyb3WYMAW9u2UO8LCZfaEkYsltMVTI8LxHprvhG03B/Q0sxuN+
         ALfmLHqIHed/7EBdcHDQ3G/Dp68qpmzEv9ikwqpfZoHh+fxT740+z4w0jID9cAu3aJMt
         +kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847623; x=1751452423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tU449U3rD07cot6WAW8djohd5BFLFtc92RhNFArY8gQ=;
        b=uY6vUzotCzpu3h7/mb2bi+uhgtGtjTzx+DCtQiknf2vy+6WnDmue7/0WtrUXtCP4PA
         zeiOm/nUEW6lt3rvyLt5IsTXltMzZeY3XplRdEVkn2h0ZP2/khcBreA0Tcv3LAvanp2J
         ZfQ80/E6LoD2EWbAECPSUq3eGMfU2rM4VCp4RKOt9SOPIMKud0HkpAVAfzmgVB9imhNY
         b9vvFunhcsg514bZ0VoUGIifo/C0h0L9D/QDtVBwN+SOlpEYPfsfvzIjksxSrkobi/mu
         ZD6zR6LTIr2zlyXpvhAIa+yjFKb4RaDt8HXQuYDROU6PXTyC72kBJ3hbXXEpGdAzgI1n
         BQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCXRBOZePInZfKjKAATJ0gSDebn/DWQM0Gf9p+ZSs5e60iSr5q9s7uJz5LUwwqml7hY2hosCOzl8vAqP@vger.kernel.org
X-Gm-Message-State: AOJu0YzbTn9zExZPvmGCB61EBX73rfdO6/qR6NpW4Zc9xv+xgdVIRuVL
	GJyNJ6j1Qv7jC7z+bCQ2b6oRbyCBn9WhQumRuvNAR4JQ+pmvjw57BlwXby92uT+dCXMkqoBTo6X
	sVfCv2aw=
X-Gm-Gg: ASbGncun87RpHZsvf+qltrjVwnV5E2b+RU5i1uQZ99fB1FXsOA9GT3+AqsYMrr8AOR6
	KnDMlU01nQ0hfL8TH37MQ6EkQy6rE4F32F/cQ2HGlOAXXaR/b8jA1AvNQtdaE6D1nGnu0R5a2nP
	W1HragyOpEdo8KpwPYde+5c0iKhJAZkXkQJcyTjDceMfI74JNcKT5Yv8pf5y0jX0oTY3/NGFZn9
	WzWAl/DXPL/g1+AabMz27O9Q4PBRYKPE28sRGjulvkLEkuSzpv2rnxaNWThbF0+GFAShlXUBVIO
	UFK2BzChQqLwwMxlbTHrQr5qXH4kpobxRHImdprsGv+6765QG9RPkh1P
X-Google-Smtp-Source: AGHT+IExdKWHy0zZaVYCrqx+BP7uJ368HB9lkEt9PPvj6/TYCB40ZTHcV1Ct7Y5lmkJLBkvOCbR3KA==
X-Received: by 2002:a05:600c:4689:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-453837b27admr15033695e9.19.1750847623364;
        Wed, 25 Jun 2025 03:33:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:27 +0200
Subject: [PATCH 04/12] gpio: siox: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-4-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bJcwe6Hr5XvIVx8G6ghZMJiYUF0XZL199iB3coJfAfk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+PQpCwI9SoOycpwUWmzmglijqLdeB/U5Eg
 kE1VEMdyMKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 cuFFEADfNeOln1AAQDWFM9wsl7uEhDwfsbG71W4/R7OgBczrNFkK+UtKviXp2HJ9O01kv/hOWs7
 6EHhIBxDrY3pFDdCE+Wy+NSeUrjAmu+c6e318/1GLlFKuByq4RPXekslFzg6vFxqLpDcBZj90CU
 c1wUFWCZZtASvlEycZTrptz7iDoRsiWrrPfWbca1szxTMpwerPyUpMF0VrP36xurC6WQxW/1h4V
 Cq8YmYy3rwSH1f4uuM/kkAJe3bLS34cD0HuZjVpU5B/y4k5lwv57dve6LYSEU4Fy4eXI41eQwW2
 +Gpch2bEFZmJlkUth7pHVoLmFsvZQPMhWgw0A6jegQII82k8eM45CJRXZArNUsMPuJDlXur4HF+
 rBIwKFgRSKQzG7HhSE+xwKGkmdqCXc1C1Wn83SO0y+V3uvW91HAwGZZQOnG8CjBVdxdOcsh2pAx
 bealDn8ZLONkKw/5Z8zYQEtxUIP1bWTLUPoftc6X7gWjyZG8OX4vs8KCXh1isM5o+f7usuQNiYa
 vO4UW8hil77mCfWWx4yzX6r87ZS36V6WZqYWVgLkaCiN8/d4JG21eaKqPcLxX3E/veTMsMy/RTy
 4ZXlQq5YztpHNAInC0FbcAuM54PMNKASc4AGGwTpKZaAiFtsMzwBpcZ+uKxpP0+H7/IBsqKPnbb
 bsgrz1crt8iUXww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-siox.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 051bc99bdfb2aa3c8a382f773c5892fed6e0a8b3..95355dda621b40124f4702432565b7381c4e6686 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -160,8 +160,8 @@ static int gpio_siox_get(struct gpio_chip *chip, unsigned int offset)
 	return ret;
 }
 
-static void gpio_siox_set(struct gpio_chip *chip,
-			  unsigned int offset, int value)
+static int gpio_siox_set(struct gpio_chip *chip,
+			 unsigned int offset, int value)
 {
 	struct gpio_siox_ddata *ddata = gpiochip_get_data(chip);
 	u8 mask = 1 << (19 - offset);
@@ -174,6 +174,8 @@ static void gpio_siox_set(struct gpio_chip *chip,
 		ddata->setdata[0] &= ~mask;
 
 	mutex_unlock(&ddata->lock);
+
+	return 0;
 }
 
 static int gpio_siox_direction_input(struct gpio_chip *chip,
@@ -191,8 +193,7 @@ static int gpio_siox_direction_output(struct gpio_chip *chip,
 	if (offset < 12)
 		return -EINVAL;
 
-	gpio_siox_set(chip, offset, value);
-	return 0;
+	return gpio_siox_set(chip, offset, value);
 }
 
 static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -236,7 +237,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 	gc->get = gpio_siox_get;
-	gc->set = gpio_siox_set;
+	gc->set_rv = gpio_siox_set;
 	gc->direction_input = gpio_siox_direction_input;
 	gc->direction_output = gpio_siox_direction_output;
 	gc->get_direction = gpio_siox_get_direction;

-- 
2.48.1


