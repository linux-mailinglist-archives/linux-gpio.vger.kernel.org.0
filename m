Return-Path: <linux-gpio+bounces-18301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7A6A7D5B4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EB8C18978E2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DA4227E90;
	Mon,  7 Apr 2025 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oLWxQaFp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1996122ACF2
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010364; cv=none; b=gfU4Ww1qCMWNlkywLUkSUKlMnw5e9OdL+a3QJ0KKuLa/wiaf7B41kqTcVCwqLfROp4kWeOcGVFdgG6qXS0qjmfGDwtnQ7XmlfviyRmBEpTNmWTM0ZOBqczK2vF5jnnhR8Zp72VSk7OwBjPKXG3CNPXzyQdmIRhV8chz6jYjDppU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010364; c=relaxed/simple;
	bh=Q2hvduva6KqQkHASyRGukCcsvLKULC9rmnwEVzjrJTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WZtQHsLzli8DW7dwK1zqow+hL5FvN2YignApZtP/jEVYbbGUOAJ7/uWXVBsIXulzHledyCMWcgHnWYQw2baadV6YcB2MVXmdQn4l0bv23SMg8j3XFg79urM+auwB8TqvayMZWFSfk8HQEqtj0WZTTOzq6QaCB9/BB2sRwDvUw3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oLWxQaFp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe574976so26704245e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010361; x=1744615161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibROZn0IFJz5QzV4WaY8wi22jP2cRYC3gjXYgtkdD7g=;
        b=oLWxQaFp+C3VxZ46ZZNGEOfNKpcJtHTU846ls9eWtPRc6ZudtRu/S4xW6pmiDPxsAP
         3Xowt/EEScMq7ChRnbkj7Gggyt6N0Ko2CHdHLeegxaNDcRBYscwHDLYL3bZRuYw1fEYs
         cBCOFtWXg0XBD79p22KAeT/lfKXWxkdl3Fb1Km3oRt3pB3LjAjy27xJq9ooUV3IbmvFt
         U/vBI+J3k9bI6vbrWM9xJy7v54Qj0HuFJDvthXHALNhNU+huO2OPD6tlm3FnUIM8qniH
         KPsT+WXu4WOb6W54u2iHaPLixAvcV+egaJVKB2YgnBcBrLwv5uxLOz54wgcJfcabit7J
         U5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010361; x=1744615161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibROZn0IFJz5QzV4WaY8wi22jP2cRYC3gjXYgtkdD7g=;
        b=ZQD6ttwHtzr+Up+Kk0JxienlUTVlwXUD2GT5rLKqFXcSUvC3F4dlsnkSq5X1tuSLcj
         2im8fBV4tQx1Jl+VkJ0vgA9tVuKcYxAjyhjRdCWcSvGohmi7K1t/PTb5D+Gny3vXLbbk
         HIaUkiXcyvithvnAcHoy5guRax6GQQXzJcy0ag6rtK7LWqpbcqzdy2HLYs4hBV0nEasu
         GzgjmTMlWquC25L+PYPSWhmI/g03Ei2/md4G7cLaOt0FXQPQnp854abDuWVRodrt+pXP
         OzwFjEnudtXAJPPv3I71LixuKgnvfLuQcRNN703RvIaGaYJ1I7Fwic7tD+fP3WgmQNbJ
         qcDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU470IVc6EUXPwswSfB+6OJhj7F8G8HpQjidbOG5UyngRqc9KH1Kex50mYNH6xtGRLZulKWiwZpW0oR@vger.kernel.org
X-Gm-Message-State: AOJu0YzjsDEpk3ppjIajfQQkmQNcknVf8eI45+eXgrBMZUAQi4hjz9nO
	xnAGOprPfpjSWtrR4WL0pbNrBpIB/WpShdyPVLSjXD+00giJFugANhAMi3Z+3J/X7z64KEoAjii
	u8JM=
X-Gm-Gg: ASbGncv7BEpFB+dgCGqB1R1nyxqSYlAal5iAEwTGFP50cvTUr2he9Rs4wGhHhnj8Ir/
	BlOtzFgiAapthT/83xU718deQPS4HuGPmpZKEknduLAA9ZnCXZJ4wHPv0fCG4D+3MZ4V4AmFPu5
	PpdittWWWrlW2tdtHV/gIl/WHVomvGYh5kkcSDp3Jt+22+FJz9PQW6vlHg0qJpBlmg1ZiuTH/jD
	i5t3cMgpwg53azCqce3MKgxhtq5jMlM2I0+FNb9sImL9mWApQZBPs9NwcPyuyb3fFR07rMMmlhS
	67yVXf3eWtPqh1jLYQOmBifjUvu3T/QRmwyAh1R/6I+UwoHd
X-Google-Smtp-Source: AGHT+IEkHVJgOyU9xGp655NX5EHCzYygkvYDzVBi2Npjvs/0OWrQOPdns3JjSlF95Cj2KJnmKf8UhA==
X-Received: by 2002:a05:600c:198b:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-43ecfa0572cmr131452905e9.30.1744010353699;
        Mon, 07 Apr 2025 00:19:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:19:10 +0200
Subject: [PATCH 1/3] Input: ad7879 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-input-v1-1-a8b45b18e79c@linaro.org>
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=foyELHbizbcWk/j9r8xiniRZm26jVuqeFRwl7mGDslU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83xvMsVuyrAN8UuFJvWiCgwJIhVanOjs5RyNU
 f6v6R7ldHKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 cjBhEADJTqfjnpnZK+R+cF6dWcfSD6GmueJNC9Q1SYVFVHW+TQvc3mi2GfaIHJIqqkmrqMSa7VV
 LWzNtodZD6j9I49JZvliGWrbph/MS2MniyULfTw/GMwmhPwZYpi9g5+4cwopCvfPbMUouldhvUO
 cp8vdggCPeBpOaWx/AmYIEeSB/Oy8RofO4vsuvh5/elW3GueigH8vQlas2CQYBndd0kk8OEgdZY
 e4/wFB5pNg5mKqxB7byMuFhmkDtdSEHWP+O1H5+66MQVXNJU/Iy++0DvU1fQJZumxIZxQPIFXCb
 k9yOgd6MtU4N3gcM5dtjsIt+BIVmmn+VDbGrlIvJrk6AmyD0JdtgwDITtnWE5BQTCLkbDtZXM8b
 q+B+ct9iHNr54/R3EPgziIWcCf7cW/FrGqWZE2g3gq/NVmo42KTfZxcY6L6BfW+N6QlI2UtiThG
 62dx7KHW75jBQTWMU1nC6IX+5KC4S6XtY881B8phngJLNcmh3c9itLogh95f229if6u/ktqZIBK
 Mh9Tx8iQMLEyFE383FA6SQQYC2gghSl7zYDqqw5QZmdGbjpEaufAfPbZmRQC9a8pwGE/Dbf8Y1D
 W+9NBHCzUnLCeJtFZlh9Li4FwhHBoRNA1DbM1nJwK+1Br8ruCTsUWJ0mSgmUTC0INmrSfQsN5F6
 wJFGm3Ml2SPjJdg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/touchscreen/ad7879.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/ad7879.c
index f661e199b63c..12fc39f9e784 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -444,10 +444,11 @@ static int ad7879_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & AD7879_GPIO_DATA);
 }
 
-static void ad7879_gpio_set_value(struct gpio_chip *chip,
-				  unsigned gpio, int value)
+static int ad7879_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+				 int value)
 {
 	struct ad7879 *ts = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&ts->mutex);
 	if (value)
@@ -455,8 +456,10 @@ static void ad7879_gpio_set_value(struct gpio_chip *chip,
 	else
 		ts->cmd_crtl2 &= ~AD7879_GPIO_DATA;
 
-	ad7879_write(ts, AD7879_REG_CTRL2, ts->cmd_crtl2);
+	ret = ad7879_write(ts, AD7879_REG_CTRL2, ts->cmd_crtl2);
 	mutex_unlock(&ts->mutex);
+
+	return ret;
 }
 
 static int ad7879_gpio_add(struct ad7879 *ts)
@@ -472,7 +475,7 @@ static int ad7879_gpio_add(struct ad7879 *ts)
 	ts->gc.direction_input = ad7879_gpio_direction_input;
 	ts->gc.direction_output = ad7879_gpio_direction_output;
 	ts->gc.get = ad7879_gpio_get_value;
-	ts->gc.set = ad7879_gpio_set_value;
+	ts->gc.set_rv = ad7879_gpio_set_value;
 	ts->gc.can_sleep = 1;
 	ts->gc.base = -1;
 	ts->gc.ngpio = 1;

-- 
2.45.2


