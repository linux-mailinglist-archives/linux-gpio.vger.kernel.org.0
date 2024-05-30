Return-Path: <linux-gpio+bounces-6982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4BB8D5221
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 21:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 199EA1C21CF3
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DC676026;
	Thu, 30 May 2024 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWxelvR3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159EB75811;
	Thu, 30 May 2024 19:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717096464; cv=none; b=A0CAatUUPyq4dW0S1Sb6f7jmE4Kq79cnI+EFzZjgcJtpSXCwVAJdajMLW1pGXYijqHFy2M6ThPvqhvGNoWKzhQutrNx/70nxE0/j4+Yp/w8eeAxJ1epYZ77vba6AFfz/VW2frqAIZKQcE53g1GoqWxePxfO8NyAer7fuYG1dU4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717096464; c=relaxed/simple;
	bh=OwLMnjpc9AQDv1GcWWb8PG176sszd4a1hNLH+QokR8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAmV+ZR0I1xCnLyk4jXbcEtqcccyBH9VSacJXxEbhgYv4K4NglW70R4byy6KAbclu6/jj6OUcd8hzrgGQbZDiijattsgP16xvqGrKCttpV37EVFxY46ZHgobHa5vyyfRjKwAK61quyGgaUTRCX30biWpOCeefvllgNB90iA6ZC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWxelvR3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717096464; x=1748632464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OwLMnjpc9AQDv1GcWWb8PG176sszd4a1hNLH+QokR8M=;
  b=BWxelvR3LnX+msamBzc8EQx3mGIpkNi4507rJ8nq1UUL8PMH7sOHex19
   lTcfoaiNFWmCUNvVQ8gXJ+CjS+ZLFME1V9FmoUUrYiaWNW4/9IdZOvh3k
   5ppKXLUx2ucGCEef3NQ//u5i4za4Ipsg/KmTW8I+4hCN3sQOFu12mcA8s
   Fv/gkYa9hbvuyJe1xDDs6HkT0KIxLphCXxm/OO4oKLQiuXgoWthlse/g0
   aq8oJ1qiZdIlYiksMFNyQrw+iTWjEP5MHxt3Cqhh0RGCt/Ba75UxV+fFp
   lARhZPaPdGloQ7tY0aIdSVCx/8JLxhunLQ5UKseZaXhnkaF7l/OB0sr5u
   g==;
X-CSE-ConnectionGUID: Vq+qyU5lQWa3sMcs6qsKlg==
X-CSE-MsgGUID: m6bOQ8t4RoatO8oLdhdyLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13779055"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13779055"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 12:14:23 -0700
X-CSE-ConnectionGUID: pVOnVVNTSKKiJaqgoy3boQ==
X-CSE-MsgGUID: PkD6iQuGTguIOUlItnNc8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40978618"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 30 May 2024 12:14:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A7A2B184; Thu, 30 May 2024 22:14:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] gpiolib: Return label, if set, for IRQ only line
Date: Thu, 30 May 2024 22:12:29 +0300
Message-ID: <20240530191418.1138003-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240530191418.1138003-1-andriy.shevchenko@linux.intel.com>
References: <20240530191418.1138003-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If line has been locked as IRQ without requesting,
still check its label and return it, if not NULL.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 73c9f99d141e..a6032b84ba98 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -107,16 +107,16 @@ const char *gpiod_get_label(struct gpio_desc *desc)
 	unsigned long flags;
 
 	flags = READ_ONCE(desc->flags);
-	if (test_bit(FLAG_USED_AS_IRQ, &flags) &&
-	    !test_bit(FLAG_REQUESTED, &flags))
-		return "interrupt";
-
-	if (!test_bit(FLAG_REQUESTED, &flags))
-		return NULL;
 
 	label = srcu_dereference_check(desc->label, &desc->gdev->desc_srcu,
 				srcu_read_lock_held(&desc->gdev->desc_srcu));
 
+	if (test_bit(FLAG_USED_AS_IRQ, &flags))
+		return label->str ?: "interrupt";
+
+	if (!test_bit(FLAG_REQUESTED, &flags))
+		return NULL;
+
 	return label->str;
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


