Return-Path: <linux-gpio+bounces-18939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59524A8B631
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D4F1900618
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBFC23F26A;
	Wed, 16 Apr 2025 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtrunQMv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46F5238D3B;
	Wed, 16 Apr 2025 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797415; cv=none; b=FzMCnU0Ycsm5u6JsJN8GS0MTcVxfv2w1M9WeyJWmb6K+QS2SdiNwqCbvOFAdlWs9kTr7jZYw3Z8CmMfsSXVrJzN/A8JQHT1+pY+5+P4tkTjvWP3qvvTyrrfj4GRtkh+F1SJamS0zkXVS6gGEveKOjZAWeUVFgUCibmCU4h7x+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797415; c=relaxed/simple;
	bh=gLZPBb6tb6Bvp+DJa0qiKRTWFJZiDmh1mf/1qkujX5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCSFs/sw9v60PkP3hjoVewefxC+Y0N2dJiRwGenbaU3XKxbgoJLbaCvN/lQMTRSrDtgca/HZ94xchqSKDeW4zf51RvmjGqGiPiFgb31do2tHS3qu6S5MGupLdQFQ0Z59+KBagObSAL60Pg3y2GnD0EPU8S1g914y17opuc9Lo0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtrunQMv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744797414; x=1776333414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gLZPBb6tb6Bvp+DJa0qiKRTWFJZiDmh1mf/1qkujX5k=;
  b=NtrunQMvOrEfhcnSoFc/MzjkAXXYJAcTy02quE0DASZE/clU1XEiJw0j
   1a6kLg0+kS+XtD9YouekgUvECsavNn1zCnrkBYMn9mgrZGfk6jI4FTWH9
   WAqwa79FFAAmM73MbR3KGFmO59wwf0tcc4bhvFsPwSlHWWzY2Qs/s8EAU
   kGRaqGvfhIEgtf2x4XVXTMv1tECcpbkq0jw4uX7OVollyxyyiIH5ILELH
   QukAeL8+3gbfsZyhpgeAFBm975GGA10LQg9G/mkTNJE6iPFZjdhKVcNdY
   kah0Udeo2EJQyDxraPrmFUyKcycg5289EGDvIlaty+U/+NOfyLu+0UJJI
   g==;
X-CSE-ConnectionGUID: ZKOdaeSyT/SkXIIepuwd2A==
X-CSE-MsgGUID: riVQAYtsSRWGVM6I8rYbxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63743647"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="63743647"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:56:52 -0700
X-CSE-ConnectionGUID: 4xBP6AaZQgqnJZzDvQ1BRA==
X-CSE-MsgGUID: KX3wyM63RrSyLnk3GOZE1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131323324"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 16 Apr 2025 02:56:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3FB288D1; Wed, 16 Apr 2025 12:56:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 8/8] gpiolib: Remove redundant assignment of return variable
Date: Wed, 16 Apr 2025 12:55:16 +0300
Message-ID: <20250416095645.2027695-9-andriy.shevchenko@linux.intel.com>
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

In some functions the returned variable is assigned to 0 and then
reassigned to the actual value. Remove redundant assignments.

In one case make it more clear that the assignment is not needed.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7a669218e42c..c787c9310e85 100644
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
@@ -3068,7 +3067,7 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
  */
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
-	int ret = 0;
+	int ret;
 
 	VALIDATE_DESC(desc);
 
@@ -3101,7 +3100,7 @@ EXPORT_SYMBOL_GPL(gpiod_enable_hw_timestamp_ns);
  */
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
-	int ret = 0;
+	int ret;
 
 	VALIDATE_DESC(desc);
 
-- 
2.47.2


