Return-Path: <linux-gpio+bounces-18840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A900A89B8B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 045421897D04
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EDA28F527;
	Tue, 15 Apr 2025 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEkG4SUe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA9E4594A;
	Tue, 15 Apr 2025 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715491; cv=none; b=Z3HzCqW2Q6YFELJuqlmy6K3ViEar3yzuK6q4y6rdNrQ/23Yi+be/h5l2zC9wneQrzWNOloJQkcal9f/QC3jbtcwXLpzROIByLOBPmSt2dKC6Gg1j93vWubunRk/IIzIXgSk+2RdiKZknWuy38w0McHSIcmKvWYhwfnStYq3WGnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715491; c=relaxed/simple;
	bh=5O+TWwoTGF0fOCQ4q3zxi3Zh2dtvprSSI8FzJtxkkmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVpQnaBVgJUXAIij3v7wkFmElIEOJgJiPreH1oBhYih+0FhRFqg0D1xGrS+3ZTzUPhXCUdnKTanaXJIlluAlWvi0U2QCSbdXdx35aBht0iQJbmKj7OSbCwiYYcLkt/LZR+ZZlxIH/VYDIVghB8gfDc/6MSyQxzP3fHOrvTwKQwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEkG4SUe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744715489; x=1776251489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5O+TWwoTGF0fOCQ4q3zxi3Zh2dtvprSSI8FzJtxkkmY=;
  b=SEkG4SUe/LGzd7mNXEtv3HR3ueyBJQO9EYTdciO91YZFKlDClS3aunWu
   Uke+MwaCsokAxISuMzIwu5bXARghtP9wX0hWsgMO9fmYFYR0HbgtkRdMV
   Pwwy8oBZRoE0Sy2A2jUgPKF4zNJH2UpMrisQ+snGELDqTgfh7JXextIPR
   sAV7QBvRY5e0Ig46pMYKqVad9sRPezX1EvNfN9Ei1F/6RLHJGzZrWpnkO
   iOjTv1SAikOvjiq6VJ0G1QUzWbT+pOCmx4aqpiw6dyhddzOXyDpJOSTIh
   TAfgAMXkD2wqI68HGjRmqBnpI/ULuKjA8+Ecs3jUY6V6Nib/EvaNDH3H6
   w==;
X-CSE-ConnectionGUID: ju8KkC9LS/SiecPNz6Gceg==
X-CSE-MsgGUID: nDgbRDRtTHO3+gj/xZHxqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46382936"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46382936"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 04:11:28 -0700
X-CSE-ConnectionGUID: 4MJ2KOshSaCtMl0ZXtTbSA==
X-CSE-MsgGUID: 3wrXVwMMR1CnKgAVfRiPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="135072301"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 15 Apr 2025 04:11:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CC7FAB0A; Tue, 15 Apr 2025 14:11:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/7] gpiolib: Call validate_desc() when VALIDATE_DESC() can't be used
Date: Tue, 15 Apr 2025 14:10:03 +0300
Message-ID: <20250415111124.1539366-5-andriy.shevchenko@linux.intel.com>
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

Call validate_desc() directly when VALIDATE_DESC() can't be used.
It will print additional information useful for debugging.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1fdf4d2ceb36..6b307144e41a 100644
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
@@ -3992,13 +3989,10 @@ int gpiod_to_irq(const struct gpio_desc *desc)
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
@@ -4010,13 +4004,12 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 
 	offset = gpio_chip_hwgpio(desc);
 	if (gc->to_irq) {
-		int retirq = gc->to_irq(gc, offset);
+		ret = gc->to_irq(gc, offset);
+		if (ret)
+			return ret;
 
 		/* Zero means NO_IRQ */
-		if (!retirq)
-			return -ENXIO;
-
-		return retirq;
+		return -ENXIO;
 	}
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 	if (gc->irq.chip) {
-- 
2.47.2


