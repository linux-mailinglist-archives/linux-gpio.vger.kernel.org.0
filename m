Return-Path: <linux-gpio+bounces-16144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BDCA38667
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 112AC18899B2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E991221DA4;
	Mon, 17 Feb 2025 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="vqpNbX0E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC321CA0C
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802526; cv=none; b=eqatYFcmeOFmx3BL7uofKN6HjdqD9Fo0lSKSGA0w74UMUj1OkntmpiRqLiDiUIDf18mmkRddreI8akh+PtyRgQmD7ruvOiJztpABbzrm/P8sftB8eNFa7ERYplwJSjOxenAvns5l9s5JHQnd7INllxvGCvuC6FTKYHjTNyBkafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802526; c=relaxed/simple;
	bh=QAOA908gNel3y1R7ETsRu2jzdhf2WxIWOfoFCHcP9qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ErFCr4rlCRQL8ybGlVbNyPhbwOR/M8gcJ7zQ8F6I/BKqfv33iBIWpkFYW6b2JfJQn24by612zbl3a2FcvSlAbou0iAmPaAEpFrX6R/+hU2M/QBiEoCjE+beVO96AcI2bD6Mu4BcY3ZAXsORF5EzOZXfo3HmtryAeAfQd7x+uZaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=vqpNbX0E; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7B3AB3FA53
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802516;
	bh=N0Kj1d8MdTe6Cku6k8Y4hSRN1wAEicDaX3HkzkoJuyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=vqpNbX0EXF3dfHvlUf6RHWbVQokG1i9p5dJJNybC4tcmSyJFGUzMe2CxQPM+cFZ9A
	 n5Uv7KSt/EJ3i1FTGYtqoRYquE41OHrOX+YrWhwWFxg1QVMw+OcCGdNkSim+3SQ2I9
	 FloTz/JEsCxSy6tEWAumKSZKjLlk0Z3qsaK1Zf9usOfF4zqEoW3UxM6kitebWhYtZq
	 RDClP1mUe0/0K4zd/e7/rhUmXWaahp+pu1TNTO86UM/tiMf9g1gYRQhItH4Vvy3HbU
	 MtnbRxMR1yWDV3PvQTLRChFlGQtJ4fQtuRh0jP2/OAIch87yqnL1VcQ/fupOIPkjW0
	 V06Kt9j1Q7AVg==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-220d6018858so75753765ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802515; x=1740407315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0Kj1d8MdTe6Cku6k8Y4hSRN1wAEicDaX3HkzkoJuyo=;
        b=sjnhUEx4/AfOWQiUUkpZV2igP0PZhSu4S/PEpdQcZa9Ct+Qr3RDJZuT/3Ev3XThjfP
         iZhum5av8WaejZneYNCapHWs5Z60ZLs9W2benbRMaXDtzsgQPcVoTipcrBlpfVJ2AZHq
         E8aPQsyzVwSz3tl7jLdCnTdRatkuWR9hBiYvV3y4jGAobGnJ46Ve3Q3JxXQh6bDuldxu
         J768mR0XpfVgFI6UOnau5gYwU7nxfobXE9LFA37U6VjdP6ibCK6C2IhcgI4VctJwkDq0
         GeiIMuYrzQ0tQddqDSCm3+63MU2ea/o6qZBzki5Te4zbE7R20xElWdquTBhAyc0d83Su
         MX5w==
X-Gm-Message-State: AOJu0YznwBOdcESQlAZDIVrOOCLpQnoQ3GyLldRJeMBV5mXqqT/LhVLR
	1iLw1o4ZKAje2Acr3Rjs/RWbv23z8pbm3K1dcbUGrXOl1QIELBAkOggFr3OmasaR+hzlAwr9m93
	bN+7a4VjH4F8gCSIp5dAZIPvJD7qROczBtmbZKyvKZTX7uTC7c+4ADrNP2CnMyEDLSJYFfZ8KBe
	YQ4f3PBd8=
X-Gm-Gg: ASbGnctLTV7Q6WKvOIASR2+GeYYpIIRabPWojfLQukZ4sXQ9j/dXTK1pplOIUWv2AKU
	aCANCB20zc4TIy5cQyBkF/uPDDT9XR3a5Nno0QtfPIUpN1RvbS341MR5twt8h7VZzBF23eEo8pi
	/RigrP5esR0p8XAmgHNggyoGg2D1NQT5wIgtHJPE6pndbJjuqswiubIjdJBJl5LFW1BkwBVdkX7
	V3jykRASMvnIlwHUnK10xOY539EQOFolWAmV583o5KC2vFLYxK5UzLxt8ALz6L8lPqlw1qhcBUR
	WUqRvISls7UMfRUtWmTEOfU=
X-Received: by 2002:a17:902:db0c:b0:215:9bc2:42ec with SMTP id d9443c01a7336-221040cf223mr132238875ad.47.1739802514816;
        Mon, 17 Feb 2025 06:28:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5xd3Qyn15GPhq2F9COyGUha2ugih5t2tEudHBsZMRrSSf0N606HwzeDlINRsrUnYXl5l86A==
X-Received: by 2002:a17:902:db0c:b0:215:9bc2:42ec with SMTP id d9443c01a7336-221040cf223mr132238595ad.47.1739802514474;
        Mon, 17 Feb 2025 06:28:34 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55916c7sm72237735ad.243.2025.02.17.06.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:28:34 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] gpio: sim: convert to use gpio-pseudo utilities
Date: Mon, 17 Feb 2025 23:27:57 +0900
Message-ID: <20250217142758.540601-3-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217142758.540601-1-koichiro.den@canonical.com>
References: <20250217142758.540601-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update gpio-sim to use the new gpio-pseudo helper functions for
synchronized platform device creation, reducing code duplication.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/Kconfig    |  1 +
 drivers/gpio/gpio-sim.c | 84 ++++++-----------------------------------
 2 files changed, 13 insertions(+), 72 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1e2c95e03a95..c482e3494bac 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1913,6 +1913,7 @@ config GPIO_SIM
 	tristate "GPIO Simulator Module"
 	select IRQ_SIM
 	select CONFIGFS_FS
+	select GPIO_PSEUDO
 	help
 	  This enables the GPIO simulator - a configfs-based GPIO testing
 	  driver.
diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index a086087ada17..45dbf16bee12 100644
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
 
+#include "gpio-pseudo.h"
+
 #define GPIO_SIM_NGPIO_MAX	1024
 #define GPIO_SIM_PROP_MAX	4 /* Max 3 properties + sentinel. */
 #define GPIO_SIM_NUM_ATTRS	3 /* value, pull and sentinel */
@@ -541,14 +542,9 @@ static struct platform_driver gpio_sim_driver = {
 };
 
 struct gpio_sim_device {
+	struct pseudo_gpio_common common;
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
+	return !!dev->common.pdev;
 }
 
 static char *gpio_sim_strdup_trimmed(const char *str, size_t count)
@@ -730,7 +691,7 @@ static ssize_t gpio_sim_device_config_dev_name_show(struct config_item *item,
 
 	guard(mutex)(&dev->lock);
 
-	pdev = dev->pdev;
+	pdev = dev->common.pdev;
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
+	ret = pseudo_gpio_register(&dev->common, &pdevinfo);
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
+	swnode = dev_fwnode(&dev->common.pdev->dev);
+	pseudo_gpio_unregister(&dev->common);
 	gpio_sim_remove_hogs(dev);
 	gpio_sim_remove_swnode_recursive(swnode);
-	dev->pdev = NULL;
 }
 
 static void
@@ -1117,7 +1058,7 @@ static ssize_t gpio_sim_bank_config_chip_name_show(struct config_item *item,
 	guard(mutex)(&dev->lock);
 
 	if (gpio_sim_device_is_live(dev))
-		return device_for_each_child(&dev->pdev->dev, &ctx,
+		return device_for_each_child(&dev->common.pdev->dev, &ctx,
 					     gpio_sim_emit_chip_name);
 
 	return sprintf(page, "none\n");
@@ -1558,8 +1499,7 @@ gpio_sim_config_make_device_group(struct config_group *group, const char *name)
 	mutex_init(&dev->lock);
 	INIT_LIST_HEAD(&dev->bank_list);
 
-	dev->bus_notifier.notifier_call = gpio_sim_bus_notifier_call;
-	init_completion(&dev->probe_completion);
+	pseudo_gpio_init(&dev->common);
 
 	return &no_free_ptr(dev)->group;
 }
-- 
2.45.2


