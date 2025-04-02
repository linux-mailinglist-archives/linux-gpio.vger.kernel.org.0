Return-Path: <linux-gpio+bounces-18168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13713A78E2D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 14:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AC97170214
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 12:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C57238176;
	Wed,  2 Apr 2025 12:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSKjdZxu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79AE469D;
	Wed,  2 Apr 2025 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596464; cv=none; b=NrOlxAE1VYpxaECg8ujSQQxpkdy9Xv47rABiBpakPxOQnQBzIl26T7QnAuQcvRX7PTkCFFRCahd++eYXDjX8hL4WfhPLBHoijLaMohYj3Sa3ULL9prPe6KbmOEPXMX/8qVzGjw9KwRiQy0LfEWWj6mgLY/RDZfLbg3H0SlIXjAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596464; c=relaxed/simple;
	bh=1FTObWbeIUXNtJIQRCBuVnbBO7SkEM/tAKZW6uKJ7DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJaNlOtfVvwOn1VE5gZW8p93IdrYvGFs6wQFRCby/VBF/WQoSUJ8IEus6aFgXPLoH1Vpb8JWXD9u5lCNY2UqJKG9kgURs6QruDFmJK0rZpLqnYgPOflwCVM11ac/4UFLC0PbpPudklYPUwK1jodJAHup50g4gy58+H7/x6G1XfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSKjdZxu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743596463; x=1775132463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1FTObWbeIUXNtJIQRCBuVnbBO7SkEM/tAKZW6uKJ7DI=;
  b=nSKjdZxuKCy4GOPitrUr5Jyg3mQGZSqgfliquT25DnNXoLT4Sg/BCaY3
   /l2hneSOZ6fVFv2mr9P41t/N1nod7KjPHNu4cdhWqNHbQ+f5llW3vydLs
   S+Asuw5YUdJRdT010LYotBK4T1cG/GAbVYZju6o/j1hcSCu8GOwmRlDaw
   SqP5DnGx8QxE4l5BYrj/QKt32Xz9+y26fUb9qCxl17kdWdz0l93l6xssO
   H51mtvBwjIuesXxS0UQdxH4jg04c5B7+JVO2uqVa0MlaG7in2QkgfoCY/
   N7z6q974g9JyoZIWCLDrNDyC6EPPTrFJZrq+Rkn6Dsm0TiTy/jfjNWv+J
   w==;
X-CSE-ConnectionGUID: ktjRF9NMThqh3otJOnO0+Q==
X-CSE-MsgGUID: /0vCmN6XQ++il+mXFvu0Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="32561180"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="32561180"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:21:02 -0700
X-CSE-ConnectionGUID: eouO8ZIqSleNSNAqfmh9Kg==
X-CSE-MsgGUID: JhwR9rldQGyxDGEyFovqLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="131404535"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 02 Apr 2025 05:21:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 84F8F15C; Wed, 02 Apr 2025 15:20:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/2] gpiolib: of: Fix the choice for Ingenic NAND quirk
Date: Wed,  2 Apr 2025 15:20:00 +0300
Message-ID: <20250402122058.1517393-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com>
References: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ingenic NAND quirk has been added under CONFIG_LCD_HX8357 ifdeffery
which sounds quite wrong. Fix the choice for Ingenic NAND quirk
by wrapping it into own ifdeffery related to the respective driver.

Fixes: 3a7fd473bd5d ("mtd: rawnand: ingenic: move the GPIO quirk to gpiolib-of.c")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-of.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index eb667f8f1ead..8fff6fdfb4a1 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -193,6 +193,8 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 */
 		{ "himax,hx8357",	"gpios-reset",	false },
 		{ "himax,hx8369",	"gpios-reset",	false },
+#endif
+#if IS_ENABLED(CONFIG_MTD_NAND_JZ4780)
 		/*
 		 * The rb-gpios semantics was undocumented and qi,lb60 (along with
 		 * the ingenic driver) got it wrong. The active state encodes the
-- 
2.47.2


