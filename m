Return-Path: <linux-gpio+bounces-14461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 007D3A00A5E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148B91883C8B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 14:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8111FA82F;
	Fri,  3 Jan 2025 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="UT/ES1er"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C421EE7BA
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735913925; cv=none; b=lGL6AuValYZtmNGfKPiQuQxqhuSYSRsaaQNoZTtrWa0LtgHUBuC4Vgicy96NFTqrsaNFqbPkyHmPkNkr4Ot0rymzo1uBae0JCplIUZud3v6gYbjtDDHKO5GrNeP0QSHfIG9t6CDAk4Y9oo2XiAC1iwANTdZOP4XbADN1yKtrsNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735913925; c=relaxed/simple;
	bh=jP5wiY4Hjf6NHVox7oDrw9gPO0f53fe7WOrwgq5lWCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IX/wg1ipPu9bbPe9hrxw199jQSFs6hiw6S2FEWDCyGkRAAdWMz/zXrmFEf1z1kxncFxtDWx7/MlGRDpvTp1bSwaylL2YtMgDidfFtilkt1lwAmkjFa3M8rR2PuihFCGz2Dv195nfrA2BFfWiOdsNFStI803Yj9nHZprbgFWzEOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=UT/ES1er; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E7C333FE57
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735913921;
	bh=ZASmDFrSHCizrNYJB8JpDX9RUKYLSDAVuT6OOqcLRZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=UT/ES1erHeo2uABJyJJCIY0gvapyJMuCisnnr+8UoaDDFUfu1KefgKqdAacFoezk6
	 GFAeENWpToxGKCdjROMWdsQglsnGMO5pxABQhUw/H0inyg3kOCRjUpG7sXQp6RrBi2
	 qY0dmiKuXJVrV6xq6Qsg203GitUZNuRx3C6OM7LDyYHcp9hde2JB+M5nKYalTWvKfq
	 /PzcPj2RjMwBXMv1mAm8ssLtHZCx/O46Ic4apjMFiGStAFTFrs19UtCQ/gQTmrwID0
	 0Z/5IlUIGX1wHM0ShsiLe4rn0OUVNHdSDhIwQf/sRxlEGF5BnLz5tQXnTO0FUW83bu
	 E1xYktnclSUaA==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2166e907b5eso157035055ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 06:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913920; x=1736518720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZASmDFrSHCizrNYJB8JpDX9RUKYLSDAVuT6OOqcLRZM=;
        b=PV4Y+/PssfCu3CjDDX2PXl03KDP6Jc9cK2f14FFPQutSdajh5rXoh7BosWwqQMqAN/
         e4FMFbSd7Iwu4sCIsedqOkW7MSkpDlUPw17kfgHEhQASKn0vUG9uol4r5yW9Qe9WFq1D
         I//vFy8YXWC804qZKuUP3qHm5b/BL3VZeRPAzEypSX/xVl2VoPmEXHCyEJAjaBeRWg97
         K5eh1P7QlJc/195YMKSX5x0RM5jz7LMBT/CocsocH9JRmulc7KiGRbsrfVwu+341RmEG
         iPO9SDnugKrk5v8YnF4QOwpi1FvzWJDZ1QgIrbcdYRnGflPyNG4OiJI8JdkmH1vS4/t3
         a8Dw==
X-Gm-Message-State: AOJu0Yw8rZLXh0yS/gqJLoIEYWx1JP+e2jlPPcAbaPy5WjihJiGdkX8M
	vKgFtj6gzS73gldkSVIDlEZTCtEKxmjCL7WnJGc8nPsosI0n+PKu7vTMuooQuecEEgR9J6T2g+2
	BRjllNFfj9n4iVtuQ0J8UwnbWJ14ZwAVXhhzQV+kIFNzm/DlzPPsHluDjwDrGAkAmGSLA9UPSZM
	ZOf7Bn/k8=
X-Gm-Gg: ASbGnctcPtXcycQY9OGjK4XgtwTHY/y+dfUN8bfK+pN6WDCYhHT9RlVQUMT2we4gxEW
	CMjpkHN+AQopGgQt2pFralDquenuSAMB0KoY4dcr76wn80LSEC73UhX0CMO3+pmNyH0/oBn9n7L
	wB3vcbJGdMIfDN2ZfIWscD7ePhJtRPY87o8usdmA5JaWx6itK3yGqUTAPSDb1rTure0rpCvslAe
	/ap1gvf3X1DsGC7BgporYKSbRgySUFjMRgii0lYmG6Lf1HiFoP+gbVBeA==
X-Received: by 2002:a05:6a20:7f87:b0:1d9:3b81:cdd3 with SMTP id adf61e73a8af0-1e5e0446330mr75040975637.1.1735913920286;
        Fri, 03 Jan 2025 06:18:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm3Kja89gSgoWB37SsFC82gysqHLLpOOCP6TvpCB3iQy7oMAN6+NUKnLxb5xzVfUWyR/mfBQ==
X-Received: by 2002:a05:6a20:7f87:b0:1d9:3b81:cdd3 with SMTP id adf61e73a8af0-1e5e0446330mr75040939637.1.1735913919933;
        Fri, 03 Jan 2025 06:18:39 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd7b0sm15502908b3a.139.2025.01.03.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:18:39 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] gpio: virtuser: fix missing lookup table cleanups
Date: Fri,  3 Jan 2025 23:18:26 +0900
Message-ID: <20250103141829.430662-2-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103141829.430662-1-koichiro.den@canonical.com>
References: <20250103141829.430662-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a virtuser device is created via configfs and the probe fails due
to an incorrect lookup table, the table is not removed. This prevents
subsequent probe attempts from succeeding, even if the issue is
corrected, unless the device is released. Additionally, cleanup is also
needed in the less likely case of platform_device_register_full()
failure.

Besides, a consistent memory leak in lookup_table->dev_id was spotted
using kmemleak by toggling the live state between 0 and 1 with a correct
lookup table.

Introduce gpio_virtuser_remove_lookup_table() as the counterpart to the
existing gpio_virtuser_make_lookup_table() and call it from all
necessary points to ensure proper cleanup.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-virtuser.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 91b6352c957c..e89b1239b635 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1439,6 +1439,15 @@ gpio_virtuser_make_lookup_table(struct gpio_virtuser_device *dev)
 	return 0;
 }
 
+static void
+gpio_virtuser_remove_lookup_table(struct gpio_virtuser_device *dev)
+{
+	gpiod_remove_lookup_table(dev->lookup_table);
+	kfree(dev->lookup_table->dev_id);
+	kfree(dev->lookup_table);
+	dev->lookup_table = NULL;
+}
+
 static struct fwnode_handle *
 gpio_virtuser_make_device_swnode(struct gpio_virtuser_device *dev)
 {
@@ -1487,10 +1496,8 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
 	pdevinfo.fwnode = swnode;
 
 	ret = gpio_virtuser_make_lookup_table(dev);
-	if (ret) {
-		fwnode_remove_software_node(swnode);
-		return ret;
-	}
+	if (ret)
+		goto err_remove_swnode;
 
 	reinit_completion(&dev->probe_completion);
 	dev->driver_bound = false;
@@ -1498,23 +1505,31 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
 
 	pdev = platform_device_register_full(&pdevinfo);
 	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
 		bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
-		fwnode_remove_software_node(swnode);
-		return PTR_ERR(pdev);
+		goto err_remove_lookup_table;
 	}
 
 	wait_for_completion(&dev->probe_completion);
 	bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
 
 	if (!dev->driver_bound) {
-		platform_device_unregister(pdev);
-		fwnode_remove_software_node(swnode);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_unregister_pdev;
 	}
 
 	dev->pdev = pdev;
 
 	return 0;
+
+err_unregister_pdev:
+	platform_device_unregister(pdev);
+err_remove_lookup_table:
+	gpio_virtuser_remove_lookup_table(dev);
+err_remove_swnode:
+	fwnode_remove_software_node(swnode);
+
+	return ret;
 }
 
 static void
@@ -1526,10 +1541,9 @@ gpio_virtuser_device_deactivate(struct gpio_virtuser_device *dev)
 
 	swnode = dev_fwnode(&dev->pdev->dev);
 	platform_device_unregister(dev->pdev);
+	gpio_virtuser_remove_lookup_table(dev);
 	fwnode_remove_software_node(swnode);
 	dev->pdev = NULL;
-	gpiod_remove_lookup_table(dev->lookup_table);
-	kfree(dev->lookup_table);
 }
 
 static ssize_t
-- 
2.43.0


