Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924BB20F5BA
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 15:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388194AbgF3NeC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 09:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388169AbgF3Ndz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 09:33:55 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2D8C03E97E
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:55 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o2so19624617wmh.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mVRFyI7gMPSCpFThQPOO71zLy3/PBdN3qWCTPbMiXks=;
        b=qgt19lMGK+EwYSjtxdGtnfQI+W4/0k5CuiIuR80c/9n/twpmcJ6PiG2Uu1mz5GFFkK
         AUTe0bdiZWK0juZgx80T2vbTxbfPXM+cjTrYjRQbjmsbmhbS9C0U6/shpZXE6Z5V5DqD
         KGdB2MA/Ap0lBLfXKNkTY/YevFiJ0KdsreHz/dM9+h2/Gntcfo7AhMM9o4Qb2RLQYdwj
         1lfjqrZazfSzDW2nHscL+gd/e+98e4KmtSfApChaUTKTxwYIIDjTGbfIa+VDaUrRtsT5
         F9Qv0dpXUaovM1dIRPgj9VJdlruRfLYko0xsY+TucjB+K42meBmljWjWADwwB4WClmzT
         O8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mVRFyI7gMPSCpFThQPOO71zLy3/PBdN3qWCTPbMiXks=;
        b=icJxH0GlAur6u7AjO0wuLBN3rK8L2jJT1Qp8c+KqGtRSads9ZXQK5xCmMv181tK0JK
         l8DqvLfGfRVJQbAbsLZZ8xvl+PsXRYneVE7Qlbfvk0q2NyqFcNnFVO0h60fwhJ91b9GB
         vOiUX6p3DB6Kw5qa4660L1InXndEZjB2d5zAyBsxZsNfhLA6I1OW+chKQwMv0Le9LPlm
         pQz2ryU9wyYap8x7C0gqF9/ToJkeua8S5IAFNZVQff2SjZHQ4e3/409Dc+5DqWOj10FQ
         9MKoHdhMJ85mbS10u2coRrHghL3rbEVS7PijVokqH7rI78r0VxFvXR5W1DdHVcjHRtez
         eGgA==
X-Gm-Message-State: AOAM532Q9/X9O2u/Vo5kLxhMqS9b80j54bw5F4epULIBghKcY9m2XIuY
        CZENVvLgvyPVqqfwos60o8jKrw==
X-Google-Smtp-Source: ABdhPJwtQjgdwmmsWj1j8nXmCgvlDtGtfE76f3lplQO2CPaJKrzNdygk9VxYczxqVvfWrMamk5G93Q==
X-Received: by 2002:a05:600c:2f17:: with SMTP id r23mr20601830wmn.167.1593524034128;
        Tue, 30 Jun 2020 06:33:54 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id z16sm3682464wrr.35.2020.06.30.06.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:33:53 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Andrei Stefanescu <andrei.stefanescu@microchip.com>
Subject: [PATCH 05/10] gpio: gpio-sama5d2-piobu: Demote all kerneldoc headers to basic comment blocks
Date:   Tue, 30 Jun 2020 14:33:40 +0100
Message-Id: <20200630133345.2232932-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630133345.2232932-1-lee.jones@linaro.org>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

No attempt has been made to provide proper descriptions for each of
the function arguments throughout the file.  Simply demote all
kerneldoc headers to basic function headers.

Fixes the following W=1 kernel build warnings:

 drivers/gpio/gpio-sama5d2-piobu.c:59: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_setup_pin'
 drivers/gpio/gpio-sama5d2-piobu.c:59: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_setup_pin'
 drivers/gpio/gpio-sama5d2-piobu.c:81: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_write_value'
 drivers/gpio/gpio-sama5d2-piobu.c:81: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_write_value'
 drivers/gpio/gpio-sama5d2-piobu.c:81: warning: Function parameter or member 'mask' not described in 'sama5d2_piobu_write_value'
 drivers/gpio/gpio-sama5d2-piobu.c:81: warning: Function parameter or member 'value' not described in 'sama5d2_piobu_write_value'
 drivers/gpio/gpio-sama5d2-piobu.c:97: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_read_value'
 drivers/gpio/gpio-sama5d2-piobu.c:97: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_read_value'
 drivers/gpio/gpio-sama5d2-piobu.c:97: warning: Function parameter or member 'mask' not described in 'sama5d2_piobu_read_value'
 drivers/gpio/gpio-sama5d2-piobu.c:116: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_get_direction'
 drivers/gpio/gpio-sama5d2-piobu.c:116: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_get_direction'
 drivers/gpio/gpio-sama5d2-piobu.c:131: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_direction_input'
 drivers/gpio/gpio-sama5d2-piobu.c:131: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_direction_input'
 drivers/gpio/gpio-sama5d2-piobu.c:140: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_direction_output'
 drivers/gpio/gpio-sama5d2-piobu.c:140: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_direction_output'
 drivers/gpio/gpio-sama5d2-piobu.c:140: warning: Function parameter or member 'value' not described in 'sama5d2_piobu_direction_output'
 drivers/gpio/gpio-sama5d2-piobu.c:154: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_get'
 drivers/gpio/gpio-sama5d2-piobu.c:154: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_get'
 drivers/gpio/gpio-sama5d2-piobu.c:174: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_set'
 drivers/gpio/gpio-sama5d2-piobu.c:174: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_set'
 drivers/gpio/gpio-sama5d2-piobu.c:174: warning: Function parameter or member 'value' not described in 'sama5d2_piobu_set'

Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Andrei Stefanescu <andrei.stefanescu@microchip.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-sama5d2-piobu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index 4d47b2c411868..b7c9506581701 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -49,7 +49,7 @@ struct sama5d2_piobu {
 	struct regmap *regmap;
 };
 
-/**
+/*
  * sama5d2_piobu_setup_pin() - prepares a pin for set_direction call
  *
  * Do not consider pin for tamper detection (normal and backup modes)
@@ -73,7 +73,7 @@ static int sama5d2_piobu_setup_pin(struct gpio_chip *chip, unsigned int pin)
 	return regmap_update_bits(piobu->regmap, PIOBU_WKPR, mask, 0);
 }
 
-/**
+/*
  * sama5d2_piobu_write_value() - writes value & mask at the pin's PIOBU register
  */
 static int sama5d2_piobu_write_value(struct gpio_chip *chip, unsigned int pin,
@@ -88,7 +88,7 @@ static int sama5d2_piobu_write_value(struct gpio_chip *chip, unsigned int pin,
 	return regmap_update_bits(piobu->regmap, reg, mask, value);
 }
 
-/**
+/*
  * sama5d2_piobu_read_value() - read the value with masking from the pin's PIOBU
  *			      register
  */
@@ -108,7 +108,7 @@ static int sama5d2_piobu_read_value(struct gpio_chip *chip, unsigned int pin,
 	return val & mask;
 }
 
-/**
+/*
  * sama5d2_piobu_get_direction() - gpiochip get_direction
  */
 static int sama5d2_piobu_get_direction(struct gpio_chip *chip,
@@ -123,7 +123,7 @@ static int sama5d2_piobu_get_direction(struct gpio_chip *chip,
 				   GPIO_LINE_DIRECTION_OUT;
 }
 
-/**
+/*
  * sama5d2_piobu_direction_input() - gpiochip direction_input
  */
 static int sama5d2_piobu_direction_input(struct gpio_chip *chip,
@@ -132,7 +132,7 @@ static int sama5d2_piobu_direction_input(struct gpio_chip *chip,
 	return sama5d2_piobu_write_value(chip, pin, PIOBU_DIRECTION, PIOBU_IN);
 }
 
-/**
+/*
  * sama5d2_piobu_direction_output() - gpiochip direction_output
  */
 static int sama5d2_piobu_direction_output(struct gpio_chip *chip,
@@ -147,7 +147,7 @@ static int sama5d2_piobu_direction_output(struct gpio_chip *chip,
 					 val);
 }
 
-/**
+/*
  * sama5d2_piobu_get() - gpiochip get
  */
 static int sama5d2_piobu_get(struct gpio_chip *chip, unsigned int pin)
@@ -166,7 +166,7 @@ static int sama5d2_piobu_get(struct gpio_chip *chip, unsigned int pin)
 	return !!ret;
 }
 
-/**
+/*
  * sama5d2_piobu_set() - gpiochip set
  */
 static void sama5d2_piobu_set(struct gpio_chip *chip, unsigned int pin,
-- 
2.25.1

