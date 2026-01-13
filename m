Return-Path: <linux-gpio+bounces-30471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE597D17DF4
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F3A930042BE
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF6C38A2B7;
	Tue, 13 Jan 2026 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nh8wtQPT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18D6343D7B;
	Tue, 13 Jan 2026 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298966; cv=none; b=rLpAMgeJzUh0SobkOFQrjcCU5Bk0pglN0p6gGa/qMjxdvDt1STZliaFtkyakEk1huGASliCV0XasmRI7dbj/S6oHiFwzDeKnKZjDZh7suT9M7X2RW0LlZlxGBbbYKBY+5SNTY3QSg6tu2QTxq9+m+TvAfLEK3XPGJeRW31lBrTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298966; c=relaxed/simple;
	bh=SmJ23mB/4yuvurJ6cS92alljA17FrHV5dyLpp9Mvizc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiZF1VWX7sD6lormbfUMY2ByEf7N2PhewP0xjc9Jnuo6l9r3F5ttl+mCG8U6MWXflxP/R9Ugjrt9lJ5kzxgCDBGvyV9CFPiO6eq8g1Luzs9E4mpAK22ju2VAMTeD4LYNvoWeEDDiQ8p0EUXWMypWw4UGjwqrvXl7xHh1ELc+7/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nh8wtQPT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768298965; x=1799834965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SmJ23mB/4yuvurJ6cS92alljA17FrHV5dyLpp9Mvizc=;
  b=Nh8wtQPTwGxaa41grjp6iVCW33KBj4GF5dFhnXmqJNli8e4pQxKqGGhG
   57I2kDFQv6wOy3h9UfuzhWTDZWZCzXIsbRO+Wvsj1YIBd7oJKPze8uzBF
   EedmRKdTCclqGn1Gl98mYCgKCS2UaIE6ThIbVroeRm3b2AeNP9KPYoQO4
   GxVOiczUQp01T+bvzpD00K2iddTRHA0hDrAZJcHNJ7JDBYCFPREC8FjHU
   Hd8aqV8kJoMSTl1f60UzIS2qtO6pq4/HnM7KHNRhVuyhY1keWw01dRFog
   T4Wz58XeOUe8lihY4pFcHf/84/2XkBfVv4zBFI83CsvdFRizPl0IlNVhx
   w==;
X-CSE-ConnectionGUID: X9/HHThbRq+FQa0ecgV8xQ==
X-CSE-MsgGUID: lhLeDYZFQWalurOWpC6BNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69637703"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69637703"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:09:19 -0800
X-CSE-ConnectionGUID: eAw7u4JAR0anW9Sdtu0JiQ==
X-CSE-MsgGUID: 2EcZedcCTnus3SWcZBBo5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203555915"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 02:09:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3B16D9D; Tue, 13 Jan 2026 11:09:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v1 3/3] gpio: pca9570: use lock guards
Date: Tue, 13 Jan 2026 11:08:06 +0100
Message-ID: <20260113100913.136777-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com>
References: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shrink the code by a couple lines and improve lock management by using
lock guards from cleanup.h.

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


