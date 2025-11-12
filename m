Return-Path: <linux-gpio+bounces-28380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15335C5177F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 10:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 17D24500102
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 09:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C642FDC50;
	Wed, 12 Nov 2025 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6wHqnH2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A882FD7DD;
	Wed, 12 Nov 2025 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940174; cv=none; b=Ht89eu14NLJ7TOp5yQl2zNNIsYF/mp0hT4jA61leRcdOKwDVQup16MGUqDDmxsHo4U8RLFGodDDU/SKBc1VRa17OVI1ebP/e/KikATVTN5rHg+WeUaQhoT+etVPthZgsPEXx7PKNY61xzTsL4dMwfcV8v0ILG14mVf3PTDrR5E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940174; c=relaxed/simple;
	bh=mx9Ima/B0ec4E66CNMxCBK3p897o94WEvlWdsmCWLao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLyrXCdZ1AExbwSStEkMdwCd/1Ydpu5n50r6lLFU3TN/cJs5ON9Zv4gxuI4Pgz6Vnp5/Aeau9dUKu551h9z3shLI/gyIlyREbAlL0HynaOpbptf5uNb0Q9jI6gFTlymK7k4PjyiGBP/GbnpCh2nY7Uyf9wc8xukU24PwrW3RyxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6wHqnH2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762940172; x=1794476172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mx9Ima/B0ec4E66CNMxCBK3p897o94WEvlWdsmCWLao=;
  b=M6wHqnH2wMmzMC84QHIgX7ekkbQQJMKCNvPhoPMf7A/ZKmX5UVdpKQpG
   70ao/NzeR+8VctC/EA31mW5tpQS6W6n+zqgU+16DQIXGWm/qZcfF18gUj
   W6FEfzQWj4sso+cAMpjxq1nCsLWZ8QN+A0NsrQIXB01YRKPyDhrZDfDCp
   VQB00vNIuZIjnJLoFUMgy8r/7ievV4nrpI+F3mHDl/T89l/vmb3OGPZgz
   Yr1azrFSIbjn2k6Mj74GbKg0xMXWEpn9I0eRi/C+Rv9kgxWewHBXDexIa
   p/De6R/KHy9wMEix03ui6maEXQXlZMq6fn2D3B/CQiRA2HF4OkMRsoeCh
   A==;
X-CSE-ConnectionGUID: yZuUKak2TBeAgrZyEQL90Q==
X-CSE-MsgGUID: xOw3DCt7Q7GYXHtsMWvYog==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64922912"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64922912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 01:36:12 -0800
X-CSE-ConnectionGUID: 2Lc3ZthHR16brQuspgv1jw==
X-CSE-MsgGUID: GLMjDXAYT3mx6nDyRk5oew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="212574063"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2025 01:36:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DC56096; Wed, 12 Nov 2025 10:36:08 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/2] gpiolib: legacy: Make sure we kill gpio_request_one() first
Date: Wed, 12 Nov 2025 10:32:01 +0100
Message-ID: <20251112093608.1481030-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251112093608.1481030-1-andriy.shevchenko@linux.intel.com>
References: <20251112093608.1481030-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure we kill gpio_request_one() first by converting it to
use legacy APIs that will be alive a bit longer. In particular,
this also shows the code we will use in another function to make
it die independently.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-legacy.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index 3bc93ccadb5b..35cb7fca634e 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -34,30 +34,20 @@ EXPORT_SYMBOL_GPL(gpio_free);
  */
 int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 {
-	struct gpio_desc *desc;
 	int err;
 
-	/* Compatibility: assume unavailable "valid" GPIOs will appear later */
-	desc = gpio_to_desc(gpio);
-	if (!desc)
-		return -EPROBE_DEFER;
-
-	err = gpiod_request(desc, label);
+	err = gpio_request(gpio, label);
 	if (err)
 		return err;
 
 	if (flags & GPIOF_IN)
-		err = gpiod_direction_input(desc);
+		err = gpio_direction_input(gpio);
 	else
-		err = gpiod_direction_output_raw(desc, !!(flags & GPIOF_OUT_INIT_HIGH));
+		err = gpio_direction_output(gpio, !!(flags & GPIOF_OUT_INIT_HIGH));
 
 	if (err)
-		goto free_gpio;
+		gpio_free(gpio);
 
-	return 0;
-
- free_gpio:
-	gpiod_free(desc);
 	return err;
 }
 EXPORT_SYMBOL_GPL(gpio_request_one);
-- 
2.50.1


