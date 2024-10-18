Return-Path: <linux-gpio+bounces-11614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7E79A398E
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AA0A281E7E
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 09:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D10192B63;
	Fri, 18 Oct 2024 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GJoXuOMN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245EB1922E9
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 09:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729242635; cv=none; b=gN6kdYxoQfG2pHstr8LArF025Ikqvi9ZgfLUn1aWn4dd1Xk/Rr/pNj3QCuuj2y7gi/uIqK36ygg3f0p984N6c2uql2iB7tFvNK0g8qnUQfhJnSV0zpJY5BAPf6kiEeCHDMx38QghrNqfP4MRjXWPsfqFKlan+TPLnD0EN5b/O+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729242635; c=relaxed/simple;
	bh=CJ5VsCM0XGaPG8OzBvjEY5DphbVsMrjIcObpqiwTyik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dY4etEvBqKCUuim/LEBzWaK14gXnNP2EMqHq4724BRWfmpVkTGQnbkXpuQkuO4xnIWFwQ4jfSBf9KH/4DyGSYEexC2GqccKDjLFQGRXcv0pTq7xl9o9aJKQ9/Z28HngfR0nz7+8yxMOiznT7PiFAOQWCpb20Wdk6tIXA0/K0BF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GJoXuOMN; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso1435135f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729242631; x=1729847431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k02GeXnw+1nBLUipwP3WFikIgXvpxjewTuPpnyPj8Q8=;
        b=GJoXuOMNFap/zhlJb3S/MHRC4vDeCxdN+LN+c5JHfNsmSXMiyJdiL66qCYvSMs5h85
         aVLQK/P6syKhkAP0oVLhsbyotIDK1AlC8srJoNI6E0XoM1gSlmIvWtCTR4qoP0ECbABZ
         PuIteTr17o3rB1GeiB3lo8wQ9JLyVbOMe2EAcl2Lnp82sJX44wKOfFPOZE4U4E8BwX78
         XBj2kcl0wfZIwpIKep2h1wXD2OKGbDWidOITLTaYpwysMuXoXVoMu0+GK0o91K+QCW84
         c+yccBxXxjNDGY6qTlM+iEYM14FfmHSvZjPevo4cPJ5qgsW+0O4DGH+IxpZADsdLfr1a
         q0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242631; x=1729847431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k02GeXnw+1nBLUipwP3WFikIgXvpxjewTuPpnyPj8Q8=;
        b=oqR5c1zvNOpUhPxrZGKOxThSjyN2oKzsRPwLwNH+z8tO186RP6liws+xo+AllAle4k
         eyF1YcNP/gE07wtlq3puvsgHRPVZxfUJi9d5rIE8hFUppoYeIjF2eAxdcmrOTHpckBmV
         qUXjknu/5NqhXf7945Od1kys0vVx6Wbz+EN2PsFF0xyNyiSo60qaAf34HIWgLZI02dO6
         zR5YVPDmWvK2G1MYauvUkLDzmAC3DO9jFVLClhGDCYX3Oofb7sHQYucOLzr5u5m7GI4b
         VOKBadH3y/Bx5L4zVxU7tgeoQ6uaJZjZlFXBNVDoNCpAuxn2/mw0f0YlmliPGOblISef
         ynTg==
X-Gm-Message-State: AOJu0YxFgK7caW+5LRmtytaKJMCD+Zl1WsJGCykN/xAAfSIhcloAyt/L
	Yo9TGPVzshV5T598I09TyWH+tFmbHT+0fWmJuyaX44b5r6sN3033cWbE5DcHfDbxma/ZFqH7Fmy
	E
X-Google-Smtp-Source: AGHT+IGxEVutApt0OVmdT2CVXdu798GaQA18yrTCZNChoeciATmPUvq0qhJOVsQijmuf4Nailo53sA==
X-Received: by 2002:adf:eb87:0:b0:37c:cf0b:e9e6 with SMTP id ffacd0b85a97d-37eb4ee704cmr1126622f8f.42.1729242630785;
        Fri, 18 Oct 2024 02:10:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:45a3:93e:5196:d8ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160dbe76bsm18700455e9.10.2024.10.18.02.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:10:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 18 Oct 2024 11:10:16 +0200
Subject: [PATCH v5 8/8] gpiolib: notify user-space about in-kernel line
 state changes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-gpio-notify-in-kernel-events-v5-8-c79135e58a1c@linaro.org>
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
In-Reply-To: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10907;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8nBKkdXkJ6I0ir5xbypWERtn55UT5bRb3x8VloeiYrU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEiX7r9Rzk6obZFpg88BYf5zz7r1VIveDA4HLB
 LwiQSiomhCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxIl+wAKCRARpy6gFHHX
 cgeAD/wNsUzUkaLNQpdtfJaZCM/rGVvG3X5nHExx/Ew7O0Qz55dv6qRpdeKmpSRokVNw5udlr8A
 +rX4hGJMt916ThlqTPfJ1sZ9oQw+H7WoaFWa+VV1/ydsc0ITvgeku71hxCFaYxPxyEtyHr5QmVv
 trgxfBy5HPo/JsHdch3L3QVf0RvGApiGnm2qCV/7/D6C3Ofd4jisZwWts9rz6rchIZUVzQC/Yid
 d4XOibA+qCigsCKrGigyUe8U2gU7zc2ajyPnvYfwZQj6IODwlBYBLkcOEwj/2bG1CJgbE5ca4nn
 EyTm39Kr8aoVjpkSrcZOWCfIyr4uYbRKwC8FY2AQEPiqxORBSRI/okFdesQpg4DIyPgICiWOf3r
 7R1upqyx6YpIRMeeY4BZ6gZqswydekZPQvkl44CRcq1EJ5W45xnOBg5eWBvMNazaFsYtfgWUuUe
 IjcC1lXP0iO8/yS8GeNJ0VL14aijasNQ3t/7veNsJ8QrCzAevqcJe4Hj2UDGC8PchsOvgXLzjo+
 K9RPPqiwFpxhqbbq71A1/k4B7/2L5IjBD9zDXNwr6YP4wenDH4trrJfb8ro9BNnSbnQrQODj+hv
 sqyb8DS1XljwsXzv56qX53Y/H2M2Q52jGgdiUWC5//OVo5pn/B3jYkyccWkYLpXREQZD2c20cJE
 Dro7nCsGtr3mPJA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently only notify user-space about line config changes that are
made from user-space. Any kernel config changes are not signalled.

Let's improve the situation by emitting the events closer to the source.
To that end let's call the relevant notifier chain from the functions
setting direction, gpiod_set_config(), gpiod_set_consumer_name() and
gpiod_toggle_active_low(). This covers all the options that we can
inform the user-space about. We ignore events which don't have
corresponding flags exported to user-space on purpose - otherwise the
user would see a config-changed event but the associated line-info would
remain unchanged.

gpiod_direction_output/input() can be called from any context.
Fortunately, we now emit line state events using an atomic notifier
chain, so it's no longer an issue.

Let's also add non-notifying wrappers around the direction setters in
order to not emit superfluous reconfigure events when requesting the
lines as the initial config should be part of the request notification.

Use gpio_do_set_config() instead of gpiod_set_debounce() for configuring
debouncing via hardware from the character device code to avoid multiple
reconfigure events.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 25 ++++++++-----
 drivers/gpio/gpiolib.c      | 89 ++++++++++++++++++++++++++++++++++++++-------
 drivers/gpio/gpiolib.h      |  3 ++
 3 files changed, 94 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index cb4fb55e2696..13d83675bf4f 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -187,11 +187,11 @@ static long linehandle_set_config(struct linehandle_state *lh,
 		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
 			int val = !!gcnf.default_values[i];
 
-			ret = gpiod_direction_output(desc, val);
+			ret = gpiod_direction_output_nonotify(desc, val);
 			if (ret)
 				return ret;
 		} else {
-			ret = gpiod_direction_input(desc);
+			ret = gpiod_direction_input_nonotify(desc);
 			if (ret)
 				return ret;
 		}
@@ -362,11 +362,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
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
@@ -922,8 +922,13 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
 	int ret, level, irq;
 	char *label;
 
-	/* try hardware */
-	ret = gpiod_set_debounce(line->desc, debounce_period_us);
+	/*
+	 * Try hardware. Skip gpiod_set_config() to avoid emitting two
+	 * CHANGED_CONFIG line state events.
+	 */
+	ret = gpio_do_set_config(line->desc,
+			pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE,
+						 debounce_period_us));
 	if (!ret) {
 		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
 		return ret;
@@ -1433,11 +1438,11 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
 			int val = gpio_v2_line_config_output_value(&lc, i);
 
 			edge_detector_stop(line);
-			ret = gpiod_direction_output(desc, val);
+			ret = gpiod_direction_output_nonotify(desc, val);
 			if (ret)
 				return ret;
 		} else {
-			ret = gpiod_direction_input(desc);
+			ret = gpiod_direction_input_nonotify(desc);
 			if (ret)
 				return ret;
 
@@ -1700,11 +1705,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
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
index 83e85dbfdeed..ae758ba6dc3d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2564,7 +2564,7 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
  * rely on gpio_request() having been called beforehand.
  */
 
-static int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
+int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 {
 	int ret;
 
@@ -2670,9 +2670,15 @@ static int gpio_set_bias(struct gpio_desc *desc)
  */
 int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
 {
-	return gpio_set_config_with_argument_optional(desc,
-						      PIN_CONFIG_INPUT_DEBOUNCE,
-						      debounce);
+	int ret;
+
+	ret = gpio_set_config_with_argument_optional(desc,
+						     PIN_CONFIG_INPUT_DEBOUNCE,
+						     debounce);
+	if (!ret)
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
+	return ret;
 }
 
 /**
@@ -2686,6 +2692,18 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
  * 0 on success, or negative errno on failure.
  */
 int gpiod_direction_input(struct gpio_desc *desc)
+{
+	int ret;
+
+	ret = gpiod_direction_input_nonotify(desc);
+	if (ret == 0)
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gpiod_direction_input);
+
+int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 {
 	int ret = 0;
 
@@ -2733,7 +2751,6 @@ int gpiod_direction_input(struct gpio_desc *desc)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
 static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
@@ -2795,8 +2812,15 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
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
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
 
@@ -2814,6 +2838,18 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
  * 0 on success, or negative errno on failure.
  */
 int gpiod_direction_output(struct gpio_desc *desc, int value)
+{
+	int ret;
+
+	ret = gpiod_direction_output_nonotify(desc, value);
+	if (ret == 0)
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gpiod_direction_output);
+
+int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 {
 	unsigned long flags;
 	int ret;
@@ -2843,7 +2879,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 			goto set_output_value;
 		/* Emulate open drain by not actively driving the line high */
 		if (value) {
-			ret = gpiod_direction_input(desc);
+			ret = gpiod_direction_input_nonotify(desc);
 			goto set_output_flag;
 		}
 	} else if (test_bit(FLAG_OPEN_SOURCE, &flags)) {
@@ -2852,7 +2888,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 			goto set_output_value;
 		/* Emulate open source by not actively driving the line low */
 		if (!value) {
-			ret = gpiod_direction_input(desc);
+			ret = gpiod_direction_input_nonotify(desc);
 			goto set_output_flag;
 		}
 	} else {
@@ -2876,7 +2912,6 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 		set_bit(FLAG_IS_OUT, &desc->flags);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(gpiod_direction_output);
 
 /**
  * gpiod_enable_hw_timestamp_ns - Enable hardware timestamp in nanoseconds.
@@ -2955,9 +2990,30 @@ EXPORT_SYMBOL_GPL(gpiod_disable_hw_timestamp_ns);
  */
 int gpiod_set_config(struct gpio_desc *desc, unsigned long config)
 {
+	int ret;
+
 	VALIDATE_DESC(desc);
 
-	return gpio_do_set_config(desc, config);
+	ret = gpio_do_set_config(desc, config);
+	if (!ret) {
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
 
@@ -3024,6 +3080,7 @@ void gpiod_toggle_active_low(struct gpio_desc *desc)
 {
 	VALIDATE_DESC_VOID(desc);
 	change_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
 }
 EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
 
@@ -3668,9 +3725,15 @@ EXPORT_SYMBOL_GPL(gpiod_cansleep);
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
 
@@ -4548,10 +4611,10 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 
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
index a54be597d21a..83690f72f7e5 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -155,6 +155,8 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 
 void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
+int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value);
+int gpiod_direction_input_nonotify(struct gpio_desc *desc);
 
 struct gpio_desc_label {
 	struct rcu_head rh;
@@ -258,6 +260,7 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 					 const char *label,
 					 bool platform_lookup_allowed);
 
+int gpio_do_set_config(struct gpio_desc *desc, unsigned long config);
 int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		unsigned long lflags, enum gpiod_flags dflags);
 int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce);

-- 
2.43.0


