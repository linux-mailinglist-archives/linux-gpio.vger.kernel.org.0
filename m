Return-Path: <linux-gpio+bounces-12355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4189B7753
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 10:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEA9D1C22018
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 09:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3541F16C6A7;
	Thu, 31 Oct 2024 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjiNy1kr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BAE1BD9ED;
	Thu, 31 Oct 2024 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730366522; cv=none; b=EElJ9f8mKziRf8VVML0rKc11VdtAw/dmT7sVl4VmsnvuxI5eWS+qU2iRggxnKklbdnfJVVE+sARSUreVocIOktQEOupNFWPZUrV8xcY20Vql/Clz4OBC55kxcyjslML7ki4NxoVMw7xrIZOn/nI51hdRrGMTZ3dhsJzu3tp12pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730366522; c=relaxed/simple;
	bh=U/j3CAZqropvwP1pkKD1tu+cznu6YDmFDpja7HAzQVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEPXwRO/gjFCwNcPl/Qx3e6Ea2NqkZO7rwcAsFhls4/QAd9dhIoWlvHXWnqYz0duWclmjAj6P9uNlJrT35/dxLz3PE/09FqhXGUmMM7axF0OoLd5wJ5xNhgez5XBt3Km1PdS9h/eQcy4DWkgQFzgmanSzAHFLGwWUpqzgcnOgoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjiNy1kr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730366520; x=1761902520;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U/j3CAZqropvwP1pkKD1tu+cznu6YDmFDpja7HAzQVU=;
  b=EjiNy1kr8leE3+8y+ByZATcZXsv/bJHkAOpa1vBCCJi6u6FXdTXwAx+l
   34M5J/u7LPrq3LKz27o7opz/MZLqPbRH2XLwns/AYWQPz3h5TeRnvAzwP
   hgy+X5Z+i3rNq2FH1+VdWmnWeoEPW4hRkk5o3GaJo6dYBlFXWixTrX1JU
   5bnlw7tjwDJPzDhI0SyVEnqT02QfCEcdbt6urxK4l/uymUG5mQtA4cp3S
   op69Ynhq61TCRb4gmW9Hgu2sXs1J/oe/j1jxmVk1AJmxpwPXOpI/KlGDa
   Y/msDM0fqsymwpoH0VxoyV3p7EcKKuyYLkR6BVp7OGs28aVEwkhJiJ7aq
   Q==;
X-CSE-ConnectionGUID: NK5uFu6gSV+5dknlZc4b2Q==
X-CSE-MsgGUID: Y/pwq1uSQ+KN1kWla27/5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="40707928"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="40707928"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 02:21:59 -0700
X-CSE-ConnectionGUID: ee6LyIxQQxe2Rw4EAKSMkQ==
X-CSE-MsgGUID: wtesDcW4TYaxT/X8JUR45g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87166817"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2024 02:21:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 582E71C4; Thu, 31 Oct 2024 11:21:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpiolib: Deduplicate gpiod_direction_input_nonotify() call
Date: Thu, 31 Oct 2024 11:21:54 +0200
Message-ID: <20241031092154.2244728-1-andriy.shevchenko@linux.intel.com>
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
index 5666c462248c..9376dd270344 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2877,19 +2877,15 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
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
@@ -2901,15 +2897,17 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
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


