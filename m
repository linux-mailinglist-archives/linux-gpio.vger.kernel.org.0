Return-Path: <linux-gpio+bounces-16317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76109A3DC59
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94928174579
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23E81FBC82;
	Thu, 20 Feb 2025 14:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cA1q5pwE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C1C1FBC8A;
	Thu, 20 Feb 2025 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061014; cv=none; b=Ymun63+sB//dBvJxm/BGRdO9C4Cn/FD7f/ds7ptzL+ziRJh+DSLRSy/RIbNRdukvyig78mr0KCtgEr2Wc6qgG6xMMytN6xE+Dcje1e6A7QLrVztVX4VsIVui9SAt1cl+P6SvBloPJ6UxTGc7gRlpguhPdQUmYSyeYa0fVQfc8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061014; c=relaxed/simple;
	bh=BCPHQofhz8XenMJrxuntRs0xrbwKAGNHcAnYlTPse0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXJ9RI5uAdLP33t3/raod83UWDoTqO8NiSEe5PF4JP92PZRnGF5BPos52U0cnhWxFSqpbR+0T8Hp7s6WjFMWpHf/9TsDQ8cHQ2ZUve5iCaLq8BSJglGwRjWGmrKuNqaVfu2cV5CVKK5RGlhSeykl+49bmbOqe3yhPcEvR1Q+wLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cA1q5pwE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740061012; x=1771597012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BCPHQofhz8XenMJrxuntRs0xrbwKAGNHcAnYlTPse0c=;
  b=cA1q5pwEM+UUSn7gfjmloSiLWhGPRhaurAChJozjO8LDr3G5swUe7DlA
   qrAnz57Srwn8J4DVYFw25T9wvdYMzCQmj8mZAffa0RCL2jprwhAvYOtyZ
   mnTy1y5kgdUioEfPNZM0kRxnba7THRLMj9pypwONTorouu/Gogwx8TvsY
   yXbUTBc931lPOjLHAmqZpIdvBkocYxEaxn5tJjLROIkqIUtiVE/hCOPWn
   JyI4lHQ/P+/4anhDGvpLP0NlTlpcK/Dhhnr1vI7e0I6xY6zzPOElxD18x
   Aq+T+WKOF9zeUDtFrYEsAzPpjaDAPA6lQGsHe9Z6qv/5vX2S5kXS/chIw
   g==;
X-CSE-ConnectionGUID: +bymmNl1Re+U2WE0Uxo4RA==
X-CSE-MsgGUID: LUBPfYqVQxyZMGi3buiV8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51458095"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51458095"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:16:49 -0800
X-CSE-ConnectionGUID: Uegu/CWbRQW3/GgYMUBAIQ==
X-CSE-MsgGUID: 2CKV+PnaQE+xaWfHn6sIMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="114883161"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 20 Feb 2025 06:16:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 781174E8; Thu, 20 Feb 2025 16:16:46 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 4/4] gpiolib: devres: Finish the conversion to use devm_add_action()
Date: Thu, 20 Feb 2025 15:45:00 +0200
Message-ID: <20250220141645.2694039-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
References: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With new recently added helpers we can complete the conversion
of the gpiolib code to use devm_add_action() in all suitable cases.
So do this.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-devres.c | 94 ++++++++++-------------------------
 1 file changed, 25 insertions(+), 69 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 08205f355ceb..4338e21c9123 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
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
 
@@ -324,21 +286,16 @@ EXPORT_SYMBOL_GPL(devm_gpiod_put);
 
 void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc)
 {
-	int ret;
-
 	if (IS_ERR_OR_NULL(desc))
 		return;
-	ret = devres_destroy(dev, devm_gpiod_release,
-			     devm_gpiod_match, &desc);
+
 	/*
 	 * If the GPIO descriptor is requested as nonexclusive, we
 	 * may call this function several times on the same descriptor
 	 * so it is OK if devres_destroy() returns -ENOENT.
+	 * Anything else we should warn about.
 	 */
-	if (ret == -ENOENT)
-		return;
-	/* Anything else we should warn about */
-	WARN_ON(ret);
+	devm_remove_action_optional(dev, devm_gpiod_release, desc);
 }
 EXPORT_SYMBOL_GPL(devm_gpiod_unhinge);
 
@@ -353,8 +310,7 @@ EXPORT_SYMBOL_GPL(devm_gpiod_unhinge);
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


