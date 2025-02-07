Return-Path: <linux-gpio+bounces-15541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6D5A2C69A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E4C165032
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8DD1EB18E;
	Fri,  7 Feb 2025 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S43s8UJe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B806A238D29;
	Fri,  7 Feb 2025 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941115; cv=none; b=D7oG5sp/p0JeRH9zAVcZAj6lnzV0S8oiiLJC+6kl0wBh1y4dMt5ut6WRmL/XKBPUWsuq4EPe0j0MDj968kxzzKVSXNrhHBeoRjSPppnvoHMFc+BKgbLA82usqOXW1gVatUy4MUkPYvtyQFisH8PzofhnbrP507GvvUlt4V80tx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941115; c=relaxed/simple;
	bh=tlKUSEgfkOWxUCWS9Kma7VNMHWLG4r8SidwahNgYw8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r552MTBBY0Qz4rBU2igA8HetGxb/vBSwkSS0vaTmOQyIZwBRxM2rBpDFM0Iyfh9hMruWaP6ElLECn/Bhf8ENNqcEA7fM655v03/8ciLtzwQ/im7hneDzua2zBNb2bcOmvLZyH5kg93Ut7HrIIlAfIwCJoMyfJ2TnaOggNXU6Sb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S43s8UJe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941113; x=1770477113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tlKUSEgfkOWxUCWS9Kma7VNMHWLG4r8SidwahNgYw8s=;
  b=S43s8UJeZJDL1k6gLgVgaiFo0L99Si2fkQaSMrTtZdZcChbhwNggkDbV
   5A/xOUoBoCc65n7us7WzKOmHQ3nLWaHlyNfzHKi241MPx9jemAfMfcfqE
   GoWLyD7Yax1z8KnpV2NEVEjNKQrAc8hmOkhEKlvvsbtvkrYZnxiviPJGX
   +MDIEsueW4dqEg1N7CHY/mUOsU7gtIrsIsTCGH+GJ7vVmse+g+K/fwMkt
   iXNA9G60O5mrBNS3iGNjElwZNGXPFyGP9yE28sZ6+jWqhONc3ECBwX1qu
   XuSqU32azlBJfxjExm1AeIoarcQyx03tvQz1ltJ2K8AbEA1+4TnR8ExYX
   Q==;
X-CSE-ConnectionGUID: tq4Hs5gvS+irNuS+V8ar4A==
X-CSE-MsgGUID: BRhMJC5vSP6UT65hFRXxxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39491581"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="39491581"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:11:53 -0800
X-CSE-ConnectionGUID: rzRxEP5vRMWjZHWnSkf11A==
X-CSE-MsgGUID: VIMm2EoXRyiybpNILX7A/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111395741"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 07 Feb 2025 07:11:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 306A1116; Fri, 07 Feb 2025 17:11:50 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/3] gpiolib: Deduplicate some code in for_each_requested_gpio_in_range()
Date: Fri,  7 Feb 2025 17:07:34 +0200
Message-ID: <20250207151149.2119765-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250207151149.2119765-1-andriy.shevchenko@linux.intel.com>
References: <20250207151149.2119765-1-andriy.shevchenko@linux.intel.com>
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
 include/linux/gpio/driver.h | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a307d8ed9c51..024112ef5a78 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -548,6 +548,23 @@ DEFINE_CLASS(_gpiochip_for_each_data,
 	     }),
 	     const char **label, int *i)
 
+/**
+ * for_each_hwgpio_in_range - Iterates over all GPIOs in a given range
+ * @_chip: Chip to iterate over.
+ * @_i: Loop counter.
+ * @_base: First GPIO in the ranger.
+ * @_size: Amount of GPIOs to check starting from @base.
+ * @_label: Place to store the address of the label if the GPIO is requested.
+ *          Set to NULL for unused GPIOs.
+ */
+#define for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)			\
+	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i);			\
+	     *_data.i < _size;								\
+	     (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL)			\
+		if (IS_ERR(*_data.label =						\
+			gpiochip_dup_line_label(_chip, _base + *_data.i))) {}		\
+		else
+
 /**
  * for_each_hwgpio - Iterates over all GPIOs for given chip.
  * @_chip: Chip to iterate over.
@@ -555,13 +572,8 @@ DEFINE_CLASS(_gpiochip_for_each_data,
  * @_label: Place to store the address of the label if the GPIO is requested.
  *          Set to NULL for unused GPIOs.
  */
-#define for_each_hwgpio(_chip, _i, _label) \
-	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
-	     *_data.i < _chip->ngpio; \
-	     (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL) \
-		if (IS_ERR(*_data.label = \
-			gpiochip_dup_line_label(_chip, *_data.i))) {} \
-		else
+#define for_each_hwgpio(_chip, _i, _label)						\
+	for_each_hwgpio_in_range(_chip, _i, 0, _chip->ngpio, _label)
 
 /**
  * for_each_requested_gpio_in_range - iterates over requested GPIOs in a given range
@@ -572,13 +584,8 @@ DEFINE_CLASS(_gpiochip_for_each_data,
  * @_label:	label of current GPIO
  */
 #define for_each_requested_gpio_in_range(_chip, _i, _base, _size, _label)		\
-	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i);			\
-	     *_data.i < _size;								\
-	     (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL)			\
-		if ((*_data.label =							\
-			gpiochip_dup_line_label(_chip, _base + *_data.i)) == NULL) {}	\
-		else if (IS_ERR(*_data.label)) {}					\
-		else
+	for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)			\
+		if (_label == NULL) {} else
 
 /* Iterates over all requested GPIO of the given @chip */
 #define for_each_requested_gpio(chip, i, label)						\
-- 
2.43.0.rc1.1336.g36b5255a03ac


