Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8AF6D4BFE
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2019 03:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfJLB5P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 21:57:15 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37389 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbfJLB5O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 21:57:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id p1so6772483pgi.4
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 18:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DuhvzQhU38wgFVGeqIOao3QuYRbclUqMBiuip6aGEIU=;
        b=nAcUoxKFRZ9zVQzRMDnKBVz82qgdatPUx68aQEZEYV88AGgXSQtkklq4ZzoYjeFGeX
         RdmMKTnY7P1GzxC9kJKiwLYKq6TeF3CTo+6oIQrJtf51LTkZzaZ5fxrdKdn0zlOHryxB
         0nfrpqsoMaw/n0oAk3CN3VR5m2YxE9KNUXyB8Tg6Ptwikb7IYMAGfnLrR2L58cB/frVd
         BYynz4OSWqTK47XPOMwr4/Gnlg7SBnI96cLFLKwom3zGXKpXkbDnDJFvNVSndHTnL2mr
         K2PX0Fc3664EvbTwZpWcQ1APwElupl2oMOTd0K0xxK42tdSG8RrMSIe1w8pWPU+eqEUk
         XNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DuhvzQhU38wgFVGeqIOao3QuYRbclUqMBiuip6aGEIU=;
        b=LExYYjeOzUcccmRkN0UXAS0TIHF2t9liBwRDjXWa/R83dkVOBTYdnToBIxzrHarQV4
         FdKVY5f3UsR7H2iPC68aN9IfnXAUAK+3/f91lTADbPbQ6tniMBSYLSazwXwvtm8awGik
         cp7HOdoF6ujXbKkkr6DhxXTHsEZ3M0AbY55rQqWuwFk8ru4E73oAyFYzlQah3+CHhzif
         MFmzREv5N4z2szgU+v+2E0LgM7S4e0DRFxhs4zRTblOju4F/NqY0RUJcfHOkQ1Otvo8s
         J3YU6erXWkInk+eqJ56S9ywzi1voTHlijthJ4rZothLn64zYEHG3NhRTGAqph4quM87S
         hoPg==
X-Gm-Message-State: APjAAAUWA5Bq4wKACVjsJmS2n8qWlH5KXubBa60hHaYPPx2m6ZbNvIWP
        CMr684odqt2wPKiMEFo53TeOF0PW0BD/rg==
X-Google-Smtp-Source: APXvYqwf2eouH0Y+Hyb15lA2pq6b/7Sd/6l2+0xPbNCPUUFumNjAY3AY32MQk6q3b9VNFz1hR+BGbQ==
X-Received: by 2002:a62:8209:: with SMTP id w9mr19755770pfd.5.1570845433903;
        Fri, 11 Oct 2019 18:57:13 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id b20sm12042242pff.158.2019.10.11.18.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 18:57:13 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 6/6] gpiolib: allow pull up/down on outputs
Date:   Sat, 12 Oct 2019 09:56:28 +0800
Message-Id: <20191012015628.9604-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191012015628.9604-1-warthog618@gmail.com>
References: <20191012015628.9604-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch allows pull up/down bias to be set on outputs.
Use case is for open source or open drain applications where
internal pull up/down may conflict with external biasing.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f90b20d548b9..9cc0f9077c7b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -554,8 +554,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
-	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
-	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	/* PULL_UP and PULL_DOWN flags only allowed for input or output mode. */
+	if (!((lflags & GPIOHANDLE_REQUEST_INPUT) ||
+	      (lflags & GPIOHANDLE_REQUEST_OUTPUT)) &&
 	    ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
 	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
 		return -EINVAL;
@@ -2932,6 +2933,24 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
 }
 
+static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
+{
+	int bias = 0;
+
+	if (test_bit(FLAG_PULL_UP, &desc->flags) &&
+	    test_bit(FLAG_PULL_DOWN, &desc->flags))
+		bias = PIN_CONFIG_BIAS_DISABLE;
+	else if (test_bit(FLAG_PULL_UP, &desc->flags))
+		bias = PIN_CONFIG_BIAS_PULL_UP;
+	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+		bias = PIN_CONFIG_BIAS_PULL_DOWN;
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
@@ -2979,16 +2998,7 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	if (ret == 0)
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 
-	if (test_bit(FLAG_PULL_UP, &desc->flags) &&
-		test_bit(FLAG_PULL_DOWN, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_BIAS_DISABLE);
-	else if (test_bit(FLAG_PULL_UP, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_BIAS_PULL_UP);
-	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_BIAS_PULL_DOWN);
+	gpio_set_bias(chip, desc);
 
 	trace_gpio_direction(desc_to_gpio(desc), 1, ret);
 
@@ -3114,6 +3124,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	}
 
 set_output_value:
+	gpio_set_bias(gc, desc);
 	return gpiod_direction_output_raw_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
-- 
2.23.0

