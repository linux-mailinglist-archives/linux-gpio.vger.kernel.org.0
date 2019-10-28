Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3989E6D57
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 08:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732980AbfJ1HiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 03:38:14 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43487 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732043AbfJ1HiO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 03:38:14 -0400
Received: by mail-pg1-f195.google.com with SMTP id l24so6311263pgh.10
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2019 00:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZkhZto+QMct+ZpMEaVqMJNlf+/jbxDs/0RAyQ9ZpcmM=;
        b=l+/zS4mhBeHKdwvX/K4bFJlasBPkWPU6ENyOTD46f9Ava7LGcMLSkMH8D0d3PCroDN
         CmTXoUy40lU6+/uH5rVR/MHxhQUGoGa9mO8xswvRRYdsQYURMSJ06n5uaRT3lFs0sQx3
         tX0+UHC07d+g++VFNb16SRbhKGGzcAR36FpDjKiD55iNkfyL91QyKvOxWOzv0QC4TJwD
         jIwUO9FwoDsBtWNk+141auc+qXvp8s5oDCyWt+MDNq1ccy+Ie9n0qhwdfekaa5eNkd8E
         sitnFdxmWRkhy9iCqtoVdDwET4uWaDzhDMoeO/6UWrdXX4+wale6Fm6tQuycP5wkt0e5
         AAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZkhZto+QMct+ZpMEaVqMJNlf+/jbxDs/0RAyQ9ZpcmM=;
        b=oizGs+Q+STREoCLplUq3RTpTQVr/AnxPrWrvfZpGHR2SM+EEqSl9rHEaysSwFgs59e
         GzuwT+Ql/8jWRZoiQsNr05+nOEpcyky3k3OeIGGFKOrQtizzDb8GO3B3YcxmqB47b5B4
         hUoJKH/S60e/43eD6E6x8Be584uBgjTQ9kLp6fx85wzWJ09QaheZEtlE9BMq+Pr09QCE
         YDNywIKYoqJCigm2aKVwPzxnc1m+dcvq6xg9lSurBBGeVXAZ3GWZUajkr3jSVlVPC3n+
         AHmbw+WqwhJcLGPIS+TJYbdfEGlyJT6Cf4f7V/HoEo+FZjwbKgmpZCLuFpuRPyGfQhAr
         S/pA==
X-Gm-Message-State: APjAAAWnZLCN0BpLOY7aNcV57t1ET4XV1fXkU58aXDKRwdKrX7OYyvZV
        KbX38kmu5Ht0gMHzMfcDTQnmqGFMQquottXF
X-Google-Smtp-Source: APXvYqwfs9WIcrAvajlQerL1ikLOF4R9D1LfjuzjHOvZZ4iyM1GkRxlHnVnRrW/yAEm12/KbR4xqXQ==
X-Received: by 2002:a63:e055:: with SMTP id n21mr19238114pgj.411.1572248292128;
        Mon, 28 Oct 2019 00:38:12 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id b17sm11191015pfr.17.2019.10.28.00.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 00:38:11 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 4/5] gpiolib: add support for disabling line bias
Date:   Mon, 28 Oct 2019 15:37:12 +0800
Message-Id: <20191028073713.25664-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028073713.25664-1-warthog618@gmail.com>
References: <20191028073713.25664-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow pull up/down bias to be disabled, allowing the line to float
or to be biased only by external circuitry.
Use case is for where the bias has been applied previously, either
by default or by the user, but that setting may conflict with the
current use of the line.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c    | 61 ++++++++++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib.h    |  1 +
 include/uapi/linux/gpio.h |  2 ++
 3 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7dfbb3676ee0..177d25e19758 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -423,6 +423,7 @@ struct linehandle_state {
 	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
 	GPIOHANDLE_REQUEST_BIAS_PULL_UP | \
 	GPIOHANDLE_REQUEST_BIAS_PULL_DOWN | \
+	GPIOHANDLE_REQUEST_BIAS_DISABLE | \
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
 	GPIOHANDLE_REQUEST_OPEN_SOURCE)
 
@@ -554,12 +555,21 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
-	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	/* Bias flags only allowed for input mode. */
 	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
-	    ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
+	    ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
 	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
 		return -EINVAL;
 
+	/* Only one bias flag can be set. */
+	if (((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
+	     (lflags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
+			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
+	    ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
+		return -EINVAL;
+
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
 		return -ENOMEM;
@@ -600,6 +610,8 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
+			set_bit(FLAG_BIAS_DISABLE, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
 			set_bit(FLAG_PULL_DOWN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
@@ -924,6 +936,21 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
 		return -EINVAL;
 
+	/* Bias flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) ||
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
+		return -EINVAL;
+
+	/* Only one bias flag can be set. */
+	if (((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
+	     (lflags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
+			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
+	    ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
+		return -EINVAL;
+
 	le = kzalloc(sizeof(*le), GFP_KERNEL);
 	if (!le)
 		return -ENOMEM;
@@ -950,6 +977,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
+		set_bit(FLAG_BIAS_DISABLE, &desc->flags);
 	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
 		set_bit(FLAG_PULL_DOWN, &desc->flags);
 	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
@@ -1107,6 +1136,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
 			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
 					   GPIOLINE_FLAG_IS_OUT);
+		if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_DISABLE;
 		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
 			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
 		if (test_bit(FLAG_PULL_UP, &desc->flags))
@@ -2786,6 +2817,7 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
 		clear_bit(FLAG_PULL_UP, &desc->flags);
 		clear_bit(FLAG_PULL_DOWN, &desc->flags);
+		clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 		ret = true;
 	}
@@ -2912,6 +2944,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	unsigned arg;
 
 	switch (mode) {
+	case PIN_CONFIG_BIAS_DISABLE:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 	case PIN_CONFIG_BIAS_PULL_UP:
 		arg = 1;
@@ -2925,6 +2958,23 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
 }
 
+static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
+{
+	int bias = 0;
+
+	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
+		bias |= PIN_CONFIG_BIAS_DISABLE;
+	if (test_bit(FLAG_PULL_UP, &desc->flags))
+		bias |= PIN_CONFIG_BIAS_PULL_UP;
+	if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+		bias |= PIN_CONFIG_BIAS_PULL_DOWN;
+
+	if (bias)
+		return gpio_set_config(chip, gpio_chip_hwgpio(desc), bias);
+
+	return 0;
+}
+
 /**
  * gpiod_direction_input - set the GPIO direction to input
  * @desc:	GPIO to set to input
@@ -2972,12 +3022,7 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	if (ret == 0)
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 
-	if (test_bit(FLAG_PULL_UP, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_BIAS_PULL_UP);
-	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_BIAS_PULL_DOWN);
+	gpio_set_bias(chip, desc);
 
 	trace_gpio_direction(desc_to_gpio(desc), 1, ret);
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index b8b10a409c7b..ca9bc1e4803c 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -110,6 +110,7 @@ struct gpio_desc {
 #define FLAG_TRANSITORY 12	/* GPIO may lose value in sleep or reset */
 #define FLAG_PULL_UP    13	/* GPIO has pull up enabled */
 #define FLAG_PULL_DOWN  14	/* GPIO has pull down enabled */
+#define FLAG_BIAS_DISABLE    15	/* GPIO has pull disabled */
 
 	/* Connection label */
 	const char		*label;
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 39e6c7854d63..7cc21c3b0839 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -35,6 +35,7 @@ struct gpiochip_info {
 #define GPIOLINE_FLAG_OPEN_SOURCE	(1UL << 4)
 #define GPIOLINE_FLAG_BIAS_PULL_UP	(1UL << 5)
 #define GPIOLINE_FLAG_BIAS_PULL_DOWN	(1UL << 6)
+#define GPIOLINE_FLAG_BIAS_DISABLE	(1UL << 7)
 
 /**
  * struct gpioline_info - Information about a certain GPIO line
@@ -66,6 +67,7 @@ struct gpioline_info {
 #define GPIOHANDLE_REQUEST_OPEN_SOURCE	(1UL << 4)
 #define GPIOHANDLE_REQUEST_BIAS_PULL_UP	(1UL << 5)
 #define GPIOHANDLE_REQUEST_BIAS_PULL_DOWN	(1UL << 6)
+#define GPIOHANDLE_REQUEST_BIAS_DISABLE	(1UL << 7)
 
 /**
  * struct gpiohandle_request - Information about a GPIO handle request
-- 
2.23.0

