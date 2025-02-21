Return-Path: <linux-gpio+bounces-16388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F9A3F61C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 14:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 620D57A2C64
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 13:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F5820E024;
	Fri, 21 Feb 2025 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="MDTwsx06"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1120C497
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740144921; cv=none; b=HlsxlOXq1hEpKs3gxW/gtivJqOcHQ2IkVKkh4KPM/8EnzDY4SUoLv9kP17oHibf6F3/jxHxuXGunNqkf5mYh3sKlVyqtn7/oKdI3JvsG328VvIa8xt/Rr7Cz+4dhVWq6rfxp5Xuts+/cMJrLQ0KpV5mO1HCAwqZo6KdS2uFUBJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740144921; c=relaxed/simple;
	bh=IcOH5SAseQKzkHpmHpSjfAE9mkd9Arcd9z68k2xbqrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJ6/qkZxNUHnUhj7J6T4T4Do6BQE7B1p6B3k34qenpyiuUoyOMiROjn6e80ivFUEgoWUQ4Vr4lFXcggdo0hvCbKE3MtO2/z2T5EQIS7hxALE+1UDJ0TEzn5PhlzRzNincdTYRKuUCHn71eD3ybPHYbXTdDmQBhFz69CgbyfV9v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=MDTwsx06; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8F85A3F6B8
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740144917;
	bh=YUp6LYQRCspZvbFalfM4lFVMvYXlGzGvaMoc9xWJpOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=MDTwsx06iZwI4hKUJOc5q1kfrTJolr4m8bsqbQ8T4M4fqKhrlLxbYqRqSvophQQ3S
	 c/fhqo7QuLrlCOuYT3BKme1IXwBCkjie7YPczAwhwcRKznlYnf9PVXsntY7wgliS8P
	 Phn6Q/D0LijiupfMPINAZLYGr3P6HocTfzjU5hM2iqsFo5mgKgI3ZKfQDu8cxdRTmp
	 3TShTAa2tpvdlUdgJ+YN+Lr5HynB0UrbmewKF6xH1Z0AN/9mjVhSc8HxagJCQflwBX
	 WyHFAUcy7w1xmQzWt8647sj9y32XZwoMfKMUWvaSvxtYAaA5lKt/WYvyNyiyqSbZK0
	 CB+Xc3Q3BBYTQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so4754095a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 05:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740144915; x=1740749715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUp6LYQRCspZvbFalfM4lFVMvYXlGzGvaMoc9xWJpOo=;
        b=fbzOM/+6Y/14s0gZXHaVHVgcR1fBjqp1p4cc4pma6E4e4SmpEJcVuOZODuxmzUg05i
         0CyHi7DE3M7Rpgvz5+TbImZNa6u7F5eHFoXVBObiY5y/mcBPZxgj441ib0ZuwtYDqLca
         lw8tnQgMfY2Vsni8Yzb8d+lmAzPMmx8bulWBnxWcaXO4DKVsdmUFnE1BcvWgE9Afyz04
         bO39a20rS3tTBYkfqTwLPB8t7RPrKIeXveAKTjMQ9z3S7k5yxPicN5iIP2RDUz6sa8jK
         dRYWknfjCZY+mbeTI7RWNxOmNbvpQWGfPFWndja6K8UOAN6VeFhV/c0RvwZp1FncwsER
         3cbg==
X-Gm-Message-State: AOJu0YxGD06HJB8Pzl4QHKbd528Kng+C2dSa270OYLbrk9dd0kupWkRg
	cHwH7lUsSyEtQG1qEGzx0Ah8JkEWszwvi3xVsAzFRC2ddCOkCj7qjGF7NTT8uUNmr+Jffqut+k+
	KUjMIhqImtL7NNiJSnX8+CW3nKCe9jkFqJpL3ebe7/4yYGe/qJ9Z9jkyOcpcyLg4M8rzqHXQsh4
	RETSRk32g=
X-Gm-Gg: ASbGnctGdPfEWzVlR+F7X7klLVzGTSIF40y/Uel0R+8NJMklDneVg/2nTei69Ob7SNu
	S2hZ48Mp7OdTLMrqOb5SONf6ptjJ+JsgjScdFLaEBhLl+NCRALPmfHF+REGp7ze+hy+9CzjUU3Q
	q0+I5Y2S6n2tRtRE54tQud6kP2XyKks8CJYYSvYowVMttQCIyv8c4IjYy0DdkG2tpl0eoMy9BTL
	45Gu3JsjMMBhsfxFIoN2cWa20Yp4nMNbJ66zM4zGY11f0ZUYlK+D2CJzq174WgszyBKzPau2f1X
	BNQA40w/YahuXefK
X-Received: by 2002:a05:6a00:238b:b0:732:6248:8f5f with SMTP id d2e1a72fcca58-73426c857f0mr4943454b3a.5.1740144915292;
        Fri, 21 Feb 2025 05:35:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi1Gsb9VWYRvml0tMN8HhdWYXhcZeJKbfQe1KvSFbipBH1mXtylhLvYgpNx+o4hjB/fsJHog==
X-Received: by 2002:a05:6a00:238b:b0:732:6248:8f5f with SMTP id d2e1a72fcca58-73426c857f0mr4943402b3a.5.1740144914763;
        Fri, 21 Feb 2025 05:35:14 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:2777:7867:71cd:dd56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7325d65619bsm12565459b3a.113.2025.02.21.05.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 05:35:14 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] gpio: sim: convert to use dev-sync-probe utilities
Date: Fri, 21 Feb 2025 22:35:00 +0900
Message-ID: <20250221133501.2203897-3-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250221133501.2203897-1-koichiro.den@canonical.com>
References: <20250221133501.2203897-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update gpio-sim to use the new dev-sync-probe helper functions for
synchronized platform device creation, reducing code duplication.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/Kconfig    |  1 +
 drivers/gpio/gpio-sim.c | 84 ++++++-----------------------------------
 2 files changed, 13 insertions(+), 72 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e15405add317..297ad8f78f38 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1909,6 +1909,7 @@ config GPIO_SIM
 	tristate "GPIO Simulator Module"
 	select IRQ_SIM
 	select CONFIGFS_FS
+	select DEV_SYNC_PROBE
 	help
 	  This enables the GPIO simulator - a configfs-based GPIO testing
 	  driver.
diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index a086087ada17..2c0729a62fc2 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -10,7 +10,6 @@
 #include <linux/array_size.h>
 #include <linux/bitmap.h>
 #include <linux/cleanup.h>
-#include <linux/completion.h>
 #include <linux/configfs.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -37,6 +36,8 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
+#include "dev-sync-probe.h"
+
 #define GPIO_SIM_NGPIO_MAX	1024
 #define GPIO_SIM_PROP_MAX	4 /* Max 3 properties + sentinel. */
 #define GPIO_SIM_NUM_ATTRS	3 /* value, pull and sentinel */
@@ -541,14 +542,9 @@ static struct platform_driver gpio_sim_driver = {
 };
 
 struct gpio_sim_device {
+	struct dev_sync_probe_data probe_data;
 	struct config_group group;
 
-	/*
-	 * If pdev is NULL, the device is 'pending' (waiting for configuration).
-	 * Once the pointer is assigned, the device has been created and the
-	 * item is 'live'.
-	 */
-	struct platform_device *pdev;
 	int id;
 
 	/*
@@ -562,46 +558,11 @@ struct gpio_sim_device {
 	 */
 	struct mutex lock;
 
-	/*
-	 * This is used to synchronously wait for the driver's probe to complete
-	 * and notify the user-space about any errors.
-	 */
-	struct notifier_block bus_notifier;
-	struct completion probe_completion;
-	bool driver_bound;
-
 	struct gpiod_hog *hogs;
 
 	struct list_head bank_list;
 };
 
-/* This is called with dev->lock already taken. */
-static int gpio_sim_bus_notifier_call(struct notifier_block *nb,
-				      unsigned long action, void *data)
-{
-	struct gpio_sim_device *simdev = container_of(nb,
-						      struct gpio_sim_device,
-						      bus_notifier);
-	struct device *dev = data;
-	char devname[32];
-
-	snprintf(devname, sizeof(devname), "gpio-sim.%u", simdev->id);
-
-	if (!device_match_name(dev, devname))
-		return NOTIFY_DONE;
-
-	if (action == BUS_NOTIFY_BOUND_DRIVER)
-		simdev->driver_bound = true;
-	else if (action == BUS_NOTIFY_DRIVER_NOT_BOUND)
-		simdev->driver_bound = false;
-	else
-		return NOTIFY_DONE;
-
-	complete(&simdev->probe_completion);
-
-	return NOTIFY_OK;
-}
-
 static struct gpio_sim_device *to_gpio_sim_device(struct config_item *item)
 {
 	struct config_group *group = to_config_group(item);
@@ -708,7 +669,7 @@ static bool gpio_sim_device_is_live(struct gpio_sim_device *dev)
 {
 	lockdep_assert_held(&dev->lock);
 
-	return !!dev->pdev;
+	return !!dev->probe_data.pdev;
 }
 
 static char *gpio_sim_strdup_trimmed(const char *str, size_t count)
@@ -730,7 +691,7 @@ static ssize_t gpio_sim_device_config_dev_name_show(struct config_item *item,
 
 	guard(mutex)(&dev->lock);
 
-	pdev = dev->pdev;
+	pdev = dev->probe_data.pdev;
 	if (pdev)
 		return sprintf(page, "%s\n", dev_name(&pdev->dev));
 
@@ -939,7 +900,6 @@ static int gpio_sim_device_activate(struct gpio_sim_device *dev)
 {
 	struct platform_device_info pdevinfo;
 	struct fwnode_handle *swnode;
-	struct platform_device *pdev;
 	struct gpio_sim_bank *bank;
 	int ret;
 
@@ -981,31 +941,13 @@ static int gpio_sim_device_activate(struct gpio_sim_device *dev)
 	pdevinfo.fwnode = swnode;
 	pdevinfo.id = dev->id;
 
-	reinit_completion(&dev->probe_completion);
-	dev->driver_bound = false;
-	bus_register_notifier(&platform_bus_type, &dev->bus_notifier);
-
-	pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(pdev)) {
-		bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
-		gpio_sim_remove_hogs(dev);
-		gpio_sim_remove_swnode_recursive(swnode);
-		return PTR_ERR(pdev);
-	}
-
-	wait_for_completion(&dev->probe_completion);
-	bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
-
-	if (!dev->driver_bound) {
-		/* Probe failed, check kernel log. */
-		platform_device_unregister(pdev);
+	ret = dev_sync_probe_register(&dev->probe_data, &pdevinfo);
+	if (ret) {
 		gpio_sim_remove_hogs(dev);
 		gpio_sim_remove_swnode_recursive(swnode);
-		return -ENXIO;
+		return ret;
 	}
 
-	dev->pdev = pdev;
-
 	return 0;
 }
 
@@ -1015,11 +957,10 @@ static void gpio_sim_device_deactivate(struct gpio_sim_device *dev)
 
 	lockdep_assert_held(&dev->lock);
 
-	swnode = dev_fwnode(&dev->pdev->dev);
-	platform_device_unregister(dev->pdev);
+	swnode = dev_fwnode(&dev->probe_data.pdev->dev);
+	dev_sync_probe_unregister(&dev->probe_data);
 	gpio_sim_remove_hogs(dev);
 	gpio_sim_remove_swnode_recursive(swnode);
-	dev->pdev = NULL;
 }
 
 static void
@@ -1117,7 +1058,7 @@ static ssize_t gpio_sim_bank_config_chip_name_show(struct config_item *item,
 	guard(mutex)(&dev->lock);
 
 	if (gpio_sim_device_is_live(dev))
-		return device_for_each_child(&dev->pdev->dev, &ctx,
+		return device_for_each_child(&dev->probe_data.pdev->dev, &ctx,
 					     gpio_sim_emit_chip_name);
 
 	return sprintf(page, "none\n");
@@ -1558,8 +1499,7 @@ gpio_sim_config_make_device_group(struct config_group *group, const char *name)
 	mutex_init(&dev->lock);
 	INIT_LIST_HEAD(&dev->bank_list);
 
-	dev->bus_notifier.notifier_call = gpio_sim_bus_notifier_call;
-	init_completion(&dev->probe_completion);
+	dev_sync_probe_init(&dev->probe_data);
 
 	return &no_free_ptr(dev)->group;
 }
-- 
2.45.2


