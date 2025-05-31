Return-Path: <linux-gpio+bounces-20834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EA3AC9C98
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 21:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBCA617AF22
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 19:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FFF1A76AE;
	Sat, 31 May 2025 19:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bq5dDAOe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D27419E83E;
	Sat, 31 May 2025 19:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748721492; cv=none; b=LH7jmlXHdrW7tvGkwvWDWcjPiRwnacleBCBk+RpFzuo3d9o5S32y6NWNqKiibn/3/4aroD0V1Hf29C9JbE89UI1n3DS8FpyJlXTVgGbvNdk1HRJCzVCjf3eBVbUjS2pL3A5yhUfIrnQ/FwnjGRxaxFcohkySmYkResET48EMtLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748721492; c=relaxed/simple;
	bh=I2ykK6/fVWYlkcwwhMN9x06b23bNUPsw8B/ZEGUGQvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQGRDYvLGzYA3ONc6yh/xuTbGtOmt8Mf2DueT8jV+uFl0NQRokIqBNaSHO/wxAl1hsr9mSB7YZ5V/sf1EDsHafptAuwYKkqoDDOGrKk6Vrz4eA1Fz2f9Uhx52Xc1vPcDY2poydd11NRu3ArGPa4CSs/aHXW/tPwGdb4JwSazesA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bq5dDAOe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748721490; x=1780257490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I2ykK6/fVWYlkcwwhMN9x06b23bNUPsw8B/ZEGUGQvE=;
  b=Bq5dDAOe+suYvNV/52EfDhuM0z6kPDIr7sCaHTOesoeoTveBvAkJgfy9
   PhnR2Fj9n7AH+Pe8Bk9izXpMuE70JiRdK5LjTba/+aQy8l3bdEImwKD0G
   21YbmKiaBogSj90xwWRth0JtVyHpVSF1CTvIwuBG57XlyR9J5E7RIUmlG
   qFpuW7CYp1xwKR5L/9Xzz//YOSZi7Yan252vPUDYbzis9hUZe9taY0mW6
   XYKaLufdQoIYmHXgWHlEzhjcEkbirWb0wHlWr4j6JOQ9iiJglu6i/fnOx
   oreMIAE7lSODLL4D7iaft9qz3nd8BQvUQLBOmItInJKFoQr98pxr8KMey
   A==;
X-CSE-ConnectionGUID: Np1ER7NkR/KeXinfw5QjEQ==
X-CSE-MsgGUID: J9b+RXNOQkaHMf2l1QivbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50886638"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50886638"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 12:58:07 -0700
X-CSE-ConnectionGUID: k/svVf2qS+qX9b2GOH7X3g==
X-CSE-MsgGUID: lGiiSOdSR8W2pasrVpvLdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="149455596"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 31 May 2025 12:58:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E8AE511C; Sat, 31 May 2025 22:58:04 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/2] gpio: Remove unused 'struct gpio' definition
Date: Sat, 31 May 2025 22:55:43 +0300
Message-ID: <20250531195801.3632110-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com>
References: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no user for the legacy 'struct gpio', remove it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index c1ec62c11ed3..1893e5d4c0c9 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -21,18 +21,6 @@ struct device;
 #define GPIOF_OUT_INIT_LOW	((0 << 0) | (0 << 1))
 #define GPIOF_OUT_INIT_HIGH	((0 << 0) | (1 << 1))
 
-/**
- * struct gpio - a structure describing a GPIO with configuration
- * @gpio:	the GPIO number
- * @flags:	GPIO configuration as specified by GPIOF_*
- * @label:	a literal description string of this GPIO
- */
-struct gpio {
-	unsigned	gpio;
-	unsigned long	flags;
-	const char	*label;
-};
-
 #ifdef CONFIG_GPIOLIB
 
 #include <linux/gpio/consumer.h>
-- 
2.47.2


