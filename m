Return-Path: <linux-gpio+bounces-11137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2893F9981B2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 11:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 937D71F22387
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 09:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358BB7E765;
	Thu, 10 Oct 2024 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DuuZNZXE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1043018C03D
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551445; cv=none; b=QzsoOaPlHegcvcgNbosPzfxF2IpgHOtYOmjvQwTxLN5RNcBpOucIZJ5Phes/Va57dOsPXsi37Ovhj1I+ycP/DA2iLE3oHqrcdH/BHpqdUt2QnufsbtyskTcMJ9AiH1K2IfwYsCk8x5qp1Oc5LJ9m+TCBRYAv2VmH4HvCUI9X2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551445; c=relaxed/simple;
	bh=lRTi6HjXmQIuZIsD84KI0wNrDkAd80UhqzFW40a1TLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4v3GVU28XUuhnmqJ4nfzHPvJqaDB31arFzB1i5Ay4nGt0fMI83nYofupURkN2PfyzpOxa9wU9gdX23ZXsMgGdRE6aQY9+byQJzfAoHAaJyUec4QYPpBFK+vSfvFgTF8ryxT8gJ3qXt96FlF7u5ScgoZ/TljaCnvlDMsJf763jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DuuZNZXE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53992157528so706481e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 02:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728551441; x=1729156241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8XNd2FyPKbVaB0YC1j3Yikqd7FynNynIkX/mW8PTT0=;
        b=DuuZNZXEwu0QfpZ3UKoTw6gjYqc31U5t36afJyFQqgnvWSAU37FIcY4HcmhHQDkug4
         CLdqbDJAMjfOwhUgUfXlo2GOvpXuJw0zHDRxPIswdGeLy2tvOmKC8pnUg7GxXnB4ub2S
         gHzjc9IWPOcR2oNgycHpXassbJUeDE2ucFaibSWS5PQBFuGcv9+tlKnQIk0kQnqdWdRP
         PlCMu35CykGeLH/jRQ+C1SSEjPjf/TMg3INBsM5cCtvSUFQh+KYSjscS6COyjw6GS6pm
         m3F1HkEMWTeowL+Vz4I287joCChqbjyIiclAN4UhJhj93vu0HbLQED+3wCp2Nm9vuQwO
         l3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728551441; x=1729156241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8XNd2FyPKbVaB0YC1j3Yikqd7FynNynIkX/mW8PTT0=;
        b=VbbSfEvKWbQUWX5vzOOOf02E8TP3HLcDUWAkjOTAKtx8WFHlLMxPi1CdaR8bsu1A94
         CQ2vPcLHqrDIhzvSIZLBBZS/FywFiQK7VcgmC8fIdRc7D6/3FJDeZ4f7KyAeJ3tILyMe
         REQ8ruy3kTBzq4yQEq3ORnl53t/y36W0GJt56eqya8jLo6WGaHmOKF4hzGpJCMGbKklb
         +O6yfUw+UmvcvYK/McKo5v66haOUbQnVdVLsSWEmhHXioH2LwT/OwCavYJZqjXfv7HTE
         GleGvkXjP/OxiALqB9RE5mcBUTDBvj9rRUvGK61gCl9of9wJgVVP+OPHNor5Xg9gKxgT
         +LmQ==
X-Gm-Message-State: AOJu0YwY0oiphXHaJnHQxKKUgE+5cTb8qXOnByKGOe+H1Y30sqccbVlc
	BfL9OmGZoh0MWSqlyIR63AJ63jxY4U3RU+OH0mXMGqblw7Yok1ADLOanr4hMKiD0kKQmL4eIJGZ
	W
X-Google-Smtp-Source: AGHT+IERDCVsUENLDZYEKR3zfT9VSqgA2XcAgI+POUXG44TxCfT+MeiSsTB+KLnZ8ERHSmI05whyTg==
X-Received: by 2002:a05:6512:2207:b0:539:8b49:8934 with SMTP id 2adb3069b0e04-539c49613c0mr3449314e87.52.1728551440818;
        Thu, 10 Oct 2024 02:10:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5e5d:bfca:20cc:60ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff785sm9913305e9.13.2024.10.10.02.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:10:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Oct 2024 11:10:27 +0200
Subject: [PATCH v2 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-gpio-notify-in-kernel-events-v2-6-b560411f7c59@linaro.org>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
In-Reply-To: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7877;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=emdseATUbYgPk+Xsat6ZPWRy+qomt58wS6OT5lF8raA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnB5oHpr48emy3umBNf/nLJsFZqEjdB0aSjCUFf
 ePcCNg9q4KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZweaBwAKCRARpy6gFHHX
 ckITD/oDPoKNQxYhDR9e0SHIrSjxle0eORVcn8MyYyedENcVWOVwInnhAb/zR1YxBRaVWZZuz0J
 gKsO36NSWe18hI0aMVmc/jG+JkLcyzHWOK5bZEqUqIfQPryjcCVaCICM6ytp6U2IJtACfXZN/D+
 O308vDc++VVW4vlRop3sLa62Gzy7KR7vIsbAzXuf8ALtYqCmkKLDPyx73HGy+8aB4hZTEMTIXpJ
 z0/0mz6MIllXxhShm4H0xAUQg+wdsFCl+3z47WlihhlpR0aG6GgFjRv2kLlgMkxVx2HRBaJhbhI
 npeBtEY3Pu41PVXmOrxpwGWIRC4X0U3hVsQtesy274WugpPyRtv+V3SZz53/qbLbCVinLhfAswn
 eCnrkosLLnyFQ5WnJMO8BUEWwlHWZE6S38j0F/51n2pDKu3NzN2n4zT6SVKlEXCrj/25nC/knDv
 z5lpKYkG5kySSCkAhTBvL6l0qq2tmN5HJOPGVWmL2YtOMOezSLKiT0RCpxmy4C13Rz40abNLFq5
 WAXEtdsTx33aEY6+FHskvnK788ix89Su3kNRFUfaUoPnubH7WCDUD+J22tGgEnBAllumv1Epw2g
 FV0GjjJcimaVdGR0ZBTzx2tHRdpdtyEc+TTn0tVrTrRUl67sN4/2EIJGYcB329KwK2bqu9uy/U3
 iSzwIGfzk+unCGA==
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 12 +++-----
 drivers/gpio/gpiolib.c      | 71 ++++++++++++++++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib.h      |  2 ++
 3 files changed, 70 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 7eae0b17a1d6..ff702fe59ecd 100644
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
@@ -1568,8 +1566,6 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
 		}
 
 		WRITE_ONCE(line->edflags, edflags);
-
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
 	}
 	return 0;
 }
@@ -1826,11 +1822,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
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
index 9b10f47832d5..0986854ab1ed 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2673,6 +2673,18 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
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
 
@@ -2720,7 +2732,6 @@ int gpiod_direction_input(struct gpio_desc *desc)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
 static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
@@ -2782,8 +2793,15 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
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
 
@@ -2801,6 +2819,18 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
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
@@ -2863,7 +2893,6 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 		set_bit(FLAG_IS_OUT, &desc->flags);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(gpiod_direction_output);
 
 /**
  * gpiod_enable_hw_timestamp_ns - Enable hardware timestamp in nanoseconds.
@@ -2942,13 +2971,34 @@ EXPORT_SYMBOL_GPL(gpiod_disable_hw_timestamp_ns);
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
 
@@ -3015,6 +3065,7 @@ void gpiod_toggle_active_low(struct gpio_desc *desc)
 {
 	VALIDATE_DESC_VOID(desc);
 	change_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
 }
 EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
 
@@ -3659,9 +3710,15 @@ EXPORT_SYMBOL_GPL(gpiod_cansleep);
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
 
@@ -4539,10 +4596,10 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 
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
index 2799157a1f6b..fc321d281346 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -155,6 +155,8 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 
 void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
+int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value);
+int gpiod_direction_input_nonotify(struct gpio_desc *desc);
 
 struct gpio_desc_label {
 	struct rcu_head rh;

-- 
2.43.0


