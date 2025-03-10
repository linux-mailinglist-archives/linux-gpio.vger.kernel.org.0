Return-Path: <linux-gpio+bounces-17366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAFA594CF
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2338188B7DB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D6222B5B1;
	Mon, 10 Mar 2025 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LdQacVMp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7647922A7FD
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610439; cv=none; b=ISxXThlX5n2VSEiqASSZQJHFFK4zjCZSuCI5qbmW8dYaXHlNFNAM5/5nA7+T7Yji0ExnPTxrOjsbgeCqUThezgxejSnYsTGs0U7IL0RWyIlJU39/BRz9P8dmASkPN23yIh1h9lmhkwHFk0fodFcgg+sunQRaWYwv64ssdzP/9IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610439; c=relaxed/simple;
	bh=eF0hDq+dmWyAGOjr1phNsifrrwjw6vv6u7L6MkqdfqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnryWOVZRlgoEbHKbsmnNbqFidus25ps4pB1cbHnfoXSB/D+k06D80qRgANMYUt3v0XatqQ/ZUKg0yIMrabBpUGj8tT95ESdLETgzmZNqiBFjJbl70CyV1W2zx5DZYOLjE093J5KK0qHl8thFKdhwyD3ik70cbA3G7gxciSMqU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LdQacVMp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso8934565e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610436; x=1742215236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ul5VnJBefCrA6KPx6o9qS+QweFeRf07qToseQLHiWw=;
        b=LdQacVMptewwLTCYIIi16kmx96uRETPIXbiO08cvzK2JfVIx5wiEtr4Yo+/nbXY9zk
         lHiJlgrgt29hzZ2JrC7cOSAPrkqi4BOGmJRFOXFarQEqhkRfEiiQiJHpN0zBoLzZlswL
         2yAoV1QQb/tCq459kWYM2oHcJbqBFMbxOqvbxcIHLkvL6skX/fzHHgXlMvDChdleaEGF
         1s/V99n/8iLX0UiXqBE/ycS+evz+DQu4FrHBpunxbbcfkmQ1GGQWkIFHYC0z94++8aJx
         MFHNEi/FDI51Pui/qPBlhjK7CjiIvB62T9MN98saFW4qwlmTbztF93PBBFI7hPwTUNBw
         HXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610436; x=1742215236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ul5VnJBefCrA6KPx6o9qS+QweFeRf07qToseQLHiWw=;
        b=uZ8vjR5ukIOYLIzWx24btH3hiNchdMw1kirm1w0W2vgJ/VUiIljplSRvOnQE8JsQlF
         CyWUKznQ7kFzhzvjUHVkFKJFtm6kgHieZruBn8gnD4o4pfc4fnf1y1h78PALBPtWyAhw
         vq2GhmhwWCLVOu3VlvxU3Sf04ZkUBlCnj9jpdPFQav5KpIK1I1Y0P6X2FBAj3rvKK60H
         jTTEtwjkytopk+lMoq1Y4Nryfgne23SUm0OeGcRnNWGhNhdmCBy/7lD3owLxzXgbFnvn
         QqzKFfwaWSIRG8XU9uE/tBfFmrRp+7WS4HFTVlvks5QT6YBrVF6oX+IKtiLFBocDyWOo
         5Rew==
X-Gm-Message-State: AOJu0YynvH3XXEqCPtXeCx4tzDsEOciUyTwoJlC0aApymtRnDdUz01qs
	+q3zRBEITjZBL0iMThWXcp4Hpc4rYBLwWIV6P1K2Eo9LCgqUhjq8Xv9uHQ3WGDg=
X-Gm-Gg: ASbGnctYSojRTyVYXx4c/PFyiD4mEhsaVwP89PDejhNtxaM5VmmzDuigTmLcVqIgt8f
	x/jIqOdpL7JU9DA5pvtcKOa/pX6MGVQzJGSoD+PpNP6n+tTRf9HDW693iGj1JF/zOxhJbW0plxC
	aBQ6ApxOMGU868w/g6ThW8N9UT4/JboWdBqbEEP58NwPPJyVw+nzL7DHMbhuwEXaHboqCflSlpN
	ZHuTDVXSN7uCUmQo3ewY6TPAOCZGRKUsjRsCVuKyPVGOyOe05wgGX77OnXCl5n3kVDFI3QZzoL2
	BqeA8J6rr6s9adNJVFz+J+qXl2Nz5gQUBrqxqg==
X-Google-Smtp-Source: AGHT+IEFFTCQlnKxKa5Uqz8Qsewx5EPKGuImlX0WipUtNgEC5ZPbK9A6g9jliGLQxqqZ0CjYumZWrQ==
X-Received: by 2002:a05:6000:25e3:b0:38d:d603:ff46 with SMTP id ffacd0b85a97d-39132d8a273mr8267077f8f.14.1741610435829;
        Mon, 10 Mar 2025 05:40:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:23 +0100
Subject: [PATCH 09/15] gpio: cgbc: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-9-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2670;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1v/SXsvrtA+Yw36LlEJRsvD6C7VXgTznVWuX8EmPL5E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt23h45ep6JsGUc+cwRb71/qO+/+nDM1jaN6r
 kIDV5FoeemJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtwAKCRARpy6gFHHX
 cj09D/9LqUW7e1QJC8y1pvtBoGpumfGGVdjjKlOP0Nf8cj7GV+OHGLG13szW3NVOjrmRxHBvOv/
 by4FD0UfZuyeWy6j6m0SghMAQQ1Ik4WxSWsJTJo71i1qPqwZQtZuV9F+/JdcMHPa0D7dq114Kpl
 V5R4K2jF9/g4/UDmsS42VemnAuzETo+p+M9u2nBHMH8t9yKYUEQfN6WHZHJzVkktQYC1qh5Vp0l
 mxrhFmQAyZb+Rd+lcC2sDZeVulOT/ZmL+ZRKcVHI0hMLy0RCVQbxjFszzhPpoVxSAsJoGUZiRLp
 xmh9sWBU1fOklwBlmRa4lyEYl/ri40xa0mAELP1UqqX/QqsLQXJeAZz1ctOZ8iE/1qOucHi9biT
 jnENyJ0kCenHSbdqL1fkhQyXiys9bNTeA7B90jWKrBli31Kqgx+LASUDt5CRkyKNnVjeOID3MLd
 /6hpjFWFjLjaa49pc8XS2qixCa6t4Xf7Jv03HWCTd3yUQKJcELUSFHWPn+DW2d/O0HVROv+6sBh
 cBYhjLRA1fopAgt6jYLFa+sl8j2hzKW3ks4bO8oEnhf3j2Pu49sYM1HgEF1TbW93LvhLedxvgKD
 GeLzVLO+U2cSXJrYx3hqHYtDyY17+3vmhU4o4P6ZMpdyrL775ibIn4bHx0yyy2sw7qonW/453+J
 rQKMsBy22LFL3pA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cgbc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-cgbc.c b/drivers/gpio/gpio-cgbc.c
index 9213faa11522..1495bec62456 100644
--- a/drivers/gpio/gpio-cgbc.c
+++ b/drivers/gpio/gpio-cgbc.c
@@ -51,8 +51,8 @@ static int cgbc_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return (int)(val & (u8)BIT(offset));
 }
 
-static void __cgbc_gpio_set(struct gpio_chip *chip,
-			    unsigned int offset, int value)
+static int __cgbc_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
 	struct cgbc_device_data *cgbc = gpio->cgbc;
@@ -61,23 +61,23 @@ static void __cgbc_gpio_set(struct gpio_chip *chip,
 
 	ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_GET, (offset > 7) ? 1 : 0, 0, &val);
 	if (ret)
-		return;
+		return ret;
 
 	if (value)
 		val |= BIT(offset % 8);
 	else
 		val &= ~(BIT(offset % 8));
 
-	cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_SET, (offset > 7) ? 1 : 0, val, &val);
+	return cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_SET, (offset > 7) ? 1 : 0, val, &val);
 }
 
-static void cgbc_gpio_set(struct gpio_chip *chip,
-			  unsigned int offset, int value)
+static int cgbc_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
 
-	scoped_guard(mutex, &gpio->lock)
-		__cgbc_gpio_set(chip, offset, value);
+	guard(mutex)(&gpio->lock);
+
+	return __cgbc_gpio_set(chip, offset, value);
 }
 
 static int cgbc_gpio_direction_set(struct gpio_chip *chip,
@@ -116,10 +116,14 @@ static int cgbc_gpio_direction_output(struct gpio_chip *chip,
 				      unsigned int offset, int value)
 {
 	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+	int ret;
 
 	guard(mutex)(&gpio->lock);
 
-	__cgbc_gpio_set(chip, offset, value);
+	ret = __cgbc_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return cgbc_gpio_direction_set(chip, offset, GPIO_LINE_DIRECTION_OUT);
 }
 
@@ -167,7 +171,7 @@ static int cgbc_gpio_probe(struct platform_device *pdev)
 	chip->direction_output = cgbc_gpio_direction_output;
 	chip->get_direction = cgbc_gpio_get_direction;
 	chip->get = cgbc_gpio_get;
-	chip->set = cgbc_gpio_set;
+	chip->set_rv = cgbc_gpio_set;
 	chip->ngpio = CGBC_GPIO_NGPIO;
 
 	ret = devm_mutex_init(dev, &gpio->lock);

-- 
2.45.2


