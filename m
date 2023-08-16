Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F7C77E157
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Aug 2023 14:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236656AbjHPMVC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Aug 2023 08:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245080AbjHPMUl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2023 08:20:41 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA21626AD
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 05:20:39 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fe2d218eedso60889985e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692188438; x=1692793238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc+T77NE6nVI9PLsQkqlrr/xBBkFkUhqwF3/jEMdIPg=;
        b=Y/ihd289nZXKIxyoTl17TgP7aQSTwe8RkeUix/vGZxejIeeD90O9aXAMaaLoZqpaac
         HcZ3xiPoE4uRN+essCNgN7+tZIC4MiyUOtgfNI97sNNRZfgXpT5njdMiVV0TGx1WstN1
         8AKMqMaxGU9X1Yq6k6O9ZJ8qCTJZ3o10pQJreea0WqsGGa961/VRl+sBoliccF5IYjeW
         7HV4F1MuA93c7rN4giB5MK3p7phz/qWBDDwbjIw5SpjHXyLcILimvFY2GDaeLWExD9KH
         /zH56Ir3WIiJCNzq+y1XfixOQWbt3WuyPadBKM8djazEi/FhNDxOa2X0dC1JTuIPBTLo
         Nv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692188438; x=1692793238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yc+T77NE6nVI9PLsQkqlrr/xBBkFkUhqwF3/jEMdIPg=;
        b=b0K2jmYWgQSeSgJyXRsVEdKcB2EVEBFA5qjBTtirI0whXV7nRC6whH92GcK1rLIezG
         GYcjYV3kPNABNH/AFyn6GBsckHOcv7BWcRTjYWxcX0q8aYcqRSQyl4tTY068qUTwPimd
         /yPtKhzQddGTxJ5h/voURQLi77MF9znxwkLDa6HFqMsI6xQZRV724t4lRhrp4KRRe1M9
         /wT1f81eVTEKoD/Bkm0AJ4jAGTDgPYA831gMdIabQVBaOj4BYOAdYbv27GIMOafnzSid
         gLTOv7yc0EoyM0lgKqzMQQkKcy2T1wVtE66hR0nZENC9gYABiIpj73buf4nQ9F4YzCm2
         HA8g==
X-Gm-Message-State: AOJu0YwR/sd9UTMdmVwSidG7T1DqRITRnPdsQqu0JvffRP0Dt4FCG3e6
        A64zhmULfCfEgT/MumWcQlaE1dKmgU1jqx/NgDouCQ==
X-Google-Smtp-Source: AGHT+IFEJKQoq2tV1RnY7W0jsL0DzfdsoPDjKqgbbV9zKHFRDerYe1M182sG4pkSRUTPPLCYg90rtw==
X-Received: by 2002:a05:600c:1c17:b0:3fe:485f:ed1b with SMTP id j23-20020a05600c1c1700b003fe485fed1bmr1241928wms.28.1692188438347;
        Wed, 16 Aug 2023 05:20:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:55ba:c083:817:86f])
        by smtp.gmail.com with ESMTPSA id e6-20020adffd06000000b003196b1bb528sm14566112wrr.64.2023.08.16.05.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 05:20:37 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/5] gpio: cdev: wake up chardev poll() on device unbind
Date:   Wed, 16 Aug 2023 14:20:30 +0200
Message-Id: <20230816122032.15548-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230816122032.15548-1-brgl@bgdev.pl>
References: <20230816122032.15548-1-brgl@bgdev.pl>
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

Emit a new notifier event right after the character device was
unregistered and receive it in the notifier owned by the descriptor
associated with the character device file. Upon reception, wake up the
wait queue so that the user-space be forced out of poll() and need to
go into a new system call which will then fail due to the chip being
gone.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 660d2e057451..eb8c0cb71da4 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -32,6 +32,12 @@
 #include "gpiolib.h"
 #include "gpiolib-cdev.h"
 
+/*
+ * Let's use a higher value for gpio_device notifications to not conflict with
+ * UAPI defines that can also serve as notifier action arguments.
+ */
+#define GPIO_CDEV_UNREGISTERED	1000
+
 /*
  * Array sizes must ensure 64-bit alignment and not create holes in the
  * struct packing.
@@ -2526,6 +2532,9 @@ static int gpio_chardev_notify(struct notifier_block *nb, unsigned long action,
 		else
 			pr_debug_ratelimited("lineinfo event FIFO is full - event dropped\n");
 		break;
+	case GPIO_CDEV_UNREGISTERED:
+		wake_up_poll(&cdev->wait, EPOLLIN | EPOLLERR);
+		break;
 	default:
 		return NOTIFY_DONE;
 	}
@@ -2761,4 +2770,6 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 void gpiolib_cdev_unregister(struct gpio_device *gdev)
 {
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
+	blocking_notifier_call_chain(&gdev->notifier,
+				     GPIO_CDEV_UNREGISTERED, NULL);
 }
-- 
2.39.2

