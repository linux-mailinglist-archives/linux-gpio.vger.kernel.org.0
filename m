Return-Path: <linux-gpio+bounces-18842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31411A89B90
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 102D31891696
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A22291167;
	Tue, 15 Apr 2025 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOpDqypI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E0928DF17;
	Tue, 15 Apr 2025 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715493; cv=none; b=OZDh0b0NlnH7cOCHNpTDeF/IjhaP5aSHeNb7EitYBYVYbZko0CpxajBjYqV9HcFFkJd/DrFVabfzHDlD0OCIqsfxY349Z6m6WZEU3WpZCt+c9o6JzmbrMdmabyRoSkf8z2s+cm2IVR/Hi06zMYqladMj2xpti0sbzYcmmFeY+nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715493; c=relaxed/simple;
	bh=LjmqfPsWEcMdIat4tKcgJ54RpqfMMCi+Zo+oY6oUkzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sW1iu1wu3AIRgb0foNGcZByVh2LmKdzO1gro1J7JBaHn6a2TUZqrtPxoISzTeerC/UjlQxaPFlFlEI5cCvs+C1lXCtsrQMFrRgfUApdCcyl153IHFhBeqqfm9ConWhWUo+j4Um5STUqNsOSVjM7oMmzxm8y+p4TxtImVMzZL4Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOpDqypI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744715492; x=1776251492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LjmqfPsWEcMdIat4tKcgJ54RpqfMMCi+Zo+oY6oUkzM=;
  b=ZOpDqypIaVARjzrN4uQTo8DoplVKL9Qrryq56AYnuF8hheQdD2bTwvi2
   sC9dodQfIRz0pS6mscutmelj81DvmJjbFxxzCMaKAGo5pOwrcLA/b3WHT
   RcpIYTmH201wj9skhX9zEfIbbnFL9qoDv0N1EbdoZLkjz17gYOoUIIxV3
   4GxmzrrpaSFJhFmEqYK42zWZWLikGC3T4fA57FGOrLuzQ+mys2mPQZtC2
   IT0O/Dn2sGE7K47XxwTodouNL7qGJ2faJknbNZBNg00tYRFoj1UBpeJ1v
   Xc9e+PKfMX4rPHhapWtRZ00/L6sDpFhPikK+7RGJ++I0SS3a8TwOhDDaM
   w==;
X-CSE-ConnectionGUID: Gm5D0tOtRECsoTD4LbSqMw==
X-CSE-MsgGUID: iT8r3G+HSL23pFhWRROwLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46382943"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46382943"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 04:11:29 -0700
X-CSE-ConnectionGUID: ZpjttxKoTCmbpPzJfhiYvg==
X-CSE-MsgGUID: Mn0+ktS+TRC4ECXC1POJaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="135072303"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 15 Apr 2025 04:11:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B50F5AD4; Tue, 15 Apr 2025 14:11:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/7] gpiolib: Revert "Don't WARN on gpiod_put() for optional GPIO"
Date: Tue, 15 Apr 2025 14:10:01 +0300
Message-ID: <20250415111124.1539366-3-andriy.shevchenko@linux.intel.com>
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

No need to double check the pointer for NULL since gpiod_free()
is using VALIDATE_DESC_VOID() which simply returns in that case.

This reverts commit 1d7765ba15aca68f3bc52f59434c1c34855bbb54.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0089745b381f..8ea5ddf4704d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5156,8 +5156,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_optional);
  */
 void gpiod_put(struct gpio_desc *desc)
 {
-	if (desc)
-		gpiod_free(desc);
+	gpiod_free(desc);
 }
 EXPORT_SYMBOL_GPL(gpiod_put);
 
-- 
2.47.2


