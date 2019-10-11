Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6C3D44BD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 17:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfJKPsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 11:48:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35040 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfJKPsL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 11:48:11 -0400
Received: by mail-pg1-f196.google.com with SMTP id p30so6031985pgl.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZcjYRpVw4R8UENGGJg84/VG0LG+CbDrj8hDlfV/ZeLg=;
        b=N9oVErivwsFdZ+MtncgVtbCUu5GxnhfPGy8F8cypNalOeFThMZK/cQZAYddEFTEIQM
         CFsFoRbVVwKlgLSFt8Xx3gT9dRo76mTP+UEDUOCf1FPXdh9vst7jy1IT6zyzWNdaV5hF
         jKa1P5DnQNt/PNM9ykU+xqpUhFpwCEP9j86wTHL4lOtJg7usvsWlvARmYmNea7uAehxN
         u5wLn3fYztSsBn9n7Zs9KqzWSAxnd/5Uzn0WamA4AoiOEKUK8AJXuaXrcjeSp3HsrvO6
         2e9TnR4Y6yT/SnRGa/wq1vRNN04wjhAS7sedZI7K0sUezyoq48Bh3c0m5gNH93JfFBHo
         MYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcjYRpVw4R8UENGGJg84/VG0LG+CbDrj8hDlfV/ZeLg=;
        b=si5RbaQYFsjZ8bXnpUd4wsGxTuXuDNNCQ+5B5vnf1qCaUCQ+9bn/GuYzmwPPbO+Aze
         NEVzPhu55ocG3iMpApneDSRMs0ZxLdDllBbg1xh4dmKmIWmA/x2XmSBAQK6qd03HF/0f
         nc25E+hpFT017q0da3GdCKmiWWCOj+Er02E6RYOYSsniVFUpl3PnFTc5ADxD8j5vu1IX
         QaUJcGMC6fZoi/ttZOssTBNhxa5LJ/52VNdL+qeYgVFKBPSl0FTEVhzNzaDH1ksQYzmv
         Xzd7M2/D/3sKg8xrXJeFZV4u7t84Bda9ewREZDumTWQIuEejUF/0mrKFBhHoXQMYsVft
         JHSw==
X-Gm-Message-State: APjAAAU+DZ16uZMwLP0Afr1xpvYQduyuUmEAvm1yHG89SujODBjPQDKG
        iNPN9U2ks/pbvY+8xvazpvaC7Q5pkMGi/g==
X-Google-Smtp-Source: APXvYqyXph+MBZ8x4HT23ZNXOiV5NfPax3IsMchjTe4x1aHr1WC9AIoCJ5DqkM1Q9sdI6XD3fjyo5w==
X-Received: by 2002:a17:90a:de02:: with SMTP id m2mr18327133pjv.21.1570808890373;
        Fri, 11 Oct 2019 08:48:10 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id v28sm13755404pgn.17.2019.10.11.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 08:48:09 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 4/5] gpiolib: disable bias on inputs when pull up/down are both set
Date:   Fri, 11 Oct 2019 23:46:49 +0800
Message-Id: <20191011154650.1749-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011154650.1749-1-warthog618@gmail.com>
References: <20191011154650.1749-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a634c340920b..f0665ea396cd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	    (lflags & GPIOHANDLE_REQUEST_OUTPUT))
 		return -EINVAL;
 
-	/* Same with pull-up and pull-down. */
-	if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
-	    (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
-		return -EINVAL;
-
 	/*
 	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
 	 * the hardware actually supports enabling both at the same time the
@@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
 		return -EINVAL;
 
-	/*
-	 * Do not allow both pull-up and pull-down flags to be set as they
-	 *  are contradictory.
-	 */
-	if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
-	    (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
-		return -EINVAL;
-
 	le = kzalloc(sizeof(*le), GFP_KERNEL);
 	if (!le)
 		return -ENOMEM;
@@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	unsigned arg;
 
 	switch (mode) {
+	case PIN_CONFIG_BIAS_DISABLE:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 	case PIN_CONFIG_BIAS_PULL_UP:
 		arg = 1;
@@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	if (ret == 0)
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 
-	if (test_bit(FLAG_PULL_UP, &desc->flags))
+	if (test_bit(FLAG_PULL_UP, &desc->flags) &&
+		test_bit(FLAG_PULL_DOWN, &desc->flags))
+		gpio_set_config(chip, gpio_chip_hwgpio(desc),
+				PIN_CONFIG_BIAS_DISABLE);
+	else if (test_bit(FLAG_PULL_UP, &desc->flags))
 		gpio_set_config(chip, gpio_chip_hwgpio(desc),
 				PIN_CONFIG_BIAS_PULL_UP);
 	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
@@ -4462,7 +4454,7 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 
 	if (lflags & GPIO_PULL_UP)
 		set_bit(FLAG_PULL_UP, &desc->flags);
-	else if (lflags & GPIO_PULL_DOWN)
+	if (lflags & GPIO_PULL_DOWN)
 		set_bit(FLAG_PULL_DOWN, &desc->flags);
 
 	ret = gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY));
-- 
2.23.0

