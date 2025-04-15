Return-Path: <linux-gpio+bounces-18844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BAEA89B93
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2578D4405BB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8B228F50C;
	Tue, 15 Apr 2025 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZtFSnDj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5328E606;
	Tue, 15 Apr 2025 11:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715557; cv=none; b=s9jRjrw4afm8eYlf/h41dYy0YnNYslZzJnxEArV3kmH0hi9XPnn9+sYSwkf55lpUjpJQKY6c9xjfegfPaSp5FS+eD9RVvZqNyyA3tbuFJgTWEAFdjCwbcPFNsY51tI2IgmcMtJEIRdej8yLe/E/JynaGd8UsAm7/U3+aCUsLhyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715557; c=relaxed/simple;
	bh=20S7oTr7Bre2LiZQqbYrm2hkVz72OdJ/TST6h/CzgZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLHs7Zw1baJrG6aqDJom77zFuubRK6lVN8MXrJ1NPdV77vFMZairVM7w5W9ZpNU5QR2U4H/FiPIb00Z8B4ZapP3Xe7gab/Hnh5yEOJZJ+yfqVA1qaV3COALkjZZRCOgG4Jc64VGP5xhVq3OEZFjfmKzQEdxMv07k14R5cRi5UAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZtFSnDj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744715556; x=1776251556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=20S7oTr7Bre2LiZQqbYrm2hkVz72OdJ/TST6h/CzgZQ=;
  b=JZtFSnDj3+jxse7gLHKwYaTzUqKfrco6iS+E+hcNBf323xomuBpUpnKa
   KE95g1HaozvJJM4glb7G7+MMuZSKOMxi/M2qbgbQSL08prYEIA68OqsPV
   IUMz4pMEeU42+fLimd8jhyJRq8SUJEt5b76zzISL4TBJWkTq+jGB0AO25
   7EmsUOYslPK2CR2+/eQwZfTb1kjJdaDIiZy9wnSyYIu4d5jhzJm0PA/d8
   b1OFjIUatFoEZFoVRwwrwNc280dSs2zgOgrF1PP0SGv2180d4rXJRJyKw
   JXimrrVshuzoIEXSDV45j4/WZxrV+uMsDstB9MwSAOUjhxWYxjkhsOdzy
   Q==;
X-CSE-ConnectionGUID: 6QqG0jq8QLKNafuDQadKcg==
X-CSE-MsgGUID: KUDlKXvjTc+ZZRDnOfPQYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57601853"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57601853"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 04:11:29 -0700
X-CSE-ConnectionGUID: lkDKgJLYQmiJiMaRa/O0dA==
X-CSE-MsgGUID: 8ZXmUTLVTz+CPlmx6uHmSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161071610"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 15 Apr 2025 04:11:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C39ADAF1; Tue, 15 Apr 2025 14:11:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/7] gpiolib: Move validate_desc() and Co upper in the code
Date: Tue, 15 Apr 2025 14:10:02 +0300
Message-ID: <20250415111124.1539366-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move validate_desc() and Co upper in the code to be able to use
in the further changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 62 +++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8ea5ddf4704d..1fdf4d2ceb36 100644
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
@@ -2433,37 +2464,6 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
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


