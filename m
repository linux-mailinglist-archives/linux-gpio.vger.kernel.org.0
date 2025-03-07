Return-Path: <linux-gpio+bounces-17218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5790A55FE1
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 06:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BB0D3B3181
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 05:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2EF198E6F;
	Fri,  7 Mar 2025 05:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jffJaBvG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE406196C7B;
	Fri,  7 Mar 2025 05:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741324979; cv=none; b=Hf7jNAT6CRYeogiK5BTrdRhaOBHYVR1vgnKk554/QjIMnA+gApoWzYNaTlcyyRDsdZCVe5BozqkLOmWbySes9Kd+sgKtTkNYEcV7V7FjSrvbwQelhL3lG1G6ESOtTertQUXynN+ggelqFiSeVduLx+HWNWugaveAGYQIUohpbsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741324979; c=relaxed/simple;
	bh=VXAdkYmjkjtd/iVVlCqAfnvOuaPvFBMXREQn4tbP4bk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fTaF9iHg5nTJsL7nnJUvO5BJt51eaIZbUcBSwXhK8D7PsIBaJhICVqaFgS3+IjqTZJeuAAwfUhl0/CDpP4pRBdWeBTWNboRZST+CsHapV4/R6rzMTZAbqP0WnROt5cBceSMSLyg1+d0EA8FWRGFpKd8zWAHbyAhe0RbNDdIpbZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jffJaBvG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741324978; x=1772860978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VXAdkYmjkjtd/iVVlCqAfnvOuaPvFBMXREQn4tbP4bk=;
  b=jffJaBvGyPLimtnY3O4MA1EbMmHmI+tAbIaSgMBmpJ+6tdVLFhWSvwSv
   A962ySZw1+6lBGnCVJxnInCvJK0OBSX7whNMWCrFIv7LaqiK0yEEkvGsB
   tdSkcF+CAAoxfd7osJKANYS9DTgRCN8UnGYRF6XJ25HIPaFAFvrDBrVDb
   okfEaUH0kL6HOv96fZ/tgqXcjhagmV2zFnQ+LpVaWPg64mDlZK5r9FpXl
   I8RubhDRxatXh5lF3j5Wvdy0L0cLR1KhKAmn3c3lWBVj+m+hNjmekqC+m
   oQDfaYY2RUykDnyh4kpzykOXPP1G99lDum4LrVtRRJfa9uzaD15a9pw+u
   Q==;
X-CSE-ConnectionGUID: bhfjyUv/ShyObNu4WsM4sA==
X-CSE-MsgGUID: wkV5va8jQ3GSyAJ9VS3glw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46292947"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="46292947"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 21:22:57 -0800
X-CSE-ConnectionGUID: uQCtNXvCQgScJ20ODtNs2g==
X-CSE-MsgGUID: ICLIhZsLTNe9wl/tXOqACw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119232155"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2025 21:22:55 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 2/5] gpio: elkhartlake: depend on MFD_INTEL_EHL_PSE_GPIO
Date: Fri,  7 Mar 2025 10:52:28 +0530
Message-Id: <20250307052231.551737-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307052231.551737-1-raag.jadav@intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we have Intel MFD driver for PSE GPIO, depend on it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98b4d1633b25..232ef211ef38 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1372,7 +1372,7 @@ config HTC_EGPIO
 
 config GPIO_ELKHARTLAKE
 	tristate "Intel Elkhart Lake PSE GPIO support"
-	depends on X86 || COMPILE_TEST
+	depends on (X86 || COMPILE_TEST) && MFD_INTEL_EHL_PSE_GPIO
 	select GPIO_TANGIER
 	help
 	  Select this option to enable GPIO support for Intel Elkhart Lake
-- 
2.34.1


