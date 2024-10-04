Return-Path: <linux-gpio+bounces-10861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B3C99067F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 16:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C43528268A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D4721D2BD;
	Fri,  4 Oct 2024 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K+wwARGH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EEA21C16D
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053024; cv=none; b=C/gXTkrjKCRetZX33teeT3M+14WXj9Go19BNgyaBzitSI/Ro4aDgHEcYH0wFzqedO/I928q3ZPZdw6rS4cf5+J+W06sPsI8AmXJ4kFWusMGM9DZ0eLAK1a1YqfeJH5dQKmvjGL6VD4md8xfpBkK/2Gu8G/HNJhkSLmdiDKRRRT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053024; c=relaxed/simple;
	bh=/Zd1cgX1HwVAzft6FhAsQIQ8nKeMY7GUJrxKl5LGOLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZhMwFqtqBQ581dBA4ZcROm5YVkv2jHx8i67GW+wdE2okGyHj/iRI72HBOnpT4Gby9L5xizplOMUZKlnVJR2fK6+5i3p3J/FLddd9wkKSveOyHrp5df20jARj6wmJeCYAcl9dF8vrjyClXpfGPareuYKl2S2FkmKtOkTwkGHUUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K+wwARGH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37ccd81de57so1390211f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728053020; x=1728657820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jfb6YI80rw3zHCFbKnEyH1U6ooQ/9EXSdd+jltWULAY=;
        b=K+wwARGHfaxcKVQ1iOI8WE2FvVEnnPcg1b8S8kSf9t3xMFwDh0Xr+kHYCcf89sttpt
         +E0bijh6CXVeYDhFFrJlCCYj0anuaEqoeOWxWt1Oesh1oFh7MxkBCVEA2Ipnj2PfTeuL
         iO2PCEQhypTyTk5KCIrD6Wi8UbkIgP4zM6bZQnzyV3Q/y0rXzfYt6Uh4t2gm7XbnPqiQ
         fZZttrJlE+EaheJGudf56dKkK3qP1GTbhbJkCopHZP6Uy5VEMoPiD7mA3x0lXswYjFfj
         P8LVlZLXwlHK45u/FU1s5vudlHMLv5Sk/yPgPD1iKal9UfAkT69chFXv0qtrJym5gkxU
         4YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728053020; x=1728657820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jfb6YI80rw3zHCFbKnEyH1U6ooQ/9EXSdd+jltWULAY=;
        b=tXSzrqBCaJAB10FxnO096uo7jWupZeHyj0/FsJqtgRrJN7ZD3LyTeqsvEP43co0iBp
         tC/2bC9NNDghU2ykpUmPzjq0fifLxHir0mEF1eovKbarn0Wb3M3tgsh9Fep0REoqAZM/
         +JYBjYMxUKN1N+eOD3meLSd7v0xQrp4Kd1wmSIFIfTpKw5pcZyZbX3700+gTE9HSgafX
         JtmVvQCNvary04fesU+11FxcHKMT7pKaAlTD0UMZfzLr6ojXGQpwWG0cxrgxxWkZcgzw
         CeKuaxjANgjEOUD0vH9H1r25BofX8W/eRDjQj+ksDigssxy+qwL7ikbcrY8EnAchlCpN
         pr6w==
X-Gm-Message-State: AOJu0YwirELT0cN8pP1WmL+40/PaSXdYbSa1RCJBNZcDKz9PqKaF4l7x
	wtbOh9rjC/FukVlWHr6zcULLyBVievDqiEbcDzf3gPM0QnZiNWOMut9OjLQlGKW/kIviXdu3a4o
	X
X-Google-Smtp-Source: AGHT+IHl5Rwr13sP+gPr8mcUXq2K80wxzjjVKpp/yJWkdKYWjp/EW/nqphwrAkXEN5+Ks3owEwlDdg==
X-Received: by 2002:a5d:4152:0:b0:374:b6e4:16a7 with SMTP id ffacd0b85a97d-37d049e12d3mr4362850f8f.8.1728053019938;
        Fri, 04 Oct 2024 07:43:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:80ea:d045:eb77:2d3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082d20bcsm3361370f8f.100.2024.10.04.07.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:43:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Oct 2024 16:43:26 +0200
Subject: [PATCH 5/5] gpiolib: notify user-space about in-kernel line state
 changes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-gpio-notify-in-kernel-events-v1-5-8ac29e1df4fe@linaro.org>
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
In-Reply-To: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10719;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wknoPtX1dNfD1bs2G/w2vi/UQ2Iy2lVZXz1DzFv12YE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm//8Vlfd4WUuwSf0BjR/U8tazYo87l9su6YW2p
 NW7KwuqMoWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZv//FQAKCRARpy6gFHHX
 cutBEAC50WpKefyDXfPMvn6fvV1iP5lOHB9x2nNdV2B3GmZI2AeIOVlb8SORSs6hkP8c9UYuMI/
 uxLf1GEztlkepIRDVBEqCOlStrKjyxRq8xZZcoIAujPjag6JRnLj6SzunBoMk4Py2sN/gJdUpOE
 UAW7bzupBlA+v++1gKA5/uOG+aPfqJYkXddwzunpsKplqDFYs8hL10xeqq5B7UO7mXqNn+BDnoU
 BgBiCIG6T4rAgAVJmv2CcJtQEmzKH0BKnyVJvYTvddA7jXieOIa8YVtPpSuRPvPOsKaull/jSIz
 +2YzdxoCEFSN3Ns/XX7MXUDCsX56Zcltupck3HPYyHfT6sW3lnCnUx8gO+GYznX7DEl92SbR8mc
 3zn4PGe4iB9kTvk3i39J2D829mu2iC0fVo/9q7BDbpreGrY4Fn6p5CMGkehaKmVJjIvGZBeHZiW
 90dpQS8bmYqc4Lu+WNsouEXHkJDh738GBkK79ZaVdMCfjzf4xIUkyDLwSLfD68xPM0y615kdTDy
 iCKlc7xsd2v+qarIzVsAvR75IjHfvUk0rG9Mq1tEAmnHPbEM23EuztMV0hVx/zNvQRm7nFDdv30
 LK4mddKfJWvtYFcIVltn0xDrOd/p9sfkckl8bUiaZCk+nI+W0aj34f9ctmLyK8cNanTRZLUCym1
 H4SO+QUru36IXOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently only notify user-space about line config changes that are
made from user-space. Any kernel config changes are not signalled.

Let's improve the situation by emitting the events closer to the source.
To that end let's call the relevant notifier chain from the functions
setting direction, gpiod_set_config(), gpiod_set_consumer_name() and
gpiod_toggle_active_low(). This covers all the options that we can
inform the user-space about.

There is a problem with gpiod_direction_output/input(), namely the fact
that they can be called both from sleeping as well as atomic context. We
cannot call the blocking notifier from atomic and we cannot switch to
atomic notifier because the pinctrl functions we call higher up the stack
take a mutex. Let's instead use a workqueue and schedule a task to emit
the event from process context on the unbound system queue for minimal
latencies.

In tests, I typically get around 5 microseconds between scheduling the
work and it being executed. That could of course differ during heavy
system load but in general it should be enough to not miss direction
change events which typically are not in hot paths.

Let's also add non-notifying wrappers around the direction setters in
order to not emit superfluous reconfigure events when requesting the
lines.

We can also now make gpiod_line_state_notify() static.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 12 ++----
 drivers/gpio/gpiolib.c      | 99 +++++++++++++++++++++++++++++++++++++++------
 drivers/gpio/gpiolib.h      |  9 ++++-
 3 files changed, 97 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f614a981253d..bb00c9c29613 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -196,8 +196,6 @@ static long linehandle_set_config(struct linehandle_state *lh,
 			if (ret)
 				return ret;
 		}
-
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
 	}
 	return 0;
 }
@@ -363,11 +361,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
 			int val = !!handlereq.default_values[i];
 
-			ret = gpiod_direction_output(desc, val);
+			ret = gpiod_direction_output_nonotify(desc, val);
 			if (ret)
 				goto out_free_lh;
 		} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
-			ret = gpiod_direction_input(desc);
+			ret = gpiod_direction_input_nonotify(desc);
 			if (ret)
 				goto out_free_lh;
 		}
@@ -1566,8 +1564,6 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
 		}
 
 		WRITE_ONCE(line->edflags, edflags);
-
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
 	}
 	return 0;
 }
@@ -1824,11 +1820,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
 			int val = gpio_v2_line_config_output_value(lc, i);
 
-			ret = gpiod_direction_output(desc, val);
+			ret = gpiod_direction_output_nonotify(desc, val);
 			if (ret)
 				goto out_free_linereq;
 		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
-			ret = gpiod_direction_input(desc);
+			ret = gpiod_direction_input_nonotify(desc);
 			if (ret)
 				goto out_free_linereq;
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 190ece4d6850..281502923482 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -870,6 +870,26 @@ static void gpiochip_set_data(struct gpio_chip *gc, void *data)
 	gc->gpiodev->data = data;
 }
 
+static void gpiod_line_state_notify(struct gpio_desc *desc,
+				    unsigned long action)
+{
+	blocking_notifier_call_chain(&desc->gdev->line_state_notifier,
+				     action, desc);
+}
+
+static void gpiod_config_change_func(struct work_struct *work)
+{
+	struct gpio_desc *desc = container_of(work, struct gpio_desc,
+					      line_state_work);
+
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+}
+
+static void gpiod_line_config_change_notify(struct gpio_desc *desc)
+{
+	queue_work(system_unbound_wq, &desc->line_state_work);
+}
+
 /**
  * gpiochip_get_data() - get per-subdriver data for the chip
  * @gc: GPIO chip
@@ -1064,6 +1084,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			assign_bit(FLAG_IS_OUT,
 				   &desc->flags, !gc->direction_input);
 		}
+
+		INIT_WORK(&desc->line_state_work, gpiod_config_change_func);
 	}
 
 	ret = of_gpiochip_add(gc);
@@ -2673,6 +2695,18 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
  * 0 on success, or negative errno on failure.
  */
 int gpiod_direction_input(struct gpio_desc *desc)
+{
+	int ret;
+
+	ret = gpiod_direction_input_nonotify(desc);
+	if (ret == 0)
+		gpiod_line_config_change_notify(desc);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gpiod_direction_input);
+
+int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 {
 	int ret = 0;
 
@@ -2720,7 +2754,6 @@ int gpiod_direction_input(struct gpio_desc *desc)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
 static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
@@ -2782,8 +2815,15 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
  */
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 {
+	int ret;
+
 	VALIDATE_DESC(desc);
-	return gpiod_direction_output_raw_commit(desc, value);
+
+	ret = gpiod_direction_output_raw_commit(desc, value);
+	if (ret == 0)
+		gpiod_line_config_change_notify(desc);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
 
@@ -2801,6 +2841,18 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
  * 0 on success, or negative errno on failure.
  */
 int gpiod_direction_output(struct gpio_desc *desc, int value)
+{
+	int ret;
+
+	ret = gpiod_direction_output_nonotify(desc, value);
+	if (ret == 0)
+		gpiod_line_config_change_notify(desc);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gpiod_direction_output);
+
+int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 {
 	unsigned long flags;
 	int ret;
@@ -2863,7 +2915,6 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 		set_bit(FLAG_IS_OUT, &desc->flags);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(gpiod_direction_output);
 
 /**
  * gpiod_enable_hw_timestamp_ns - Enable hardware timestamp in nanoseconds.
@@ -2942,13 +2993,34 @@ EXPORT_SYMBOL_GPL(gpiod_disable_hw_timestamp_ns);
  */
 int gpiod_set_config(struct gpio_desc *desc, unsigned long config)
 {
+	int ret;
+
 	VALIDATE_DESC(desc);
 
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
 		return -ENODEV;
 
-	return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+	ret = gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+	if (ret == 0) {
+		/* These are the only options we notify the userspace about. */
+		switch (pinconf_to_config_param(config)) {
+		case PIN_CONFIG_BIAS_DISABLE:
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+		case PIN_CONFIG_BIAS_PULL_UP:
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+		case PIN_CONFIG_INPUT_DEBOUNCE:
+			gpiod_line_state_notify(desc,
+						GPIO_V2_LINE_CHANGED_CONFIG);
+			break;
+		default:
+			break;
+		}
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_set_config);
 
@@ -3015,6 +3087,7 @@ void gpiod_toggle_active_low(struct gpio_desc *desc)
 {
 	VALIDATE_DESC_VOID(desc);
 	change_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
 }
 EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
 
@@ -3659,9 +3732,15 @@ EXPORT_SYMBOL_GPL(gpiod_cansleep);
  */
 int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
 {
+	int ret;
+
 	VALIDATE_DESC(desc);
 
-	return desc_set_label(desc, name);
+	ret = desc_set_label(desc, name);
+	if (ret == 0)
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
 
@@ -4087,12 +4166,6 @@ int gpiod_set_array_value_cansleep(unsigned int array_size,
 }
 EXPORT_SYMBOL_GPL(gpiod_set_array_value_cansleep);
 
-void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action)
-{
-	blocking_notifier_call_chain(&desc->gdev->line_state_notifier,
-				     action, desc);
-}
-
 /**
  * gpiod_add_lookup_table() - register GPIO device consumers
  * @table: table of consumers to register
@@ -4537,10 +4610,10 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 
 	/* Process flags */
 	if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
-		ret = gpiod_direction_output(desc,
+		ret = gpiod_direction_output_nonotify(desc,
 				!!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
 	else
-		ret = gpiod_direction_input(desc);
+		ret = gpiod_direction_input_nonotify(desc);
 
 	return ret;
 }
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 067197d61d57..e07e053c7860 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/srcu.h>
+#include <linux/workqueue.h>
 
 #define GPIOCHIP_NAME	"gpiochip"
 
@@ -137,6 +138,9 @@ struct gpio_array {
 	for_each_gpio_desc(gc, desc)					\
 		if (!test_bit(flag, &desc->flags)) {} else
 
+int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value);
+int gpiod_direction_input_nonotify(struct gpio_desc *desc);
+
 int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				  unsigned int array_size,
 				  struct gpio_desc **desc_array,
@@ -150,8 +154,6 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 
-void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
-
 struct gpio_desc_label {
 	struct rcu_head rh;
 	char str[];
@@ -165,6 +167,8 @@ struct gpio_desc_label {
  * @label:		Name of the consumer
  * @name:		Line name
  * @hog:		Pointer to the device node that hogs this line (if any)
+ * @line_state_work:	Used to schedule line state updates to user-space from
+ *			atomic context.
  *
  * These are obtained using gpiod_get() and are preferable to the old
  * integer-based handles.
@@ -202,6 +206,7 @@ struct gpio_desc {
 #ifdef CONFIG_OF_DYNAMIC
 	struct device_node	*hog;
 #endif
+	struct work_struct	line_state_work;
 };
 
 #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)

-- 
2.43.0


