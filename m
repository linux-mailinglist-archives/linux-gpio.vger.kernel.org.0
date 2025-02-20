Return-Path: <linux-gpio+bounces-16333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C3A3E0B0
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 17:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06EB43AC24E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4854E20FA98;
	Thu, 20 Feb 2025 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ta6vj8K7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D060205E1A;
	Thu, 20 Feb 2025 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068571; cv=none; b=hZgU6fOZSmqiq0OWva6xRMNrfi0koc9vhZbjgxZTsmurf6pVH6Q/y14u1U8BJkjqFslcvs8GUOSnk9XaGaUt4PoffPRWOa3KZIHxQ3npxhB9hEtp8xXbcKAhA8vmRS1Fh/SdyvRDERzTqY5IG3PEi+LmAoHCrdWmssUkfl46lDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068571; c=relaxed/simple;
	bh=uFJOzNRpBJs4ZgU0El5Jll6c9b+JXEfrF2/5rB8rErk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiyrqzVkclRICayMdAr7FjlZ0icoq85+eaQen4AZu5jtV/72YvGAojPL62tT2CE+7AYyT3zpPTwLfm1Hzj7RMynHVlbERVodeLjN7tJtT/vfUjoRzkSieVp8z9MtzI8ICxsrUl57jRh+4QOxWJ7nWG6qEmzxy4N5vlWVMtsJqGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ta6vj8K7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740068570; x=1771604570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uFJOzNRpBJs4ZgU0El5Jll6c9b+JXEfrF2/5rB8rErk=;
  b=Ta6vj8K7xV7+tCXBYjTQgXQDpbOj/ND3uVaeyiM0wqUJ6Hu2nCYg13kU
   nr9EObD/7ApbTDWvIh4qgGJzJEKR6Rx8G5VYENuaQ+ruziKShjH+3NOTL
   jKnA8+8ksM1Bu22VmvezuIUoOuNwOv8njgc+3hvSYvqUwjaDH3VCU31aw
   2E9jHcC3MZkB5oXnlAXSJtArmtSzDSkdsc9deHaWkAthBgps1USIzIdwW
   uY9oSJ6JQYbx+rwltGzgZnQX9dOSfUs/hkKIS+r+IvAJS0MyWtGqC5C2P
   mBAHd9RNkHZdLB4zFDENOCY/j9J39j13FPgqjD0JdwjnEo9pkasObAbZS
   Q==;
X-CSE-ConnectionGUID: MQRKu7qYSuyqzt5KdIRhFw==
X-CSE-MsgGUID: l19djoqaSIeaR9+B0pRTKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40043975"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40043975"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:22:45 -0800
X-CSE-ConnectionGUID: Tt+VWLeWQnqEtxJ2MHDbMQ==
X-CSE-MsgGUID: YoqKOrm3S+O/RXoUFWC7Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115061338"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2025 08:22:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D651D4E8; Thu, 20 Feb 2025 18:22:40 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 3/3] gpiolib: devres: Finish the conversion to use devm_add_action()
Date: Thu, 20 Feb 2025 18:20:28 +0200
Message-ID: <20250220162238.2738038-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a recently added helper we can complete the conversion of
the GPIOLIB code to use devm_add_action() in all suitable cases.
So do this.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-devres.c | 90 ++++++++++-------------------------
 1 file changed, 25 insertions(+), 65 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 08205f355ceb..840d0ad7c5ba 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -6,7 +6,7 @@
  * Copyright (c) 2011 John Crispin <john@phrozen.org>
  */
 
-#include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/gfp.h>
@@ -19,32 +19,14 @@
 struct fwnode_handle;
 struct lock_class_key;
 
-static void devm_gpiod_release(struct device *dev, void *res)
+static void devm_gpiod_release(void *desc)
 {
-	struct gpio_desc **desc = res;
-
-	gpiod_put(*desc);
+	gpiod_put(desc);
 }
 
-static int devm_gpiod_match(struct device *dev, void *res, void *data)
+static void devm_gpiod_release_array(void *descs)
 {
-	struct gpio_desc **this = res, **gpio = data;
-
-	return *this == *gpio;
-}
-
-static void devm_gpiod_release_array(struct device *dev, void *res)
-{
-	struct gpio_descs **descs = res;
-
-	gpiod_put_array(*descs);
-}
-
-static int devm_gpiod_match_array(struct device *dev, void *res, void *data)
-{
-	struct gpio_descs **this = res, **gpios = data;
-
-	return *this == *gpios;
+	gpiod_put_array(descs);
 }
 
 /**
@@ -114,8 +96,8 @@ struct gpio_desc *__must_check devm_gpiod_get_index(struct device *dev,
 						    unsigned int idx,
 						    enum gpiod_flags flags)
 {
-	struct gpio_desc **dr;
 	struct gpio_desc *desc;
+	int ret;
 
 	desc = gpiod_get_index(dev, con_id, idx, flags);
 	if (IS_ERR(desc))
@@ -126,23 +108,16 @@ struct gpio_desc *__must_check devm_gpiod_get_index(struct device *dev,
 	 * already under resource management by this device.
 	 */
 	if (flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE) {
-		struct devres *dres;
+		bool dres;
 
-		dres = devres_find(dev, devm_gpiod_release,
-				   devm_gpiod_match, &desc);
+		dres = devm_is_action_added(dev, devm_gpiod_release, desc);
 		if (dres)
 			return desc;
 	}
 
-	dr = devres_alloc(devm_gpiod_release, sizeof(struct gpio_desc *),
-			  GFP_KERNEL);
-	if (!dr) {
-		gpiod_put(desc);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	*dr = desc;
-	devres_add(dev, dr);
+	ret = devm_add_action_or_reset(dev, devm_gpiod_release, desc);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return desc;
 }
@@ -171,22 +146,16 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 					      enum gpiod_flags flags,
 					      const char *label)
 {
-	struct gpio_desc **dr;
 	struct gpio_desc *desc;
-
-	dr = devres_alloc(devm_gpiod_release, sizeof(struct gpio_desc *),
-			  GFP_KERNEL);
-	if (!dr)
-		return ERR_PTR(-ENOMEM);
+	int ret;
 
 	desc = gpiod_find_and_request(dev, fwnode, con_id, index, flags, label, false);
-	if (IS_ERR(desc)) {
-		devres_free(dr);
+	if (IS_ERR(desc))
 		return desc;
-	}
 
-	*dr = desc;
-	devres_add(dev, dr);
+	ret = devm_add_action_or_reset(dev, devm_gpiod_release, desc);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return desc;
 }
@@ -244,22 +213,16 @@ struct gpio_descs *__must_check devm_gpiod_get_array(struct device *dev,
 						     const char *con_id,
 						     enum gpiod_flags flags)
 {
-	struct gpio_descs **dr;
 	struct gpio_descs *descs;
-
-	dr = devres_alloc(devm_gpiod_release_array,
-			  sizeof(struct gpio_descs *), GFP_KERNEL);
-	if (!dr)
-		return ERR_PTR(-ENOMEM);
+	int ret;
 
 	descs = gpiod_get_array(dev, con_id, flags);
-	if (IS_ERR(descs)) {
-		devres_free(dr);
+	if (IS_ERR(descs))
 		return descs;
-	}
 
-	*dr = descs;
-	devres_add(dev, dr);
+	ret = devm_add_action_or_reset(dev, devm_gpiod_release_array, descs);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return descs;
 }
@@ -307,8 +270,7 @@ EXPORT_SYMBOL_GPL(devm_gpiod_get_array_optional);
  */
 void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
 {
-	WARN_ON(devres_release(dev, devm_gpiod_release, devm_gpiod_match,
-		&desc));
+	devm_release_action(dev, devm_gpiod_release, desc);
 }
 EXPORT_SYMBOL_GPL(devm_gpiod_put);
 
@@ -321,20 +283,19 @@ EXPORT_SYMBOL_GPL(devm_gpiod_put);
  * you want to hand over lifecycle management of a descriptor to another
  * mechanism.
  */
-
 void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc)
 {
 	int ret;
 
 	if (IS_ERR_OR_NULL(desc))
 		return;
-	ret = devres_destroy(dev, devm_gpiod_release,
-			     devm_gpiod_match, &desc);
+
 	/*
 	 * If the GPIO descriptor is requested as nonexclusive, we
 	 * may call this function several times on the same descriptor
 	 * so it is OK if devres_destroy() returns -ENOENT.
 	 */
+	ret = devm_remove_action_nowarn(dev, devm_gpiod_release, desc);
 	if (ret == -ENOENT)
 		return;
 	/* Anything else we should warn about */
@@ -353,8 +314,7 @@ EXPORT_SYMBOL_GPL(devm_gpiod_unhinge);
  */
 void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs)
 {
-	WARN_ON(devres_release(dev, devm_gpiod_release_array,
-			       devm_gpiod_match_array, &descs));
+	devm_remove_action(dev, devm_gpiod_release_array, descs);
 }
 EXPORT_SYMBOL_GPL(devm_gpiod_put_array);
 
-- 
2.45.1.3035.g276e886db78b


