Return-Path: <linux-gpio+bounces-18935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 675FEA8B629
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ECB65A26A5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91DC238142;
	Wed, 16 Apr 2025 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePr4+aqV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC7220693;
	Wed, 16 Apr 2025 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797411; cv=none; b=F333oORO/kanAQbo7AStlaiTC/TflfeDGpx3zb7r6GBlyI6O5gMPtf9D4IDJ0Lo1c8qiQK6mXK/xCKy34z9NwfgYWxT/6arW790J3IkL9PTGP830IBiWLtkhMbyqRqA4sYjDWqAERRukunoRg15QZyKgTpcVa0YEVkdNSC8uNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797411; c=relaxed/simple;
	bh=jM3zMslPPIXuVTKq8981oZBoABPe9Aim2U0yoP3KeMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBjJ20zOvfVGs/MoiRCrioJ0sansbFED4XWZufWkx17LSHPIJKGJn6CzVzMlAcuYHLbGoIZ0sW+PrE4QbUWxPndGNZIMZRlYeqp6XElBstE1E7TJeByHNbrLVq1x9y8APdL5l5yTCE1ZDghueeoqR3I12VSr1GvFXvB8plFtSw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePr4+aqV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744797410; x=1776333410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jM3zMslPPIXuVTKq8981oZBoABPe9Aim2U0yoP3KeMM=;
  b=ePr4+aqV/eIelPTvCPVJKUplhOV3evfvtepdxkx0eYisExggsPZ22p+P
   2og17Rpv7khod7Tlh5BMbw3YMknBsWfAvnbE+iyaX6J5qBUIiNx1cUysY
   gOpPl5BTbKDLotYQigzWTSzE9QKuuP0CxZGaSUzu7s6/YEfM9I3UH79eN
   kvFlTtH8yun7fN7n1zYWLLMvUoA0j/v6fW9ujmnPvXuwt9LQ6T1OO3O4C
   U3VHFp6O6TDL7KyJnc6gxDLSmgjuD5xwm3fFXiwHtjH0msEHy+NcfMJIJ
   YrcXvbnb6dHurlwDjRIt4DRQSJerrnKLGzOR7s8Bp7R8+hS6x3zjhcINi
   Q==;
X-CSE-ConnectionGUID: e0xVhAczQuyMVfHPTc3P9w==
X-CSE-MsgGUID: 2HecljEiQXyK+XlXiKn9Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63743631"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="63743631"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:56:49 -0700
X-CSE-ConnectionGUID: 5AZSd5pXQP+Sterdh35KGQ==
X-CSE-MsgGUID: xJt+oloqQVels8WV3F4SIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131323318"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 16 Apr 2025 02:56:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F0F8522A; Wed, 16 Apr 2025 12:56:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/8] gpiolib: Convert to use guard()() for gpio_machine_hogs_mutex
Date: Wed, 16 Apr 2025 12:55:10 +0300
Message-ID: <20250416095645.2027695-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
References: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses guard()()/scoped_guard() for the rest of the synchronisation
calls. Convert to use the same for gpio_machine_hogs_mutex.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7d9cc1a9c535..d6a161dd737d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -888,14 +888,12 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
 {
 	struct gpiod_hog *hog;
 
-	mutex_lock(&gpio_machine_hogs_mutex);
+	guard(mutex)(&gpio_machine_hogs_mutex);
 
 	list_for_each_entry(hog, &gpio_machine_hogs, list) {
 		if (!strcmp(gc->label, hog->chip_label))
 			gpiochip_machine_hog(gc, hog);
 	}
-
-	mutex_unlock(&gpio_machine_hogs_mutex);
 }
 
 static void gpiochip_setup_devs(void)
@@ -4439,7 +4437,7 @@ void gpiod_add_hogs(struct gpiod_hog *hogs)
 {
 	struct gpiod_hog *hog;
 
-	mutex_lock(&gpio_machine_hogs_mutex);
+	guard(mutex)(&gpio_machine_hogs_mutex);
 
 	for (hog = &hogs[0]; hog->chip_label; hog++) {
 		list_add_tail(&hog->list, &gpio_machine_hogs);
@@ -4453,8 +4451,6 @@ void gpiod_add_hogs(struct gpiod_hog *hogs)
 		if (gdev)
 			gpiochip_machine_hog(gpio_device_get_chip(gdev), hog);
 	}
-
-	mutex_unlock(&gpio_machine_hogs_mutex);
 }
 EXPORT_SYMBOL_GPL(gpiod_add_hogs);
 
@@ -4462,10 +4458,10 @@ void gpiod_remove_hogs(struct gpiod_hog *hogs)
 {
 	struct gpiod_hog *hog;
 
-	mutex_lock(&gpio_machine_hogs_mutex);
+	guard(mutex)(&gpio_machine_hogs_mutex);
+
 	for (hog = &hogs[0]; hog->chip_label; hog++)
 		list_del(&hog->list);
-	mutex_unlock(&gpio_machine_hogs_mutex);
 }
 EXPORT_SYMBOL_GPL(gpiod_remove_hogs);
 
-- 
2.47.2


