Return-Path: <linux-gpio+bounces-15338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA57BA2792A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 18:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89EFC1887ED6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 17:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C5B216E3B;
	Tue,  4 Feb 2025 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSXFLLg1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D430A2165FE;
	Tue,  4 Feb 2025 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738691825; cv=none; b=DMTwI9AigUiv3ljwlSsQf7Yw1OYbFp3Ba6tNXXK+LqUlbTxxZMX+q6WVRbrBkNr0kcWayqxA0Q0Ab1+crn38GLHG0XcW0ZEBNjW6+VazZqmBqiZmVsTMw3pN6bZcreFwuC6J9Ptgnmg3EvFjRAnRudAIn0XOJiTOn2TlrVfaLkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738691825; c=relaxed/simple;
	bh=1XxX20iSlyyJELFfLHxg8xyz52IkShrxCvKH0WZHkzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bfs4td/KQGzlXEd9DLPJehR+VzMwQNhZP8XVgKWhyG35dlwr0VwAJ7bQg9vLNSa3RxJJHmC/omq/2rwnXGP5uv+IoOpksMWqqRtlxL5tPLKHkopedd93P4UsZZZBk+BvfMBqccAT+bAXVWS21SpIdAf5QTOsFu/8Y1uH9zEcpk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSXFLLg1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738691823; x=1770227823;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1XxX20iSlyyJELFfLHxg8xyz52IkShrxCvKH0WZHkzs=;
  b=DSXFLLg1gxr86Lg76dwwlD6wcHpPiSwUNyJq3NeO59Cafi+xNkv5HXaM
   OIML3iQXjP9pWdrUQQgdOtqUl/A+AxCydzHIs8RwwCiTVaNVlHfQf2f/p
   zaTD7CBzsdnfjX7YOFiVxrOJHX6lNxwQY+LSMW01cuswfsIjSDglbQx5D
   e1ZArQDKnobwyDv74oXUJN2JfQRXkPKjhkK3K6LMNfzardtNp2ai4nh4H
   Xv1TtokXYix3u+2RhJwQHMT4IvI/6san/fWNpJXcfUpfBcqTyPPD7uPyV
   4c3wCSIwirhcvrhjdYspaRqV/GMtg2tZ4Auku/TVkfZgdCcxZRDTsLUx6
   g==;
X-CSE-ConnectionGUID: fcYAr7ARQDqRIyJGjLT0UQ==
X-CSE-MsgGUID: 6wESHCeUS1uhMnBp07x7zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50226398"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="50226398"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:57:03 -0800
X-CSE-ConnectionGUID: UePsaAhgQjqO3X2tEwsDHA==
X-CSE-MsgGUID: R5v2PqLASf6dlfed9HYmew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114721771"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2025 09:57:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1EE0C353; Tue, 04 Feb 2025 19:57:00 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpiolib: Deduplicate some code in for_each_requested_gpio_in_range()
Date: Tue,  4 Feb 2025 19:56:59 +0200
Message-ID: <20250204175659.150617-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor for_each_requested_gpio_in_range() to deduplicate some code
which is basically repeats the for_each_hwgpio(). In order to achieve
this, split the latter to two, for_each_hwgpio_in_range() and
for_each_hwgpio().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a307d8ed9c51..24890ecfa0fb 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -549,20 +549,25 @@ DEFINE_CLASS(_gpiochip_for_each_data,
 	     const char **label, int *i)
 
 /**
- * for_each_hwgpio - Iterates over all GPIOs for given chip.
+ * for_each_hwgpio_in_range - Iterates over all GPIOs in a given range
  * @_chip: Chip to iterate over.
  * @_i: Loop counter.
+ * @_base: First GPIO in the ranger.
+ * @_size: Amount of GPIOs to check starting from @base.
  * @_label: Place to store the address of the label if the GPIO is requested.
  *          Set to NULL for unused GPIOs.
  */
-#define for_each_hwgpio(_chip, _i, _label) \
+#define for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)			\
 	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
-	     *_data.i < _chip->ngpio; \
+	     *_data.i < _size;								\
 	     (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL) \
 		if (IS_ERR(*_data.label = \
-			gpiochip_dup_line_label(_chip, *_data.i))) {} \
+			gpiochip_dup_line_label(_chip, _base + *_data.i))) {}		\
 		else
 
+#define for_each_hwgpio(_chip, _i, _label)						\
+	for_each_hwgpio_in_range(_chip, _i, 0, _chip->ngpio, _label)
+
 /**
  * for_each_requested_gpio_in_range - iterates over requested GPIOs in a given range
  * @_chip:	the chip to query
@@ -572,12 +577,8 @@ DEFINE_CLASS(_gpiochip_for_each_data,
  * @_label:	label of current GPIO
  */
 #define for_each_requested_gpio_in_range(_chip, _i, _base, _size, _label)		\
-	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i);			\
-	     *_data.i < _size;								\
-	     (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL)			\
-		if ((*_data.label =							\
-			gpiochip_dup_line_label(_chip, _base + *_data.i)) == NULL) {}	\
-		else if (IS_ERR(*_data.label)) {}					\
+	for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)			\
+		if (*_data.label == NULL) {}						\
 		else
 
 /* Iterates over all requested GPIO of the given @chip */
-- 
2.43.0.rc1.1336.g36b5255a03ac


