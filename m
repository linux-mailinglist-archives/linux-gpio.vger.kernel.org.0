Return-Path: <linux-gpio+bounces-6983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345948D5223
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 21:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 667581C22153
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954DD762D0;
	Thu, 30 May 2024 19:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DO4NWRG2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F77404A;
	Thu, 30 May 2024 19:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717096465; cv=none; b=SW9JUO3julmq412PuDzVLcMTCPBHaifQ3PzlDzcbBD/yzb+R9rizxKufoyI+tZQSs+O9MvinLBXOxkKurRwFcOrzFF4BuSDG2qRuYQgEwmhbJ2CV9fBLDtDNguXH8XNOvjSzNsk5tVwraUQXCB8w7VAG2zqCm9unHLZsoUx/IDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717096465; c=relaxed/simple;
	bh=bTZetfqb1NfzJHtwqCZfewEzdYTNjg6XvxSMuxbnkGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4W9Mj5wr2kzdF3izVEnXraQLL8eMpURhiou1f5ueFDbWYWNbaE1e4LtH/hpKb3y+3peI7g56CmWCvXDZynj1eYBSC/SxJCxZ9R3j84Lj9LX1+dZ1dPKYfUBEMh8YM8WNTfo35UzTn+GWVufktPp5KLKxbuova/RdrAnOEG6Szs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DO4NWRG2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717096463; x=1748632463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bTZetfqb1NfzJHtwqCZfewEzdYTNjg6XvxSMuxbnkGc=;
  b=DO4NWRG2xlPWOsLdlQwZjWVwfk/BaiG01MGk+oEf0D+H89Bu6AZoeyMB
   caCU1K6Bxn0793FAIxw3AmlKyL3JFIhN9wmVJr+KMOqXHKB3wOqUVlu+m
   +SoYPySxPP12ArcGgxD9so/7bI582snlg0bbNKVH58FibsRTOCPer6Err
   glI8WjeaQ3NPmyiOcIVz/utjB6AAeAhMFXI4D6S3/xfdEOte6pGEvZmG9
   rvEGEnud8y1I0H4rJHXl9G8XvwX7cstKg379XA6MiwQSMCEnWXhH3Y7NG
   EiakMI5WO/qjhi8mTOF9ZWldxY8KP6LwqQQpmE08INw/auVxqtdeY1plW
   w==;
X-CSE-ConnectionGUID: qs+WE00TRSuDYymwVHbIcQ==
X-CSE-MsgGUID: 1HMUi8svTLaMu83gz9CfmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13373173"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13373173"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 12:14:22 -0700
X-CSE-ConnectionGUID: WNpwOOQSQ2u3u49/nHmUzg==
X-CSE-MsgGUID: 5s+sYH/mQRu/+KUFg0QqsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40362460"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2024 12:14:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BB9A337D; Thu, 30 May 2024 22:14:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] gpiolib: Show more info for interrupt only lines in debugfs
Date: Thu, 30 May 2024 22:12:30 +0300
Message-ID: <20240530191418.1138003-3-andriy.shevchenko@linux.intel.com>
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

Show more info for interrupt only lines in debugfs. It's useful
to monitor the lines that have been never requested as GPIOs,
but IRQs.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a6032b84ba98..f3b2f5c4781d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4888,11 +4888,11 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 
 	for_each_gpio_desc(gc, desc) {
 		guard(srcu)(&desc->gdev->desc_srcu);
-		if (test_bit(FLAG_REQUESTED, &desc->flags)) {
+		is_irq = test_bit(FLAG_USED_AS_IRQ, &desc->flags);
+		if (is_irq || test_bit(FLAG_REQUESTED, &desc->flags)) {
 			gpiod_get_direction(desc);
 			is_out = test_bit(FLAG_IS_OUT, &desc->flags);
 			value = gpio_chip_get_value(gc, desc);
-			is_irq = test_bit(FLAG_USED_AS_IRQ, &desc->flags);
 			active_low = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
 			seq_printf(s, " gpio-%-3u (%-20.20s|%-20.20s) %s %s %s%s\n",
 				   gpio, desc->name ?: "", gpiod_get_label(desc),
-- 
2.43.0.rc1.1336.g36b5255a03ac


