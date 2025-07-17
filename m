Return-Path: <linux-gpio+bounces-23395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60437B08718
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 09:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F11CE7A4AF8
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 07:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1400B253359;
	Thu, 17 Jul 2025 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dqG/m3DG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3820D248F7F
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737976; cv=none; b=Ixlf0jK4sGYZi8yrBqcX//v8S/JI2YWyD0YnIG7xP7GHXkR5QRvMJysP/rwhGjUxe90uaLmKVeM64/XQ7ooJNjbjI/cZ9tJQwcu+OKSExuhi58By9WQZXC6FceNO/gY0S7WSdALC8tbGeEgDUGKLSbv9PUdLKJwe8Ln5EId489Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737976; c=relaxed/simple;
	bh=fPAR6hLswyO+SpTJ0Y5ANcfOUAe7eijNrwU7EQja6pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JKsJtiQ3cE59wsa8ygMP2+HfxR+uuzhxXsphQ6tewbedZ909aEMZXGFTU3pYjPTFgnp8LjZFYfevaK826d/1CwuHSmG5K3BJl2Qf3rxYONpEhI4plAt/uEflw6EwMMM20yvh6RS16J3TtlYiVBAb3XjfD4HWdBidtlHVvEcE8HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dqG/m3DG; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-612b67dcb89so71703a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752737971; x=1753342771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ux9Mr5xeRHdC9Iw5ExRKqN9n3Z3dsSy+quGCo9ptBhs=;
        b=dqG/m3DGwfuWnQN/I315aFNLrZHqxfwTupYBEPlszl4LgmGar1eVLco3gqO+8vPXLP
         QiSO3v8Sk8hUim1nD2gsVeq79lJ7gissWmzWkVMzrT3li/RFTv9DOg+svlsmFaSEY8mA
         wTya0+I33OYtAjSKdxbO6UeyskjDA8uxkb14pY4MXFJyUWmjstTojyyCfFbZVz5B6UXm
         id28IR7BQe6zGDSPj9pj7Wt6wJg2V/Fjxi4ufTvowqB+hVrqalXS4XfLYVJ7cM3CMTBq
         SsKnAC45W39jMG6HzpvkfH//Ej/llh2hbH5yF25WKvt+QjgmlnCJomVoDyZo6/7JKeok
         Wm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752737971; x=1753342771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ux9Mr5xeRHdC9Iw5ExRKqN9n3Z3dsSy+quGCo9ptBhs=;
        b=tBvPYTDizlnUaM6LaAoXd5LF0/d3F+LiHF7jbI07+Oofv8xpn5+NtDlnjHfpbIVxjm
         gLx+loBw8eSMhxivot2h1GfJtVacoU/ciPo6HpI8YOSR0s+76Kk9l+SZxQmeAnthIIQ/
         nO40z2haLNREBe+z39G6n+5ImT+vVEVczHLcD1XpkPrmhYM6nPD3r1/ssg533uu11Q36
         YzacpI10cyh5iIzeG3mzsm0PhbTO9CrioIxZIgybCbsVfK3YKpF6/zPtbE09VBP+I2o2
         ZqGCwKD0kqDo1kozgqBZjRAZLfqQeGiH8kEavSFSPgTEk90zCzDEhkdScS/HoOHHaZaX
         SCOw==
X-Forwarded-Encrypted: i=1; AJvYcCUb8QOJUEYCqjeaiIimAkHCHFbsVSdSKVyASxlIVUXuGf4j6I8Bt1SR5NOzfmR/h4uWPzs4eqyRA8kE@vger.kernel.org
X-Gm-Message-State: AOJu0YyazVkQkA93Pm1Oim1tThgj04PtDQ+yyFqIzkz/UCx7CB8/uXsb
	j1WbcpMcmiPovdztHzT0OmVVpMHFOrpDdZorYrOEDgYefRnSEWzFw8NaNgL76hFVXE0=
X-Gm-Gg: ASbGncsNcX3Zbz4rffDqCcgr9509J4wYR7PNeA+E7Uaal2nPffIPFKahg/3Eh5OSLF/
	TwsQWdjxK80kudV/JDwX4I+4UoGMk6qa2Zi0QqVH4arC/J586nSjwHQkqzAQDkxm6usFCXjalYm
	Ef4fYDXnAUgyOVi48ZxekT0H0PTA7dO/ZzpgnJyNZp5uhBlddSG+yBoedD6Yh5olXsgN5Ih6paS
	QNZma38UPTRFVCjSR3a31H2oYombpi3u52etJBwRk4ysCEs4kXYPsMzDfldhwf7o/ip/WNJsGaJ
	ktn4eq8o6A4hVc/F4d4xe5LEE9hOR/chEa6dQkY3ZmftIDCVoXq7ATg/aY1aqMAcMQ9Ke6IWZTq
	agfnZP5kaFR2Oh+swO50pXmJW8x0TnhSUmU9guEwZbIRbLeSXjajBblbDW1s90vyS
X-Google-Smtp-Source: AGHT+IES9/1CHz6DVRdg9xAsE7Dr5k+8Wfu+z4fngnc1/tG/GtRX+sqCn7xC2XQD+oWDVFK2XwYALA==
X-Received: by 2002:a17:907:1b15:b0:ad8:8621:924f with SMTP id a640c23a62f3a-ae9ce1ad71cmr544233666b.56.1752737971235;
        Thu, 17 Jul 2025 00:39:31 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae6e7e94338sm1323486366b.35.2025.07.17.00.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 00:39:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Clemens Gruber <clemens.gruber@pqgruber.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] pwm: Provide a gpio device for waveform drivers
Date: Thu, 17 Jul 2025 09:38:59 +0200
Message-ID: <20250717073859.1777226-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4725; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=fPAR6hLswyO+SpTJ0Y5ANcfOUAe7eijNrwU7EQja6pQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoeKiUyRrmfsI9t7diLVCVvTCXXsJmqZeJhGHNg y4iVSdikqmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaHiolAAKCRCPgPtYfRL+ TrHcB/0S84xlYIJNZhn6ovzjiZFCJ0g8BZtYquz3VnClojzu3f7UnBKvkPxwdqeFB5JpQ/mr6kJ 94Uq9iCgTAGXlfvqiZVG+nPE3paswl6axKSlieV1phCC/78qSNtcOzkYTRBSzRQu45gk1A/u1z9 yPF81CEZ13QkW0Tk8VtUc+A4e9lfKzvYOdxIs2NCf40I1U1ay5j0CB3NxkBjh6slDMtE3hxoJa6 1r9+23dobMWRPMi0GgBXQEuqtGz0Urph08JUiyWtSQzLfrQlwnB9KGT8zscMwmLyRduGb42cnfU MEAM1DmWbriyBReZqYMEuZXQCQuLPS9+TT5CpgiOjIbe7Dvg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A PWM is a more general concept than an output-only GPIO. When using
duty_length = period_length the PWM looks like an active GPIO, with
duty_length = 0 like an inactive GPIO. With the waveform abstraction
there is enough control over the configuration to ensure that PWMs that
cannot generate a constant signal at both levels error out.

The pwm-pca9685 driver already provides a gpio chip. When this driver is
converted to the waveform callbacks, the gpio part can just be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/Kconfig |  9 ++++++
 drivers/pwm/core.c  | 73 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pwm.h |  2 ++
 3 files changed, 84 insertions(+)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 3ef1757502eb..778168e71055 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -38,6 +38,15 @@ config PWM_DEBUG
 	  It is expected to introduce some runtime overhead and diagnostic
 	  output to the kernel log, so only enable while working on a driver.
 
+config PWM_PROVIDE_GPIO
+	bool "Provide a GPIO chip for each PWM chip"
+	depends on GPIOLIB
+	help
+	  Most PWMs can emit both a constant active high and a constant active
+	  low signal and so they can be used as GPIO. Say Y here to let each
+	  PWM chip provide a GPIO chip and so be easily plugged into consumers
+	  that know how to handle GPIOs but not PWMs.
+
 config PWM_AB8500
 	tristate "AB8500 PWM support"
 	depends on AB8500_CORE && ARCH_U8500
diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 0d66376a83ec..14030dc8b7e8 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -2383,6 +2383,51 @@ static const struct file_operations pwm_cdev_fileops = {
 
 static dev_t pwm_devt;
 
+static int pwm_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pwm_chip *chip = gpiochip_get_data(gc);
+	struct pwm_device *pwm;
+
+	pwm = pwm_request_from_chip(chip, offset, "pwm-gpio");
+	if (IS_ERR(pwm))
+		return PTR_ERR(pwm);
+
+	return 0;
+}
+
+static void pwm_gpio_free(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pwm_chip *chip = gpiochip_get_data(gc);
+
+	pwm_put(&chip->pwms[offset]);
+}
+
+static int pwm_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int pwm_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct pwm_chip *chip = gpiochip_get_data(gc);
+	struct pwm_device *pwm = &chip->pwms[offset];
+	int ret;
+	struct pwm_waveform wf = {
+		.period_length_ns = 1,
+	};
+
+	ret = pwm_round_waveform_might_sleep(pwm, &wf);
+	if (ret < 0)
+		return ret;
+
+	if (value)
+		wf.duty_length_ns = wf.period_length_ns;
+	else
+		wf.duty_length_ns = 0;
+
+	return pwm_set_waveform_might_sleep(pwm, &wf, true);
+}
+
 /**
  * __pwmchip_add() - register a new PWM chip
  * @chip: the PWM chip to add
@@ -2449,9 +2494,34 @@ int __pwmchip_add(struct pwm_chip *chip, struct module *owner)
 	if (ret)
 		goto err_device_add;
 
+	if (IS_ENABLED(CONFIG_PWM_PROVIDE_GPIO) && chip->ops->write_waveform) {
+		struct device *parent = pwmchip_parent(chip);
+
+		chip->gpio = (typeof(chip->gpio)){
+			.label = dev_name(parent),
+			.parent = parent,
+			.request = pwm_gpio_request,
+			.free = pwm_gpio_free,
+			.get_direction = pwm_gpio_get_direction,
+			.direction_output = pwm_gpio_direction_output,
+			.set_rv = pwm_gpio_set,
+			.base = -1,
+			.ngpio = chip->npwm,
+			.can_sleep = true,
+		};
+
+		ret = gpiochip_add_data(&chip->gpio, chip);
+		if (ret)
+			goto err_gpiochip_add;
+	}
+
 	return 0;
 
+err_gpiochip_add:
+
+	cdev_device_del(&chip->cdev, &chip->dev);
 err_device_add:
+
 	scoped_guard(pwmchip, chip)
 		chip->operational = false;
 
@@ -2472,6 +2542,9 @@ EXPORT_SYMBOL_GPL(__pwmchip_add);
  */
 void pwmchip_remove(struct pwm_chip *chip)
 {
+	if (IS_ENABLED(CONFIG_PWM_PROVIDE_GPIO) && chip->ops->write_waveform)
+		gpiochip_remove(&chip->gpio);
+
 	pwmchip_sysfs_unexport(chip);
 
 	scoped_guard(mutex, &pwm_lock) {
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 8cafc483db53..6e7d02c24991 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -5,6 +5,7 @@
 #include <linux/cdev.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -340,6 +341,7 @@ struct pwm_chip {
 	bool atomic;
 
 	/* only used internally by the PWM framework */
+	struct gpio_chip gpio;
 	bool uses_pwmchip_alloc;
 	bool operational;
 	union {
-- 
2.50.0


