Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEE6462D5D0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 10:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239515AbiKQJFV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 04:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239476AbiKQJFH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 04:05:07 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3BF5A6E9
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:05:05 -0800 (PST)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NCYrc5bJ6zHw1d;
        Thu, 17 Nov 2022 17:04:32 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemi500024.china.huawei.com
 (7.221.188.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 17 Nov
 2022 17:05:03 +0800
From:   Zeng Heng <zengheng4@huawei.com>
To:     <brgl@bgdev.pl>, <linux@roeck-us.net>, <linus.walleij@linaro.org>,
        <warthog618@gmail.com>, <andriy.shevchenko@intel.com>
CC:     <linux-gpio@vger.kernel.org>, <zengheng4@huawei.com>,
        <liwei391@huawei.com>
Subject: [PATCH v3] gpiolib: fix memory leak in gpiochip_setup_dev()
Date:   Thu, 17 Nov 2022 17:02:47 +0800
Message-ID: <20221117090247.122980-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f118d0b1-1bf2-b710-c3b4-2745c72f02b3@huawei.com>
References: <f118d0b1-1bf2-b710-c3b4-2745c72f02b3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500024.china.huawei.com (7.221.188.100)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Here is a report about memory leak detected in gpiochip_setup_dev():

unreferenced object 0xffff88810b406400 (size 512):
  comm "python3", pid 1682, jiffies 4295346908 (age 24.090s)
  backtrace:
    kmalloc_trace
    device_add 		device_private_init at drivers/base/core.c:3361
			(inlined by) device_add at drivers/base/core.c:3411
    cdev_device_add
    gpiolib_cdev_register
    gpiochip_setup_dev
    gpiochip_add_data_with_key

gcdev_register() & gcdev_unregister() would call device_add() &
device_del() (no matter CONFIG_GPIO_CDEV is enabled or not) to
register/unregister device.

However, if device_add() succeeds, some resource (like
struct device_private allocated by device_private_init())
is not released by device_del().

Therefore, after device_add() succeeds by gcdev_register(), it
needs to call put_device() to release resource in the error handle
path.

Here we move forward the register of release function, and let it
release every piece of resource by put_device() instead of kfree().

Fixes: 159f3cd92f17 ("gpiolib: Defer gpio device setup until after gpiolib initialization")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/gpio/gpiolib.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4756ea08894f..bb4dedc154b7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -526,12 +526,13 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	if (ret)
 		return ret;
 
+	/* From this point, the .release() function cleans up gpio_device */
+	gdev->dev.release = gpiodevice_release;
+
 	ret = gpiochip_sysfs_register(gdev);
 	if (ret)
 		goto err_remove_device;
 
-	/* From this point, the .release() function cleans up gpio_device */
-	gdev->dev.release = gpiodevice_release;
 	dev_dbg(&gdev->dev, "registered GPIOs %d to %d on %s\n", gdev->base,
 		gdev->base + gdev->ngpio - 1, gdev->chip->label ? : "generic");
 
@@ -816,6 +817,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 err_free_gpiochip_mask:
 	gpiochip_remove_pin_ranges(gc);
 	gpiochip_free_valid_mask(gc);
+	/*
+	 * If gdev->dev.release has been registered by
+	 * gpiochip_setup_dev(), print err msg and
+	 * call put_device() to release all.
+	 */
+	if (gdev->dev.release)
+		goto err_free_gdev;
 err_remove_from_list:
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_del(&gdev->list);
@@ -835,7 +843,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		       gdev->base, gdev->base + gdev->ngpio - 1,
 		       gc->label ? : "generic", ret);
 	}
-	kfree(gdev);
+	if (gdev->dev.release)
+		put_device(&gdev->dev);
+	else
+		kfree(gdev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiochip_add_data_with_key);
-- 
2.25.1

