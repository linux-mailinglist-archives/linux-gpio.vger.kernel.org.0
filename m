Return-Path: <linux-gpio+bounces-6242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0F28C006D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 16:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33594B20986
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 14:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E4E86643;
	Wed,  8 May 2024 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVHZguV/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77108288C;
	Wed,  8 May 2024 14:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715179668; cv=none; b=YwLpuUX8q/DEgNUpgahq1URqiqLDARNsMu907+UvnWdb809IouJ1Hu6EP1k0xIZJ1RnfdekFX91H5sPU1m9GVLbm9Qh+E6cY2BbQO5QE1pPQCXIzKzvr+imuoQirx5OKETFK7ootwecy6Brt7Zb7ThLEZ2SqxdGtrmHJQo4cr1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715179668; c=relaxed/simple;
	bh=sTQc9TnfJ619YsREO/2k3bf7m0clS3X1O8y57w4C5e4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ym0akXiZ8S5GqW0+pq6Ts63hZDp/7ToRSXqf6jB3pMghDiQpvFENKe3n9t5SqjLZ17gRnmUWZ8RJxZCNIryXhdFdO1+rvOUMe0/WVr8SV3WhY7GvaKLN05cL2zq9jAypsItqFwdv3DJTehGxwWlo1SKVqZjkDjKOfpuNr9Y5L8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVHZguV/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715179667; x=1746715667;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sTQc9TnfJ619YsREO/2k3bf7m0clS3X1O8y57w4C5e4=;
  b=dVHZguV/dJklt2S/4lJ5zv+qi42SjNQt2mw5FVPxLT8Yg0JcfBZLk0yO
   H+xAhtqF2hnAnT4aLW6orPyczc2QYUHiapvrjFAUKQmZOg2f+VuREEXOx
   XFigKuNYh/r90uioZvhzHNYAhcl/gJzqTXIe070C7UoZZ49m18FxFPyEd
   uVQzs/TX6QfD4xA/BR04o559gaQPgdwfBgjf7UJNKVZBNDcqJwiWFxmzR
   69Pqyj++Y0ndDXOUr08mT2qrR4TePcT1Jf6esB2paet943pSN0JeKvAmt
   u55CaTSxkWuVob74HUtVOhItOn8G2pAdKgDKb2ttMo37p2ezXZ0kVundh
   w==;
X-CSE-ConnectionGUID: x1AkhCcaQhuXo7d0JSek+Q==
X-CSE-MsgGUID: bEeC0YnsRGW9gMhImTgkhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10980054"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="10980054"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 07:47:46 -0700
X-CSE-ConnectionGUID: j+0b/XKVTQGDmRNhhBuPtg==
X-CSE-MsgGUID: bot995rVT4i2ELIC7UNrfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="29426386"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2024 07:47:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6B8AA109; Wed, 08 May 2024 17:47:43 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpiolib: Return label, if set, for IRQ only line
Date: Wed,  8 May 2024 17:47:41 +0300
Message-ID: <20240508144741.1270912-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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
index db536ec9734d..1f1673552767 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -105,16 +105,16 @@ const char *gpiod_get_label(struct gpio_desc *desc)
 	unsigned long flags;
 
 	flags = READ_ONCE(desc->flags);
-	if (test_bit(FLAG_USED_AS_IRQ, &flags) &&
-	    !test_bit(FLAG_REQUESTED, &flags))
-		return "interrupt";
-
-	if (!test_bit(FLAG_REQUESTED, &flags))
-		return NULL;
 
 	label = srcu_dereference_check(desc->label, &desc->srcu,
 				       srcu_read_lock_held(&desc->srcu));
 
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


