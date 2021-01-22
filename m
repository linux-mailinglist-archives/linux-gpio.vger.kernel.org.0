Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7F23010CA
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jan 2021 00:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbhAVXQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 18:16:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbhAVTgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 14:36:44 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59549C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 11:36:04 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id dj13so3615875qvb.20
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 11:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=vwTBSNbfDWaRQPctDpLH0p2BBFqK5xvzdDkItx0sEjE=;
        b=BfId1GG2WGMLSADd0/pPePH3uUoFgLZTw2aBQY+Zoo5IvDtvHVjdAcmG46tpvd/6/V
         ZPU297w7pkhSWBZQs0O+myQ9dKay+bMSZ6FKDz4EcFTVQNBKIBZF6GJ87zP8G9vpcNXJ
         DEfb7h+T1WzdAmlFcSjXv4VEX4KzCiPzAal2jMxEDU6s0suN9SyFWydxVA707eOandvw
         WEpx3sDzf/S1FHKDI331926Ktw8QYz4FTCc7z87XVlxsD4MiKInad0VQR1aDJkkuF5hI
         2jG0zV6c2L237xv86wXu/QaMAB/Ftckz4oLTsPPi9DpxXf5FXEkHfjZA4qMMZ5+s3u+T
         3rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=vwTBSNbfDWaRQPctDpLH0p2BBFqK5xvzdDkItx0sEjE=;
        b=J7I3lokHVFlkBkQwmgnq5042Qnpcq2o3yqRrsRKKhoJ1XpVHhyC8BGGNSWhLk1sVqV
         MP0J7IixnK4DljKfRD+Wzn8CTSlNteIReFhhcuPOXUwDSg1vnSR6oJcMIK8IoiRvDHs8
         5Jq1KVSnK6Yjvo7J5tk+oLViyJa7/GJd5gWHCpZcFRtpXiv6J1YnzwW+KvlW9LMxZvZp
         hQAlZwrX01qDmitGOGk5hkJWSr0igH3LmXMrcluZNIZBnkrZ0h7pMRBsNkyVRAp4JOPp
         u5tYABFsyCKnjnu9RRXzvv5+9i7AwN21P3MQSZaZGDN5anp+i9HH8PfMpHyL44neKtU2
         JahQ==
X-Gm-Message-State: AOAM532+0uLA37SIWXgHD+olBFxBev1eoRgovYcpVCAAxVcx4rSeBlgo
        voqQXa3/fTowhMsXjPDeDZeXKmUc7k3BsXk=
X-Google-Smtp-Source: ABdhPJwzmFKtUiRcrdNfqvADrggST/N6MEKw6afOFsLGM/MIWbIPB02S7WBxJAIeiMYXWQRRi8X5QbM8SmoPV/g=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a05:6214:a94:: with SMTP id
 ev20mr6034383qvb.56.1611344163438; Fri, 22 Jan 2021 11:36:03 -0800 (PST)
Date:   Fri, 22 Jan 2021 11:35:59 -0800
Message-Id: <20210122193600.1415639-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v5] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
From:   Saravana Kannan <saravanak@google.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
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

v4 -> v5:
- Fixed the code to not mess up non-DT cases.
- Moved code into gpiolib-of.c

 drivers/gpio/gpiolib-of.c | 11 +++++++++++
 drivers/gpio/gpiolib-of.h |  5 +++++
 drivers/gpio/gpiolib.c    | 38 +++++++++++++++++++++++++++++++-------
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index b4a71119a4b0..baf0153b7bca 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1039,3 +1039,14 @@ void of_gpiochip_remove(struct gpio_chip *chip)
 {
 	of_node_put(chip->of_node);
 }
+
+void of_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev)
+{
+	/* If the gpiochip has an assigned OF node this takes precedence */
+	if (gc->of_node)
+		gdev->dev.of_node = gc->of_node;
+	else
+		gc->of_node = gdev->dev.of_node;
+	if (gdev->dev.of_node)
+		gdev->dev.fwnode = of_fwnode_handle(gdev->dev.of_node);
+}
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index ed26664f1537..8af2bc899aab 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -15,6 +15,7 @@ int of_gpiochip_add(struct gpio_chip *gc);
 void of_gpiochip_remove(struct gpio_chip *gc);
 int of_gpio_get_count(struct device *dev, const char *con_id);
 bool of_gpio_need_valid_mask(const struct gpio_chip *gc);
+void of_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev);
 #else
 static inline struct gpio_desc *of_find_gpio(struct device *dev,
 					     const char *con_id,
@@ -33,6 +34,10 @@ static inline bool of_gpio_need_valid_mask(const struct gpio_chip *gc)
 {
 	return false;
 }
+static inline void of_gpio_dev_init(struct gpio_chip *gc,
+				    struct gpio_device *gdev)
+{
+}
 #endif /* CONFIG_OF_GPIO */
 
 extern struct notifier_block gpio_of_notifier;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b02cc2abd3b6..70fb15ae5d36 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -590,13 +590,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		gdev->dev.of_node = gc->parent->of_node;
 	}
 
-#ifdef CONFIG_OF_GPIO
-	/* If the gpiochip has an assigned OF node this takes precedence */
-	if (gc->of_node)
-		gdev->dev.of_node = gc->of_node;
-	else
-		gc->of_node = gdev->dev.of_node;
-#endif
+	of_gpio_dev_init(gc, gdev);
 
 	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
 	if (gdev->id < 0) {
@@ -4202,6 +4196,29 @@ void gpiod_put_array(struct gpio_descs *descs)
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
@@ -4213,9 +4230,16 @@ static int __init gpiolib_dev_init(void)
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

