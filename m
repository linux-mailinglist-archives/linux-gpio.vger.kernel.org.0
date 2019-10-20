Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49F0ADDEF1
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2019 16:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfJTOoR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Oct 2019 10:44:17 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36998 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbfJTOoQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Oct 2019 10:44:16 -0400
Received: by mail-pf1-f194.google.com with SMTP id y5so6696491pfo.4
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 07:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SCq+dN3VQtiKb1NXdAgLyKUwRRprRl2duz4jRivqn+Q=;
        b=rdQfQU+MyaRqRXPiqQa9Qo6nGerdtCwpl0RnpmG+6cDpumU2Uu2YI9irTce+v0pEUV
         DEp0O8uwoapinpzqhRMSlSp1qW7STBPKTeZc1gU6y822UFe4vZqrWZhnvDzbxIbwFH4x
         xeHj9RqWUKeBs2PHSZR9uFtK+EY7DEZ1smuZ5HNHPyhQs1A6F4J0Oth6RS54JoKhxKiC
         jd/nF+yRckH+KmJE8QCHikQxRf2j0HL26wDdVHGv9WWashJmAlu2dp/XtLOKA5zQ0zMo
         0y3p8BFPE0Yc/4uALqt17zZLI0QUjT7YennMtKuEiRTwdDR/H1lBLcfNebw+EN4Dmj3m
         fs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SCq+dN3VQtiKb1NXdAgLyKUwRRprRl2duz4jRivqn+Q=;
        b=VmcXCvJpjFevGjEFkepyr9k3/UWKy9PN+sEt2DanTpVoK/ms6lCmPybgHywCg54M+N
         d+nElZUqUEWC1Qon+K5yV0JuqUyRx3448n507cCWL5orUCu9w/8tfZFgqRHSePXMF3Ag
         8p/TGxGAnK99YRjctsK99LzZMHdJClsUzUG5aj9iUe/v6aaUNRfHP8GJ4HCNAU23Djt/
         1Hblu01JfyOxAy0liSdEmiRRnEWzsoJb2Mm2kWaSLEnUe1ysmgnJ6M2QShtWqU07ARzf
         MoUX0iTyHALj9RElYIAFi/ABKqES4ShZvhIOvi8AvNjhnObipR54y9SRFCcn91RDBByP
         ckfQ==
X-Gm-Message-State: APjAAAVt37MMwj8zvCe4t/q3bFzcckbshxKsQ+0K9bUzji8bZCXfE3oP
        t6dYs+psO+kJEyp4gNjWWvZvNjSRxXEO+Q==
X-Google-Smtp-Source: APXvYqw8OX7LfkQS/C/CNH+PXYfiEJ/kbalbqCVkbp+TEMN7/GISji0oBmg+VcNkwW+q4zB6BO5YSQ==
X-Received: by 2002:a65:67d1:: with SMTP id b17mr8943909pgs.127.1571582655408;
        Sun, 20 Oct 2019 07:44:15 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id w14sm14671842pge.56.2019.10.20.07.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 07:44:15 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 4/5] gpiolib: add support for disabling line bias
Date:   Sun, 20 Oct 2019 22:42:37 +0800
Message-Id: <20191020144238.14080-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020144238.14080-1-warthog618@gmail.com>
References: <20191020144238.14080-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch allows pull up/down bias to be disabled, allowing
the line to float or to be biased only by external circuitry.
Use case is for where the bias has been applied previously,
either by default or by the user, but that setting may
conflict with the current use of the line.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c    | 63 ++++++++++++++++++++++++++++-----------
 drivers/gpio/gpiolib.h    |  1 +
 include/uapi/linux/gpio.h | 10 ++++---
 3 files changed, 53 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eef964417521..b6fdaedc793a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -421,8 +421,9 @@ struct linehandle_state {
 	(GPIOHANDLE_REQUEST_INPUT | \
 	GPIOHANDLE_REQUEST_OUTPUT | \
 	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
-	GPIOHANDLE_REQUEST_PULL_UP | \
-	GPIOHANDLE_REQUEST_PULL_DOWN | \
+	GPIOHANDLE_REQUEST_BIAS_DISABLE | \
+	GPIOHANDLE_REQUEST_BIAS_PULL_DOWN | \
+	GPIOHANDLE_REQUEST_BIAS_PULL_UP | \
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
 	GPIOHANDLE_REQUEST_OPEN_SOURCE)
 
@@ -554,10 +555,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
-	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	/* Bias flags only allowed for input mode. */
 	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
-	    ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
-	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
+	    ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) ||
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
 		return -EINVAL;
 
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
@@ -600,9 +602,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
+			set_bit(FLAG_BIAS_DISABLE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
 			set_bit(FLAG_PULL_DOWN, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
 			set_bit(FLAG_PULL_UP, &desc->flags);
 
 		ret = gpiod_set_transitory(desc, false);
@@ -924,6 +928,13 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
 		return -EINVAL;
 
+	/* Bias flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) ||
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
+		return -EINVAL;
+
 	le = kzalloc(sizeof(*le), GFP_KERNEL);
 	if (!le)
 		return -ENOMEM;
@@ -950,9 +961,11 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-	if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
+		set_bit(FLAG_BIAS_DISABLE, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
 		set_bit(FLAG_PULL_DOWN, &desc->flags);
-	if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
 		set_bit(FLAG_PULL_UP, &desc->flags);
 
 	ret = gpiod_direction_input(desc);
@@ -1107,10 +1120,12 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
 			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
 					   GPIOLINE_FLAG_IS_OUT);
+		if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_DISABLE;
 		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
-			lineinfo.flags |= GPIOLINE_FLAG_PULL_DOWN;
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
 		if (test_bit(FLAG_PULL_UP, &desc->flags))
-			lineinfo.flags |= GPIOLINE_FLAG_PULL_UP;
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
@@ -2786,6 +2801,7 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
 		clear_bit(FLAG_PULL_UP, &desc->flags);
 		clear_bit(FLAG_PULL_DOWN, &desc->flags);
+		clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 		ret = true;
 	}
@@ -2912,6 +2928,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	unsigned arg;
 
 	switch (mode) {
+	case PIN_CONFIG_BIAS_DISABLE:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 	case PIN_CONFIG_BIAS_PULL_UP:
 		arg = 1;
@@ -2925,6 +2942,23 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
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
@@ -2972,12 +3006,7 @@ int gpiod_direction_input(struct gpio_desc *desc)
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
index c2d1f7d908d6..300c2151e9f7 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -33,8 +33,9 @@ struct gpiochip_info {
 #define GPIOLINE_FLAG_ACTIVE_LOW	(1UL << 2)
 #define GPIOLINE_FLAG_OPEN_DRAIN	(1UL << 3)
 #define GPIOLINE_FLAG_OPEN_SOURCE	(1UL << 4)
-#define GPIOLINE_FLAG_PULL_UP	(1UL << 5)
-#define GPIOLINE_FLAG_PULL_DOWN	(1UL << 6)
+#define GPIOLINE_FLAG_BIAS_DISABLE	(1UL << 5)
+#define GPIOLINE_FLAG_BIAS_PULL_DOWN	(1UL << 6)
+#define GPIOLINE_FLAG_BIAS_PULL_UP	(1UL << 7)
 
 /**
  * struct gpioline_info - Information about a certain GPIO line
@@ -64,8 +65,9 @@ struct gpioline_info {
 #define GPIOHANDLE_REQUEST_ACTIVE_LOW	(1UL << 2)
 #define GPIOHANDLE_REQUEST_OPEN_DRAIN	(1UL << 3)
 #define GPIOHANDLE_REQUEST_OPEN_SOURCE	(1UL << 4)
-#define GPIOHANDLE_REQUEST_PULL_UP	(1UL << 5)
-#define GPIOHANDLE_REQUEST_PULL_DOWN	(1UL << 6)
+#define GPIOHANDLE_REQUEST_BIAS_DISABLE	(1UL << 5)
+#define GPIOHANDLE_REQUEST_BIAS_PULL_DOWN	(1UL << 6)
+#define GPIOHANDLE_REQUEST_BIAS_PULL_UP	(1UL << 7)
 
 /**
  * struct gpiohandle_request - Information about a GPIO handle request
-- 
2.23.0

