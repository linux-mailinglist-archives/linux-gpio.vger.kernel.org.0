Return-Path: <linux-gpio+bounces-16076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4614EA3744E
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 13:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6681C16F0BE
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 12:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CB21993B1;
	Sun, 16 Feb 2025 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="mUTwenus"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582B8198E6F
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739710727; cv=none; b=DC2KOKIi8rP7ibT+IpMwgr0lWRH+g+vV0yNd5jpdLBMA1w6yVpIOBr9NzbxLZv+42pc64mj+EsUFL0YnWuuAL3JEE1C8dBZqVoizpcxbVO+0ykugZ+FddzG0i3ZFZDpsNjr/s38lnC/w2LDLDnrP3MB62RkxCxlhnFfCq8dXJAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739710727; c=relaxed/simple;
	bh=kgTHhR4YUfUQvLTcLHSzDC9nY3pfgiRlMVx62VhpKuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HG/OJC0Gt9OaOCB16RDz+SKPznv4QvoUOFv/Aqg6M7LrtlB17Ro/wzUM55rxZE8ACdYH7mxZFqL1bDGJf5VmG2eLavhCOpAKH3MS+gnqDxJG24qPlYHdLONEybKPEwDBWcdDJ37Rnl3AxqyHwn0KpCfYHz2301Dzgvq5+WxoTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=mUTwenus; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B84683F87A
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739710723;
	bh=ejmbjvPRmedRPsWRD+UddjAoJvDsol1360tkb/DZqGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=mUTwenush0rt1O7IRL/b5nkNDRczKkHhRh/K5eJRwcQshl+cdJutg5TL0t56joOGv
	 K+MInoWTWkuXYpfZIFDoSpw/ZMekyV1XrDTnEFAtLlR1aru8IUp+xN7AJ17VllzUhK
	 tLaLGg+h9YWzXGOhthhOQ55VZGX6CJEOQ4J4xZqOZ71xr2OFV0wjHyaT6QjWs62WuC
	 zus/u5BdnwDKEpybYptKbXxcQRNkmtDG0CrECaoITHXmKOEYAd3DXN+qlBF+ruKE6l
	 JyGomns0/k4ygB6mCsGR6oRJYdZ+sO2OvNTUkjIgihApmx/wLDV/ilhio/SFHvngBt
	 ANH0UgPL1PPjw==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc45101191so1655941a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 04:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739710721; x=1740315521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejmbjvPRmedRPsWRD+UddjAoJvDsol1360tkb/DZqGw=;
        b=rF8RHjivcC3l0Jo4BLCPWhQkA1AArU+G/2rXB+WSBIXBKcRM8lvEr8wNi6CAIjtBR9
         3t1Dj63ku+VkMJOrzIY+fi5eA0vHisNYnh4h8Izryh9Y7rIXda6lQfAM1/aTbtAsTkBf
         8CozPTwsVxB5nSanTSxxy1sRkrXFnnI0HT21ZkA+ZWedQgcii+lYYyeFq9XpeG/EGFSk
         D73koBaHUmEfFDMRdC4MMX5OQ8HYDTNs9x/2vymiRsNHXPMgxG5nH9EZ6DVzniw0QY1E
         iZ23GYt/Rz2KPodANTHqinrBxJFGjrRFCmGcMKlAZrZOMz33AbsK/hpwSzCs+RGLmd+V
         ztmA==
X-Gm-Message-State: AOJu0YyVYxIWzrovPhTCx1zU2Xa5VLs8jDnTVAsn6CXaxLJYGGo4T139
	iBx9Fvs1yG+nBvCNzJTFxV911n4lhosBWqx2S4JRGmAoPSIwzL8tPHS5xbpkFpZAoCAQDrTU85f
	KiczS+x3EcI0PdUymcEHLGUt9JUOBB1+QPJEikft66onkBtxI7oMw68ZYEMblnRbS1v4VWXbkwL
	YC+tK88U0=
X-Gm-Gg: ASbGncvwdhQTk4hdN62SVmTULZ7RkSBsTf13bL8TxdBXtkhvjDd/3oVlEzr4WmzZwcL
	1v2TmcPS5STbW5JPgPO4J0UDs5G9vnXGYuE0fH/Fb+EcN4J/KDA/sl9XP4dQEud1LYkz7sIbQ+G
	xTa9QfA2QQBPjtfyUZJfsxeJwtYFx2/EkmYsUIsH51ic6uSuND92w2PCBMtI1v7H9Vup1mGVpOR
	PScXkzKUjaaZXOIzB5h0p0azmIO48Zc+HKI6QkjEMzTX+F40h1flnsaxwJJVXOSmoCZa3eGERG6
	6Rbjnw==
X-Received: by 2002:a05:6a00:18a4:b0:730:9446:4d75 with SMTP id d2e1a72fcca58-732618e4f34mr8670821b3a.17.1739710721517;
        Sun, 16 Feb 2025 04:58:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPHBclEt084DH4Oi8DjKq91nsAuXScOqPf/+0apG77WS62OuJWd3yoxzJOWqYY3EEppdkZRQ==
X-Received: by 2002:a05:6a00:18a4:b0:730:9446:4d75 with SMTP id d2e1a72fcca58-732618e4f34mr8670797b3a.17.1739710721224;
        Sun, 16 Feb 2025 04:58:41 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:eaa9:d394:f21d:ee9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73256fb09e1sm4316545b3a.65.2025.02.16.04.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:58:40 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/13] gpio: virtuser: convert to use gpio-pseudo utilities
Date: Sun, 16 Feb 2025 21:58:08 +0900
Message-ID: <20250216125816.14430-6-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250216125816.14430-1-koichiro.den@canonical.com>
References: <20250216125816.14430-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update gpio-virtuser to use the new gpio-pseudo helper functions for
synchronized platform device creation, reducing code duplication.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/Kconfig         |  1 +
 drivers/gpio/gpio-virtuser.c | 73 +++++-------------------------------
 2 files changed, 11 insertions(+), 63 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c482e3494bac..d8fede07149f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1942,6 +1942,7 @@ config GPIO_VIRTUSER
 	select DEBUG_FS
 	select CONFIGFS_FS
 	select IRQ_WORK
+	select GPIO_PSEUDO
 	help
 	  Say Y here to enable the configurable, configfs-based virtual GPIO
 	  consumer testing driver.
diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index e89f299f2140..a825edc6fbc5 100644
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
 
+#include "gpio-pseudo.h"
+
 #define GPIO_VIRTUSER_NAME_BUF_LEN 32
 
 static DEFINE_IDA(gpio_virtuser_ida);
@@ -973,49 +974,17 @@ static struct platform_driver gpio_virtuser_driver = {
 };
 
 struct gpio_virtuser_device {
+	struct pseudo_gpio_common common;
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
+	return !!dev->common.pdev;
 }
 
 struct gpio_virtuser_lookup {
@@ -1369,7 +1338,7 @@ gpio_virtuser_device_config_dev_name_show(struct config_item *item,
 
 	guard(mutex)(&dev->lock);
 
-	pdev = dev->pdev;
+	pdev = dev->common.pdev;
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
+	ret = pseudo_gpio_register(&dev->common, &pdevinfo);
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
+	swnode = dev_fwnode(&dev->common.pdev->dev);
+	pseudo_gpio_unregister(&dev->common);
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
+	pseudo_gpio_init(&dev->common);
 
 	return &no_free_ptr(dev)->group;
 }
-- 
2.45.2


