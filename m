Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39B6BEF338
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 03:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730033AbfKECFD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 21:05:03 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44452 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfKECFD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 21:05:03 -0500
Received: by mail-pl1-f195.google.com with SMTP id q16so8588294pll.11
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 18:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=moBzgRXnteR5ixyCrxaIHf0bcMBVebpnLitzWb1HcPY=;
        b=uHwsczroomdEHnsI80nhRUyLeCD2zbHNWqlM9Y89Ap/VpIjgrzeG1n9rBqrB8tRRD7
         ZVxfLrprSUpukjXhAEdb5U0WCDiVkWj0KRzJm6Uu/d0QskcyK34VqbUySaj4pzJKyBs6
         KwDeXncVH0NntlBDN+17O/6yy7U2eq19nIVU3q7BlpU1uhLBnPZDW2v+IkKkaBonkV8F
         xcEHBEwemzm+9erVYUYqPUeW0QmSiXWLVMFZzv45C+q/+r65/Dw4ujlFJv6JY8JGyNtY
         5aDT6wX9ZFr+J87bGNy7bAetqSLYvY5ojAr0qn3hRAEVvEv59Ksu+g283fRQCMgi1mdv
         30fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=moBzgRXnteR5ixyCrxaIHf0bcMBVebpnLitzWb1HcPY=;
        b=tyoTmM65kaYpKryuGQO74bPVvK+52k834Ll2Rqlan33jNpVY3xpFf/JSDjiXs9sRUM
         h6VYxMNIByn4750MlMokIrvSZ6iR0dVSvENNIJOGpkPcwpoYVWHRdREmRzzsZ+Wx3Tyq
         /0I6l+d9InbVoNF7KTZE+EGByS4uaiOillTSBBPmHXEt1zjgjMIn9fBvQXh6GBqzWe/Z
         fPuBjlYnUjs9Opn1gXVi/7+REKNetrTQr4PHJgpOvBMFtyRTA3+QS2oHW42/5AMFjknP
         CkbNRNIbhTGXYBWkk1jnqYrJhO83tbc5/n4fzK730V2mIU75hc1+aKN3mEm5qIi1enqJ
         pu2A==
X-Gm-Message-State: APjAAAVRhRDDIlVW02zJSRGnupVnv7JP8dZ5dvhuOd866NJ3F0TMSpXU
        AeRQXTt9139qAEw/S6oeV9CZ5vIesrGxpQ==
X-Google-Smtp-Source: APXvYqwxGJBZ7+WZNtp20wgx7rn66NTkwRgOD9h2m8ULjo75zdob7nP9UK6O8+PnIG8mQuU/39SjEg==
X-Received: by 2002:a17:902:8ec7:: with SMTP id x7mr21045973plo.88.1572919502350;
        Mon, 04 Nov 2019 18:05:02 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id r184sm11641909pfc.106.2019.11.04.18.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 18:05:01 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 3/7] gpiolib: add support for disabling line bias
Date:   Tue,  5 Nov 2019 10:04:25 +0800
Message-Id: <20191105020429.18942-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
References: <20191105020429.18942-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib.c    | 61 ++++++++++++++++++++++++++++++++-------
 drivers/gpio/gpiolib.h    |  1 +
 include/uapi/linux/gpio.h |  2 ++
 3 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 24bdfdd26b85..0ac0a250b17a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -424,6 +424,7 @@ struct linehandle_state {
 	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
 	GPIOHANDLE_REQUEST_BIAS_PULL_UP | \
 	GPIOHANDLE_REQUEST_BIAS_PULL_DOWN | \
+	GPIOHANDLE_REQUEST_BIAS_DISABLE | \
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
 	GPIOHANDLE_REQUEST_OPEN_SOURCE)
 
@@ -555,12 +556,21 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
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
@@ -601,6 +611,8 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
+			set_bit(FLAG_BIAS_DISABLE, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
 			set_bit(FLAG_PULL_DOWN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
@@ -925,6 +937,14 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
 		return -EINVAL;
 
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
@@ -951,6 +971,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
+		set_bit(FLAG_BIAS_DISABLE, &desc->flags);
 	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
 		set_bit(FLAG_PULL_DOWN, &desc->flags);
 	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
@@ -1108,6 +1130,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
 			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
 					   GPIOLINE_FLAG_IS_OUT);
+		if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_DISABLE;
 		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
 			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
 		if (test_bit(FLAG_PULL_UP, &desc->flags))
@@ -2806,6 +2830,7 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
 		clear_bit(FLAG_PULL_UP, &desc->flags);
 		clear_bit(FLAG_PULL_DOWN, &desc->flags);
+		clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 		ret = true;
 	}
@@ -2932,6 +2957,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	unsigned arg;
 
 	switch (mode) {
+	case PIN_CONFIG_BIAS_DISABLE:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 	case PIN_CONFIG_BIAS_PULL_UP:
 		arg = 1;
@@ -2945,6 +2971,26 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
 }
 
+static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
+{
+	int bias = 0;
+	int ret = 0;
+
+	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
+		bias = PIN_CONFIG_BIAS_DISABLE;
+	else if (test_bit(FLAG_PULL_UP, &desc->flags))
+		bias = PIN_CONFIG_BIAS_PULL_UP;
+	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+		bias = PIN_CONFIG_BIAS_PULL_DOWN;
+
+	if (bias) {
+		ret = gpio_set_config(chip, gpio_chip_hwgpio(desc), bias);
+		if (ret != -ENOTSUPP)
+			return ret;
+	}
+	return 0;
+}
+
 /**
  * gpiod_direction_input - set the GPIO direction to input
  * @desc:	GPIO to set to input
@@ -2989,15 +3035,10 @@ int gpiod_direction_input(struct gpio_desc *desc)
 			   __func__);
 		return -EIO;
 	}
-	if (ret == 0)
+	if (ret == 0) {
 		clear_bit(FLAG_IS_OUT, &desc->flags);
-
-	if (test_bit(FLAG_PULL_UP, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_BIAS_PULL_UP);
-	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_BIAS_PULL_DOWN);
+		ret = gpio_set_bias(chip, desc);
+	}
 
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

