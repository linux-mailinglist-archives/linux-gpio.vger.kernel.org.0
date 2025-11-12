Return-Path: <linux-gpio+bounces-28381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD96C51635
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 10:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB731189AA88
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 09:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D2C3019DF;
	Wed, 12 Nov 2025 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsgiZB22"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B0B2FD692;
	Wed, 12 Nov 2025 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940175; cv=none; b=bK+E21sOLiYCVKXrMOSDQfvWl7SUkxIZNuJcWneEvKJ30Kt+7/FheimZB4vt+f0FXtx+rwbspVFgWPrlzgvyQLukJU59h8mUH6m1Xk0cvB19eSkOPncUmDL0MHzQtSMX21xItVXOesZGnAUxxjauwh9ByzbZsqrt6QTaiMPVKlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940175; c=relaxed/simple;
	bh=3aC01PxJT6hpXIP2xTp42MaqEjs7pHBi/ivGasZ7OVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbZQ6iYXm6bkUw//LGPOJ1+dn0nqDNt6bxLX/CpFpgQXkcds6IPz4qthgXiNpn5dWLne429CKrFhr2eMuyAfH4pnNAgRl2qx0c7vi2i9FmXO8HcJvYdcB5kOUwq0pN7gu9QpFnouI49DsUUE9bLwlJSowOGPwUZ97t5g2EnlZWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsgiZB22; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762940174; x=1794476174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3aC01PxJT6hpXIP2xTp42MaqEjs7pHBi/ivGasZ7OVQ=;
  b=hsgiZB22fXfTBcKJMa8ikniILPz/UpIQw7gl8tI0omZYJySbVcbbjw4i
   dUQ8fv7aTKyRVkV1XBGxc88SAVvypfFrvt2t0yjXuJ2WkLEIJjaDxA3Ed
   aFzjNzkjOc057OvkjvjN0OV3u199dA0CHcvrH+r0g7u6g15bUe/40AbXA
   y1H8k7opumzMlMDJH6fxPfsoeY+c69K+zjr+JjrHTaH8RKiYvfTqr0buZ
   F+O1ssFP1H+n2p6YOsh2e5LheZd862gQt05aX6uxCg/wG50J2JrXtlsnx
   IMQt086kg/2kO/bv1JNjRI6Hf8XKtpjlz6pqof9XvqFHX2K2m1kPmvS24
   Q==;
X-CSE-ConnectionGUID: YgTitz7xSVq4am9T6tOl+A==
X-CSE-MsgGUID: xNMWjZjBSTOUdKj9gM9ymQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64202978"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="64202978"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 01:36:11 -0800
X-CSE-ConnectionGUID: 422QwXH6SKiyW95bX4XhtQ==
X-CSE-MsgGUID: zMYP91TZSN6waAmAcoRJbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="188811926"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 Nov 2025 01:36:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E060497; Wed, 12 Nov 2025 10:36:08 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 2/2] gpiolib: legacy: Allow to kill devm_gpio_request_one() independently
Date: Wed, 12 Nov 2025 10:32:02 +0100
Message-ID: <20251112093608.1481030-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251112093608.1481030-1-andriy.shevchenko@linux.intel.com>
References: <20251112093608.1481030-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow to kill devm_gpio_request_one() independently by converting it
to use legacy APIs that will be alive a bit longer.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-legacy.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index 35cb7fca634e..ef3f2ef30cf2 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -68,11 +68,9 @@ int gpio_request(unsigned gpio, const char *label)
 }
 EXPORT_SYMBOL_GPL(gpio_request);
 
-static void devm_gpio_release(struct device *dev, void *res)
+static void devm_gpio_release(void *gpio)
 {
-	unsigned *gpio = res;
-
-	gpio_free(*gpio);
+	gpio_free((unsigned)(unsigned long)gpio);
 }
 
 /**
@@ -90,22 +88,22 @@ static void devm_gpio_release(struct device *dev, void *res)
 int devm_gpio_request_one(struct device *dev, unsigned gpio,
 			  unsigned long flags, const char *label)
 {
-	unsigned *dr;
 	int rc;
 
-	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
-	if (!dr)
-		return -ENOMEM;
+	rc = gpio_request(gpio, label);
+	if (rc)
+		return rc;
+
+	if (flags & GPIOF_IN)
+		rc = gpio_direction_input(gpio);
+	else
+		rc = gpio_direction_output(gpio, !!(flags & GPIOF_OUT_INIT_HIGH));
 
-	rc = gpio_request_one(gpio, flags, label);
 	if (rc) {
-		devres_free(dr);
+		gpio_free(gpio);
 		return rc;
 	}
 
-	*dr = gpio;
-	devres_add(dev, dr);
-
-	return 0;
+	return devm_add_action_or_reset(dev, devm_gpio_release, (void *)(unsigned long)gpio);
 }
 EXPORT_SYMBOL_GPL(devm_gpio_request_one);
-- 
2.50.1


