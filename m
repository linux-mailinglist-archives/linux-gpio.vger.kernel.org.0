Return-Path: <linux-gpio+bounces-18847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFFCA89B9E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 935FE19003C1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741C82918EE;
	Tue, 15 Apr 2025 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGI3ebsC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17BC28F53A;
	Tue, 15 Apr 2025 11:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715561; cv=none; b=REMkYe0Gdl39pxDov1wFN88mjXUb9ADHVxEdcs7mC6qlXF0CJz7l436RBaZo2lMHPEY6sfElz0ImM5zVZIc+ps2WJqnCZZbQpXgr+ndhe4/o3D8AMPA7QacOWjaTUQ/aAemueJ21Xx1O0XYLDEvRzudGI6VUHEwvgQ3kBEFj8UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715561; c=relaxed/simple;
	bh=yFDUH7vRo7zP7rsczdpfm1FLDJHRdQfsh5hGz0uSguA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOEe4p7IyPPL665tTguPGw5PXpTbD+99sQsEv+5y4jaFvUEL9oJn/k1A7KbykfhCg33V5kNccbV5Oon0jKwv4ViMaZUaRvGeZhN04ebhIaV90Z2raMV01jvL/tNCyTWTZMfaQIuSk5xFGoarQVtDHhTog5+26oZPYDNTCwcxO0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGI3ebsC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744715560; x=1776251560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yFDUH7vRo7zP7rsczdpfm1FLDJHRdQfsh5hGz0uSguA=;
  b=YGI3ebsCnFEI5LFDUHN7cAm/EEpBjwYNa3C4MV43xbiZ+ephu3a13Arv
   cqVBJm6sTx9G7LF9kxYz1hceT14yi6wCMFgnS2UVt5wuf94ybnFsoM+2o
   sZYkotDIWYRB0iwxNBSFPtkJ4ZFJrazrr231bGGCaxgIwYFts6Uvjpcg3
   YksTdbJCPWk94PVR9+80ixZ9wZAEnDWr00QiYEuLvPSdUnqKikPtQOZEd
   WWeslHvrMFqzXv3rGnwN4SdnOXj6R7eLdl2DtpjSEkbJ24lPQQKRwhttl
   eNa1zGuUyVCqasSl96JG+hSib6KfYai6W3m/w3I17581HrQDZKuZ6JDfG
   w==;
X-CSE-ConnectionGUID: VHZVVdp3Sju0x4tPTLUIkw==
X-CSE-MsgGUID: ZHSs6QYSTEqczsr1kfnExg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57601865"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57601865"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 04:11:31 -0700
X-CSE-ConnectionGUID: D/zrq4n4RXWpHz5nbWrL0w==
X-CSE-MsgGUID: lgerGfNVS5SXRdKCrn82oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161071616"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 15 Apr 2025 04:11:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E7BCFB48; Tue, 15 Apr 2025 14:11:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 6/7] gpiolib: Convert to use guard()() for gpio_machine_hogs_mutex
Date: Tue, 15 Apr 2025 14:10:05 +0300
Message-ID: <20250415111124.1539366-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses guard()()/scoped_guard() for the rest of the synchronisation
calls. Convert to use the same for gpio_machine_hogs_mutex.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cc12f274ccda..8d525e9d4319 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -916,14 +916,12 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
 {
 	struct gpiod_hog *hog;
 
-	mutex_lock(&gpio_machine_hogs_mutex);
+	guard(mutex)(&gpio_machine_hogs_mutex);
 
 	list_for_each_entry(hog, &gpio_machine_hogs, list) {
 		if (!strcmp(gc->label, hog->chip_label))
 			gpiochip_machine_hog(gc, hog);
 	}
-
-	mutex_unlock(&gpio_machine_hogs_mutex);
 }
 
 static void gpiochip_setup_devs(void)
@@ -4440,7 +4438,7 @@ void gpiod_add_hogs(struct gpiod_hog *hogs)
 {
 	struct gpiod_hog *hog;
 
-	mutex_lock(&gpio_machine_hogs_mutex);
+	guard(mutex)(&gpio_machine_hogs_mutex);
 
 	for (hog = &hogs[0]; hog->chip_label; hog++) {
 		list_add_tail(&hog->list, &gpio_machine_hogs);
@@ -4454,8 +4452,6 @@ void gpiod_add_hogs(struct gpiod_hog *hogs)
 		if (gdev)
 			gpiochip_machine_hog(gpio_device_get_chip(gdev), hog);
 	}
-
-	mutex_unlock(&gpio_machine_hogs_mutex);
 }
 EXPORT_SYMBOL_GPL(gpiod_add_hogs);
 
@@ -4463,10 +4459,10 @@ void gpiod_remove_hogs(struct gpiod_hog *hogs)
 {
 	struct gpiod_hog *hog;
 
-	mutex_lock(&gpio_machine_hogs_mutex);
+	guard(mutex)(&gpio_machine_hogs_mutex);
+
 	for (hog = &hogs[0]; hog->chip_label; hog++)
 		list_del(&hog->list);
-	mutex_unlock(&gpio_machine_hogs_mutex);
 }
 EXPORT_SYMBOL_GPL(gpiod_remove_hogs);
 
-- 
2.47.2


