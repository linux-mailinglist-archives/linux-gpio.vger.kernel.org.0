Return-Path: <linux-gpio+bounces-16389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 222DAA3F624
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 14:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E962861FCA
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 13:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CE220F076;
	Fri, 21 Feb 2025 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="mb01lJQd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C920E00E
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740144923; cv=none; b=i7iFXMqJC0TFr0j6/olT6cVydFvYh5fxIPtL4ooGZrMNEOGdGZolYMZwCgrz5rJ5A12Y5uwRVLJ163chb+1poqiH9FHCi0ezrlgONY5a8HtFcd95fjEuzOGoRWehXsaBJV/bcra4sjHM6hRjToGDhQrX5XO+5ikhD28tXZ6YC5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740144923; c=relaxed/simple;
	bh=2sKNu9pu9EQxq0VJYOxo3RJcm9UNmjRT0MW3Pa1AWpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FM5I97pNyKsxNPS9dk4Plhz2co0lNySijqYt2z1C6EwPJl4HMYF6Lo1Tvz1dNs+O4OXnDMSEqk+gRXpY9dCfXQez1liO63Jjpwm4H7gqs/aQ5UUGxG2zNVhh7MjXhgAal+WzAtEOsBFVSVK5FO34xwyS3sMTiORbax6G9gee6YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=mb01lJQd; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 978554196B
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740144919;
	bh=BkjT7/jJ++3VQmpRa1vg24+85VM0dA6Mj+g/I8mTwrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=mb01lJQdjHVfWVk76EAm1PcZhYTYPLzlyE/KGXFHRvTTVBDBL7n8BiC10f0ROH1HN
	 CA8+9fBBOwofoq4K0xAvZVS3ZkKFTg4cG8Hc391E/PrIYgVL+hElviF77Tl9MG4Vpl
	 Kh6Ke4c6n1m41teNf1dB1PNhlg0jm20O1xjbE5HYKWrKF5K+wKmnfDF2/4iz0tL8oV
	 eTxfdD6KTZKkU1uinvJb7SDXhCOgt2Jtdxzv1R5TAaJ6gxCZMLlSNPJYB616yMtN/Y
	 3A7+TRh51NPEU4nlZY0dXv4v+pALJIN3g9IVVKzzI/ae6oSIUIvbPKgGUPK/GBORlE
	 3LgKScMm4I1HQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc45101191so4341071a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 05:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740144918; x=1740749718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkjT7/jJ++3VQmpRa1vg24+85VM0dA6Mj+g/I8mTwrc=;
        b=qS1YM2f41NcQDBasqPWzdNvcXgx+KdIcJQsFkH/zvcOsIBAly+lLmo622Hkv1aEdUt
         SA+/YUQMUvbCt9npveoNrOdyp5RoOoa4CRK1KMvwEuYswN9YBhVNvGyWk4ar6HAFfhxu
         Ei21EiqaMQ1yL1i2v7UVe96YCb6m0Ooi3pCWZ/kG0pj79ZowdtuiAnACqcuX+ZzEnBbU
         MYBijaHBsa73SYE5S9U6Lig3v1h2Qlj+W+d+leZMEZyb46PWvpC4Q0v0oyUNjD7OQNle
         5msHUQiT/vBGge+Bez0ZJCvLIQjY3AOzbMz2pqvE3AYjmtk0a+3PrtIPT4//+XeTgXVR
         JfbQ==
X-Gm-Message-State: AOJu0YyQ2fIObgIG4ztUtgTI0c7FFKydxjCUnL/zna9QxIY4yNGdfxAN
	0+hj3jOAzfzGBnpe2QWX64TAr0/O4cwM2L1g9QeGMYjJis+qM5NNoUO7t8JYZVjlYE7/OwudPnG
	sryYIv/bu3MpC5eR2SIW3Jcu5rCiFEaR4OmGfe3fZKqkbDtqLAUvmDtTNBtR77dnqw8cdeZIzFW
	NZ4/OsC/w=
X-Gm-Gg: ASbGncs7eYxFDR/aMCiHliXT50+Fr80ccAOtX6VYDxVJF/HFQX5d4mUe9Vv1BRCKByv
	vsQgSJ3kfoPD/LlxptwlEdkDlny/ihI2pcCVLvGiM11hXbSP6bn2kIJ/TYL9i1DrD321L2rqRwU
	M8rylRSyw/rmwdpF9ZjnB2YQPMNq1z0PL/+0V/93oPLYslL14gjG1CqnzoiyCjvsJDr+N7UGVxs
	IyRomkk/P2vHz8l+SzVY0zSIucpsdYc36PwBpJcWuSI79sSCMaOlgXbUYXxUNx6av8XxDsSI8K2
	zpjltGq4Gc8o7kNw
X-Received: by 2002:a05:6a00:234c:b0:730:95f1:53ca with SMTP id d2e1a72fcca58-73426cb13f2mr4531980b3a.10.1740144917976;
        Fri, 21 Feb 2025 05:35:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq/r+LR01XwfOEzHEFA7rnHpUVwfkJMQ41uekwZKt7/CGhMgvh25td+6Y1WGU1qj2IhAbDxw==
X-Received: by 2002:a05:6a00:234c:b0:730:95f1:53ca with SMTP id d2e1a72fcca58-73426cb13f2mr4531945b3a.10.1740144917641;
        Fri, 21 Feb 2025 05:35:17 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:2777:7867:71cd:dd56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7325d65619bsm12565459b3a.113.2025.02.21.05.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 05:35:17 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] gpio: virtuser: convert to use dev-sync-probe utilities
Date: Fri, 21 Feb 2025 22:35:01 +0900
Message-ID: <20250221133501.2203897-4-koichiro.den@canonical.com>
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

Update gpio-virtuser to use the new dev-sync-probe helper functions for
synchronized platform device creation, reducing code duplication.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/Kconfig         |  1 +
 drivers/gpio/gpio-virtuser.c | 73 +++++-------------------------------
 2 files changed, 11 insertions(+), 63 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 297ad8f78f38..59c48c632197 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1938,6 +1938,7 @@ config GPIO_VIRTUSER
 	select DEBUG_FS
 	select CONFIGFS_FS
 	select IRQ_WORK
+	select DEV_SYNC_PROBE
 	help
 	  Say Y here to enable the configurable, configfs-based virtual GPIO
 	  consumer testing driver.
diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index e89f299f2140..13407fd4f0eb 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -11,7 +11,6 @@
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
 #include <linux/cleanup.h>
-#include <linux/completion.h>
 #include <linux/configfs.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
@@ -37,6 +36,8 @@
 #include <linux/string_helpers.h>
 #include <linux/types.h>
 
+#include "dev-sync-probe.h"
+
 #define GPIO_VIRTUSER_NAME_BUF_LEN 32
 
 static DEFINE_IDA(gpio_virtuser_ida);
@@ -973,49 +974,17 @@ static struct platform_driver gpio_virtuser_driver = {
 };
 
 struct gpio_virtuser_device {
+	struct dev_sync_probe_data probe_data;
 	struct config_group group;
 
-	struct platform_device *pdev;
 	int id;
 	struct mutex lock;
 
-	struct notifier_block bus_notifier;
-	struct completion probe_completion;
-	bool driver_bound;
-
 	struct gpiod_lookup_table *lookup_table;
 
 	struct list_head lookup_list;
 };
 
-static int gpio_virtuser_bus_notifier_call(struct notifier_block *nb,
-					   unsigned long action, void *data)
-{
-	struct gpio_virtuser_device *vdev;
-	struct device *dev = data;
-	char devname[32];
-
-	vdev = container_of(nb, struct gpio_virtuser_device, bus_notifier);
-	snprintf(devname, sizeof(devname), "gpio-virtuser.%d", vdev->id);
-
-	if (!device_match_name(dev, devname))
-		return NOTIFY_DONE;
-
-	switch (action) {
-	case BUS_NOTIFY_BOUND_DRIVER:
-		vdev->driver_bound = true;
-		break;
-	case BUS_NOTIFY_DRIVER_NOT_BOUND:
-		vdev->driver_bound = false;
-		break;
-	default:
-		return NOTIFY_DONE;
-	}
-
-	complete(&vdev->probe_completion);
-	return NOTIFY_OK;
-}
-
 static struct gpio_virtuser_device *
 to_gpio_virtuser_device(struct config_item *item)
 {
@@ -1029,7 +998,7 @@ gpio_virtuser_device_is_live(struct gpio_virtuser_device *dev)
 {
 	lockdep_assert_held(&dev->lock);
 
-	return !!dev->pdev;
+	return !!dev->probe_data.pdev;
 }
 
 struct gpio_virtuser_lookup {
@@ -1369,7 +1338,7 @@ gpio_virtuser_device_config_dev_name_show(struct config_item *item,
 
 	guard(mutex)(&dev->lock);
 
-	pdev = dev->pdev;
+	pdev = dev->probe_data.pdev;
 	if (pdev)
 		return sprintf(page, "%s\n", dev_name(&pdev->dev));
 
@@ -1478,7 +1447,6 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
 {
 	struct platform_device_info pdevinfo;
 	struct fwnode_handle *swnode;
-	struct platform_device *pdev;
 	int ret;
 
 	lockdep_assert_held(&dev->lock);
@@ -1499,31 +1467,12 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
 	if (ret)
 		goto err_remove_swnode;
 
-	reinit_completion(&dev->probe_completion);
-	dev->driver_bound = false;
-	bus_register_notifier(&platform_bus_type, &dev->bus_notifier);
-
-	pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(pdev)) {
-		ret = PTR_ERR(pdev);
-		bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
+	ret = dev_sync_probe_register(&dev->probe_data, &pdevinfo);
+	if (ret)
 		goto err_remove_lookup_table;
-	}
-
-	wait_for_completion(&dev->probe_completion);
-	bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
-
-	if (!dev->driver_bound) {
-		ret = -ENXIO;
-		goto err_unregister_pdev;
-	}
-
-	dev->pdev = pdev;
 
 	return 0;
 
-err_unregister_pdev:
-	platform_device_unregister(pdev);
 err_remove_lookup_table:
 	gpio_virtuser_remove_lookup_table(dev);
 err_remove_swnode:
@@ -1539,11 +1488,10 @@ gpio_virtuser_device_deactivate(struct gpio_virtuser_device *dev)
 
 	lockdep_assert_held(&dev->lock);
 
-	swnode = dev_fwnode(&dev->pdev->dev);
-	platform_device_unregister(dev->pdev);
+	swnode = dev_fwnode(&dev->probe_data.pdev->dev);
+	dev_sync_probe_unregister(&dev->probe_data);
 	gpio_virtuser_remove_lookup_table(dev);
 	fwnode_remove_software_node(swnode);
-	dev->pdev = NULL;
 }
 
 static void
@@ -1772,8 +1720,7 @@ gpio_virtuser_config_make_device_group(struct config_group *group,
 				    &gpio_virtuser_device_config_group_type);
 	mutex_init(&dev->lock);
 	INIT_LIST_HEAD(&dev->lookup_list);
-	dev->bus_notifier.notifier_call = gpio_virtuser_bus_notifier_call;
-	init_completion(&dev->probe_completion);
+	dev_sync_probe_init(&dev->probe_data);
 
 	return &no_free_ptr(dev)->group;
 }
-- 
2.45.2


