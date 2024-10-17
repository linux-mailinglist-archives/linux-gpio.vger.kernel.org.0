Return-Path: <linux-gpio+bounces-11511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536079A1CDC
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 10:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76B261C27365
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9C21D0BAE;
	Thu, 17 Oct 2024 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CH8HFPBQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FDE1D63DF
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152879; cv=none; b=ugE9PRC1N15AzkpLSUJoD5B+K6YDXBMBzSTh+u0JKYoWe93zjAQUEcjteD5DUpPBURRA7XBUKjmxFg5kw6OTXPOK/x5qf7M4RKohEZKOV96Xz1Vd+r6w3xMWA5jAibjkAOROpdNOFCtN8U/hu63j2s07SH77tvu1OakxOACGk0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152879; c=relaxed/simple;
	bh=c4J/UnmFeTC8BBvqpEPvj+zBWvdybelwThrbdTexxsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IeXm/OCLGshsEuVOG1VPlhCbjt5qX+15CDgK65CVNCe4vtU7ZcfMSVpC0/llEs6V8Ng7ZiLd7G8J4lH3Bc8NPoY3JV/7C5oAhX1ATiSmRjgERTmLrZ7y+PnsmPzMfVIhgfCyKZVQSipmD8ou6Yf4kVTkjNIMujufvZk886PZI5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CH8HFPBQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f84907caso825144e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729152874; x=1729757674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbuZ78Ln+IyEolb1HzZUdx3L9NhHInxuuhSiBS2bsdw=;
        b=CH8HFPBQVmkyWkDTH/4eJo81QL9e7vg4lcoOu9rFPKRjDBA68WGrGrnUH6h+gDHBTg
         eLctkTgKN+921NEix6e4TTO2VVKP1euj9tM5odybdxTHVSkC4xnsjODps7zOlKErbIk8
         6F8G9oZlZqgfahpHSN9hujle1vt02zlcnl70VKGPqmQ344ExDvVszPV0pTIo/IQoz4Ft
         LxEgEgKdzb6+zaNv23SgdHRsRT/9acshjuH8nUf7JR/KY3D2Yz1Jz9MnWed6MeP4ubgy
         IIdrNeRG2hiAj6Az1K8xhkOurrr+RGZ+ipUWPWGEQXawyCSq7QpzmrsHMfkVEGT2E2W6
         zhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729152874; x=1729757674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbuZ78Ln+IyEolb1HzZUdx3L9NhHInxuuhSiBS2bsdw=;
        b=fr9AiO4kBiMRImL87fJX51mQDeZQW6R+90E+kkIkEHF64NHMRo0NhDXX+9Zp+ozERX
         f0sOijzAmWDdaKVnrf05+4DMbkOFFGKCyfVxOeYTXhAzbpifK0QvmZgoKkIscYXUYAyg
         ffiKIe0Pyc94l42DrDcK4NCWXNpYdUFtC7p9W+GP5NCtUUK7klOk5BIQoaK28PJcZbvV
         4zCM0v+4/qBjDp+hzIrmARM52y5aSt8VUqOXyA9gOjNbRB7nw20zDP7PNd3iaXWSnQdJ
         AJB2yL6zp+Gn5WBnRwNsPyG1Wr/XH51uUUVCuBCn32HYlpRY+3qJTr69rBpIeyLtzmiY
         oL/g==
X-Gm-Message-State: AOJu0Yws4oJbwMAvhK65kT7YGcuBZ1T2gFWkQuldTqOzI+5isSyc64Em
	+R+cW0UMmV+PjAmXhVXE3uwWiCh0D0lC/BADeRONJYjCp05lE8Eb61WQhM8DwZM=
X-Google-Smtp-Source: AGHT+IFsdnLfre4VUn+fGt/EEvLeGGxoNYWlklN1Qtb26Tpi/U+IR84E/vYlf3U3mKqtTAVgkVhvhQ==
X-Received: by 2002:a05:6512:15a3:b0:53a:16b:f14f with SMTP id 2adb3069b0e04-53a03f18f73mr4462551e87.19.1729152873677;
        Thu, 17 Oct 2024 01:14:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c61ae2sm17855695e9.46.2024.10.17.01.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:14:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 10:14:16 +0200
Subject: [PATCH v4 8/8] gpiolib: notify user-space about in-kernel line
 state changes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-gpio-notify-in-kernel-events-v4-8-64bc05f3be0c@linaro.org>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
In-Reply-To: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10442;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=e8xh0s9h71X8kX5zh7fMViHQeVImY96zS9zoeZtXFFg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEMde5h3fbG0F5bR5wB6hqFmrmugKR8hatvfTW
 ImLhmD4jROJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxDHXgAKCRARpy6gFHHX
 cu1WD/0byuH1vtfPfxy8vKHI0EqW1fnYIKCuV9zjvzpBPDv1TuCbpApKU+m2VQA0xvhvq5Z5vkz
 gfH6KotfOh6elx4t7sysCx8+GRzKcTfWWhLEyX2HQxlqifm4H1xzIWjqS217DVyS7UJDUE3CD3a
 +6ibFRuvJVywrQw9bP0X1gyXPh8W5KOPn+8G/2e7YrgW/wKgLoJEHdLtueq78+77V90q1LidYVA
 CjGMsS3id1Kt8H00djDbQsd11dRVoe+yaQ5B/5Hpwh9PHUhsEoH7s5YHBhWHThRUptNF/4RAcg/
 FHZj2qCBPnp7OrP1ineysuHjpHlztYGJiwIxlGNW5dhEp8uYM89QZDC5ZFh9m8S6pV/J1bWd7ha
 XAO6gcVF/8nqMvDHkYSBA0UDIg1mK8/fyn+hhLJ9Lq2zBYmVcLQGcV7syW2WWRsKYA/h+n/aiY+
 6he8yXw6U3vByRo/G7E4q/iNlggzXd3TOqzn7JGUSmpMh8nRhp9M6BxCfS55dr4Xh7Fjr/BHkBp
 OgFrxTKfYQAHrO21J+vM8+/QlsGMPbCVwg0WiIWZkwLPmVPp0+R/AJ9xzKD7azSNsEt5UTUe+V0
 5Ixzrel8t1VAzguKU12dUL1mH2GElQlyIuIA8ujfKlylEAuBzCWoFX//1lVGRxKMKmF6EA74A8S
 Fz5vQoX7gG2C3FQ==
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
 drivers/gpio/gpiolib-cdev.c | 21 ++++++-----
 drivers/gpio/gpiolib.c      | 89 ++++++++++++++++++++++++++++++++++++++-------
 drivers/gpio/gpiolib.h      |  3 ++
 3 files changed, 90 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index cb4fb55e2696..e5b15d96e952 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -195,8 +195,6 @@ static long linehandle_set_config(struct linehandle_state *lh,
 			if (ret)
 				return ret;
 		}
-
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
 	}
 	return 0;
 }
@@ -362,11 +360,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
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
@@ -922,8 +920,13 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
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
@@ -1447,8 +1450,6 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
 		}
 
 		WRITE_ONCE(line->edflags, edflags);
-
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
 	}
 	return 0;
 }
@@ -1700,11 +1701,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
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


