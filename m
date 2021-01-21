Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60372FF818
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 23:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbhAUWjT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 17:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbhAUWik (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 17:38:40 -0500
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459E8C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 14:38:00 -0800 (PST)
Received: by mail-pf1-x44a.google.com with SMTP id y187so2097803pfc.7
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 14:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=MopP3ly3bA3eMHB1Y9//RmGNL7s+QTEOsJtmIObREmY=;
        b=MEtgBsAiJAWzjTXNj0Kyb544HT8CFWU9eqOGurRGiEnWlDib4RRvUzwNUpT5xyJMZG
         /C04/VuRPk7kbkXh2lGXpvGLu/jHTg3lp21DW0FXtQof0mygH0q+0bFYVt8In5Yn0t2X
         eyPOntSR6JJqdRdUH+QTA05LDLmd+9I0o3gouyn0HIlzsH0YKNSj1NkMmX44/e4x7unI
         Mvnm0uH6I7uKXJVbCmO/gp2gTxCUjtXZQEY/mVwDKYsVuQ4b5TiTa6aF3DAs/Y9EB0YD
         rd91Oi0WLzVFvxOI/ejfqIQSh5iuwyNtBUK/lqJNXvGb7tZNVn6KlwGnXPb6j2r7gve+
         6HpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=MopP3ly3bA3eMHB1Y9//RmGNL7s+QTEOsJtmIObREmY=;
        b=X9KxWTdTE+Qr3yBLabYAVVrQDCkIJqAyVStAzw/dgVM0iu1tC++0y6vxsOMg6NYDLM
         76DvkUCrahZsl4+jj8z0TwKhhuveN3L1VqqJdiCwGJi0BDJKvsj/KAINI15QTzOabIBl
         LsbokKL7o7DMFofFz4SSE7PKyY6DJPEDQbaFIZwyogePMzWd6e2sAuOXkpaHjBUcd9At
         rdcwvFYtTQvL+KXXQ7NWlr84FNj1FKWf/QmDgsJ1x3pnwaxYCcEUAf1nHVeHcFd/tMMD
         Ykn83yIq8Yoiv18JjzfqOUw1F1ddtkyYflWnrR1Q4vvnryur847Z9iYpKnZUrduG7WkT
         ugXA==
X-Gm-Message-State: AOAM530qPnPznYp+OMAH0idWf/t1CG7AnkKarpsTrYHb2+zhxM7MLgdQ
        QsQqf7u1NPSuxuCqLr8403Gbpjm5cVxtydY=
X-Google-Smtp-Source: ABdhPJz0NkBI32v4RrdI7Lh0LHnl+nzLY849ZAp3v7+PfBG67Wykw/8zcPqdJE2zPV8PIZ7jfC0kcjWcEJFCOko=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a63:720c:: with SMTP id
 n12mr1529729pgc.97.1611268679599; Thu, 21 Jan 2021 14:37:59 -0800 (PST)
Date:   Thu, 21 Jan 2021 14:37:56 -0800
Message-Id: <20210121223756.1112199-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v4] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
From:   Saravana Kannan <saravanak@google.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        kernel-team@android.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are multiple instances of GPIO device tree nodes of the form:

foo {
	compatible = "acme,foo";
	...

	gpio0: gpio0@xxxxxxxx {
		compatible = "acme,bar";
		...
		gpio-controller;
	};

	gpio1: gpio1@xxxxxxxx {
		compatible = "acme,bar";
		...
		gpio-controller;
	};

	...
}

bazz {
	my-gpios = <&gpio0 ...>;
}

Case 1: The driver for "foo" populates struct device for these gpio*
nodes and then probes them using a driver that binds with "acme,bar".
This driver for "acme,bar" then registers the gpio* nodes with gpiolib.
This lines up with how DT nodes with the "compatible" property are
typically converted to struct devices and then registered with driver
core to probe them. This also allows the gpio* devices to hook into all
the driver core capabilities like runtime PM, probe deferral,
suspend/resume ordering, device links, etc.

Case 2: The driver for "foo" doesn't populate struct devices for these
gpio* nodes before registering them with gpiolib. Instead it just loops
through its child nodes and directly registers the gpio* nodes with
gpiolib.

Drivers that follow case 2 cause problems with fw_devlink=on. This is
because fw_devlink will prevent bazz from probing until there's a struct
device that has gpio0 as its fwnode (because bazz lists gpio0 as a GPIO
supplier). Once the struct device is available, fw_devlink will create a
device link with gpio0 device as the supplier and bazz device as the
consumer. After this point, since the gpio0 device will never bind to a
driver, the device link will prevent bazz device from ever probing.

Finding and refactoring all the instances of drivers that follow case 2
will cause a lot of code churn and it is not something that can be done
in one shot. In some instances it might not even be possible to refactor
them cleanly. Examples of such instances are [1] [2].

This patch works around this problem and avoids all the code churn by
simply setting the fwnode of the gpio_device and creating a stub driver
to bind to the gpio_device. This allows all the consumers to continue
probing when the driver follows case 2.

[1] - https://lore.kernel.org/lkml/20201014191235.7f71fcb4@xhacker.debian/
[2] - https://lore.kernel.org/lkml/e28e1f38d87c12a3c714a6573beba6e1@kernel.org/
Cc: Marc Zyngier <maz@kernel.org>
Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Kever Yang <kever.yang@rock-chips.com>
Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
v1 -> v2:
- Fixed up compilation errors that were introduced accidentally
- Fixed a missing put_device()

v2 -> v3:
- Changed chip_warn() to pr_warn()
- Changed some variable names

v3 -> v4:
- Dropped the warning since it's not always valid
- This simplifies the code a lot
- Added comments and fixed up commit text

 drivers/gpio/gpiolib.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b02cc2abd3b6..f42eaca08d9a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -596,6 +596,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		gdev->dev.of_node = gc->of_node;
 	else
 		gc->of_node = gdev->dev.of_node;
+	gdev->dev.fwnode = of_fwnode_handle(gdev->dev.of_node);
 #endif
 
 	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
@@ -4202,6 +4203,29 @@ void gpiod_put_array(struct gpio_descs *descs)
 }
 EXPORT_SYMBOL_GPL(gpiod_put_array);
 
+static int gpio_stub_drv_probe(struct device *dev)
+{
+	/*
+	 * The DT node of some GPIO chips have a "compatible" property, but
+	 * never have a struct device added and probed by a driver to register
+	 * the GPIO chip with gpiolib. In such cases, fw_devlink=on will cause
+	 * the consumers of the GPIO chip to get probe deferred forever because
+	 * they will be waiting for a device associated with the GPIO chip
+	 * firmware node to get added and bound to a driver.
+	 *
+	 * To allow these consumers to probe, we associate the struct
+	 * gpio_device of the GPIO chip with the firmware node and then simply
+	 * bind it to this stub driver.
+	 */
+	return 0;
+}
+
+static struct device_driver gpio_stub_drv = {
+	.name = "gpio_stub_drv",
+	.bus = &gpio_bus_type,
+	.probe = gpio_stub_drv_probe,
+};
+
 static int __init gpiolib_dev_init(void)
 {
 	int ret;
@@ -4213,9 +4237,16 @@ static int __init gpiolib_dev_init(void)
 		return ret;
 	}
 
+	if (driver_register(&gpio_stub_drv) < 0) {
+		pr_err("gpiolib: could not register GPIO stub driver\n");
+		bus_unregister(&gpio_bus_type);
+		return ret;
+	}
+
 	ret = alloc_chrdev_region(&gpio_devt, 0, GPIO_DEV_MAX, GPIOCHIP_NAME);
 	if (ret < 0) {
 		pr_err("gpiolib: failed to allocate char dev region\n");
+		driver_unregister(&gpio_stub_drv);
 		bus_unregister(&gpio_bus_type);
 		return ret;
 	}
-- 
2.30.0.280.ga3ce27912f-goog

