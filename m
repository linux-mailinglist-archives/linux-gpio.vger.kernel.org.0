Return-Path: <linux-gpio+bounces-20837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 373CBAC9CE0
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 23:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FC039E0F01
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 21:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F12C1DD525;
	Sat, 31 May 2025 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFRcL7Uy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DB91B21AD;
	Sat, 31 May 2025 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726624; cv=none; b=kdnQqIIbk6gLUit7eosH8GU+Hg1wLjy+t+4OdOxWIe2BQsZ64hWkcA/ElAN8ljaSBTKV36Dg64XgSswtsOc+in74UF8NoRkKWrGn1jdVk60LgzUObeM6RxKKehb8b21Dv6/XyCnyVbYSo8PfMhjX1MCdgELhoQg9XdmwF1RnJSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726624; c=relaxed/simple;
	bh=y122ltxUGKIzJOFeENdMTmUh/wFoa8nCfcCmKphjWq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpeKhsEe2bVPtuE2hw1/sonHjYsKvr1vVcL4Lme2NrmQua2NUZkLuEchwICREDJrSkiD0WUwJ3n4Wq+MgPEpMNiLBN8pP5SlYPKqgnyVDDY80+/Pxa9QLFaCpt6tLgdwVzLEs7OCzzKghNtEf7KdPAz/aH8ofwmVFJWDPUN2hK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFRcL7Uy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748726622; x=1780262622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y122ltxUGKIzJOFeENdMTmUh/wFoa8nCfcCmKphjWq0=;
  b=BFRcL7Uy7YU4pAJbTP8X+7KE7iB80dBFOPMHIK8k/V/vddFfiyfUPxc6
   caUYlid4acS0Nfk4/JVK78AoXE8FV/dhtUAIMhYyHle06Lojzt6tM6fTj
   5dmJrVdaWe9yIE53kt83HNqjmRuIKmjFilzaWBe0HTlaf8bV1YP0K8Yhm
   zparau/lu3EF3deSWfiEXfUBsJw3snVz9ZzyEeAB7JuOBfvcStiZoM1Jt
   msrWHGu8Ir8ecmRBMQ7oBleHgZjjlyAWzHgEU/7kweUHr7kEgUF9k2uQP
   Pu3ko77phJLD9oBzy4F2pqEfTm7q1AbZkYB29R+wCRMWjdOS64+K34sxG
   w==;
X-CSE-ConnectionGUID: JG0ze4hYRP20MDiZCTqUGg==
X-CSE-MsgGUID: QMX80LSsSwaT92XBvosscQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50888690"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50888690"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 14:23:40 -0700
X-CSE-ConnectionGUID: JpjkgCHwTOS5zMHoRV4AmA==
X-CSE-MsgGUID: UovtZcQkTSKC9JT6DzCvjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144161859"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2025 14:23:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 781FF2E5; Sun, 01 Jun 2025 00:23:35 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 2/2] gpiolib: Remove unused devm_gpio_request()
Date: Sun,  1 Jun 2025 00:21:39 +0300
Message-ID: <20250531212331.3635269-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/gpio/gpiolib-legacy.c                 | 38 -------------------
 include/linux/gpio.h                          |  8 ----
 3 files changed, 47 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 3d56f94ac2ee..2b36ebde9cec 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -275,7 +275,6 @@ GPIO
   devm_gpiod_put()
   devm_gpiod_unhinge()
   devm_gpiochip_add_data()
-  devm_gpio_request()
   devm_gpio_request_one()
 
 I2C
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index aeae6df8bec9..3bc93ccadb5b 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -85,44 +85,6 @@ static void devm_gpio_release(struct device *dev, void *res)
 	gpio_free(*gpio);
 }
 
-/**
- * devm_gpio_request - request a GPIO for a managed device
- * @dev: device to request the GPIO for
- * @gpio: GPIO to allocate
- * @label: the name of the requested GPIO
- *
- * Except for the extra @dev argument, this function takes the
- * same arguments and performs the same function as gpio_request().
- * GPIOs requested with this function will be automatically freed
- * on driver detach.
- *
- * **DEPRECATED** This function is deprecated and must not be used in new code.
- *
- * Returns:
- * 0 on success, or negative errno on failure.
- */
-int devm_gpio_request(struct device *dev, unsigned gpio, const char *label)
-{
-	unsigned *dr;
-	int rc;
-
-	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
-	if (!dr)
-		return -ENOMEM;
-
-	rc = gpio_request(gpio, label);
-	if (rc) {
-		devres_free(dr);
-		return rc;
-	}
-
-	*dr = gpio;
-	devres_add(dev, dr);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(devm_gpio_request);
-
 /**
  * devm_gpio_request_one - request a single GPIO with initial setup
  * @dev: device to request for
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index d105a207eaa2..ff99ed76fdc3 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -85,7 +85,6 @@ static inline int gpio_to_irq(unsigned gpio)
 
 int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
 
-int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
 int devm_gpio_request_one(struct device *dev, unsigned gpio,
 			  unsigned long flags, const char *label);
 
@@ -163,13 +162,6 @@ static inline int gpio_to_irq(unsigned gpio)
 	return -EINVAL;
 }
 
-static inline int devm_gpio_request(struct device *dev, unsigned gpio,
-				    const char *label)
-{
-	WARN_ON(1);
-	return -EINVAL;
-}
-
 static inline int devm_gpio_request_one(struct device *dev, unsigned gpio,
 					unsigned long flags, const char *label)
 {
-- 
2.47.2


