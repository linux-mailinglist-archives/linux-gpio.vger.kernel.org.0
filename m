Return-Path: <linux-gpio+bounces-18942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E3A8B639
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24DA33BA36F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC842451F0;
	Wed, 16 Apr 2025 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoTOPxsV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3D23E341;
	Wed, 16 Apr 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797425; cv=none; b=HBp913E+TJnNhoXxd2cDKmuYLpPnVAJtLFTTAqwB7znyEsKln9fOjncH2dixaz2BXih4j2XfONZv3XRgVO+o4afhFi2wm6ikH0wOlHWxcGj8AdEZUF5SI0fACbRZtJzrc/P+0rkX00gg+jp8Ih5+3ZRqHcEV5FhlFh3Oqd5s+Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797425; c=relaxed/simple;
	bh=myLSo+i7pDsdRtZ3N9L4LNBF6ipxBYVlAM8BWP9C4ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTTmAXuV4gNLDkhylOWVrcCcrxeu6tc516th1VWFZmEuYoAYwE76bECKSCguPWn1+HYnxZo3DwdMfycCcSw+JoL91iHFdlzHKDIHZr5ml6zQu0ZfuY8/Yui46CeVNZZ2Y93yOl1LU90roXYtRI2lInGpewYA3u7NwUw+TCRcznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoTOPxsV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744797424; x=1776333424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=myLSo+i7pDsdRtZ3N9L4LNBF6ipxBYVlAM8BWP9C4ms=;
  b=QoTOPxsVX8lx45gwkUxR4cZUxzdTMuLgyU7nEm/VvIX1nRb491O03iTy
   f3BHanA/hWTenrCyh9inc9/Qi0sQptL6pNS+snOL5XmUMPUxyRPW3vhdw
   5NrTneMQnY8NNnuStDgsHRplJenCEJn9G/syqkk3PMWuavokfabSH79i4
   FOYuG6Kf06wGGOLwKU3Uk0K5/OqLOcIavBeFoYjVWlqtQZ9eZMzL6ktN4
   4mFhH3vXRGQKWpxEk1yUZbMm+Jo96RpePt1iuuQwfI+Sg6babKOcKhRiA
   AyZUcG1FH9b5FVshhPp1d2yKnQSrZOMUMe5HciRTTjm4XogkfnB9BpMZt
   Q==;
X-CSE-ConnectionGUID: L4Ly5C8cSL2cre99EqTUvw==
X-CSE-MsgGUID: JV4GxWjrSk+78ohUgCOpww==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50144318"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="50144318"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:56:52 -0700
X-CSE-ConnectionGUID: LfddbEDkQgKBumoStebk9w==
X-CSE-MsgGUID: w0F7wiKJSK6/ZDASqRI2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="135259319"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 16 Apr 2025 02:56:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 218016D8; Wed, 16 Apr 2025 12:56:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 5/8] gpiolib: Move validate_desc() and Co upper in the code
Date: Wed, 16 Apr 2025 12:55:13 +0300
Message-ID: <20250416095645.2027695-6-andriy.shevchenko@linux.intel.com>
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

Move validate_desc() and Co upper in the code to be able to use
in the further changes.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 62 +++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4485dc8b1e42..ad2e68f66500 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -356,6 +356,37 @@ static int gpiochip_find_base_unlocked(u16 ngpio)
 	}
 }
 
+/*
+ * This descriptor validation needs to be inserted verbatim into each
+ * function taking a descriptor, so we need to use a preprocessor
+ * macro to avoid endless duplication. If the desc is NULL it is an
+ * optional GPIO and calls should just bail out.
+ */
+static int validate_desc(const struct gpio_desc *desc, const char *func)
+{
+	if (!desc)
+		return 0;
+
+	if (IS_ERR(desc)) {
+		pr_warn("%s: invalid GPIO (errorpointer: %pe)\n", func, desc);
+		return PTR_ERR(desc);
+	}
+
+	return 1;
+}
+
+#define VALIDATE_DESC(desc) do { \
+	int __valid = validate_desc(desc, __func__); \
+	if (__valid <= 0) \
+		return __valid; \
+	} while (0)
+
+#define VALIDATE_DESC_VOID(desc) do { \
+	int __valid = validate_desc(desc, __func__); \
+	if (__valid <= 0) \
+		return; \
+	} while (0)
+
 static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
@@ -2431,37 +2462,6 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	return ret;
 }
 
-/*
- * This descriptor validation needs to be inserted verbatim into each
- * function taking a descriptor, so we need to use a preprocessor
- * macro to avoid endless duplication. If the desc is NULL it is an
- * optional GPIO and calls should just bail out.
- */
-static int validate_desc(const struct gpio_desc *desc, const char *func)
-{
-	if (!desc)
-		return 0;
-
-	if (IS_ERR(desc)) {
-		pr_warn("%s: invalid GPIO (errorpointer: %pe)\n", func, desc);
-		return PTR_ERR(desc);
-	}
-
-	return 1;
-}
-
-#define VALIDATE_DESC(desc) do { \
-	int __valid = validate_desc(desc, __func__); \
-	if (__valid <= 0) \
-		return __valid; \
-	} while (0)
-
-#define VALIDATE_DESC_VOID(desc) do { \
-	int __valid = validate_desc(desc, __func__); \
-	if (__valid <= 0) \
-		return; \
-	} while (0)
-
 int gpiod_request(struct gpio_desc *desc, const char *label)
 {
 	int ret = -EPROBE_DEFER;
-- 
2.47.2


