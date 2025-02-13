Return-Path: <linux-gpio+bounces-15922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F23FA348A6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 16:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F226161229
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 15:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B1E1993B9;
	Thu, 13 Feb 2025 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g0fhdV0e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6B115665C;
	Thu, 13 Feb 2025 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462212; cv=none; b=RpPD+YB5EnKUQo3/rxWmH/2GJ0v2Sf+Td27Vqc/2ifclfKpfF0HrnV5YLwU3mZ3+8tAOLl+tVNVOHEQ8VGdLq+LLq7o+xy/BtuvXAroC+K7w8RxW1+hYtHjmQ2tD7UMQyTA79Mkbpl/zjpPr+AK+J1mDYwD2CtBvmJJ5qqCIs7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462212; c=relaxed/simple;
	bh=E2zcVwSQtV0+KKTxAXO2LtogKIrn2asDrLYGlKu2bCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CoXQu/S3XLymljT1ytPRdY7ttqGcBR/ieHnHWJgdkMVslePXQKhTLhzYDV/oxBGoSkHHpesm9FIVyi9Qz8DA6vnuhPoTwBzAEjLruh09wR8H5Wgy60+i0OOW/sR2GQf+32bCTkQDrCZ5OOOoVABbd5AOYHKk+L7rjFiuYPkuf0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g0fhdV0e; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739462211; x=1770998211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E2zcVwSQtV0+KKTxAXO2LtogKIrn2asDrLYGlKu2bCQ=;
  b=g0fhdV0exurxIXfJJEsBbRdHup0NMDJp6yZZRZm+0PGu5mOCcJxxVrR6
   edktM8qF8bkRP75uknnoRn31Fmpq86EiiVIpmQICKg3cZC0zHTyoIVNZT
   3+K55ecRyUtA9mRuOakVda6j5HjWjzp9IYpQQ4LkMLfnGE36Orr0PlAi/
   mLSfJHXsZ79wTzF21rUjzuiszsBUdsjbbisNVhn841PyQVAlM8bCOEdAa
   VeD9HbdFOZ+RxOepIX560oMeuAba63z4AQw1u9zdYxl2ccMPzB3fF2zgj
   PGZA4wA33gFnSI2P2VlT6ALIeLHPfnZ4jQeyalAsooxuZtQ5iIaVY4RER
   Q==;
X-CSE-ConnectionGUID: m8FxzEX8QQyUdDTvHtVZgg==
X-CSE-MsgGUID: IMCne5OsRNedMz39jPFL2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="44103098"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="44103098"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 07:56:50 -0800
X-CSE-ConnectionGUID: f+DYzeJmRnOU8LwDInMBSQ==
X-CSE-MsgGUID: DDdXkZocREa/v9L+7L82TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="144033254"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 13 Feb 2025 07:56:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2CBDC1F5; Thu, 13 Feb 2025 17:56:47 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpiolib: Fix crash on error in gpiochip_get_ngpios()
Date: Thu, 13 Feb 2025 17:56:46 +0200
Message-ID: <20250213155646.2882324-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpiochip_get_ngpios() uses chip_*() macros to print messages.
However these macros rely on gpiodev to be initialised and set,
which is not the case when called via bgpio_init(). In such a case
the printing messages will crash on NULL pointer dereference.
Replace chip_*() macros by the respective dev_*() ones to avoid
such crash.

Fixes: 55b2395e4e92 ("gpio: mmio: handle "ngpios" properly in bgpio_init()")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 98fba0c392ea..d6ebdb2f2e92 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -905,13 +905,13 @@ int gpiochip_get_ngpios(struct gpio_chip *gc, struct device *dev)
 	}
 
 	if (gc->ngpio == 0) {
-		chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
+		dev_err(dev, "tried to insert a GPIO chip with zero lines\n");
 		return -EINVAL;
 	}
 
 	if (gc->ngpio > FASTPATH_NGPIO)
-		chip_warn(gc, "line cnt %u is greater than fast path cnt %u\n",
-			gc->ngpio, FASTPATH_NGPIO);
+		dev_warn(dev, "line cnt %u is greater than fast path cnt %u\n",
+			 gc->ngpio, FASTPATH_NGPIO);
 
 	return 0;
 }
-- 
2.45.1.3035.g276e886db78b


