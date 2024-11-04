Return-Path: <linux-gpio+bounces-12506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 256159BAFDB
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA082839A8
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21BF1B21BB;
	Mon,  4 Nov 2024 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdCINBMY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719B1AF0B2;
	Mon,  4 Nov 2024 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712986; cv=none; b=RxtPXvfuzU+SL6COgLUE+r1Q9ZWAFsqZkyEul+W3eJDQnWRsumyQ5D1MmNDmZOSaDaX4UIGtLc9uMAs3odLpf7fr/ztzHiyIzV1D4vYEzifWeRavmsLm4qI8UadBq0ZGSSLgpLMq/86+AM17ysHQfCFMsxqzoT7k8M6FWvysrKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712986; c=relaxed/simple;
	bh=hwe/b3t0fRSiOwM5LgSXyqtmSdkws0uscP6ALDCp0/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lH0FCKYZx2ifyo+uofDJv7qmKBZztHMo+s9MZGOOST5/CZqVooOWpFztERoDR0RN8H+0BJDPoN7YiAdYeK9ajGuehi+tQfShxgJGwjx6blM1zlrEjWtl6/H3Au76+q52CvgrSBsihv3nKMwrP06+yW+i/5Pbf1nMLVR4z/aj+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdCINBMY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712983; x=1762248983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hwe/b3t0fRSiOwM5LgSXyqtmSdkws0uscP6ALDCp0/s=;
  b=PdCINBMYVI5gsHEukFi79h89KZ4q5sfxSQWC4iTVuzAjfrmhMqHdBaEa
   9o2UEwAk+Y4SAjN4YdgsJO1LPhhkqce/SS97xa3czwWB3p2lzF306eGfk
   96UAvk589wJIQmmPaluOVqcOQ5Xl0eYQPTxtfrs497EtQtQgBtQHUpb0b
   fNuNakDhvMMLR1OKi68Wtvet10kVK384xTTQMyFKt7L2SC0vOBXYfUFFh
   vHmgA1SUoIOxyY9aYOVW8DktHHrqwVXFNaOdaTbQgEfNo9Q/WOL/TDYkQ
   Pc2NDeXzAotOM78J7bE0a0+O6g+TYdVoliAdav4svENT82UR2guiq7yjW
   Q==;
X-CSE-ConnectionGUID: 1BqkHAM0RROpjq5Vh/RHcQ==
X-CSE-MsgGUID: bJXvU7QpSCmIAdLEjJivpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30278788"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30278788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:21 -0800
X-CSE-ConnectionGUID: s9rewHwKS8eXCZpHso+clw==
X-CSE-MsgGUID: nJ4vzYBeTXunQESoKPaApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83481194"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 01:36:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DEBD7740; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 6/6] gpio: Get rid of GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:24 +0200
Message-ID: <20241104093609.156059-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-legacy.c | 3 ---
 include/linux/gpio.h          | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index 28f1046fb670..aeae6df8bec9 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -46,9 +46,6 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 	if (err)
 		return err;
 
-	if (flags & GPIOF_ACTIVE_LOW)
-		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-
 	if (flags & GPIOF_IN)
 		err = gpiod_direction_input(desc);
 	else
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 2d105be7bbc3..6270150f4e29 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -21,9 +21,6 @@ struct device;
 #define GPIOF_OUT_INIT_LOW	((0 << 0) | (0 << 1))
 #define GPIOF_OUT_INIT_HIGH	((0 << 0) | (1 << 1))
 
-/* Gpio pin is active-low */
-#define GPIOF_ACTIVE_LOW        (1 << 2)
-
 /**
  * struct gpio - a structure describing a GPIO with configuration
  * @gpio:	the GPIO number
-- 
2.43.0.rc1.1336.g36b5255a03ac


