Return-Path: <linux-gpio+bounces-18846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED210A89B98
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F12754405FB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F42291165;
	Tue, 15 Apr 2025 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fja75t5J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927AA28A1DE;
	Tue, 15 Apr 2025 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715560; cv=none; b=opUG7/vKNBESlr7iHQwFWL/KZc/8LpdisxQcbywe8PF648iURLzZt4a99/ljDsCt4wLIVW++oKNgd3Swb6AYG22H94mgo2ofV13Xb9vswESXZ69HXLGav4ZgW45q/wr3qcu3nXdVkNq1NNewsGUaRqfWFy/ZCxBR/MQK6wpR7jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715560; c=relaxed/simple;
	bh=tGluuzOIf4RSoAxttiEviz2AC2kBM+vtOzaXgge2A94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8G6Cm0CdavAlD3v5lY2KuUEayPr8MU0b2tI8zElRJpXBzN3RjdNF2C5zFguUS7gxZ6EalSR678T7stl1/82uSGcIBYmmx6rh8kZCllem1yau08k9dGENYXb586yFeb8egVKuTpF6XqYyRksPR8vva7oDrHATlGCfb01MdO2h5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fja75t5J; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744715559; x=1776251559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tGluuzOIf4RSoAxttiEviz2AC2kBM+vtOzaXgge2A94=;
  b=Fja75t5JiRQ6xMBo2EhsjjNlzCmDegKItrEGCpIYINs1UehpMl95WPJh
   ZxY1EiHiJGl8h4MmERpBZaMsSF8GgHEosWJVQSigr56TTQRlhWBRK/Cyl
   KmZsMqIGEgKNSGdKJOAI9nbx/YptcZTjr2/lThdQBLvQmn3B2OCF4qojE
   UYeR2JweV/tCab6ueFCGKEBcGruA2m3ZMF0Y0XDRK7XyH7vhRsD7e/X35
   uP6p7n5A++gPGNw5UzTjFQkbNQe5ssq8p3Q76JAeWZK1EBTsnXBBSN6NK
   QM0qgVdDU6oqT6v49nI5JXhfRQ7gqK+doOchavJyE4Uh+KNRAiEftYohK
   Q==;
X-CSE-ConnectionGUID: oJ2s/DuhQmOh6+89C03kQg==
X-CSE-MsgGUID: jCMJor+JQ6q4ncc86GiLyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57601862"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57601862"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 04:11:31 -0700
X-CSE-ConnectionGUID: 5W3I2lqvSguJd0gINyuGbw==
X-CSE-MsgGUID: dIXdQMf1SDCBbSaRcXY5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161071615"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 15 Apr 2025 04:11:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 01D50B53; Tue, 15 Apr 2025 14:11:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 7/7] gpiolib: Remove redundant assignment of return variable
Date: Tue, 15 Apr 2025 14:10:06 +0300
Message-ID: <20250415111124.1539366-8-andriy.shevchenko@linux.intel.com>
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

In some functions the returned variable is assigned to 0 and then
reassigned to the actual value. Remove redundant assignments.

In one case make it more clear that the assignment is not needed.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8d525e9d4319..cca987addc0e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1015,7 +1015,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	struct gpio_device *gdev;
 	unsigned int desc_index;
 	int base = 0;
-	int ret = 0;
+	int ret;
 
 	/* Only allow one set() and one set_multiple(). */
 	if ((gc->set && gc->set_rv) ||
@@ -1040,11 +1040,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
 
-	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
-	if (gdev->id < 0) {
-		ret = gdev->id;
+	ret = ida_alloc(&gpio_ida, GFP_KERNEL);
+	if (ret < 0)
 		goto err_free_gdev;
-	}
+	gdev->id = ret;
 
 	ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
 	if (ret)
@@ -3075,7 +3074,7 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
  */
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
-	int ret = 0;
+	int ret;
 
 	VALIDATE_DESC(desc);
 
@@ -3108,7 +3107,7 @@ EXPORT_SYMBOL_GPL(gpiod_enable_hw_timestamp_ns);
  */
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
-	int ret = 0;
+	int ret;
 
 	VALIDATE_DESC(desc);
 
-- 
2.47.2


