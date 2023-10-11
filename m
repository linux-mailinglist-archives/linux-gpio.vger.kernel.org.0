Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F00687C535B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346860AbjJKMOI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346857AbjJKMOA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:14:00 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23501FD3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:38 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40566f8a093so62357115e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026200; x=1697631000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DD6BuU8IBUrRqrtumgxKZT6+9ObXU+wfHPC15JgkQ2k=;
        b=OHL9Nzn4aCShWYbtYAmeJLu+GIdlpF6HGwwHfvMjeNP4YJfJNsODtEs6yR5QJCyJT+
         RQq4g11FAbgHkknhNeB8/DtGt8Fn4eSKhcsFFBUXxr1nnSK7lFjRfkZm3wPOlMK1FIAt
         s2mxr7za/yjad2TBObxtUqnIenyHe5VC7ufIrXiZNERsiQXYikpJ7gqgt4pNBFGvPkMb
         tKFa3MJ2pm75io4BL5asEeisOYwb4CuWfVRhfuveMjnEVtftyqv/vjlPZNJw6XSXe/O3
         h3Gb9YryDmVtaOPjvqOruZVW5czmnxwzOkd4KNNhjVsZw7ukyZei85e7jjVhGTbpT3Fm
         SPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026200; x=1697631000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DD6BuU8IBUrRqrtumgxKZT6+9ObXU+wfHPC15JgkQ2k=;
        b=EFUFfmwABC7oGuCRAMY34Fec74X6/DA4LkxEgVoeSKnK2jMu7kwFYKSncbdFQmRbrS
         QdM217BjFkftpMo9rfFFHaXj0MH6IrhomZi3y1DrUHdfa0RA68V06ymBv7He7KQul0F8
         vuy22iAGAl3wP0a/Uz4bAuVUd+K+glcfT3CyUCXa80App2bj/jvekqWTUTli8gCZwUi/
         AXfLkIMYOrc63Z5xLZ+ls50tpoaVzABYNOMYXsE7gOZgKkmKVrp7s+j1u3NahaEWZgK1
         3LyEqdu0A6SxPVqEj91yuUFaTSloIi/BKC64JW6MgO7nRVZhDh1qWIrIgf3J1TU4B9Nr
         BYrA==
X-Gm-Message-State: AOJu0YxHhvN7xIioign2hDFGsKRPt+xcSU/WZGL07g3M7fyr0V6gcubz
        r8iRKvzFVji4WPEHM1Sj87JoCg==
X-Google-Smtp-Source: AGHT+IEFq+coT62Yma7NWl07yIfaFMeiu/EDdvRfXRkmuZzXSfkwTtPEjpsqAXpAWQRCdXSEE3OLEg==
X-Received: by 2002:a05:600c:cc:b0:405:3955:5872 with SMTP id u12-20020a05600c00cc00b0040539555872mr17752582wmm.18.1697026200458;
        Wed, 11 Oct 2023 05:10:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 58/62] pinctrl: starfive: drop wrappers around pinctrl_gpio_request/free()
Date:   Wed, 11 Oct 2023 14:08:26 +0200
Message-Id: <20231011120830.49324-59-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

pinctrl_gpio_*() helpers now have signatures corresponding with those of
the GPIOLIB callbacks. We can drop the wrappers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 14 ++------------
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 14 ++------------
 2 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index 7beed57d665a..ea70b8c61679 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -916,16 +916,6 @@ static struct pinctrl_desc starfive_desc = {
 	.custom_conf_items = starfive_pinconf_custom_conf_items,
 };
 
-static int starfive_gpio_request(struct gpio_chip *gc, unsigned int gpio)
-{
-	return pinctrl_gpio_request(gc, gpio);
-}
-
-static void starfive_gpio_free(struct gpio_chip *gc, unsigned int gpio)
-{
-	pinctrl_gpio_free(gc, gpio);
-}
-
 static int starfive_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct starfive_pinctrl *sfp = container_of(gc, struct starfive_pinctrl, gc);
@@ -1309,8 +1299,8 @@ static int starfive_probe(struct platform_device *pdev)
 
 	sfp->gc.label = dev_name(dev);
 	sfp->gc.owner = THIS_MODULE;
-	sfp->gc.request = starfive_gpio_request;
-	sfp->gc.free = starfive_gpio_free;
+	sfp->gc.request = pinctrl_gpio_request;
+	sfp->gc.free = pinctrl_gpio_free;
 	sfp->gc.get_direction = starfive_gpio_get_direction;
 	sfp->gc.direction_input = starfive_gpio_direction_input;
 	sfp->gc.direction_output = starfive_gpio_direction_output;
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 695c8c0a6e8b..9d71e8c13310 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -545,16 +545,6 @@ static const struct pinconf_ops jh7110_pinconf_ops = {
 	.is_generic		= true,
 };
 
-static int jh7110_gpio_request(struct gpio_chip *gc, unsigned int gpio)
-{
-	return pinctrl_gpio_request(gc, gpio);
-}
-
-static void jh7110_gpio_free(struct gpio_chip *gc, unsigned int gpio)
-{
-	pinctrl_gpio_free(gc, gpio);
-}
-
 static int jh7110_gpio_get_direction(struct gpio_chip *gc,
 				     unsigned int gpio)
 {
@@ -940,8 +930,8 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
 
 	sfp->gc.label = dev_name(dev);
 	sfp->gc.owner = THIS_MODULE;
-	sfp->gc.request = jh7110_gpio_request;
-	sfp->gc.free = jh7110_gpio_free;
+	sfp->gc.request = pinctrl_gpio_request;
+	sfp->gc.free = pinctrl_gpio_free;
 	sfp->gc.get_direction = jh7110_gpio_get_direction;
 	sfp->gc.direction_input = jh7110_gpio_direction_input;
 	sfp->gc.direction_output = jh7110_gpio_direction_output;
-- 
2.39.2

