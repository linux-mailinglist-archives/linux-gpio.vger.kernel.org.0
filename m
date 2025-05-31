Return-Path: <linux-gpio+bounces-20838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD3DAC9CE1
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 23:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A3F09E0C9B
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 21:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712E31DED78;
	Sat, 31 May 2025 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/xA0RzE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45761CCEE0;
	Sat, 31 May 2025 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726624; cv=none; b=apkNlaO8zfhGcNSm/wxfL33E3ZDFpECb1lLF6NILzGLFqHG5Xy2NVC/L3ks8vJLZs/cQKfCWyrX5sY6WVYmW0qHqMVVAz/y1N6RSsMR11U86vJF+Bey8vad6HVfzISdLxIhsIxS4noxIGovXu4jthl//oU+9pMVo1gAGA/79mxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726624; c=relaxed/simple;
	bh=409EzBnRZl7HCyBHlkiarMMZ5YH45JJDUcocJR01ODQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TbTV0wJ+y2b9k1mANr1/8B9r26X4dAhOvbkaZlr9XiVAGJ2eJxApXUGtdzMgYwclbQsTYN0+BaBQPP2lhK1zns8JABMyzE6l2f7FrScKLvuG/Bkol1N+T1SZ+1RWOYNOVYKO/SfD7HkYP8bUX3uH/wZrGvvMuzFMk+CONTW2NDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/xA0RzE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748726623; x=1780262623;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=409EzBnRZl7HCyBHlkiarMMZ5YH45JJDUcocJR01ODQ=;
  b=X/xA0RzEI10RUYQ078TJdEz2Io7ifskaMfqLjyUFbSJAdGkBNvNCu1+U
   zpmpJm6yXmVlba4Wnh8s0rKm/hvTYoxkuyVzdtGb8celu7rW/eL26zXfZ
   T540PObBmyYOQR/Zb1ov9Bz5gJpAlkct5ISf/kM8h6hGkBBvwGY7YTlYj
   RKZbPxzn/Desi0P1N4mRMViuBPSKfhifE36SaMNJk/iDRE7R/9QWDTMVr
   eZypr2YZgBUD6M9Os7N6o9ukudMsykIArtuEQd4fAQSAlsPUVrySKE+km
   9g66vyve2X0MK7kjTkcjCGFL+RPT+5GwDCBQD4ewcXiVSUHyAIDQbuzfx
   A==;
X-CSE-ConnectionGUID: jGaLmwAxRIuj75g691nbUA==
X-CSE-MsgGUID: jOrC6kBURKai5muZb9QXaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50941383"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50941383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 14:23:42 -0700
X-CSE-ConnectionGUID: btzh5O+XQRClxfZzyVkLNg==
X-CSE-MsgGUID: SmPlBnKISje07NJUeixbHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="149465595"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 31 May 2025 14:23:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5CA72202; Sun, 01 Jun 2025 00:23:35 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
Date: Sun,  1 Jun 2025 00:21:37 +0300
Message-ID: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_gpio_request() is used by a single driver. Replace it there and
kill the legacy API. Assumed to be routed via GPIO tree.

Andy Shevchenko (2):
  usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
  gpiolib: Remove unused devm_gpio_request()

 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/gpio/gpiolib-legacy.c                 | 38 -------------------
 drivers/usb/gadget/udc/pxa25x_udc.c           |  5 +--
 include/linux/gpio.h                          |  8 ----
 4 files changed, 2 insertions(+), 50 deletions(-)

-- 
2.47.2


