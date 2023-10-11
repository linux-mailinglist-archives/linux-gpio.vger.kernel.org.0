Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943427C5306
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346734AbjJKMJc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346226AbjJKMJX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:09:23 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A994AF
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:19 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-406618d0991so62397615e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026158; x=1697630958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRDXdsqovOpFqQlW6NMXq89oYY2ugyvGcK/dIwIm0sQ=;
        b=UPnXTD/7c9tOO31qKINhHLOWX5Prpy71smepplCKhsUzHNziM0U/kPl1BrvJFPUG/L
         A0wnAA80ZUQ6T0hYH8SuyAHh7UFhtJO7WG6gnUM8zezHvOsCvckOXFLwPm40EaCZAVg+
         odv9dAAkBN5tauuBBXdHboLFhdLoglt12VpfCDF0ow01flW7irLbCTAdXG/7fseg5Q/p
         EWDC0pDryQBJRd4odXNqvk1BFzR3qGopPdlu3S5DKZGW6y39bFspXVs734g1dBp8kbLs
         dJm3nwPYKgZuMU/jZy9HAXw0QuAOkW9XiCiB6b9ooAKXrgbrIu3PHoQvlA2Fb7PHpfdh
         hxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026158; x=1697630958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRDXdsqovOpFqQlW6NMXq89oYY2ugyvGcK/dIwIm0sQ=;
        b=AobAq1ytBuETwFzJ9StsE/df+lVJ3Xde7RoggWI9RCcOoXxEYCfJqjrxqP0jksWhS1
         a1zfW/irOjBRi2VLxEl/AfwuTaZtpMejwoCL3QewcUscoI6UUJ6zF9lQQVn2yAR/yaJv
         et9w6ZF3IMoPE/sEigMlMgHAujd545xC1TGl4MeD6Ua0N/nG/H8Xak739nX0B7AJbKz0
         +s+rcV7cHTTqhK5gJA5UzRBFptv0Nh7GW6RLsECwbGW5XkdEW6M2MrtX1vr0ZQP4srY5
         cGTKCCgvHGm17izrQFw7p+JYKWdYh6Z3UjTbCJQ39ZTuWBv8q/14f4sa+9slZRmVI92Z
         2NIw==
X-Gm-Message-State: AOJu0YwQLnKat/qRD+NHy9w1w2xazsusThapwNcFbVRFbTqp/cJTCxo2
        +/lE/wjC76scfuPOPwRJMK7p3g==
X-Google-Smtp-Source: AGHT+IFZ3d0u7bOJtYq5KPYt8ncSU+QNWHTg5cFjwoYBWBJzOT55bA3xsHFpiGSd4RURay4BlBm/LA==
X-Received: by 2002:a7b:c451:0:b0:401:aa8f:7562 with SMTP id l17-20020a7bc451000000b00401aa8f7562mr19291200wmi.11.1697026158099;
        Wed, 11 Oct 2023 05:09:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:17 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 12/62] gpio: vf610: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:40 +0200
Message-Id: <20231011120830.49324-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-vf610.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index a89ae84a1fa0..2c22a31ffbdc 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -130,7 +130,7 @@ static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
 	}
 
-	return pinctrl_gpio_direction_input(chip->base + gpio);
+	return pinctrl_gpio_direction_input_new(chip, gpio);
 }
 
 static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
@@ -148,7 +148,7 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 
 	vf610_gpio_set(chip, gpio, value);
 
-	return pinctrl_gpio_direction_output(chip->base + gpio);
+	return pinctrl_gpio_direction_output_new(chip, gpio);
 }
 
 static void vf610_gpio_irq_handler(struct irq_desc *desc)
-- 
2.39.2

