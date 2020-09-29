Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4536E27C1EB
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 12:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgI2KKW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 06:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728033AbgI2KKW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 06:10:22 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A3CC0613D5
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:21 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q9so4033259wmj.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9OHLxj5LKThNKX3AdZ96/ghdViR26xgQsL7zhp/+aDs=;
        b=BZuGgwadXaSNJ0fa1uippIDzhqOLjbeb9FgyTrtyrgpBQjSH45CLsUmQouRsfS97a0
         5bOk3SkHJBBxbdRxKsH5VwRmrvK1gP/g2Zg2zTGEMiOpfJtRJQwgy8Xg/BPJ7VciAcDG
         l7nAKNICuVtEGlU15pZH7CyWvleAYYKrDrPIn5woRBIbO2ZVmZDZhGZ5eeSqhP4SNpO+
         rmHqBXFa2EEMJvqoD/LQnN1IW8AjGm5zsyuDhymkvqBCllnMldcwLw8mfP3qGJXVgqkr
         rsP4lzq89+H6lSqqKe4sZy6XAhjdpqov8JthxwaNlYnFdTVcJIy9KXQR8/M02cwZnBiz
         tp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9OHLxj5LKThNKX3AdZ96/ghdViR26xgQsL7zhp/+aDs=;
        b=Ux0zlOLJkQBmcIVUt9cKwONkq6mZc5tt8p50+5RHV+gp8otg6+6r7AcQTot4kfCrC/
         1f2GsEfx8ArRR0vib3N6QPNQ+yuC0r88uIMcR2qJX3UbGLRL43ATgIF23ZU0g/8DSss9
         S4014pY/oLtKDYG0s/aWMn8NpzSUXL+MfHuWIXBJg+OlMO7wFXpRnbrE95gMc81N/ypY
         t6ff9ZGerD5w6RL49RrmdwBc6FqRgABORD1z7Kiq4WSr+V5FRLX4Y5mvKX+hViw0tQh+
         OzLb3pjIBXoZZ7TZZ/yevIT7Sj977dhzIw6trWP2Szy/AzRPddBW+4rgyW66vNS7gb5B
         Wyeg==
X-Gm-Message-State: AOAM531BK+y3oHyzGrDvTBwj8t1gxiFJ5bJnc0bWdpfFWsz2j3/rJGxm
        CvFpRlCum81pukk3Jx+pTLuK3Ot+L+Ef8w==
X-Google-Smtp-Source: ABdhPJymFLPEX90CJCwGTe7wRhVPkhnu0ySlwgt8SOAnmBrD5LtGzssgnERRKB+sdkC671d85cGhYQ==
X-Received: by 2002:a1c:b388:: with SMTP id c130mr3679478wmf.175.1601374220344;
        Tue, 29 Sep 2020 03:10:20 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:19 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 05/10] gpio: mockup: use pr_fmt()
Date:   Tue, 29 Sep 2020 12:09:59 +0200
Message-Id: <20200929101004.20288-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We don't need a custom logging helper. Let's use the standard pr_fmt()
macro which allows us to use all pr_*() routines with custom format.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 90a1d6c2775f..c2b2f7d5ff34 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -7,6 +7,8 @@
  * Copyright (C) 2017 Bartosz Golaszewski <brgl@bgdev.pl>
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/debugfs.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
@@ -30,8 +32,6 @@
 /* Maximum of three properties + the sentinel. */
 #define GPIO_MOCKUP_MAX_PROP	4
 
-#define gpio_mockup_err(...)	pr_err(KBUILD_MODNAME ": " __VA_ARGS__)
-
 /*
  * struct gpio_pin_status - structure describing a GPIO status
  * @dir:       Configures direction of gpio as "in" or "out"
@@ -548,7 +548,7 @@ static int __init gpio_mockup_init(void)
 
 	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
-		gpio_mockup_err("error registering platform driver\n");
+		pr_err("error registering platform driver\n");
 		debugfs_remove_recursive(gpio_mockup_dbg_dir);
 		return err;
 	}
@@ -577,7 +577,7 @@ static int __init gpio_mockup_init(void)
 
 		pdev = platform_device_register_full(&pdevinfo);
 		if (IS_ERR(pdev)) {
-			gpio_mockup_err("error registering device");
+			pr_err("error registering device");
 			platform_driver_unregister(&gpio_mockup_driver);
 			gpio_mockup_unregister_pdevs();
 			debugfs_remove_recursive(gpio_mockup_dbg_dir);
-- 
2.26.1

