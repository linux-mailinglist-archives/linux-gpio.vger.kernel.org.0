Return-Path: <linux-gpio+bounces-15337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76DCA27927
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 18:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B30E616735C
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 17:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FAF21661F;
	Tue,  4 Feb 2025 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZFqwf+O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0E2165F0;
	Tue,  4 Feb 2025 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738691813; cv=none; b=Q4a3WnpC56Hwnw3GT9ArRzwimuX8oMwY7DCvSoRMSbw7PBMV0/dEYBysEzd5pk2xY5xdWupHQdH9m/MBqY+E4MgxOuxT2tUaay6fGCGyRWf4Ec+2raXVVa6+0jff1xGW5h73aE0AOePM3/bAddqrFRxc2BkUoAGWeZJUqS1S7l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738691813; c=relaxed/simple;
	bh=os+3hBxBBvZezLXRRos7W5BQlNdLgSoMdG5iBvwTTRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dI6kD1yj974nTBB6sjC4nxJzMhdQrKczjDgDKz3rVvpy/pG1vDn+N/H3HGmPg7daRXLNPjs2t7ReXKBJeIZLvJpVU+EzUUdREIWCN+2KBlnRv2rtI9hZB+GRoZ8o5YX5Aw6uNgeLbEHfi2FKjsPuZ0qHsBzGWU+ZOyzgoBYBl9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZFqwf+O; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738691811; x=1770227811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=os+3hBxBBvZezLXRRos7W5BQlNdLgSoMdG5iBvwTTRM=;
  b=OZFqwf+OWkgjQM3O3d4LpYSy1bCXaH0abPHv0gP4trx9VdGBL5n4/Tcj
   ltLmiX8sjIauSr16t6rI74TCyu9DF6rl2WnGZTxiRK3UOSoe3NXvkGJ4R
   bXGXHsjWg4niATFzHanXsWYFEDQc+K4M5RzJkC91QB5MIs7o04nRzC+64
   ht4ujLwUyiIWq8wTVekp3MO9qkEjqvLncabpWM24JOcCnj8KOyxvI7QLs
   e+sWK8jNIrCl795ir9yzd7oHm+cow2Frm75avpTqiOVQVn9PimHxwMxci
   dr17Kvp3AJtiYmu3f2x5Wcde51OXNB0HRd90VkLEJCmzNdJf/qYmz8fIZ
   g==;
X-CSE-ConnectionGUID: Qbm+CRdXT+W5b1Kla2NWUw==
X-CSE-MsgGUID: y9gWv2RcRk2GD/yLLS6fYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56657268"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="56657268"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:56:51 -0800
X-CSE-ConnectionGUID: 3I++Kc1oSS6VMNUhqHqqkA==
X-CSE-MsgGUID: heL3TJtuRy6mXJxsokqWaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="111243209"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 04 Feb 2025 09:56:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 814EC353; Tue, 04 Feb 2025 19:56:47 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpiolib: Deduplicate gpiod_direction_input_nonotify() call
Date: Tue,  4 Feb 2025 19:56:46 +0200
Message-ID: <20250204175646.150577-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deduplicate gpiod_direction_input_nonotify() call in
gpiod_direction_output_nonotify() when emulating open-drain
or open-source behaviour. It also aligns the error check
approaches in set_output_value and set_output_flag labels.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index efad5e2f9a9e..bf0b67f41e2e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2872,19 +2872,15 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 		if (!ret)
 			goto set_output_value;
 		/* Emulate open drain by not actively driving the line high */
-		if (value) {
-			ret = gpiod_direction_input_nonotify(desc);
+		if (value)
 			goto set_output_flag;
-		}
 	} else if (test_bit(FLAG_OPEN_SOURCE, &flags)) {
 		ret = gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_SOURCE);
 		if (!ret)
 			goto set_output_value;
 		/* Emulate open source by not actively driving the line low */
-		if (!value) {
-			ret = gpiod_direction_input_nonotify(desc);
+		if (!value)
 			goto set_output_flag;
-		}
 	} else {
 		gpio_set_config(desc, PIN_CONFIG_DRIVE_PUSH_PULL);
 	}
@@ -2896,15 +2892,17 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 	return gpiod_direction_output_raw_commit(desc, value);
 
 set_output_flag:
+	ret = gpiod_direction_input_nonotify(desc);
+	if (ret)
+		return ret;
 	/*
 	 * When emulating open-source or open-drain functionalities by not
 	 * actively driving the line (setting mode to input) we still need to
 	 * set the IS_OUT flag or otherwise we won't be able to set the line
 	 * value anymore.
 	 */
-	if (ret == 0)
-		set_bit(FLAG_IS_OUT, &desc->flags);
-	return ret;
+	set_bit(FLAG_IS_OUT, &desc->flags);
+	return 0;
 }
 
 /**
-- 
2.43.0.rc1.1336.g36b5255a03ac


