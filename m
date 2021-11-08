Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F38449E66
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 22:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbhKHVpF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 16:45:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237865AbhKHVpE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 16:45:04 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5592AC061570;
        Mon,  8 Nov 2021 13:42:19 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: shreeya)
        with ESMTPSA id 9809C1F4475A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636407738; bh=B0kBXfNigvJ5Fezn25MOVCtULNRiaGhTfEF1sbcG2UA=;
        h=From:To:Cc:Subject:Date:From;
        b=oECrmZzuxZlU1rbTIWyXY5VPbuJUyLJC4kJcGq/U4PxJjzhhiWlYXLzbZcq4c2cyg
         E359zxuGGRzi4IKwE3Kmpyw7cCt63lnNOtkrZFs9yvS4/AoqjCxObGEhPSt/lnMYKg
         zZ4COLBECZKQP19QhNpL8cFPEGiFQuU4yyexsAMFQ/1jMkcQps0s65S3Z52QEk3G2M
         5ObuCtM6LmLL2GPvSX48J09Lwgmg7FY79nBlPwXnvFODqZLzq8eeub6gFSf1UAQLR5
         R1//TL+L+QHkVdECSRu4avCV+SqaxddD7aqaitsxYNy4p6Tnrsqy3OvP4fxr28hodL
         K+L3ytOOyve4A==
From:   Shreeya Patel <shreeya.patel@collabora.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, krisman@collabora.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Shreeya Patel <shreeya.patel@collabora.com>
Subject: [PATCH] gpio: Initialize gc->irq.domain before setting gc->to_irq
Date:   Tue,  9 Nov 2021 03:11:48 +0530
Message-Id: <20211108214148.9724-1-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is a race in registering of gc->irq.domain when
probing the I2C driver.
This sometimes leads to a Kernel NULL pointer dereference
in gpiochip_to_irq function which uses the domain variable.

To avoid this issue, set gc->to_irq after domain is
initialized. This will make sure whenever gpiochip_to_irq
is called, it has domain already initialized.


Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---

Following is the NULL pointer dereference Oops for reference :-

kernel: Call Trace:
kernel:  gpiod_to_irq+0x53/0x70
kernel:  acpi_dev_gpio_irq_get_by+0x113/0x1f0
kernel:  i2c_acpi_get_irq+0xc0/0xd0
kernel:  i2c_device_probe+0x28a/0x2a0
kernel:  really_probe+0xf2/0x460
kernel:  driver_probe_device+0xe8/0x160
kernel:  ? driver_allows_async_probing+0x50/0x50
kernel:  bus_for_each_drv+0x8f/0xd0
kernel:  __device_attach_async_helper+0x9f/0xf0
kernel:  async_run_entry_fn+0x2e/0x110
kernel:  process_one_work+0x214/0x3e0
kernel:  worker_thread+0x4d/0x3d0
kernel:  ? process_one_work+0x3e0/0x3e0
kernel:  kthread+0x133/0x150
kernel:  ? kthread_associate_blkcg+0xc0/0xc0
kernel:  ret_from_fork+0x22/0x30
kernel: CR2: 0000000000000028
kernel: ---[ end trace d0f5a7a0e0eb268f ]---
kernel: RIP: 0010:gpiochip_to_irq+0x47/0xc0

 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index abfbf546d159..9a6f7c265a91 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1512,7 +1512,6 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
 	if (gc->to_irq)
 		chip_warn(gc, "to_irq is redefined in %s and you shouldn't rely on it\n", __func__);
 
-	gc->to_irq = gpiochip_to_irq;
 	gc->irq.default_type = type;
 	gc->irq.lock_key = lock_key;
 	gc->irq.request_key = request_key;
@@ -1533,6 +1532,8 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
 			return -EINVAL;
 	}
 
+	gc->to_irq = gpiochip_to_irq;
+
 	if (gc->irq.parent_handler) {
 		for (i = 0; i < gc->irq.num_parents; i++) {
 			void *data;
-- 
2.30.2

