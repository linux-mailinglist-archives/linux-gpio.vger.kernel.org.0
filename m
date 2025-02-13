Return-Path: <linux-gpio+bounces-15947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CEEA34D9F
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C73263A4A13
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BC2245AF8;
	Thu, 13 Feb 2025 18:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2oIPWI7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08853245027;
	Thu, 13 Feb 2025 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739471143; cv=none; b=pqz4clgsgSS10rPyeAkas+gEpCf4Wjeyw+WOGEPCgX7CQeb+4wYqV7ghOFuQmRyMII6svYjld3zc1lz1Fyt4nhSUq9gFNN3rf+Vt25Zza5YHuNCXKhtt6On1nQ1a4BhN0HLFYFYzOBLWYc2kf8ncguG2XK/A+kdODoNxvUDZvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739471143; c=relaxed/simple;
	bh=k7ua/KFoZaBYMvO6Q/O+0QUvgRzL0DRgto7N8H41V7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJwQroB7BMcU5VddR8WYGFMxbxRjPDnUhJiZaWLBtNK/huBijMHHe729MDhpCo0fF3RoSb3hchZUCR1zaIz2GtkusEYI/Xf1TXWO8XZPGAdqgKah2oY2qIoW5cBl1+3wkdTbC0IHoN8kZQ/kR2iH7gxXiWr16RHOSuKWzrF2bkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2oIPWI7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739471142; x=1771007142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k7ua/KFoZaBYMvO6Q/O+0QUvgRzL0DRgto7N8H41V7g=;
  b=H2oIPWI7BdB1XK9LnqzUZ4WP9U//+Lx/QzIrIQk5q3IOuxLWDWb/qQTS
   HIzEZzE9QnXmZho3UfHn4DNGdxk5r+mhkFpZa97qE2iain+9017WQe2Yi
   M14s4US5rhTr42K9jrz4SNb/oO6ceo/dvygNvwmry9DTi5JY7G2dOgiSv
   3d4RK+gzg8wD8qQO0/aYFZLUWS6b4tBTAYXf8nu6n/1HjBkLOTL77R09s
   sdPQTEJT6wgtXSUYQbfkyUN+HoSVd2dQIT6+f2wGtb3TpQJvphE7cGlc5
   xTmLTxCcgKU0KqzkuucIdgzlcvD0SRRrb7gvyCConIspf0gpG1U3NzMfr
   Q==;
X-CSE-ConnectionGUID: N+ZUfQGuR1ujI9DhJ+eNxQ==
X-CSE-MsgGUID: +qkUdcD0SiuEPDmnurJG2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51177657"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="51177657"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 10:25:35 -0800
X-CSE-ConnectionGUID: 2w/+92TyT6SEWaUrBCUo0A==
X-CSE-MsgGUID: O+bpjhxARyus70Sw3d5X/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113721778"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2025 10:25:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1BE642CA; Thu, 13 Feb 2025 20:25:29 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexandru Ardelean <aardelean@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/2] gpiolib: Switch to use for_each_if() helper
Date: Thu, 13 Feb 2025 20:24:01 +0200
Message-ID: <20250213182527.3092371-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
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
index ae93f75170f2..af046f7fd4f5 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -14,6 +14,7 @@
 #include <linux/property.h>
 #include <linux/spinlock_types.h>
 #include <linux/types.h>
+#include <linux/util_macros.h>
 
 #ifdef CONFIG_GENERIC_MSI_IRQ
 #include <asm/msi.h>
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
2.45.1.3035.g276e886db78b


