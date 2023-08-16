Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95EC77E15D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Aug 2023 14:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245080AbjHPMVC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Aug 2023 08:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245077AbjHPMUk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2023 08:20:40 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BACB26A9
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 05:20:39 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe45481edfso65447095e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692188438; x=1692793238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Trnt4Pw2hw6B7q451s8X3BgS42qMamduwaoaH3QQYrE=;
        b=ulS9QVaSFuNvBOqE7Xubi/r/LMXRdE02Lqy2ZbQH4oDNKyILIHn2fhDWOi+gqi7r+U
         W0JdLscK/cnETb9nWSYYYeVGioW8YfPlgdOu7B0WfeNUdXqU5tSHp8KSXawPPEY1ycNj
         P8Oqk4hvRGwxcrTWI3b1pY0Vnb6BcBUgrE7pD6XLOc/ZnHLrs3lcNwc+fGDBMSjnxoyv
         30Ju+pEKnaUGarxLYPNjcxWkxK+DHq6yiQBYAu0Ui2evDDTMia2W8XcJ458mW/Kzya+w
         E6U4f8oQaYTAuors24+dgK4BP7s0HxJ64RCatn3qFS6nnQFfNaa9XuAR5Nu16ri2C0Za
         Reyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692188438; x=1692793238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Trnt4Pw2hw6B7q451s8X3BgS42qMamduwaoaH3QQYrE=;
        b=P2Z4TIpmv1oGnPgsutKNE64O85/iQY061toJpomdb4WEYA/2mXkCuCBzp+zqs5wpNF
         Cup4gXFS9P/qUlmjaM02fXw14HUsShg4tQ3MHoWyxCYNqSvXGmDbiXatoyOnERcW1Y+J
         W18T3parQPJaoVmTFTKl8ttUYXzQirrEWWSVrMYiFAlvkdwMZjyB7qb/MTkFJQAVGPrB
         NyMiSzVXslCM4k/fKXKmPdJYa/0HMWJtFVardsJk01Z3k8SKamVAXAZvbJ61cvaEXIt6
         yTaqg5BlTzuG22cqew2qeMAjtherTWZeAch70bbJQD3oNwGZEEB0afEctvEX4Ue2w231
         J+Zg==
X-Gm-Message-State: AOJu0YyBJLQVnRS9tI7OH9gqJXuiUrm46qORKYhVmw8wzkstZqH5bXjW
        vA8gWj48WDRqWxkkk2zpL+OIWA==
X-Google-Smtp-Source: AGHT+IF5bC76eebhPqmm3ah8vcookk4hc3A2nk+zD/7O6fCoclca0m3Og5OKvb7VpbIFS/iJnd+wtw==
X-Received: by 2002:a7b:c044:0:b0:3fe:2b76:3d7 with SMTP id u4-20020a7bc044000000b003fe2b7603d7mr1266689wmc.10.1692188437483;
        Wed, 16 Aug 2023 05:20:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:55ba:c083:817:86f])
        by smtp.gmail.com with ESMTPSA id e6-20020adffd06000000b003196b1bb528sm14566112wrr.64.2023.08.16.05.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 05:20:37 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/5] gpio: cdev: rename the notifier block and notify callback
Date:   Wed, 16 Aug 2023 14:20:29 +0200
Message-Id: <20230816122032.15548-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230816122032.15548-1-brgl@bgdev.pl>
References: <20230816122032.15548-1-brgl@bgdev.pl>
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

Rename the notifier block in struct gpio_chardev_data and its callback
to a more generic name as it will soon gain more functionality than only
handling line state changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 062521e1a9e0..660d2e057451 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2319,7 +2319,7 @@ struct gpio_chardev_data {
 	struct gpio_device *gdev;
 	wait_queue_head_t wait;
 	DECLARE_KFIFO(events, struct gpio_v2_line_info_changed, 32);
-	struct notifier_block lineinfo_changed_nb;
+	struct notifier_block nb;
 	unsigned long *watched_lines;
 #ifdef CONFIG_GPIO_CDEV_V1
 	atomic_t watch_abi_version;
@@ -2494,11 +2494,11 @@ static long gpio_ioctl_compat(struct file *file, unsigned int cmd,
 static struct gpio_chardev_data *
 to_gpio_chardev_data(struct notifier_block *nb)
 {
-	return container_of(nb, struct gpio_chardev_data, lineinfo_changed_nb);
+	return container_of(nb, struct gpio_chardev_data, nb);
 }
 
-static int lineinfo_changed_notify(struct notifier_block *nb,
-				   unsigned long action, void *data)
+static int gpio_chardev_notify(struct notifier_block *nb, unsigned long action,
+			       void *data)
 {
 	struct gpio_chardev_data *cdev = to_gpio_chardev_data(nb);
 	struct gpio_v2_line_info_changed chg;
@@ -2681,9 +2681,8 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	INIT_KFIFO(cdev->events);
 	cdev->gdev = gpio_device_get(gdev);
 
-	cdev->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
-	ret = blocking_notifier_chain_register(&gdev->notifier,
-					       &cdev->lineinfo_changed_nb);
+	cdev->nb.notifier_call = gpio_chardev_notify;
+	ret = blocking_notifier_chain_register(&gdev->notifier, &cdev->nb);
 	if (ret)
 		goto out_free_bitmap;
 
@@ -2698,8 +2697,7 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	return ret;
 
 out_unregister_notifier:
-	blocking_notifier_chain_unregister(&gdev->notifier,
-					   &cdev->lineinfo_changed_nb);
+	blocking_notifier_chain_unregister(&gdev->notifier, &cdev->nb);
 out_free_bitmap:
 	gpio_device_put(gdev);
 	bitmap_free(cdev->watched_lines);
@@ -2722,8 +2720,7 @@ static int gpio_chrdev_release(struct inode *inode, struct file *file)
 	struct gpio_device *gdev = cdev->gdev;
 
 	bitmap_free(cdev->watched_lines);
-	blocking_notifier_chain_unregister(&gdev->notifier,
-					   &cdev->lineinfo_changed_nb);
+	blocking_notifier_chain_unregister(&gdev->notifier, &cdev->nb);
 	gpio_device_put(gdev);
 	kfree(cdev);
 
-- 
2.39.2

