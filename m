Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B98BD7B06D1
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 16:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbjI0O3x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 10:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232169AbjI0O3s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 10:29:48 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93101B4
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 07:29:46 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-405621baba7so83776965e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 07:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695824985; x=1696429785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZXaGIIfZuiGEdZwV32Js1I7wu0xbFZLpMopu8S/63c=;
        b=LRr+WyT+pJrvtzeFl3/fK+ENRQ+D1e0hsD+RYczEWKCCDSfkFSRWt4FSYjeXCZD9Kp
         GyWvm2X6/1LKNL6TZAYKYS6ht5cszmolglAiC/8c4D6CgAjxPZUVvb4Ro7F7jIN+mJr9
         9QUrTlbND7s6NJlmOzLc404VWq8LDsLHYi2qsK1qIuybIH8JoBqrVW+voJmD1lTJVYQw
         pYeAx+hjxY8RSBKSOlL3x3lB8jAFSTB8w9OO3qTLr40WSgcZXQ8aNLNlpHYX33BtsNo2
         W12MVKhQ/RaB15Oij4eRJm/nbjabyZ3ifwQTuom524ifc/F+xiRgd124dftTVaLC2Uz1
         0nDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695824985; x=1696429785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZXaGIIfZuiGEdZwV32Js1I7wu0xbFZLpMopu8S/63c=;
        b=E/iTJKgH13WdAPxtbQyqSEiRRYg2RXZidQ5iCcCyaBkwO5Zqlv6c2ecmFoFk9bn+B8
         ZZFsCPvsQw61vI046IMJv7oKWpz0g6D+IkPvtUvwXfzV1nXEtOva9YAWwfbamPzVAwzf
         3rPG48JQ+mOtUKQDiEPEoRnSJSQOY1ItA//mBTQowgjzRMlhdiULeDpAu/eJyJRQwXgd
         Ej2s+LP4GeQi3gkneZe2xAywauN8mXOh91ojc/GKwE2Bem3lU2H5vjE3XMt+Irh7iSw4
         5LG0odWt6CKrROK8y9kOyiruC+EWqsS6Cet9cQ0VKTZIkUPcKx60WFS1RZe8oI0O1A7+
         fvuw==
X-Gm-Message-State: AOJu0YxZbqDMFVkRBxMPmbOO+EdBej/A4UqoAPJ2SSSAQEcXy4CTkWdt
        S2VIL2O+ccBIN3QAvxqmklT67w==
X-Google-Smtp-Source: AGHT+IEXsLCf66wrsjqsyNP3LGPoGey7JEWXQQyftq4Pcl8llIG+MXA78yj2kb3tXjDQEhKuOHbqGg==
X-Received: by 2002:a7b:c3d1:0:b0:405:3d27:70e8 with SMTP id t17-20020a7bc3d1000000b004053d2770e8mr2265430wmj.36.1695824985281;
        Wed, 27 Sep 2023 07:29:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4bb6:1525:9e22:4a15])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b003feae747ff2sm20448303wmh.35.2023.09.27.07.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 07:29:44 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 11/11] gpio: sysfs: drop the mention of gpiochip_find() from sysfs code
Date:   Wed, 27 Sep 2023 16:29:31 +0200
Message-Id: <20230927142931.19798-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927142931.19798-1-brgl@bgdev.pl>
References: <20230927142931.19798-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have removed all callers of gpiochip_find() so don't mention it in
gpiolib-sysfs.c.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 50503a4525eb..6f309a3b2d9a 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -814,7 +814,7 @@ static int __init gpiolib_sysfs_init(void)
 		 * gpiochip_sysfs_register() acquires a mutex. This is unsafe
 		 * and needs to be fixed.
 		 *
-		 * Also it would be nice to use gpiochip_find() here so we
+		 * Also it would be nice to use gpio_device_find() here so we
 		 * can keep gpio_chips local to gpiolib.c, but the yield of
 		 * gpio_lock prevents us from doing this.
 		 */
-- 
2.39.2

