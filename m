Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D56577FE24
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 20:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354556AbjHQSuf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Aug 2023 14:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354561AbjHQSuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 14:50:11 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73631E48
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 11:50:10 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31ade53706fso149976f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 11:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692298209; x=1692903009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riK4Feuyj+OGhp7MokzsSI/2yP1pTtbOuk4mfbbtbPw=;
        b=GYmAo95/yqQGLVSyVjKRwIFLiHGmN/HvQaopOx3Zyen0W1qjJicWjcjwPtC6SRsdA9
         9imZtBAZ2y2CiD96YEsDa07jw/c8hcQ1lwcsYvis/iT6ik/maqHhmR1fB6Ht5S/eXqoS
         BhKmSDnVCYw8My56A5GJKP5Ju9N0C45JuUMUiQha3dbR6DYgO3OowhiDj4qYvQelmdtI
         mg6WardO138zRvWcN6mAV9HFuFrWl36hVk8ERqXDwPRhhdvDoYLNKz36Lx24XyaFxZQR
         7DNOsAjFbxZcIwawaaawn676J/wWZugMrH/PfcuxFEI6YYuEKmX+oYMBF2nmFgo/sEAw
         kW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298209; x=1692903009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riK4Feuyj+OGhp7MokzsSI/2yP1pTtbOuk4mfbbtbPw=;
        b=Y3MEUKUopqtQLV8eiAUAa+1Yul5tgdr2G6NpBl1zzDiUXoy2Pqna1eV98CRCa4KHC9
         kimRgtNqneplZf2xDTPLygkeE+xiQFwO3big66N/ulk3doHEhbU01MX6kKrA/BOGrPTn
         bYo/ZTRbYDPgaUTLVBJ+RHaPNfGZvediXpoShytb0DOhXF5Ku3n5EYelzlH0SHSUMcDZ
         eDxh90UWy79JcHS+W1hXHd5pMRPpcmfA9kaG6XhGPHglVBZshjI7rrHL9ZkRJS9+0Muc
         IUmdMM+cIYnoyhScFmwgIaqncbm+AbN8dDQggjxDLbYee1Mu3z1zqrNeC6hEj5rl2M5M
         28gA==
X-Gm-Message-State: AOJu0YzP7FXLEtVcs8HQp+aJXRJRZY/PEVuv483wcX9XNggC3OjZS4dY
        pfrTI/3e2YsT+SQBLf7O0isKnQ1TdPZ4Za+GjC3Opg==
X-Google-Smtp-Source: AGHT+IGE+FFRY9TRM7DM9qhp9z3k+C9jq9pUq2xe0IvfLZkq+YM8DF0s93s6bX8yLNEyt103aRFndQ==
X-Received: by 2002:a05:6000:d:b0:31a:d8c0:cb8b with SMTP id h13-20020a056000000d00b0031ad8c0cb8bmr283557wrx.25.1692298208887;
        Thu, 17 Aug 2023 11:50:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2f99:c690:b4da:e3d2])
        by smtp.gmail.com with ESMTPSA id a23-20020a05600c225700b003fe1cdbc33dsm3963020wmm.9.2023.08.17.11.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 11:50:08 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 2/6] gpio: cdev: open-code to_gpio_chardev_data()
Date:   Thu, 17 Aug 2023 20:49:54 +0200
Message-Id: <20230817184958.25349-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817184958.25349-1-brgl@bgdev.pl>
References: <20230817184958.25349-1-brgl@bgdev.pl>
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

This function is a wrapper around container_of(). It's used only once and
we will have a second notifier soon, so instead of having two flavors of
this helper, let's just open-code where needed.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 9ee8604f32e1..df30d17f9e29 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2491,16 +2491,12 @@ static long gpio_ioctl_compat(struct file *file, unsigned int cmd,
 }
 #endif
 
-static struct gpio_chardev_data *
-to_gpio_chardev_data(struct notifier_block *nb)
-{
-	return container_of(nb, struct gpio_chardev_data, lineinfo_changed_nb);
-}
-
 static int lineinfo_changed_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
-	struct gpio_chardev_data *cdev = to_gpio_chardev_data(nb);
+	struct gpio_chardev_data *cdev = container_of(nb,
+						      struct gpio_chardev_data,
+						      lineinfo_changed_nb);
 	struct gpio_v2_line_info_changed chg;
 	struct gpio_desc *desc = data;
 	int ret;
-- 
2.39.2

