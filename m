Return-Path: <linux-gpio+bounces-18943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3D9A8B637
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35D53171ACD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1DA2459E6;
	Wed, 16 Apr 2025 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9o4X4tO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0BF24502C;
	Wed, 16 Apr 2025 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797426; cv=none; b=TR3GrGtZLesFvNARk1ssh/bfwmhV5Ey9b27f14cO5sAwwAbZi9JKnBDy7VMUZzzEF5NgU+8rc5qIEsii1MyGTHEdiMjGnnrtD6Le5AyDlGaYBuV7QhrL00EEWC1LKmZeKzUB0NYJMJ5wBeuq8jpuC7MqztdlJNWeOPyjf0d+KAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797426; c=relaxed/simple;
	bh=IhlW6Wu/axGKaX+oNbFSThpIYklJNdJRYZAvQ7gbYRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8onnFFZ3pAlumb7ox1zigg5W8irEC9vk0kMH/UNeoAO6DJSJs1whKBrpZ2nngfg/lrAYIodE9sh0jl/4TMWeTiBpy4Drc+3U/W/7YT6dF91a8dboRpt6OaZI3caF4d02mAHCv6NvD7Ea9s0j5zs9zsWc2ivX++3qry1+agF/6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9o4X4tO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744797425; x=1776333425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IhlW6Wu/axGKaX+oNbFSThpIYklJNdJRYZAvQ7gbYRM=;
  b=l9o4X4tOXTd9Gu7J3wK7fRw0IJ/c5buwOAiF/v3GfR8xP9n6z1oBef8j
   2+CT+D9iUasKh9dG3iH0H0xxfnGOU1huTvqnSDPaMVTYyMecUl9JGiEMQ
   hnOGynhsibwvRUOl9x2dcTS1O5nrDx0cYIkeDKvD4O7/BdgFZf+s/Mw5o
   6KN+d8gzUKzBeBjPZwWBUQl0PNrUvlbMVuaL3cM7zCfJniIq6Tdj7MsR1
   8/r2+ma7oVqCaCkib93phlmbLiUeQFslGQWLAHE741iDTOg9kuoXZKfjm
   UgcXointAaCGxhmiLiSUMLhRwXJXYRkA3HplZH9fzlBfGiuAT2CLX9nFr
   Q==;
X-CSE-ConnectionGUID: xjl9qwioSM+4VJmTS1ubIQ==
X-CSE-MsgGUID: Ro9Wx6SCQDW6Gge3lJUqIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50144321"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="50144321"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:56:53 -0700
X-CSE-ConnectionGUID: YnZxj4g0TViZQhQ3EmCFQA==
X-CSE-MsgGUID: Jm0I/7j+ST+0IbGooQjPCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="135259321"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 16 Apr 2025 02:56:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2A409741; Wed, 16 Apr 2025 12:56:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 6/8] gpiolib: Call validate_desc() when VALIDATE_DESC() can't be used
Date: Wed, 16 Apr 2025 12:55:14 +0300
Message-ID: <20250416095645.2027695-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
References: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call validate_desc() directly when VALIDATE_DESC() can't be used.
It will print additional information useful for debugging.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ad2e68f66500..3f3371e427fd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -421,11 +421,8 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	unsigned int offset;
 	int ret;
 
-	/*
-	 * We cannot use VALIDATE_DESC() as we must not return 0 for a NULL
-	 * descriptor like we usually do.
-	 */
-	if (IS_ERR_OR_NULL(desc))
+	ret = validate_desc(desc, __func__);
+	if (ret <= 0)
 		return -EINVAL;
 
 	CLASS(gpio_chip_guard, guard)(desc);
@@ -3982,13 +3979,10 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	struct gpio_device *gdev;
 	struct gpio_chip *gc;
 	int offset;
+	int ret;
 
-	/*
-	 * Cannot VALIDATE_DESC() here as gpiod_to_irq() consumer semantics
-	 * requires this function to not return zero on an invalid descriptor
-	 * but rather a negative error number.
-	 */
-	if (IS_ERR_OR_NULL(desc))
+	ret = validate_desc(desc, __func__);
+	if (ret <= 0)
 		return -EINVAL;
 
 	gdev = desc->gdev;
-- 
2.47.2


