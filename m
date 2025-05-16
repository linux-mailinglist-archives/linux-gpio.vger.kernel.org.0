Return-Path: <linux-gpio+bounces-20250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89759AB9968
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 11:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25CD24E4260
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 09:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94F323182B;
	Fri, 16 May 2025 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hr6iignh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9132230BFF;
	Fri, 16 May 2025 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389203; cv=none; b=mXHtGldJi8xcTQD3JOHbPvBzL9zqKikxv/0BQpihOU8ENH8dWgTZGV+wezJ7t1SBsCR++C8obCyR9/rRhD3igFPwNnezE/byxEop0OXqIHy6hulSnnrhOIZseATTqxTsB/dYdATgpwogshCABm28t1KQK/mF1wfDyK6Tnl37UiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389203; c=relaxed/simple;
	bh=csnhmuPBMvbHmy4ivocukJqDYD46AL3QBOXgr7aDbJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HuXdaiMFjjdZ45NTLiT7JHROiFKra189K6pUuPCfpku5GH9uQTyt+0G9JpXw1aFxEtI2kw2MGUPlD4z/O2opAUs2u6LY5OKrqOxFjzrayUPM6xybTNFDvLOxjKemFtdx//PiJ+cmw54kJ4r0UZpGm+jWLGi6I/uACqFUhDIsXhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hr6iignh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747389202; x=1778925202;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=csnhmuPBMvbHmy4ivocukJqDYD46AL3QBOXgr7aDbJs=;
  b=Hr6iignhG/XfA7NB9Hr/nklAcil7H1rvamcTmo4xoLUSYWSJNAjsbSaB
   282AKOFzWJeeIfHEf/oCb+FKwQPpuoY8KCDAkyXqpndwQapczW0GJHtwJ
   /OzH/cAd+bfT6A7IBNNgRncgdqmOfu8IV7TxJgqp0UT94Hx4Xi/YEdJGf
   iqLeQtbZJe1QNgpCfxR6GdZBMX71NsWFys12UGNufqnVRLNaKuBmxyqJc
   Z6I2DOH4/iMJpnJ+zHaBIbYVkq+r6tEdCjJHbZvZ6rSCVA/00A6Y3M3FH
   HDQA15pMpQacTZIwSrQ51Bmugdle29yHG1fsPZAMazhv2g9LLa9tRGLgx
   g==;
X-CSE-ConnectionGUID: rC58i1ivRXemZET3zqXHfw==
X-CSE-MsgGUID: Rct6MJ3xToKs5fUeWTnvzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60693739"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="60693739"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:53:21 -0700
X-CSE-ConnectionGUID: evRQ209LQkSgZtAo94MheQ==
X-CSE-MsgGUID: B5U9kBc4RGKG9e2lP9j1ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139127901"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 16 May 2025 02:53:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C0F5B23F; Fri, 16 May 2025 12:53:16 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v1 1/1] gpiolib-acpi: Update file references in the Documentation and MAINTAINERS
Date: Fri, 16 May 2025 12:52:34 +0300
Message-ID: <20250516095306.3417798-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The recent changes in the gpiolib-acpi.c need also updates in the Documentation
and MAINTAINERS. Do the necessary changes here.

Fixes: babb541af627 ("gpiolib: acpi: Move quirks to a separate file")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20250516193436.09bdf8cc@canb.auug.org.au
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/driver-api/gpio/index.rst                    | 2 +-
 Documentation/translations/zh_CN/driver-api/gpio/index.rst | 2 +-
 MAINTAINERS                                                | 2 +-
 drivers/platform/x86/intel/int0002_vgpio.c                 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index 34b57cee3391..43f6a3afe10b 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -27,7 +27,7 @@ Core
 ACPI support
 ============
 
-.. kernel-doc:: drivers/gpio/gpiolib-acpi.c
+.. kernel-doc:: drivers/gpio/gpiolib-acpi-core.c
    :export:
 
 Device tree support
diff --git a/Documentation/translations/zh_CN/driver-api/gpio/index.rst b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
index e4d54724a1b5..f64a69f771ca 100644
--- a/Documentation/translations/zh_CN/driver-api/gpio/index.rst
+++ b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
@@ -42,7 +42,7 @@ ACPI支持
 
 该API在以下内核代码中:
 
-drivers/gpio/gpiolib-acpi.c
+drivers/gpio/gpiolib-acpi-core.c
 
 设备树支持
 ==========
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..d1290bbb6ac6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10105,7 +10105,7 @@ L:	linux-acpi@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
 F:	Documentation/firmware-guide/acpi/gpio-properties.rst
-F:	drivers/gpio/gpiolib-acpi.c
+F:	drivers/gpio/gpiolib-acpi-*.c
 F:	drivers/gpio/gpiolib-acpi.h
 
 GPIO AGGREGATOR
diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
index 3b48cd7a4075..b7b98343fdc6 100644
--- a/drivers/platform/x86/intel/int0002_vgpio.c
+++ b/drivers/platform/x86/intel/int0002_vgpio.c
@@ -23,7 +23,7 @@
  * ACPI mechanisms, this is not a real GPIO at all.
  *
  * This driver will bind to the INT0002 device, and register as a GPIO
- * controller, letting gpiolib-acpi.c call the _L02 handler as it would
+ * controller, letting gpiolib-acpi call the _L02 handler as it would
  * for a real GPIO controller.
  */
 
-- 
2.47.2


