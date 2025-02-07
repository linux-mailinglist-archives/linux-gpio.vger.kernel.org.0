Return-Path: <linux-gpio+bounces-15542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A70A2C69C
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 898BA16A81B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E411EB19B;
	Fri,  7 Feb 2025 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggDmtcAm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DCB238D2A;
	Fri,  7 Feb 2025 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941115; cv=none; b=ZpbBJ8kKnAcfeH8Tm6sqH7VnRDDkx3HMu4usWyaG1LXFFOl006vSNJjk+8KjdtPRT3cRmGhksCoWWAb8tBTeoKEqJHm0a+7ShHQN7g0pOnYVps2Qdxv+VS/SQs3WIMRjTJpyBS2OJvoWqeRciidsuNbMZJDmUqLVwYTyqVs+fiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941115; c=relaxed/simple;
	bh=ThnJYelAyD/24+XCZmw6arGXFsBrBIHKJODdjcHXUfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkPXxDEJtEovobXFQHC6oXp2BoE+Z2OCNAmOGA34Yhpef7rcLgzQRqPsysaUquPmjiQrDSH+B8MqzW1u3W0v9zh5T1WKp39a3dbHtOk/hWc410qRvnf7W4u5Ot96VxGetEp6zs73m1TUBVmxffKcOWON1sKYO2oeQbcjE0eLR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggDmtcAm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941114; x=1770477114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ThnJYelAyD/24+XCZmw6arGXFsBrBIHKJODdjcHXUfw=;
  b=ggDmtcAmyIA4rBieME+A3EJ4LMD+t6Pt1mZWp4OyuSgzF1QpT7u1nwpL
   7Y5ssnjqEDaTR1IwDnFMoNp0SfC0pbuaAxYBStSthTGetTqU/ewMtIu5z
   59F0cTCMUPcUsi0Td5YiBrEXvFI3JJT6bagsBLXDQQr9IMiO5XOMe/TbU
   Tm9t1xY/kccuwAGDqWA6OVCiDXe6EAEJAjHixXR8l8jUpD1TemICz/VrO
   oQxO9HN7TY7puNOdKa0ve9BRem3g7heyF0sbPFEMZxopaDrftmz+NWIhk
   bVOgo0uYwjk+QE1mWO+zgwvkwyLcf8dhUUZdLuDgPwYrt/Wdp8F2jUC/M
   A==;
X-CSE-ConnectionGUID: 5qJgNfWJS4Gv7/mfmv2Q9g==
X-CSE-MsgGUID: UOznrxQOTWy+KzSfHEAOjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57120802"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="57120802"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:11:53 -0800
X-CSE-ConnectionGUID: B+7Ylw0rRDiV3LEpswjoVg==
X-CSE-MsgGUID: 3ZqSQFRwTDKWFk4U4FmUOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111511665"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2025 07:11:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 45BA6428; Fri, 07 Feb 2025 17:11:50 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 3/3] gpiolib: Switch to use for_each_if() helper
Date: Fri,  7 Feb 2025 17:07:36 +0200
Message-ID: <20250207151149.2119765-4-andriy.shevchenko@linux.intel.com>
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

The for_each_*() APIs that are conditional can be written shorter and
less error prone with for_each_if() helper in use. Switch them to use
this helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index ae93f75170f2..a7e9c1d3df71 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -532,6 +532,7 @@ struct gpio_chip {
 
 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);
 
+#define for_each_if(condition) if (!(condition)) {} else
 
 struct _gpiochip_for_each_data {
 	const char **label;
@@ -561,7 +562,7 @@ DEFINE_CLASS(_gpiochip_for_each_data,
 	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i);			\
 	     _i < _size;								\
 	     _i++, kfree(_label), _label = NULL)					\
-		if (IS_ERR(_label = gpiochip_dup_line_label(_chip, _base + _i))) {} else
+		for_each_if(!IS_ERR(_label = gpiochip_dup_line_label(_chip, _base + _i)))
 
 /**
  * for_each_hwgpio - Iterates over all GPIOs for given chip.
@@ -583,7 +584,7 @@ DEFINE_CLASS(_gpiochip_for_each_data,
  */
 #define for_each_requested_gpio_in_range(_chip, _i, _base, _size, _label)		\
 	for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)			\
-		if (_label == NULL) {} else
+		for_each_if(_label)
 
 /* Iterates over all requested GPIO of the given @chip */
 #define for_each_requested_gpio(chip, i, label)						\
@@ -869,7 +870,7 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 
 #define for_each_gpiochip_node(dev, child)					\
 	device_for_each_child_node(dev, child)					\
-		if (!fwnode_property_present(child, "gpio-controller")) {} else
+		for_each_if(fwnode_property_present(child, "gpio-controller"))
 
 static inline unsigned int gpiochip_node_count(struct device *dev)
 {
-- 
2.43.0.rc1.1336.g36b5255a03ac


