Return-Path: <linux-gpio+bounces-16200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0DCA3A21F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 17:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 044821887D2C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 16:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17C226E176;
	Tue, 18 Feb 2025 16:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="HQUCZWR/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A68F26B95A
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894658; cv=none; b=eRipSkE6jdEgOuBYdYx8q5GuhMl/ZEXCvTbjuSGjE3wZKk9u8pMdI1VFLiXL26fX0SRFBpRfUuKiwPyq69g7vNhNxd9H3FPDcUKOheCQ6isDG608sWivoaCglmU19Ywi/v8MaV17NRFT6+k/VMrurjyD3qJth1XCEe8+AzNmSkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894658; c=relaxed/simple;
	bh=4eJWuiu8iMylG68gF/vH9qt791ZdSmlwPSbKjxx5PNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avItXwS1JLi0X1hrwKnbWAmYO8djF10D3wfN23MQoLNOzWHFtFERrKooYXmPcfDaqawikfoKV+wNxoD8u0wx6KQt5RWDNmOMuhGZTGvpTzr6iG5SufKS2aUX6dFnq0pRlXQrV0BXr4tWv1IHzD9762Lqh4jQyffUYO4ovB+LBY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=HQUCZWR/; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 75A363F868
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739894655;
	bh=hXMs8HBNi/hnowMwXyt+GhCst9ecZCs2bYJfUqZe+sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=HQUCZWR/Fl7J2/I18HW+5W3IXf/RVPNX+tYHfrOqv+YUHNF7WYjPStQ5lukOrNEq+
	 gNubeYim3xXcf771oQl22IcsaW3APp1RFfOMtuIV5r2C4tgUSezND/FPc3ThwqPgmT
	 y5dKTZIOMnk1sZR8DcK9sBIN9aobdFJ9yeSjRsp1+enlAdrA6QJN00cPuuEPgG95IK
	 XwhXYcqPNPhDqpJG/lxlwU7Z+kr3Shw4F6vcLyOJPozao/DqAptEl2qiLqeJS4XVEP
	 U9QXIjR4CKfCN07Pgq+S7d8uBhiKn2DxIpukFVmJ0bk1BHyQvA4mjraHbOP/yYJ2XX
	 oKEnvLH/bAy7g==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-220ec5c16e9so90767955ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 08:04:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739894653; x=1740499453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXMs8HBNi/hnowMwXyt+GhCst9ecZCs2bYJfUqZe+sI=;
        b=OOPuTg1PTfpc5CQ02MAHnRpcKupr3fYFUxu3xQ3Xa0JBvVVSXNJnI2U1iV+uR5OdWo
         wK5HmvqPc3sOEB+o8IcjxVqTpbOxkXQe5CgESk/gjqiQxyCddY06SS/ALg4pBGcNNOhp
         KfKgWvcTMeC6ogY4OetE9uWhRPJ9WrMFAVVyO8D8Tcx9loIzqMq8vLBIwVuqhSknB2rr
         1E0mCuyLXNcpDF6/Dm9Cjc1BTHjAgBdarF3UfPXC8/gu3yoa5v873vsW4LzEfRrqxUA1
         C8wVdWXmFCkOWmVXjVDF14sKclmPUlEEMAr43eLfqTG9n9UD8B6/O/S/5K5T6OLGGnIl
         KDLA==
X-Gm-Message-State: AOJu0YwyN9yGEy6i2O82887D5pOMoQyxnNDtDKvD+d5NJguecB/X71VS
	UeuHOfc4TLJ+mieKw88KgM97l2HBXY2xrY799k1K42C3o/jVAbkezpibVqaMYrXXB+HSBDOGLXA
	7cxoujTd0w7QXNMaRcMbencj8lX///IFLCgYkgEB4OJWo6NoVsI5xKx26oDBc5GDxvMfReya7/X
	DzVIIxK/s=
X-Gm-Gg: ASbGncubdoz7Irssm1ry+a/+WJgIfDsQiOusTAwslqitCnpjHfzKe8f8cx1cerHeciQ
	VbTa8UbLhWNiHqAn4fcTjPax50L4bLZoMjSkacRwStI6qcONbTVdHkjHeMTGi9+FwZLzHcGG9eu
	UIBlHuEf/cqW2D4CkPjWi4sdVFPM1HVqLs+Sw8F9bUaFq2V2/Nz5d9mbm1mLsZXUXoT3cmRAkP6
	h1lV/ZpxGZjQ6wkaXErHRGPosIcZizsB7TCJStrqdqKj2FD+4OTZiSNF8+VBho0yfsZQZT7K+Uy
	AdaqpJ/rX50kY9f38NWNYRs=
X-Received: by 2002:a17:902:f612:b0:21f:9c7:2d2e with SMTP id d9443c01a7336-221040bdb68mr245123175ad.40.1739894653514;
        Tue, 18 Feb 2025 08:04:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2TbTWW3u0CYVTQ9OQPM/nQJvb6h3vq+eHaom1mbDtD51GpaWKMh3d5FIgowV2tRA1OUtNOw==
X-Received: by 2002:a17:902:f612:b0:21f:9c7:2d2e with SMTP id d9443c01a7336-221040bdb68mr245122685ad.40.1739894652947;
        Tue, 18 Feb 2025 08:04:12 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:ad3a:e902:d78b:b8fa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae01c768020sm3662177a12.73.2025.02.18.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 08:04:12 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] gpio: virtuser: convert to use dev-sync-probe utilities
Date: Wed, 19 Feb 2025 01:03:33 +0900
Message-ID: <20250218160333.605829-4-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250218160333.605829-1-koichiro.den@canonical.com>
References: <20250218160333.605829-1-koichiro.den@canonical.com>
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
 drivers/gpio/Kconfig         |  3 +-
 drivers/gpio/gpio-virtuser.c | 73 +++++-------------------------------
 2 files changed, 12 insertions(+), 64 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ba06f052b9ea..b3049993a449 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1866,7 +1866,7 @@ endmenu
 # This symbol is selected by drivers that need synchronous fake device creation
 config DEV_SYNC_PROBE
 	tristate "Utilities for synchronous fake device creation"
-	depends on GPIO_SIM
+	depends on GPIO_SIM || GPIO_VIRTUSER
 	help
 	  Common helper functions for drivers that need synchronous fake
 	  device creation.
@@ -1946,6 +1946,7 @@ config GPIO_VIRTUSER
 	select DEBUG_FS
 	select CONFIGFS_FS
 	select IRQ_WORK
+	select DEV_SYNC_PROBE
 	help
 	  Say Y here to enable the configurable, configfs-based virtual GPIO
 	  consumer testing driver.
diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index e89f299f2140..a48627352337 100644
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
+	struct dev_sync_probe_data data;
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
+	return !!dev->data.pdev;
 }
 
 struct gpio_virtuser_lookup {
@@ -1369,7 +1338,7 @@ gpio_virtuser_device_config_dev_name_show(struct config_item *item,
 
 	guard(mutex)(&dev->lock);
 
-	pdev = dev->pdev;
+	pdev = dev->data.pdev;
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
+	ret = dev_sync_probe_register(&dev->data, &pdevinfo);
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
+	swnode = dev_fwnode(&dev->data.pdev->dev);
+	dev_sync_probe_unregister(&dev->data);
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
+	dev_sync_probe_init(&dev->data);
 
 	return &no_free_ptr(dev)->group;
 }
-- 
2.45.2


