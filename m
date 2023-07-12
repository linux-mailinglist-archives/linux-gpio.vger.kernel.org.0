Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 342227503FD
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jul 2023 12:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbjGLKAE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jul 2023 06:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjGLKAC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2023 06:00:02 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F93F1712
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jul 2023 03:00:00 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso6817491f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jul 2023 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689155999; x=1691747999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LjfZQU8GBAEUxKy5KWZcG0QEkZLgJT10dbkt0QDjsWA=;
        b=xQ4OjdWQxYn4IOlz9wzr/uRrprls5W/U9tFMRXel53luWdbbWTvhIY77eVryywk5ao
         fhdsbdno6F7bTpBx7xv2CYO1B+Dsp/GS14BVJsqr3GhlPGkEavTjOxGlLJ0emo78bRaJ
         KCHhEZkA6cWoTDEAu6V56qHOLLRzav9Ic+jl2s0Sjif8KJhYQ8XAOEYhYaojpUlcSAm2
         GcnNI++uQ/RG3svSKjXLSgZrUTj2hjGIPfWJ0Wm2qoCl49NaXKUAlRnyDFVli18/cAVG
         iXeKE6TNkbnuUZzFLbwhiG8sxM9AKOpeLaPuvw1SPvcoWCxsQjKp4ehANb8+B+XkgYjr
         4I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689155999; x=1691747999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjfZQU8GBAEUxKy5KWZcG0QEkZLgJT10dbkt0QDjsWA=;
        b=USypVpijTAS0Ld2BbxrbVppbyaZvODqNVDT8F7ctDKlCl6B1l1wsmUwRCQcFuTZP/I
         0kQy+npxWuxduHDL/bVqpUH8vqnMgweJHcv0QmR6YGmOiOLoY+fSilENQoI8Q4Cy6Iaf
         XdvOM0Z7nHJyWfcW/9VyQriwhqobUIUI1/IRmObdjzzzRlbzoxt/Z4ZZgYBqW2v4Lkbi
         y0bpz201QW2yasBhXtiaPV0zdYzz/ZxvwA9yol4Yg6Dx0fX0mxDp2Ldqbwxn8U3awK1z
         pOTqbXXJ5S31dJSdh2VbPUiCPxjaizNQ6z8OJdZflRuszl5wsXKREt1Jkz6FGHYyVrvr
         RiAA==
X-Gm-Message-State: ABy/qLbbeXXJCKNiTKcan3u8/ICa0ZwjLLCwFMNmjVek0F5n1+fTMCnB
        B6Zt4xWOkosxKYFneDXqtPoI0ctu/SrqCtgc4DM=
X-Google-Smtp-Source: APBJJlEYwdt7ptG4DpjqIKGbDBB/CDSsxnNVNiR04k8AvT9S0Nu2E9pqkAlD+7TtItabB+OOGt5qqg==
X-Received: by 2002:a5d:538f:0:b0:313:f1c8:a968 with SMTP id d15-20020a5d538f000000b00313f1c8a968mr17597880wrv.2.1689155998834;
        Wed, 12 Jul 2023 02:59:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d866:9edc:5a2d:f498])
        by smtp.gmail.com with ESMTPSA id m15-20020adfdc4f000000b003142ea7a661sm4623562wrj.21.2023.07.12.02.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 02:59:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: order includes alphabetically in gpiolib.h
Date:   Wed, 12 Jul 2023 11:59:55 +0200
Message-Id: <20230712095955.105716-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

After adding the missing notifier.h header, let's order all includes
alphabetically.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 1409d52487c0..7c562fbb9fb0 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -9,13 +9,13 @@
 #ifndef GPIOLIB_H
 #define GPIOLIB_H
 
-#include <linux/gpio/driver.h>
-#include <linux/gpio/consumer.h> /* for enum gpiod_flags */
-#include <linux/err.h>
+#include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h> /* for enum gpiod_flags */
+#include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
-#include <linux/cdev.h>
 #include <linux/rwsem.h>
 
 #define GPIOCHIP_NAME	"gpiochip"
-- 
2.39.2

