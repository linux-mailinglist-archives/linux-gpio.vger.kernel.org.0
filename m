Return-Path: <linux-gpio+bounces-30481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95051D185D5
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 12:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 896AC300FA01
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B3D387363;
	Tue, 13 Jan 2026 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZkwnRQq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B387F3815E1;
	Tue, 13 Jan 2026 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302722; cv=none; b=qoKFtMd+7FluVQb1lmxWCTGGElDbMg42T4SVhcvByAA3/bRaoJ2rVlr1dKsRrZne335BG7YaYO9538OX669v7sTfFTjhgZW3ZxBRbtPbD4EiLmtGS14V+kvhJXXgGh8m4Iuo31fAdIL7KS4TDQIyxrAqjWTUq16dq0yI5q7/OR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302722; c=relaxed/simple;
	bh=uYNUANscJVovmvcNvkxRxfD+1UaN1bScHH+xIH19yk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlRSWjsj9k+A5EQx0JY0gnwkun2dbWmKXMWmSvT+RKDjEqt9kMD2PujuqjejPcDu8nB81xJGIAQZp15LGHVy/TM0fGR4Xp0YOjqWjvOj1naXSAnkZ+3JT5iZ2rcuHw27FNQrYU+UdfNv318PedW8Fy9khd0Ct8X9shjFb7ONNGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZkwnRQq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768302721; x=1799838721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uYNUANscJVovmvcNvkxRxfD+1UaN1bScHH+xIH19yk0=;
  b=fZkwnRQqkJdCv6xUGiLwFLKmrNlM4j6mkGMyTacAzmASH6TIKFTfoZPt
   KohSxxJlY48PbfJcR8PJ5kB2rymlpD+ItFi5W/dFP4+aVItqPMYouzXqF
   UWBHcEu3aJoltuglCMrBV+/jOFN4wegG7v8JaootkEO0A0Sp48TwF1WIR
   PrmzIuWCxf1xWxPQX93cvNR4GIxaSrn0Gqy3lalAaoThyEuiDXY2E07UL
   uGJOfNk0eDTyCWyQCDwDNvOgRTCW6SRG8RCzXWmbdoJbOvY5MKYC1BTZW
   cvmoCZgXy6fdd10wmZd1OK1R/guqqZQPGKg2SydrAPfoA6DhR+Wk8mL+c
   g==;
X-CSE-ConnectionGUID: DhaDMddkTDuXY13XH/ye1A==
X-CSE-MsgGUID: VBwt7T8URber3r+THkpdVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72166541"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72166541"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:12:00 -0800
X-CSE-ConnectionGUID: N8WsbxyhTWSRv8tGvee7/g==
X-CSE-MsgGUID: 8R8mXT0mS2icVlczi4zpuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209414889"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 13 Jan 2026 03:11:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4260C9D; Tue, 13 Jan 2026 12:11:57 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v2 3/3] gpio: pca9570: use lock guards
Date: Tue, 13 Jan 2026 12:10:54 +0100
Message-ID: <20260113111156.188051-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113111156.188051-1-andriy.shevchenko@linux.intel.com>
References: <20260113111156.188051-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shrink the code by a couple lines and improve lock management by using
lock guards from cleanup.h.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca9570.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index a41837f1201b..4a368803fb03 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/device/devres.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
@@ -98,7 +99,7 @@ static int pca9570_set(struct gpio_chip *chip, unsigned int offset, int value)
 	u8 buffer;
 	int ret;
 
-	mutex_lock(&gpio->lock);
+	guard(mutex)(&gpio->lock);
 
 	buffer = gpio->out;
 	if (value)
@@ -108,13 +109,11 @@ static int pca9570_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 	ret = pca9570_write(gpio, buffer);
 	if (ret)
-		goto out;
+		return ret;
 
 	gpio->out = buffer;
 
-out:
-	mutex_unlock(&gpio->lock);
-	return ret;
+	return 0;
 }
 
 static int pca9570_probe(struct i2c_client *client)
-- 
2.50.1


