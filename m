Return-Path: <linux-gpio+bounces-11638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0618A9A403B
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4BC51F2994D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87142038A6;
	Fri, 18 Oct 2024 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOz9Rrwa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF770202F65;
	Fri, 18 Oct 2024 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258899; cv=none; b=TGEv4TXV40WCFffHjkTkvFtnAquQtAzffe/hK8a3KpUPPL3asUK0s50ask5iMpm7Vz4JEVtTc6K008IuMeo7piQQjSyoukcAqboeRVW/3f+2Vkvnscz5V7+F0M/HJJvMdYV8HwLjRYWC3QNBLGa+BOcukauEtV3Vw4tVZuWOwuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258899; c=relaxed/simple;
	bh=EYNNF+5aJRFe9/tUlCRhCAsCUJZjtEJ1sW7ZwuGiSQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVGDFHjL4dnQNrZ2WQm0SfLI8FZn/4WPdwa877DfBufh8mIARDOwVbYSCaE9Ko5ZrfmFvTTbL16ghAMp77w+Lv9Z5WXRYB4VItAw1nm0/G4jqVVOIKvTl6G9bRIwaQgPNCFtqJXYBS6Jpq0MwDu9z2ujQ7lgTrnie62/IVqRh+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOz9Rrwa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729258897; x=1760794897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EYNNF+5aJRFe9/tUlCRhCAsCUJZjtEJ1sW7ZwuGiSQU=;
  b=YOz9Rrwa/JeY56fLKrag+kwG2r/kBtOHdeJ1dcipLCOyJRuErge9KXhF
   8C+3rBqpoOurHf7qJmYwuRKO9yFAsoyi5r5Usd4MNwUqhgFnx5VgT9nQh
   mhr9YnJNUF7Idq0oOG0OoB80QYUx9XUoEE1BZ2pSrPa0p/qXNxfyPz4/J
   HRpgkqZ23H8dWPf0PyvK+d7TjCrblld3b56JJWGz8kIpWWg55Q46AzLR+
   jLeyV6Wyoi6hN/t9sSmU+8CeXaIiLkp36v2bgCghJBtYGkbTvLlL7NrBO
   I5yE4H2deyZgS+S5K1W+7ZmJ/okLPTGFYBW7+r88VtK5vdAyEhzLUzFGq
   Q==;
X-CSE-ConnectionGUID: y6sjlCbzRNylONXQ8qBpCQ==
X-CSE-MsgGUID: +1aueQgDSlK66k7fExfGLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28251458"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28251458"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:41:33 -0700
X-CSE-ConnectionGUID: Df6Dh2ONTayY881pcVzUEQ==
X-CSE-MsgGUID: UuOCaxT0S32+i1Gn8ngs+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83935282"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2024 06:41:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1BF8B503; Fri, 18 Oct 2024 16:41:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 2/4] gpio: xgene-sb: don't use "proxy" headers
Date: Fri, 18 Oct 2024 16:32:33 +0300
Message-ID: <20241018134129.2058068-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241018134129.2058068-1-andriy.shevchenko@linux.intel.com>
References: <20241018134129.2058068-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xgene-sb.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index ae592528001d..69faf9b8d460 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -8,12 +8,19 @@
  *		Quan Nguyen <qnguyen@apm.com>.
  */
 
-#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/err.h>
 #include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
+
 #include <linux/gpio/driver.h>
-#include <linux/acpi.h>
 
 #include "gpiolib-acpi.h"
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


