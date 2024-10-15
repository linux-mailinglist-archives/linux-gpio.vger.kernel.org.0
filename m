Return-Path: <linux-gpio+bounces-11358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B599E4CA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 12:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 474DE1C22E4C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D28C1E490B;
	Tue, 15 Oct 2024 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R4MDUNnZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C371EB9EC
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 10:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989801; cv=none; b=kE7p2PxpWYn9BTgHaFLJ8W1+YWdDAI+bEyx+vDzOQ2wlZ/V/urYUcU8IRIH2KYqDGHkXXcYgUehvFpqXmUXhmSrOfC/yn/vQnwFOIiJ04vQAAqEKa99tUbnsspf17TeamPoApxtlba+flz7PplD17Lhv9fzjYZLTslIQeZAcqX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989801; c=relaxed/simple;
	bh=3P6ed0aEY+FPZKTKm4aUbMLJLE88YJga0WdfcjryGRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUYAIU5c5Obu19Sf5bZh+w36dzg0jwwcChqLmiVv5RbvDiNCbzHAkWWFKiFCri/o5gllvSxT7b7c2qqrrFDEP5/99N6jZ392ZclM7I6Q3qVWuZd6r41iFIsgSLNNjmwAaehIb2N7q+30z9qFvrBHS0TitBHBU5f+IbF+lf7al/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R4MDUNnZ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d495d217bso4694161f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728989798; x=1729594598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pogTaxnIx9GVfNuRsM1CMn+dOQNZi7zNE6KFzO1rF9o=;
        b=R4MDUNnZ2emxVDEpF/HOL5mXozeFzOmC93PUrOd2GsNl4nbrqMwy1rRg0SRkheNQbk
         6SrmAORbs0G9zFxK9gEt9Q8qTjNk3Svgo7z0X7Y7KljpWzUmYTHgQwaZuL4/su7l2rk0
         Lrtg1QP/Q7ApBZmzZK9zADPrKx+rdvF87/4HioxzhDH+aimg92kyQfL41z0pc84fyEHQ
         2kdhtW24Tk6+pVTJfeJvlhHe4iYCDrcdGlPhoNxbpBoiWp9mWHjDTigk5mLG9eNuiLc0
         A3FSvgMInnZbXYRM3BvtZhZmpoCLGtzM8kDtnoDueF8FAb9HyRTojXplcPvow1S4hvh6
         i8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728989798; x=1729594598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pogTaxnIx9GVfNuRsM1CMn+dOQNZi7zNE6KFzO1rF9o=;
        b=F6tPteapNK6PeYEeaNulR8Gw/4IG0yOXvFOiYb8W4Eo6ioogQp3wS7h2fgTfJeCHIA
         Xz+6JcsXSJi1k0g83qU+h6X2f3k5p/0tANKxN1iInzR9ad4ZRoHsCtSHfHaKGoJ6G5pS
         r13nJAVg8mycnYhV/OOcT04JYxAZzhhthemiN5G9xZYeIOqa1BlMb3K3GfV7NS9t8rPG
         CXCRhsYbc/XSqh6n0CnEAsYufIg6m5WFRVQuugFw2078z6UfhS5CePVrzCBCkO46GF64
         7cVbElpmnArxY7dKYvdTWYLN928RbtTcjjc/0kSOUKE6/LkrEiRf7wffkyGuUgRwIN9Z
         M9RQ==
X-Gm-Message-State: AOJu0Yz3UWEwel229RgY72SDSIdiCEGM0HzsPKU/QjYHK9huwwkkoSR5
	+WDP8y1mZvxBvtOfHn22gbZ/FAonZI34TeLUPQJ9Dlp9JHO0+vmFWbIiIFp9K9k=
X-Google-Smtp-Source: AGHT+IHaQcsmINroBS/oshLFsL0DyQiCXt+piKC0psvps1tXB407wVpMCndVTrUzB5tU93TFFAtIqw==
X-Received: by 2002:a5d:4f85:0:b0:37d:4833:38f5 with SMTP id ffacd0b85a97d-37d5ffa2e1dmr9783000f8f.30.1728989797970;
        Tue, 15 Oct 2024 03:56:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d382:b11b:c441:d747])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc403d3sm1254115f8f.101.2024.10.15.03.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 03:56:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Oct 2024 12:56:18 +0200
Subject: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
In-Reply-To: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7877;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ePQ3NHmW799l+7FWll3i7+jrGwxa4SiDEOy93jWL4Mg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnDkpfGeH1iFc5qP7f9JLNiUYAs12V185a8duPl
 9uc5wXnvYeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZw5KXwAKCRARpy6gFHHX
 cuckD/43OV4paP5znbk19rt07BJUmCyQe78m0AZFagLlQ9CibdcxoXAFh6lObSZxz6pshvthQ5G
 7Z69tOPXueqtYRhVQLD52Z2nw2puiBCpmHDMLnsOO9Y4ZfJdrXYG6P3HXf5Fpf6s+xgoquUtGhj
 DKdnvisZDH5jZdsfxCbhFknQ5ORR2s6VUK3pxRTCcrHI7n8vObqRpZtKAUwJv21UNPoB21Vd1Dj
 wPv+TX/CuxUWvttrkcXqOu6vLsnwnagYyjrCgUTB4aFcf4jEx52GKHIajQrgZeVAcPAbmEXNtOn
 0c3TL6+VV/wxVosNGNk+zkcg0TvPx5gIKFkwO1DGzr1arYeFSFsP4fIIsob9FwAwM49ybJM6s08
 tsSGRWT7ZL0hSeirsrWMn41uSk+tKBEql5YJBxnvrGdBfHpVIMl+xNZ74/PHsnqozJLL0TFsMiu
 dnCrOiUBk2k5MXELo4io9HGuv2wwU77zF/iUgBEhFj5m2kt/R/7q7Ha7W58kMOqlNd7cybeY+tQ
 QSP902mbwJ/wMTSdxUaZWIg1xlLFHaTFA5PrlWNLaU7pEuD8o4wIbhNWztl/hvNbmkDWfi/7w1i
 Nv3EwTsloDKJ7p7uHv+h42R+qwRVxq5qjBmTPSfuGJp5U76mngTR1rguchSklS8wH3fGgm92R8E
 MLhl9ASXI76L8fQ==
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
index f8c69ef33888..1296e6cbcef7 100644
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
index fafa759ce743..4303b6a689af 100644
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


