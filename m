Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B314F36961D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 17:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237271AbhDWPYX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 11:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235158AbhDWPYX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 11:24:23 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2A4C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 23 Apr 2021 08:23:45 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id d200-20020a1c1dd10000b02901384767d4a5so1438383wmd.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Apr 2021 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=inuo1yIb/DFtinAZ7Dqrti3ulLULp+OYHGviZH3EqfI=;
        b=UrEGHCuYtw6wrxcuxLLM8TnuWTvBvc7vIlFV3tasGGcOHHouYlj959hGNsF8hu4gU3
         VsGGo8W7GMBYZClqWTCQZBdAJpwY2256GJvHEvf4cG4seo3GEFpvpwPec32/TWM1hEZi
         dRqPd6gxIn1NxXi11eSu/F3ejE1rgqhkEyC5TL1MwLTFJgFBeKP+fJmmlvoVuA4WCSsY
         j0tnBwvM8kFLrYKnFTsB3SV4dT5lkFu4YRwsY1vXdJh4AkrrfZhNITZuk4NCy3kbCU69
         Y11Pzb+l6cQgtNZcv5eHXbmDvIgGwMjbb9H84+aA+CS49m1Ayj0xOaX60tFwURDcwESQ
         xzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=inuo1yIb/DFtinAZ7Dqrti3ulLULp+OYHGviZH3EqfI=;
        b=MklBLq2x7mZcRgk/xJehV3PNw/ExYIXGSQYYS9ZZgVWnaaBbM9b/eoqbhg2H2RCi20
         G1J71vCfU9mc3vEkANVT6tffLFOVJFNSQYY1ebC27yY+1RJe0RZ0+w/homRYH8S9H0Cb
         yhZiTuGwUatrlEwqggQUS041WOfrUC5gUEZa1tpN4U+nY8HRgWv6Wd+sxk5i3g71k6bo
         iYRXhls9Ku9WFoqAmgXRcOR5lP01N+MGprq0fZ/6+OvHLuAMjEkzEyPEQ0fR169YHENV
         wixCM5/jii19vDIgFwfOsxsbFMFmfUapXIj8iDvkvEcEIzFt+SyKs2EVdD7LcwdSfXB1
         XX7Q==
X-Gm-Message-State: AOAM5332emqVmnkQdcg5y3nDPGT1bXMDGMs4MOOINWqDy2EBSkchtjLO
        WsHd3rYUm5mAA/Cf4J8VWbls4g==
X-Google-Smtp-Source: ABdhPJyPL0ZKpmghS/vmqUmAFIeMxQ1EwKNq0MWYi0HnzPLoT+AFNlsePD89o/3gGbAgcMoleUP9rg==
X-Received: by 2002:a1c:9d94:: with SMTP id g142mr4982269wme.154.1619191424357;
        Fri, 23 Apr 2021 08:23:44 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id z17sm9639819wro.1.2021.04.23.08.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 08:23:44 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: sim: allocate IDA numbers earlier
Date:   Fri, 23 Apr 2021 17:23:33 +0200
Message-Id: <20210423152333.6299-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Instead of allocating the device ID number for gpio-sim platform devices
when the associated configfs item is committed, do it already when the
item is created. This way we can display the device name even when the
chip is still pending. Once it's committed the user can easily identify
the chip by its real device name. This will allow launching concurrent
user-space test suites with gpio-sim.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
Hi all! This is a late one for which I'm sorry but I realized that this
change will allow us to launch test-suites concurrently if we allow the
user-space to read the device name before the device is created and then
wait for this specific name to appear in a udev add event.

 drivers/gpio/gpio-sim.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 92493b98c51b..2e2e6399e453 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -409,6 +409,7 @@ struct gpio_sim_chip_config {
 	 * item is 'live'.
 	 */
 	struct platform_device *pdev;
+	int id;
 
 	/*
 	 * Each configfs filesystem operation is protected with the subsystem
@@ -442,7 +443,7 @@ static ssize_t gpio_sim_config_dev_name_show(struct config_item *item,
 	if (pdev)
 		ret = sprintf(page, "%s\n", dev_name(&pdev->dev));
 	else
-		ret = sprintf(page, "none\n");
+		ret = sprintf(page, "gpio-sim.%d\n", config->id);
 	mutex_unlock(&config->lock);
 
 	return ret;
@@ -724,6 +725,7 @@ static void gpio_sim_chip_config_release(struct config_item *item)
 	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
 
 	mutex_destroy(&config->lock);
+	ida_free(&gpio_sim_ida, config->id);
 	kfree_strarray(config->line_names, config->num_line_names);
 	kfree(config);
 }
@@ -747,6 +749,12 @@ gpio_sim_config_make_item(struct config_group *group, const char *name)
 	if (!config)
 		return ERR_PTR(-ENOMEM);
 
+	config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
+	if (config->id < 0) {
+		kfree(config);
+		return ERR_PTR(config->id);
+	}
+
 	config_item_init_type_name(&config->item, name,
 				   &gpio_sim_chip_config_type);
 	config->num_lines = 1;
@@ -781,18 +789,12 @@ static int gpio_sim_config_commit_item(struct config_item *item)
 						config->line_names,
 						config->num_line_names);
 
-	pdevinfo.id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
-	if (pdevinfo.id < 0) {
-		mutex_unlock(&config->lock);
-		return pdevinfo.id;
-	}
-
 	pdevinfo.name = "gpio-sim";
 	pdevinfo.properties = properties;
+	pdevinfo.id = config->id;
 
 	pdev = platform_device_register_full(&pdevinfo);
 	if (IS_ERR(pdev)) {
-		ida_free(&gpio_sim_ida, pdevinfo.id);
 		mutex_unlock(&config->lock);
 		return PTR_ERR(pdev);
 	}
@@ -806,15 +808,12 @@ static int gpio_sim_config_commit_item(struct config_item *item)
 static int gpio_sim_config_uncommit_item(struct config_item *item)
 {
 	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
-	int id;
 
 	mutex_lock(&config->lock);
-	id = config->pdev->id;
 	platform_device_unregister(config->pdev);
 	config->pdev = NULL;
 	mutex_unlock(&config->lock);
 
-	ida_free(&gpio_sim_ida, id);
 	return 0;
 }
 
-- 
2.30.1

