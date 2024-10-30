Return-Path: <linux-gpio+bounces-12319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BAE9B6B31
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 18:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C71D8B21F9E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 17:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E94215018;
	Wed, 30 Oct 2024 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iwi08Bnl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF64213137;
	Wed, 30 Oct 2024 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730310102; cv=none; b=RcaOX9c4gBIudnTd16UKag475JmltvAqAKyxoM9g7beVThSi9OYiILJDwHKAV9zHgMEKoHHZEsYuNRewl3L/u5pCvZksWiLdXp0QjUnD2NFGQVv7mHMrpeuwjQCqJK1B20WjdKpjkgdOvy4HW38Ac+s2sbAIW71Z/+0yiJ/cAec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730310102; c=relaxed/simple;
	bh=Sk7QeQJBqRm7lp0O8mrPrd3CqBxyDXwSDhA0nmNfHt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwzrESoSv2/mvqbHizFpxwtUpYR90i2UMPHDihxwRi05+22g3CW8CNd0iya29Ak5MznRtU1cuIPxLey+O2lRiYBXq/yrSLyKLsiK9hdkJCrP+4CtCPyyI2LhaQc2qRFvRFwX1AeIWItxcN/Ps9VIsCm4DF5dEeYpFww/FN7c1P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iwi08Bnl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730310101; x=1761846101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sk7QeQJBqRm7lp0O8mrPrd3CqBxyDXwSDhA0nmNfHt4=;
  b=Iwi08BnlnifE/OqVG0v9Ma3m6nvoYTqDdYinZcXtI3Z4wp5M/oOQUmPd
   VM3r0ULqHA/B1xUg+S/kt+caj4f1AmzhvpWEJvKYKKg2y1jEbG0iTv9oI
   WW+t/B9SdaknKRy8LJVdqF3ovucdzEkmYlyufTUWOSH9T8Q8Fjwgy2ZO9
   fUDJKZMi86A87iqi66uRYHORLx5PqqiJcylw85rWJzkEJGQ2SZP3rj598
   6k8z3YQTBnRIW8aISIfnbNS83j7zlQSWMaA3BWlbdlrBjiz5ljXAGv/N6
   U9fq5uMaKBqwy4S1+5VdO7t3E1/jxg2VwKt1gxGkN6pmPzkP0KVN+oBKB
   Q==;
X-CSE-ConnectionGUID: e0moA1U4SkmIZe+UbYZulg==
X-CSE-MsgGUID: 5JxBkUHKTwq5Kd7MJMIusw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29446067"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="29446067"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 10:41:37 -0700
X-CSE-ConnectionGUID: L9ei8/SkQuSqPJxkD0u7iw==
X-CSE-MsgGUID: OsTdu+HRS42Jyf0JJdA/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="119846379"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2024 10:41:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3EBBA93; Wed, 30 Oct 2024 19:41:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/2] gpio: mpsse: Check for error code from devm_mutex_init() call
Date: Wed, 30 Oct 2024 19:36:51 +0200
Message-ID: <20241030174132.2113286-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241030174132.2113286-1-andriy.shevchenko@linux.intel.com>
References: <20241030174132.2113286-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if it's not critical, the avoidance of checking the error code
from devm_mutex_init() call today diminishes the point of using devm
variant of it. Tomorrow it may even leak something. Add the missed
check.

Fixes: c46a74ff05c0 ("gpio: add support for FTDI's MPSSE as GPIO")
Reviewed-by: Mary Strodl <mstrodl@csh.rit.edu>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mpsse.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 3ab6651d2226..9ef24449126a 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -430,8 +430,13 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 	if (err)
 		return err;
 
-	devm_mutex_init(dev, &priv->io_mutex);
-	devm_mutex_init(dev, &priv->irq_mutex);
+	err = devm_mutex_init(dev, &priv->io_mutex);
+	if (err)
+		return err;
+
+	err = devm_mutex_init(dev, &priv->irq_mutex);
+	if (err)
+		return err;
 
 	priv->gpio.label = devm_kasprintf(dev, GFP_KERNEL,
 					  "gpio-mpsse.%d.%d",
-- 
2.43.0.rc1.1336.g36b5255a03ac


