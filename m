Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3939C622495
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 08:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiKIHXJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 02:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiKIHXI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 02:23:08 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE96E1C106
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 23:23:07 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N6byn3FpxzHvdd;
        Wed,  9 Nov 2022 15:22:41 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 15:23:05 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <warthog618@gmail.com>, <linux-gpio@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH] gpiolib: fix memory leak in gpiochip_setup_dev
Date:   Wed, 9 Nov 2022 07:21:32 +0000
Message-ID: <20221109072132.117903-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Zeng Heng <zengheng4@huawei.com>

gcdev_register & gcdev_unregister call device_add & device_del to
request/release source. But in device_add, the dev->p allocated by
device_private_init is not released by device_del.

So when calling gcdev_unregister to release gdev, it needs put_device
to release dev in the following.

Otherwise, kmemleak would report memory leak such as below:

unreferenced object 0xffff88810b406400 (size 512):
  comm "python3", pid 1682, jiffies 4295346908 (age 24.090s)
  hex dump (first 32 bytes):
    00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
    ff ff ff ff ff ff ff ff a0 5e 23 90 ff ff ff ff  .........^#.....
  backtrace:
    [<00000000a58ee5fe>] kmalloc_trace+0x22/0x110
    [<0000000045fe2058>] device_add+0xb34/0x1130
    [<00000000d778b45f>] cdev_device_add+0x83/0xe0
    [<0000000089f948ed>] gpiolib_cdev_register+0x73/0xa0
    [<00000000a3a8a316>] gpiochip_setup_dev+0x1c/0x70
    [<00000000787227b4>] gpiochip_add_data_with_key+0x10f6/0x1bf0
    [<000000009ac5742c>] devm_gpiochip_add_data_with_key+0x2e/0x80
    [<00000000bf2b23d9>] xra1403_probe+0x192/0x1b0 [gpio_xra1403]
    [<000000005b5ef2d4>] spi_probe+0xe1/0x140
    [<000000002b26f6f1>] really_probe+0x17c/0x3f0
    [<00000000dd2dad9c>] __driver_probe_device+0xe3/0x170
    [<000000005ca60d2a>] device_driver_attach+0x34/0x80
    [<00000000e9db90db>] bind_store+0x10b/0x1a0
    [<00000000e2650f8a>] drv_attr_store+0x49/0x70
    [<0000000080a80b2b>] sysfs_kf_write+0x8c/0xb0
    [<00000000a28b45b9>] kernfs_fop_write_iter+0x216/0x2e0

unreferenced object 0xffff888100de9800 (size 512):
  comm "python3", pid 264, jiffies 4294737615 (age 33.514s)
  hex dump (first 32 bytes):
    00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
    ff ff ff ff ff ff ff ff a0 5e 63 a1 ff ff ff ff  .........^c.....
  backtrace:
    [<00000000bcc571d0>] kmalloc_trace+0x22/0x110
    [<00000000eeb06124>] device_add+0xb34/0x1130
    [<000000007e5cd2fd>] cdev_device_add+0x83/0xe0
    [<000000008f6bcd3a>] gpiolib_cdev_register+0x73/0xa0
    [<0000000012c93b24>] gpiochip_setup_dev+0x1c/0x70
    [<00000000a24b646a>] gpiochip_add_data_with_key+0x10f6/0x1bf0
    [<000000000c225212>] tpic2810_probe+0x16e/0x196 [gpio_tpic2810]
    [<00000000b52d04ff>] i2c_device_probe+0x651/0x680
    [<0000000058d3ff6b>] really_probe+0x17c/0x3f0
    [<00000000586f43d3>] __driver_probe_device+0xe3/0x170
    [<000000003f428602>] device_driver_attach+0x34/0x80
    [<0000000040e91a1b>] bind_store+0x10b/0x1a0
    [<00000000c1d990b9>] drv_attr_store+0x49/0x70
    [<00000000a23bfc22>] sysfs_kf_write+0x8c/0xb0
    [<00000000064e6572>] kernfs_fop_write_iter+0x216/0x2e0
    [<00000000026ce093>] vfs_write+0x658/0x810

Because at the point of gpiochip_setup_dev here, where dev.release
does not set yet, calling put_device would cause the warning of
no release function and double-free in the following fault handler
route (when kfree dev_name). So directly calling kfree to release
dev->p here in case of memory leak.

Fixes: 1f5eb8b17f02 ("gpiolib: fix sysfs when cdev is not selected")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4756ea08894f..fa659af86d07 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -539,6 +539,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 
 err_remove_device:
 	gcdev_unregister(gdev);
+	kfree(gdev->dev.p);
 	return ret;
 }
 
-- 
2.17.1

