Return-Path: <linux-gpio+bounces-15971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C39A35205
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 00:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF5F77A28E9
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 23:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD0422D787;
	Thu, 13 Feb 2025 23:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GK3ReekI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A79202C55
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 23:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739488142; cv=none; b=Q8gmCb04esuEb6YMorECkGs8TV6cECtQKe5E5MmEezympUJDfksFTk12ZAmlkPP2GElqX9UjD3dtzuc4wTIlhWIgt+TJzQCuP8D3HHBQh8Bly+gvbqugoap8IWnUcAPBq2AYZ+5Zp15a3IyeZo7oyIgHgznD4TB0fTDmLjnJRBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739488142; c=relaxed/simple;
	bh=Z9LTzZRPFLnZJT5XMSZGdfur7lQk3IZ92SFbdqLDh9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pu3ZtZ4AEyJBmB7Pnot9K+Pt50ktDrkmgz+xP91Q0UvjZzUlLP5hTQcYAmQLEZINyUxSiTdy4Ie9xa2FEySObiwH5pVBey5pAIsnCHB56kes7jqyyFvRFOh4gXpGi6kMPdbnaTDb/yUcGCkBMhRwO5aPVkZSLLxA5nLaSoHpZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GK3ReekI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54504f29000so1418910e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 15:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739488137; x=1740092937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hj7mvcg1AIpuBCAS0OPKw5ndsiDf9b+OHpTi8fYuGx0=;
        b=GK3ReekI0nrlxHOInU4wZ0YvQ3dVMRMrQuUUPNTemViaCMHFFMyP/vrftj+c4Y4b4n
         J9ROm0+T5a/R1IO3umcINmnPdNBxG8q+EU9moyCKVwzleiyfV5vsEyI38uNdKY9VYWc3
         D20CjF+DD0RKP9/LcUsPLKJ8zzTeUd9zDX5SdID35jWqwMX0Y1vFanLrfQB1+UQyu8I5
         7BzAXqaur6jBwihjBcAZNBzYRcgw3vjK/BfhH7mr6X3XxeoMZuq+ENTzmym7pSl/iO0f
         HGQDyB/aLw2oSSBGoJqkPop2hY47TM1vzckcZuLQO+5OtC1gv4Bl7eZI7GPR+WeRs4Am
         Gr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739488137; x=1740092937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hj7mvcg1AIpuBCAS0OPKw5ndsiDf9b+OHpTi8fYuGx0=;
        b=wszdEj6uuTUdi37PhsBUVJ5H17mX3qmWsHBRlG+KNJVbFT30yoQ6eX2QcDyL/8p7gh
         diRf6CvmAKQsAKVTw2sfANwawVS1hB2cjpvdq0YG1cxzOMx9CxOMoIiQ+9xtg6xd8y5V
         WYiyhr9ndvKnuDBGzm7S1RH3t6tlcjO9OZ9UslVwpASvhkXAUE7z/ymVkySZ2GwAYhxS
         cxVFScow0WC2E54kJaJg4ZuqorAaLfjuwcZ6lvG4cVagz28pAXtCvF27rtw5tuSwrTZD
         1pZFAdYX5Xw4DpjHbQ1NzO9vqndyq2e5OlhkiidAi9uL6g8WG7JKmI+nTELUkhLHB/WP
         rxpQ==
X-Gm-Message-State: AOJu0Yxkk8aqPBZUNYUiHfKR6QvYa6tBjKmkfo3xNjNP7HaTxfaQ4xqG
	aarTJISwEQFPoyeVaeqVJCeHGdbdOPwzEggDIJWQ3RLCgadXyJSMS4kugMjb2CTpkcs/uJ8wjaI
	J
X-Gm-Gg: ASbGnctqK1RhQa0gRLBbXoGNQhwpapYKgyqiB6SfRjM6MQnjQFHIZq9ALlkZTQwj6+e
	McfA5sawfmqCTQswhjNAxo2A6+axajS8AIxqMg4qESNYch7XIv46mPctk9SZRTyMFEfIAHFuuRZ
	Lqr8hyNdR72NoTHlhyxkg0+Mek7ssKyMhpPoKHOjSrlbc4q+abI4+JYtcTdaqk9vU1kh0day234
	HyuKEEQh+uFimBXp+1R/ZS2ubRh2FPZnDuBVW0PSPu6UJ03cINRjRdrPLkD3kpUydTbXSt1zWWP
	fXWkYVEy4xOIMBW7EgiUhRbawQ==
X-Google-Smtp-Source: AGHT+IGbA67sWRiyJSCP+N1IcVrO7aBIgY8Go854Ne5WQtWV42lRfL5yIVV/IKjbRF6Ies6kBgfMNw==
X-Received: by 2002:a05:6512:3b87:b0:544:ee5:87b0 with SMTP id 2adb3069b0e04-5451826e9bcmr4066712e87.3.1739488137518;
        Thu, 13 Feb 2025 15:08:57 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54523070a9csm155943e87.5.2025.02.13.15.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 15:08:57 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 00:08:42 +0100
Subject: [PATCH 1/2] gpio: mmio: Add flag for calling pinctrl back-end
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-vf610-mmio-v1-1-6cccd0292e84@linaro.org>
References: <20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org>
In-Reply-To: <20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org>
To: Johan Korsnes <johan.korsnes@remarkable.no>, 
 Haibo Chen <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

It turns out that with this flag we can switch over an entire
driver to use gpio-mmio instead of a bunch of custom code,
also providing get/set_multiple() to it in the process, so it
seems like a reasonable feature to add.

The generic pin control backend requires us to call the
gpiochip_generic_request(), gpiochip_generic_free(),
pinctrl_gpio_direction_output() and pinctrl_gpio_direction_input()
callbacks, so if the new flag for a pin control back-end
is set, we make sure these functions get called as
expected.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mmio.c    | 36 ++++++++++++++++++++++++++++--------
 include/linux/gpio/driver.h |  3 +++
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index d89e78f0ead31f30c014b201cca4e32ecb377118..d4f72a0f6ed89878d64055ab28d888a7be08b126 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/log2.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -323,9 +324,19 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
 		gc->write_reg(gc->reg_clr, clear_mask);
 }
 
+static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
+{
+	if (!gc->bgpio_pinctrl)
+		return 0;
+	if (dir_out)
+		return pinctrl_gpio_direction_output(gc, gpio);
+	else
+		return pinctrl_gpio_direction_input(gc, gpio);
+}
+
 static int bgpio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	return 0;
+	return bgpio_dir_return(gc, gpio, false);
 }
 
 static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
@@ -339,7 +350,7 @@ static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 {
 	gc->set(gc, gpio, val);
 
-	return 0;
+	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -357,7 +368,7 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
-	return 0;
+	return bgpio_dir_return(gc, gpio, false);
 }
 
 static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
@@ -403,7 +414,7 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
 {
 	bgpio_dir_out(gc, gpio, val);
 	gc->set(gc, gpio, val);
-	return 0;
+	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
@@ -411,7 +422,7 @@ static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 {
 	gc->set(gc, gpio, val);
 	bgpio_dir_out(gc, gpio, val);
-	return 0;
+	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_setup_accessors(struct device *dev,
@@ -562,10 +573,13 @@ static int bgpio_setup_direction(struct gpio_chip *gc,
 
 static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
 {
-	if (gpio_pin < chip->ngpio)
-		return 0;
+	if (gpio_pin >= chip->ngpio)
+		return -EINVAL;
 
-	return -EINVAL;
+	if (chip->bgpio_pinctrl)
+		return gpiochip_generic_request(chip, gpio_pin);
+
+	return 0;
 }
 
 /**
@@ -632,6 +646,12 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	if (ret)
 		return ret;
 
+	if (flags & BGPIOF_PINCTRL_BACKEND) {
+		gc->bgpio_pinctrl = true;
+		/* Currently this callback is only used for pincontrol */
+		gc->free = gpiochip_generic_free;
+	}
+
 	gc->bgpio_data = gc->read_reg(gc->reg_dat);
 	if (gc->set == bgpio_set_set &&
 			!(flags & BGPIOF_UNREADABLE_REG_SET))
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..e867d52daaf26827324f9e17b5c19c55978ed7e7 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -394,6 +394,7 @@ struct gpio_irq_chip {
  * @reg_dir_in: direction in setting register for generic GPIO
  * @bgpio_dir_unreadable: indicates that the direction register(s) cannot
  *	be read and we need to rely on out internal state tracking.
+ * @bgpio_pinctrl: the generic GPIO uses a pin control backend.
  * @bgpio_bits: number of register bits used for a generic GPIO i.e.
  *	<register width> * 8
  * @bgpio_lock: used to lock chip->bgpio_data. Also, this is needed to keep
@@ -478,6 +479,7 @@ struct gpio_chip {
 	void __iomem *reg_dir_out;
 	void __iomem *reg_dir_in;
 	bool bgpio_dir_unreadable;
+	bool bgpio_pinctrl;
 	int bgpio_bits;
 	raw_spinlock_t bgpio_lock;
 	unsigned long bgpio_data;
@@ -713,6 +715,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
 #define BGPIOF_NO_SET_ON_INPUT		BIT(6)
+#define BGPIOF_PINCTRL_BACKEND		BIT(7) /* Call pinctrl direction setters */
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,

-- 
2.48.1


