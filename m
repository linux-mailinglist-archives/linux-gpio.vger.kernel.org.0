Return-Path: <linux-gpio+bounces-18293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D6DA7D58C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9944E1750DA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E5422D7A5;
	Mon,  7 Apr 2025 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YkbkOu9+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AFA22D783
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010298; cv=none; b=EWDXd2wvieDDxCH7SSi7+tnwJDqCSE4Zh4oKe9HJ7PXnBdW7tx0ELmmQ9ffxgzvDt9Kmvw7w5nNaJ8uRFTbT6ts6OFbBKy+GUS2V4Sd3f3OQpZbDByQKexhOSdAySe5FpnoOQdpgunSHS11JGWd4r6RwRzzXSkgim36JJCgMHX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010298; c=relaxed/simple;
	bh=zj5ug8ovlw9ZHzpl55Bg/sdI8fliJrYCQ7ucoIA4J1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mj2FZ19guMgvEIvl6JZVkUcb/+2/mWsuyGUrEM/6UmKRPMCHzztwrj25kZBkbKlJG04GY52Q5ctoq0wQx5FqXJjVREpYLIcm5jMDM890Qegv7JY8gZAlElpqq1uFCqXkEmqu12H3lipnzCTBuicgBoz2ICo9DmPeu3nh4oDeSQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YkbkOu9+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so37165765e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010295; x=1744615095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xERYxzCdXFfBQqpEHcpUJZIcd8NycAIVtZHrNbldPXo=;
        b=YkbkOu9+gUfz5sHPnxvAqEDd2ngzGo0eV4eP2LA0aBXhzE5oL2ByezBTbJnksq2WeE
         g1bfMjo962y0OuOSYZjUkcV6r3gLIiYCtp12qgo1oStqTQ4l/BAboJH06FFWpYv6r4Gz
         5wJJBJHITpCOQvkzvKsQSYZ4mYTP3T9hZ7YYb85YfYIO5pdKLuA+B/blL9F3lDm2J8G2
         vOqk7HgUhZ6h+v0TzHrKRQcUsO8T1l/KvGWr08nfLgsXCusxgwmTO7Canc7iqjg86vMi
         AfQ8QImmaUcZTyVFnYat5vHal/Vx5DmDNjYijDm3aD8Rl4qo2VIHiw6vbXVVHMjj8KzP
         51oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010295; x=1744615095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xERYxzCdXFfBQqpEHcpUJZIcd8NycAIVtZHrNbldPXo=;
        b=kL3eQNu1/pLNv3824xfJBweeqE4EgkREJ/MJKAEbIdLY3GVjgvztPBbzDqQUPtmNG7
         Lh8xUnL55PrUbbL0xvf6CDQpIp0MuNNDAeHVhWR70OW+CMxtVV/QvK6yOIONQZ6Zq2Jp
         mKCTuPFWceiSljWs3+YYM9ZA78LsosblFrFJ6Tj9BIbcDWBy8hxBY2hlcBj4VTuvuWbu
         oP5wf3lASKmTpSfC1O+w1grhOSQ6VAXRXh2DQWbey3Izi0pdlfit8CkpomQOV0ejDaiw
         pkXy/NbWMn3CVM35KgnanVYNG6AdC6DaYfXfBXBOK4sCQLqgaSwjJ7X91jyf7uJrJiAl
         NUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE4/A0HM1kXe9AqcB9SCZ/PXpR7z94uBS9QXl+P3c9nCHlYXva/GVJl79pdrbULsu5gd7BRMIBKL1N@vger.kernel.org
X-Gm-Message-State: AOJu0YyYj6LnTMbrEAquVK4CkG+4haUsZyPOY9AEt7l9UOAXS0xjHQW8
	M4uqwYxXSEDcwi6hmqwztp4VbwW9y0CSg3uy3KViuzdjLFtNv+LA+Bgi5b9KDX4=
X-Gm-Gg: ASbGncsWpRRAD+A5AgZX+UxMGtG1bD/zwP23lbyfwRybe5fui9ob3dx++O3ItKL+DLi
	973DcygqzH8jEBR9TmbrVEcEP1m5OcrabYFbp3/9VVbgth0XsUqqSUkQFvlfKMjk7E62tFmSiyZ
	LewrvFPMmTwH21cqFsonH2F5SKNm3Q6erHYZp/cQxUnX7HBn4O67XsHimN2/CFlAN++9bownnMY
	hwzZBBudQEkcPLw6GEyMw/2YO1p6KSqgpkb4V/7rcRnQ/aRoUIjnd+mjEQO1nco89IdLE1bNsA8
	NtouHYUL4rksysSN6PSyFTPy8E+XtIKOiC0eTQ==
X-Google-Smtp-Source: AGHT+IFtRwblBwIEchtvA8k1duTNZwKxIZCvCCS+rybE1gUfbu8eZ5wc9Hm4N7OETrLYq1shI7lMyg==
X-Received: by 2002:a05:600c:848d:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-43ecfa1874emr97612425e9.29.1744010295108;
        Mon, 07 Apr 2025 00:18:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:10 +0200
Subject: [PATCH 2/7] iio: dac: ad5592r: use lock guards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-2-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8324;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2uyDg2/H9YP2L1NNh1G5LpCHDDV8ztorbvs/2/ecsX4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wy4EKKAN4IT+1wGpxG8/g59bpkVKrkrSsHo
 anjZ3dgIoWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MgAKCRARpy6gFHHX
 cuASEACJFjDu9M7qv5gdKRWtmCsVlBsr60Jlm4BBEqONkXR+siD7+/XLoWtl+eUmVN/0u5mOJ0L
 tMapa/tA2lJVSR5Z0e5onE37TIgk9IB7rMDr7uv2LS9x9HQnbqN8okLJKDe8MSivhJZjo8G76+v
 C7wsxYInkHGAwxLu9OWXqTqbRQtpdpTxOExpy4i8QA73SfdXaRnQgMimfqHY/Jx6DhTnhfuQPAP
 YmJyc2uaQ4ijREHovqMKjbDJhqD4RY8OepQoKYxYhvqTSDj4YtVr/HHUXjQZlC9gdcVVPHnKiRZ
 52i07IKFULK6d70Sj/kQ2zsNS5OT8QGfDIjlopJ9D8oaywhllmndXQiO7TgJqNmuPbR7wXbxhMg
 Td1XCvwqp4FD2EixWUMpjR1fPa5CBE/aCKxj/j/9s/KOOerZtL+ugv5rUnAnldwShHhByP/PgeD
 VztS6VfQDe6+DVlsaQz4n3oP02o/dRyXVyTOtRtnpbMYG9L0sn4/zznjp0NZM8/xdPVwF0hTP+Y
 DcS3YTzB3Ksd9zrjSySZy/MJbJTzvYgbviQFWMKz14I1wvM7ccoEfhQlXaoX1AOY/hbUm0UJrpt
 jtDvJvAPY+vfEpPcW8m+vOFN7QmodINivWh6vRER80kWoP3ngF3LDeuigtOvDIe8ZNi/qSPqykm
 lzm3OLjDsqXOVpw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use lock guards from linux/cleanup.h to simplify the code and remove
some labels.

Note that we need to initialize some variables even though it's not
technically required as scoped_guards() are implemented as for loops.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/dac/ad5592r-base.c | 119 ++++++++++++++++-------------------------
 1 file changed, 47 insertions(+), 72 deletions(-)

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index fe4c35689d4d..bbe3b52c6a12 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/iio/iio.h>
 #include <linux/module.h>
@@ -24,16 +25,14 @@ static int ad5592r_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct ad5592r_state *st = gpiochip_get_data(chip);
 	int ret = 0;
-	u8 val;
+	u8 val = 0;
 
-	mutex_lock(&st->gpio_lock);
-
-	if (st->gpio_out & BIT(offset))
-		val = st->gpio_val;
-	else
-		ret = st->ops->gpio_read(st, &val);
-
-	mutex_unlock(&st->gpio_lock);
+	scoped_guard(mutex, &st->gpio_lock) {
+		if (st->gpio_out & BIT(offset))
+			val = st->gpio_val;
+		else
+			ret = st->ops->gpio_read(st, &val);
+	}
 
 	if (ret < 0)
 		return ret;
@@ -45,7 +44,7 @@ static void ad5592r_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct ad5592r_state *st = gpiochip_get_data(chip);
 
-	mutex_lock(&st->gpio_lock);
+	guard(mutex)(&st->gpio_lock);
 
 	if (value)
 		st->gpio_val |= BIT(offset);
@@ -53,8 +52,6 @@ static void ad5592r_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 		st->gpio_val &= ~BIT(offset);
 
 	st->ops->reg_write(st, AD5592R_REG_GPIO_SET, st->gpio_val);
-
-	mutex_unlock(&st->gpio_lock);
 }
 
 static int ad5592r_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -62,21 +59,16 @@ static int ad5592r_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	struct ad5592r_state *st = gpiochip_get_data(chip);
 	int ret;
 
-	mutex_lock(&st->gpio_lock);
+	guard(mutex)(&st->gpio_lock);
 
 	st->gpio_out &= ~BIT(offset);
 	st->gpio_in |= BIT(offset);
 
 	ret = st->ops->reg_write(st, AD5592R_REG_GPIO_OUT_EN, st->gpio_out);
 	if (ret < 0)
-		goto err_unlock;
+		return ret;
 
-	ret = st->ops->reg_write(st, AD5592R_REG_GPIO_IN_EN, st->gpio_in);
-
-err_unlock:
-	mutex_unlock(&st->gpio_lock);
-
-	return ret;
+	return st->ops->reg_write(st, AD5592R_REG_GPIO_IN_EN, st->gpio_in);
 }
 
 static int ad5592r_gpio_direction_output(struct gpio_chip *chip,
@@ -85,7 +77,7 @@ static int ad5592r_gpio_direction_output(struct gpio_chip *chip,
 	struct ad5592r_state *st = gpiochip_get_data(chip);
 	int ret;
 
-	mutex_lock(&st->gpio_lock);
+	guard(mutex)(&st->gpio_lock);
 
 	if (value)
 		st->gpio_val |= BIT(offset);
@@ -97,18 +89,13 @@ static int ad5592r_gpio_direction_output(struct gpio_chip *chip,
 
 	ret = st->ops->reg_write(st, AD5592R_REG_GPIO_SET, st->gpio_val);
 	if (ret < 0)
-		goto err_unlock;
+		return ret;
 
 	ret = st->ops->reg_write(st, AD5592R_REG_GPIO_OUT_EN, st->gpio_out);
 	if (ret < 0)
-		goto err_unlock;
+		return ret;
 
-	ret = st->ops->reg_write(st, AD5592R_REG_GPIO_IN_EN, st->gpio_in);
-
-err_unlock:
-	mutex_unlock(&st->gpio_lock);
-
-	return ret;
+	return st->ops->reg_write(st, AD5592R_REG_GPIO_IN_EN, st->gpio_in);
 }
 
 static int ad5592r_gpio_request(struct gpio_chip *chip, unsigned offset)
@@ -171,10 +158,9 @@ static int ad5592r_reset(struct ad5592r_state *st)
 		udelay(1);
 		gpiod_set_value(gpio, 1);
 	} else {
-		mutex_lock(&st->lock);
-		/* Writing this magic value resets the device */
-		st->ops->reg_write(st, AD5592R_REG_RESET, 0xdac);
-		mutex_unlock(&st->lock);
+		scoped_guard(mutex, &st->lock)
+			/* Writing this magic value resets the device */
+			st->ops->reg_write(st, AD5592R_REG_RESET, 0xdac);
 	}
 
 	udelay(250);
@@ -249,45 +235,43 @@ static int ad5592r_set_channel_modes(struct ad5592r_state *st)
 		}
 	}
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 
 	/* Pull down unused pins to GND */
 	ret = ops->reg_write(st, AD5592R_REG_PULLDOWN, pulldown);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	ret = ops->reg_write(st, AD5592R_REG_TRISTATE, tristate);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	/* Configure pins that we use */
 	ret = ops->reg_write(st, AD5592R_REG_DAC_EN, dac);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	ret = ops->reg_write(st, AD5592R_REG_ADC_EN, adc);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	ret = ops->reg_write(st, AD5592R_REG_GPIO_SET, st->gpio_val);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	ret = ops->reg_write(st, AD5592R_REG_GPIO_OUT_EN, st->gpio_out);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	ret = ops->reg_write(st, AD5592R_REG_GPIO_IN_EN, st->gpio_in);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	/* Verify that we can read back at least one register */
 	ret = ops->reg_read(st, AD5592R_REG_ADC_EN, &read_back);
 	if (!ret && (read_back & 0xff) != adc)
 		ret = -EIO;
 
-err_unlock:
-	mutex_unlock(&st->lock);
 	return ret;
 }
 
@@ -316,11 +300,10 @@ static int ad5592r_write_raw(struct iio_dev *iio_dev,
 		if (!chan->output)
 			return -EINVAL;
 
-		mutex_lock(&st->lock);
+		guard(mutex)(&st->lock);
 		ret = st->ops->write_dac(st, chan->channel, val);
 		if (!ret)
 			st->cached_dac[chan->channel] = val;
-		mutex_unlock(&st->lock);
 		return ret;
 	case IIO_CHAN_INFO_SCALE:
 		if (chan->type == IIO_VOLTAGE) {
@@ -335,7 +318,7 @@ static int ad5592r_write_raw(struct iio_dev *iio_dev,
 			else
 				return -EINVAL;
 
-			mutex_lock(&st->lock);
+			guard(mutex)(&st->lock);
 
 			ret = st->ops->reg_read(st, AD5592R_REG_CTRL,
 						&st->cached_gp_ctrl);
@@ -360,11 +343,8 @@ static int ad5592r_write_raw(struct iio_dev *iio_dev,
 						~AD5592R_REG_CTRL_ADC_RANGE;
 			}
 
-			ret = st->ops->reg_write(st, AD5592R_REG_CTRL,
-						 st->cached_gp_ctrl);
-			mutex_unlock(&st->lock);
-
-			return ret;
+			return st->ops->reg_write(st, AD5592R_REG_CTRL,
+						  st->cached_gp_ctrl);
 		}
 		break;
 	default:
@@ -379,15 +359,15 @@ static int ad5592r_read_raw(struct iio_dev *iio_dev,
 			   int *val, int *val2, long m)
 {
 	struct ad5592r_state *st = iio_priv(iio_dev);
-	u16 read_val;
-	int ret, mult;
+	u16 read_val = 0;
+	int ret = 0, mult = 0;
 
 	switch (m) {
 	case IIO_CHAN_INFO_RAW:
 		if (!chan->output) {
-			mutex_lock(&st->lock);
-			ret = st->ops->read_adc(st, chan->channel, &read_val);
-			mutex_unlock(&st->lock);
+			scoped_guard(mutex, &st->lock)
+				ret = st->ops->read_adc(st, chan->channel,
+							&read_val);
 			if (ret)
 				return ret;
 
@@ -400,9 +380,8 @@ static int ad5592r_read_raw(struct iio_dev *iio_dev,
 			read_val &= GENMASK(11, 0);
 
 		} else {
-			mutex_lock(&st->lock);
-			read_val = st->cached_dac[chan->channel];
-			mutex_unlock(&st->lock);
+			scoped_guard(mutex, &st->lock)
+				read_val = st->cached_dac[chan->channel];
 		}
 
 		dev_dbg(st->dev, "Channel %u read: 0x%04hX\n",
@@ -420,16 +399,14 @@ static int ad5592r_read_raw(struct iio_dev *iio_dev,
 			return IIO_VAL_INT_PLUS_NANO;
 		}
 
-		mutex_lock(&st->lock);
-
-		if (chan->output)
-			mult = !!(st->cached_gp_ctrl &
-				AD5592R_REG_CTRL_DAC_RANGE);
-		else
-			mult = !!(st->cached_gp_ctrl &
-				AD5592R_REG_CTRL_ADC_RANGE);
-
-		mutex_unlock(&st->lock);
+		scoped_guard(mutex, &st->lock) {
+			if (chan->output)
+				mult = !!(st->cached_gp_ctrl &
+					AD5592R_REG_CTRL_DAC_RANGE);
+			else
+				mult = !!(st->cached_gp_ctrl &
+					AD5592R_REG_CTRL_ADC_RANGE);
+		}
 
 		*val *= ++mult;
 
@@ -439,15 +416,13 @@ static int ad5592r_read_raw(struct iio_dev *iio_dev,
 	case IIO_CHAN_INFO_OFFSET:
 		ret = ad5592r_get_vref(st);
 
-		mutex_lock(&st->lock);
+		guard(mutex)(&st->lock);
 
 		if (st->cached_gp_ctrl & AD5592R_REG_CTRL_ADC_RANGE)
 			*val = (-34365 * 25) / ret;
 		else
 			*val = (-75365 * 25) / ret;
 
-		mutex_unlock(&st->lock);
-
 		return IIO_VAL_INT;
 	default:
 		return -EINVAL;

-- 
2.45.2


