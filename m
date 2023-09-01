Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955DB78FC45
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Sep 2023 13:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349163AbjIAL3m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Sep 2023 07:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240516AbjIAL3l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Sep 2023 07:29:41 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1F01B2
        for <linux-gpio@vger.kernel.org>; Fri,  1 Sep 2023 04:29:37 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso1577678f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Sep 2023 04:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693567775; x=1694172575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdNzHMrDYEjbwJ343USEGvpLxvkS/UUHzfPWvixkwgI=;
        b=vUvxVayrJa3jfw3fWpBLSO0qhvC+2GvXcjOLRcMmzvfDQNrO6QFhiECw6F5GZiI2Lg
         JBs2j9+o1afzYxJwSSGIm2mnVirwKeOJ8TRYck1zFHQqkon+LbXVMRuaQwHDJGRNUbUE
         /igGC7cR13BqmE9yQLjJYO/FBXzhTmQe2bWP9xmj3gPmJKnTtcJN2bn4399EkAJyZOME
         f0DfmDukrLBkAUsOvSMOCIX9YJFbClGC2+TgT7LgXPLUGf9BQjYX0QIzZGlzbi49PDGZ
         N6KjjKTB65hD911FSgPKGxKnv7wLqfvZuDXLVpdbfDe2ogK+cTkeJ+wOkyZwPDHCK3hV
         Kyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693567775; x=1694172575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdNzHMrDYEjbwJ343USEGvpLxvkS/UUHzfPWvixkwgI=;
        b=j3jJTSP31DVm4CKsodTMuUj5IQ/s0VgS2bETz2tb5uumvL7rzNtVQf/ygEowcaokZy
         B7gkG3Mk+kbFIs+uSjnCww8VRUsEgVoTWbvz4ygE7+Z/ypWD/aSHiGkBoOF4AiuUA2e3
         UsAET8RgrKEYJdO0of2ArpvkcvSDRnP9HD/Tu5SE5cCMlKeOEUx2YXDUK2efxNhLOoeQ
         ElH0dHtTPay71J9DRC5t0xFa2Muhj4hHwjjQbm/P2pm7t1nL7x6Rfy3PFFqJJUipj0Yi
         M9D1LnWhsP1QHIDs9o11L9HxArXSUGiV5a7RWhmk10Zdt5R8ldq0atqSG2o/7NDaLhFd
         AXFQ==
X-Gm-Message-State: AOJu0Yy+3CIWNGyVSbQFEVsPPOdo+qF5nT+bOn/8S0zQkQvzpaYLYhmW
        CZYtohHoG4cHgeKNdJZRZ4qZ7Q==
X-Google-Smtp-Source: AGHT+IFOxs7U639zLRVdB1ruPdh9fBP79ym795QX/3xyEFiPIbi9EOLt7eNqTZD30VyFW28BsiFsYw==
X-Received: by 2002:a5d:464b:0:b0:31d:da10:e471 with SMTP id j11-20020a5d464b000000b0031dda10e471mr1642148wrs.69.1693567775582;
        Fri, 01 Sep 2023 04:29:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e94b:1054:6760:aa27])
        by smtp.gmail.com with ESMTPSA id a28-20020a5d457c000000b00317f70240afsm4963426wrc.27.2023.09.01.04.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:29:35 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] gpiolib: make gpiochip_get_desc() public
Date:   Fri,  1 Sep 2023 13:29:25 +0200
Message-Id: <20230901112926.13216-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901112926.13216-1-brgl@bgdev.pl>
References: <20230901112926.13216-1-brgl@bgdev.pl>
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

It makes sense for a GPIO driver to want to get its own descriptor
without requesting it. After all, the driver knows that it'll still be
valid. Let's move this helper to linux/gpio/driver.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h      | 2 --
 include/linux/gpio/driver.h | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a0a67569300b..09c5feb01d52 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -122,8 +122,6 @@ struct gpio_array {
 	unsigned long		invert_mask[];
 };
 
-struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
-
 #define for_each_gpio_desc(gc, desc)					\
 	for (unsigned int __i = 0;					\
 	     __i < gc->ngpio && (desc = gpiochip_get_desc(gc, __i));	\
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4f0c5d62c8f3..8fc3ceffcbe9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -758,6 +758,8 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 					    enum gpiod_flags dflags);
 void gpiochip_free_own_desc(struct gpio_desc *desc);
 
+struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
+
 #ifdef CONFIG_GPIOLIB
 
 /* lock/unlock as IRQ */
-- 
2.39.2

