Return-Path: <linux-gpio+bounces-22852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B190AFADAA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6D5F3B4DC7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F2728CF77;
	Mon,  7 Jul 2025 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JcyzpKpU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EB628C2DC
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874633; cv=none; b=k3QtNqhspbw3gRgDK8jwDc5LDqHZQwXc3cHrrvprblP17NfpoMHg5QF0OesO+WsL8ZJX1LOmHB4HZwLNLqnIOMIsGkDxaYwBUp1QQJH8xgiag681wculcx30C4qG3ozqbM6bEnmFf7FtbJD7hvrKYArP/nxsFi3LLjem2MeJZII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874633; c=relaxed/simple;
	bh=U+hDqtuMZ6JF+OOfTMalSXbSfzKpjAOm3HctY+nthUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=goBnDhj8sFCT1mFjBV5JwgLQXXNT14E3Q6OdlbcoX4BjDQmZPPWRhGTnAyWlQ0ORVAW5vK3r0O4tgrYYRFAQd8NezXmvN9Nng82rmTpbsOQVvmNxEcAKD7qmxf4Si9bYQzncNxei9XJ+t2Cy9sCsgLYo0p5fmTAzAlu8YMhb6c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JcyzpKpU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso16558845e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874630; x=1752479430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+JA5hCDJONRdLbjJGk+bpg/C8XRBbWfR2uFkIyaXac=;
        b=JcyzpKpUzE6EFc7cwU4gwqptMfPnEqfGagZYRuOk0RJH9v+P3vnzNDebrIonN2M0X3
         0x1z0GAMQvxx6KFjVuxAM7tLok5vNJp6Uf3tgxaeV1HRzrfHoWcoOSBiuVmvd7arcaO1
         Ek6SQNgldv0wpLtuYYgGeKmY56pp02oYXPg+iUB903OrIYwmroLQxL/zNhFwJgBB8uv9
         jbqSHqmB5b1hiQTN8Gwis1hXJE1yDstYKbF9iiif0Jp/UEavMWHXXV8tGO9meTw6qYgX
         dJfwxfaV+8hQEcePAxuuev9YaI71DZNTRdQK+kygW9wWNY54JW2OcsTZhka8D1oDxLp/
         wUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874630; x=1752479430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+JA5hCDJONRdLbjJGk+bpg/C8XRBbWfR2uFkIyaXac=;
        b=QDR9rYqYxooL0mpKNCB0L2F/X9FkdHeLz45w8JyvfKlW6sul0Db1ufSCQH6uwZuQrX
         jAgvDIVtN4Gpiazu6IWaadt1sL7EysHnr9HQppb2WyzXTlxUJ5YgFVN655z7sO0412Zj
         SV/3kxXIBiHYgSTt+AMfR/Dfd81jKECsa5LSW6EPy598xlmwcUEPALofiZ2dGVer0d59
         j3QjDWrIrfO1k0C3JuoYSoa+fhlBjKm8Xq0KUQpw9kIx0JP+CG2X+eGkLbUsK/g+ch/R
         /lr8OQ9F7hQxxfPIOomVQf2byxVVhdEBhdD603CLMVbZuRUAFfROLQ4wuIvBkOd42f4W
         sCkQ==
X-Gm-Message-State: AOJu0Yx+AoLLermy3ngABXa9vScmE/1rXNN0s4n0vnJUu8lG+boS0x/q
	t8uBtcCQ7BmENzA2J2JEaOiklcG8UgvQTVWyqCfF02iYl/in7OAroy5t17+uxeLEc+Q=
X-Gm-Gg: ASbGncufFsEtE2MQuKZzukPH4WN8V6KiiIvimCghF3AcD2SGh7uuZhNLHBKhM0W7G+h
	kkLUv2yk4MFq2uzQNC4BFh2CcYrS/TpnD2Cq/xvFXJktWpXKrnlB+rYucIA0MhDByMOm7t2rHuP
	UUSL9YE2srKGMTI4svPUISW7xxwXrWtu+3ECZrw/jKRnajgXXKuEerK5z1vtlXV9poaftNVDQRp
	HHXq5O09RzcfjAU2drh0G57achU7e98NDrT8FcYsswtxxMAMj5VOFUPZjFxGqtU3TvVUctIWx2C
	9/RPwPR5TTA5XnBa4eVF54/b1Cg9COc/8SzTLkoNORG2U6nYr3qZmj/I
X-Google-Smtp-Source: AGHT+IHBlhSVc9pwEwajWE6AJVXz+4dQ6VQo86G02JHQBXvnIQfQwXZfMZgi+u0WCVRbP0X4BD5n/A==
X-Received: by 2002:a05:600c:630f:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-454bc4a5dbcmr50148525e9.20.1751874630164;
        Mon, 07 Jul 2025 00:50:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:20 +0200
Subject: [PATCH 07/12] gpio: twl4030: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-7-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3195;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3JDOrR9hQWFdJNurWCS9HHF9izhub7RSmsduqXEIo4Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w7CxXxYgJaTdua9NdZqS9G8KYjVQfCYdNfk
 2GOraQ2CeKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OwAKCRARpy6gFHHX
 cqxYD/0aBgjkJNPm4W7AZUCumlwmMA0qFydna27fs9jkLYlIrVJtgngogU+DST19V5q6cnDiImH
 wwW+TreR6ojk5TotayIWj/VbBFKk11n+zW8r0R1Tzzqw+LzNqcwJcwUH2OXciSY7ymP/Ga7K45o
 suOmzS+NUqpuZSKjgGBg2IOgZVOSUuPhwDw1NTMFcQ0/5unrA1oPn7bsfBs219WYyre7nFEoBdv
 nzB0kOdXwd+vqzVdwjOfjOlDLw6NI2gkEvuFCMD+vGemXldP/ZuX0WGb7LK/mpssPNoCokrvqai
 QvjodAJCSkKLbS6frryk7/ETMYFnFPvpxEPwdc5dAj0sGrBi6H3uwBYMx9D6h0SYKVv/9skpe1v
 sVfO+vHdDoNN8SRtawKAjZ/DGAhlD4N4kxKF2mnen8xOwLZy1z8mSCYQaWxGZzStQB1W3aLKCLz
 +B2IEG26H4uIesiJWUHUdUDopwBrp4WlKdJQK4A6vEJs8U+V5eoHdGB3Ec+ZGeQnk4WmOg4ogRO
 +TkZFheAA4BTmwoCZutj8iaIpui2gifmFl8o0Rbez9WNv4lQa6CEIt5B8/BP7RgqL24CtHl3ono
 m7yBXe7J/Yz7aKLhlMcuvrSy7H+5AF0K5YB8GlRfviv+XZyju9xUNXiyUDWzEnaxaLP1KwAilMo
 vfiX6GFF8XIxngA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-twl4030.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index c5d7825f19c18bfa84083aa5a46e48d174b8fce6..e39e39e3ef85b7c60c1f29f78c11d6eeccec6206 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -120,7 +120,7 @@ static u8 cached_leden;
  * external pullup is needed.  We could also expose the integrated PWM
  * as a LED brightness control; we initialize it as "always on".
  */
-static void twl4030_led_set_value(int led, int value)
+static int twl4030_led_set_value(int led, int value)
 {
 	u8 mask = LEDEN_LEDAON | LEDEN_LEDAPWM;
 
@@ -132,8 +132,8 @@ static void twl4030_led_set_value(int led, int value)
 	else
 		cached_leden |= mask;
 
-	WARN_ON_ONCE(twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
-				      TWL4030_LED_LEDEN_REG));
+	return twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
+				TWL4030_LED_LEDEN_REG);
 }
 
 static int twl4030_set_gpio_direction(int gpio, int is_input)
@@ -278,7 +278,7 @@ static void twl_free(struct gpio_chip *chip, unsigned offset)
 
 	mutex_lock(&priv->mutex);
 	if (offset >= TWL4030_GPIO_MAX) {
-		twl4030_led_set_value(offset - TWL4030_GPIO_MAX, 1);
+		WARN_ON_ONCE(twl4030_led_set_value(offset - TWL4030_GPIO_MAX, 1));
 		goto out;
 	}
 
@@ -334,15 +334,16 @@ static int twl_get(struct gpio_chip *chip, unsigned offset)
 	return ret;
 }
 
-static void twl_set(struct gpio_chip *chip, unsigned offset, int value)
+static int twl_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&priv->mutex);
 	if (offset < TWL4030_GPIO_MAX)
-		twl4030_set_gpio_dataout(offset, value);
+		ret = twl4030_set_gpio_dataout(offset, value);
 	else
-		twl4030_led_set_value(offset - TWL4030_GPIO_MAX, value);
+		ret = twl4030_led_set_value(offset - TWL4030_GPIO_MAX, value);
 
 	if (value)
 		priv->out_state |= BIT(offset);
@@ -350,6 +351,8 @@ static void twl_set(struct gpio_chip *chip, unsigned offset, int value)
 		priv->out_state &= ~BIT(offset);
 
 	mutex_unlock(&priv->mutex);
+
+	return ret;
 }
 
 static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
@@ -373,9 +376,7 @@ static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
 	priv->direction |= BIT(offset);
 	mutex_unlock(&priv->mutex);
 
-	twl_set(chip, offset, value);
-
-	return ret;
+	return twl_set(chip, offset, value);
 }
 
 static int twl_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -418,7 +419,7 @@ static const struct gpio_chip template_chip = {
 	.direction_output	= twl_direction_out,
 	.get_direction		= twl_get_direction,
 	.get			= twl_get,
-	.set			= twl_set,
+	.set_rv			= twl_set,
 	.to_irq			= twl_to_irq,
 	.can_sleep		= true,
 };

-- 
2.48.1


