Return-Path: <linux-gpio+bounces-18542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5A8A82050
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 10:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E18A47B71D1
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 08:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE9225D8E1;
	Wed,  9 Apr 2025 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Wh+7qFmQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E683A25D21C
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188052; cv=none; b=Tb2waMlAIljYEPiabIhw7OWRzEKC8UiDyPL6TMVZuDemIamLDjBf0pEKrBQ6wsP9ieWVrbYN3ARvFGXQmzUIl45cc6LskVzNtKIpVRNq9jSC7q8tSZLxzhjPhicqip7CS7zw4/a5RRxCsH1HGM6/GAgSlpTXDLDLGp7kMTHpg2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188052; c=relaxed/simple;
	bh=pbTe8qf0kM23ufjkEF9J9UHiqeRqkU6/ANRUXpGOYIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzWIeMMhmnrvUgFQTSkGOepuYiQqeW+TrS2+nw6EIDBL5LTq1IK4MKE50xgjTjp+RME+jH2kM40wR4aZbj3rnX1GsHtrxatDG2cNe4e7nONvLhF/z2tXOPfZbHHqJy9m27gwQUAHjCccJTGfdGRbWjFmznkl2UGUaEqDKLpjGJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Wh+7qFmQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a823036so58965625e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188048; x=1744792848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Taz3xuepxYQKsRgP/wZRl2QjotKjajKvx5x4lMN4Juk=;
        b=Wh+7qFmQzD8lxV4X0VO3o0R3J/OcwsWCoH7AoxoRP1qa/dUziRuxF4wuT0yz5kxs0j
         G+DffgeCMIc5zYlfYI4Idlc/gceqS+LYnztCAlo30tir48Cf5gn/EqjbSedaQDUgdPMu
         qZMUXPFGaIzmrHW1H+AGi+y5bK5xUdRxo1cajtfeXpOgGj7/Onj34mUgqqEaUdnVLIFV
         WRUTGaWmdX97wVEXD+9f7Cq6VOhqaHc4oVwlr0RTrq1Tw2oFtLys4CxLQlTJIrCpJ5QF
         KNEKlbPmesmV19iwBJVOfOEHMvd/T9TDHRzBDsJyGiyq935MFESuofNyZcsTa2E2iJSi
         2HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188048; x=1744792848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Taz3xuepxYQKsRgP/wZRl2QjotKjajKvx5x4lMN4Juk=;
        b=T5v/QZYcvWzl820v1SGpuuMPSnM9Z3CKeyuSd/cQe9uYAGxwtQb2jHYALtbn58jvcK
         LXBqh+T1y+VJEfyGGdNhMSnev9nfd+/mtxHnaFtsx/iXk6Hnovl35EGpI5eELy+SVzMo
         erutagU15antJ9TZ+tAS+4ixzDT7V13u6eCEGVGQmbZtypA7zyj/OXxad/+b0fDE13EV
         2cvEToujpC9qOP3o9J4qQwChYQAzM/5E2zUyz1JdNQtC40i6x4LORdtaDMcAs8guF0Ce
         ipquYQ5YS6lnKWQwq8BrKkbfK3qEzQIarvT+zIYLse5CllHWt00h6c+WJUj/MJ6NVEqT
         +v1A==
X-Forwarded-Encrypted: i=1; AJvYcCX01On7InN313xTRa6kiDcsoEkCG13JY+XWxHVEt1lj2iqP8xbSGaEcW6JyH/pyW37N1CzzC1kxiRbV@vger.kernel.org
X-Gm-Message-State: AOJu0YwvCQyBPKXZKbzKiXGxSpw38NlU6p5aINYINja+/D0XrOHBm+4s
	4Zvp4bq+Rcc+BuIAzldDVZD9KiaGo/dEKmAg/qTtZAFH6l8d0aWntjjtHwbwCU4=
X-Gm-Gg: ASbGncv3km50brIYPxode7hQCj+qCtycUMA5DJ8B8c0GLmte93vDJvo9JNPTjV4Ln/6
	2bsx129+xHro5tWbCwtRwf80wqjSSysNj9sqCsQMnxNBAsQrdI3xqmUz4DS+I7Hpa5Mtse8EAjU
	u196Nlwk6eexEiliNFZFJqUUIDFERxJjTcBCyjPAHvQaKy72KJ/sfdu13Szj/j2PhQInSuzQTAo
	478+M28KnmO1t92ImdnhWqGiPJDGNccfuBRyHuFz5iC9pkZscY7zLbNGnDIaA7n0oAstiGXI275
	e3uxMhKrVxJOhHi2v77vOELWACPiJn5J4A==
X-Google-Smtp-Source: AGHT+IGMhUfCSWQGFB5uvH4/GS4X8GJnxqQ0UFim7GSu4hAoM1CRy23ZBBa463ljosi477RhQDam9A==
X-Received: by 2002:a05:600c:3d94:b0:43c:ec28:d310 with SMTP id 5b1f17b1804b1-43f1eca80e8mr21424905e9.10.1744188048120;
        Wed, 09 Apr 2025 01:40:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Apr 2025 10:40:40 +0200
Subject: [PATCH v2 2/7] iio: dac: ad5592r: use lock guards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpiochip-set-rv-iio-v2-2-4b36428f39cb@linaro.org>
References: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
In-Reply-To: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8820;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1vAOkph4RSRlxXIL03fJybHqa8k7PtHiCUYi8heCqHc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKLZVn1FOhgbMDtXZw827Abtxy1D8yn3IvuO
 sMRKUkuydSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyiwAKCRARpy6gFHHX
 coN8D/4vxRXZ3tWjiGyIv72luaGwtMnEOJvgFSIKHF9Uya0djXcv1SJB7TgJhyZQkiuBahr6rGY
 oWhY+BrHin5LBrySTVdTJNDoL7cYfJeJT9l/aUJS4EMY7kjdq22nVlWBNeP2NoSZFFvFjSeEtQW
 ly3bHKE2RtgSxAn5zFWXk2iygQqLYSG7Ex2KwdiuUj5MtCaM44sQtKo7EnCYSnYH0bW7Itysi/j
 KtEfkcJ5RGXn21BkPo8tzeOcgiKYL6J/wTnk5ZPc9UDoaOsanHqjm2BZhTRFb6VdgyUB3s6kfGh
 NUyMybUXsGsWkOWHskotR6zReUolFzyqRChaAQTwNeXw3oDKEmgMPqyeT8ceoy83rOzGqRQUwtC
 t+AO5smaE7Aq5gT5P3IGmK0b9jtBzCe+bI6rI/9divtj3cVkx/o/DXCwCrhmi34v3x2BR7fF3m7
 Q5GnyrgQTh/KXPztG5Ts+jBSPxsPKQWZC7BDtPTjFEg+A1NOWasTOQxSwPGSbLs8jR7lzaB4i87
 TLl+7QKg0NewGGD7B9jT6CfPhQvxL9okCEwKlQfLfIfNuSHVZ672/CHqQNltRffRx+65PYg1Mul
 8FAFJAIgSv/ZhseCRm01CVi1596ks7fGon9FSALH1NDkMT3Als7bTY2xWFxoX1JXPfr4cMYZb51
 QOkAE+PwcJYJtiQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use lock guards from linux/cleanup.h to simplify the code and remove
some labels.

Note that we need to initialize some variables even though it's not
technically required as scoped_guards() are implemented as for loops.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/dac/ad5592r-base.c | 132 +++++++++++++++++------------------------
 1 file changed, 54 insertions(+), 78 deletions(-)

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index eb85907f61ae..ada60f5ff1b6 100644
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
@@ -249,46 +235,44 @@ static int ad5592r_set_channel_modes(struct ad5592r_state *st)
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
-		ret = -EIO;
+		return -EIO;
 
-err_unlock:
-	mutex_unlock(&st->lock);
-	return ret;
+	return 0;
 }
 
 static int ad5592r_reset_channel_modes(struct ad5592r_state *st)
@@ -305,7 +289,7 @@ static int ad5592r_write_raw(struct iio_dev *iio_dev,
 	struct iio_chan_spec const *chan, int val, int val2, long mask)
 {
 	struct ad5592r_state *st = iio_priv(iio_dev);
-	int ret;
+	int ret = 0;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -316,11 +300,11 @@ static int ad5592r_write_raw(struct iio_dev *iio_dev,
 		if (!chan->output)
 			return -EINVAL;
 
-		mutex_lock(&st->lock);
-		ret = st->ops->write_dac(st, chan->channel, val);
-		if (!ret)
-			st->cached_dac[chan->channel] = val;
-		mutex_unlock(&st->lock);
+		scoped_guard(mutex, &st->lock) {
+			ret = st->ops->write_dac(st, chan->channel, val);
+			if (!ret)
+				st->cached_dac[chan->channel] = val;
+		}
 		return ret;
 	case IIO_CHAN_INFO_SCALE:
 		if (chan->type == IIO_VOLTAGE) {
@@ -335,7 +319,7 @@ static int ad5592r_write_raw(struct iio_dev *iio_dev,
 			else
 				return -EINVAL;
 
-			mutex_lock(&st->lock);
+			guard(mutex)(&st->lock);
 
 			ret = st->ops->reg_read(st, AD5592R_REG_CTRL,
 						&st->cached_gp_ctrl);
@@ -360,11 +344,8 @@ static int ad5592r_write_raw(struct iio_dev *iio_dev,
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
@@ -379,15 +360,15 @@ static int ad5592r_read_raw(struct iio_dev *iio_dev,
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
 
@@ -400,9 +381,8 @@ static int ad5592r_read_raw(struct iio_dev *iio_dev,
 			read_val &= GENMASK(11, 0);
 
 		} else {
-			mutex_lock(&st->lock);
-			read_val = st->cached_dac[chan->channel];
-			mutex_unlock(&st->lock);
+			scoped_guard(mutex, &st->lock)
+				read_val = st->cached_dac[chan->channel];
 		}
 
 		dev_dbg(st->dev, "Channel %u read: 0x%04hX\n",
@@ -420,16 +400,14 @@ static int ad5592r_read_raw(struct iio_dev *iio_dev,
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
 
@@ -439,15 +417,13 @@ static int ad5592r_read_raw(struct iio_dev *iio_dev,
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


